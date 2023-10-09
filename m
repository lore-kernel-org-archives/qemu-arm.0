Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp49118ejb;
        Mon, 9 Oct 2023 13:39:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjrlQ0nLtJmQsWhJa3P7S/s5ASERy8QA+nmp1XlUS54cdSa8gqG5wq84WZYVLjEKR4XWHD
X-Received: by 2002:adf:e288:0:b0:329:6d7c:ca71 with SMTP id v8-20020adfe288000000b003296d7cca71mr7598162wri.17.1696883982856;
        Mon, 09 Oct 2023 13:39:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696883982; cv=none;
        d=google.com; s=arc-20160816;
        b=oD6J8qKMqLjSSYL54ROmbL2k2N5HG7yPQoFxqt6XBuN3GgIBI6yMR8Vtj6jPBmQ3Ph
         JjGGYVla4V8+p2PTQ3n27JNcNru0d5Orz8cy5nBLkRZb+OgHb84MJ55r92S3okgmYpXR
         UBOKXiiGoNU3oIqqN+J6J6Hho8RNz9uBYlG2ClTljTVrP6Yiv+SJ+/ZsDY7xnUip0Jeb
         OTYEMNHk1kWZQi5BBoSEnBF1eXl5yBZfcK7O+ldDLg3Zp58f1UTpZ08fZLnbClFSsFTG
         JltQsMwAf3E3dyjrZ/XRQqh4loN71OnF+AxwCFZyIQuPy9dhSVYUfeaGa3bpUXNcsc8u
         XJVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=STxc0Fi4xNmup7+cEWcE0JUxMo5crViAf7Ui8Qw9I9U=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=vI4j5PSC5jEL4wf4Rwpdu5r852uyrbKVGu+MtyEunWskiu7K+OCdvua/RjzbaQvdiy
         ah0qaycNQ/dNMSMZ8dJGEoQzauZmfvLUwzpigwXphN3vh6iR5XVNHpkae1CZGwAH5J/r
         iEfaB5L00gabDJXoxuXRfyeKHdInOcHJq3QbLGc/LjvHhn8/eUCDGS7wIxgFEXf/WTwp
         8YBSdBkXWCx87A+PgIfSUgJIekckY6QypU9v5ShQAzK+zczf10pZnZ/E0MwOi3lrRemo
         KT+IZbQiEp9op0x4ztJO/xdP0EM3b42TxxS6LmnetWSjhhYMqkkx80pD0qrrQd/GQo4X
         abYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id m13-20020adfe0cd000000b0031fa4d76c1esi4241256wri.386.2023.10.09.13.39.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Oct 2023 13:39:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S49qv0FX1z6865q;
	Tue, 10 Oct 2023 04:39:23 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.175.116) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 9 Oct 2023 21:39:20 +0100
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
Subject: [PATCH V4 08/10] physmem: Add helper function to destroy CPU AddressSpace
Date: Mon, 9 Oct 2023 21:35:59 +0100
Message-ID: <20231009203601.17584-9-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231009203601.17584-1-salil.mehta@huawei.com>
References: <20231009203601.17584-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.175.116]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: /b/ElmemTJC9

Virtual CPU Hot-unplug leads to unrealization of a CPU object. This also
involves destruction of the CPU AddressSpace. Add common function to help
destroy the CPU AddressSpace.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 include/exec/cpu-common.h |  8 ++++++++
 include/hw/core/cpu.h     |  1 +
 softmmu/physmem.c         | 25 +++++++++++++++++++++++++
 3 files changed, 34 insertions(+)

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
