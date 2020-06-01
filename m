Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3183985lfc;
        Mon, 1 Jun 2020 08:04:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbJj789uVIlgZEdVWTz4RQXhSYrv1SIyYglyryfGGEZRx/AvZoyV0XonfWHIyHOHR57VRn
X-Received: by 2002:a9f:3049:: with SMTP id i9mr2946671uab.113.1591023897960;
        Mon, 01 Jun 2020 08:04:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591023897; cv=none;
        d=google.com; s=arc-20160816;
        b=OhG5un8J5kYcAvjHfLCYs7BjifmKYNSj1YMUfShsc4FnXafZ1cLskoQtQjFiqEg7Pd
         jlKOZkA9zF3l/gQmQrcBMBjOf8ntxHRttxFkX+toi0ehj2SX8mfvcarjrFMcfAHaAf+V
         9Vcnc8VRC9rhX7VkZASNFMviSmSGZyWJMJGp4sXmmJ8O/umP8ohmegcv3/VaQJ4xEIFk
         HEAfyD/HJuJL2C0VBWWqNp9oVvL4ikGB7JIj79CW1rN30BPuwrkiyNFnR6zxnvExVJqj
         /0kJqc/P61Uv1tRVMnRI9QgvYTNL20MVZ4pdPbaD1qaE8XNkwFkz6P8lTH0C9FGSk4Zf
         tWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :message-id:date:thread-index:thread-topic:subject:to:from;
        bh=eZF71I3X7PXe6VbVOT6+g3/pXWSJCx+8ke1iUz9tOeg=;
        b=iwmranTlTlLk2hSRAxinCPU3fMXfLAC8uXoMs2UZLIUsswd8VHAzbMqu637ZOO/BNr
         hY5AhTqUPwE/NOrLZtuEp+F4hmz11Im5hmJdDAz6La+EeEPoaEzTeID45Taz69gAWGlb
         IaUzDBmabIUVjSdSl904OdOJ53qEXu6IvWE67ZGNP8MK69ddQVP/X2+vDxVBb50fl6RX
         J9HqDvQ04iHeja75uyJmKP5tD6jtTEF4COtoSHp2kEVfC6pC6VSlwP8XWcJMwRJyDuq7
         FEDJOcD4BvFQou3Urh24AnBiz0Di2P4zqhprJIcw0KKkMYJRElksJNAyDR3lcU+Iyn9n
         ek3g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b3si426560uaj.24.2020.06.01.08.04.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 08:04:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jflzl-0003y9-9H
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 11:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jflzc-0003vT-Bo; Mon, 01 Jun 2020 11:04:48 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2101 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jflzb-0003GK-3J; Mon, 01 Jun 2020 11:04:47 -0400
Received: from lhreml707-chm.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id 41EB44215281041623E2;
 Mon,  1 Jun 2020 16:04:34 +0100 (IST)
Received: from lhreml703-chm.china.huawei.com (10.201.108.52) by
 lhreml707-chm.china.huawei.com (10.201.108.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Mon, 1 Jun 2020 16:04:33 +0100
Received: from lhreml703-chm.china.huawei.com ([10.201.68.198]) by
 lhreml703-chm.china.huawei.com ([10.201.68.198]) with mapi id 15.01.1913.007; 
 Mon, 1 Jun 2020 16:04:33 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>
Subject: [Question] Regarding PMU initialization within the QEMU for ARM VCPUs
Thread-Topic: [Question] Regarding PMU initialization within the QEMU for ARM
 VCPUs
Thread-Index: AdY3+/mIYt1+TQdDQmymnxAa7PkUWw==
Date: Mon, 1 Jun 2020 15:04:33 +0000
Message-ID: <b2e401cd17fe49d792d09b31bd726e35@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.30.0]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.76.210;
 envelope-from=salil.mehta@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 11:04:34
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Igor Mammedov <imammedo@redhat.com>, "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3xfFcZ6GK7Ch

Hello,
I could see below within function fdt_add_pmu_nodes() part of
hw/arm/virt.c during virt machine initialization time:

Observation:
In below function, support of PMU feature is being checked for
each vcpu and if the PMU is found part of the features then PMU
is initialized with in the host/KVM. But if there is even one
vcpu which is found to not support the PMU then loop is exited
and PMU is not initialized for the rest of the vcpus as well.

static void fdt_add_pmu_nodes(const VirtMachineState *vms)
{
    CPUState *cpu;
    ARMCPU *armcpu;
    uint32_t irqflags =3D GIC_FDT_IRQ_FLAGS_LEVEL_HI;

    CPU_FOREACH(cpu) {
        armcpu =3D ARM_CPU(cpu);
        if (!arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
            return; ------> Here, loop exits & function returns
        }
        if (kvm_enabled()) {
            if (kvm_irqchip_in_kernel()) {
                kvm_arm_pmu_set_irq(cpu, PPI(VIRTUAL_PMU_IRQ));
            }
            kvm_arm_pmu_init(cpu);
        }
    }

    if (vms->gic_version =3D=3D VIRT_GIC_VERSION_2) {
        irqflags =3D deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
                             GIC_FDT_IRQ_PPI_CPU_WIDTH,
                             (1 << vms->smp_cpus) - 1);
    }

    armcpu =3D ARM_CPU(qemu_get_cpu(0));
    qemu_fdt_add_subnode(vms->fdt, "/pmu");
    if (arm_feature(&armcpu->env, ARM_FEATURE_V8)) {
        const char compat[] =3D "arm,armv8-pmuv3";
        qemu_fdt_setprop(vms->fdt, "/pmu", "compatible",
                         compat, sizeof(compat));
        qemu_fdt_setprop_cells(vms->fdt, "/pmu", "interrupts",
                               GIC_FDT_IRQ_TYPE_PPI, VIRTUAL_PMU_IRQ, irqfl=
ags);
    }
}

Questions:
Q1. Not sure what is the logic of the premature exit and not
    continuing with further checks and initialization of other
    VCPU PMUs?
Q2. Does it even makes sense to have PMUs initialized for some
    vcpus and not for others unless we have heterogeneous system?=20
Q3. Also, there is a per virt machine knob of vcc->no_pmu.
    This is something which user could specify at the init time
    and perhaps only once but we don't use it for ARM. Perhaps
    should have been used even before entering this function
    to enable or disable the support as per user config?
Q4. This function  fdt_* looks to be wrongly named. The info
    being initialized here shall be used even when ACPI is
    being used. Initialization part and FDT info looked
    mixed up here if I am right?


Best regards
Salil


