Received: by 10.223.172.38 with SMTP id v35csp1678238wrc;
        Tue, 5 Sep 2017 10:27:07 -0700 (PDT)
X-Received: by 10.99.99.197 with SMTP id x188mr4790958pgb.421.1504632427336;
        Tue, 05 Sep 2017 10:27:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504632427; cv=none;
        d=google.com; s=arc-20160816;
        b=dpdgDQmHxp+DznrOMEO10orc+uDsvJTXtrO43lBKU05ra8XpxXX9LgvtyZJmYEzVdT
         KqqGCxYV1aOtLhZgtqgGgBnuA3Dh9XdGJOZDCqZzWHY0a66Gx/hkJuFcL7qfoUwt0aYL
         Zhwl8JPWOxdKDkUkiNgbwTtorYkVaZ5OTqvYEjQgqGYizLztgdRUabeA8JRYImb8BtTC
         bDlcRuB2Xf2Cyr4dVkdRYNrE2Jl6Udx7tBVXjvrni7HWj5DkTHULShpvELhprshD1Mfw
         OxLj7knxQwSWYoVOxA5MlTbqKANYNE0vRCXHQGbbJ6Jpq/x3progTIFBYffqI7jWpP57
         3/oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=XlYe0u9rUPY1LOR0TXN+N7mD++vIdJ2uNX8UVdr3ZUo=;
        b=nSQ+PZKGJt+toqhi615u0KN4nSEzuQZbJQprQqLnujzMR2rkw6wa7vhNXaDFSg7yWd
         l4dXQ/tiuH38jkLiLbWCTK7gTEWrdHGPvSm0K1QFruLWbZUvOdsLrEEjv9lD46+8mSxX
         ndGxd2aimdkCm+EVssBd6w0fHaf2jxwQe55HeMhNQ2MJxzLRpBEdT9ZTcBjLeGRMT15u
         N+pNiyNSep6/RyyyKMuQAicUo03xDdH0PY/yWOqMfe/6hjgMkqhmNIiVt5S6Spmlz6Jg
         a+pfDfFPrhR0qeuvq40cn2ZW8b12/pvFBj+S57bwAsHrpbIV6AlPsPiUVjE5Ri/yJMtD
         GCaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RpfkdBG1;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s13si593231pgr.309.2017.09.05.10.27.07;
        Tue, 05 Sep 2017 10:27:07 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RpfkdBG1;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752134AbdIER1F (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Tue, 5 Sep 2017 13:27:05 -0400
Received: from mail-wm0-f44.google.com ([74.125.82.44]:34984 "EHLO
        mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752089AbdIER1D (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 5 Sep 2017 13:27:03 -0400
Received: by mail-wm0-f44.google.com with SMTP id f199so1899275wme.0
        for <kvm@vger.kernel.org>; Tue, 05 Sep 2017 10:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=XlYe0u9rUPY1LOR0TXN+N7mD++vIdJ2uNX8UVdr3ZUo=;
        b=RpfkdBG1aqh28tKemWaHGlgEJwdL/FEMnJA+Przum1/H2OmZpUB+siCynrn20BTfVq
         UPKuY23iBZI6u6+rSjxXVyf6wOOJyrDSgJMttsuPTvDo5A3dDsGb1Ptn24zcW8fit7zg
         9wSEWCL3AKUPfgvvAfey1pMDN1dJPtKNWRKNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=XlYe0u9rUPY1LOR0TXN+N7mD++vIdJ2uNX8UVdr3ZUo=;
        b=higC6nVMQtMkENsweov0KRw7BpPVGW78Y2AdY45Uhkoq1wd8BD69Ku3BkdgSxt2lCQ
         RLR7+f68wOYII/dQj2v0fElfU1Aft4WCf7Dz1Wm3Ez0vRJAyALhAFhf2qgFR+76URPTT
         z6WprG7blZbBwLdhGgw6a0uWY6LmCIkyyyljCHndqn7cJXzpo0sxdpY64o47iKk067t0
         /LZNrp/6s7dfPt74GuZ/RVPPMdSP1cQ6DMUEw4RVKdso96wzDWpTH1M5o8BxEMNFiLXz
         cn6059r9RsaUJEq+DGCmpiUp0xDZEJhDyNaZlM/ByP0TLFJXJ+acmbW3WwF50tR2foc9
         oA9w==
X-Gm-Message-State: AHPjjUgIQK/5DUQ3ascHDQXkbXGXDr2k9bPIsJpVEPOC9tcmpz0B4f0c
        0ySLsoZUdEF1StnpKyJugPhTdfnLNbPh
X-Google-Smtp-Source: ADKCNb4aops2Eq4i7iwgirvBaCLizSESyyX5emxEmxy1+9JdTZLN2S6a6SPOF8yFrsqEAqe8neArXXAEaMfxFVvKaDk=
X-Received: by 10.28.185.202 with SMTP id j193mr2799540wmf.130.1504632422144;
 Tue, 05 Sep 2017 10:27:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.159.68 with HTTP; Tue, 5 Sep 2017 10:26:41 -0700 (PDT)
In-Reply-To: <1503066227-18251-5-git-send-email-gengdongjiu@huawei.com>
References: <1503066227-18251-1-git-send-email-gengdongjiu@huawei.com> <1503066227-18251-5-git-send-email-gengdongjiu@huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Tue, 5 Sep 2017 18:26:41 +0100
Message-ID: <CAFEAcA9oecuzXXrdo3zZHxF3AgrDUh_NHxz-znto4GU+OoxVFw@mail.gmail.com>
Subject: Re: [PATCH v11 4/6] target-arm: kvm64: detect guest RAS EXTENSION feature
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Shannon Zhao <zhaoshenglong@huawei.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>, kvm-devel <kvm@vger.kernel.org>,
        "edk2-devel@lists.01.org" <edk2-devel@lists.01.org>,
        Christoffer Dall <christoffer.dall@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        James Morse <james.morse@arm.com>,
        Tyler Baicar <tbaicar@codeaurora.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Ingo Molnar <mingo@kernel.org>, bp@suse.de,
        shiju.jose@huawei.com, zjzhang@codeaurora.org,
        arm-mail-list <linux-arm-kernel@lists.infradead.org>,
        "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
        lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-acpi@vger.kernel.org, devel@acpica.org,
        john.garry@huawei.com, jonathan.cameron@huawei.com,
        shameerali.kolothum.thodi@huawei.com, huangdaode@hisilicon.com,
        wangzhou1@hisilicon.com, Huangshaoyu <huangshaoyu@huawei.com>,
        wuquanming <wuquanming@huawei.com>,
        Linuxarm <linuxarm@huawei.com>, zhengqiang10@huawei.com
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 4lA7y9KYidaH

On 18 August 2017 at 15:23, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> check if kvm supports guest RAS EXTENSION. if so, set
> corresponding feature bit for vcpu.
>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
>  linux-headers/linux/kvm.h | 1 +
>  target/arm/cpu.h          | 3 +++
>  target/arm/kvm64.c        | 8 ++++++++
>  3 files changed, 12 insertions(+)
>
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index 7971a4f..2aa176e 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -929,6 +929,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_PPC_SMT_POSSIBLE 147
>  #define KVM_CAP_HYPERV_SYNIC2 148
>  #define KVM_CAP_HYPERV_VP_INDEX 149
> +#define KVM_CAP_ARM_RAS_EXTENSION 150
>
>  #ifdef KVM_CAP_IRQ_ROUTING
>

Hi. Changes to linux-headers need to be done as a patch of their
own created using scripts/update-linux-headers.sh run against a
mainline kernel tree (and with a commit message that quotes the
kernel commit hash used). This ensures that we have a consistent
set of headers that don't diverge from the kernel copy.

> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index b39d64a..6b0961b 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -611,6 +611,8 @@ struct ARMCPU {
>
>      /* CPU has memory protection unit */
>      bool has_mpu;
> +    /* CPU has ras extension unit */
> +    bool has_ras_extension;
>      /* PMSAv7 MPU number of supported regions */
>      uint32_t pmsav7_dregion;
>
> @@ -1229,6 +1231,7 @@ enum arm_features {
>      ARM_FEATURE_THUMB_DSP, /* DSP insns supported in the Thumb encodings */
>      ARM_FEATURE_PMU, /* has PMU support */
>      ARM_FEATURE_VBAR, /* has cp15 VBAR */
> +    ARM_FEATURE_RAS_EXTENSION, /*has RAS extension support */

Missing space after '/*' ?

>  };
>
>  static inline int arm_feature(CPUARMState *env, int feature)
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index a16abc8..0781367 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -518,6 +518,14 @@ int kvm_arch_init_vcpu(CPUState *cs)
>          unset_feature(&env->features, ARM_FEATURE_PMU);
>      }
>
> +    if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_RAS_EXTENSION)) {
> +        cpu->has_ras_extension = true;
> +        set_feature(&env->features, ARM_FEATURE_RAS_EXTENSION);
> +    } else {
> +        cpu->has_ras_extension = false;
> +        unset_feature(&env->features, ARM_FEATURE_RAS_EXTENSION);
> +    }
> +

Shouldn't we need to also tell the kernel that we actually want
it to expose RAS to the guest? Compare the PMU code in this
function, where we set a kvm_init_features bit to do this.
(This suggests that your ABI for the kernel part of this feature
may not be correct?)

You should also not be calling set_feature() here -- if the
CPU features bit doesn't say "this CPU should have the RAS
extensions" we shouldn't create a CPU with them. Instead
you should set it in kvm_arm_get_host_cpu_features() (again,
compare the PMU code).

thanks
-- PMM
