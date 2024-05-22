Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp682926ejb;
        Wed, 22 May 2024 14:14:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUYWgSnhdv9js24Rc2cm6am8Re8cKt8J6hNm4suYQGjbSW/c59nMlZGSeSRmJIEqPe9wBNx/+QCuKvq4uAtFVaIM6v0I5/D
X-Google-Smtp-Source: AGHT+IES8M1xtN9d8dN0AAsGbpST67deOMe1NLYbEwX4Sc5K5TVGXZg3D1ueI0v+dB/qHs8eXZe9
X-Received: by 2002:a5d:4084:0:b0:354:ba86:393 with SMTP id ffacd0b85a97d-354d8dafb37mr2434131f8f.67.1716412442352;
        Wed, 22 May 2024 14:14:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716412442; cv=none;
        d=google.com; s=arc-20160816;
        b=jTBr8KzwoOJW0rOsneRZ+0PcAie+e4NOrW/cX46Yw3gbM9EM4W46axWS34lb7yLIlR
         4FY/bKEy5Mqjqr3iqmcDeGFWnEIlAg6BueE+ro8jQSaecl07qX6oD+c4U2q/vqeax36U
         jBEJx8U+0qoRUfpvyLVtledIe1zrB43Jxe6z0mlN8W1nLgwKrImCI5FQn+wmn4U1NYYx
         TqQHznRAmMWI7CWJhSs8OEQl64N1wlLKgn04N5UYGhGc5P2sAnd5oBanHRMnHdKbup2v
         jvhNfAKT0t6a5hoANARZf+6PLbzAxu7I6oxhVhnU/qdVzNFzIhH1GPDaNeFDSP40Fq7Z
         FErw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Kbp3lWXuKoYK8bc+4BNhpBDv+ayDXaYg3uuzWeL4Agc=;
        fh=H0Ocb1F6OX7lJ2ZIq00L95YQd0stuI+T6mW0qgz5F80=;
        b=yXc/7gQACakYPmGvcq0NC2HiHCRckwWfKCg02cfOI9edUNsp/MusT6QS7rM0hB9xiw
         8VWYG6v1snf27KJ9Z2A8rggJRgcFrtYkhFiPEa4u0sJOVILWWBbFZkQiWY5PgKOqntRK
         EnT93AMjnUo5pjdX23qVSLSYsT668du2MyWWc7Gfb6NQ+LmPLs4vHz1wxCu7juhyVxau
         X3oq0l7h1pUkVdmQlzNJ3FI5ykjiR89ulMHi5ezu8miaxC6/J0qc7vjkSCr0I4Pz2Ocp
         wqVc5I/Q+ldbV6EvtRItqpdfwXw3u8MCT/LlmYoTeagYe4n/HTjdmvabZYoOLJYstwU+
         5LVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3502bbc439dsi17402040f8f.444.2024.05.22.14.14.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2024 14:14:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Vl3qK0Yv3z6J9yC;
	Thu, 23 May 2024 05:10:21 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 52B3F140A36;
	Thu, 23 May 2024 05:14:01 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.48.156.123) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 22:13:39 +0100
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
 Huang <shahuang@redhat.com>
Subject: [PATCH V11 6/8] physmem: Add helper function to destroy CPU AddressSpace
Date: Wed, 22 May 2024 22:11:09 +0100
Message-ID: <20240522211111.232114-7-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522211111.232114-1-salil.mehta@huawei.com>
References: <20240522211111.232114-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.156.123]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: pFDn9l4efRuT

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
index bb398e8237..60b160d0b4 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -486,6 +486,7 @@ struct CPUState {
     QSIMPLEQ_HEAD(, qemu_work_item) work_list;
 
     struct CPUAddressSpace *cpu_ases;
+    int cpu_ases_count;
     int num_ases;
     AddressSpace *as;
     MemoryRegion *memory;
diff --git a/system/physmem.c b/system/physmem.c
index 342b7a8fd4..146f17826a 100644
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
