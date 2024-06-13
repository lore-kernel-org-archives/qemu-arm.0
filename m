Received: by 2002:a17:906:564e:b0:a6f:1bf6:7fc1 with SMTP id v14csp96664ejr;
        Thu, 13 Jun 2024 16:38:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUpP3VY92b3SvQ5a387cd/IPeDVYJIc/0qVPuLlcWwJ7gYa6ZU6l4bPh7I1ep3QI92JMd0NSnhe3c/icCkXWxW1IP4zslSk
X-Google-Smtp-Source: AGHT+IE4tJi+0SbnTk0WArR+3yYhrfuJElJSGbCKmpmEwmXrDttCry/l5sddR9XeW3Fn9SaJY7Ln
X-Received: by 2002:adf:ec4b:0:b0:35f:23a2:8162 with SMTP id ffacd0b85a97d-3607a75a691mr605877f8f.25.1718321920813;
        Thu, 13 Jun 2024 16:38:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718321920; cv=none;
        d=google.com; s=arc-20160816;
        b=fj97m94utCR+OaAxmXd4/AC+0U+86f4y5ItVKY17mlLp9qcqf/S3++fZR1HaRui//7
         A1c44o6QaYPXSesVHoyauEacgJVH8+uUxOFhwZJ8F2AGKniHnb2lTAbjoitVHa9BBQ+O
         nBx8JyzqPF/15T3vYZDe5Q5m0ManHlG7OYWUI1E2SyCzsewkREo9Qw+JQlDfPbvv8+mw
         oYUbmT+HgHilJqbxEF82YTB531fNGd/nVtGD4TO3ap8zcIEA+X96wtk5hu3yhBCEfZnV
         rlIsOjTK5kzV1XKW6g2t07f4H69O8QrJDjrg3vCwYL06b0RCdgxpzUUEqx1AQx+b22Ji
         FOhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=+BYdUvQwi9nv6EyNG3XyrSAmmyRrE0XvZGSqo6PYhxc=;
        fh=LTv9rZypFCL5Yl51dJY3ojnjwtjMOAtIYwj21UMTdvU=;
        b=w/LXNd+NG4KqvCXiCZSokcYQD533F38EC3+nkYOvtDCzDXUwGx9oTGnhNEHbura4xN
         kDWCZrLoDG7K5vlfvaYr8tin3odyYmSVgsYVnmfoPy7nj3cmkQ51jSai3sxOk5F5ue4I
         nvlbwhK1tNfkPlzfgUHK+8tXBiHQr6FN0wUcZZIISGCA/3RlUyK4sWn9A//mTfjTcELo
         arHn7BBsLv999Jmz0vCv96rlHshXiO33McXlUkTg9x294IOd1AfE6uCBwZSOgN9Coo31
         7rsOT3cRpYuzGQtWkUrp0xrN04pG/FOgOf7sjjkr3wlk3fsj/PB6fjPM9wW45yPRE5Qe
         DiVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-360795b2d20si921545f8f.247.2024.06.13.16.38.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2024 16:38:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W0f4D540Wz6K6Bt;
	Fri, 14 Jun 2024 07:38:36 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 8C601140594;
	Fri, 14 Jun 2024 07:38:39 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.245.24) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 00:38:17 +0100
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
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>
Subject: [PATCH RFC V3 02/29] cpu-common: Add common CPU utility for possible vCPUs
Date: Fri, 14 Jun 2024 00:36:12 +0100
Message-ID: <20240613233639.202896-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613233639.202896-1-salil.mehta@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.245.24]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: fYV+eUm6e6L9

This patch adds various utility functions that may be required to fetch or check
the state of possible vCPUs. It also introduces the concept of *disabled* vCPUs,
which are part of the *possible* vCPUs but are not enabled. This state will be
used during machine initialization and later during the plugging or unplugging
of vCPUs. We release the QOM CPU objects for all disabled vCPUs.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 cpu-common.c          | 31 +++++++++++++++++++++++++
 include/hw/core/cpu.h | 54 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/cpu-common.c b/cpu-common.c
index ce78273af5..49d2a50835 100644
--- a/cpu-common.c
+++ b/cpu-common.c
@@ -24,6 +24,7 @@
 #include "sysemu/cpus.h"
 #include "qemu/lockable.h"
 #include "trace/trace-root.h"
+#include "hw/boards.h"
 
 QemuMutex qemu_cpu_list_lock;
 static QemuCond exclusive_cond;
@@ -107,6 +108,36 @@ void cpu_list_remove(CPUState *cpu)
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
+uint64_t qemu_get_cpu_archid(int cpu_index)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    const CPUArchIdList *possible_cpus = ms->possible_cpus;
+
+    assert((cpu_index >= 0) && (cpu_index < possible_cpus->len));
+
+    return possible_cpus->cpus[cpu_index].arch_id;
+}
+
 CPUState *qemu_get_cpu(int index)
 {
     CPUState *cpu;
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 60b160d0b4..60b4778da9 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -528,6 +528,18 @@ struct CPUState {
     CPUPluginState *plugin_state;
 #endif
 
+    /*
+     * Some architectures do not allow the *presence* of vCPUs to be changed
+     * after the guest has booted, based on information specified by the
+     * VMM/firmware via ACPI MADT at boot time. Thus, to enable vCPU hotplug on
+     * these architectures, possible vCPUs can have a CPUState object in a
+     * 'disabled' state or may not have a CPUState object at all. This is
+     * possible when vCPU hotplug is supported, and vCPUs are
+     * 'yet-to-be-plugged' in the QOM or have been hot-unplugged. By default,
+     * every CPUState is enabled across all architectures.
+     */
+    bool disabled;
+
     /* TODO Move common fields from CPUArchState here. */
     int cpu_index;
     int cluster_index;
@@ -914,6 +926,48 @@ static inline bool cpu_in_exclusive_context(const CPUState *cpu)
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
+/**
+ * qemu_get_cpu_archid:
+ * @cpu_index: possible vCPU for which arch-id needs to be retreived
+ *
+ * Fetches the vCPU arch-id from the present possible vCPUs.
+ *
+ * Returns: arch-id of the possible vCPU
+ */
+uint64_t qemu_get_cpu_archid(int cpu_index);
+
 /**
  * cpu_exists:
  * @id: Guest-exposed CPU ID to lookup.
-- 
2.34.1
