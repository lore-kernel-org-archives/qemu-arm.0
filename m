Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp121825lfb;
        Sun, 3 May 2020 23:44:35 -0700 (PDT)
X-Google-Smtp-Source: APiQypIEo5c/WvYz9jId2Z/W9ME2r3nflU2LVxxVHLcSjKdf6Hl/a9O0veFRiUbbGXnZapuI1Af6
X-Received: by 2002:a0c:b659:: with SMTP id q25mr15167929qvf.48.1588574674875;
        Sun, 03 May 2020 23:44:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588574674; cv=none;
        d=google.com; s=arc-20160816;
        b=nQXTIELnvwuUmyN0RhmnwzphEE3X1skQd3pQTQqLQnd87hJHWe/vGWmfr1D50NfHz2
         lF299Vvb5iDOgka9qwjTRn63MrXpSQmikC5+mfrpz6UFP4jw05hwFcKSPf6uKsV6dtsK
         m2unf+7eRJo/S+qhjUt/TyG6MKEEMrPpWhUg5R8OLBuAcg3KDv7GK0Cz5S42oLVJEGtY
         USawKsN3V3C00wPSQImpx15E6FYNPG82cEJkLTCV5F3+8GuvSDxFHeGobZiw1xFWyAq/
         Scyx2GztFZV2+NJ366bV//ftDCXRq/sv+gxAotdgGgLT6iqnKUbe2sDL7KdUeH4LSlAW
         qQGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=/cwpfd8zyHZcMPvs4Ynw/7h6Sq5SE5QspQK9uGdVS4o=;
        b=ItajIgxji3YKOgP7HjCpCxVcBoPjYNAvqUoT9YSgaB+WcTGwpSwqRjAiH+jFV77r7n
         SrcsmQqbo0GxP8gqlS438pRhmYffKMXr+yvajnkeH2b5vV5r21Fqp3KPYLUVddBMql+m
         nVZQrNRnTsq63BX3wsZuFEX+9Az+xcW6oO0l746V4ZS+iQv0qW3azN2iTaA742LKPtRf
         bkaQ7G3uk+UYwN7W4gbBinPH04JmNlsNJRL7iB1EyyxLtkwxCQCQu4roXNtO23+EOHLq
         tOTUSE0fNegUu1M+gNqzADcGwHwTeIO0zAg7q879PFuYYKCffpQ1xyuoyDgU2QRq2Tic
         X3/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id p52si5889246qtj.345.2020.05.03.23.44.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 May 2020 23:44:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVUqA-0001bq-Ao
	for alex.bennee@linaro.org; Mon, 04 May 2020 02:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jVUq3-0001bS-5l
 for qemu-arm@nongnu.org; Mon, 04 May 2020 02:44:27 -0400
Received: from 5.mo3.mail-out.ovh.net ([87.98.178.36]:47044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jVUpy-0007RF-JV
 for qemu-arm@nongnu.org; Mon, 04 May 2020 02:44:26 -0400
Received: from player690.ha.ovh.net (unknown [10.110.115.173])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 5563B24D128
 for <qemu-arm@nongnu.org>; Mon,  4 May 2020 08:44:11 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player690.ha.ovh.net (Postfix) with ESMTPSA id A629011DC9F5C;
 Mon,  4 May 2020 06:44:02 +0000 (UTC)
Subject: Re: [PATCH] aspeed: Add support for the sonorapass-bmc board
To: Patrick Williams <patrick@stwcx.xyz>
References: <20200501113704.2240698-1-patrick@stwcx.xyz>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <84b9c069-ecf2-eb36-0ca4-7f5ccbf9619d@kaod.org>
Date: Mon, 4 May 2020 08:43:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200501113704.2240698-1-patrick@stwcx.xyz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13383009243117882176
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -83
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrjeefgddutdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdludejmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkefhtedufeffvedvleejgeeghedvgeeuieeufeejueeltddugeduhedvveelgfehnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheiledtrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=87.98.178.36; envelope-from=clg@kaod.org;
 helo=5.mo3.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 02:44:11
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Amithash Prasad <amithash@fb.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KFylFx7ck3tl

On 5/1/20 1:37 PM, Patrick Williams wrote:
> Sonora Pass is a 2 socket x86 motherboard designed by Facebook
> and supported by OpenBMC.  Strapping configuration was obtained
> from hardware and i2c configuration is based on dts found at:
> 
> https://github.com/facebook/openbmc-linux/blob/1633c87b8ba7c162095787c988979b748ba65dc8/arch/arm/boot/dts/aspeed-bmc-facebook-sonorapass.dts
> 
> Booted a test image of http://github.com/facebook/openbmc to login
> prompt.
> 
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>

With the fixed // comments,

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  hw/arm/aspeed.c | 76 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index a6a2102a93..09b3277d56 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -84,6 +84,21 @@ struct AspeedBoardState {
>          SCU_AST2500_HW_STRAP_ACPI_ENABLE |                              \
>          SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
>  
> +/* Sonorapass hardware value: 0xF100D216 */
> +#define SONORAPASS_BMC_HW_STRAP1 (                                      \
> +        SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     \
> +        SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                        \
> +        SCU_AST2500_HW_STRAP_UART_DEBUG |                               \
> +        SCU_AST2500_HW_STRAP_RESERVED28 |                               \
> +        SCU_AST2500_HW_STRAP_DDR4_ENABLE |                              \
> +        SCU_HW_STRAP_VGA_CLASS_CODE |                                   \
> +        SCU_HW_STRAP_LPC_RESET_PIN |                                    \
> +        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER) |                \
> +        SCU_AST2500_HW_STRAP_SET_AXI_AHB_RATIO(AXI_AHB_RATIO_2_1) |     \
> +        SCU_HW_STRAP_VGA_BIOS_ROM |                                     \
> +        SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       \
> +        SCU_AST2500_HW_STRAP_RESERVED1)
> +
>  /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) */
>  #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
>  
> @@ -372,6 +387,48 @@ static void swift_bmc_i2c_init(AspeedBoardState *bmc)
>      i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 12), "tmp105", 0x4a);
>  }
>  
> +static void sonorapass_bmc_i2c_init(AspeedBoardState *bmc)
> +{
> +    AspeedSoCState *soc = &bmc->soc;
> +
> +    // bus 2 :
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 2), "tmp105", 0x48);
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 2), "tmp105", 0x49);
> +    // bus 2 : pca9546 @ 0x73
> +
> +    // bus 3 : pca9548 @ 0x70
> +
> +    // bus 4 :
> +    uint8_t *eeprom4_54 = g_malloc0( 8 * 1024 );
> +    smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), 0x54,
> +                          eeprom4_54);
> +    /* PCA9539 @ 0x76, but PCA9552 is compatible */
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "pca9552", 0x76);
> +    /* PCA9539 @ 0x77, but PCA9552 is compatible */
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "pca9552", 0x77);
> +
> +    // bus 6 :
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 6), "tmp105", 0x48);
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 6), "tmp105", 0x49);
> +    // bus 6 : pca9546 @ 0x73
> +
> +    // bus 8 :
> +    uint8_t *eeprom8_56 = g_malloc0( 8 * 1024 );
> +    smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 8), 0x56,
> +                          eeprom8_56);
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 8), "pca9552", 0x60);
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 8), "pca9552", 0x61);
> +    // bus 8 : adc128d818 @ 0x1d
> +    // bus 8 : adc128d818 @ 0x1f
> +
> +    // bus 13 : pca9548 @ 0x71
> +    //      - channel 3:
> +    //          - tmm421 @ 0x4c
> +    //          - tmp421 @ 0x4e
> +    //          - tmp421 @ 0x4f
> +
> +}
> +
>  static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
>  {
>      AspeedSoCState *soc = &bmc->soc;
> @@ -499,6 +556,21 @@ static void aspeed_machine_swift_class_init(ObjectClass *oc, void *data)
>      mc->default_ram_size       = 512 * MiB;
>  };
>  
> +static void aspeed_machine_sonorapass_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
> +
> +    mc->desc       = "OpenPOWER SonoraPass BMC (ARM1176)";
> +    amc->soc_name  = "ast2500-a1";
> +    amc->hw_strap1 = SONORAPASS_BMC_HW_STRAP1;
> +    amc->fmc_model = "mx66l1g45g";
> +    amc->spi_model = "mx66l1g45g";
> +    amc->num_cs    = 2;
> +    amc->i2c_init  = sonorapass_bmc_i2c_init;
> +    mc->default_ram_size       = 512 * MiB;
> +};
> +
>  static void aspeed_machine_witherspoon_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc = MACHINE_CLASS(oc);
> @@ -563,6 +635,10 @@ static const TypeInfo aspeed_machine_types[] = {
>          .name          = MACHINE_TYPE_NAME("swift-bmc"),
>          .parent        = TYPE_ASPEED_MACHINE,
>          .class_init    = aspeed_machine_swift_class_init,
> +    }, {
> +        .name          = MACHINE_TYPE_NAME("sonorapass-bmc"),
> +        .parent        = TYPE_ASPEED_MACHINE,
> +        .class_init    = aspeed_machine_sonorapass_class_init,
>      }, {
>          .name          = MACHINE_TYPE_NAME("witherspoon-bmc"),
>          .parent        = TYPE_ASPEED_MACHINE,
> 

