Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp984812ejc;
        Tue, 26 Sep 2023 03:15:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IER9CLrKPjceBdeH5qN5NJCTzVPGCRsYCAxU4jpth/Cr4L5MKdL6MwMvd+bFrwz4FoQIyTi
X-Received: by 2002:a7b:cd0a:0:b0:404:fc51:4e9f with SMTP id f10-20020a7bcd0a000000b00404fc514e9fmr7790528wmj.38.1695723300653;
        Tue, 26 Sep 2023 03:15:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695723300; cv=none;
        d=google.com; s=arc-20160816;
        b=oBAjfbinruHOVWM6m2FK/Er2icYg2zUGPk5ZULZDYwFkMCFGXCoRm40Ts8Cq/oGSHD
         XgjNdtSEZgh06VTGxt1DtgH75A9B8q3Yqb6x/Sr1Rj9gza2oQ8lqVZ9yxGQfPN9ffazM
         QeVN1sHvIn3rQZgG00Gj7wnwmcjpB45hEQr6O/dHKRqarAUiVsYgeiXRiafptn1/2SXJ
         pqH7/WJgd613SAMAuSk5+vIV54q2sFFpOLEntlchwOksXdBoooHLV+1LJ3PEnGVOwaqo
         v41Pz8t13fo4E+A8mkpLNST9FRCbEaaEUcFq6nK4XJp85A4MoLNmv9QBOLOftQmAxqzV
         QIZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=8IzbIrZxn2EpIMoUg/FycVycFjcZ2/z6dkort35jYMI=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=TWRET9M/eHkf+7zbXeCPiwlk/mop+HSVJeKXKSL8QUCAYDjyhhpJ9fmfOobsQBzppa
         9Sriku9Y2WMCA1kC4/qiCgeYY9qCL4NkAuu52rOrMXc5If5nJSpcu7o9NhvJA2d6Wnth
         TtoZuDs6AB802RvhKuiAFLIMmaFw4EJLz3Zv8BIxyHXLOLZ/jccRCSw3PhwJplznNgi1
         HskuolAk8bW3QxmDJlkiyKmyfrCC4NKwaRXNOrIb1ojAHsApBRtHoIGoR1cLgq+3w5I1
         7Xf+50JFG1r1LrPMjIrXUe92yb3kKjtfUCuLstOcB/wS5FTwADPa5Cfz5HErs/lBEqkS
         cBpw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id e16-20020a056000121000b0031fa870d4a5si5774144wrx.217.2023.09.26.03.15.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:15:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvwZ14tbBz6K6wQ;
	Tue, 26 Sep 2023 18:13:45 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:14:41 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<mst@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>
Subject: [PATCH RFC V2 31/37] physmem,gdbstub: Common helping funcs/changes to *unrealize* vCPU
Date: Tue, 26 Sep 2023 11:04:30 +0100
Message-ID: <20230926100436.28284-32-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926100436.28284-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: 1z96V0XKzgpe

Supporting vCPU Hotplug for ARM arch also means introducing new functionality of
unrealizing the ARMCPU. This requires some new common functions.

Defining them as part of architecture independent change so that this code could
be reused by other interested parties.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 gdbstub/gdbstub.c         | 13 +++++++++++++
 include/exec/cpu-common.h |  8 ++++++++
 include/exec/gdbstub.h    |  1 +
 include/hw/core/cpu.h     |  1 +
 softmmu/physmem.c         | 25 +++++++++++++++++++++++++
 5 files changed, 48 insertions(+)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 5f28d5cf57..ddbcb4f115 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -491,6 +491,19 @@ void gdb_register_coprocessor(CPUState *cpu,
     }
 }
 
+void gdb_unregister_coprocessor_all(CPUState *cpu)
+{
+    GDBRegisterState *s, *p;
+
+    p = cpu->gdb_regs;
+    while (p) {
+        s = p;
+        p = p->next;
+        g_free(s);
+    }
+    cpu->gdb_regs = NULL;
+}
+
 static void gdb_process_breakpoint_remove_all(GDBProcess *p)
 {
     CPUState *cpu = gdb_get_first_cpu_in_process(p);
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 87dc9a752c..27cd4d32b1 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -120,6 +120,14 @@ size_t qemu_ram_pagesize_largest(void);
  */
 void cpu_address_space_init(CPUState *cpu, int asidx,
                             const char *prefix, MemoryRegion *mr);
+/**
+ * cpu_address_space_destroy:
+ * @cpu: CPU for which address space needs to be destroyed
+ * @asidx: integer index of this address space
+ *
+ * Note that with KVM only one address space is supported.
+ */
+void cpu_address_space_destroy(CPUState *cpu, int asidx);
 
 void cpu_physical_memory_rw(hwaddr addr, void *buf,
                             hwaddr len, bool is_write);
diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 7d743fe1e9..a22f0875e2 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -17,6 +17,7 @@ typedef int (*gdb_set_reg_cb)(CPUArchState *env, uint8_t *buf, int reg);
 void gdb_register_coprocessor(CPUState *cpu,
                               gdb_get_reg_cb get_reg, gdb_set_reg_cb set_reg,
                               int num_regs, const char *xml, int g_pos);
+void gdb_unregister_coprocessor_all(CPUState *cpu);
 
 /**
  * gdbserver_start: start the gdb server
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index dab572c9bd..ffd815a0d8 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -366,6 +366,7 @@ struct CPUState {
     QSIMPLEQ_HEAD(, qemu_work_item) work_list;
 
     CPUAddressSpace *cpu_ases;
+    int cpu_ases_ref_count;
     int num_ases;
     AddressSpace *as;
     MemoryRegion *memory;
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 3df73542e1..a93ae783af 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -762,6 +762,7 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
 
     if (!cpu->cpu_ases) {
         cpu->cpu_ases = g_new0(CPUAddressSpace, cpu->num_ases);
+        cpu->cpu_ases_ref_count = cpu->num_ases;
     }
 
     newas = &cpu->cpu_ases[asidx];
@@ -775,6 +776,30 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
     }
 }
 
+void cpu_address_space_destroy(CPUState *cpu, int asidx)
+{
+    CPUAddressSpace *cpuas;
+
+    assert(asidx < cpu->num_ases);
+    assert(asidx == 0 || !kvm_enabled());
+    assert(cpu->cpu_ases);
+
+    cpuas = &cpu->cpu_ases[asidx];
+    if (tcg_enabled()) {
+        memory_listener_unregister(&cpuas->tcg_as_listener);
+    }
+
+    address_space_destroy(cpuas->as);
+    g_free_rcu(cpuas->as, rcu);
+
+    if (cpu->cpu_ases_ref_count == 1) {
+        g_free(cpu->cpu_ases);
+        cpu->cpu_ases = NULL;
+    }
+
+    cpu->cpu_ases_ref_count--;
+}
+
 AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx)
 {
     /* Return the AddressSpace corresponding to the specified index */
-- 
2.34.1
