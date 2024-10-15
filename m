Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp2341631njb;
        Tue, 15 Oct 2024 03:10:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVbX49u0opvY3Kw7FWDBfSSdSIZN27UQHevFoHJ05pIYKxD9Fcs2g7Kr7M0b6PNF4u5paurzZsXe6AP2Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEv9Iw25wAkRMsfTqPQww88sjy7/jDQWB6I06eohbE0gt+mBI8Cpa/fGz96J6Bhg24wi6GV
X-Received: by 2002:a5d:40c1:0:b0:374:c614:73df with SMTP id ffacd0b85a97d-37d552a3962mr9014223f8f.57.1728987025495;
        Tue, 15 Oct 2024 03:10:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728987025; cv=none;
        d=google.com; s=arc-20240605;
        b=gCfSpKBEe11bxFhk+psUwSbJD21wuIq04+mHiqR1ykKat7bH7PY7v++1WaFb/duwLt
         SvrnUmVZBUXxSu/aNt1FTpjBSx8jG57F4hhqvoVMswMjhi1bWlp4StxxjJ4KGMS8kaJ6
         NHQwipOD0axf2oqxH9mnuZlXZ8z+fUk+5s08XIvIl1L3fuTDSPi0tG91nxrtrvsgYhi4
         AnzQRUh3u8GhQb3Bak88QM7w7kN9LZkGJcQIviJmMAST2yq3i10pdFVWRwyGv7wT+YUu
         hAMFJn/PgfZjhxivammOsjTwYNPQXzbWwH3NSm6eK3V1xcejpoBsmF+b+Iqm9ewUG0Qi
         Ae2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=J2WNTWDyB3vhBSXuQB5+cPu9YZDdBG5FQuH5c9nGpS4=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=bYtDn/zL/SO73eTdQbeaPfHP/6n+ZlvtqFFaNY1UPbjPlC4nV+phlayd4usB1y3gWp
         saMyyt2ytmDOOtei3Lg6l6UwTmj6mPG7hoPsVX8784DE6AFkfAM0JFVrT0FMw2gx/fNf
         AIbndHbct8q+9OQhKsqVZP4dfa/WXO765NPczXMOoWeCZxYsTiEDAXxLXmeu1v4pQ044
         KfjEzRaHpxLzNCAVL2+0CXTXQRKwS4ak3Q9CcPFn7SHYua9ggUg5qdRTOcGtKh2AO5qp
         lNHkE2fNY8baPs564BfRY/t21r3Zly+pq1AorRyk39faCLQwCcixDVyfMuPvMN28Wpxe
         Ik4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d7fc9c1e4si533188f8f.451.2024.10.15.03.10.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2024 03:10:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XSVFp38SNz6K987;
	Tue, 15 Oct 2024 18:09:50 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 92B7F140B63;
	Tue, 15 Oct 2024 18:10:24 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.146.149) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 12:10:04 +0200
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <peterx@redhat.com>, <eric.auger@redhat.com>,
	<will@kernel.org>, <ardb@kernel.org>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>, <npiggin@gmail.com>,
	<harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
	<darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
	<vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
	<miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH RFC V5 28/30] target/arm/kvm: Write vCPU's state back to KVM on cold-reset
Date: Tue, 15 Oct 2024 11:00:10 +0100
Message-ID: <20241015100012.254223-29-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015100012.254223-1-salil.mehta@huawei.com>
References: <20241015100012.254223-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.146.149]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: DnD7xIam+9jb

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Previously, all `PSCI_CPU_{ON, OFF}` calls were handled directly by KVM.
However, with the introduction of vCPU hotplug, these hypervisor calls are now
trapped to QEMU for policy checks. This shift can lead to inconsistent vCPU
states between KVM and QEMU, particularly when the vCPU has been recently
plugged in and is transitioning from the unparked state in QOM. Therefore, it is
crucial to synchronize the vCPU state with KVM, especially in the context of a
cold reset of the QOM vCPU.

To ensure this synchronization, mark the QOM vCPU as "dirty" to trigger a call
to `kvm_arch_put_registers()`. This guarantees that KVM’s `MP_STATE` is updated
accordingly, forcing synchronization of the `mp_state` between QEMU and KVM.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 target/arm/kvm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 61ac7f6093..4a10e63877 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1038,6 +1038,7 @@ void kvm_arm_cpu_post_load(ARMCPU *cpu)
 void kvm_arm_reset_vcpu(ARMCPU *cpu)
 {
     int ret;
+    CPUState *cs = CPU(cpu);
 
     /* Re-init VCPU so that all registers are set to
      * their respective reset values.
@@ -1059,6 +1060,12 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu)
      * for the same reason we do so in kvm_arch_get_registers().
      */
     write_list_to_cpustate(cpu);
+
+    /*
+     * Ensure we call kvm_arch_put_registers(). The vCPU isn't marked dirty if
+     * it was parked in KVM and is now booting from a PSCI CPU_ON call.
+     */
+    cs->vcpu_dirty = true;
 }
 
 void kvm_arm_create_host_vcpu(ARMCPU *cpu)
-- 
2.34.1
