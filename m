Received: by 10.25.44.15 with SMTP id s15csp540332lfs;
        Fri, 21 Jul 2017 04:26:13 -0700 (PDT)
X-Received: by 10.237.39.3 with SMTP id n3mr9315143qtd.149.1500636373669;
        Fri, 21 Jul 2017 04:26:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500636373; cv=none;
        d=google.com; s=arc-20160816;
        b=rlamQGNUT+lvUwNItXRVFlw8+zoTu1C2mYkivXveF7SlKkCnC7rksLi1ivJJuj5wfI
         uwRAfFE9RDZPeaypGgW7Yc3ekotKm6QCdwsuSH0XGKt5efMjpP2FCqfx0TtPsYtYlRCv
         LmIY9R0GJC9jzMrfhsd3Nnos79d7lHRISuBh6cyxah9Up6XHNc33weQOfDHe65fbmt89
         Td0pAtBt0yWDiBZFxCm2F9MGMwLQJDtdvlljz0JGK1EwghDIKui0o/RF14c0IzUYqJJp
         N3SMOQBcGO7IEgjmmq/CxRLNO2jVPuimJujAnAwc6/+mvOPlR5pDXaBTHdPo5wHL9jC6
         64lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=UPXbgT74ZvnXrWCO5I4x3yMJqTkFpP52NPeJlLSn0no=;
        b=xxAMaHL1Ysoi/bcOD9gEqBqXUiYuJL0qqhYGOJrFJMpOav8UOIsLnU1HSCV91tnTqj
         Nm8/uFq2WP0KSsdXg/Z0kpjbpUlRM/XFYqMh3VvslJTysnhXpXOUDYZmKsiU41jBEFPZ
         qIALaWA+aMdCkcFnIulXvCaKEtVgES4RP7IH0OdB5WJP4k/VqZZa8UuYoNQ37lrrtEee
         OzDPxfxI8YA1HliMeizYMqEygPaVPwi8Rv+/XxI2ptDsJk40NQxXWIHO96Kojb3IlKue
         ck2j4fRI/5sXeVgRe1Xfi7b+ImWxaP5ol0J+JysNcGQnU4SeYNp5tQv7xQum3p40NV2g
         GBTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=Z1cscEZR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w6si3582420qkc.463.2017.07.21.04.26.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Jul 2017 04:26:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=Z1cscEZR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42366 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dYW4R-0000Cr-0d
	for alex.bennee@linaro.org; Fri, 21 Jul 2017 07:26:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cdall@linaro.org>) id 1dYW4N-0000Cm-Tb
	for qemu-arm@nongnu.org; Fri, 21 Jul 2017 07:26:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cdall@linaro.org>) id 1dYW4I-0003ig-31
	for qemu-arm@nongnu.org; Fri, 21 Jul 2017 07:26:07 -0400
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:33001)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <cdall@linaro.org>) id 1dYW4H-0003gt-OC
	for qemu-arm@nongnu.org; Fri, 21 Jul 2017 07:26:02 -0400
Received: by mail-wm0-x231.google.com with SMTP id v139so2998070wmv.0
	for <qemu-arm@nongnu.org>; Fri, 21 Jul 2017 04:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=UPXbgT74ZvnXrWCO5I4x3yMJqTkFpP52NPeJlLSn0no=;
	b=Z1cscEZREBMhkZ+zj+/y/373jbaPmwMahXA6izijjRQbYsZ90rA/MnAuYCyUCVp6yd
	GOLSF1W8CbKQUN+ijJSXm/eC7nZP9JwtdkSX86jJW6vLdJF6NsYO5JposXEsalwR5gPc
	wS/dwDaK9Tgr4BPf4pb11wrU0yfehpAeIJ0V8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=UPXbgT74ZvnXrWCO5I4x3yMJqTkFpP52NPeJlLSn0no=;
	b=AKyqpvnGWZFbCW9cXVZHfmbKh3VS/cP2KWTlH9iVkw0q4s64qDEmXpzpJMBr2xmqqX
	pJNm+RET8x3plaLgVQljUvQqF85zMuzy2Axjj7j4sFDGP/om4BaXIRYw426jmq3cRUJN
	rXW/MiTutnzOMf3C0S3UdOQ/dJh2zv4fA7hXaP87lWyTs7wPRejUEZctSrhFB/xPIvsL
	Mmw2I2ucLy44szwDUnk9EfvPgjHNinphRhqFcZF4AnzXQlkPyzMTEGtoYP3j13/oCtOf
	NSqh4rMBHGVdn1eBqal+XlPLXNdXnBaiJa/sKN02bhZ84yyLH2FuR+lptqBV0z0kOiF6
	ZVXA==
X-Gm-Message-State: AIVw113JqIyQsELKlYs+Ia42waPtxGsTMYgexcRTUsmSIkrrtKo5KVNR
	pzZUSuE7CyUj3D5e
X-Received: by 10.80.174.99 with SMTP id c90mr5547616edd.2.1500636360369;
	Fri, 21 Jul 2017 04:26:00 -0700 (PDT)
Received: from localhost (xd93ddc2d.cust.hiper.dk. [217.61.220.45])
	by smtp.gmail.com with ESMTPSA id
	w23sm2677560edb.22.2017.07.21.04.25.59
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 21 Jul 2017 04:25:59 -0700 (PDT)
Date: Fri, 21 Jul 2017 13:25:59 +0200
From: Christoffer Dall <cdall@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20170721112559.GB16350@cbox>
References: <1500471597-2517-1-git-send-email-drjones@redhat.com>
	<1500471597-2517-3-git-send-email-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1500471597-2517-3-git-send-email-drjones@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::231
Subject: Re: [Qemu-arm] [PATCH v2 2/4] target/arm/kvm: pmu: split init and
 set-irq stages
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	agraf@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ar1JbH43pLBs

On Wed, Jul 19, 2017 at 09:39:55AM -0400, Andrew Jones wrote:
> When adding a PMU with a userspace irqchip we skip the set-irq
> stage of device creation. Split the 'create' function into two
> functions 'init' and 'set-irq' so they may be called separately.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>

Reviewed-by: Christoffer Dall <cdall@linaro.org>

> ---
>  hw/arm/virt.c        | 11 +++++++++--
>  target/arm/kvm32.c   |  8 +++++++-
>  target/arm/kvm64.c   | 52 +++++++++++++++++++++++++---------------------------
>  target/arm/kvm_arm.h | 10 ++++++++--
>  4 files changed, 49 insertions(+), 32 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ea26f0c473c2..7157a028adce 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -492,10 +492,17 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
>  
>      CPU_FOREACH(cpu) {
>          armcpu = ARM_CPU(cpu);
> -        if (!arm_feature(&armcpu->env, ARM_FEATURE_PMU) ||
> -            (kvm_enabled() && !kvm_arm_pmu_create(cpu, PPI(VIRTUAL_PMU_IRQ)))) {
> +        if (!arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
>              return;
>          }
> +        if (kvm_enabled()) {
> +            if (!kvm_arm_pmu_set_irq(cpu, PPI(VIRTUAL_PMU_IRQ))) {
> +                return;
> +            }
> +            if (!kvm_arm_pmu_init(cpu)) {
> +                return;
> +            }
> +        }
>      }
>  
>      if (vms->gic_version == 2) {
> diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
> index 069da0c5fd10..e3aab89a1a94 100644
> --- a/target/arm/kvm32.c
> +++ b/target/arm/kvm32.c
> @@ -522,7 +522,13 @@ bool kvm_arm_hw_debug_active(CPUState *cs)
>      return false;
>  }
>  
> -int kvm_arm_pmu_create(CPUState *cs, int irq)
> +int kvm_arm_pmu_set_irq(CPUState *cs, int irq)
> +{
> +    qemu_log_mask(LOG_UNIMP, "%s: not implemented\n", __func__);
> +    return 0;
> +}
> +
> +int kvm_arm_pmu_init(CPUState *cs)
>  {
>      qemu_log_mask(LOG_UNIMP, "%s: not implemented\n", __func__);
>      return 0;
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index a16abc8d129e..e26638a6fac1 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -381,46 +381,44 @@ static CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, target_ulong addr)
>      return NULL;
>  }
>  
> -static bool kvm_arm_pmu_support_ctrl(CPUState *cs, struct kvm_device_attr *attr)
> -{
> -    return kvm_vcpu_ioctl(cs, KVM_HAS_DEVICE_ATTR, attr) == 0;
> -}
> -
> -int kvm_arm_pmu_create(CPUState *cs, int irq)
> +static bool kvm_arm_pmu_set_attr(CPUState *cs, struct kvm_device_attr *attr)
>  {
>      int err;
>  
> -    struct kvm_device_attr attr = {
> -        .group = KVM_ARM_VCPU_PMU_V3_CTRL,
> -        .addr = (intptr_t)&irq,
> -        .attr = KVM_ARM_VCPU_PMU_V3_IRQ,
> -        .flags = 0,
> -    };
> -
> -    if (!kvm_arm_pmu_support_ctrl(cs, &attr)) {
> -        return 0;
> +    err = kvm_vcpu_ioctl(cs, KVM_HAS_DEVICE_ATTR, attr);
> +    if (err != 0) {
> +        return false;
>      }
>  
> -    err = kvm_vcpu_ioctl(cs, KVM_SET_DEVICE_ATTR, &attr);
> +    err = kvm_vcpu_ioctl(cs, KVM_SET_DEVICE_ATTR, attr);
>      if (err < 0) {
>          fprintf(stderr, "KVM_SET_DEVICE_ATTR failed: %s\n",
>                  strerror(-err));
>          abort();
>      }
>  
> -    attr.group = KVM_ARM_VCPU_PMU_V3_CTRL;
> -    attr.attr = KVM_ARM_VCPU_PMU_V3_INIT;
> -    attr.addr = 0;
> -    attr.flags = 0;
> +    return true;
> +}
>  
> -    err = kvm_vcpu_ioctl(cs, KVM_SET_DEVICE_ATTR, &attr);
> -    if (err < 0) {
> -        fprintf(stderr, "KVM_SET_DEVICE_ATTR failed: %s\n",
> -                strerror(-err));
> -        abort();
> -    }
> +int kvm_arm_pmu_init(CPUState *cs)
> +{
> +    struct kvm_device_attr attr = {
> +        .group = KVM_ARM_VCPU_PMU_V3_CTRL,
> +        .attr = KVM_ARM_VCPU_PMU_V3_INIT,
> +    };
> +
> +    return kvm_arm_pmu_set_attr(cs, &attr);
> +}
> +
> +int kvm_arm_pmu_set_irq(CPUState *cs, int irq)
> +{
> +    struct kvm_device_attr attr = {
> +        .group = KVM_ARM_VCPU_PMU_V3_CTRL,
> +        .addr = (intptr_t)&irq,
> +        .attr = KVM_ARM_VCPU_PMU_V3_IRQ,
> +    };
>  
> -    return 1;
> +    return kvm_arm_pmu_set_attr(cs, &attr);
>  }
>  
>  static inline void set_feature(uint64_t *features, int feature)
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 633d08828a5d..cab5ea9be55c 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -195,7 +195,8 @@ int kvm_arm_sync_mpstate_to_qemu(ARMCPU *cpu);
>  
>  int kvm_arm_vgic_probe(void);
>  
> -int kvm_arm_pmu_create(CPUState *cs, int irq);
> +int kvm_arm_pmu_set_irq(CPUState *cs, int irq);
> +int kvm_arm_pmu_init(CPUState *cs);
>  
>  #else
>  
> @@ -204,7 +205,12 @@ static inline int kvm_arm_vgic_probe(void)
>      return 0;
>  }
>  
> -static inline int kvm_arm_pmu_create(CPUState *cs, int irq)
> +static inline int kvm_arm_pmu_set_irq(CPUState *cs, int irq)
> +{
> +    return 0;
> +}
> +
> +static inline int kvm_arm_pmu_init(CPUState *cs)
>  {
>      return 0;
>  }
> -- 
> 1.8.3.1
> 
