Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp188733lfm;
        Tue, 18 May 2021 01:16:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMFt1L3lyXbwhJBf3tUurxZUf9ryCjqy7Lz2llpSI8yVEmac0Kv3LyJKjVYU4UTZ6F7Qpr
X-Received: by 2002:ab0:59cb:: with SMTP id k11mr5177311uad.100.1621325787910;
        Tue, 18 May 2021 01:16:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621325787; cv=none;
        d=google.com; s=arc-20160816;
        b=mIpgKvihB+rXnyAhx86W3/OFt3F0Pe5tVRlFEyKku6PmxJelJmKF5ZqWnsqGDTL7O0
         mRXXplXL1BrjUUVJ9i2HhiasYdWms1yktDrO4eg3TFnv+6KDUzecj/CtbgXqQp7o68CV
         B9+/wzzsvXcpCShWOU+xQaHVZBi/oYP88QRbIgfphIOhci30SFGkHQmlzK6Tp2gr7Eyq
         X3rjfI8nCCBewGDY2KdX7m0EGWitgi6JT/v8uMarXRpMqGZ+cardSPgVLKAdRVr0rXVG
         pCoxHhmQSH+ZePMeHGS7SK/81yvW4ArgA69vE5xKXr0tC4nwHHuZxonYFpo0sqEGOuRf
         FPXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=WYUbH1vp7lcuyX1ydcysonHAqGTp/+jd+XuK4Y1GRUU=;
        b=h6uaRb5fdoj0olf2d5yKpRQlMGAsRe9G1B/wN1vU9bS7JvV9l8aoxmJRk+oLV8/D/W
         3mKBN1Y1c+YWQovmJMyfTi/U/DJ9w0RGG1nESMrBe8Q/jiKu5oOoL0xkR9CdVO8Ammvf
         lvE2aOQEdrvPcdPc6JRBgezfmj2jGDzrEBgQ5jgP6OHMsoNX03iSuJs0FQyL547Ki4jk
         ryK3Mpuw/LPruPXTF3lfLTfn0OjXkZP4SKyCQWJIkomZSdkjQfg0gNE88FMMfrJDxPFP
         2EXRZV1Qo5nnGC/wsXOH/dIm3uMN93FqXn93BscjxcyWfsNNpgVavBaC6NXDwj3RBzm4
         ewZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=f8W5R7D2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l127si3512735vkh.38.2021.05.18.01.16.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 01:16:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=f8W5R7D2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liutv-0000YZ-4P
	for alex.bennee@linaro.org; Tue, 18 May 2021 04:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liutU-0000Xe-EQ
 for qemu-arm@nongnu.org; Tue, 18 May 2021 04:16:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liutR-0005sc-5P
 for qemu-arm@nongnu.org; Tue, 18 May 2021 04:15:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621325755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WYUbH1vp7lcuyX1ydcysonHAqGTp/+jd+XuK4Y1GRUU=;
 b=f8W5R7D2g1ifrh4Dus9Wl07Ki0bJ4NwjbBd8DVWrrlVzZmb4PxLGPQOXHrxBbEeuTgfPBV
 Jdebp7xC7j3uVwcsfcPG9eVVI8Fe0vVPDmSnPXb+5QV3K5jKQJid+4Qj6xknL0f44a4Dv5
 zaDl/9mh0NBSJVSzNyOmCR6woBcAzmk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-shGN1f1FPXGm81VDfM4NoQ-1; Tue, 18 May 2021 04:15:54 -0400
X-MC-Unique: shGN1f1FPXGm81VDfM4NoQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 i3-20020aa7dd030000b029038ce772ffe4so5364762edv.12
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 01:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WYUbH1vp7lcuyX1ydcysonHAqGTp/+jd+XuK4Y1GRUU=;
 b=MUpLQoIxX8gPv7vOU8fGJYS+RmToh72kTYiaYKps47y7F0VpzXQB0Ci7+goOt0I7f3
 3JosVl83C2piiafHwS0zaXsKZ3te9/dOhWdPph/w0Q1Cj73ES2fIbnxlvhyn8+xHYeo9
 A6wcTanC8wtmWVZCSIBl1QBNqkYJU3Lkv/jy8vUKQnbrfAsp2AQFpKZX3Yi1yHrxxf4G
 8zke3WkKsdkcmKnBxTXffRaMqbZ65MQpl+5XOch8EP+mOJsFSRP4NDTe+DzV4FmTM2xO
 eFnD7aO3CEqiUtCZWFrZMsw1pimxeM4tHMIIKFbOaFY2ddlEkpJ6QsNhrk+GoU4huqQa
 FDPQ==
X-Gm-Message-State: AOAM533u/he6bX9E1T5wJ7CG6LyKWFpJbcL6jC2A89lcZE6CR5pDQSw6
 vUPboDNRdhsmT4CapcctFyKunxPuHgYio8SWZLnNNijAh/B5brl2zW72PXcGHp1t1JrqKnN6Zuc
 ZUoM0nEVMXL1C
X-Received: by 2002:aa7:db57:: with SMTP id n23mr5620137edt.229.1621325753273; 
 Tue, 18 May 2021 01:15:53 -0700 (PDT)
X-Received: by 2002:aa7:db57:: with SMTP id n23mr5620101edt.229.1621325752940; 
 Tue, 18 May 2021 01:15:52 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id l11sm12191798edw.42.2021.05.18.01.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 01:15:52 -0700 (PDT)
Date: Tue, 18 May 2021 10:15:50 +0200
From: Andrew Jones <drjones@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v3 6/9] hw/arm/virt-acpi-build: Use possible cpus in
 generation of MADT
Message-ID: <20210518081550.d3hof7jr5soeuwo5@gator.home>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-7-wangyanan55@huawei.com>
 <20210517074256.xjqwejbi4mfsvug2@gator.home>
 <ac1b0f17-523d-adb8-c4f4-aa5c93966726@huawei.com>
MIME-Version: 1.0
In-Reply-To: <ac1b0f17-523d-adb8-c4f4-aa5c93966726@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j7xgFIWhgepE

On Tue, May 18, 2021 at 12:27:59AM +0800, wangyanan (Y) wrote:
> Hi Drew,
> 
> On 2021/5/17 15:42, Andrew Jones wrote:
> > On Sun, May 16, 2021 at 06:28:57PM +0800, Yanan Wang wrote:
> > > When building ACPI tables regarding CPUs we should always build
> > > them for the number of possible CPUs, not the number of present
> > > CPUs. So we create gicc nodes in MADT for possible cpus and then
> > > ensure only the present CPUs are marked ENABLED. Furthermore, it
> > > also needed if we are going to support CPU hotplug in the future.
> > > 
> > > Co-developed-by: Andrew Jones <drjones@redhat.com>
> > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > Co-developed-by: Ying Fang <fangying1@huawei.com>
> > > Signed-off-by: Ying Fang <fangying1@huawei.com>
> > > Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
> > > Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> > > ---
> > >   hw/arm/virt-acpi-build.c | 29 +++++++++++++++++++++++++----
> > >   1 file changed, 25 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > index a2d8e87616..4d64aeb865 100644
> > > --- a/hw/arm/virt-acpi-build.c
> > > +++ b/hw/arm/virt-acpi-build.c
> > > @@ -481,6 +481,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> > >       const int *irqmap = vms->irqmap;
> > >       AcpiMadtGenericDistributor *gicd;
> > >       AcpiMadtGenericMsiFrame *gic_msi;
> > > +    MachineClass *mc = MACHINE_GET_CLASS(vms);
> > > +    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(MACHINE(vms));
> > > +    bool pmu;
> > >       int i;
> > >       acpi_data_push(table_data, sizeof(AcpiMultipleApicTable));
> > > @@ -491,11 +494,21 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> > >       gicd->base_address = cpu_to_le64(memmap[VIRT_GIC_DIST].base);
> > >       gicd->version = vms->gic_version;
> > > -    for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
> > > +    for (i = 0; i < possible_cpus->len; i++) {
> > >           AcpiMadtGenericCpuInterface *gicc = acpi_data_push(table_data,
> > >                                                              sizeof(*gicc));
> > >           ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
> > > +        /*
> > > +         * PMU should have been either implemented for all CPUs or not,
> > > +         * so we only get information from the first CPU, which could
> > > +         * represent the others.
> > > +         */
> > > +        if (i == 0) {
> > > +            pmu = arm_feature(&armcpu->env, ARM_FEATURE_PMU);
> > > +        }
> > > +        assert(!armcpu || arm_feature(&armcpu->env, ARM_FEATURE_PMU) == pmu);
> > This doesn't belong in this patch. The commit message doesn't even mention
> > it. Also, I don't think we should do this here at all. If we want to
> > ensure that all cpus have a pmu when one does, then that should be done
> > somewhere like machvirt_init(), not in ACPI generation code which doesn't
> > even run for non-ACPI VMs.
> Sorry, I should have stated the reason of this change in the commit message.
> Actually code change here and mp_affinity part below aim to make it correct
> to create gicc entries for all possible cpus.
> 
> We only initialize and realize cpuobj for present cpus in machvirt_init,
> so that we will get null ARMCPU pointer here for the non-present cpus,
> and consequently we won't able to check from "armcpu->env" for the
> non-present cpus. The same about "armcpu->mp_affinity".
> 
> That's the reason I use PMU configuration of the first cpu to represent the
> others. I assume all cpus should have a pmu when one does here since it's
> how armcpu->env is initialized. And the assert seems not needed here.
> 
> Is there any better alternative way about this?

Move the

  if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
      gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
  }

into the if (possible_cpus->cpus[i].cpu != NULL) block?

> > > +
> > >           gicc->type = ACPI_APIC_GENERIC_CPU_INTERFACE;
> > >           gicc->length = sizeof(*gicc);
> > >           if (vms->gic_version == 2) {
> > > @@ -504,11 +517,19 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> > >               gicc->gicv_base_address = cpu_to_le64(memmap[VIRT_GIC_VCPU].base);
> > >           }
> > >           gicc->cpu_interface_number = cpu_to_le32(i);
> > > -        gicc->arm_mpidr = cpu_to_le64(armcpu->mp_affinity);
> > > +        gicc->arm_mpidr = cpu_to_le64(possible_cpus->cpus[i].arch_id);
> > Hmm, I think we may have a problem. I don't think there's any guarantee
> > that possible_cpus->cpus[i].arch_id == armcpu->mp_affinity, because
> > arch_id comes from virt_cpu_mp_affinity(), which is arm_cpu_mp_affinity,
> > but with a variable cluster size, however mp_affinity comes from
> > arm_cpu_mp_affinity with a set cluster size. Also, when KVM is used,
> > then all bets are off as to what mp_affinity is.
> Right! Arch_id is initialized by virt_cpu_mp_affinity() in machvirt and then
> mp_affinity is initialized by arch_id. Here they two have the same value.
> 
> But mp_affinity will be overridden in kvm_arch_init_vcpu() when KVM is
> enabled. Here they two won't have the same value.
> > We need to add some code that ensures arch_id == mp_affinity,
> Can we also update the arch_id at the same time when we change mp_affinity?

The proper fix is to send patches to KVM enabling userspace to control
MPIDR. Otherwise we can't be sure we don't have inconsistencies in QEMU,
since some user of possible_cpus could have made decisions or copied IDs
prior to KVM vcpu init time. Now, all that said, I think
virt_cpu_mp_affinity() should be generating the same ID as KVM does, so
maybe it doesn't matter in practice right now, but we're living with the
risk that KVM could change. For now, maybe we should just sanity check
that the KVM values match the possible_cpus values and emit warnings if
they don't?

Thanks,
drew

