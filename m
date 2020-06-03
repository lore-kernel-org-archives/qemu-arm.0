Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp295470lfc;
        Wed, 3 Jun 2020 01:38:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQ1gdmaOOHlSO9JHrENFhycbzgQcJvCIpBhnKwmcOjoZ3PVkdjzkUePwXF597HYJVc72mD
X-Received: by 2002:a25:7610:: with SMTP id r16mr6139973ybc.75.1591173505698;
        Wed, 03 Jun 2020 01:38:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591173505; cv=none;
        d=google.com; s=arc-20160816;
        b=ew+oIzOEkwL6kSzjeJ6yEXxhQ/afpji8f6dlDF5p9t0204/5+XOxE3FstYzmqD7ouZ
         PShO/hERBtDGeNRaeVcI4eGbHJxcBYsu5U1JU9VDHNZmRSxAv45fQSmrwpT1ythU18Co
         vUczRDZKobrKfQUe2OqvGnvtlCyL/x8N2j/k5Xp9gBr+R3JkTN0iAVbsBeZ6iJKDbeFT
         78dG/9erGJe5aJM6yKIlxCAtddHvlzh52py2iD2sBl4mmfTHnMI1GJ56yLhswbhG1IZc
         tsMnTCpfmjKE8VQZ1ZowzWbgIVQmd0E5E1cJHzCF1FuigrNL3eEVf8+wYrBzjy6qPWGh
         Eq1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :message-id:date:thread-index:thread-topic:subject:to:from;
        bh=9HNbtmJDuJAhSmtyQ9/RsEh+26C2GabSBuctij6jwrs=;
        b=DI0lYQSMFfzbX2XTKS3dZtcwriaA2Bi1UFRxLTE10RxBbTaDpF4Zlp1ZuJC+eP2c8/
         nBMvYFqHbQFvTT9DN6Lq6PvjHpgB+cUF4rpheM+PX2NXSvs8iHUSR8hBMkJXHNDw+OQO
         dUIuwkS8EhWnsJaBMbdWAfeLhHVLfhrCb4re4NUUCRSU/huODfDpaAWU0VD5nZpmmZoR
         Vebzm0Od36KEXCMadGkAKdyljwKibAqggQsh7v9hSeIzLbC0tui1WRMemruK+iO70Cr9
         xVbTRWi/399bCvIKVztrRdk+SrfQPow+qAnc0p7BIiBLnOAK276CI0YpLGkRmO3LUPM4
         /dFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j70si1121200ybj.220.2020.06.03.01.38.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jun 2020 01:38:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgOun-0006zD-3V
	for alex.bennee@linaro.org; Wed, 03 Jun 2020 04:38:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jgOuf-0006yo-Tu; Wed, 03 Jun 2020 04:38:17 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2102 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jgOue-0005o3-K8; Wed, 03 Jun 2020 04:38:17 -0400
Received: from lhreml706-chm.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id 82256929B881A35E64F9;
 Wed,  3 Jun 2020 09:38:07 +0100 (IST)
Received: from lhreml703-chm.china.huawei.com (10.201.108.52) by
 lhreml706-chm.china.huawei.com (10.201.108.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Wed, 3 Jun 2020 09:38:07 +0100
Received: from lhreml703-chm.china.huawei.com ([10.201.68.198]) by
 lhreml703-chm.china.huawei.com ([10.201.68.198]) with mapi id 15.01.1913.007; 
 Wed, 3 Jun 2020 09:38:06 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>
Subject: RE: [Question] Regarding PMU initialization within the QEMU for ARM
 VCPUs
Thread-Topic: [Question] Regarding PMU initialization within the QEMU for ARM
 VCPUs
Thread-Index: AdY3+/mIYt1+TQdDQmymnxAa7PkUWwBhLxBA
Date: Wed, 3 Jun 2020 08:38:06 +0000
Message-ID: <97cd83a6eee449779c193ac9fd3bbea3@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.64.231]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.76.210;
 envelope-from=salil.mehta@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 04:38:07
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Gavin Shan <gshan@redhat.com>,
 "drjones@redhat.com" <drjones@redhat.com>, "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5prll1VunSbp

Hello,
Any comments on this would be really helpful & much appreciated.


Thanks in anticipation!

Best regards
Salil
> -----Original Message-----
> From: Salil Mehta
> Sent: Monday, June 1, 2020 4:00 PM
> To: qemu-devel@nongnu.org; qemu-arm@nongnu.org
> Cc: Peter Maydell <peter.maydell@linaro.org>; mst@redhat.com; Igor Mammed=
ov
> <imammedo@redhat.com>
> Subject: [Question] Regarding PMU initialization within the QEMU for ARM =
VCPUs
>=20
> Hello,
> I could see below within function fdt_add_pmu_nodes() part of
> hw/arm/virt.c during virt machine initialization time:
>=20
> Observation:
> In below function, support of PMU feature is being checked for
> each vcpu and if the PMU is found part of the features then PMU
> is initialized with in the host/KVM. But if there is even one
> vcpu which is found to not support the PMU then loop is exited
> and PMU is not initialized for the rest of the vcpus as well.
>=20
> static void fdt_add_pmu_nodes(const VirtMachineState *vms)
> {
>     CPUState *cpu;
>     ARMCPU *armcpu;
>     uint32_t irqflags =3D GIC_FDT_IRQ_FLAGS_LEVEL_HI;
>=20
>     CPU_FOREACH(cpu) {
>         armcpu =3D ARM_CPU(cpu);
>         if (!arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
>             return; ------> Here, loop exits & function returns
>         }
>         if (kvm_enabled()) {
>             if (kvm_irqchip_in_kernel()) {
>                 kvm_arm_pmu_set_irq(cpu, PPI(VIRTUAL_PMU_IRQ));
>             }
>             kvm_arm_pmu_init(cpu);
>         }
>     }
>=20
>     if (vms->gic_version =3D=3D VIRT_GIC_VERSION_2) {
>         irqflags =3D deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
>                              GIC_FDT_IRQ_PPI_CPU_WIDTH,
>                              (1 << vms->smp_cpus) - 1);
>     }
>=20
>     armcpu =3D ARM_CPU(qemu_get_cpu(0));
>     qemu_fdt_add_subnode(vms->fdt, "/pmu");
>     if (arm_feature(&armcpu->env, ARM_FEATURE_V8)) {
>         const char compat[] =3D "arm,armv8-pmuv3";
>         qemu_fdt_setprop(vms->fdt, "/pmu", "compatible",
>                          compat, sizeof(compat));
>         qemu_fdt_setprop_cells(vms->fdt, "/pmu", "interrupts",
>                                GIC_FDT_IRQ_TYPE_PPI, VIRTUAL_PMU_IRQ, irq=
flags);
>     }
> }
>=20
> Questions:
> Q1. Not sure what is the logic of the premature exit and not
>     continuing with further checks and initialization of other
>     VCPU PMUs?
> Q2. Does it even makes sense to have PMUs initialized for some
>     vcpus and not for others unless we have heterogeneous system?
> Q3. Also, there is a per virt machine knob of vcc->no_pmu.
>     This is something which user could specify at the init time
>     and perhaps only once but we don't use it for ARM. Perhaps
>     should have been used even before entering this function
>     to enable or disable the support as per user config?
> Q4. This function  fdt_* looks to be wrongly named. The info
>     being initialized here shall be used even when ACPI is
>     being used. Initialization part and FDT info looked
>     mixed up here if I am right?
>=20
>=20
> Best regards
> Salil
>=20

