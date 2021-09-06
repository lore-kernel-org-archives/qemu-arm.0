Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3751904lfb;
        Mon, 6 Sep 2021 05:40:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxowGzKenAYGYbTEJO93+SOuAzT/eQZCVfxVP3WxH2ffmCE2sOvUl94o/5ee59+HfcRVpUV
X-Received: by 2002:a05:6602:2e13:: with SMTP id o19mr9742444iow.9.1630932051495;
        Mon, 06 Sep 2021 05:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630932051; cv=none;
        d=google.com; s=arc-20160816;
        b=aPLEOH33JpElompx7l+K8XPX9SUKl/oY2Bk0i3Vd8fYauI832rglpC48pxERgjm3pD
         /lyDl4YvEk7XJy9fYSj0k6rXiO21rWcnNapXnwj4i8k8khhIXvqgREp0dLdI15S2czLl
         IyKRV+71a0ssQoHxQPGxnRuWDDQ/+cRYm5Y63J9vNlA1qm0lHphD9a54boYR/rFFl+Ba
         fbEa4rc3XJmOXddy5IGbgvlZtj74VBB5WpeglpneQApP921xwAxhHTgOmefwIq3k0m5J
         YPOvm5OD499uruUvQgMj0RrSFzqM4r/0ie7sk/Vso94BWE53m1L/uXlSgKV8bFVnsNOp
         b8TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=RRF6Jygbwmx+KqiKwBND2OAoIw66WKz4KZAD22VgJY8=;
        b=MTCElSJiT987ivnKVL7nY3MWbrxd9isGEz86MS6C7S/ASWu2HmmP5eXr6TL0NG4OTn
         MJ1pYo+sacA091CrR12iW1Ahg6cWKOJ0oHy6uyoSmB2yPp+EXJFHuGjHmM9OXuhzAL+J
         YeC0D9hMfHvAd1skhZiTDzISUv0LWqVSsqaw0ltV6+0mjdrJyd1XEHgtpmLtgynmtbzw
         mHVEDhP5DGDFpsXOXesYxkdD0sq+5Z21PVN0oEA1lf3KfLkKMMhoSisCmqGRsOT2VSYZ
         5pjGKgu8rKQ31PCJ410NnFoy47P7kF6o5oROwI20eWTUCxBwVDiYOwiM4/Y4ZUuY4xK5
         dCcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b0Q3cPw3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g6si7164275jag.35.2021.09.06.05.40.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Sep 2021 05:40:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b0Q3cPw3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNDve-0004pT-9V
	for alex.bennee@linaro.org; Mon, 06 Sep 2021 08:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNDvI-0004lK-BA
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 08:40:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNDvF-0006he-7F
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 08:40:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630932022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RRF6Jygbwmx+KqiKwBND2OAoIw66WKz4KZAD22VgJY8=;
 b=b0Q3cPw3BAeAddGjk7wm0DXH+pce4JJHfOO3uXOHmeKf7X6rQQkRIxSCdIshrVIPHd8GhY
 G+5hEtfAET54w1FzRWYiQ+UqwFWGtp7a2XdWA4Xj6sUPg9k5mFpk3u8Y6iWU4xjl4HiSex
 qbmJ2Yz2Mh9L8t64HAtxPHp5VHAgQDU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-nWrdII4JNjmxFVpsZ-8NkQ-1; Mon, 06 Sep 2021 08:40:21 -0400
X-MC-Unique: nWrdII4JNjmxFVpsZ-8NkQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 h4-20020aa7c604000000b003c423efb7efso3615685edq.12
 for <qemu-arm@nongnu.org>; Mon, 06 Sep 2021 05:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RRF6Jygbwmx+KqiKwBND2OAoIw66WKz4KZAD22VgJY8=;
 b=G/O0bTcCSox74/MjcIa8Oh1e7KabbwIntp29rq99l4zQXvB2LWTZLuwU5lCeqx85j3
 prMBXVyzAPsJ47XXm2Wh2Ik7hxTxxJVXLhOQnX5JMEvkuogJa9tpWKDdtu0JixltRBAi
 aUvg/1wWK9FuuTLOzW6QnFOkGF57W6MB2TfK1HPBIbd+Uzy6qVesyXj+wMjytPgN8TC2
 ywNBRPNau+J/w2yQiWOYfGgR0SjHJSKzBFZ/6zkAe+Hgj2KfDaOjKB4w3rQDw67GMstx
 L5rkXmAIZ2PARBfE39NuuKOo4Z0qOFhbxNBzlluRvsiVmG1FKcMf9TqTTxIUrGZF7eIl
 6idA==
X-Gm-Message-State: AOAM5329VGshX+Zhb772IO6ik6s+epfCqHhjeXLJ5rn0uUzaJujsECre
 doYtp0DDEmhqfLIv3uTYz0o8EVGf4sd9uqRPfADQZfcP4GBBF5p4ev1L910UOpAiW7epQmuSV4c
 trZvyDAbiQ5oB
X-Received: by 2002:a17:906:c18c:: with SMTP id
 g12mr13645174ejz.458.1630932020220; 
 Mon, 06 Sep 2021 05:40:20 -0700 (PDT)
X-Received: by 2002:a17:906:c18c:: with SMTP id
 g12mr13645152ejz.458.1630932019993; 
 Mon, 06 Sep 2021 05:40:19 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id oy11sm3814849ejb.104.2021.09.06.05.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 05:40:19 -0700 (PDT)
Date: Mon, 6 Sep 2021 14:40:18 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eauger@redhat.com>
Subject: Re: [PATCH v2 25/35] acpi: arm/virt: madt: use
 build_append_int_noprefix() API to compose MADT table
Message-ID: <20210906144018.7c6d1679@redhat.com>
In-Reply-To: <0c92c5cd-446f-142b-ad2d-42ce5722a71a@redhat.com>
References: <20210708154617.1538485-1-imammedo@redhat.com>
 <20210708154617.1538485-26-imammedo@redhat.com>
 <0c92c5cd-446f-142b-ad2d-42ce5722a71a@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mm4wE1iHRWdP

On Fri, 3 Sep 2021 15:45:00 +0200
Eric Auger <eauger@redhat.com> wrote:

> Hi Igor,
> On 7/8/21 5:46 PM, Igor Mammedov wrote:
> > Drop usage of packed structures and explicit endian conversions
> > when building MADT table for arm/x86 and use endian agnostic
> > build_append_int_noprefix() API to build it.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > CC: drjones@redhat.com
> > CC: peter.maydell@linaro.org
> > CC: shannon.zhaosl@gmail.com
> > CC: qemu-arm@nongnu.org
> > ---
> >  include/hw/acpi/acpi-defs.h |  84 --------------------
> >  hw/arm/virt-acpi-build.c    | 149 +++++++++++++++++++++---------------
> >  2 files changed, 89 insertions(+), 144 deletions(-)
> > 
> > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > index 3f174ba208..bcada37601 100644
> > --- a/include/hw/acpi/acpi-defs.h
> > +++ b/include/hw/acpi/acpi-defs.h
> > @@ -163,90 +163,6 @@ struct AcpiFacsDescriptorRev1 {
> >  } QEMU_PACKED;
> >  typedef struct AcpiFacsDescriptorRev1 AcpiFacsDescriptorRev1;
> >  
> > -/* Values for Type in APIC sub-headers */
> > -
> > -#define ACPI_APIC_GENERIC_CPU_INTERFACE 11
> > -#define ACPI_APIC_GENERIC_DISTRIBUTOR   12
> > -#define ACPI_APIC_GENERIC_MSI_FRAME     13
> > -#define ACPI_APIC_GENERIC_REDISTRIBUTOR 14
> > -#define ACPI_APIC_GENERIC_TRANSLATOR    15
> > -#define ACPI_APIC_RESERVED              16   /* 16 and greater are reserved */
> > -
> > -/*
> > - * MADT sub-structures (Follow MULTIPLE_APIC_DESCRIPTION_TABLE)
> > - */
> > -#define ACPI_SUB_HEADER_DEF   /* Common ACPI sub-structure header */\
> > -    uint8_t  type;                               \
> > -    uint8_t  length;
> > -
> > -/* Sub-structures for MADT */
> > -
> > -struct AcpiMadtGenericCpuInterface {
> > -    ACPI_SUB_HEADER_DEF
> > -    uint16_t reserved;
> > -    uint32_t cpu_interface_number;
> > -    uint32_t uid;
> > -    uint32_t flags;
> > -    uint32_t parking_version;
> > -    uint32_t performance_interrupt;
> > -    uint64_t parked_address;
> > -    uint64_t base_address;
> > -    uint64_t gicv_base_address;
> > -    uint64_t gich_base_address;
> > -    uint32_t vgic_interrupt;
> > -    uint64_t gicr_base_address;
> > -    uint64_t arm_mpidr;
> > -} QEMU_PACKED;
> > -
> > -typedef struct AcpiMadtGenericCpuInterface AcpiMadtGenericCpuInterface;
> > -
> > -/* GICC CPU Interface Flags */
> > -#define ACPI_MADT_GICC_ENABLED 1
> > -
> > -struct AcpiMadtGenericDistributor {
> > -    ACPI_SUB_HEADER_DEF
> > -    uint16_t reserved;
> > -    uint32_t gic_id;
> > -    uint64_t base_address;
> > -    uint32_t global_irq_base;
> > -    /* ACPI 5.1 Errata 1228 Present GIC version in MADT table */
> > -    uint8_t version;
> > -    uint8_t reserved2[3];
> > -} QEMU_PACKED;
> > -
> > -typedef struct AcpiMadtGenericDistributor AcpiMadtGenericDistributor;
> > -
> > -struct AcpiMadtGenericMsiFrame {
> > -    ACPI_SUB_HEADER_DEF
> > -    uint16_t reserved;
> > -    uint32_t gic_msi_frame_id;
> > -    uint64_t base_address;
> > -    uint32_t flags;
> > -    uint16_t spi_count;
> > -    uint16_t spi_base;
> > -} QEMU_PACKED;
> > -
> > -typedef struct AcpiMadtGenericMsiFrame AcpiMadtGenericMsiFrame;
> > -
> > -struct AcpiMadtGenericRedistributor {
> > -    ACPI_SUB_HEADER_DEF
> > -    uint16_t reserved;
> > -    uint64_t base_address;
> > -    uint32_t range_length;
> > -} QEMU_PACKED;
> > -
> > -typedef struct AcpiMadtGenericRedistributor AcpiMadtGenericRedistributor;
> > -
> > -struct AcpiMadtGenericTranslator {
> > -    ACPI_SUB_HEADER_DEF
> > -    uint16_t reserved;
> > -    uint32_t translation_id;
> > -    uint64_t base_address;
> > -    uint32_t reserved2;
> > -} QEMU_PACKED;
> > -
> > -typedef struct AcpiMadtGenericTranslator AcpiMadtGenericTranslator;
> > -
> >  /*
> >   * Generic Timer Description Table (GTDT)
> >   */
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index cd8b73dde9..dd8011a670 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -476,94 +476,123 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >  }
> >  
> >  /*
> > - * ACPI spec, Revision 5.0
> > + * ACPI spec, Revision 5.1 Errata A  
> It is a bit difficult to follow both the conversion and the upgrade of
> the version. May be worth splitting both concerns if sensible.

Change above is correcting stale comment, to document actual state of the code
there is no version upgrade here.

> >   * 5.2.12 Multiple APIC Description Table (MADT)
> >   */
> > +static void build_append_gicr(GArray *table_data, uint64_t base, uint32_t size)
> > +{
> > +    build_append_int_noprefix(table_data, 0xE, 1);  /* Type */
> > +    build_append_int_noprefix(table_data, 16, 1);   /* Length */
> > +    build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
> > +    /* Discovery Range Base Addres */
> > +    build_append_int_noprefix(table_data, base, 8);
> > +    build_append_int_noprefix(table_data, size, 4); /* Discovery Range Length */
> > +}
> > +
> >  static void
> >  build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >  {
> > +    int i;
> >      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> >      const MemMapEntry *memmap = vms->memmap;
> > -    const int *irqmap = vms->irqmap;
> > -    AcpiMadtGenericDistributor *gicd;
> > -    AcpiMadtGenericMsiFrame *gic_msi;
> > -    int i;
> >      AcpiTable table = { .sig = "APIC", .rev = 3, .oem_id = vms->oem_id,
> >                          .oem_table_id = vms->oem_table_id };
> >  
> >      acpi_init_table(&table, table_data);
> >      /* Local Interrupt Controller Address */
> >      build_append_int_noprefix(table_data, 0, 4);
> > -    build_append_int_noprefix(table_data, 0, 4); /* Flags */
> > -
> > -    gicd = acpi_data_push(table_data, sizeof *gicd);
> > -    gicd->type = ACPI_APIC_GENERIC_DISTRIBUTOR;
> > -    gicd->length = sizeof(*gicd);
> > -    gicd->base_address = cpu_to_le64(memmap[VIRT_GIC_DIST].base);
> > -    gicd->version = vms->gic_version;
> > +    build_append_int_noprefix(table_data, 0, 4);   /* Flags */
> > +
> > +    /* 5.2.12.15 GIC Distributor Structure */
> > +    build_append_int_noprefix(table_data, 0xC, 1); /* Type */
> > +    build_append_int_noprefix(table_data, 24, 1);  /* Length */
> > +    build_append_int_noprefix(table_data, 0, 2);   /* Reserved */
> > +    build_append_int_noprefix(table_data, 0, 4);   /* GIC ID */
> > +    /* Physical Base Address */
> > +    build_append_int_noprefix(table_data, memmap[VIRT_GIC_DIST].base, 8);
> > +    build_append_int_noprefix(table_data, 0, 4);   /* System Vector Base */
> > +    /* GIC version */
> > +    build_append_int_noprefix(table_data, vms->gic_version, 1);
> > +    build_append_int_noprefix(table_data, 0, 3);   /* Reserved */
> >  
> >      for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
> > -        AcpiMadtGenericCpuInterface *gicc = acpi_data_push(table_data,
> > -                                                           sizeof(*gicc));
> >          ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
> > +        uint64_t physical_base_address = 0, gich = 0, gicv = 0;
> > +        uint32_t vgic_interrupt = vms->virt ? PPI(ARCH_GIC_MAINT_IRQ) : 0;
> > +        uint32_t pmu_interrupt = arm_feature(&armcpu->env, ARM_FEATURE_PMU) ?
> > +                                             PPI(VIRTUAL_PMU_IRQ) : 0;
> >  
> > -        gicc->type = ACPI_APIC_GENERIC_CPU_INTERFACE;
> > -        gicc->length = sizeof(*gicc);
> >          if (vms->gic_version == 2) {
> > -            gicc->base_address = cpu_to_le64(memmap[VIRT_GIC_CPU].base);
> > -            gicc->gich_base_address = cpu_to_le64(memmap[VIRT_GIC_HYP].base);
> > -            gicc->gicv_base_address = cpu_to_le64(memmap[VIRT_GIC_VCPU].base);
> > +            physical_base_address = memmap[VIRT_GIC_CPU].base;
> > +            gicv = memmap[VIRT_GIC_VCPU].base;
> > +            gich = memmap[VIRT_GIC_HYP].base;
> >          }
> > -        gicc->cpu_interface_number = cpu_to_le32(i);
> > -        gicc->arm_mpidr = cpu_to_le64(armcpu->mp_affinity);
> > -        gicc->uid = cpu_to_le32(i);
> > -        gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
> >  
> > -        if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
> > -            gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
> > -        }
> > -        if (vms->virt) {
> > -            gicc->vgic_interrupt = cpu_to_le32(PPI(ARCH_GIC_MAINT_IRQ));
> > -        }
> > +        /* 5.2.12.14 GIC Structure */
> > +        build_append_int_noprefix(table_data, 0xB, 1);  /* Type */
> > +        build_append_int_noprefix(table_data, 76, 1);   /* Length */
> > +        build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
> > +        build_append_int_noprefix(table_data, i, 4);    /* GIC ID */
> > +        build_append_int_noprefix(table_data, i, 4);    /* ACPI Processor UID */
> > +        /* Flags */
> > +        build_append_int_noprefix(table_data, 1, 4);    /* Enabled */
> > +        /* Parking Protocol Version */
> > +        build_append_int_noprefix(table_data, 0, 4);
> > +        /* Performance Interrupt GSIV */
> > +        build_append_int_noprefix(table_data, pmu_interrupt, 4);
> > +        build_append_int_noprefix(table_data, 0, 8); /* Parked Address */
> > +        /* Physical Base Address */
> > +        build_append_int_noprefix(table_data, physical_base_address, 8);
> > +        build_append_int_noprefix(table_data, gicv, 8); /* GICV */
> > +        build_append_int_noprefix(table_data, gich, 8); /* GICH */
> > +        /* VGIC Maintenance interrupt */
> > +        build_append_int_noprefix(table_data, vgic_interrupt, 4);
> > +        build_append_int_noprefix(table_data, 0, 8);    /* GICR Base Address*/
> > +        /* MPIDR */
> > +        build_append_int_noprefix(table_data, armcpu->mp_affinity, 8);
> >      }
> >  
> >      if (vms->gic_version == 3) {
> > -        AcpiMadtGenericTranslator *gic_its;
> > -        int nb_redist_regions = virt_gicv3_redist_region_count(vms);
> > -        AcpiMadtGenericRedistributor *gicr = acpi_data_push(table_data,
> > -                                                         sizeof *gicr);
> > -
> > -        gicr->type = ACPI_APIC_GENERIC_REDISTRIBUTOR;
> > -        gicr->length = sizeof(*gicr);
> > -        gicr->base_address = cpu_to_le64(memmap[VIRT_GIC_REDIST].base);
> > -        gicr->range_length = cpu_to_le32(memmap[VIRT_GIC_REDIST].size);
> > -
> > -        if (nb_redist_regions == 2) {
> > -            gicr = acpi_data_push(table_data, sizeof(*gicr));
> > -            gicr->type = ACPI_APIC_GENERIC_REDISTRIBUTOR;
> > -            gicr->length = sizeof(*gicr);
> > -            gicr->base_address =
> > -                cpu_to_le64(memmap[VIRT_HIGH_GIC_REDIST2].base);
> > -            gicr->range_length =
> > -                cpu_to_le32(memmap[VIRT_HIGH_GIC_REDIST2].size);
> > +        build_append_gicr(table_data, memmap[VIRT_GIC_REDIST].base,
> > +                                      memmap[VIRT_GIC_REDIST].size);
> > +        if (virt_gicv3_redist_region_count(vms) == 2) {
> > +            build_append_gicr(table_data, memmap[VIRT_HIGH_GIC_REDIST2].base,
> > +                                          memmap[VIRT_HIGH_GIC_REDIST2].size);
> >          }
> >  
> >          if (its_class_name() && !vmc->no_its) {
> > -            gic_its = acpi_data_push(table_data, sizeof *gic_its);
> > -            gic_its->type = ACPI_APIC_GENERIC_TRANSLATOR;
> > -            gic_its->length = sizeof(*gic_its);
> > -            gic_its->translation_id = 0;
> > -            gic_its->base_address = cpu_to_le64(memmap[VIRT_GIC_ITS].base);
> > +            /*
> > +             * FIXME: Structure is from Revision 6.0 where 'GIC Structure'
> > +             * has additional fields on top of implemented 5.1 Errata A
> > +             * make it consistent with v6.0 if ITS is present or bump
> > +             * everything to v6.0 unconditionally  
> Do you mean some parts are 5.1 errata A and some others are 6.0 already?
yep, I'm trying to minimize changes not relevant to refactoring,
so here I basically mark TODO item and document the current state of the code
/some other patches also have similar comments for out of scope thing I noticed/
there is no change to the table contents.

> > +             */
> > +            /*
> > +             * ACPI spec, Revision  6.0
> > +             * 5.2.12.18 GIC ITS Structure
> > +             */
> > +            build_append_int_noprefix(table_data, 0xF, 1);  /* Type */
> > +            build_append_int_noprefix(table_data, 16, 1);   /* Length */  
> this is 20 and not 16. Currently it fails with ITS.

it was yet another Errata, already fixed in current WIP.

comment above now looks like this:


+            /*
+             * FIXME: Structure is from Revision 6.0 where 'GIC Structure'
+             * has additional fields on top of implemented 5.1 Errata A,
+             * to make it consistent with v6.0 we need to bump everything
+             * to v6.0
+             */
+            /*
+             * ACPI spec, Revision 6.0 Errata A
+             * (original 6.0 definition has invalid Length)
+             * 5.2.12.18 GIC ITS Structure
+             */


> With that fix
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> 
> Thanks
> 
> Eric
> 
> > +            build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
> > +            build_append_int_noprefix(table_data, 0, 4);    /* GIC ITS ID */
> > +            /* Physical Base Address */
> > +            build_append_int_noprefix(table_data, memmap[VIRT_GIC_ITS].base, 8);
> > +            build_append_int_noprefix(table_data, 0, 4);    /* Reserved */
> >          }
> >      } else {
> > -        gic_msi = acpi_data_push(table_data, sizeof *gic_msi);
> > -        gic_msi->type = ACPI_APIC_GENERIC_MSI_FRAME;
> > -        gic_msi->length = sizeof(*gic_msi);
> > -        gic_msi->gic_msi_frame_id = 0;
> > -        gic_msi->base_address = cpu_to_le64(memmap[VIRT_GIC_V2M].base);
> > -        gic_msi->flags = cpu_to_le32(1);
> > -        gic_msi->spi_count = cpu_to_le16(NUM_GICV2M_SPIS);
> > -        gic_msi->spi_base = cpu_to_le16(irqmap[VIRT_GIC_V2M] + ARM_SPI_BASE);
> > +        const uint16_t spi_base = vms->irqmap[VIRT_GIC_V2M] + ARM_SPI_BASE;
> > +
> > +        /* 5.2.12.16 GIC MSI Frame Structure */
> > +        build_append_int_noprefix(table_data, 0xD, 1);  /* Type */
> > +        build_append_int_noprefix(table_data, 24, 1);   /* Length */
> > +        build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
> > +        build_append_int_noprefix(table_data, 0, 4);    /* GIC MSI Frame ID */
> > +        /* Physical Base Address */
> > +        build_append_int_noprefix(table_data, memmap[VIRT_GIC_V2M].base, 8);
> > +        build_append_int_noprefix(table_data, 1, 4);    /* Flags */
> > +        /* SPI Count */
> > +        build_append_int_noprefix(table_data, NUM_GICV2M_SPIS, 2);
> > +        build_append_int_noprefix(table_data, spi_base, 2); /* SPI Base */
> >      }
> >      acpi_table_composed(linker, &table);
> >  }
> >   
> 

