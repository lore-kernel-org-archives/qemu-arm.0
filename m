Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2817531lfg;
        Tue, 9 Mar 2021 05:41:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyftjuryF1zxuDlC8Jc3ivt4Z5J8095PlB+GulMMYkoTQJtNxkKzjCd7T1nRGffUHNqOfLC
X-Received: by 2002:a05:6e02:1044:: with SMTP id p4mr25491626ilj.238.1615297296013;
        Tue, 09 Mar 2021 05:41:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615297296; cv=none;
        d=google.com; s=arc-20160816;
        b=vYSRxzrwA6L+vdocJwJyxHQjSpHCSwcM29S1E6+enjLOrStStyR7gZ5lPfPa4mzGCt
         ck9HVAmMR5jRKgFHGEHGJzM6IdiEvk+AhAzv4LF6z1aiGQsmoO3GUjrRH/egCa4mYtyR
         Gn21E1muivy5Fy5crKf421L7vIC4hSIQgV/MVGQvSmasatkVi1enwBwLsEbI2m+YJWPQ
         x03Nia0IizStpjVbBtMFXeH+9LxXLPktybVtagc4ofN2lJZhRf3JJWbGz43lJfYLIFOM
         Ai+8JydGBBuEsSnUDws4jpeCDhSqCQ6g5uS8tWEaAEUjWjOeqgKcgWZn89u3tU0G0fYT
         ZYHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=qBQkcGfwhLHXm6nDQxjwUtJXsBXBzz8vXhwz3xnehew=;
        b=1DfrkBbt0djkuBeVgVq0FZlAVSUpGUP2tByQbpvq6T1e5xrpWKxPQI3XQvrDmV8zac
         dn/xeq0avE/gkZTbMBvfe7uc7kvmzFpcxkfg+Bb1EVD+STrNhC0rb7a/IxVIV71x5NJZ
         UbvsKaSkYcHKfIh56LkBR9CAqR6kWyYU84nbk2QNifH3ZAQVt2N2a27SzXZHleRMkAjP
         HeakIWx4dpYxJZT04vfEGauqwwGTHwB7qTXocYICuh/TgLZwtCY9X1ACEoX5XPZPgXIO
         i4JDdi4SWRNeT5B58MFnuv2fw2GylX4+Kljg3w3VggbcoVBGH1L1uQfudihwshCsZCJb
         2SeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r11si12847159jak.108.2021.03.09.05.41.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 05:41:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJccB-00084Q-Bt
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 08:41:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lJcbo-00084E-Pp; Tue, 09 Mar 2021 08:41:12 -0500
Received: from mx2.suse.de ([195.135.220.15]:36526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lJcbk-0001Zp-E2; Tue, 09 Mar 2021 08:41:12 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2EAD7AC17;
 Tue,  9 Mar 2021 13:41:05 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] target/arm: Restrict v8M IDAU to TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210221222617.2579610-1-f4bug@amsat.org>
 <20210221222617.2579610-2-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <51ae2fad-f20e-27f2-2f7b-b7dca331dea3@suse.de>
Date: Tue, 9 Mar 2021 14:41:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210221222617.2579610-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +Yio3uw6EVjy

On 2/21/21 11:26 PM, Philippe Mathieu-Daudé wrote:
> IDAU is specific to M-profile. KVM only supports A-profile.
> Restrict this interface to TCG, as it is pointless (and
> confusing) on a KVM-only build.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


This one breaks the KVM tests hard though (most of them).

I will try to figure out why.

Ciao,

Claudio


> ---
>  target/arm/cpu.c     | 7 -------
>  target/arm/cpu_tcg.c | 8 ++++++++
>  2 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index b8bc89e71fc..a772fd4926f 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2380,12 +2380,6 @@ static const TypeInfo arm_cpu_type_info = {
>      .class_init = arm_cpu_class_init,
>  };
>  
> -static const TypeInfo idau_interface_type_info = {
> -    .name = TYPE_IDAU_INTERFACE,
> -    .parent = TYPE_INTERFACE,
> -    .class_size = sizeof(IDAUInterfaceClass),
> -};
> -
>  static void arm_cpu_register_types(void)
>  {
>      const size_t cpu_count = ARRAY_SIZE(arm_cpus);
> @@ -2399,7 +2393,6 @@ static void arm_cpu_register_types(void)
>      if (cpu_count) {
>          size_t i;
>  
> -        type_register_static(&idau_interface_type_info);
>          for (i = 0; i < cpu_count; ++i) {
>              arm_cpu_register(&arm_cpus[i]);
>          }
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> index c29b434c60d..fb07a336939 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -14,6 +14,7 @@
>  #include "hw/core/tcg-cpu-ops.h"
>  #endif /* CONFIG_TCG */
>  #include "internals.h"
> +#include "target/arm/idau.h"
>  
>  /* CPU models. These are not needed for the AArch64 linux-user build. */
>  #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
> @@ -739,10 +740,17 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
>      { .name = "pxa270-c5",   .initfn = pxa270c5_initfn },
>  };
>  
> +static const TypeInfo idau_interface_type_info = {
> +    .name = TYPE_IDAU_INTERFACE,
> +    .parent = TYPE_INTERFACE,
> +    .class_size = sizeof(IDAUInterfaceClass),
> +};
> +
>  static void arm_tcg_cpu_register_types(void)
>  {
>      size_t i;
>  
> +    type_register_static(&idau_interface_type_info);
>      for (i = 0; i < ARRAY_SIZE(arm_tcg_cpus); ++i) {
>          arm_cpu_register(&arm_tcg_cpus[i]);
>      }
> 

