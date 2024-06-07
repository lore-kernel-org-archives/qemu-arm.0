Received: by 2002:a17:906:acd:b0:a66:557b:2f6e with SMTP id z13csp894582ejf;
        Fri, 7 Jun 2024 05:00:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVeDqGCpeu5p1oWKHXIOfUYLN7CXiH+Kus7vaJVQhjlBzI8k1EPsxSTNOCYaGQDciVbNZiRUieEJ+s+xSltgmyJ4OXmDPB0
X-Google-Smtp-Source: AGHT+IFa/0s7asx2i+9kDmc3K57ggEhmCMFZX8HwTdW9dKkfmdKQ3Ygi20yM66pdwlNfVe7qCyJ7
X-Received: by 2002:a05:6000:105:b0:354:f6e8:e1f with SMTP id ffacd0b85a97d-35efee03d2amr1717769f8f.45.1717761606156;
        Fri, 07 Jun 2024 05:00:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717761606; cv=none;
        d=google.com; s=arc-20160816;
        b=cDoaVPPJNZyYTPJpCeirbsBrfZ9YAGLhKqPNtVG+Kd222W/Rn/WtTuPrtW07KBMiPu
         LazYxhfiF+6/0r7vx9Ah5NAeDjycOX+h8PAySVr4+CBcNp9Q1bbztjQDYcHJF6EYCcjp
         qHRnkBxSa9WOTVa4q8NuBv86bzUfyqAuZldzdMRff562q9aAe7y6RA62JPuSsvlve5G+
         pD7qU7ZMI8SAIIFgEkWIauAXaAIaljyUgmxVvi9Z6a+JyXxv/YRP0sA/Msuilqpr3Qfg
         KcI0HvHEGRVBRsPW4lgo93P8zIsM6pfY2eifnjeEWzUexZXOJyx5hrV8lSDcrnTqgjWx
         7ZGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=A+4mmkXxJX6kBvx/mYD8+c+xx7+NEoX2RCFxjTc6l8M=;
        fh=CjFwyFzaCSmkOKy2YiKnMv5LVRyC5Im7ETbbL0XKxCE=;
        b=WQsXAbMis7zAydeWbbeID52oJhnB1oZjmBHQWBljHOcVECelVEQsrPuog+DtJ0FX+J
         i96UJcG8MyGxZFkjtbNbjjQxIp6v+81WB9RkbsDZMlc9yoS4M0lmVnBKL/LZNJkPHJi1
         xg+lLCfEbTz7gDqZ7MrTVRTq/9gQKIbTpBMZdpstGHIxlYVBLtp81m3C+7pJebZTkaSd
         HBgjWtcYuz74JJ96YB1ZgY1Bal0dSOecq01/kr4E0XBX8OXiPtSvlzFHX2grSMQnd/13
         GsnAc/lzEB7l/Abq7tNCKlwnqw8zFz5Wbu3Ysa+C214oMJhnn4f7IWadyYCvlpbUK9xD
         c64Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-35f099eca86si514059f8f.1012.2024.06.07.05.00.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2024 05:00:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VwflY1bwpz6H7c4;
	Fri,  7 Jun 2024 19:55:21 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 7DFC8140A70;
	Fri,  7 Jun 2024 20:00:03 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.48.147.102) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 12:59:41 +0100
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
Subject: [PATCH V13 6/8] physmem: Add helper function to destroy CPU AddressSpace
Date: Fri, 7 Jun 2024 12:56:47 +0100
Message-ID: <20240607115649.214622-7-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607115649.214622-1-salil.mehta@huawei.com>
References: <20240607115649.214622-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.147.102]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: G1KEa5XNv1lr

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
