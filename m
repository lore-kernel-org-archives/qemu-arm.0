Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2499ejb;
        Fri, 29 Sep 2023 17:22:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuXJlhR39vqZ5z2ZP2CUyeq2GYe1ypcB90MrxDBMoM5yWUVWQiKd63hxbs+qkTDAsU+sbQ
X-Received: by 2002:adf:f24f:0:b0:324:7a6b:d4f6 with SMTP id b15-20020adff24f000000b003247a6bd4f6mr5396064wrp.30.1696033365247;
        Fri, 29 Sep 2023 17:22:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696033365; cv=none;
        d=google.com; s=arc-20160816;
        b=rBW9XcZwrX1+kWkMWxH1tREr5PwgdDUuGar9uIpWFfQyq28y3jZ+do7Nxc8gWP4r6l
         s5h54yu9aItyHvl0W6ZgGtTOqmkda91EEpVrmtzcQue5fDbFt6iIkP8xRCR/Sqq8Qrem
         eMeuhKHz4pgfG+29QC9tDM+47TYwxCeLg1LSAEDrJWUbq3SIgy1HamLpbrsf55yNb1sx
         29diDzenZVRbO/IkyV6rQZCEA96Y3lKfX/TztCiYF402T6FHQ3y20F+CHbVY10cnHznN
         0PJJw7niqk6goY9PUIxz7A9C2sul4Of2hS+HyudkGOS0cwKy0kxIVsTlqS2mXf8tVOXs
         JW0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=STxc0Fi4xNmup7+cEWcE0JUxMo5crViAf7Ui8Qw9I9U=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=RPWCv4iI7xigH/3Gwz5dB6xs9tcUk91QUhR6yaDWDWceUQl+n/KF2jPRykfsqjt0Hl
         EQji76PB8XZzngy7RMTvx16sYTAZ62mj0alTXH79i50flDkba9mSWSHFo/v/NV8GiOUZ
         fQDceYQymQDCqG/dBiWNX0BCyUjNDh2sZzrzRg0kBSVqPoY+ipjH89XOr/NhVNFS3hEf
         BJ7qQGbsP9o6f9K6Ldcc16mes1uue5uBXyeI+gE9lQ5ew8SR9W03j49nvVdt2Eo69eCy
         dt9b7ZjMP/Q/jX9m5qitXaP0C2Wm6PB6YGwW70L8As2M842z+hXRCWdpM5ala9Sh/ocv
         fikQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id s16-20020adff810000000b0031f85e75b33si7611970wrp.41.2023.09.29.17.22.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Sep 2023 17:22:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ry7G74tQkz6K6fd;
	Sat, 30 Sep 2023 08:22:39 +0800 (CST)
Received: from A190218597.china.huawei.com (10.195.35.96) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Sat, 30 Sep 2023 01:22:25 +0100
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
Subject: [PATCH V2 08/10] physmem: Add helper function to destroy CPU AddressSpace
Date: Sat, 30 Sep 2023 01:19:31 +0100
Message-ID: <20230930001933.2660-9-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230930001933.2660-1-salil.mehta@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.195.35.96]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: xiAZE75isFnb

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
