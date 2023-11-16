Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3389576ejc;
        Thu, 16 Nov 2023 02:26:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXUveWgLFFBrY6FlCRF9MZ2d7cKjinQReAci3c7KJUVXuluMCRstAvBs68NNxNmXF5uFZy
X-Received: by 2002:a05:6214:21ca:b0:66d:5a3a:c5e6 with SMTP id d10-20020a05621421ca00b0066d5a3ac5e6mr1745469qvh.18.1700130387190;
        Thu, 16 Nov 2023 02:26:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700130387; cv=none;
        d=google.com; s=arc-20160816;
        b=N695/TSxyYvuvUkOcZU2h8l3HaK/KiTjPf6HJ7hhAnDX7FNxqzKX0dSrCM/SZh0FmL
         GtZqM6PlPt4RB067nZ+DmdPui+eeOFLp05rUNVN+bUdkTt0Y4nc+cPmSb7Hw3DHX/8UF
         2X+tfVLz4fQVxJh6AF0ZXtGxsnVHIVIH84e18RPEacKCi1vaGIkkpmLojqG8NtFDiWsG
         RfAWTzSXsRLiYPM3le2R15gPaBoarkgjr96bLfLW3RURJ8VRuv6VPASpnCoa1kq7ChqP
         WbYwOcAE2VIhECuttRFFLXldd6Ge9RolvRRZTomwti1QtzxQP5wLa87PM0SA4XTXz/Dv
         guqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=EBze6G/esc2Z43vv9pcKlxGNYftjBVBMYPexPUSb3Wk=;
        fh=MNy/s+eWWV9V6tfmhb2gUwit/2o7TQkLbQD1zQm6hqY=;
        b=i4qQ1b+KgdcJ8a2f8Skgsq2oKBKDUyYiywLDQed7Rs0WZcCqCHC5TF5KwdXFrQ/5kx
         rhOnLFx5LgGQsZ3U9NhcK0bIxUj40ig2gmlfAX5kxIP0YviEcjw+D1Kvih1DfW7Zm340
         iSvO+CBJf2DLrcWUfcsTNnnh1ULtgzeP3CZ4i5u2ICCeOasHkXnXZbLRpxsitIWsstdK
         z65WLFYiR9MS2rPMlCC6DnoR/o/qvVSLi5w5Cw6HX06pCzlCJIT9R+xbgh5A5aEaatIF
         rM7X8wdHIzh1NfFiD9MP0h3wANskMFG+gKN1DKWRtq13g58jPdp7YtI9wdeMgOnOiirA
         PYOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QV2D5vue;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cu14-20020a05621417ce00b006592a95dde8si10746396qvb.87.2023.11.16.02.26.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Nov 2023 02:26:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QV2D5vue;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r3ZZ7-0006Yq-Tp; Thu, 16 Nov 2023 05:25:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3ZZ4-0006Wl-IR
 for qemu-devel@nongnu.org; Thu, 16 Nov 2023 05:25:38 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3ZZ2-0004oI-P1
 for qemu-devel@nongnu.org; Thu, 16 Nov 2023 05:25:38 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40a46ea95f0so5057515e9.2
 for <qemu-devel@nongnu.org>; Thu, 16 Nov 2023 02:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700130335; x=1700735135; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EBze6G/esc2Z43vv9pcKlxGNYftjBVBMYPexPUSb3Wk=;
 b=QV2D5vueafJYS0RefYqyFYLuHX9/N0nJjKanGiv8CuMJ4BiUe71RC7omWvgwU1vuDH
 rX8XETIfeVM6dipspnLJDfizPlTAWqKyee9BlMcWcR9Sv+PqgC78BfzA4Eq42XOWHn7X
 ZCbFmsEPTo0CcfV3JpQeyDPUdWIwc/hclHGVyx5+afhYK3CcMbfziVjft1mSfAv2kThj
 FWH7VSKy/1+iGTeYbyxXGqFwpSpWwRLfdOMlKLWpTViImmb/vkSYyp/jhDInF4KcVlAI
 yaL+LKWOjXvd3sh30NEhTOU95gVUlN+oqvpPBen5Ng/09JAcLbabl/gxRoyEN7/TDkUy
 uR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700130335; x=1700735135;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EBze6G/esc2Z43vv9pcKlxGNYftjBVBMYPexPUSb3Wk=;
 b=WWYllFQ/pXTNp2XGUxVsTIMzZU4nUM+Y/nU312O6nJovI4d/iG3Tll/2hQ9CAwjnaq
 BwyXLsyJfgCubg7r+U7KuyowDsOgv7ZQzj3/0izOVB557bfxJChAqmYqv5PE9qDfE/JO
 Pj437UuIVmsUiqfXE2jMyd9jWJRwksszYciOm9lH7D7S0wLzV03BWzdFwUjMlP5xTU02
 7Li4Vc6wrk8WIyg1LBRUhEudZk8d9HIGWApWe7q4KiDQH+LH56lxBmSu0+aLPuO66d+5
 VXGGNuOxqKP++vFWGvEa585FpuuxzP7vyBIyFoUE1GbqD2UoUkKBhSjYkGUfQH4RxjvH
 /HpA==
X-Gm-Message-State: AOJu0Yz+FxzcagAm9C9X/bF1VO0srrJMPUR/25ko8U0kdddCjJiQiuPg
 DSU92twtSOC0Nx8Wa45V9GS8Sw==
X-Received: by 2002:a05:600c:4f05:b0:409:637b:88e2 with SMTP id
 l5-20020a05600c4f0500b00409637b88e2mr14151510wmq.0.1700130334759; 
 Thu, 16 Nov 2023 02:25:34 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a05600c34cf00b0040a4cc876e0sm3002870wmq.40.2023.11.16.02.25.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 02:25:34 -0800 (PST)
Message-ID: <38629155-9f2e-43b1-b8eb-e274755109fb@linaro.org>
Date: Thu, 16 Nov 2023 11:25:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/31] cpu: Add generic cpu_list()
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <20231114235628.534334-7-gshan@redhat.com>
 <80da2d00-0d96-4252-b2aa-f7859e44bece@linaro.org>
 <55922c30-be4b-459d-835b-819e1dcd2437@linaro.org>
 <ac71b101-3b61-47fa-b017-766ba55a2c8f@linaro.org>
In-Reply-To: <ac71b101-3b61-47fa-b017-766ba55a2c8f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: fsFvu3eSYYlc

On 16/11/23 11:19, Philippe Mathieu-Daudé wrote:
> On 16/11/23 08:51, Philippe Mathieu-Daudé wrote:
>> On 16/11/23 08:39, Philippe Mathieu-Daudé wrote:
>>> Hi Gavin,
>>>
>>> On 15/11/23 00:56, Gavin Shan wrote:
>>>> Add generic cpu_list() to replace the individual target's 
>>>> implementation
>>>> in the subsequent commits. Currently, there are 3 targets with no 
>>>> cpu_list()
>>>> implementation: microblaze and nios2. With this applied, those two 
>>>> targets
>>>> switch to the generic cpu_list().
>>>>
>>>> [gshan@gshan q]$ ./build/qemu-system-microblaze -cpu ?
>>>> Available CPUs:
>>>>    microblaze-cpu
>>>>
>>>> [gshan@gshan q]$ ./build/qemu-system-nios2 -cpu ?
>>>> Available CPUs:
>>>>    nios2-cpu
>>>>
>>>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>> ---
>>>>   bsd-user/main.c |  5 +----
>>>>   cpu-target.c    | 29 ++++++++++++++++++++++++++---
>>>>   2 files changed, 27 insertions(+), 7 deletions(-)
>>>
>>>
>>>> diff --git a/cpu-target.c b/cpu-target.c
>>>> index c078c0e91b..acfc654b95 100644
>>>> --- a/cpu-target.c
>>>> +++ b/cpu-target.c
>>>> @@ -24,6 +24,7 @@
>>>>   #include "hw/qdev-core.h"
>>>>   #include "hw/qdev-properties.h"
>>>>   #include "qemu/error-report.h"
>>>> +#include "qemu/qemu-print.h"
>>>>   #include "migration/vmstate.h"
>>>>   #ifdef CONFIG_USER_ONLY
>>>>   #include "qemu.h"
>>>> @@ -283,12 +284,34 @@ const char *parse_cpu_option(const char 
>>>> *cpu_option)
>>>>       return cpu_type;
>>>>   }
>>>> +#ifndef cpu_list
>>>> +static void cpu_list_entry(gpointer data, gpointer user_data)
>>>> +{
>>>> +    CPUClass *cc = CPU_CLASS(OBJECT_CLASS(data));
>>>> +    const char *typename = object_class_get_name(OBJECT_CLASS(data));
>>>> +    g_autofree char *model = cpu_model_from_type(typename);
>>>> +
>>>> +    if (cc->deprecation_note) {
>>>> +        qemu_printf("  %s (deprecated)\n", model);
>>>> +    } else {
>>>> +        qemu_printf("  %s\n", model);
> 
> Wondering how this scale to heterogeneous emulation. Should we
> display the architecture, i.e.:
> 
> -- >8 --
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 76ef59de0a..aeff182a37 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -792,6 +792,8 @@ ObjectClass *cpu_class_by_name(const char *typename, 
> const char *cpu_model);
>    */
>   char *cpu_model_from_type(const char *typename);
> 
> +char *cpu_arch_from_type(const char *typename);
> +
>   /**
>    * cpu_create:
>    * @typename: The CPU type.
> diff --git a/cpu-target.c b/cpu-target.c
> index acfc654b95..75412f902f 100644
> --- a/cpu-target.c
> +++ b/cpu-target.c
> @@ -257,6 +257,12 @@ char *cpu_model_from_type(const char *typename)
>       return g_strdup(typename);
>   }
> 
> +char *cpu_arch_from_type(const char *typename)
> +{
> +    assert(g_str_has_suffix(CPU_RESOLVING_TYPE, "-cpu"));
> +    return g_strndup(CPU_RESOLVING_TYPE, strlen(CPU_RESOLVING_TYPE) - 
> strlen("-cpu"));

Not good enough:

$ ./qemu-system-mips64el -M mps2-an500 -cpu \?
Available CPUs:
   20Kc (MIPS64)
   24Kc (MIPS64)
   24KEc (MIPS64)
   24Kf (MIPS64)
   34Kf (MIPS64)
   4Kc (MIPS64)
   4KEc (MIPS64)
   4KEcR1 (MIPS64)
   4KEm (MIPS64)
   4KEmR1 (MIPS64)
   4Km (MIPS64)
   5Kc (MIPS64)
   5KEc (MIPS64)
   5KEf (MIPS64)
   5Kf (MIPS64)

Anyhow we can't use CPU_RESOLVING_TYPE in heterogeneous context,
so we'll probably have to add the arch as a CPUClass field.

> +}
> +
>   const char *parse_cpu_option(const char *cpu_option)
>   {
>       ObjectClass *oc;
> @@ -290,12 +296,11 @@ static void cpu_list_entry(gpointer data, gpointer 
> user_data)
>       CPUClass *cc = CPU_CLASS(OBJECT_CLASS(data));
>       const char *typename = object_class_get_name(OBJECT_CLASS(data));
>       g_autofree char *model = cpu_model_from_type(typename);
> +    g_autofree char *arch = cpu_arch_from_type(typename);
> +    g_autofree char *arch_up = g_ascii_strup(arch, -1);
> 
> -    if (cc->deprecation_note) {
> -        qemu_printf("  %s (deprecated)\n", model);
> -    } else {
> -        qemu_printf("  %s\n", model);
> -    }
> +    qemu_printf("  %s (%s%s)\n", model, arch_up,
> +                cc->deprecation_note ? ", deprecated" : "");
>   }
> ---
> 
> Produces:
> 
> qemu-system-aarch64 -M mps2-an500 -cpu \?
> Available CPUs:
>    a64fx (ARM)
>    arm1026 (ARM)
>    arm1136 (ARM)
>    arm1136-r2 (ARM)
>    arm1176 (ARM)
>    arm11mpcore (ARM)
>    arm926 (ARM)
>    arm946 (ARM)
>    cortex-a15 (ARM)
>    cortex-a35 (ARM)
>    cortex-a53 (ARM)
>    cortex-a55 (ARM)
>    cortex-a57 (ARM)
>    cortex-a7 (ARM)
>    cortex-a710 (ARM)
>    cortex-a72 (ARM)
>    cortex-a76 (ARM)

