Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp124882ejq;
        Tue, 23 Jan 2024 22:59:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+qSg6gIoo3lIuvPgjUAbNwv3aaSNUdX1Ut6G/gAxDtZsMilBQalOL0+NEsD4foLClfzfN
X-Received: by 2002:ac8:7250:0:b0:42a:5076:a597 with SMTP id l16-20020ac87250000000b0042a5076a597mr1933665qtp.13.1706079595687;
        Tue, 23 Jan 2024 22:59:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706079595; cv=none;
        d=google.com; s=arc-20160816;
        b=IOyi8zw7g+iSPqS3EWl7v7e6Ut0Q5aOfZ0svF1a5MqtmFGUIB/I3mX4aFBHRd7BMfF
         o7fTzBQovlgzBm76WxlltysBMRdr/CgwOAF7mS3NClpMB4/8/SrI6kwdKw470e0C+ugP
         NwScB+N8s6dLEggPlXUSBVCxWisdWEOGmOa5ZfXA+XlLr2er8TT4Q0mA4Ch0LVqwPmNf
         Wr2odn2pxW1qBSM75HCvfBYi4/NbKmDzuhLQM0x8RWCDGdVzmugrY1MU+gDfBDI/hE+l
         Kdyh3RDmLeGRRPYRqvYtfAbiR4Ox5Wagz+rV77Xfhkr2ZIGqx4DYUCxOfhqorLZuLq7v
         XGbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=fZuB16Cb9+3hUYgaUxDtYdiTbphZkNu1xEGil4YAUjw=;
        fh=PGBvAVDo542HGKR2HEyzwlMafYQwpX/jzYtHtf/eDX4=;
        b=V9RYaFbBNQyVLIOKEUTTz0tUXc6jThjD+hEcmBap4ZsjieSMwx2YEBCiOugXlg6QVv
         ArQGxPsAdoMNr9QZvqKODVvMjUZgN/2ln8YXAkXbXpLxqwATFjE5sWV2C0E9ZOM6seYo
         C6zRJBcG19fBPX1CB3nmZnc60q5aieCXKBRBZNDaigmyIGic2Ph2xdkVlxovSHQ8RM+1
         r9ZxTT2k3GCbclW9ErEIOLG1PAiTz5pjdH7+Fkj0Xmlje/KdkQzIC3T2bgoX08hqSnJR
         cxa78XUyM9zstClrbHyC11zRolDJs3LN8KuWpmYl45iPTB0+vUqrbH0hZR0u5mRfZjOg
         pEOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4-20020ac87e84000000b0042a5536a270si2156940qtj.454.2024.01.23.22.59.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jan 2024 22:59:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSXEg-0000om-AZ; Wed, 24 Jan 2024 01:59:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=rIgd=JC=kaod.org=clg@ozlabs.org>)
 id 1rSXEe-0000oZ-UR; Wed, 24 Jan 2024 01:59:44 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=rIgd=JC=kaod.org=clg@ozlabs.org>)
 id 1rSXEc-0004i0-RW; Wed, 24 Jan 2024 01:59:44 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TKZZh3nfSz4x3D;
 Wed, 24 Jan 2024 17:59:40 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TKZZf3lQqz4x2N;
 Wed, 24 Jan 2024 17:59:38 +1100 (AEDT)
Message-ID: <294bd4eb-c335-4221-80a8-72a987c79698@kaod.org>
Date: Wed, 24 Jan 2024 07:59:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] hw/arm/aspeed: Check for CPU types in
 machine_run_board_init()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>
References: <20240123224842.18485-1-philmd@linaro.org>
 <20240123224842.18485-6-philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240123224842.18485-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=rIgd=JC=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: 21RHGMcVNAgd

On 1/23/24 23:48, Philippe Mathieu-Daudé wrote:
> Aspeed SoCs use a single CPU type (set as AspeedSoCClass::cpu_type).
> Convert it to a NULL-terminated array (of a single non-NULL element).
> 
> Set MachineClass::valid_cpu_types[] to use the common machine code
> to provide hints when the requested CPU is invalid (see commit
> e702cbc19e ("machine: Improve is_cpu_type_supported()").
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   include/hw/arm/aspeed_soc.h |  3 ++-
>   hw/arm/aspeed.c             |  1 +
>   hw/arm/aspeed_ast10x0.c     |  6 +++++-
>   hw/arm/aspeed_ast2400.c     | 12 ++++++++++--
>   hw/arm/aspeed_ast2600.c     |  6 +++++-
>   hw/arm/aspeed_soc_common.c  |  5 ++++-
>   6 files changed, 27 insertions(+), 6 deletions(-)
> 
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index a060a59918..0db5a41e71 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -128,7 +128,8 @@ struct AspeedSoCClass {
>       DeviceClass parent_class;
>   
>       const char *name;
> -    const char *cpu_type;
> +    /** valid_cpu_types: NULL terminated array of a single CPU type. */
> +    const char * const *valid_cpu_types;
>       uint32_t silicon_rev;
>       uint64_t sram_size;
>       uint64_t secsram_size;
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 636a6269aa..1be3b6bcae 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1149,6 +1149,7 @@ static void aspeed_machine_class_init_cpus_defaults(MachineClass *mc)
>       mc->default_cpus = mc->min_cpus
>                        = mc->max_cpus
>                        = sc->num_cpus;
> +    mc->valid_cpu_types = sc->valid_cpu_types;
>   }
>   
>   static void aspeed_machine_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index dca601a3f9..c3b5116a6a 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -417,13 +417,17 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>   
>   static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
>   {
> +    static const char * const valid_cpu_types[] = {
> +        ARM_CPU_TYPE_NAME("cortex-m4"), /* TODO cortex-m4f */
> +        NULL
> +    };
>       DeviceClass *dc = DEVICE_CLASS(klass);
>       AspeedSoCClass *sc = ASPEED_SOC_CLASS(dc);
>   
>       dc->realize = aspeed_soc_ast1030_realize;
>   
>       sc->name = "ast1030-a1";
> -    sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4"); /* TODO cortex-m4f */
> +    sc->valid_cpu_types = valid_cpu_types;
>       sc->silicon_rev = AST1030_A1_SILICON_REV;
>       sc->sram_size = 0xc0000;
>       sc->secsram_size = 0x40000; /* 256 * KiB */
> diff --git a/hw/arm/aspeed_ast2400.c b/hw/arm/aspeed_ast2400.c
> index 3baf95916d..8829561bb6 100644
> --- a/hw/arm/aspeed_ast2400.c
> +++ b/hw/arm/aspeed_ast2400.c
> @@ -503,6 +503,10 @@ static void aspeed_ast2400_soc_realize(DeviceState *dev, Error **errp)
>   
>   static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
>   {
> +    static const char * const valid_cpu_types[] = {
> +        ARM_CPU_TYPE_NAME("arm926"),
> +        NULL
> +    };
>       AspeedSoCClass *sc = ASPEED_SOC_CLASS(oc);
>       DeviceClass *dc = DEVICE_CLASS(oc);
>   
> @@ -511,7 +515,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
>       dc->user_creatable = false;
>   
>       sc->name         = "ast2400-a1";
> -    sc->cpu_type     = ARM_CPU_TYPE_NAME("arm926");
> +    sc->valid_cpu_types = valid_cpu_types;
>       sc->silicon_rev  = AST2400_A1_SILICON_REV;
>       sc->sram_size    = 0x8000;
>       sc->spis_num     = 1;
> @@ -527,6 +531,10 @@ static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
>   
>   static void aspeed_soc_ast2500_class_init(ObjectClass *oc, void *data)
>   {
> +    static const char * const valid_cpu_types[] = {
> +        ARM_CPU_TYPE_NAME("arm1176"),
> +        NULL
> +    };
>       AspeedSoCClass *sc = ASPEED_SOC_CLASS(oc);
>       DeviceClass *dc = DEVICE_CLASS(oc);
>   
> @@ -535,7 +543,7 @@ static void aspeed_soc_ast2500_class_init(ObjectClass *oc, void *data)
>       dc->user_creatable = false;
>   
>       sc->name         = "ast2500-a1";
> -    sc->cpu_type     = ARM_CPU_TYPE_NAME("arm1176");
> +    sc->valid_cpu_types = valid_cpu_types;
>       sc->silicon_rev  = AST2500_A1_SILICON_REV;
>       sc->sram_size    = 0x9000;
>       sc->spis_num     = 2;
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index b264433cf0..46baba0e41 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -629,13 +629,17 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>   
>   static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
>   {
> +    static const char * const valid_cpu_types[] = {
> +        ARM_CPU_TYPE_NAME("cortex-a7"),
> +        NULL
> +    };
>       DeviceClass *dc = DEVICE_CLASS(oc);
>       AspeedSoCClass *sc = ASPEED_SOC_CLASS(oc);
>   
>       dc->realize      = aspeed_soc_ast2600_realize;
>   
>       sc->name         = "ast2600-a3";
> -    sc->cpu_type     = ARM_CPU_TYPE_NAME("cortex-a7");
> +    sc->valid_cpu_types = valid_cpu_types;
>       sc->silicon_rev  = AST2600_A3_SILICON_REV;
>       sc->sram_size    = 0x16400;
>       sc->spis_num     = 2;
> diff --git a/hw/arm/aspeed_soc_common.c b/hw/arm/aspeed_soc_common.c
> index 36ca189ce9..123a0c432c 100644
> --- a/hw/arm/aspeed_soc_common.c
> +++ b/hw/arm/aspeed_soc_common.c
> @@ -20,7 +20,10 @@
>   
>   const char *aspeed_soc_cpu_type(AspeedSoCClass *sc)
>   {
> -    return sc->cpu_type;
> +    assert(sc->valid_cpu_types);
> +    assert(sc->valid_cpu_types[0]);
> +    assert(!sc->valid_cpu_types[1]);
> +    return sc->valid_cpu_types[0];
>   }
>   
>   qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev)

