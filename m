Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3104981lfm;
        Tue, 21 Jul 2020 03:02:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDPC12tZk6wNZbovndtBX26VNhUW8DBbdRwNhzxzjkJVxB03vMGQncxiKrJqDk+OciZeDG
X-Received: by 2002:a25:6c8a:: with SMTP id h132mr41199745ybc.353.1595325773065;
        Tue, 21 Jul 2020 03:02:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595325773; cv=none;
        d=google.com; s=arc-20160816;
        b=zaTep9yk+9q6JnDYcVkHy1fDLqYLPc/MWH9sP4fgPS9uxYnqJDHR4mIiVfOM9uqdWC
         lb5FDJauXTP1pd/iyNsg150CMJzh1hA5jVR47I168McPRM3QcYFig2YJ7mzhLCT3roMy
         t5BqGVkHcNbiSrKdd8d5KTQ3VE1euxZiAGANgtFM2VBerDqMsbJTt1uVPhjI6ZRkMvbN
         9mOFgFtWG9OuGzXO9ulHhK7u26cAA76HJilAihZo2DmcVbbWsT/m1Vk61cOQWjlMDExx
         fo8lJoz/tgdedTLXD1R1LOL1bH6x7tJ8yv2bRGoYvNL2GtGDmtl3THjilPHzs+gpM4Ts
         m9eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=awL/01hPpP9Z7+laZvrYGFEzbSimdAKZH1G/PVXrNcY=;
        b=n5VR5EKkjqOR6Ejegk20dSf40wsEUgpAp3S5mdn+AqgrutmBiawqnAR8K/Omb0ZLiJ
         kBfUKPhP9AdyhzxsDQa+4Ooqgbca2g6/8JkUknK7WS+1T9Wysn81RggznZIejKUeeHVc
         V3+be0Z+gRuSTqiui8NLwxz/zDFJKCrrUNnc4TUICqxl+QjW5hJN63q7MjoghMG7Mf/b
         u6mknEwK+JefLDFrXGVYoHy98ggwjti5vdPrkJZaYZUVorn0bEsWT6Mn7DoEbRQub6H1
         RCFvTxzFZV5D4P2sCoWka/xEn7XqtPjl7Tqdxe4a04ZHBbdjtoUYvaSvMVkkl60g0g27
         FRlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nOWOX2lq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1si19894597yby.225.2020.07.21.03.02.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jul 2020 03:02:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nOWOX2lq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jxp6q-0002DF-Ci
	for alex.bennee@linaro.org; Tue, 21 Jul 2020 06:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jxp6i-0002Am-7x
 for qemu-arm@nongnu.org; Tue, 21 Jul 2020 06:02:44 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:35603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jxp6g-00076r-FO
 for qemu-arm@nongnu.org; Tue, 21 Jul 2020 06:02:43 -0400
Received: by mail-oi1-x242.google.com with SMTP id k4so16732824oik.2
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2020 03:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=awL/01hPpP9Z7+laZvrYGFEzbSimdAKZH1G/PVXrNcY=;
 b=nOWOX2lqQUoza4SnwynYKi8vxQHOn7GDGEkruQcAay87WpARypl3Nk+C4w/WOG4gOp
 13197TNvSCTJkVhSg4PKP8mh/mv+nF47dNWU9U47gAoQlpic9iWlejyzXqBhyLkrxRkx
 JrbBdhMcxEJsmLlwMfXIrgYFFtFylzM+ma+1M8Z1C4UWCbAK15SI51itcYC3qxclia7+
 2ZT9rz50/rl9aDTioHo9SfjYmcAWS5FF7oVTORSFcrPHok1RT++xoxzd8jZsj6sgnUsl
 IY1P13SUj++j2lcVar/Vc2dCanc0D7fQa0O2yiNixf+C2r+EOEMD3sK8bwVz9VeMqR24
 T5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=awL/01hPpP9Z7+laZvrYGFEzbSimdAKZH1G/PVXrNcY=;
 b=k8x/39iPPvagWJ8BggEf9zS4AeqQJpRqPtL4JR7ucQrhZWG+4rT5slA5J8R+fESO23
 9UliFszkKz7Ptr+z2lb9MXPpoJeYEyAW9n4g2hQS7vqfQudOLlpI8irLVfOMf49I1YJB
 kelYw4NNHm68MuO3xLCo9kNIO+zTU02vhWKxhpab0MVmEuzCxIqZBqL1Ziqa+7Cxacps
 lvTbnryzlg+PExJsFtMA+RWOwl1ZcPcyzb8LqopFrgQxYB8G/Ii4BDbM5AXm1dyEbcWl
 mcV70hVbX65xhbZqKmcWTrcffjVHYClb/pY/hEOP8quK3Od1ixGMAq+0aP+8aRaNzHEl
 lixA==
X-Gm-Message-State: AOAM532mFcmqe+pl7IvNVQWMQoTT4bIgaWo9I7nR03b8g3swDfYumX5H
 TBxEV6BA1C9VGGjN1H03gIU3orPumQnH7/KBw/tM/A==
X-Received: by 2002:aca:54c9:: with SMTP id i192mr2364625oib.163.1595325761221; 
 Tue, 21 Jul 2020 03:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200711101033.47371-1-drjones@redhat.com>
 <20200711101033.47371-3-drjones@redhat.com>
In-Reply-To: <20200711101033.47371-3-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jul 2020 11:02:30 +0100
Message-ID: <CAFEAcA93VMoQxPSvk7YNkkbXhrFufuFN8R9Sqjj6C97Xz2buvA@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/arm/virt: Move kvm pmu setup to virt_cpu_post_init
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Beata Michalska <beata.michalska@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SwnyRFnk6Qee

On Sat, 11 Jul 2020 at 11:10, Andrew Jones <drjones@redhat.com> wrote:
>
> Move the KVM PMU setup part of fdt_add_pmu_nodes() to
> virt_cpu_post_init(), which is a more appropriate location. Now
> fdt_add_pmu_nodes() is also named more appropriately, because it
> no longer does anything but fdt node creation.
>
> No functional change intended.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/virt.c | 33 +++++++++++++++------------------
>  1 file changed, 15 insertions(+), 18 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index cb2fa99b1ef5..63ef530933e5 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -521,30 +521,15 @@ static void fdt_add_gic_node(VirtMachineState *vms)
>
>  static void fdt_add_pmu_nodes(const VirtMachineState *vms)
>  {
> -    CPUState *cpu;
> -    ARMCPU *armcpu;
> +    ARMCPU *armcpu = ARM_CPU(first_cpu);
>      uint32_t irqflags = GIC_FDT_IRQ_FLAGS_LEVEL_HI;
>
> -    CPU_FOREACH(cpu) {
> -        armcpu = ARM_CPU(cpu);
> -        if (!arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
> -            return;
> -        }

So previously we would say "if the CPU doesn't actually have
a PMU, don't put the PMU nodes in the FDT", but in the new logic
it looks like we put the PMU nodes in the FDT unconditionally ?

> -        if (kvm_enabled()) {
> -            if (kvm_irqchip_in_kernel()) {
> -                kvm_arm_pmu_set_irq(cpu, PPI(VIRTUAL_PMU_IRQ));
> -            }
> -            kvm_arm_pmu_init(cpu);
> -        }
> -    }
> -
>      if (vms->gic_version == VIRT_GIC_VERSION_2) {
>          irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
>                               GIC_FDT_IRQ_PPI_CPU_WIDTH,
>                               (1 << vms->smp_cpus) - 1);
>      }
>
> -    armcpu = ARM_CPU(qemu_get_cpu(0));
>      qemu_fdt_add_subnode(vms->fdt, "/pmu");
>      if (arm_feature(&armcpu->env, ARM_FEATURE_V8)) {
>          const char compat[] = "arm,armv8-pmuv3";
> @@ -1678,11 +1663,23 @@ static void finalize_gic_version(VirtMachineState *vms)
>   */
>  static void virt_cpu_post_init(VirtMachineState *vms)
>  {
> -    bool aarch64;
> +    bool aarch64, pmu;
> +    CPUState *cpu;
>
>      aarch64 = object_property_get_bool(OBJECT(first_cpu), "aarch64", NULL);
> +    pmu = object_property_get_bool(OBJECT(first_cpu), "pmu", NULL);
>
> -    if (!kvm_enabled()) {
> +    if (kvm_enabled()) {
> +        CPU_FOREACH(cpu) {
> +            if (pmu) {
> +                assert(arm_feature(&ARM_CPU(cpu)->env, ARM_FEATURE_PMU));
> +                if (kvm_irqchip_in_kernel()) {
> +                    kvm_arm_pmu_set_irq(cpu, PPI(VIRTUAL_PMU_IRQ));
> +                }
> +                kvm_arm_pmu_init(cpu);
> +            }
> +        }
> +    } else {
>          if (aarch64 && vms->highmem) {
>              int requested_pa_size = 64 - clz64(vms->highest_gpa);
>              int pamax = arm_pamax(ARM_CPU(first_cpu));

thanks
-- PMM
