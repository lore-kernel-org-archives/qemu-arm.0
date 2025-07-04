Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1168178dyc;
        Fri, 4 Jul 2025 05:15:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV4P+M37NjgCpv3Tqf7M17DHIZnZVQj4I3N6wL3inyz1O+FZVx1e3L48mZboSla1x8Z+TMcSszw6EHxPQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFocTViKCta6QiKD3H4vDyZvKHO1dMFXtmZYqmf1zKSeg7VA57f1YwT/rYVxDjXPUtgdma2
X-Received: by 2002:a05:6102:5111:b0:4e2:e5ec:fa09 with SMTP id ada2fe7eead31-4f2ee0acdcemr1629104137.6.1751631340746;
        Fri, 04 Jul 2025 05:15:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751631340; cv=none;
        d=google.com; s=arc-20240605;
        b=S33ki75S8FCMw4ABs7hKzoePzdun8WdbwQb8dDEh4/Tld+KCw9UZ6Is5Q7SCISw4nK
         iy6p1tOQYW1N0bLcaWr6pN08/VnTXnLzIXW8ocuOn7d0zCoGK7OhjAL/wHaenThu9Vq6
         vL6+ajtJlwIEyX/zOobCvVlEys7xTSw1NiNe72PX8Xl1z1bwoCzamm8gnM9orCdHVUrk
         hj41BGeG/OiqcFCT7xI2Yv8/owGT7wmdE+TVya6Khuik+bZOGpjRnudDitx23sEllfx4
         RhEB0fpqswBttJ1kvh37YmzVDHQj4affQ6ir945Rl3xOA5vv3R25g3O0DZ0hlf6MGAAH
         sF0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Yim1rEzPel4pu+PfAZneNAEGt32iL8SSue5oPN+mJR4=;
        fh=p97A5UMA1U7tSIJa+9Wji8NFjDJVDSMvoOJbSioHcRU=;
        b=CDipWCdYaVOH9sYWAr7kpnvm5zyiHAv8F96bRJ7KBW2cYTEVVqeoMx+zTC+go36hMM
         4yL54LT36kgUttf6lot/QB1sQQVhe+8Ksc0Jxr5WVXRVGcDCIAsItKvHmg0F37Ofaahb
         GRpgis6Svgv7dOZP2Bk+Z6jE90OvaCNcb51b6DAptwXqWGDwQf6iO4LlBe/cc4xKI0bV
         q9DJOI4o4yjS9oYrmJA1V+3ktuf140n5CXowKWAt/bSOidPznEH3G5wVRaKeryWUFmAT
         qJizXfa0HmFpmEiBTM1g+er89/1EaGNxNUwhu5FioEaekctAaDhP5OOm4M7y/jS5iA3T
         muew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D5cVoI4m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4f2ea783ea5si561542137.582.2025.07.04.05.15.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 05:15:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D5cVoI4m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXfKB-0000uN-2k; Fri, 04 Jul 2025 08:15:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXfJx-0000rb-No
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 08:15:15 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXfJq-0001fn-NB
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 08:15:12 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-70e3e0415a7so9274277b3.0
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 05:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751631302; x=1752236102; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Yim1rEzPel4pu+PfAZneNAEGt32iL8SSue5oPN+mJR4=;
 b=D5cVoI4mFgq3rON5tErx+NJAf6PLQNRw7RlPAvMFsFREmiPZizhLeS6T9SFpYBbE84
 DuiYdR2Nc6rw49QgkdGQ3Hz83ZJBIG5e/G6SmAHNgRW7VxMAA3oTGL5car3NTMBxTYqc
 2q1k2PF/a3jFzY/mCae3SAu8BbtmQwkQyBwLy6ImT6AQN0y2fP7t03dygyAZLvZtUvV3
 DLF6pdaVGYvgcKCntSX5OIVlIhXpWn2m9WKsFsaBiDQQszz9tETml//7/EzB3CcoJZ35
 4pNQQ1BEAfp3O0o2+jCjSFHRDcgNV3FXKWLNycvTUwN3zmr9OoUJyU6w8KMawp8mZ+Yl
 4uHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751631302; x=1752236102;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yim1rEzPel4pu+PfAZneNAEGt32iL8SSue5oPN+mJR4=;
 b=cuw/GlpmxmLerhxXgHK0eoBxyjmKShEZDPVxwQsz5w/oo/cRiboeeJmUWZLJXepz7l
 Ga03Gx8VYxeh2JZZD6IsiZ5xJTTwF1CW8odCWiECah8FWSwOjt5NVXiFIgTRCRno+1Jc
 Z9CfJXIRB/prMt1uaFZNh3YSQkuRD7ihIMoNZCDzYo4Pptqk2jzBKz+rch1LT+0Bxahx
 OHwisaCyE6ESy2T6/d0tmnIieuFFgtXt8nuxssnKribZEwS0/oUW2uWk9aXvhEDNl+T7
 1efm/ZL5foqqz3HlcIm9hZ/0R2V7TW2m2k/oWTCeCfLTI2xS4PPYC8Aue/9SRUYiwaNP
 i/kA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+4lxDwMf2ykPlthYqTe/K3YvxgG2PrVHbw0aTBjJ7MSVRaQRzA+MbcSSx4oCg7hiPEfsPCS8hDw==@nongnu.org
X-Gm-Message-State: AOJu0YxLkF/y86ZPEevu9+5mShtx3BhzJax/Mf5vzvo/huXmkwy46U+j
 XdXJVy2gKIPqp0n5p2XdK/JhRJglcut7Dkk1ZX18AuNamjrOwscA6186HQmUSBb8A9eY86HiTVe
 H+J+4zS3wiqPGiE+bavhdmGtUagWSUPDka2BAcBSmLQ==
X-Gm-Gg: ASbGnctEjqpyHcKBhIpi5tSwSM3g/xITYcEaeJlOZoUFnb6i9kIUyhDfoYY952S6Qnf
 Dc1vaaKpXkTNtuOsvK448umYH04CILaYLbNM2eTcLI7fPmW8sju3ApaaW7u6ZnuCS4tG51pnNLU
 NEVNgyk9Xsb9c9O+Xqs7zO0wZshO0wRpMGoabFNBBkxZ8x
X-Received: by 2002:a05:690c:4491:b0:70e:61b:afed with SMTP id
 00721157ae682-71667e2423emr33546617b3.7.1751631302462; Fri, 04 Jul 2025
 05:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250702163115.251445-1-eric.auger@redhat.com>
 <20250702163115.251445-4-eric.auger@redhat.com>
In-Reply-To: <20250702163115.251445-4-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jul 2025 13:14:50 +0100
X-Gm-Features: Ac12FXzlUZA2mdd605D54nUYuLELbwtpcCj1kcW_KBcQ-ibk8gKaJ9TVi0D6mIM
Message-ID: <CAFEAcA_4AAprfa_TV48rwbxx7ndjbFYy74ykQQ8s=Ej-nBe4EA@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] target/arm: Enable feature ARM_FEATURE_EL2 if EL2
 is supported
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 miguel.luis@oracle.com, richard.henderson@linaro.org, maz@kernel.org, 
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com, 
 hi@alyssa.is
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: KynnqCf9T28A

On Wed, 2 Jul 2025 at 17:31, Eric Auger <eric.auger@redhat.com> wrote:
>
> From: Haibo Xu <haibo.xu@linaro.org>
>
> KVM_CAP_ARM_EL2 must be supported by the cpu to enable ARM_FEATURE_EL2.
> In case the host does support NV, expose the feature.
>
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> ---
> v2 -> v3:
> - check pmu->has_el2 on kvm_arch_init_vcpu() when setting
>   KVM_ARM_VCPU_HAS_EL2 feature (Peter)
>
> v1 -> v2:
> - remove isar_feature_aa64_aa32_el2 modif in target/arm/cpu.h
>   [Richard] and use el2_supported in kvm_arch_init_vcpu
> ---
>  target/arm/kvm.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index e5708e54ae..46e5f19637 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -250,6 +250,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>       */
>      int fdarray[3];
>      bool sve_supported;
> +    bool el2_supported;
>      bool pmu_supported = false;
>      uint64_t features = 0;
>      int err;
> @@ -269,6 +270,14 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>          init.features[0] |= 1 << KVM_ARM_VCPU_SVE;
>      }
>
> +    /*
> +     * Ask for EL2 if supported.
> +     */
> +    el2_supported = kvm_arm_el2_supported();
> +    if (el2_supported) {
> +        init.features[0] |= 1 << KVM_ARM_VCPU_HAS_EL2;
> +    }
> +
>      /*
>       * Ask for Pointer Authentication if supported, so that we get
>       * the unsanitized field values for AA64ISAR1_EL1.
> @@ -422,6 +431,10 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>      features |= 1ULL << ARM_FEATURE_AARCH64;
>      features |= 1ULL << ARM_FEATURE_GENERIC_TIMER;
>
> +    if (el2_supported) {
> +        features |= 1ULL << ARM_FEATURE_EL2;
> +    }
> +
>      ahcf->features = features;
>
>      return true;
> @@ -1887,6 +1900,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
>          cpu->kvm_init_features[0] |= (1 << KVM_ARM_VCPU_PTRAUTH_ADDRESS |
>                                        1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);
>      }
> +    if (cpu->has_el2 && kvm_arm_el2_supported()) {
> +        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_HAS_EL2;
> +    }
>
>      /* Do KVM_ARM_VCPU_INIT ioctl */
>      ret = kvm_arm_vcpu_init(cpu);
> --

How does this interact with creating an aarch32 VM with
"-cpu host,aarch64=off" ?  Looking at the kernel, it will
fail vcpu_init if you ask for a vcpu with both EL1_32BIT
and HAS_EL2. I guess since the virt board will only request
HAS_EL2 if you say virtualization=on this is fine. Do we
give a sensible error message if the user tries
 -accel kvm -M virt,virtualization=on -cpu host,aarch64=off   ?

-- PMM
