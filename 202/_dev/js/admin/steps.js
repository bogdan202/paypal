class Steps {
  constructor(selector) {
    this.$stepsContainer = $(selector);
    this.btn = '[data-btn-action]';
    this.content = '[data-step-content]';
    this.currentStepBadge = '[data-badge-current-step]';
    this.maxStepBadge = '[data-badge-max-step]';
    this.stepsProgress = '[data-steps-progress]';
    this.modalConfiguration = '[data-modal-dialog-configuration]';
    this.controller = document.location.href;
  }

  init() {
    this.registerEvents();
    this.$stepsContainer.find(this.maxStepBadge).html($(this.content).length);
  }

  registerEvents() {
    $(document).on('afterFormSaved', (e) => {
      if (e.originalEvent.detail.form.classList.contains('form-modal') == false) {
        return;
      }
      const currentStepIndex = this.getCurrentStepIndex();
      this.setAction('next');
      this.updateCurrentBadgeStep();
      this.updateStepsProgress();

      if (currentStepIndex + 1 === this.getSteps().length) {
        $(e.originalEvent.detail.form).closest('.modal').modal('hide');
      }
    });
    $(document).on('click', this.btn, (e) => {
      e.preventDefault();
      this.setAction($(e.currentTarget).data('btn-action'));
      this.updateCurrentBadgeStep();
      this.updateStepsProgress();

      if ($(e.currentTarget).attr('data-dismiss') === 'modal') {
        $(e.currentTarget).closest('.modal').modal('hide');
      }
    });
  }

  getSteps() {
    return this.$stepsContainer.find(this.content);
  }

  getCurrentStep() {
    const steps = this.getSteps();
    return steps.filter(':not(.d-none)');
  }

  getCurrentStepIndex() {
    const steps = this.getSteps();
    return steps.index(steps.filter(':not(.d-none)'));
  }

  getLastStepIndex() {
    return this.$stepsContainer.find(this.content).length - 1;
  }

  updateCurrentBadgeStep() {
    const currentStepIndex = this.getCurrentStepIndex();

    if (currentStepIndex <= this.getLastStepIndex()) {
      this.$stepsContainer.find(this.currentStepBadge).html(currentStepIndex + 1);
    }
  }

  updateStepsProgress() {
    const currentStepIndex = this.getCurrentStepIndex();
    const value = currentStepIndex * 100 / this.getLastStepIndex();

    this.$stepsContainer.find(this.stepsProgress).attr('aria-valuenow', value).css('width', `${value}%`);
  }

  setAction(action) {
    const currentStepIndex = this.getCurrentStepIndex();
    let nextStepIndex = currentStepIndex;
    if (action === 'prev') {
      nextStepIndex -= 1;
    }
    if (action === 'next') {
      nextStepIndex += 1;
    }

    this.setActiveStep(currentStepIndex, nextStepIndex);
  }

  updateButtons() {
    const $prevBtn = this.getCurrentStep().find('[data-btn-action="prev"]');
    const $nextBtn = this.getCurrentStep().find('[data-btn-action="next"]');

    if (this.getCurrentStepIndex() === 0) {
      $prevBtn.addClass('d-none');
    } else {
      $prevBtn.removeClass('d-none');
    }

    if (this.getCurrentStepIndex() === this.getLastStepIndex()) {
      $nextBtn.attr('data-dismiss', 'modal');
    } else {
      $nextBtn.removeAttr('data-dismiss');
    }
  }

  setActiveStep(currentIndex, newIndex) {
    if (newIndex + 1 > this.getSteps().length) {
      return;
    }
    if (newIndex === currentIndex) {
      return;
    }

    const direction = (newIndex > currentIndex)
      ? (start) => start <= newIndex
      : (start) => start >= newIndex;

    const index = (newIndex > currentIndex)
      ? (start) => start + 1
      : (start) => start - 1;

    while (direction(currentIndex)) {
      this.setShowStep(currentIndex);
      currentIndex = index(currentIndex);
    }

    this.updateButtons();
  }

  setShowStep(index) {
    const $tabContent = this.$stepsContainer.find(this.content);
    $tabContent.addClass('d-none').eq(index).removeClass('d-none');
  }
}

export default Steps;
