Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp3222360ejc;
        Fri, 29 Sep 2023 05:47:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXqeVKVP+aDA5+vqHezekUVOPvR/OkMKUaoGIWQTXzTyeZOs7k03wqnSgzn7ocq+yWMnab
X-Received: by 2002:a05:600c:2053:b0:406:478e:9e2d with SMTP id p19-20020a05600c205300b00406478e9e2dmr3570993wmg.26.1695991627036;
        Fri, 29 Sep 2023 05:47:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695991627; cv=none;
        d=google.com; s=arc-20160816;
        b=NOU9T94HDgu6ED7WEOujHYpoENszjt2ozV9wmZlOxE6qW9YS9UwymOst27mQxqw7HB
         WSKgwGh25Y88nravJA4Z4m7bCfPb+MIIDhbJT3IftUaoWjKIqLAjB1/xg7y5IRIE2beu
         TcTPDD9b/K8St8/1tlZp6ZX79m+3ByQwWP0h9LzjV9N1fRRffDCrJvtoF6tRBadahr3K
         daOFSncTB/w22lBzidei8jce9e/1ggyPagxPApZBEoAV7Q0RAAtOGNj6vgYhPnCZNfyf
         uy62mPcOHbackZ3k3hdgnvvijSJnDLfXs3n9Iw8Juiq7Yy9XGO90okw73pXJDIswugwC
         LzFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=MhZV9d40bIY60VHmvoERPhH7Zicqsl20TwkLV4NA/kk=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=yCzlJn50wOHV1xpBT0YB1GBq4yEm8dY2QEXemjUVEUbp21XnTv822AsBzAVgcdr8VH
         jw+LzlSYh1XB7/pUan0dtUoRqSDtK9a9EnCSwCOxcs7sS4YM2sie6Gcav3i6fh80h3cu
         s13rkJkMZcfPHVOsDCwgn+uWOnE2fYDhnI/eI3favp/MgVgYQ+A3rAjqJQrQ2u8dtaXu
         77FOa6ClpczxRmt8IbFpH37NzBX6O10uxBKdThd17pkyh3lmE9iSzi1CAKL4vrfAPLK3
         AeOU6A8P1WbmA0xMg8suukmq0cipwHUZmrb2/YtGo8MwSnWzkJkwmsIhKb4Fe1y5313m
         0GPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id iv15-20020a05600c548f00b004053e9673bcsi765221wmb.113.2023.09.29.05.47.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Sep 2023 05:47:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rxqnx6SZjz6K5wd;
	Fri, 29 Sep 2023 20:45:41 +0800 (CST)
Received: from A190218597.china.huawei.com (10.48.156.153) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 29 Sep 2023 13:46:47 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <mst@redhat.com>, <will@kernel.org>,
	<gshan@redhat.com>, <rafael@kernel.org>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<linuxarm@huawei.com>
Subject: [PATCH 8/9] physmem,gdbstub: Add helper functions to help *unrealize* vCPU object
Date: Fri, 29 Sep 2023 13:43:03 +0100
Message-ID: <20230929124304.13672-9-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230929124304.13672-1-salil.mehta@huawei.com>
References: <20230929124304.13672-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.156.153]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: a2QT7tADca10

vCPU Hot-unplug requires some helper functions to unroll what has happened
during realization of a CPU object.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 gdbstub/gdbstub.c         | 13 +++++++++++++
 include/exec/cpu-common.h |  8 ++++++++
 include/exec/gdbstub.h    |  1 +
 include/hw/core/cpu.h     |  1 +
 softmmu/physmem.c         | 25 +++++++++++++++++++++++++
 5 files changed, 48 insertions(+)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 349d348c7b..a06ea3adad 100644
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
index 41788c0bdd..eb56a228a2 100644
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
index 16a139043f..986d8d2fa5 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -27,6 +27,7 @@ typedef int (*gdb_set_reg_cb)(CPUArchState *env, uint8_t *buf, int reg);
 void gdb_register_coprocessor(CPUState *cpu,
                               gdb_get_reg_cb get_reg, gdb_set_reg_cb set_reg,
                               int num_regs, const char *xml, int g_pos);
+void gdb_unregister_coprocessor_all(CPUState *cpu);
 
 /**
  * gdbserver_start: start the gdb server
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 648b5b3586..65d2ae4581 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -355,6 +355,7 @@ struct CPUState {
     QSIMPLEQ_HEAD(, qemu_work_item) work_list;
 
     CPUAddressSpace *cpu_ases;
+    int cpu_ases_count;
     int num_ases;
     AddressSpace *as;
     MemoryRegion *memory;
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 4f6ca653b3..4dfa0ca66f 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -761,6 +761,7 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
 
     if (!cpu->cpu_ases) {
         cpu->cpu_ases = g_new0(CPUAddressSpace, cpu->num_ases);
+        cpu->cpu_ases_count = cpu->num_ases;
     }
 
     newas = &cpu->cpu_ases[asidx];
@@ -774,6 +775,30 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
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
+    if (cpu->cpu_ases_count == 1) {
+        g_free(cpu->cpu_ases);
+        cpu->cpu_ases = NULL;
+    }
+
+    cpu->cpu_ases_count--;
+}
+
 AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx)
 {
     /* Return the AddressSpace corresponding to the specified index */
-- 
2.34.1
