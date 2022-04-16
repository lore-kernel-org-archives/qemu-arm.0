Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp767291lfk;
        Sat, 16 Apr 2022 11:06:23 -0700 (PDT)
X-Received: by 2002:a05:6000:1287:b0:209:16c7:16af with SMTP id f7-20020a056000128700b0020916c716afmr3160979wrx.702.1650132383328;
        Sat, 16 Apr 2022 11:06:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650132383; cv=none;
        d=google.com; s=arc-20160816;
        b=JjDt9BxZ/mXuObEBOy37sC4WfeE3zYO+Y/VRSACkKZPpugblFWB4HRNMVoRGseDYcQ
         iu3/77sA4NQvD5Js6VHwnc4B80WR+lOnE0lgq6AtylnQCSzPoZJJvmfisAu2RbHQyAV3
         seohO+xevnTsriEHHuZDPR9yqRaIlPf7Rh5By3O+KLUgZO0/Zp0z/jguExhTpgFJTobI
         0EPQlPX4WdwBTBg1+55VObw4KBktPJTUojWlAmQC7S0MAp63Y7/yH0bZ6/V96QI6rT7O
         /WadYrFFu019+CZ3UqVn5suH6uKA7ZZwwC3+elmy5OHxTKGP5ZxFbuzPnMHhnSN6zmMC
         5qsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9ub6J1wn4ONoq49UUgaAmsmUWnZrSN/WLNJuyk6FImc=;
        b=KLmwAVZLs7/tUNvmzcb5ElJUoXyNWSvXrtoWSBDbkunwkk7kFhHm7AeWOkwJ8UVnjJ
         nrmYm+oapwj33k4MlAFi8Jnxr3b2anifJInVIMVIsOpEIIvlMuS7DToR/4InCcGlE1y5
         +fanB3qBB8NUKHpTvvGVFJQ/EBFNqVkfJ1xUR2VAZmq/8TPyIuniyONoCu3+Ih8Lhl6W
         fz4yB+bhVS4olU39qDjzNNVwMjItqbwunyXGvvD+cSAevYAxAN7Fc1D0ih1b3UzgbyCw
         kPmLMmELw3Cz23y0ftTxGVSaU75cG4u7/UxLdaNJRjbiNlUcmjz5ZSVd8gmbfpF7lChv
         F6mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=U2R0Zxz1;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i19-20020a05600c401300b0038ebb68e49esor2630800wmm.15.2022.04.16.11.06.23
        (Google Transport Security);
        Sat, 16 Apr 2022 11:06:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=U2R0Zxz1;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9ub6J1wn4ONoq49UUgaAmsmUWnZrSN/WLNJuyk6FImc=;
        b=U2R0Zxz1WYUl1ard/FGnT/Fd+rnUAjlIJyxoIH/ucZV1CriJvLoWRB8n3H/SnT7f3n
         0Z6ZX0nLDFs0x/088knEo5QtVSgys+bUiaKUYY/khxtjUM2zlf2iLqTCBgvh/Ja6Fe/q
         V26OMN42Gf/N4++ZCLArylsbEaAUe2PRFJunjOzPFQu2w9A76odHaz03ya+AQPValF94
         iii+3VNr7RG/q4kAb3VdiD4g0IViq3uOYOh6JpRauAAzZnuZbsmn1FsdRcpGAKTECga5
         nEg6e+UrnfdsmZcwhr60yp2YGu7Kk1DQ0ydi58yH2XC+laY/HNW49DDUtQ+33mZxhmNN
         jxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9ub6J1wn4ONoq49UUgaAmsmUWnZrSN/WLNJuyk6FImc=;
        b=ueBuHUfSbFA3OQHEzAEzTGrDNQJBp6y2RTO/PQuR1yxhGXkgLy9DIV3B8XYZzuOFBb
         GZ9NL5f6zxrZWi3vqsytbAXNGTQIqvpYcnl7mHdAaFTC/2/j88yPxzNiE7u6hZVyh5/c
         AWbRFhB+fCrPQjqdfRTJtfCFn06Pbb5srKPrntJHUYd2NjTpnLKs4GyKeh9v4ihWnNgv
         2YRwZSlyg7MuS61yAABGu2a3x1K8L4a+V91MPi0z/YS3pwNyFUahrQmGBGd+PrqKIT0M
         lc4YSgILxQ4gEHHqgoDzWb2JCiKdcipLNZp7DnFukCUzqWm0r7fGHdKDx4ILtyi7+e9G
         SOWw==
X-Gm-Message-State: AOAM532AZw4tB/L+Q82m3JZ6r27Q2Tzpj8E7hcfx3txGDyAbfarQxJjE
	AmEbyHsSOmfstiji8O8GRtU=
X-Google-Smtp-Source: ABdhPJzogCN+FZT/fIDv+7ssQ5RECnInDSZ9pkWcrY+8LghbSCDzrUBaO1TtNcE9YAgR2j3yd8UxUg==
X-Received: by 2002:a1c:cc11:0:b0:389:e8aa:ad4b with SMTP id h17-20020a1ccc11000000b00389e8aaad4bmr3894229wmb.79.1650132383039;
        Sat, 16 Apr 2022 11:06:23 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from ?IPV6:2600:70ff:f07f:0:a0d5:a739:3557:2461? ([2600:70ff:f07f:0:a0d5:a739:3557:2461])
        by smtp.gmail.com with ESMTPSA id u16-20020a05600c441000b0038ebcbadcedsm17475732wmn.2.2022.04.16.11.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Apr 2022 11:06:22 -0700 (PDT)
Message-ID: <a4b8b72b-2465-cc15-7a18-ddaf7d3302bd@gmail.com>
Date: Sat, 16 Apr 2022 20:06:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 09/18] hw/arm/xlnx-zynqmp: convert cpu clusters to
 arm_cpus
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
Cc: mark.burton@greensocs.com, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Vijai Kumar K <vijai@behindbytes.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
 <20220330125639.201937-10-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220330125639.201937-10-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: t1CdIJJDP2JA

On 30/3/22 14:56, Damien Hedde wrote:
> qom-path of cpus are changed:
> + "apu-cluster/apu-cpu[n]" to "apu/cpu[n]"
> + "rpu-cluster/rpu-cpu[n]" to "rpu/cpu[n]"
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>   include/hw/arm/xlnx-zynqmp.h |   8 +--
>   hw/arm/xlnx-zynqmp.c         | 121 +++++++++++++----------------------
>   2 files changed, 48 insertions(+), 81 deletions(-)

>   static void xlnx_zynqmp_create_bbram(XlnxZynqMPState *s, qemu_irq *gic)
> @@ -296,7 +282,8 @@ static void xlnx_zynqmp_create_apu_ctrl(XlnxZynqMPState *s, qemu_irq *gic)
>           g_autofree gchar *name = g_strdup_printf("cpu%d", i);
>   
>           object_property_set_link(OBJECT(&s->apu_ctrl), name,
> -                                 OBJECT(&s->apu_cpu[i]), &error_abort);
> +                                 OBJECT(arm_cpus_get_cpu(&s->apu, i)),
> +                                 &error_abort);
>       }

Possible further improvement, XlnxZynqMPAPUCtrl can now take a link to
one ArmCpusGroup, instead of array of ARMCPU.
