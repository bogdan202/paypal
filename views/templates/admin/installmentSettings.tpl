{*
* 2007-2018 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author 2007-2019 PayPal
 *  @author 2007-2013 PrestaShop SA <contact@prestashop.com>
 *  @author 2014-2019 202 ecommerce <tech@202-ecommerce.com>
*  @copyright PayPal
*  @license	http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*
*}

<div paypal-installment-settings>

    <form
            id="pp_config_installment"
            method="post"
            action="{$smarty.server.REQUEST_URI|escape:'htmlall':'UTF-8'}">

        <div class="paypal-form-group pp__flex-align-center pp_mb-20">
            <div class="label">
                {l s='Enable the display of 4x banners' mod='paypal'}
            </div>

            <div class="configuration">
                <div class="pp__switch-field">
                    <input
                            class="pp__switch-input"
                            type="radio"
                            id="PAYPAL_ENABLE_INSTALLMENT_on"
                            name="PAYPAL_ENABLE_INSTALLMENT"
                            value="1"
                            {if isset($PAYPAL_ENABLE_INSTALLMENT) && $PAYPAL_ENABLE_INSTALLMENT == '1'}checked{/if}/>
                    <label for="PAYPAL_ENABLE_INSTALLMENT_on" class="pp__switch-label on">Yes</label>
                    <input
                            class="pp__switch-input"
                            type="radio"
                            id="PAYPAL_ENABLE_INSTALLMENT_off"
                            name="PAYPAL_ENABLE_INSTALLMENT"
                            value="0"
                            {if isset($PAYPAL_ENABLE_INSTALLMENT) && $PAYPAL_ENABLE_INSTALLMENT == '0'}checked{/if}/>
                    <label for="PAYPAL_ENABLE_INSTALLMENT_off" class="pp__switch-label off">No</label>
                </div>
            </div>
        </div>

        <div class="paypal-form-group pp__flex-align-center pp_mb-20">
            <div class="label">
                {l s='Client ID' mod='paypal'}
            </div>

            <div class="configuration">
                <div class="bootstrap" style="width: 40%">
                    <input
                            type="text"
                            name="PAYPAL_CLIENT_ID_INSTALLMENT"
                            {if isset($PAYPAL_CLIENT_ID_INSTALLMENT)}value="{$PAYPAL_CLIENT_ID_INSTALLMENT}"{/if}>
                </div>
            </div>
        </div>

        <div class="paypal-form-group pp_mb-20">
            <div class="label"></div>

            <div class="configuration">
                <div installment-page-displaying-setting-container>
                    <div class="pp_mb-10">
                        <input
                                type="checkbox"
                                id="PAYPAL_INSTALLMENT_HOME_PAGE"
                                name="PAYPAL_INSTALLMENT_HOME_PAGE"
                                value="1"
                                {if isset($PAYPAL_INSTALLMENT_HOME_PAGE) && $PAYPAL_INSTALLMENT_HOME_PAGE}checked{/if}
                        >
                        <label for="PAYPAL_INSTALLMENT_HOME_PAGE">
                            {l s='Home Page' mod='paypal'}
                        </label>
                    </div>

                    <div class="pp_mb-10">
                        <input
                                type="checkbox"
                                id="PAYPAL_INSTALLMENT_CATEGORY_PAGE"
                                name="PAYPAL_INSTALLMENT_CATEGORY_PAGE"
                                value="1"
                                {if isset($PAYPAL_INSTALLMENT_CATEGORY_PAGE) && $PAYPAL_INSTALLMENT_CATEGORY_PAGE}checked{/if}
                        >
                        <label for="PAYPAL_INSTALLMENT_CATEGORY_PAGE">
                            {l s='Category Page' mod='paypal'}
                        </label>
                    </div>

                    <div class="pp_mb-10">
                        <input
                                type="checkbox"
                                id="PAYPAL_INSTALLMENT_PRODUCT_PAGE"
                                name="PAYPAL_INSTALLMENT_PRODUCT_PAGE"
                                value="1"
                                {if isset($PAYPAL_INSTALLMENT_PRODUCT_PAGE) && $PAYPAL_INSTALLMENT_PRODUCT_PAGE}checked{/if}
                        >
                        <label for="PAYPAL_INSTALLMENT_PRODUCT_PAGE">
                            {l s='Product Page' mod='paypal'}
                        </label>
                    </div>

                    <div>
                        <input
                                type="checkbox"
                                id="PAYPAL_INSTALLMENT_CART_PAGE"
                                name="PAYPAL_INSTALLMENT_CART_PAGE"
                                value="1"
                                {if isset($PAYPAL_INSTALLMENT_CART_PAGE) && $PAYPAL_INSTALLMENT_CART_PAGE}checked{/if}
                        >
                        <label for="PAYPAL_INSTALLMENT_CART_PAGE">
                            {l s='Cart/Checkout' mod='paypal'}
                        </label>
                    </div>

                </div>
            </div>
        </div>

        <div class="paypal-form-group pp__flex-align-center pp_mb-20">
            <div class="label">
                {l s='Advanced options' mod='paypal'}
            </div>

            <div class="configuration">
                <div class="pp__switch-field">
                    <input
                            class="pp__switch-input"
                            type="radio"
                            id="PAYPAL_ADVANCED_OPTIONS_INSTALLMENT_on"
                            name="PAYPAL_ADVANCED_OPTIONS_INSTALLMENT"
                            value="1"
                            {if isset($PAYPAL_ADVANCED_OPTIONS_INSTALLMENT) && $PAYPAL_ADVANCED_OPTIONS_INSTALLMENT == '1'}checked{/if}/>
                    <label for="PAYPAL_ADVANCED_OPTIONS_INSTALLMENT_on" class="pp__switch-label on">Yes</label>
                    <input
                            class="pp__switch-input"
                            type="radio"
                            id="PAYPAL_ADVANCED_OPTIONS_INSTALLMENT_off"
                            name="PAYPAL_ADVANCED_OPTIONS_INSTALLMENT"
                            value="0"
                            {if isset($PAYPAL_ADVANCED_OPTIONS_INSTALLMENT) && $PAYPAL_ADVANCED_OPTIONS_INSTALLMENT == '0'}checked{/if}/>
                    <label for="PAYPAL_ADVANCED_OPTIONS_INSTALLMENT_off" class="pp__switch-label off">No</label>
                </div>
            </div>
        </div>

        <div class="paypal-form-group pp__flex-align-center pp_mb-20">
            <div class="label">
                {l s='The styles for the home page and category pages' mod='paypal'}
            </div>

            <div class="configuration">
                <div class="installment-preview-wrap">
                    <div class="bootstrap preview-setting">
                        <select name="PAYPAL_INSTALLMENT_COLOR">
                            {if isset($installmentColorOptions) && false === empty($installmentColorOptions)}
                                {foreach from=$installmentColorOptions key=value item=title}
                                    <option
                                            value="{$value|escape:'htmlall':'utf8'}"
                                            {if isset($PAYPAL_INSTALLMENT_COLOR) && $PAYPAL_INSTALLMENT_COLOR == $value}selected{/if}>

                                        {$title|escape:'htmlall':'utf8'}
                                    </option>
                                {/foreach}
                            {/if}
                        </select>
                    </div>

                    <div class="preview-container">
                        {if isset($paypalInstallmentBanner)}
                            {$paypalInstallmentBanner nofilter} {* the var contain a html *}
                        {/if}
                    </div>
                </div>


            </div>
        </div>

        <div class="pp-panel-footer bootstrap">
            <button
                    type="submit"
                    class="btn btn-default pull-right"
                    name="installmentSettingForm">
                <i class="process-icon-save"></i>
                {l s='Save' mod='paypal'}
            </button>

        </div>
    </form>

</div>
