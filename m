Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp206465lfq;
        Wed, 9 Sep 2020 00:51:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfCW9+Nqr8a/Pu0feh4cLyoawlPiPyg06BwgTkJ73HTWkE1aMG0Xx3VcK46ZxVQjvuZafK
X-Received: by 2002:a25:c74a:: with SMTP id w71mr4191239ybe.191.1599637896703;
        Wed, 09 Sep 2020 00:51:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599637896; cv=none;
        d=google.com; s=arc-20160816;
        b=r+8GhbYodVXuTyfRa6eQp868ULPQMFKJQPEfNe4L0ZSNuyE6Y/IN9RLlvaODDHiBM5
         OhZcffLi9f7Th+XP9EeDeEgU3v/wzCfPbYFdreTeUq1notoZUpPuKn2O0fMyQaXCeFHg
         W5PNLg3gUF3tAlfOB+2BzMi56Q4DcbMzRkbixFXtmzTgozUFkvvdQq7kxwGvPhOhtzAo
         fmwsVQPU+rIqeqMTe2hm2z/7IlTXnJ+Vyx7HzgGLPEF5Rrs4+CN2bkX2bNmwnQBA6nMT
         07ZSt6a/rtCUJT64Yzr2DOdfF940e3aVaZSCt1FCZL8lxnypxw91l2Pd+WsA6B9JPQRu
         A57g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z8cDTBCiMPSoC6W0ri66YE+1BCNxXKrLEKDARKazsVU=;
        b=j+fYsidkwiV9Hoso2EsjOOZ4KfTMF7S/8pKJZYmGEsemGnpJzdtYZVrCXlqX/AfvJQ
         u6sz5e5KAzwLM8liaK3ZmHtEBU8R3XYTnbED9Xq69mLIcqt7PpGOFAqMhgDvI78Xhhn2
         +d555isSztW0BbDoqhbUNbm8T/hp/RrPi2isuGq726hANPfeeEclHP1SUpaXeulp9iyZ
         /Uix3IMcDUiIZwp2TYMnmMELna2eg5fsfUnJR+JZN7PMcb7yge8NLZl1wbgRqGNQZ7op
         NOF0MT6vJGVaNC3j4GTtiASmm5YhfSdqtcsWxR0kDaDTGi0tHjf+tDePMOlKpBRioEdw
         BtHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sedaQP0+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x194si2225393ybg.155.2020.09.09.00.51.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Sep 2020 00:51:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sedaQP0+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFutE-0002vs-3H
	for alex.bennee@linaro.org; Wed, 09 Sep 2020 03:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFut7-0002vf-7f
 for qemu-arm@nongnu.org; Wed, 09 Sep 2020 03:51:29 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:35687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFut5-0000L9-5a
 for qemu-arm@nongnu.org; Wed, 09 Sep 2020 03:51:28 -0400
Received: by mail-io1-xd41.google.com with SMTP id r9so2188466ioa.2
 for <qemu-arm@nongnu.org>; Wed, 09 Sep 2020 00:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z8cDTBCiMPSoC6W0ri66YE+1BCNxXKrLEKDARKazsVU=;
 b=sedaQP0+lXDKcbhXEOEuFe/59wVc4Cfq0+dtjc4GIzpjycVKy+qKXELoXxgz/t+OWW
 vRDsfy7jbFcBqlQNQ8opYtUR/ulJiOOyObGwKlPipVohAixbDF6sFtMPYWNJv+jW/kvY
 Nbf+mOrxCGqzk0S6iOanb3X786uh81Gi5KborIN8rcFVp8jjGrVxADpujQ8CNmf8R99T
 Q8sE77aKPXJnpkzD1LSoOtJd8yfyKwo1QDvUKq6UWp/OJzqOIjnbYjpyTXvuF08KbU96
 dZjGm0ZNTez4mDZMKMXAut6RAweeKtgPqOoagmLqf6dN2IXN7xSoL5i5DRQ9tqoM6Umv
 zY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z8cDTBCiMPSoC6W0ri66YE+1BCNxXKrLEKDARKazsVU=;
 b=Rc9nPrWRlEAc9rbmZv8i17OGOpfH2Rtd8naipFZtJgXDhmeMeqZLYaFBt3PvyoZ95w
 1uf4w/7r4O3mFabrTXD8j6PLn38KD5DLnUeAAVncbY3FWYRqdW5kNxKq4EtEwvi0NG2m
 sSdomwH2gv5mMT3PownYYGA6+meq+56xozcF5ZNmzSLVp6FPIq61gVY/urcg4MYpJui+
 gafz9cfa3fpcNGOHjXTXRh+/e0xntrnz4Lbgo811LuraHweheWdZsHq9m7KY88CsqFmj
 ZjW+vsZdy7iLzJiQYNcdQ6j9Ue2rkREvP4KcyC9LWiGRdxKtVbGQws++11bg7ZwjFYsL
 Cy2Q==
X-Gm-Message-State: AOAM533uvNcBOZ3z+4Z7bWacJw0bN2dmBD6FtPm+H9TKQVS7CY693bpF
 WWaiv6aDoysb+8eUPqEeyJKWoEdTjUT2v4V7otW0
X-Received: by 2002:a05:6638:224e:: with SMTP id
 m14mr2899944jas.101.1599637885959; 
 Wed, 09 Sep 2020 00:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1599549462.git.haibo.xu@linaro.org>
 <c6ac607d2cd253de6a990538edfde7f86066f04f.1599549462.git.haibo.xu@linaro.org>
 <20200908111625.2wzzn7jh5wt4nnmu@kamzik.brq.redhat.com>
In-Reply-To: <20200908111625.2wzzn7jh5wt4nnmu@kamzik.brq.redhat.com>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Wed, 9 Sep 2020 15:51:14 +0800
Message-ID: <CAJc+Z1GCmf5fEjifa84O6jmfd6WCih1jT07AXb7vWFC7=sXfrA@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] hw/arm/virt: spe: Add SPE fdt binding for virt
 machine
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=haibo.xu@linaro.org; helo=mail-io1-xd41.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aMuqaL7BAkr6

On Tue, 8 Sep 2020 at 19:16, Andrew Jones <drjones@redhat.com> wrote:
>
>
> This patch does much more than the summary "hw/arm/virt: spe: Add SPE fdt
> binding for virt machine" says it does. Please revise the summary.
>

Will revise it in v3.

Thanks,
Haibo

> On Tue, Sep 08, 2020 at 08:13:27AM +0000, Haibo Xu wrote:
> > Add a virtual SPE device for virt machine while using
> > PPI 5 for SPE overflow interrupt number which has already
> > selected in kvmtool.
> >
> > Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> > ---
> >  hw/arm/virt-acpi-build.c    |  3 +++
> >  hw/arm/virt.c               | 43 ++++++++++++++++++++++++++++++++++++-
> >  include/hw/acpi/acpi-defs.h |  3 +++
> >  include/hw/arm/virt.h       |  1 +
> >  target/arm/cpu.c            |  2 ++
> >  target/arm/cpu.h            |  2 ++
> >  6 files changed, 53 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index 9efd7a3881..3fd80fda53 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -665,6 +665,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >          if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
> >              gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
> >          }
> > +        if (cpu_isar_feature(aa64_spe, armcpu)) {
> > +            gicc->spe_interrupt = cpu_to_le32(PPI(VIRTUAL_SPE_IRQ));
> > +        }
> >          if (vms->virt) {
> >              gicc->vgic_interrupt = cpu_to_le32(PPI(ARCH_GIC_MAINT_IRQ));
> >          }
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 6bacfb668d..bdb1ce925c 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -545,6 +545,32 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
> >      }
> >  }
> >
> > +static void fdt_add_spe_nodes(const VirtMachineState *vms)
> > +{
> > +    ARMCPU *armcpu = ARM_CPU(first_cpu);
> > +    uint32_t irqflags = GIC_FDT_IRQ_FLAGS_LEVEL_HI;
> > +
> > +    if (!cpu_isar_feature(aa64_spe, armcpu)) {
> > +        assert(!object_property_get_bool(OBJECT(armcpu), "spe", NULL));
> > +        return;
> > +    }
> > +
> > +    if (vms->gic_version == VIRT_GIC_VERSION_2) {
> > +        irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
> > +                             GIC_FDT_IRQ_PPI_CPU_WIDTH,
> > +                             (1 << vms->smp_cpus) - 1);
> > +    }
> > +
> > +    qemu_fdt_add_subnode(vms->fdt, "/spe");
> > +    if (arm_feature(&armcpu->env, ARM_FEATURE_V8)) {
> > +        const char compat[] = "arm,statistical-profiling-extension-v1";
> > +        qemu_fdt_setprop(vms->fdt, "/spe", "compatible",
> > +                         compat, sizeof(compat));
> > +        qemu_fdt_setprop_cells(vms->fdt, "/spe", "interrupts",
> > +                               GIC_FDT_IRQ_TYPE_PPI, VIRTUAL_SPE_IRQ, irqflags);
> > +    }
> > +}
> > +
> >  static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
> >  {
> >      DeviceState *dev;
> > @@ -717,6 +743,10 @@ static void create_gic(VirtMachineState *vms)
> >                                      qdev_get_gpio_in(vms->gic, ppibase
> >                                                       + VIRTUAL_PMU_IRQ));
> >
> > +        qdev_connect_gpio_out_named(cpudev, "spe-interrupt", 0,
> > +                                    qdev_get_gpio_in(vms->gic, ppibase
> > +                                                     + VIRTUAL_SPE_IRQ));
> > +
> >          sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
> >          sysbus_connect_irq(gicbusdev, i + smp_cpus,
> >                             qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
> > @@ -1664,11 +1694,12 @@ static void finalize_gic_version(VirtMachineState *vms)
> >
> >  static void virt_cpu_post_init(VirtMachineState *vms)
> >  {
> > -    bool aarch64, pmu;
> > +    bool aarch64, pmu, spe;
> >      CPUState *cpu;
> >
> >      aarch64 = object_property_get_bool(OBJECT(first_cpu), "aarch64", NULL);
> >      pmu = object_property_get_bool(OBJECT(first_cpu), "pmu", NULL);
> > +    spe = object_property_get_bool(OBJECT(first_cpu), "spe", NULL);
> >
> >      if (kvm_enabled()) {
> >          CPU_FOREACH(cpu) {
> > @@ -1679,6 +1710,14 @@ static void virt_cpu_post_init(VirtMachineState *vms)
> >                  }
> >                  kvm_arm_pmu_init(cpu);
> >              }
> > +
> > +            if (spe) {
> > +                assert(ARM_CPU(cpu)->has_spe == ON_OFF_AUTO_ON);
> > +                if (kvm_irqchip_in_kernel()) {
> > +                    kvm_arm_spe_set_irq(cpu, PPI(VIRTUAL_SPE_IRQ));
> > +                }
> > +                kvm_arm_spe_init(cpu);
>
> A later patch introduces userspace irqchip support. Should we avoid
> allowing it until then to avoid breaking bisection?
>

Yes, it's possible to break the bisection. To avoid it I think we can
move the above codes
block to a separate patch after adding the userspace irqchip support,
Or, just put the userspace
irqchip support patch before this patch. What's your opinion?

Thanks,
Haibo

> > +            }
> >          }
> >      } else {
> >          if (aarch64 && vms->highmem) {
> > @@ -1927,6 +1966,8 @@ static void machvirt_init(MachineState *machine)
> >
> >      fdt_add_pmu_nodes(vms);
> >
> > +    fdt_add_spe_nodes(vms);
> > +
> >      create_uart(vms, VIRT_UART, sysmem, serial_hd(0));
> >
> >      if (vms->secure) {
> > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > index 38a42f409a..21e58f27c5 100644
> > --- a/include/hw/acpi/acpi-defs.h
> > +++ b/include/hw/acpi/acpi-defs.h
> > @@ -302,6 +302,9 @@ struct AcpiMadtGenericCpuInterface {
> >      uint32_t vgic_interrupt;
> >      uint64_t gicr_base_address;
> >      uint64_t arm_mpidr;
> > +    uint8_t  efficiency_class;
> > +    uint8_t  reserved2[1];
> > +    uint16_t spe_interrupt; /* ACPI 6.3 */
> >  } QEMU_PACKED;
> >
> >  typedef struct AcpiMadtGenericCpuInterface AcpiMadtGenericCpuInterface;
> > diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> > index 72c269aaa5..6013b6d535 100644
> > --- a/include/hw/arm/virt.h
> > +++ b/include/hw/arm/virt.h
> > @@ -49,6 +49,7 @@
> >  #define ARCH_TIMER_NS_EL1_IRQ 14
> >  #define ARCH_TIMER_NS_EL2_IRQ 10
> >
> > +#define VIRTUAL_SPE_IRQ 5
> >  #define VIRTUAL_PMU_IRQ 7
> >
> >  #define PPI(irq) ((irq) + 16)
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index f211958eaa..786cc6134c 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -1041,6 +1041,8 @@ static void arm_cpu_initfn(Object *obj)
> >                               "gicv3-maintenance-interrupt", 1);
> >      qdev_init_gpio_out_named(DEVICE(cpu), &cpu->pmu_interrupt,
> >                               "pmu-interrupt", 1);
> > +    qdev_init_gpio_out_named(DEVICE(cpu), &cpu->spe_interrupt,
> > +                             "spe-interrupt", 1);
> >  #endif
> >
> >      /* DTB consumers generally don't in fact care what the 'compatible'
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index baf2bbcee8..395a1e5df8 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -800,6 +800,8 @@ struct ARMCPU {
> >      qemu_irq gicv3_maintenance_interrupt;
> >      /* GPIO output for the PMU interrupt */
> >      qemu_irq pmu_interrupt;
> > +    /* GPIO output for the SPE interrupt */
> > +    qemu_irq spe_interrupt;
> >
> >      /* MemoryRegion to use for secure physical accesses */
> >      MemoryRegion *secure_memory;
> > --
> > 2.17.1
> >
> >
>
> Otherwise
>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
>
