Received: by 10.25.44.15 with SMTP id s15csp542270lfs;
        Fri, 21 Jul 2017 04:28:24 -0700 (PDT)
X-Received: by 10.200.8.20 with SMTP id u20mr8749927qth.4.1500636504841;
        Fri, 21 Jul 2017 04:28:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500636504; cv=none;
        d=google.com; s=arc-20160816;
        b=v6T47Ygkz89czxOesUpgGxpPfgCjvXNwpZYmCwveUAOIC8blo0JZYeO5G+0e3pInj4
         QlsEP6Bu4i41zXOxLMXW7a6nXYbF7RdAekGxUpGm8+fXAfSiahGtnkpiMojhPQw/SLlB
         4h9I3s2pHXzx3xfYCBkf8JwCvnVO6BCXgNIn1gPwmGa1SRAdHXsY39CZop5xV3pAk/q8
         zA98qQSslDSYgduhQSI2b4cuRDTWwLMP2W7GqzqVYYXHsYHTg/pKPSgKD9zw5rrFC6IS
         rvJHnW0CHDPJ9oU61Z4VYKDP/d9+SEScpsbxAYIz4ggTGp2s8bKDZmpCSpRbtXZkoB9E
         o1aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=d+BjqNqznO6xPmHgGMBI9na2kcqb4TOBmZaj97X7Jfg=;
        b=yfuB+hORdaZMxxcvyqJcfSEZ/VNOpcUzWKSdaCqcCfbrG9TbgxqfMIVx7r+CJtVbgb
         zZqepvOKUrjmpY7VK9N1l2DEXxNP1dTCmHsS4uDN0tv8uVnm5hoAg+2r8H1+9tu1NkeS
         Ykv2aMeVDAfSCHWtgykbCS9ewIfbrEldxmJIi21z093ka7yIbuOlglNCvwVVT3X+Ujaw
         nO0uOeIAgyOE5OKrYbkAJ/K1vpSbQ1Bc10GTFtVJZ2wnZA0feN2C2jSLMIlwwShQMy3/
         UbyI5jDkcbWKQngDro6puhmQyUtRZTM7IYISX8a75mWIpubp4RfZxSSt9R4t7t4SsS9f
         jmig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=FH9HVkNW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k129si3535819qkc.509.2017.07.21.04.28.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Jul 2017 04:28:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=FH9HVkNW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42370 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dYW6Y-0000pa-6T
	for alex.bennee@linaro.org; Fri, 21 Jul 2017 07:28:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cdall@linaro.org>) id 1dYW6T-0000oh-H5
	for qemu-arm@nongnu.org; Fri, 21 Jul 2017 07:28:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cdall@linaro.org>) id 1dYW6O-0005Df-Fg
	for qemu-arm@nongnu.org; Fri, 21 Jul 2017 07:28:17 -0400
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:38053)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <cdall@linaro.org>) id 1dYW6O-0005Cz-96
	for qemu-arm@nongnu.org; Fri, 21 Jul 2017 07:28:12 -0400
Received: by mail-wm0-x22a.google.com with SMTP id w191so11415902wmw.1
	for <qemu-arm@nongnu.org>; Fri, 21 Jul 2017 04:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=d+BjqNqznO6xPmHgGMBI9na2kcqb4TOBmZaj97X7Jfg=;
	b=FH9HVkNWD5g3fVOjmcCCdPayAITLdIcjij8sL2kpPhQet4blQZYitdGpACgRnCH8Om
	5VnCe/CqyzEc469UO5A+aLewMf3LOY+XuAqA8Fm0BBXEPX76CTgBHHIynenu/LJmGWk5
	U8BJDCDeWiNHzc4BMBexUna+opHoQPUsaQKSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=d+BjqNqznO6xPmHgGMBI9na2kcqb4TOBmZaj97X7Jfg=;
	b=kD0M35OjPR+aJkOsbmji4tLfG5O4venVMDfjcWhF9ufJa2LlTGbsc9KSQcJSvt60EM
	Guq6S/SU7g0NGsHQoBLMAYez+PLj0T0a8lAPfaIvdpQe90HILRPuFtcwZzAt0hvCb6xv
	2jqo5+cN3gUfY9Rzl4SQeA0P9ZA8t30DHqVE1qJwCWrmMlZsyOYn/AHd5BR//70PER7+
	5QqmO+rWd9goJSQIhZTYgHtpAmUQEznf1rZ8UO++UHktwezajH/y5eUrHwQVhRN6lKpy
	VfSJDoHfuT0zFUHdq2uV6iwuokkQWqbAn05RGgJBZYIB1GXVLxp1taxY6rSJxCGYN2R8
	WwDA==
X-Gm-Message-State: AIVw113b56Py9vK8Oha7l9gE1hbbBTE+V3qUJCznngbgPTqcZ/EL0Q3l
	tI4+gGD4UMWU5qxx
X-Received: by 10.80.160.198 with SMTP id 64mr5634663edo.177.1500636491195;
	Fri, 21 Jul 2017 04:28:11 -0700 (PDT)
Received: from localhost (xd93ddc2d.cust.hiper.dk. [217.61.220.45])
	by smtp.gmail.com with ESMTPSA id k14sm390818edj.24.2017.07.21.04.28.10
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 21 Jul 2017 04:28:10 -0700 (PDT)
Date: Fri, 21 Jul 2017 13:28:10 +0200
From: Christoffer Dall <cdall@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20170721112810.GC16350@cbox>
References: <1500471597-2517-1-git-send-email-drjones@redhat.com>
	<1500471597-2517-4-git-send-email-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1500471597-2517-4-git-send-email-drjones@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22a
Subject: Re: [Qemu-arm] [PATCH v2 3/4] hw/arm/virt: allow pmu instantiation
 with userspace irqchip
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
X-TUID: idVHxurdDSgO

On Wed, Jul 19, 2017 at 09:39:56AM -0400, Andrew Jones wrote:
> Move the in-kernel-irqchip test to only guard the set-irq
> stage, not the init stage of the PMU.  Also add the PMU to
> the KVM device irq line synchronization to enable its use.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>

Reviewed-by: Christoffer Dall <cdall@linaro.org>

> ---
>  hw/arm/virt.c      | 3 ++-
>  target/arm/kvm.c   | 6 +++++-
>  target/arm/kvm64.c | 3 +--
>  3 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7157a028adce..a215330444da 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -496,7 +496,8 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
>              return;
>          }
>          if (kvm_enabled()) {
> -            if (!kvm_arm_pmu_set_irq(cpu, PPI(VIRTUAL_PMU_IRQ))) {
> +            if (kvm_irqchip_in_kernel() &&
> +                !kvm_arm_pmu_set_irq(cpu, PPI(VIRTUAL_PMU_IRQ))) {
>                  return;
>              }
>              if (!kvm_arm_pmu_init(cpu)) {
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 7c17f0d629d7..211a7bf7befd 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -567,7 +567,11 @@ MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
>              switched_level &= ~KVM_ARM_DEV_EL1_PTIMER;
>          }
>  
> -        /* XXX PMU IRQ is missing */
> +        if (switched_level & KVM_ARM_DEV_PMU) {
> +            qemu_set_irq(cpu->pmu_interrupt,
> +                         !!(run->s.regs.device_irq_level & KVM_ARM_DEV_PMU));
> +            switched_level &= ~KVM_ARM_DEV_PMU;
> +        }
>  
>          if (switched_level) {
>              qemu_log_mask(LOG_UNIMP, "%s: unhandled in-kernel device IRQ %x\n",
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index e26638a6fac1..ec7d85314acc 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -506,8 +506,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_EL1_32BIT;
>      }
> -    if (!kvm_irqchip_in_kernel() ||
> -        !kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
> +    if (!kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
>              cpu->has_pmu = false;
>      }
>      if (cpu->has_pmu) {
> -- 
> 1.8.3.1
> 
