Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp86366wrq;
        Tue, 22 Oct 2019 08:46:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqySsFVDQI8dZJuQnIbMs0QFzuskbS7sZTLMo9pgxzWkzRN8JsXKzSfDRgY4fXChFidNbiMK
X-Received: by 2002:ac8:28b0:: with SMTP id i45mr4125474qti.179.1571759195130;
        Tue, 22 Oct 2019 08:46:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571759195; cv=none;
        d=google.com; s=arc-20160816;
        b=pKpvJKE+DNscnegXAXVacn88IaObNY8z2+4DX1CWU2cCpa4NROQ3/bbw8w1w+6eMF9
         0DTUjuFEGhMlHp7fyxEzmvR5YizaA+8/duwz3ljUeIIP/gpm773wTOr8iqz9PA+b1cPv
         pht5bQd2LocDDSFtkwVpHg17NO+dFkiO5IGqkNgumRIkkQs8bofKrxu6InTjJAxqUC0u
         E8Km1J/ZlEzg89vG22K8NYHLcZfxMZIn6VJBpUKAtTbrXlPqxlEToAIOs/aIi2LrK2Na
         zgUYBz9TUcxvlITQIb1LddRmFVRxKRfyiFOp0osXkBpabUFijA1cWTDa6h6kGYb4aOYA
         /EnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R1/1+7Md91Hq7JIEadkFQbLhX++CiuasU+Gk0+oBnZw=;
        b=bPMIArfb9enk8usfF5tPQAXsU0E+V4Bmf0Eml16hfAUaHbdmSRdhahMkRGMzdAapmQ
         pm4nAUyXYj6KXgAUCsAuDIdNHgUHqWZgjtT2/zbfWLmriH11dhJnF4Fhb6Xpx0/8LNlC
         H7Gf+7jbm1ZFEVSlsATMmM95NiIip7nxHKH7RrU4yjLkzl5yzgnM9Pw+RVFCQAulw4g0
         KJhoJCYFHc3HVXwrP7KOo4mWmrPeYL8mxFRIpKzr6QTex1WH/ndtjTQ9lO6gmKFRqMGy
         +oiEirj3haG7C8yoCvpwA2T7jBT2X8+AaW3elZzEJ4iKO1dbivjaWXABTyV52kNlVYrm
         WHjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ISMA6S0B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o187si12967819qkd.251.2019.10.22.08.46.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2019 08:46:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ISMA6S0B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMwMj-0002qI-Bn
	for alex.bennee@linaro.org; Tue, 22 Oct 2019 11:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59909)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <beata.michalska@linaro.org>) id 1iMwMN-0002pT-Nn
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 11:46:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <beata.michalska@linaro.org>) id 1iMwML-00021O-PQ
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 11:46:11 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:34242)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <beata.michalska@linaro.org>)
 id 1iMwML-00020Y-Ix
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 11:46:09 -0400
Received: by mail-il1-x142.google.com with SMTP id a13so1543228ilp.1
 for <qemu-arm@nongnu.org>; Tue, 22 Oct 2019 08:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R1/1+7Md91Hq7JIEadkFQbLhX++CiuasU+Gk0+oBnZw=;
 b=ISMA6S0BVgaHS1z9CzfMidhqweschHi0F8RqCgg17TjEW6Y56k2X/2TQp6LNkrCQP0
 lQpLyXVIYof2TX5Tkzwq08vHrb/2plPLsCqrpiRTKse1u0z2Eq5yohHxh3prfEMan56e
 nYfhW5wJs1pcnmDWxT3/Xmzz6gT6Dh3eJ8Pz2ec3ZzRC50r9JwoGm02Tk5azHQZivpo7
 U7XXTEsIyDgxBxcj7KMc4uEndeEQCphV4d90bVdaJnp6esLnpjj+qEPtWq8QVfsI2LOz
 1pLd7RISm77JmMIpRbWRiJ/1Du4sWAkM2bFJfg03OdcbTA4ZSD3oqbfGxxHPcTxrWEJo
 ADXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R1/1+7Md91Hq7JIEadkFQbLhX++CiuasU+Gk0+oBnZw=;
 b=J11jWJIwJYcaS8GIFCPGh+bi9zkROeWIoMOneJCp4H9M4czwLW3xMDNPGS6f4bloBg
 +X8XBmt9hnl2rfzO4refiFMK2ou/8dVIakoQRguVMOt5gblo5laDtlzefNu/qSo8/u6L
 H4844U7dfD+vBKOBIULvabtqJiJTlAHuOz0dDGsBDGUhZBhR2kdPFrYE+j/YfKhjQoef
 89IU4ft7DM/qihqFvLrHO/mf1H/z4TUlPgKoSDlm/F6E6ifVKnZcXVqozZuFEE8xSWIG
 /SIVrvUcniHbISX/A4Kk4b10HQSUtX4qzr5BIYBJqM+yRV4HQSOA4Lh4Dce9iuZoHddt
 a9zg==
X-Gm-Message-State: APjAAAVHWl9KDUmg0bdD16YN1W0erMv2RNDUuc5yzRN2ZZCQAuooIz/z
 1NfUzQ6BxOySjkfzV91GEBcRIjfFkT9/r3Y2ZwDWjQ==
X-Received: by 2002:a92:2406:: with SMTP id k6mr34342536ilk.260.1571759168185; 
 Tue, 22 Oct 2019 08:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20191016085408.24360-1-drjones@redhat.com>
 <20191016085408.24360-8-drjones@redhat.com>
In-Reply-To: <20191016085408.24360-8-drjones@redhat.com>
From: Beata Michalska <beata.michalska@linaro.org>
Date: Tue, 22 Oct 2019 16:45:57 +0100
Message-ID: <CADSWDztWryn0uPwEo+Kd6JvF-NOGomt1CYu7N-+VYva-v817nw@mail.gmail.com>
Subject: Re: [PATCH v6 7/9] target/arm/kvm: scratch vcpu: Preserve input
 kvm_vcpu_init features
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::142
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 armbru@redhat.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 imammedo@redhat.com, eblake@redhat.com, Dave.Martin@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gdoIzyHleL1h

HI Andrew

On Wed, 16 Oct 2019 at 09:57, Andrew Jones <drjones@redhat.com> wrote:
>
> kvm_arm_create_scratch_host_vcpu() takes a struct kvm_vcpu_init
> parameter. Rather than just using it as an output parameter to
> pass back the preferred target, use it also as an input parameter,
> allowing a caller to pass a selected target if they wish and to
> also pass cpu features. If the caller doesn't want to select a
> target they can pass -1 for the target which indicates they want
> to use the preferred target and have it passed back like before.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Beata Michalska <beata.michalska@linaro.org>

Thanks

BR
Beata
> ---
>  target/arm/kvm.c   | 20 +++++++++++++++-----
>  target/arm/kvm32.c |  6 +++++-
>  target/arm/kvm64.c |  6 +++++-
>  3 files changed, 25 insertions(+), 7 deletions(-)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index f07332bbda30..5b82cefef608 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -66,7 +66,7 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>                                        int *fdarray,
>                                        struct kvm_vcpu_init *init)
>  {
> -    int ret, kvmfd = -1, vmfd = -1, cpufd = -1;
> +    int ret = 0, kvmfd = -1, vmfd = -1, cpufd = -1;
>
>      kvmfd = qemu_open("/dev/kvm", O_RDWR);
>      if (kvmfd < 0) {
> @@ -86,7 +86,14 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>          goto finish;
>      }
>
> -    ret = ioctl(vmfd, KVM_ARM_PREFERRED_TARGET, init);
> +    if (init->target == -1) {
> +        struct kvm_vcpu_init preferred;
> +
> +        ret = ioctl(vmfd, KVM_ARM_PREFERRED_TARGET, &preferred);
> +        if (!ret) {
> +            init->target = preferred.target;
> +        }
> +    }
>      if (ret >= 0) {
>          ret = ioctl(cpufd, KVM_ARM_VCPU_INIT, init);
>          if (ret < 0) {
> @@ -98,10 +105,12 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>           * creating one kind of guest CPU which is its preferred
>           * CPU type.
>           */
> +        struct kvm_vcpu_init try;
> +
>          while (*cpus_to_try != QEMU_KVM_ARM_TARGET_NONE) {
> -            init->target = *cpus_to_try++;
> -            memset(init->features, 0, sizeof(init->features));
> -            ret = ioctl(cpufd, KVM_ARM_VCPU_INIT, init);
> +            try.target = *cpus_to_try++;
> +            memcpy(try.features, init->features, sizeof(init->features));
> +            ret = ioctl(cpufd, KVM_ARM_VCPU_INIT, &try);
>              if (ret >= 0) {
>                  break;
>              }
> @@ -109,6 +118,7 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>          if (ret < 0) {
>              goto err;
>          }
> +        init->target = try.target;
>      } else {
>          /* Treat a NULL cpus_to_try argument the same as an empty
>           * list, which means we will fail the call since this must
> diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
> index 2451a2d4bbef..32bf8d6757c4 100644
> --- a/target/arm/kvm32.c
> +++ b/target/arm/kvm32.c
> @@ -53,7 +53,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>          QEMU_KVM_ARM_TARGET_CORTEX_A15,
>          QEMU_KVM_ARM_TARGET_NONE
>      };
> -    struct kvm_vcpu_init init;
> +    /*
> +     * target = -1 informs kvm_arm_create_scratch_host_vcpu()
> +     * to use the preferred target
> +     */
> +    struct kvm_vcpu_init init = { .target = -1, };
>
>      if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
>          return false;
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 850da1b5e6aa..c7ecefbed720 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -502,7 +502,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>          KVM_ARM_TARGET_CORTEX_A57,
>          QEMU_KVM_ARM_TARGET_NONE
>      };
> -    struct kvm_vcpu_init init;
> +    /*
> +     * target = -1 informs kvm_arm_create_scratch_host_vcpu()
> +     * to use the preferred target
> +     */
> +    struct kvm_vcpu_init init = { .target = -1, };
>
>      if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
>          return false;
> --
> 2.21.0
>
>
