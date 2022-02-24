Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp994738lfq;
        Thu, 24 Feb 2022 07:01:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqeqW1clwKxC2rTd4zqvbrVCZr/Iy/ESPblorsNeYfc9rsXGVI76+g1ANo1k1pnkI1Ivnh
X-Received: by 2002:a37:a64e:0:b0:46d:93fe:c383 with SMTP id p75-20020a37a64e000000b0046d93fec383mr1848677qke.442.1645714876631;
        Thu, 24 Feb 2022 07:01:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645714876; cv=none;
        d=google.com; s=arc-20160816;
        b=Wb3lPlkaswyHAsk9VfVtQQaWToTxBK2iKpvJeMgybQhKweq/SYt9CEklOR4KYXB+mR
         cn+7G6p+jKlFxjVAvQwyReXxvcL5+yYfqJTh19RatGvHNY0AK0S+rcUt/7D6gQbrjA+j
         nSZUQ2gz8KOHBshKs1RIhoOPgoGB6LPEwgLg4GLQJ9Fco9yBzWH1fsvXcSBLFdkPaaOv
         IcxTF0HDYlviPUlWRwJnzS56DjJpfSlaoI3lZ8TpUENT8F8GhfTdlgtIKhPHzd3jr3dl
         x5z8w+asOgipEamgf1zBmTB6H1bFbT+OAHMlqx3tanAQbF/c2mFJnJM7NjOrbK/EUz+j
         f52Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=03N28jHQ46fEPh4xWfL9UL8XyFGWHbWPwqvyqcTEH38=;
        b=D30rsTt1geIdmsNf2BXZfcSJUkE7uJFNV1XrWQ5Z4NZMEjcWHKMq6he4BEQK5yT/rx
         pSNJ3pH6aavMJm3XJiAbRbSYmqXWHhGyyLdFXaYqL0Gd+6zTXRMa0GhGXJiC51RFCV4y
         9DgCfc5RUm0WpV6exa2VUbUSGRXdy5E0czqNxrblYpUuz0VOqdqhlNaCgdE54kyt2r+3
         HinRT7505Z98E2gJDgDNcs4owtP4R9/wZapPV9PqNYZeIiE9Jk/TWuEvNQOwim9awQz4
         QcvEk6jHH9OM/A7deQTK5CY9kNE7nAUgCdX2g5X+1RuMXXiM9y3NXzHvrsAbG1Ps7eZ7
         0adw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=PPWc2N8S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y190si1273357qkb.47.2022.02.24.07.01.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Feb 2022 07:01:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=PPWc2N8S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nNFcJ-0007lx-De
	for alex.bennee@linaro.org; Thu, 24 Feb 2022 10:01:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNFbj-0007jp-IH; Thu, 24 Feb 2022 10:00:39 -0500
Received: from [2607:f8b0:4864:20::32f] (port=36355
 helo=mail-ot1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNFbg-0000z8-Od; Thu, 24 Feb 2022 10:00:38 -0500
Received: by mail-ot1-x32f.google.com with SMTP id
 w3-20020a056830060300b005ad10e3becaso1437669oti.3; 
 Thu, 24 Feb 2022 07:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=03N28jHQ46fEPh4xWfL9UL8XyFGWHbWPwqvyqcTEH38=;
 b=PPWc2N8S2WJSct1gnltouwactNH8cTC6yiPHh+TgH/yTP2tdXqajpWkegfekenZ+wP
 XAcYhGkB48jdov2XMlAOlD4KWxuwYL4Q1vPaTBiH3VOhVkDZlPN4NqsIaT72HdVGrxEF
 vNXCQnheogyQ8LyNL575qZPjvipe68z/xqmrvBcvPMyj9sL2/BwTfCKStDcNvyj2S3Ru
 kLhv8PRxiYX1c9iqVoLXYCvz8s/BfgDH3aWzifZ7Jv89LdcwOCOHtsMgy9237A4DYqBG
 ERpVsFvyJbr6822zgVGJ63yUoIRNL+UngWU9d3ryjB78orq3l7j5+FAMxxhiH2qYCeo1
 /IwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=03N28jHQ46fEPh4xWfL9UL8XyFGWHbWPwqvyqcTEH38=;
 b=d/tF3Mjq07ouH/gune9nBrnKa05/7BWnpjNDO/b6J67SXSmq5MnrrWaQgjnt73tPqV
 DjFAwCVdqyahqpYSgaZoZUypzkEO+iIVg+laksI8VHXFdgSKtK6TYY1ZPTTbdyfhVS1Y
 mj1QiwWNC1gC1/WgT7cwe9smUn9tdBSJWFcbd7jPYrOplsd2+Ady5jVqCW9LupUbEkyZ
 0WDnwU/tI6dn8n6hwLTzAd8b7P8m1VGb2ylkiYrMB8RTnWJRvsw6tAszPA9nsyAQ2PPr
 YxJQOLaJLeU5h5AIL6jq5WIoz3RiawFpSMbpfx9neN7EIVnUbVbdAwyb5UkoUI9M5l61
 3JnA==
X-Gm-Message-State: AOAM530xbyX/fqSLUpZDFxkeL/vMwEBXPuuf1gOj0OJdX+lDOXTh5Fg5
 o4qkdAvuQz2Cjpr8Hzs1Y2xhpwWHZEbLGoqtAVw=
X-Received: by 2002:a05:6830:2908:b0:5ad:1ed7:70ea with SMTP id
 z8-20020a056830290800b005ad1ed770eamr1034270otu.186.1645714834339; Thu, 24
 Feb 2022 07:00:34 -0800 (PST)
MIME-Version: 1.0
References: <20220224134655.1207865-1-peter.maydell@linaro.org>
In-Reply-To: <20220224134655.1207865-1-peter.maydell@linaro.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Fri, 25 Feb 2022 00:00:23 +0900
Message-ID: <CAMVc7JVOvgeYU-1hZn9Mcm86oPi=t8+BiSUfRj2QsXMQsUM4yQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Report KVM's actual PSCI version to guest in
 dtb
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001, FREEMAIL_REPLY=1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-arm@nongnu.org, qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XTQGpiZJr3U7

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>

On Thu, Feb 24, 2022 at 10:46 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> When we're using KVM, the PSCI implementation is provided by the
> kernel, but QEMU has to tell the guest about it via the device tree.
> Currently we look at the KVM_CAP_ARM_PSCI_0_2 capability to determine
> if the kernel is providing at least PSCI 0.2, but if the kernel
> provides a newer version than that we will still only tell the guest
> it has PSCI 0.2.  (This is fairly harmless; it just means the guest
> won't use newer parts of the PSCI API.)
>
> The kernel exposes the specific PSCI version it is implementing via
> the ONE_REG API; use this to report in the dtb that the PSCI
> implementation is 1.0-compatible if appropriate.  (The device tree
> binding currently only distinguishes "pre-0.2", "0.2-compatible" and
> "1.0-compatible".)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Based-on: 20220213035753.34577-1-akihiko.odaki@gmail.com
> ("[PATCH v2] target/arm: Support PSCI 1.1 and SMCCC 1.0")
> though note that to compile on arm hosts you'll need the
> bugfix to that patch from which I describe in a reply to it.
>
>  target/arm/kvm-consts.h |  1 +
>  hw/arm/boot.c           |  5 ++---
>  target/arm/kvm64.c      | 12 ++++++++++++
>  3 files changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/kvm-consts.h b/target/arm/kvm-consts.h
> index e770921ddc2..faacf96fdc7 100644
> --- a/target/arm/kvm-consts.h
> +++ b/target/arm/kvm-consts.h
> @@ -95,6 +95,7 @@ MISMATCH_CHECK(QEMU_PSCI_1_0_FN_PSCI_FEATURES, PSCI_1_0_FN_PSCI_FEATURES);
>
>  #define QEMU_PSCI_VERSION_0_1                     0x00001
>  #define QEMU_PSCI_VERSION_0_2                     0x00002
> +#define QEMU_PSCI_VERSION_1_0                     0x10000
>  #define QEMU_PSCI_VERSION_1_1                     0x10001
>
>  MISMATCH_CHECK(QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED, PSCI_0_2_TOS_MP);
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 0eeef94ceb5..a47f38dfc90 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -488,9 +488,8 @@ static void fdt_add_psci_node(void *fdt)
>      }
>
>      qemu_fdt_add_subnode(fdt, "/psci");
> -    if (armcpu->psci_version == QEMU_PSCI_VERSION_0_2 ||
> -        armcpu->psci_version == QEMU_PSCI_VERSION_1_1) {
> -        if (armcpu->psci_version == QEMU_PSCI_VERSION_0_2) {
> +    if (armcpu->psci_version >= QEMU_PSCI_VERSION_0_2) {
> +        if (armcpu->psci_version < QEMU_PSCI_VERSION_1_0) {
>              const char comp[] = "arm,psci-0.2\0arm,psci";
>              qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
>          } else {
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 64d48bfb19d..ccadfbbe72b 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -849,6 +849,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      uint64_t mpidr;
>      ARMCPU *cpu = ARM_CPU(cs);
>      CPUARMState *env = &cpu->env;
> +    uint64_t psciver;
>
>      if (cpu->kvm_target == QEMU_KVM_ARM_TARGET_NONE ||
>          !object_dynamic_cast(OBJECT(cpu), TYPE_AARCH64_CPU)) {
> @@ -904,6 +905,17 @@ int kvm_arch_init_vcpu(CPUState *cs)
>          }
>      }
>
> +    /*
> +     * KVM reports the exact PSCI version it is implementing via a
> +     * special sysreg. If it is present, use its contents to determine
> +     * what to report to the guest in the dtb (it is the PSCI version,
> +     * in the same 15-bits major 16-bits minor format that PSCI_VERSION
> +     * returns).
> +     */
> +    if (!kvm_get_one_reg(cs, KVM_REG_ARM_PSCI_VERSION, &psciver)) {
> +        cpu->psci_version = psciver;
> +    }
> +
>      /*
>       * When KVM is in use, PSCI is emulated in-kernel and not by qemu.
>       * Currently KVM has its own idea about MPIDR assignment, so we
> --
> 2.25.1
>
