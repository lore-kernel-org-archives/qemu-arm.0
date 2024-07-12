Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp806551nji;
        Fri, 12 Jul 2024 06:44:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCViw0R+qv+O+OFNo6/ffRiIKzI32/oQloIuyLmY6HTnxa5pClRhVjxO8OZuASrfpv5jY5mZpj5y3rv6mWuu4S+Q3a2urZJO
X-Google-Smtp-Source: AGHT+IHmMNQ9iwNL3XMhheZQQykZ76uuYipi7PgvSpOU4sHmA0jk674OTeL2XNLcOz7hcXnscb6w
X-Received: by 2002:a5d:64a6:0:b0:366:e7aa:7fa5 with SMTP id ffacd0b85a97d-367cea46b24mr10338488f8f.1.1720791896529;
        Fri, 12 Jul 2024 06:44:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720791896; cv=none;
        d=google.com; s=arc-20160816;
        b=qauKFcPAxD6uoAxn3QS0P0zjQjHjx1se5KVAfAPv7/2n/yQFSX6cNZXmOvpcDgT+PJ
         hgqNX/i7zsHbUEMmBqbdyXl1Q5dNLWcF7daSCpYaq7ygLKYJjPlb4VWw1x/kGw7ykzbq
         aVH0PqsW2Ffmwf936PK1imBJ9h+rXqta7omugHLAG/iT9gE1EY4ULMYoxrYVxtPnqkJD
         8L6odUCoJ2J9Mp6KIswWBdbl09juqNnVfwL0z09m7vExR9myDfS3NwqjBQYmlAeskEZo
         2PsfJTVLn09uv5uP2wE4n7fuAzQFoNBQONgkps1XuIIEOWBfFGYeFRbBasV7Ssewuag6
         CqBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=cipL7I7uy7Uk2G6r6NauJqHvxrwXOxLhYjnxNZYTsGI=;
        fh=CjFwyFzaCSmkOKy2YiKnMv5LVRyC5Im7ETbbL0XKxCE=;
        b=RfrcfGdNWmqWWy3vliqF8RTzBFkbaEr5LYmjjQAiUPMnklFYmKtO9z99LdyGUPqkJp
         witSxCf1kteI78ctZT6XqQu2/0iVvrll1rrbql7QcDtCdMnR9Ht7uDKIK39fwsZ9+k8L
         0FxEEqGPYQedDo23VDiGnObUAf0X4nGvwf+0VISkku3kd/m1b4s/5v3ox/qtfQ9dGm9q
         XJm3ejZED0Zubov5VJJ19XGug2soxtmv/bcZGkqoXgexVuc3CBd3d9QDZyMRWo8CT3x3
         /PUntftWds9RNGQWAR3v6Qp1avge6MRRQWrRp5sUAz7btVOiCydK6g7KHvokWY9kjKv0
         kmLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-367cdfaf569si5418812f8f.586.2024.07.12.06.44.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jul 2024 06:44:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WLCV25xf3z6H7pR;
	Fri, 12 Jul 2024 21:43:22 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 022A3140B3C;
	Fri, 12 Jul 2024 21:44:55 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.195.244.27) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 14:44:33 +0100
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
	<npiggin@gmail.com>, <harshpb@linux.ibm.com>, <linuxarm@huawei.com>, Shaoqin
 Huang <shahuang@redhat.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH V14 6/7] physmem: Add helper function to destroy CPU AddressSpace
Date: Fri, 12 Jul 2024 14:42:00 +0100
Message-ID: <20240712134201.214699-7-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240712134201.214699-1-salil.mehta@huawei.com>
References: <20240712134201.214699-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.244.27]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: fW44xrmNyB3z

Virtual CPU Hot-unplug leads to unrealization of a CPU object. This also
involves destruction of the CPU AddressSpace. Add common function to help
destroy the CPU AddressSpace.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Xianglai Li <lixianglai@loongson.cn>
Tested-by: Miguel Luis <miguel.luis@oracle.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
Tested-by: Zhao Liu <zhao1.liu@intel.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 include/exec/cpu-common.h |  8 ++++++++
 include/hw/core/cpu.h     |  1 +
 system/physmem.c          | 29 +++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 815342d043..240ee04369 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -129,6 +129,14 @@ size_t qemu_ram_pagesize_largest(void);
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
index a2c8536943..c7dbfdfb11 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -496,6 +496,7 @@ struct CPUState {
     QSIMPLEQ_HEAD(, qemu_work_item) work_list;
 
     struct CPUAddressSpace *cpu_ases;
+    int cpu_ases_count;
     int num_ases;
     AddressSpace *as;
     MemoryRegion *memory;
diff --git a/system/physmem.c b/system/physmem.c
index 14aa025d41..ddd1fc3a25 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -763,6 +763,7 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
 
     if (!cpu->cpu_ases) {
         cpu->cpu_ases = g_new0(CPUAddressSpace, cpu->num_ases);
+        cpu->cpu_ases_count = cpu->num_ases;
     }
 
     newas = &cpu->cpu_ases[asidx];
@@ -776,6 +777,34 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
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
