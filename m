Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp594923njl;
        Tue, 8 Oct 2024 20:20:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2wm6p0mxw/nqAxwVByLec/ddsAoMWth5jISLnnC3JIm6sM5GS2x0/uqj6ztXNKeALCyAIBcyPlR/ezw==@linaro.org
X-Google-Smtp-Source: AGHT+IEbETnLRp6OIIZCuqmNuXzNp2Vlg8VkreYMMo16b+58OR0nSHCXmUr2+0dgRYtG27qZg2N6
X-Received: by 2002:a5d:456f:0:b0:374:b6f3:728d with SMTP id ffacd0b85a97d-37d3ab31248mr445952f8f.46.1728444017919;
        Tue, 08 Oct 2024 20:20:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728444017; cv=none;
        d=google.com; s=arc-20240605;
        b=AUpRqJwuFCvbd78q/onv1XgaBxDFcDLdRtJiXUDSgE6PFYd+Z7OpEhoJQ3n1pM4H+1
         cUuGJ2p3ldQvlONUArBInTgK1ugULrCgT9xZa4PSkFynCnZ0HtMWW+rwnFXbex1Z4SOW
         VAYGUKP9ddhpchPiUzw1EOZtlnRaJyN6IFYgaTh6+9V6hvVDmCQ6HauSf0rrffUC2E0P
         QS6bSKpAdXt6D0TNdC8AlbJTp76rjmYdTyz92RTkTEPZc1IGbAkyBV9Z9b1Obk5D3kvS
         v5i8TSQSy3lIwLgX4fxHLoJVyQuoKaD+Fkn1DBBW6ZC46tvATj7mA7OmT6QdUMpij9kQ
         DTPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Hcg42jnB9P3vSvOXsSDX78o22Mw6gUD5ohZVkHuvWu4=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=ElF/2qL/R147DY+oxL1zYTXu/3ja5dCc1jKpCU/jYg2mlTRmU8WD/wbxI2mCdk6od7
         pvT849yyZuZg4X4jow67Rao6ba+CacTPqquVSBMr9v/eedflD/6I88lPWwYW1lg7fmpu
         r5nBjaiPR6zn9P8jv+lBip83+/fA2DT9ym7W4+R+l5nqEKVmMpSVwFSLMIRpOhunMNga
         6xpsJY/O1wdbfxHsX3iXfnDze+8Ig5VTriA+svYGlyRosNWa/knxh1tvrObr3z7xXyHS
         g4e61CaJSuxSQ+yJtWBfNpSzQ+dEb8LIWF5AlR4HvaJb5THXaqF+R6K0CNLtG/dHymTL
         X5Tg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d3196a46asi1038629f8f.370.2024.10.08.20.20.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 20:20:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XNdRh34k5z6K97j;
	Wed,  9 Oct 2024 11:20:00 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 12BF5140133;
	Wed,  9 Oct 2024 11:20:17 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.173.89) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:19:57 +0200
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<gshan@redhat.com>, <rafael@kernel.org>, <borntraeger@linux.ibm.com>,
	<alex.bennee@linaro.org>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH RFC V4 02/33] cpu-common: Add common CPU utility for possible vCPUs
Date: Wed, 9 Oct 2024 04:17:44 +0100
Message-ID: <20241009031815.250096-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009031815.250096-1-salil.mehta@huawei.com>
References: <20241009031815.250096-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.173.89]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: pjrc2Vv2056I

This patch adds various utility functions that may be required to fetch or check
the state of possible vCPUs. It also introduces the concept of *disabled* vCPUs,
which are part of the *possible* vCPUs but are not enabled. This state will be
used during machine initialization and later during the plugging or unplugging
of vCPUs. We release the QOM CPU objects for all disabled vCPUs.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 cpu-common.c          | 21 ++++++++++++++++++++
 include/hw/core/cpu.h | 46 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/cpu-common.c b/cpu-common.c
index 6b262233a3..4a446f6f7f 100644
--- a/cpu-common.c
+++ b/cpu-common.c
@@ -24,6 +24,7 @@
 #include "sysemu/cpus.h"
 #include "qemu/lockable.h"
 #include "trace/trace-root.h"
+#include "hw/boards.h"
 
 QemuMutex qemu_cpu_list_lock;
 static QemuCond exclusive_cond;
@@ -108,6 +109,26 @@ void cpu_list_remove(CPUState *cpu)
     cpu_list_generation_id++;
 }
 
+CPUState *qemu_get_possible_cpu(int index)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    const CPUArchIdList *possible_cpus = ms->possible_cpus;
+
+    assert((index >= 0) && (index < possible_cpus->len));
+
+    return CPU(possible_cpus->cpus[index].cpu);
+}
+
+bool qemu_present_cpu(CPUState *cpu)
+{
+    return cpu;
+}
+
+bool qemu_enabled_cpu(CPUState *cpu)
+{
+    return cpu && !cpu->disabled;
+}
+
 CPUState *qemu_get_cpu(int index)
 {
     CPUState *cpu;
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 1c9c775df6..73a4e4cce1 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -538,6 +538,20 @@ struct CPUState {
     CPUPluginState *plugin_state;
 #endif
 
+    /*
+     * In the guest kernel, the presence of vCPUs is determined by information
+     * provided by the VMM or firmware via the ACPI MADT at boot time. Some
+     * architectures do not allow modifications to this configuration after
+     * the guest has booted. Therefore, for such architectures, hotpluggable
+     * vCPUs are exposed by the VMM as not 'ACPI Enabled' to the kernel.
+     * Within QEMU, such vCPUs (those that are 'yet-to-be-plugged' or have
+     * been hot-unplugged) may either have a `CPUState` object in a 'disabled'
+     * state or may not have a `CPUState` object at all.
+     *
+     * By default, `CPUState` objects are enabled across all architectures.
+     */
+    bool disabled;
+
     /* TODO Move common fields from CPUArchState here. */
     int cpu_index;
     int cluster_index;
@@ -924,6 +938,38 @@ static inline bool cpu_in_exclusive_context(const CPUState *cpu)
  */
 CPUState *qemu_get_cpu(int index);
 
+/**
+ * qemu_get_possible_cpu:
+ * @index: The CPUState@cpu_index value of the CPU to obtain.
+ *         Input index MUST be in range [0, Max Possible CPUs)
+ *
+ * If CPUState object exists,then it gets a CPU matching
+ * @index in the possible CPU array.
+ *
+ * Returns: The possible CPU or %NULL if CPU does not exist.
+ */
+CPUState *qemu_get_possible_cpu(int index);
+
+/**
+ * qemu_present_cpu:
+ * @cpu: The vCPU to check
+ *
+ * Checks if the vCPU is amongst the present possible vcpus.
+ *
+ * Returns: True if it is present possible vCPU else false
+ */
+bool qemu_present_cpu(CPUState *cpu);
+
+/**
+ * qemu_enabled_cpu:
+ * @cpu: The vCPU to check
+ *
+ * Checks if the vCPU is enabled.
+ *
+ * Returns: True if it is 'enabled' else false
+ */
+bool qemu_enabled_cpu(CPUState *cpu);
+
 /**
  * cpu_exists:
  * @id: Guest-exposed CPU ID to lookup.
-- 
2.34.1
