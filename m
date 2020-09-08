Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp508553lfq;
        Tue, 8 Sep 2020 04:17:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpCE1XpFXqKRgPXQ3rH0wKGDTB1SFpyonLTzyRjh0BN98mbdHqBcqsZEoFNn/c9qaVwYNP
X-Received: by 2002:a25:bfc8:: with SMTP id q8mr35198368ybm.156.1599563858654;
        Tue, 08 Sep 2020 04:17:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599563858; cv=none;
        d=google.com; s=arc-20160816;
        b=poVzDfRZkAZ0JdUcesfKzx5EQMoWYzxblTty0aJjW1TMpIekSJlsO8EUGbYz6TyXR4
         +xwIyZ2XAM7+QiqLTcBhW84gljq8+D1UaOuO6SDD7Upjt7jcaGZ3d5xNOujxtrDVMeMr
         o4zk77vNJwHAhPsuKjq1HprTQT0Z3tPOGFlonTZmom+NoRtS/LOgeXjYJiG46rtpAYA0
         uPLI4TzuMv9gVMSMz1Jj26+Bae0JAgu513k8GEZVhjJpcrpKFa0YtbhlazegDktprbV8
         +DozFsd7+xQj/jRwdL916rTPmFqYAARUz+948cwwIM3dcLyNjynkJ7UIuAmEFVe5fZaH
         yzVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=pqjlsphl2j3znMxyXVEcKoaK8XPXKbhFnNOoXlqt2qo=;
        b=VFFYVUcp9+YN/2UyMau6hTzh+GmFOBJKSVVNIafVxqzGnCEmcU1IwT6riV1dsZqAIE
         NBwwwzeVHMU+/kL8fFlikEezf9FZQnu9ebVOpJdg4tSXn0A/rBxPE0hkylrDqjsz1B0H
         ly1Vhgsyzmdpn4iDQdHRbug7jrWU+lGIEHG7j2SaEfLJRUI5x2RZCRswWjni/ia+o8Tk
         okXbyVJgCElrFu6ynE2+3+PZdKGpcANMLn5MoHR13I/6tVMPXHni/SAHhXIlLaQa955l
         W50PTXXz8KxbNSJ0FLzSUaa/ZRsJyG8KlxBQ7TXX3Sutjad8nvp0BjQDGIOOYr7WdIt9
         gN+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Yq6HJl+C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x36si19415090ybh.121.2020.09.08.04.17.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 04:17:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Yq6HJl+C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFbd4-0006zH-3A
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 07:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFbc7-00068Z-1D
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 07:16:39 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:46109
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFbc3-0006ys-0j
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 07:16:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599563793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pqjlsphl2j3znMxyXVEcKoaK8XPXKbhFnNOoXlqt2qo=;
 b=Yq6HJl+ClDNuzMuTfWScfhRg1LUGIbLZ8TCG5BHn/Pibl4pHF660HGwwQnq14yKWIM/j7n
 mAZ3ove5697h9vXpMpGD3UGBEpcCEKJ7A7wVvIaow39xxkRKxhU0edkeJD/rRYjeUEgJdH
 afKUfvlPlZ1ypZadi3xipH457C0KFb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-4thXYxsZNLek1_8fb-0fHA-1; Tue, 08 Sep 2020 07:16:32 -0400
X-MC-Unique: 4thXYxsZNLek1_8fb-0fHA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C74B18015A6;
 Tue,  8 Sep 2020 11:16:30 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B51E45C1BB;
 Tue,  8 Sep 2020 11:16:28 +0000 (UTC)
Date: Tue, 8 Sep 2020 13:16:25 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH v2 09/12] hw/arm/virt: spe: Add SPE fdt binding for virt
 machine
Message-ID: <20200908111625.2wzzn7jh5wt4nnmu@kamzik.brq.redhat.com>
References: <cover.1599549462.git.haibo.xu@linaro.org>
 <c6ac607d2cd253de6a990538edfde7f86066f04f.1599549462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <c6ac607d2cd253de6a990538edfde7f86066f04f.1599549462.git.haibo.xu@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 01:08:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gCsYpRTUA9h4


This patch does much more than the summary "hw/arm/virt: spe: Add SPE fdt
binding for virt machine" says it does. Please revise the summary.

On Tue, Sep 08, 2020 at 08:13:27AM +0000, Haibo Xu wrote:
> Add a virtual SPE device for virt machine while using
> PPI 5 for SPE overflow interrupt number which has already
> selected in kvmtool.
> 
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  hw/arm/virt-acpi-build.c    |  3 +++
>  hw/arm/virt.c               | 43 ++++++++++++++++++++++++++++++++++++-
>  include/hw/acpi/acpi-defs.h |  3 +++
>  include/hw/arm/virt.h       |  1 +
>  target/arm/cpu.c            |  2 ++
>  target/arm/cpu.h            |  2 ++
>  6 files changed, 53 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 9efd7a3881..3fd80fda53 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -665,6 +665,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
>              gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
>          }
> +        if (cpu_isar_feature(aa64_spe, armcpu)) {
> +            gicc->spe_interrupt = cpu_to_le32(PPI(VIRTUAL_SPE_IRQ));
> +        }
>          if (vms->virt) {
>              gicc->vgic_interrupt = cpu_to_le32(PPI(ARCH_GIC_MAINT_IRQ));
>          }
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 6bacfb668d..bdb1ce925c 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -545,6 +545,32 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
>      }
>  }
>  
> +static void fdt_add_spe_nodes(const VirtMachineState *vms)
> +{
> +    ARMCPU *armcpu = ARM_CPU(first_cpu);
> +    uint32_t irqflags = GIC_FDT_IRQ_FLAGS_LEVEL_HI;
> +
> +    if (!cpu_isar_feature(aa64_spe, armcpu)) {
> +        assert(!object_property_get_bool(OBJECT(armcpu), "spe", NULL));
> +        return;
> +    }
> +
> +    if (vms->gic_version == VIRT_GIC_VERSION_2) {
> +        irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
> +                             GIC_FDT_IRQ_PPI_CPU_WIDTH,
> +                             (1 << vms->smp_cpus) - 1);
> +    }
> +
> +    qemu_fdt_add_subnode(vms->fdt, "/spe");
> +    if (arm_feature(&armcpu->env, ARM_FEATURE_V8)) {
> +        const char compat[] = "arm,statistical-profiling-extension-v1";
> +        qemu_fdt_setprop(vms->fdt, "/spe", "compatible",
> +                         compat, sizeof(compat));
> +        qemu_fdt_setprop_cells(vms->fdt, "/spe", "interrupts",
> +                               GIC_FDT_IRQ_TYPE_PPI, VIRTUAL_SPE_IRQ, irqflags);
> +    }
> +}
> +
>  static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>  {
>      DeviceState *dev;
> @@ -717,6 +743,10 @@ static void create_gic(VirtMachineState *vms)
>                                      qdev_get_gpio_in(vms->gic, ppibase
>                                                       + VIRTUAL_PMU_IRQ));
>  
> +        qdev_connect_gpio_out_named(cpudev, "spe-interrupt", 0,
> +                                    qdev_get_gpio_in(vms->gic, ppibase
> +                                                     + VIRTUAL_SPE_IRQ));
> +
>          sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
>          sysbus_connect_irq(gicbusdev, i + smp_cpus,
>                             qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
> @@ -1664,11 +1694,12 @@ static void finalize_gic_version(VirtMachineState *vms)
>  
>  static void virt_cpu_post_init(VirtMachineState *vms)
>  {
> -    bool aarch64, pmu;
> +    bool aarch64, pmu, spe;
>      CPUState *cpu;
>  
>      aarch64 = object_property_get_bool(OBJECT(first_cpu), "aarch64", NULL);
>      pmu = object_property_get_bool(OBJECT(first_cpu), "pmu", NULL);
> +    spe = object_property_get_bool(OBJECT(first_cpu), "spe", NULL);
>  
>      if (kvm_enabled()) {
>          CPU_FOREACH(cpu) {
> @@ -1679,6 +1710,14 @@ static void virt_cpu_post_init(VirtMachineState *vms)
>                  }
>                  kvm_arm_pmu_init(cpu);
>              }
> +
> +            if (spe) {
> +                assert(ARM_CPU(cpu)->has_spe == ON_OFF_AUTO_ON);
> +                if (kvm_irqchip_in_kernel()) {
> +                    kvm_arm_spe_set_irq(cpu, PPI(VIRTUAL_SPE_IRQ));
> +                }
> +                kvm_arm_spe_init(cpu);

A later patch introduces userspace irqchip support. Should we avoid
allowing it until then to avoid breaking bisection?

> +            }
>          }
>      } else {
>          if (aarch64 && vms->highmem) {
> @@ -1927,6 +1966,8 @@ static void machvirt_init(MachineState *machine)
>  
>      fdt_add_pmu_nodes(vms);
>  
> +    fdt_add_spe_nodes(vms);
> +
>      create_uart(vms, VIRT_UART, sysmem, serial_hd(0));
>  
>      if (vms->secure) {
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index 38a42f409a..21e58f27c5 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -302,6 +302,9 @@ struct AcpiMadtGenericCpuInterface {
>      uint32_t vgic_interrupt;
>      uint64_t gicr_base_address;
>      uint64_t arm_mpidr;
> +    uint8_t  efficiency_class;
> +    uint8_t  reserved2[1];
> +    uint16_t spe_interrupt; /* ACPI 6.3 */
>  } QEMU_PACKED;
>  
>  typedef struct AcpiMadtGenericCpuInterface AcpiMadtGenericCpuInterface;
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 72c269aaa5..6013b6d535 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -49,6 +49,7 @@
>  #define ARCH_TIMER_NS_EL1_IRQ 14
>  #define ARCH_TIMER_NS_EL2_IRQ 10
>  
> +#define VIRTUAL_SPE_IRQ 5
>  #define VIRTUAL_PMU_IRQ 7
>  
>  #define PPI(irq) ((irq) + 16)
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index f211958eaa..786cc6134c 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1041,6 +1041,8 @@ static void arm_cpu_initfn(Object *obj)
>                               "gicv3-maintenance-interrupt", 1);
>      qdev_init_gpio_out_named(DEVICE(cpu), &cpu->pmu_interrupt,
>                               "pmu-interrupt", 1);
> +    qdev_init_gpio_out_named(DEVICE(cpu), &cpu->spe_interrupt,
> +                             "spe-interrupt", 1);
>  #endif
>  
>      /* DTB consumers generally don't in fact care what the 'compatible'
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index baf2bbcee8..395a1e5df8 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -800,6 +800,8 @@ struct ARMCPU {
>      qemu_irq gicv3_maintenance_interrupt;
>      /* GPIO output for the PMU interrupt */
>      qemu_irq pmu_interrupt;
> +    /* GPIO output for the SPE interrupt */
> +    qemu_irq spe_interrupt;
>  
>      /* MemoryRegion to use for secure physical accesses */
>      MemoryRegion *secure_memory;
> -- 
> 2.17.1
> 
> 

Otherwise

Reviewed-by: Andrew Jones <drjones@redhat.com>

