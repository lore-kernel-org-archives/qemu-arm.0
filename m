Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2832946ejy;
        Tue, 4 Jul 2023 04:19:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5akLk5XKuWFD0+ng0a+yQFqGFExd0i9wV36EsS/nAhZKu1GE2fKvpzfGdpHIB1aF8w3U6q
X-Received: by 2002:ac8:5a86:0:b0:401:e140:58ab with SMTP id c6-20020ac85a86000000b00401e14058abmr16079790qtc.32.1688469588489;
        Tue, 04 Jul 2023 04:19:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688469588; cv=none;
        d=google.com; s=arc-20160816;
        b=rHiIJuQ3vOdDBL7thnorsWDV85/QgwkieKJGibfaA0qQvjgJWOV4WCig4CPszoU+LP
         we88TBYd/mvZXQgR/35pgMXFMwyiulestBbmxtjfNPvW1uD7rZJEQwn/KNf9jEmNWSqL
         uGnyOZ3TQKlnFvzPTYyIbYATP/jFdrhmr8/DBZAA1M47Ph43LytnSbon8xK/UQNvU/In
         Hd8gDXmcYhlWx8hmmGB6FbWYG5dre/zTT/coVvr1vQxqjGVCDd3rEpHXHvjV0s/eo0oa
         gbx1Yj95yWwpvV/9T0b1peQOcfrbRcBDxH+0E2A9vzR3wB+lA0iilMFoXeFBxZrqLxXw
         pOOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=CfFaUx7wSeZ1khpPtR9pSjAlQSgBBaTlgtrOrvwtWPc=;
        fh=mVaTN4yrirt3CO+nI7ZEJ4PwB92Bmel6CY+HzMz3RN0=;
        b=Ni/cKpy6h/c6HbTGVSlc52SO/pDt6v3CMuskujajBaXk3zchUuvABISGAFRDL6EezD
         k8qYbtWfaQc/4CIUQc3zs3P0EJFqGvuoNsaKXW4KR6zkXewMjszs22B+GkEboT+A7nV8
         LLXW9jb68+ST0ot3YaM86N7Yegk7owVlHnujO2NM2Z4RS3TgBnW+NZmCOs17dGiY8ijK
         wPtL0BHlk9ByFIlaCBQtY6IoKEHiEPMoTlxtliCbCn1PfCMpId/h6orMzgRBRKe+aEL7
         Qh/dwDok6B6NN6Gm7KX0JK2ok3dp3aPBFLGL7wR2d+Jl4G0zAdaOgmDZCw9bGE1iBhSo
         T/VA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13-20020ac87f0d000000b004009896b0f6si12872502qtk.773.2023.07.04.04.19.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jul 2023 04:19:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGe4P-0006Ug-P7; Tue, 04 Jul 2023 07:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=18er=CW=kaod.org=clg@ozlabs.org>)
 id 1qGe4O-0006UN-H8; Tue, 04 Jul 2023 07:19:44 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=18er=CW=kaod.org=clg@ozlabs.org>)
 id 1qGe4L-0000Uz-Uq; Tue, 04 Jul 2023 07:19:44 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QwL0m4HjXz4wxW;
 Tue,  4 Jul 2023 21:19:36 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QwL0h6LyWz4wxS;
 Tue,  4 Jul 2023 21:19:32 +1000 (AEST)
Message-ID: <3cda00c1-54f8-57db-8992-3cafa97d4564@kaod.org>
Date: Tue, 4 Jul 2023 13:19:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH qemu v5] aspeed add montblanc bmc reference from fuji
Content-Language: en-US
To: ~ssinprem <ssinprem@celestica.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Cc: andrew@aj.id.au, Joel Stanley <joel@jms.id.au>, qemu-stable@nongnu.org,
 srikanth@celestica.com, ssumet@celestica.com, thangavelu.v@celestica.com,
 kgengan@celestica.com, anandaramanv@celestica.com
References: <168846918238.25928.7102858062933368556-0@git.sr.ht>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <168846918238.25928.7102858062933368556-0@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=18er=CW=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /dssVTuDk5+t

On 7/4/23 13:06, ~ssinprem wrote:
> From: Sittisak Sinprem <ssinprem@celestica.com>
> 
> - I2C list follow I2C Tree v1.6 20230320
> - fru eeprom data use FB FRU format version 4
> 
> Signed-off-by: Sittisak Sinprem <ssinprem@celestica.com>

You shoot too fast :) Please add some description for the EEPROM contents.
What they enable when the OS/FW boots is good to know for QEMU.

Thanks,

C.


> ---
>   docs/system/arm/aspeed.rst |  1 +
>   hw/arm/aspeed.c            | 65 ++++++++++++++++++++++++++++++++++++++
>   hw/arm/aspeed_eeprom.c     | 50 +++++++++++++++++++++++++++++
>   hw/arm/aspeed_eeprom.h     |  7 ++++
>   4 files changed, 123 insertions(+)
> 
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index 80538422a1..5e0824f48b 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -33,6 +33,7 @@ AST2600 SoC based machines :
>   - ``tacoma-bmc``           OpenPOWER Witherspoon POWER9 AST2600 BMC
>   - ``rainier-bmc``          IBM Rainier POWER10 BMC
>   - ``fuji-bmc``             Facebook Fuji BMC
> +- ``montblanc-bmc``        Facebook Montblanc BMC
>   - ``bletchley-bmc``        Facebook Bletchley BMC
>   - ``fby35-bmc``            Facebook fby35 BMC
>   - ``qcom-dc-scm-v1-bmc``   Qualcomm DC-SCM V1 BMC
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 9fca644d92..bbb7a3392c 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -189,6 +189,10 @@ struct AspeedMachineState {
>   #define FUJI_BMC_HW_STRAP1    0x00000000
>   #define FUJI_BMC_HW_STRAP2    0x00000000
>   
> +/* Montblanc hardware value */
> +#define MONTBLANC_BMC_HW_STRAP1    0x00000000
> +#define MONTBLANC_BMC_HW_STRAP2    0x00000000
> +
>   /* Bletchley hardware value */
>   /* TODO: Leave same as EVB for now. */
>   #define BLETCHLEY_BMC_HW_STRAP1 AST2600_EVB_HW_STRAP1
> @@ -925,6 +929,41 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
>       }
>   }
>   
> +static void montblanc_bmc_i2c_init(AspeedMachineState *bmc)
> +{
> +    AspeedSoCState *soc = &bmc->soc;
> +    I2CBus *i2c[16] = {};
> +
> +    for (int i = 0; i < 16; i++) {
> +        i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
> +    }
> +
> +    /* Ref from Minipack3_I2C_Tree_V1.6 20230320 */
> +    at24c_eeprom_init_rom(i2c[3], 0x56, 8192, montblanc_scm_fruid,
> +                          montblanc_scm_fruid_len);
> +    at24c_eeprom_init_rom(i2c[6], 0x53, 8192, montblanc_fcm_fruid,
> +                          montblanc_fcm_fruid_len);
> +
> +    /* CPLD and FPGA */
> +    at24c_eeprom_init(i2c[1], 0x35, 256);  /* SCM CPLD */
> +    at24c_eeprom_init(i2c[5], 0x35, 256);  /* COMe CPLD TODO: need to update */
> +    at24c_eeprom_init(i2c[12], 0x60, 256); /* MCB PWR CPLD */
> +    at24c_eeprom_init(i2c[13], 0x35, 256); /* IOB FPGA */
> +
> +    /* on BMC board */
> +    at24c_eeprom_init_rom(i2c[8], 0x51, 8192, montblanc_bmc_fruid,
> +                          montblanc_bmc_fruid_len); /* BMC EEPROM */
> +    i2c_slave_create_simple(i2c[8], TYPE_LM75, 0x48); /* Thermal Sensor */
> +
> +    /* COMe Sensor/EEPROM */
> +    at24c_eeprom_init(i2c[0], 0x56, 16384);          /* FRU EEPROM */
> +    i2c_slave_create_simple(i2c[0], TYPE_LM75, 0x48); /* INLET Sensor */
> +    i2c_slave_create_simple(i2c[0], TYPE_LM75, 0x4A); /* OUTLET Sensor */
> +
> +    /* It expects a pca9555 but a pca9552 is compatible */
> +    create_pca9552(soc, 4, 0x27);
> +}
> +
>   #define TYPE_TMP421 "tmp421"
>   
>   static void bletchley_bmc_i2c_init(AspeedMachineState *bmc)
> @@ -1452,6 +1491,28 @@ static void aspeed_machine_fuji_class_init(ObjectClass *oc, void *data)
>           aspeed_soc_num_cpus(amc->soc_name);
>   };
>   
> +#define MONTBLANC_BMC_RAM_SIZE ASPEED_RAM_SIZE(2 * GiB)
> +
> +static void aspeed_machine_montblanc_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
> +
> +    mc->desc = "Facebook Montblanc BMC (Cortex-A7)";
> +    amc->soc_name = "ast2600-a3";
> +    amc->hw_strap1 = MONTBLANC_BMC_HW_STRAP1;
> +    amc->hw_strap2 = MONTBLANC_BMC_HW_STRAP2;
> +    amc->fmc_model = "mx66l1g45g";
> +    amc->spi_model = "mx66l1g45g";
> +    amc->num_cs = 2;
> +    amc->macs_mask = ASPEED_MAC3_ON;
> +    amc->i2c_init = montblanc_bmc_i2c_init;
> +    amc->uart_default = ASPEED_DEV_UART1;
> +    mc->default_ram_size = MONTBLANC_BMC_RAM_SIZE;
> +    mc->default_cpus = mc->min_cpus = mc->max_cpus =
> +        aspeed_soc_num_cpus(amc->soc_name);
> +};
> +
>   #define BLETCHLEY_BMC_RAM_SIZE ASPEED_RAM_SIZE(2 * GiB)
>   
>   static void aspeed_machine_bletchley_class_init(ObjectClass *oc, void *data)
> @@ -1703,6 +1764,10 @@ static const TypeInfo aspeed_machine_types[] = {
>           .name          = MACHINE_TYPE_NAME("fuji-bmc"),
>           .parent        = TYPE_ASPEED_MACHINE,
>           .class_init    = aspeed_machine_fuji_class_init,
> +    }, {
> +        .name          = MACHINE_TYPE_NAME("montblanc-bmc"),
> +        .parent        = TYPE_ASPEED_MACHINE,
> +        .class_init    = aspeed_machine_montblanc_class_init,
>       }, {
>           .name          = MACHINE_TYPE_NAME("bletchley-bmc"),
>           .parent        = TYPE_ASPEED_MACHINE,
> diff --git a/hw/arm/aspeed_eeprom.c b/hw/arm/aspeed_eeprom.c
> index ace5266cec..8cc73f83dc 100644
> --- a/hw/arm/aspeed_eeprom.c
> +++ b/hw/arm/aspeed_eeprom.c
> @@ -161,6 +161,53 @@ const uint8_t rainier_bmc_fruid[] = {
>       0x31, 0x50, 0x46, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00,
>   };
>   
> +/* Montblanc BMC FRU */
> +const uint8_t montblanc_scm_fruid[] = {
> +    0xfb, 0xfb, 0x04, 0xff, 0x01, 0x0d, 0x4d, 0x49, 0x4e, 0x49, 0x50, 0x41,
> +    0x43, 0x4b, 0x33, 0x5f, 0x53, 0x43, 0x4d, 0x02, 0x08, 0x32, 0x30, 0x30,
> +    0x30, 0x32, 0x39, 0x34, 0x35, 0x04, 0x0c, 0x31, 0x33, 0x32, 0x30, 0x30,
> +    0x30, 0x31, 0x36, 0x34, 0x30, 0x31, 0x20, 0x05, 0x0c, 0x31, 0x33, 0x31,
> +    0x30, 0x30, 0x30, 0x31, 0x32, 0x37, 0x30, 0x31, 0x20, 0x06, 0x0c, 0x52,
> +    0x33, 0x32, 0x31, 0x34, 0x47, 0x30, 0x30, 0x30, 0x33, 0x30, 0x31, 0x07,
> +    0x0d, 0x41, 0x30, 0x33, 0x31, 0x33, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> +    0x58, 0x58, 0x08, 0x01, 0x01, 0x09, 0x01, 0x00, 0x0a, 0x01, 0x00, 0x0b,
> +    0x0d, 0x4d, 0x32, 0x32, 0x31, 0x33, 0x32, 0x33, 0x31, 0x37, 0x30, 0x30,
> +    0x30, 0x32, 0x0c, 0x03, 0x43, 0x4c, 0x53, 0x0d, 0x08, 0x32, 0x30, 0x32,
> +    0x33, 0x30, 0x35, 0x30, 0x31, 0x0e, 0x03, 0x57, 0x55, 0x53, 0x0f, 0x03,
> +    0x43, 0x54, 0x48, 0x10, 0x06, 0x01, 0x00, 0x00, 0x91, 0xdb, 0xb4, 0x13,
> +    0x03, 0x53, 0x43, 0x4d, 0xfa, 0x02, 0x02, 0x61,
> +};
> +
> +const uint8_t montblanc_fcm_fruid[] = {
> +    0xfb, 0xfb, 0x04, 0xff, 0x01, 0x0d, 0x4d, 0x49, 0x4e, 0x49, 0x50, 0x41,
> +    0x43, 0x4b, 0x33, 0x5f, 0x46, 0x43, 0x42, 0x02, 0x08, 0x33, 0x30, 0x30,
> +    0x30, 0x30, 0x31, 0x36, 0x31, 0x04, 0x0c, 0x31, 0x33, 0x32, 0x30, 0x30,
> +    0x30, 0x31, 0x36, 0x33, 0x30, 0x31, 0x20, 0x05, 0x0c, 0x31, 0x33, 0x31,
> +    0x30, 0x30, 0x30, 0x31, 0x33, 0x30, 0x30, 0x31, 0x20, 0x06, 0x0c, 0x52,
> +    0x33, 0x32, 0x31, 0x34, 0x47, 0x30, 0x30, 0x31, 0x32, 0x30, 0x31, 0x07,
> +    0x0d, 0x41, 0x31, 0x32, 0x31, 0x32, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> +    0x58, 0x58, 0x08, 0x01, 0x01, 0x09, 0x01, 0x00, 0x0a, 0x01, 0x00, 0x0b,
> +    0x0d, 0x46, 0x35, 0x30, 0x31, 0x33, 0x32, 0x33, 0x31, 0x37, 0x30, 0x30,
> +    0x30, 0x35, 0x0c, 0x03, 0x43, 0x4c, 0x53, 0x0d, 0x08, 0x32, 0x30, 0x32,
> +    0x33, 0x30, 0x35, 0x30, 0x31, 0x0e, 0x03, 0x57, 0x55, 0x53, 0x0f, 0x03,
> +    0x43, 0x54, 0x48, 0x10, 0x06, 0x02, 0x00, 0x00, 0x91, 0xdb, 0xb4, 0x11,
> +    0x06, 0x03, 0x00, 0x00, 0x91, 0xdb, 0xb4, 0x12, 0x02, 0x8a, 0x00, 0x13,
> +    0x03, 0x46, 0x43, 0x42, 0xfa, 0x02, 0x50, 0x47,
> +};
> +
> +const uint8_t montblanc_bmc_fruid[] = {
> +    0xfb, 0xfb, 0x04, 0xff, 0x01, 0x0d, 0x4d, 0x49, 0x4e, 0x49, 0x50, 0x41,
> +    0x43, 0x4b, 0x33, 0x5f, 0x42, 0x4d, 0x43, 0x04, 0x0c, 0x31, 0x33, 0x32,
> +    0x30, 0x30, 0x30, 0x31, 0x33, 0x36, 0x30, 0x31, 0x20, 0x05, 0x0c, 0x31,
> +    0x33, 0x31, 0x30, 0x30, 0x30, 0x30, 0x38, 0x36, 0x30, 0x35, 0x20, 0x06,
> +    0x0c, 0x52, 0x33, 0x30, 0x39, 0x37, 0x47, 0x30, 0x30, 0x30, 0x32, 0x30,
> +    0x37, 0x07, 0x0d, 0x42, 0x30, 0x32, 0x37, 0x34, 0x58, 0x58, 0x58, 0x58,
> +    0x58, 0x58, 0x58, 0x58, 0x08, 0x01, 0x04, 0x09, 0x01, 0x00, 0x0a, 0x01,
> +    0x00, 0x0c, 0x03, 0x43, 0x4c, 0x53, 0x0d, 0x08, 0x32, 0x30, 0x32, 0x33,
> +    0x30, 0x35, 0x30, 0x31, 0x0e, 0x03, 0x57, 0x55, 0x53, 0x0f, 0x03, 0x43,
> +    0x54, 0x48, 0x13, 0x03, 0x42, 0x4d, 0x43, 0xfa, 0x02, 0xef, 0xba,
> +};
> +
>   const size_t tiogapass_bmc_fruid_len = sizeof(tiogapass_bmc_fruid);
>   const size_t fby35_nic_fruid_len = sizeof(fby35_nic_fruid);
>   const size_t fby35_bb_fruid_len = sizeof(fby35_bb_fruid);
> @@ -168,3 +215,6 @@ const size_t fby35_bmc_fruid_len = sizeof(fby35_bmc_fruid);
>   const size_t yosemitev2_bmc_fruid_len = sizeof(yosemitev2_bmc_fruid);
>   const size_t rainier_bb_fruid_len = sizeof(rainier_bb_fruid);
>   const size_t rainier_bmc_fruid_len = sizeof(rainier_bmc_fruid);
> +const size_t montblanc_scm_fruid_len = sizeof(montblanc_scm_fruid);
> +const size_t montblanc_fcm_fruid_len = sizeof(montblanc_fcm_fruid);
> +const size_t montblanc_bmc_fruid_len = sizeof(montblanc_bmc_fruid);
> diff --git a/hw/arm/aspeed_eeprom.h b/hw/arm/aspeed_eeprom.h
> index bbf9e54365..b8fbdd0734 100644
> --- a/hw/arm/aspeed_eeprom.h
> +++ b/hw/arm/aspeed_eeprom.h
> @@ -27,4 +27,11 @@ extern const size_t rainier_bb_fruid_len;
>   extern const uint8_t rainier_bmc_fruid[];
>   extern const size_t rainier_bmc_fruid_len;
>   
> +extern const uint8_t montblanc_scm_fruid[];
> +extern const uint8_t montblanc_fcm_fruid[];
> +extern const uint8_t montblanc_bmc_fruid[];
> +extern const size_t montblanc_scm_fruid_len;
> +extern const size_t montblanc_fcm_fruid_len;
> +extern const size_t montblanc_bmc_fruid_len;
> +
>   #endif

