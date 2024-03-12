Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp1553695ejc;
        Mon, 11 Mar 2024 19:02:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWUdrUAfDVDkvdEFo/sK1M6OGCyH2Lf+LWtWG3WSrpUcr8oQLs96DxSmoaoO5nmFFmWrLv7oFBTy+EXW4uyYMey++8su4x1
X-Google-Smtp-Source: AGHT+IFhJvEK4XhMYN+gjf8Laffkw0Jo0hsKvBVhydAlfo8OWQLRYwHhjWqo0YZDk6NoY59yyLaq
X-Received: by 2002:a5d:4b0c:0:b0:33d:7385:d929 with SMTP id v12-20020a5d4b0c000000b0033d7385d929mr5049092wrq.0.1710208952676;
        Mon, 11 Mar 2024 19:02:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710208952; cv=none;
        d=google.com; s=arc-20160816;
        b=Hvjc9rv3sLVUr3TBrHbOhFr97cJSs55WY5pemzTgOm4gZ/G6pGi6DDrmCoDRpFw6s6
         4/5Fcklu6lHQZw2mjw8ZtO4kdwgCycqGlWE7pNdqH7pE+iDZ6Y6HV7INK1rasiF6SwK3
         LWT/ECxCwETx3cIvhy3izwzF3THma8mFF5YTUv60H3Pqp7ZHOHgA0Oq+aaW8+1+Em9No
         OPLMNdAmGTPJFehsFRvGqdgniKoAicFoAm5Vxg4ew/NQzzrbksyH4O6D1LDIfnX9xOG+
         Jmg1T0XR4tpv4RKLxG7hIu+WDjj1l9+N4ZP6+4ksvorZHfkCq/SuX2NmCDq34KMV1yBB
         B3wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=iTL6OZGy5zQQAw1zlcz2pMcwkRgNCkvf935i/eqYRvY=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=GQChh5OdwMEaygFP8zrHamFYy7u3GOiqkR6JFN5IgpGvN9E8dLXHwIaFufl/HqmpDq
         ZYhl9/cDodpWJB0QdRSrhCqPG78vEKDqFvTGEUdKD+crF+tLRmOoCxQIIc035mB/ibEO
         oln+iesqXm4lvC93w+Gsx1UK3yNqEZPPqMrYZBrSVoLLElIxH5W29G+WLBcezE6Zxrp9
         A3UYyqqjUX3ZOC35IdXzVJ9pP2Xw4ZXGtOD6s3q6eYELjW5+pXATC2tvq+875N5vyFKn
         PPuyz+mnYpY5preCaDKj0Lc8AXHqRwTzOWzBcqGE18FbLPKsCbapxdjxHxE4lqC7LTnm
         6UyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id r4-20020a5d4944000000b0033e752cc86fsi3379064wrs.624.2024.03.11.19.02.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2024 19:02:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TtxjL2f1Cz6JBW4;
	Tue, 12 Mar 2024 10:02:14 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id E71A6140A35;
	Tue, 12 Mar 2024 10:02:30 +0800 (CST)
Received: from A190218597.china.huawei.com (10.48.148.5) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 02:02:13 +0000
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
Subject: [PATCH V8 6/8] physmem: Add helper function to destroy CPU AddressSpace
Date: Tue, 12 Mar 2024 01:59:58 +0000
Message-ID: <20240312020000.12992-7-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20240312020000.12992-1-salil.mehta@huawei.com>
References: <20240312020000.12992-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.148.5]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: dpb8IhLGRLIH

Virtual CPU Hot-unplug leads to unrealization of a CPU object. This also
involves destruction of the CPU AddressSpace. Add common function to help
destroy the CPU AddressSpace.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Xianglai Li <lixianglai@loongson.cn>
Tested-by: Miguel Luis <miguel.luis@oracle.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
---
 include/exec/cpu-common.h |  8 ++++++++
 include/hw/core/cpu.h     |  1 +
 system/physmem.c          | 29 +++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 6346df17ce..a427d80340 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -123,6 +123,14 @@ size_t qemu_ram_pagesize_largest(void);
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
index ec14f74ce5..e975b8085f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -493,6 +493,7 @@ struct CPUState {
     QSIMPLEQ_HEAD(, qemu_work_item) work_list;
 
     CPUAddressSpace *cpu_ases;
+    int cpu_ases_count;
     int num_ases;
     AddressSpace *as;
     MemoryRegion *memory;
diff --git a/system/physmem.c b/system/physmem.c
index 6e9ed97597..61b32ac4f2 100644
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
