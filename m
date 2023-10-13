Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1416080ejc;
        Fri, 13 Oct 2023 03:54:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHdjO3d3IFm3DCDoNWCK5CAlbrMltue6M4JMRZHdRjb2sjUnkvdduC67/K6i8MAFLwXeI0
X-Received: by 2002:a17:902:744a:b0:1c9:e77d:62d3 with SMTP id e10-20020a170902744a00b001c9e77d62d3mr4516266plt.10.1697194471046;
        Fri, 13 Oct 2023 03:54:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697194471; cv=none;
        d=google.com; s=arc-20160816;
        b=pzRQFpKdFdK6LetxaoQpbFTXj0hhHNtefGa0SSrshMj5MYoU2eDOm//ZNSpS5f+vNI
         fMHdHkBV+99klbVhgdEKO4wGLe07rtWkUC/hAHb9vUF0kOfwrsg0IWh21PP68SVgXw93
         4uE+vcCTq8ztPrGoj85AkJ/APUSi80m9WOwH3kZ0um9FcQ0x9F15iTKPIepiMTr/bSQ2
         NJdvkkC/Rv/fZ1d5YAhLIlj2TnehDDPNkieNIKK0yXUsjZj0lfehgKKC4D++7EMNESSL
         oWJdYMRUHsuZMU5S62x+2kmvuqjKt1nzCaCOnSsu1Qk4Y6oedD4urE2Tg4JA3d6hygXM
         ZKeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=GzjL/5f6cmcvcYQILRSZwb96KCd1A63FmbhYSqcydEg=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=YP6duKyVxGTEu4paBCUTpeO8kbuwnJFWLk3nYR7W21y5nDDOPC5IGpm8UPhP6Vh7Ze
         4kysIzc+LzRfytoWnxauuBQzU1PcguNSutB8QCJmWMfzKvjxwLqhl7saU/Kw2pG6oG/f
         0JQ4bihOU1JfQ1fWAWKGuAtr7ye5WsRbXHQmHCYd25/i7IF3qhxFBHfsxZ+6Tl0gvu2N
         ZQUqDTn0utB9Wy3xIbNmDbVsZx6X+kRDBtdHd/DcbZ3Ab/89H80LZBzqa00vQgDO73mp
         3RKLhADVDAYhb4bt0T6TvmXCxrld7pAriuUoaf2un8vT+cA9USRiJnuGT/P4I2HfTw2q
         /64g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id m6-20020a170902db0600b001c5cf1c30cfsi375744plx.435.2023.10.13.03.54.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2023 03:54:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S6Nff6mBcz6K8tm;
	Fri, 13 Oct 2023 18:54:02 +0800 (CST)
Received: from A190218597.china.huawei.com (10.195.247.32) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 13 Oct 2023 11:54:10 +0100
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
Subject: [PATCH V6 8/9] physmem: Add helper function to destroy CPU AddressSpace
Date: Fri, 13 Oct 2023 11:51:28 +0100
Message-ID: <20231013105129.25648-9-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231013105129.25648-1-salil.mehta@huawei.com>
References: <20231013105129.25648-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.195.247.32]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: CELuM4cdfJKf

Virtual CPU Hot-unplug leads to unrealization of a CPU object. This also
involves destruction of the CPU AddressSpace. Add common function to help
destroy the CPU AddressSpace.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Xianglai Li <lixianglai@loongson.cn>
---
 include/exec/cpu-common.h |  8 ++++++++
 include/hw/core/cpu.h     |  1 +
 system/physmem.c          | 29 +++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 605b160a7e..a930e49e02 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -127,6 +127,14 @@ size_t qemu_ram_pagesize_largest(void);
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
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 3968369554..708b6b48de 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -496,6 +496,7 @@ struct CPUState {
     QSIMPLEQ_HEAD(, qemu_work_item) work_list;
 
     CPUAddressSpace *cpu_ases;
+    int cpu_ases_count;
     int num_ases;
     AddressSpace *as;
     MemoryRegion *memory;
diff --git a/system/physmem.c b/system/physmem.c
index edc3ed8ab9..a16f1d4056 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -761,6 +761,7 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
 
     if (!cpu->cpu_ases) {
         cpu->cpu_ases = g_new0(CPUAddressSpace, cpu->num_ases);
+        cpu->cpu_ases_count = cpu->num_ases;
     }
 
     newas = &cpu->cpu_ases[asidx];
@@ -774,6 +775,34 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
     }
 }
 
+void cpu_address_space_destroy(CPUState *cpu, int asidx)
+{
+    CPUAddressSpace *cpuas;
+
+    assert(cpu->cpu_ases);
+    assert(asidx >= 0 && asidx < cpu->num_ases);
+    /* KVM cannot currently support multiple address spaces. */
+    assert(asidx == 0 || !kvm_enabled());
+
+    cpuas = &cpu->cpu_ases[asidx];
+    if (tcg_enabled()) {
+        memory_listener_unregister(&cpuas->tcg_as_listener);
+    }
+
+    address_space_destroy(cpuas->as);
+    g_free_rcu(cpuas->as, rcu);
+
+    if (asidx == 0) {
+        /* reset the convenience alias for address space 0 */
+        cpu->as = NULL;
+    }
+
+    if (--cpu->cpu_ases_count == 0) {
+        g_free(cpu->cpu_ases);
+        cpu->cpu_ases = NULL;
+    }
+}
+
 AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx)
 {
     /* Return the AddressSpace corresponding to the specified index */
-- 
2.34.1
