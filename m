Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1367624ejx;
        Thu, 17 Nov 2022 07:54:30 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4A+Bg/7AK0scSM3ouU55BGLXMlit/VAidKaFapF6RvZ1aU6buJdpcXHywgzVxekAWM9sAv
X-Received: by 2002:a0c:e30e:0:b0:4bc:16b3:6a85 with SMTP id s14-20020a0ce30e000000b004bc16b36a85mr2849484qvl.129.1668700469859;
        Thu, 17 Nov 2022 07:54:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668700469; cv=none;
        d=google.com; s=arc-20160816;
        b=0VECJCc6LDOyBTNbZwrcquLMPrRCCjxULm4GCN5o3QFG1isYD3RxmWmGHfZdBbtXF4
         7B9vmXTW2g2LN2xo3tyKdUp76Xh3yz/u8kr/0iHQIB674S9D39OmNt5tvtsfVX1RxipV
         vJ5ilvKMVLsq/yOpjizL3pqhTNAd+ZwDKKv5Ea9ICUSduB6QT8CwW8kCj+kZ+mX8rz1Z
         emFko1sNzEH6p3SyyBJmz9W1WUE0BfW0hadbHU2arfE+lyhaz1hVAmdm6HEn/9l+yurE
         ljq7dTzpiBrZAo2B4BmYdU3QeB/PS109zlM2rkga59we6sya9hRXlw9eny73U+76kyVi
         pdpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=rgWdVFzuKo1NHFHh7xaRXaVW9h6FdB/k8sMtVSECDEA=;
        b=Q8WOT/xfU2qJgAAYwkUlEbT1YExjuZdxu9l+IEkvRdjeNjlHcejcremUnb+muIFtl3
         9J0Ow3I5Q+q/xFZVKhrzz2z0BSKpQ9mi5GLzoJi8nFC2P4M29nxbIelpm2YxTzVhmK5J
         jXdUa/DTstWMrLWM+ws6o/+qCKkefMH7j03BCoycdys/dzyOzsNgm9uiyfDJ/szKCiEi
         VjkUYjcoLfUui6dYmI0hU5KXRoPr8xAfzcS2jvR5wV640uqtXAK5BeOfm7fNPp+WD3Xm
         kdOL/a3dRfc7Y6CN2ghdOve1XiYwD60aCXMtKJ2IBr15kkBS60KEHQzxMB4mt9DwBO/v
         5K0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CTYobnxJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x30-20020a05620a0b5e00b006ec5f9983a0si487313qkg.398.2022.11.17.07.54.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Nov 2022 07:54:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CTYobnxJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ovhDJ-0005NW-Vo; Thu, 17 Nov 2022 10:54:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ovhDI-0005Mu-QT
 for qemu-arm@nongnu.org; Thu, 17 Nov 2022 10:54:04 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ovhDH-0003WI-2e
 for qemu-arm@nongnu.org; Thu, 17 Nov 2022 10:54:04 -0500
Received: by mail-pl1-x634.google.com with SMTP id p21so1990547plr.7
 for <qemu-arm@nongnu.org>; Thu, 17 Nov 2022 07:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rgWdVFzuKo1NHFHh7xaRXaVW9h6FdB/k8sMtVSECDEA=;
 b=CTYobnxJYzxjwWigJpC+1MGSNZE47hTZT7Ynb7Pwyyx1h6hERucNM/RGOSHmCeFZMX
 dpWAkZ4YFT1SigXdg3Hj5ILbVcC0VwlE7SBzCShKsexUN9luvOUfzlyk1u9zY0SLmmvs
 NssmhS25dpgmqOiXyCdNvuT9SpkUzFOMFWqPmLPRlljMdGsbJLvMXFB5Y7CE3aKAi329
 5cSJOFwvlRHg3s9sddOGaobDwgtgmr+0FcbDNsyE4fipwyq7fp7lTTVnjd5UqwKgaRUW
 pDj7bd/sIud76jUrs9hpzqk9MZDFH7138J+GGFrEOyFGu91S7Y/hGc48Wm4oTQg7LwKY
 WwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rgWdVFzuKo1NHFHh7xaRXaVW9h6FdB/k8sMtVSECDEA=;
 b=DDaKgMmNmOBu9g3cLoaajHxDYqK/Pc+dvvEauo8oshBWZdCF9qBrd8h3hMbrw7VKam
 roOnshc2F7FFFV48eD8Q9NXO1imSm+s1ef+qNAKKu81ZsZuakJFckGqzWlG5te2cvkUq
 HgbFrYVzs1moCEOZUFo5HqopsB6kenqxTFAq23DKld9B097ReMiG/rs2KpxmPb8Oyw+O
 rFuC5FIP0p0QQEPXqQM6JzL4MP0Yky44w0qqafo/khQTeZdAjxIGJvvRKL7gke20VL6j
 hmO1lHbW48/pJn/hUZAF5lUqdSokx+kkj24UrPsxMrXoQtaAksK7BDS1+/PaJ1MppL/2
 U/pA==
X-Gm-Message-State: ANoB5pk5HXeHjF+1mvN6XA+S3xb5A0Ktauo/9NXQ0+1QCDDn/YizA6k5
 933yPxrPL5QZzKKtEdsDEyqqurPeDJIRSdQXtsRWDw==
X-Received: by 2002:a17:902:b18a:b0:188:5240:50ec with SMTP id
 s10-20020a170902b18a00b00188524050ecmr3187221plr.168.1668700441422; Thu, 17
 Nov 2022 07:54:01 -0800 (PST)
MIME-Version: 1.0
References: <20221110090444.550362-1-tkutergin@gmail.com>
In-Reply-To: <20221110090444.550362-1-tkutergin@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Nov 2022 15:53:49 +0000
Message-ID: <CAFEAcA9yitrE0n1b4Q1_=VaZH-RF0bVPUSTihOKhOFCTidARXg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: added cortex-a55 CPU support for qemu-virt
To: Timofey Kutergin <tkutergin@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: GFlTKXrCN+gn

On Thu, 10 Nov 2022 at 09:04, Timofey Kutergin <tkutergin@gmail.com> wrote:
>
>   cortex-a55 is one of newer armv8.2+ CPUs supporting native
>   Privileged Access Never (PAN) feature.

Hi; thanks for this patch. There are a few missing ID register
values below, but otherwise it looks good.

> Using this CPU
>   provides access to this feature without using fictious "max"

"fictitious"

>   CPU.
>
> Signed-off-by: Timofey Kutergin <tkutergin@gmail.com>
> ---
>  hw/arm/virt.c      |  1 +
>  target/arm/cpu64.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 56 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b871350856..fc0c9baba6 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -201,6 +201,7 @@ static const char *valid_cpus[] = {
>      ARM_CPU_TYPE_NAME("cortex-a15"),
>      ARM_CPU_TYPE_NAME("cortex-a35"),
>      ARM_CPU_TYPE_NAME("cortex-a53"),
> +    ARM_CPU_TYPE_NAME("cortex-a55"),
>      ARM_CPU_TYPE_NAME("cortex-a57"),
>      ARM_CPU_TYPE_NAME("cortex-a72"),
>      ARM_CPU_TYPE_NAME("cortex-a76"),

There's a corresponding list of supported CPUs in
docs/system/arm/virt.rst that also needs the new CPU type adding.

> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 3d74f134f5..e1ade1b2a3 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -792,6 +792,60 @@ static void aarch64_a53_initfn(Object *obj)
>      define_cortex_a72_a57_a53_cp_reginfo(cpu);
>  }
>
> +static void aarch64_a55_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    cpu->dtb_compatible = "arm,cortex-a55";
> +    set_feature(&cpu->env, ARM_FEATURE_V8);
> +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> +    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
> +    set_feature(&cpu->env, ARM_FEATURE_EL2);
> +    set_feature(&cpu->env, ARM_FEATURE_EL3);
> +    set_feature(&cpu->env, ARM_FEATURE_PMU);

It's helpful for review to order the ID register values in
the same layout they are in the TRM, in the "AArch64 registers
by functional group" table, which is how we've ordered other
new CPUs we've added recently (eg see the Neoverse N1 or
the Cortex-A76).

> +    cpu->midr = 0x411fd050;

There's an r2p0 TRM out, so we might as well advertise
ourselves as r2p0:  0x412FD050

> +    cpu->revidr = 0x00000000;
> +    cpu->reset_fpsid = 0x41034070;
> +    cpu->isar.mvfr0 = 0x10110222;
> +    cpu->isar.mvfr1 = 0x13211111;
> +    cpu->isar.mvfr2 = 0x00000043;
> +    cpu->ctr = 0x84448004; /* L1Ip = VIPT */
> +    cpu->reset_sctlr = 0x00c50838;

Should be 0x30c50838 : bits [29:28] are RES1

> +    cpu->isar.id_pfr0 = 0x10000131;
> +    cpu->isar.id_pfr1 = 0x00011011;

Forgotten id_pfr2: 0x00000011

> +    cpu->isar.id_dfr0 = 0x04010088;
> +    cpu->id_afr0 = 0x00000000;
> +    cpu->isar.id_mmfr0 = 0x10201105;
> +    cpu->isar.id_mmfr1 = 0x40000000;
> +    cpu->isar.id_mmfr2 = 0x01260000;
> +    cpu->isar.id_mmfr3 = 0x02122211;

You've forgotten id_mmfr4 : 0x00021110

> +    cpu->isar.id_isar0 = 0x02101110;
> +    cpu->isar.id_isar1 = 0x13112111;
> +    cpu->isar.id_isar2 = 0x21232042;
> +    cpu->isar.id_isar3 = 0x01112131;
> +    cpu->isar.id_isar4 = 0x00011142;
> +    cpu->isar.id_isar5 = 0x01011121;
> +    cpu->isar.id_isar6 = 0x00000010;
> +    cpu->isar.id_aa64pfr0 = 0x10112222;

You've missed out id_aa64pfr1 : should be 0x0000000000000010ull

> +    cpu->isar.id_aa64dfr0 = 0x10305408;
> +    cpu->isar.id_aa64isar0 = 0x10211120;

You've missed out the DP field: this should be
0x0000100010211120ull

> +    cpu->isar.id_aa64isar1 = 0x00100001;
> +    cpu->isar.id_aa64mmfr0 = 0x00101122;
> +    cpu->isar.id_aa64mmfr1 = 0x10212122;
> +    cpu->isar.id_aa64mmfr2 = 0x00001011;
> +    cpu->isar.dbgdidr = 0x3516d000;
> +    cpu->clidr = 0x82000023;
> +    cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
> +    cpu->ccsidr[1] = 0x200fe01a; /* 32KB L1 icache */
> +    cpu->ccsidr[2] = 0x703fe07a; /* 512KB L2 cache */

The A55 TRM says that it has an L3 cache, so I think we
also need to fill in cpu->ccsidr[4] here (NB not [3], which
is a reserved index since the L2 is not split I&D).

> +    cpu->dcz_blocksize = 4; /* 64 bytes */
> +    cpu->gic_num_lrs = 4;
> +    cpu->gic_vpribits = 5;
> +    cpu->gic_vprebits = 5;

You need to set gic_pribits also.

Missing reset_pmcr_el0: 0x41453000

The impdef sysregs are different from A53/A57/A72 etc,
so it's correct that we don't call
define_cortex_a72_a57_a53_cp_reginfo(). We can add definitions
of the impdef sysregs later if guest software runs into them
I guess...

thanks
-- PMM
