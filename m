Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp110133njb;
        Fri, 6 Sep 2024 07:50:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUuD6m+Sq5C2IQRY0rBRl25X4lHgqXDK3Ax1Pdxz6iNkCgXt8sDr8RIjmo177VKg+4tGaxCM5HoM71Ndg==@linaro.org
X-Google-Smtp-Source: AGHT+IEvZYXfzNTT/2R3ZnvbHhXntzaIkBVcocxD3pLuTSbFu4xQsKVimrh9BfVZ+GR9sXnoiE1H
X-Received: by 2002:a05:6808:1289:b0:3d9:384a:3674 with SMTP id 5614622812f47-3e02a0248a6mr3985434b6e.33.1725634209447;
        Fri, 06 Sep 2024 07:50:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725634209; cv=none;
        d=google.com; s=arc-20240605;
        b=ceSF6nP2j2SAaRbgLKYN8chKeM1kNjU9onj9BS8ssiM80jl5h7T9Qa43omPPp/S6r+
         /2cKTyUjd7xj0oyZhCp1p5OtwUJn80D4rPl8VCTeQd1m5fb7RF+9/CwqFMKUpgkeMrbv
         CzcOPuVtElwj1KrnFqyAT1FzsaPjN/x9idAGNtKrnDz8qFXjMiUFZ0yUR9Xdbvovvs6S
         Ne4Arl1bBNE2tAyxuhxcGjeTFbugV2sHHxWf8y3HBHjwMU9T+CYaRw4DGeVdrg0dMGzP
         SOK/v362slgqyFvqAw0+2Q+UBN1sO0yKDxM8o4vYSu0HabLADY+1xbPJe5RmTQS8Bqza
         zDlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=0Vjhb56ul87MFDeIt0IE75HByya3hIQU47rB+K0pE14=;
        fh=iKuGYGsHonEYY6pySmYf5t+N+RPocllx/rBNeW9JfmA=;
        b=HiejlT5pXiy/2Qnbg6h+zfWNaMTiSrVG7afzTJ3hOB5mjjUU712q8Z+xOSAU5VYveQ
         rSDvofLmfjouUwi7gjI4ngS5jYqBWYNM+Kb7VlWYDnBrTGsV/3y2h8TZp2kWVwG8qclb
         opM4tZCzh55KyITzXRxjG+hKppjLyL3roiP9Ryt6lRKZy9ASvsm+3OMHA/sYenlQC/Gl
         mGKnWKOsbFXC1iZ60flD2JLSAVBjCjMnEdk1JUatuNNrYIC9LV2EGOeD3imDf82mlZ0u
         B2wt3A6EuOtO4mbguIMIkXenNU9XdPzyj7/fea7FO0XpfYTf0vt9mYHcFCRv9dhG4Fn+
         SK2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45809c8fa9asi27640661cf.472.2024.09.06.07.50.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Sep 2024 07:50:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1smaHZ-0002wc-MA; Fri, 06 Sep 2024 10:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=ncBN=QE=kaod.org=clg@ozlabs.org>)
 id 1smaHX-0002vL-SZ; Fri, 06 Sep 2024 10:49:51 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=ncBN=QE=kaod.org=clg@ozlabs.org>)
 id 1smaHU-0000lm-Uc; Fri, 06 Sep 2024 10:49:51 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4X0fJl6RCMz4wy9;
 Sat,  7 Sep 2024 00:49:43 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0fJJ6TD7z4wnw;
 Sat,  7 Sep 2024 00:49:20 +1000 (AEST)
Message-ID: <36c9b2b5-5a19-4713-8e27-112ae4b83bc4@kaod.org>
Date: Fri, 6 Sep 2024 16:49:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] aspeed: Add support for IBM Bonnell
To: Guenter Roeck <linux@roeck-us.net>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
References: <20240906123505.3818154-1-linux@roeck-us.net>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240906123505.3818154-1-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=ncBN=QE=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GkIDkP3JZ3El

Joel,

Would have access to a Bonnell BMC ? To get the HW strapping
register values.

On 9/6/24 14:35, Guenter Roeck wrote:
> Introduce support for the IBM Bonnell BMC.
> 
> Use Rainier machine information for HW strapping and other machine details
> since the actual hardware configuration is unknown. I2C device
> instantiation is based on the devicetree file in the upstream Linux kernel.
> 
> Major difference to Rainier is that the Bonnell devicetree file
> instantiates a TPM. It is therefore possible to test TPM functionality
> without having to instantiate the TPM manually from the Linux command
> line.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   hw/arm/aspeed.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 87 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index fd5603f7aa..4f833c5708 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -865,6 +865,70 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>       create_pca9552(soc, 15, 0x60);
>   }
>   
> +static void bonnell_bmc_i2c_init(AspeedMachineState *bmc)
> +{
> +    AspeedSoCState *soc = bmc->soc;
> +    I2CBus *bus;
> +
> +    bus = aspeed_i2c_get_bus(&soc->i2c, 0);
> +
> +    at24c_eeprom_init(bus, 0x51, 8 * KiB);      /* atmel,24c64 */
> +    /* tca9554@11:20 */
> +    i2c_slave_create_simple(bus, "pca9554", 0x20);


The other machine tend to simply do :

   i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 0), "pca9554", 0x20);

But that's fine.

> +
> +    /* ucd90160@2:64 */
> +
> +    /* fsg032@3:5a */
> +    /* fsg032@3:5b */
> +
> +    bus = aspeed_i2c_get_bus(&soc->i2c, 7);
> +
> +    /* si7020@7:40 */
> +
> +    /* Bonnell expects a TMP275 but a TMP105 is compatible */
> +    i2c_slave_create_simple(bus, TYPE_TMP105, 0x48);
> +    at24c_eeprom_init(bus, 0x50, 8 * KiB);      /* atmel,24c64 */
> +    at24c_eeprom_init(bus, 0x51, 8 * KiB);      /* atmel,24c64 */
> +    i2c_slave_create_simple(bus, "max31785", 0x52);
> +
> +    /* pca9551; assume/hope pca9552 is compatible enough */
> +    create_pca9552(soc, 7, 0x60);
> +
> +    /* ibm,op-panel@7:62 */
> +    /* dps310@7:76 */
> +
> +    bus = aspeed_i2c_get_bus(&soc->i2c, 8);
> +
> +    /* rx8900@8:32 */
> +
> +    /* Bonnell expects a TMP275 but a TMP105 is compatible */
> +    i2c_slave_create_simple(bus, TYPE_TMP105, 0x48);
> +    at24c_eeprom_init(bus, 0x51, 16 * KiB);      /* atmel,24c128 */
> +
> +    /* pca9551@8:60 */
> +    create_pca9552(soc, 8, 0x60);
> +
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", 0x4c);
> +
> +    bus = aspeed_i2c_get_bus(&soc->i2c, 11);
> +
> +    /* tca9554@11:20 */
> +    i2c_slave_create_simple(bus, "pca9554", 0x20);
> +    i2c_slave_create_simple(bus, "tmp423", 0x4c);
> +    /* pca9849@11:75 */
> +    i2c_slave_create_simple(bus, "pca9546", 0x75);
> +
> +    /* npct75x@12:2e (tpm) */
> +
> +    /* atmel,24c64 */
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 12), 0x50, 8 * KiB);
> +
> +    /* atmel,24c64 */
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 13), 0x50, 8 * KiB);
> +    /* pca9551@13:60 */
> +    create_pca9552(soc, 13, 0x60);
> +}
> +
>   static void get_pca9548_channels(I2CBus *bus, uint8_t mux_addr,
>                                    I2CBus **channels)
>   {
> @@ -1488,6 +1552,25 @@ static void aspeed_machine_rainier_class_init(ObjectClass *oc, void *data)
>       aspeed_machine_ast2600_class_emmc_init(oc);
>   };
>   
> +static void aspeed_machine_bonnell_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
> +
> +    mc->desc       = "IBM Bonnell BMC (Cortex-A7)";
> +    amc->soc_name  = "ast2600-a3";
> +    amc->hw_strap1 = RAINIER_BMC_HW_STRAP1;
> +    amc->hw_strap2 = RAINIER_BMC_HW_STRAP2;
> +    amc->fmc_model = "mx66l1g45g";
> +    amc->spi_model = "mx66l1g45g";
> +    amc->num_cs    = 2;
> +    amc->macs_mask  = ASPEED_MAC2_ON | ASPEED_MAC3_ON;
> +    amc->i2c_init  = bonnell_bmc_i2c_init;
> +    mc->default_ram_size = 1 * GiB;
> +    aspeed_machine_class_init_cpus_defaults(mc);
> +    aspeed_machine_ast2600_class_emmc_init(oc);
> +};
> +
>   #define FUJI_BMC_RAM_SIZE ASPEED_RAM_SIZE(2 * GiB)
>   
>   static void aspeed_machine_fuji_class_init(ObjectClass *oc, void *data)
> @@ -1776,6 +1859,10 @@ static const TypeInfo aspeed_machine_types[] = {
>           .name          = MACHINE_TYPE_NAME("rainier-bmc"),
>           .parent        = TYPE_ASPEED_MACHINE,
>           .class_init    = aspeed_machine_rainier_class_init,
> +    }, {
> +        .name          = MACHINE_TYPE_NAME("bonnell-bmc"),
> +        .parent        = TYPE_ASPEED_MACHINE,
> +        .class_init    = aspeed_machine_bonnell_class_init,
>       }, {
>           .name          = MACHINE_TYPE_NAME("fuji-bmc"),
>           .parent        = TYPE_ASPEED_MACHINE,


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


