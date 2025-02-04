Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp416481njb;
        Tue, 4 Feb 2025 10:45:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXgi5rMEBcAJ7RATlq9szSp3RojQS2KRmj/BZ0C49VCk3vUH1LpUdi4GE2K40hrZm1epUdQ8Qp12D9iDg==@linaro.org
X-Google-Smtp-Source: AGHT+IEZEOgl3CAQlH9sKByEoTSFcOCxzGm2FhjmVIipZkBM+Bu/oJ5ZEyO8+xvXme8pYAZAn/wY
X-Received: by 2002:a05:620a:6084:b0:7b7:106a:19a0 with SMTP id af79cd13be357-7bffcce46fbmr3475880285a.24.1738694737365;
        Tue, 04 Feb 2025 10:45:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738694737; cv=none;
        d=google.com; s=arc-20240605;
        b=cXVXU4B0b+e0Gh7R/3WnZzp0bgmWd1b6IqqVuFCd3M5pt/5MYymcCY+II/Y+TMGWpZ
         wggySf+69wMghD+U3amojjr0X8Ey6/jINvBOj2C6ykNeB13GPGpC1Y4+9NaWI5ItNGii
         Oon35SjPJzVm5t/AYQjqBU3E9dSjpTPh5o8IbNznV8LQWsK40Z+VipwiATMVIT8q661p
         Q7AA2u1o0Wxx9hAOwX0ctXwqVLG8nZpdeq68MYv9psoKbK4sFJ+Io/eZiKQlDe2Y7PRX
         +aj5rqk32YHSOo5hu1N9apyw9r8RvBiG94/65WDRpeHPqpPTeWBhJYb6qQsQz7N9B5+m
         i1zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=eo85zQ+7YfbpOki7Z6UgjhVIPZgWLGNokkR4U8Z31+8=;
        fh=G9f33f/KAmwvn3I015OdiserGHarU9X3KAk3RuGGmq4=;
        b=Ytgqf0546+PXgk09A8NqbAnM5Rdjpv8sxrJsP9Emb4zxtPAoRbn+T1AliUtZzYgWnm
         c3iRzhMxG3Xbcc4ipWDkVM5DUbc8uvRhSazDAf08quQCXdI2/gB5hERpXImwSMvd19cy
         BwBcWnF9dHRlg5KslHqFGEyN37xj2hqOtdXAN/ZmLLkxBuiVG9U3opMv+N/6gzXM6Xvv
         24fH4kCqI/zbslLr/XOOXf5xpZB2MxnWQW3Ih5TqczAVS+DCudoMudsESBrskl9SxD1a
         eUcbrJIrQu6MbjSLzMpyC8ogqOBm+UAiVsK98MEY7tYj8xH/hVKzzBUeRO2t9n3ELU1O
         niKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KrihtG6H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c02db62b20si390907985a.173.2025.02.04.10.45.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 10:45:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KrihtG6H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfNv9-0002ti-3U; Tue, 04 Feb 2025 13:45:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tfNuu-0002p7-MW
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 13:45:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tfNus-0000if-Q8
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 13:45:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738694697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=eo85zQ+7YfbpOki7Z6UgjhVIPZgWLGNokkR4U8Z31+8=;
 b=KrihtG6HpIRSRSiWnZMOWMClfwlYdYX+josVNuEMDr1sDS/RS5t6c78DeRm4CGDs69L6Z4
 ru+Ct2SB9TjuTVHY4lrYR4e424R2XKSPNMJK7wpSQA0fdeABTm87DyQdx7hfLoCrwF3GSM
 tPEAgVglP/Ln0412jcr7N9Lu7yYI8jE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-qulTbtbjPGynLZMHywPOPA-1; Tue, 04 Feb 2025 13:44:50 -0500
X-MC-Unique: qulTbtbjPGynLZMHywPOPA-1
X-Mimecast-MFC-AGG-ID: qulTbtbjPGynLZMHywPOPA
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-5dca72b752fso2691468a12.0
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 10:44:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738694690; x=1739299490;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eo85zQ+7YfbpOki7Z6UgjhVIPZgWLGNokkR4U8Z31+8=;
 b=Z3t+Z9l0IgBsMZKwnTeW8yTqvPPLCNEPPWXjVhidhfFKcewautlT/t+yXVeYbgPmZE
 mU/STmuCImY2LCaDZmGJr3tDZ3vj+ZH3uLJMMLqOfjM6vj8EkOlnuyPb9ONlSdsz5fsX
 aRIVOAvuqy1jPW3DX/f4r9QwEvmqCH80yXqXuncRUppNw57xBR3tY37BDXwm7ZtNvkUo
 gM4bcjfcXcUHFYoQbQO5LIs4/a7eK6AfOWX+ybrjkpOGlapCsrOoSTCeCF0c8rx1ajW9
 UKtNqGkelI6TfJUPV/IsjjGs4OpBidgoChBS7T1f8rDzZYsdypuR6W+5evoCCjr0NMol
 DMOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi8X+NpwQoas5pthvwu/GZ5roFkEsNPiHyGSQ/hXEZoV3ZdEw74TPmzZRHuPrxfxRCTbQee1lV8Q==@nongnu.org
X-Gm-Message-State: AOJu0Yzs7wxYytdYddbhbJU84idITGTUxlhVZUia1zVZH0rEq865eFvQ
 GfG0JxTILigwXqhfhU82y5p6NwmH3Eg2ovGq26wdj7NIqfIHUbZiPxEyFb1gYQeOKE054xgw7LP
 oRNk4pZ3qMtfq/VXHfRVmCG15NX3SmKkJW1a/xqysPNVqvv2L7w==
X-Gm-Gg: ASbGncuSSXrKHZ9GIlx1O5H+LU7tuVdG3nm7iRY2AZoFN4W6i8j0354UxkIQhYdf+Hu
 oZTGEzK2jP7mEZJZkGyRTUnkDprdp7mCZ7oHaIdHa9D4r2+jclOnbhXcLqDJFkJlSYiilpg8CSv
 xWGjZd1R29l6CXj3puJN2RvQ0Dyk851eP6Vk83Lr6PHbUNIzKXyUTwsFFwXY9BYS4OU7d0jdxnN
 pV8r4gH20BrE2731JuHXBSDFTIg8xBQw05GusTCqxBh6zRLLjcnweL9QzVfu8rdfgzfSNRVhwSy
 Jzpgz/kYzN6TgHmMBi0/c+i7puTMfgDUTIaA
X-Received: by 2002:a17:907:6090:b0:ab6:d7c5:123 with SMTP id
 a640c23a62f3a-ab6d7c5140fmr2701043966b.51.1738694689600; 
 Tue, 04 Feb 2025 10:44:49 -0800 (PST)
X-Received: by 2002:a17:907:6090:b0:ab6:d7c5:123 with SMTP id
 a640c23a62f3a-ab6d7c5140fmr2701040366b.51.1738694689079; 
 Tue, 04 Feb 2025 10:44:49 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-132.web.vodafone.de.
 [109.42.48.132]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47a8490sm955023566b.26.2025.02.04.10.44.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 10:44:48 -0800 (PST)
Message-ID: <bf0a2502-42e5-410c-83fc-ff966cd242ef@redhat.com>
Date: Tue, 4 Feb 2025 19:44:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] hw/arm: Remove all invalid uses of
 auto_create_sdcard=true
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
References: <20250204180746.58357-1-philmd@linaro.org>
 <20250204180746.58357-7-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250204180746.58357-7-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: by8m2ArypHnNLAEbn9-BKDFRJf__2GUD3gbep0MNi2w_1738694690
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: g3vRFqkm3FX2

On 04/02/2025 19.07, Philippe Mathieu-Daudé wrote:
> MachineClass::auto_create_sdcard is only useful to automatically
> create a SD card, attach a IF_SD block drive to it and plug the
> card onto a SD bus. None of the ARM machines modified by this
> commit try to use the IF_SD interface.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
...
> diff --git a/hw/arm/bananapi_m2u.c b/hw/arm/bananapi_m2u.c
> index 4d84d10d24c..0a4b6f29b1c 100644
> --- a/hw/arm/bananapi_m2u.c
> +++ b/hw/arm/bananapi_m2u.c
> @@ -141,7 +141,6 @@ static void bpim2u_machine_init(MachineClass *mc)
>       mc->valid_cpu_types = valid_cpu_types;
>       mc->default_ram_size = 1 * GiB;
>       mc->default_ram_id = "bpim2u.ram";
> -    mc->auto_create_sdcard = true;
>   }

The bananapi seems to use IF_SD ... could you please double-check whether 
this is the right change here?

> diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
> index 43dc89d902e..2410e2a28e8 100644
> --- a/hw/arm/exynos4_boards.c
> +++ b/hw/arm/exynos4_boards.c
> @@ -165,7 +165,6 @@ static void nuri_class_init(ObjectClass *oc, void *data)
>       mc->min_cpus = EXYNOS4210_NCPUS;
>       mc->default_cpus = EXYNOS4210_NCPUS;
>       mc->ignore_memory_transaction_failures = true;
> -    mc->auto_create_sdcard = true;
>   }
>   
>   static const TypeInfo nuri_type = {
> @@ -185,7 +184,6 @@ static void smdkc210_class_init(ObjectClass *oc, void *data)
>       mc->min_cpus = EXYNOS4210_NCPUS;
>       mc->default_cpus = EXYNOS4210_NCPUS;
>       mc->ignore_memory_transaction_failures = true;
> -    mc->auto_create_sdcard = true;
>   }
>   
>   static const TypeInfo smdkc210_type = {

I think this is likely wrong, too - they use IF_SD via exynos4210.c, don't they?

> diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
> index e95ea5e4e18..c9c2e5dd3b1 100644
> --- a/hw/arm/imx25_pdk.c
> +++ b/hw/arm/imx25_pdk.c
> @@ -147,7 +147,6 @@ static void imx25_pdk_machine_init(MachineClass *mc)
>       mc->init = imx25_pdk_init;
>       mc->ignore_memory_transaction_failures = true;
>       mc->default_ram_id = "imx25.ram";
> -    mc->auto_create_sdcard = true;
>   }

This machine seems to use IF_SD, too?

> diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
> index 86982cb0772..690cb64ef36 100644
> --- a/hw/arm/mcimx6ul-evk.c
> +++ b/hw/arm/mcimx6ul-evk.c
> @@ -74,6 +74,5 @@ static void mcimx6ul_evk_machine_init(MachineClass *mc)
>       mc->init = mcimx6ul_evk_init;
>       mc->max_cpus = FSL_IMX6UL_NUM_CPUS;
>       mc->default_ram_id = "mcimx6ul-evk.ram";
> -    mc->auto_create_sdcard = true;
>   }
>   DEFINE_MACHINE("mcimx6ul-evk", mcimx6ul_evk_machine_init)

dito?

> diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
> index 33119610113..ac1f57f0671 100644
> --- a/hw/arm/mcimx7d-sabre.c
> +++ b/hw/arm/mcimx7d-sabre.c
> @@ -74,6 +74,7 @@ static void mcimx7d_sabre_machine_init(MachineClass *mc)
>       mc->init = mcimx7d_sabre_init;
>       mc->max_cpus = FSL_IMX7_NUM_CPUS;
>       mc->default_ram_id = "mcimx7d-sabre.ram";
> -    mc->auto_create_sdcard = true;
> +
>   }

dito?

> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index df520c91906..00412193a4a 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -1421,7 +1421,6 @@ static void lm3s811evb_class_init(ObjectClass *oc, void *data)
>       mc->init = lm3s811evb_init;
>       mc->ignore_memory_transaction_failures = true;
>       mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m3");
> -    mc->auto_create_sdcard = true;
>   }

dito?

> diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
> index 941616cd25b..bc4522989ec 100644
> --- a/hw/arm/versatilepb.c
> +++ b/hw/arm/versatilepb.c
> @@ -419,7 +419,6 @@ static void versatilepb_class_init(ObjectClass *oc, void *data)
>       mc->ignore_memory_transaction_failures = true;
>       mc->default_cpu_type = ARM_CPU_TYPE_NAME("arm926");
>       mc->default_ram_id = "versatile.ram";
> -    mc->auto_create_sdcard = true;
>   
>       machine_add_audiodev_property(mc);
>   }
> @@ -440,7 +439,6 @@ static void versatileab_class_init(ObjectClass *oc, void *data)
>       mc->ignore_memory_transaction_failures = true;
>       mc->default_cpu_type = ARM_CPU_TYPE_NAME("arm926");
>       mc->default_ram_id = "versatile.ram";
> -    mc->auto_create_sdcard = true;
>   
>       machine_add_audiodev_property(mc);
>   }

dito?

> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 2d626a96b9b..3c6a4604cc9 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -466,7 +466,6 @@ static void zynq_machine_class_init(ObjectClass *oc, void *data)
>       mc->ignore_memory_transaction_failures = true;
>       mc->valid_cpu_types = valid_cpu_types;
>       mc->default_ram_id = "zynq.ext_ram";
> -    mc->auto_create_sdcard = true;
>       prop = object_class_property_add_str(oc, "boot-mode", NULL,
>                                            zynq_set_boot_mode);
>       object_class_property_set_description(oc, "boot-mode",

I'm confused about this one ... it used to have no_sdcard = 1 , but it still 
seems to use IF_SD ?

> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index 0c6f0359e3d..1401d37959e 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -818,7 +818,6 @@ static void versal_virt_machine_class_init(ObjectClass *oc, void *data)
>       mc->max_cpus = XLNX_VERSAL_NR_ACPUS + XLNX_VERSAL_NR_RCPUS;
>       mc->default_cpus = XLNX_VERSAL_NR_ACPUS + XLNX_VERSAL_NR_RCPUS;
>       mc->no_cdrom = true;
> -    mc->auto_create_sdcard = true;
>       mc->default_ram_id = "ddr";
>       object_class_property_add_str(oc, "ospi-flash", versal_get_ospi_model,
>                                      versal_set_ospi_model);

Uses IF_SD, too?

> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index 4fdb153e4d8..70fb444bbd9 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -280,7 +280,6 @@ static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
>       mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
>       mc->default_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
>       mc->default_ram_id = "ddr-ram";
> -    mc->auto_create_sdcard = true;
>   
>       machine_add_audiodev_property(mc);
>       object_class_property_add_bool(oc, "secure", zcu102_get_secure,

dito ?

  Thomas

