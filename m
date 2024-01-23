Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp199747ejc;
        Tue, 23 Jan 2024 01:27:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYwNGTxl/y3XLgk3hZQGBZ3ojNSBngZdj4+wrvEb3pY3Lon+Q9vt0DB7vXiIeS32ATqkxC
X-Received: by 2002:a05:6808:1825:b0:3bd:c672:4efb with SMTP id bh37-20020a056808182500b003bdc6724efbmr519075oib.102.1706002061051;
        Tue, 23 Jan 2024 01:27:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706002061; cv=none;
        d=google.com; s=arc-20160816;
        b=m0MNvIIwC7RG3ZGoHzkmySZt08lLJWj1gzbySbEjG8mOK6/C54lYXK34IsUS/0ASbB
         S5+hmEi4xtnhIATXsxmSxHFFiHckZ08ludtWAq4SQObNoXTvLqhBCQ+1dDxiyp2z0IEU
         N5HT2eyfg0JKExjho6MNskFZ8xVohVId2NG+gEqh+2ai7v0VcRHiMetLPoicKzevWLvP
         brvEVd1cuvUW2W0TKIFrDPBbdHio+9ntyyUqy4CMs/oJycFZiK0q4TcUW+Et0OP1CLHs
         2nsCO2fBaI9r0AA/Q1SJNDNQVuxCBdMxemAoeK64zStkPtSdYgd67ZnzS+qIgQ84A1HJ
         Q1Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=gfaonedDcu3MXwgCio/hcLRt/oj4v0O4X+HODxqhOaQ=;
        fh=CjqoZpSay6rskVZIzd7DmHmGQlvZ+7x6x29uJZc5v74=;
        b=HptvG0RTw8FnokN9hwSmyHQKDWCMjGZZjXIlcIzxETIqm+CyNIM1pxmH8C5tLtda3W
         J7xFNTEv3P4G39yGl8cu1RiEkEyKO+4lkxnv0YY1+Vn0CN4BEBuwog5DBZ323un2L85C
         K6DUeJEbMpyIRkR4WDH6S/6eEsNmngj5uDezM/dg4vrGH7cEinNUxxX2pEOWLAKFkkr6
         XLr+mA0X1PBx7SzbJ9XaabGPXmr3Qit92TChhUwO98ph1XGTS0trDBTM1LZzradVmxWI
         S0ipnvCzW552VVsZtesJjE8SypckeQmDOR403YVOK4zMjSwZBCcSd4uQPIE6h4waGzPp
         jZ7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k14-20020a05622a03ce00b0042a26a6d43esi7458878qtx.101.2024.01.23.01.27.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jan 2024 01:27:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rSD3w-0000iH-Jj; Tue, 23 Jan 2024 04:27:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=9HdW=JB=kaod.org=clg@ozlabs.org>)
 id 1rSD3u-0000hV-C6; Tue, 23 Jan 2024 04:27:18 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=9HdW=JB=kaod.org=clg@ozlabs.org>)
 id 1rSD3r-0003Rf-V1; Tue, 23 Jan 2024 04:27:18 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TK1vM09gwz4x2L;
 Tue, 23 Jan 2024 20:27:11 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TK1vH33HPz4wcX;
 Tue, 23 Jan 2024 20:27:07 +1100 (AEDT)
Message-ID: <1c5cb61a-316a-4cd6-af53-79450025380f@kaod.org>
Date: Tue, 23 Jan 2024 10:27:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] hw/arm/aspeed/2600: Check for CPU types in
 machine_run_board_init()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Gavin Shan <gshan@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-arm@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Rob Herring <robh@kernel.org>
References: <20240123063842.35255-1-philmd@linaro.org>
 <20240123063842.35255-7-philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240123063842.35255-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=9HdW=JB=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: rFveMN6iHpPz

On 1/23/24 07:38, Philippe Mathieu-Daudé wrote:
> Restrict MachineClass::valid_cpu_types[] to the single
> valid CPU type.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/aspeed.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index df627096d2..393c97d55e 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1157,6 +1157,11 @@ static const char * const ast2500_a1_valid_cpu_types[] = {
>       NULL
>   };
>   
> +static const char * const ast2600_a3_valid_cpu_types[] = {
> +    ARM_CPU_TYPE_NAME("cortex-a9"),

This should be "cortex-a7"

Looking closer, the CPU information is under AspeedSoCClass. Why not build the
valid_cpu_types array with something like :

     struct AspeedMachineClass {
	...
	const char *valid_cpu_types[2];
     };

     static void aspeed_machine_set_valid_cpu_types(MachineClass *mc)
     {
         AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(mc);
         AspeedSoCClass *sc = ASPEED_SOC_CLASS(object_class_by_name(amc->soc_name));
     
         amc->valid_cpu_types[0] = sc->cpu_type;
         amc->valid_cpu_types[1] = NULL;
         mc->valid_cpu_types = amc->valid_cpu_types;
     };


Thanks,

C.



> +    NULL
> +};
> +
>   static void aspeed_machine_class_init(ObjectClass *oc, void *data)
>   {
>       MachineClass *mc = MACHINE_CLASS(oc);
> @@ -1373,6 +1378,7 @@ static void aspeed_machine_ast2600_evb_class_init(ObjectClass *oc, void *data)
>       amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_ON |
>                        ASPEED_MAC3_ON;
>       amc->i2c_init  = ast2600_evb_i2c_init;
> +    mc->valid_cpu_types = ast2600_a3_valid_cpu_types;
>       mc->default_ram_size = 1 * GiB;
>       mc->default_cpus = mc->min_cpus = mc->max_cpus =
>           aspeed_soc_num_cpus(amc->soc_name);
> @@ -1392,6 +1398,7 @@ static void aspeed_machine_tacoma_class_init(ObjectClass *oc, void *data)
>       amc->num_cs    = 2;
>       amc->macs_mask  = ASPEED_MAC2_ON;
>       amc->i2c_init  = witherspoon_bmc_i2c_init; /* Same board layout */
> +    mc->valid_cpu_types = ast2600_a3_valid_cpu_types;
>       mc->default_ram_size = 1 * GiB;
>       mc->default_cpus = mc->min_cpus = mc->max_cpus =
>           aspeed_soc_num_cpus(amc->soc_name);
> @@ -1449,6 +1456,7 @@ static void aspeed_machine_rainier_class_init(ObjectClass *oc, void *data)
>       amc->num_cs    = 2;
>       amc->macs_mask  = ASPEED_MAC2_ON | ASPEED_MAC3_ON;
>       amc->i2c_init  = rainier_bmc_i2c_init;
> +    mc->valid_cpu_types = ast2600_a3_valid_cpu_types;
>       mc->default_ram_size = 1 * GiB;
>       mc->default_cpus = mc->min_cpus = mc->max_cpus =
>           aspeed_soc_num_cpus(amc->soc_name);
> @@ -1471,6 +1479,7 @@ static void aspeed_machine_fuji_class_init(ObjectClass *oc, void *data)
>       amc->macs_mask = ASPEED_MAC3_ON;
>       amc->i2c_init = fuji_bmc_i2c_init;
>       amc->uart_default = ASPEED_DEV_UART1;
> +    mc->valid_cpu_types = ast2600_a3_valid_cpu_types;
>       mc->default_ram_size = FUJI_BMC_RAM_SIZE;
>       mc->default_cpus = mc->min_cpus = mc->max_cpus =
>           aspeed_soc_num_cpus(amc->soc_name);
> @@ -1492,6 +1501,7 @@ static void aspeed_machine_bletchley_class_init(ObjectClass *oc, void *data)
>       amc->num_cs    = 2;
>       amc->macs_mask = ASPEED_MAC2_ON;
>       amc->i2c_init  = bletchley_bmc_i2c_init;
> +    mc->valid_cpu_types = ast2600_a3_valid_cpu_types;
>       mc->default_ram_size = BLETCHLEY_BMC_RAM_SIZE;
>       mc->default_cpus = mc->min_cpus = mc->max_cpus =
>           aspeed_soc_num_cpus(amc->soc_name);
> @@ -1631,6 +1641,7 @@ static void aspeed_machine_qcom_dc_scm_v1_class_init(ObjectClass *oc,
>       amc->num_cs    = 2;
>       amc->macs_mask = ASPEED_MAC2_ON | ASPEED_MAC3_ON;
>       amc->i2c_init  = qcom_dc_scm_bmc_i2c_init;
> +    mc->valid_cpu_types = ast2600_a3_valid_cpu_types;
>       mc->default_ram_size = 1 * GiB;
>       mc->default_cpus = mc->min_cpus = mc->max_cpus =
>           aspeed_soc_num_cpus(amc->soc_name);
> @@ -1651,6 +1662,7 @@ static void aspeed_machine_qcom_firework_class_init(ObjectClass *oc,
>       amc->num_cs    = 2;
>       amc->macs_mask = ASPEED_MAC2_ON | ASPEED_MAC3_ON;
>       amc->i2c_init  = qcom_dc_scm_firework_i2c_init;
> +    mc->valid_cpu_types = ast2600_a3_valid_cpu_types;
>       mc->default_ram_size = 1 * GiB;
>       mc->default_cpus = mc->min_cpus = mc->max_cpus =
>           aspeed_soc_num_cpus(amc->soc_name);

