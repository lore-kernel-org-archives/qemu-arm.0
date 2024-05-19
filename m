Received: by 2002:a05:7022:fd07:b0:7c:9548:a19d with SMTP id up7csp4598345dlb;
        Sun, 19 May 2024 14:09:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWYp3wN6ufxqVZ5GhEJZgRx+Q6nEVWT/iGOEdhf4cLg/MdRZy/YF0mchbin9HCZ9VeVF1sNWt2ykaWn/iQAFJce7qEuQtck
X-Google-Smtp-Source: AGHT+IEo8NmLK5Aw0FeElTKF47kzRp76GmL3PeJrDheiiZ2Wyel25ajZyjVQrFol/TfOLm5CxU7A
X-Received: by 2002:a5d:61cd:0:b0:349:8a7e:e0af with SMTP id ffacd0b85a97d-3504a6330f7mr20413846f8f.11.1716152993882;
        Sun, 19 May 2024 14:09:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716152993; cv=none;
        d=google.com; s=arc-20160816;
        b=iJDOdmpcuTFk/AT5F1VSHBZC0bqyP/TqME+2U99J8bPmroF6juVWtEOguy9caxey+W
         slZao58w5b+Zz93XhMro8XxItwuEoFLX3dOfCNBXufWpPmS/SDnuMjgzAqn9yeV4ocJy
         9K7H/E3XbJBK9lIvNDFG4/k4CCwjBmmb7hAf89FGsdMTCr7Vm48d44ZXtfWuqFrCV//f
         M6eeGqQ3TpDEj0JjiH//TkLBLbEo4yLyjTusiliwoMJv2kqBNOPPw9J6uQjWbJp8cI6G
         4VzmuovILtZvlm2R5Xl8fOYVC0dCj2DibTalWAL4yqMJf2jniluqIaOphR9thf33g2hF
         6lXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Kbp3lWXuKoYK8bc+4BNhpBDv+ayDXaYg3uuzWeL4Agc=;
        fh=H0Ocb1F6OX7lJ2ZIq00L95YQd0stuI+T6mW0qgz5F80=;
        b=Jc2rP0spQLlGMwa5gMD6ncdcvS4EiU6gf4vheUUK9ziSkiBjJSbdtDGN/7o7DUjAmz
         +veE5XLOOR5a4MzXJnyfqGWxVzX/juxIPZZ+QIDFSh/cdmCWvBC15fQRNENltsb+mMda
         DwTrsaQZMzOiF7LHpQ41ktY309ThiIxvb/7CuB0gtycSClmrIu7NN/UkioHdbszz1+dz
         IyrPQG9R4UKBmG93At3COnae3/z6oEkA9AagYDR2pGWFmog2zh3TOgIG3D7bXuSswmt3
         +SaUY6G1wWE734XJi91BSNtNN5hssz6dLUNIdCQSQ72sve3jU6UYXWVReD4AUbNxvgUw
         1INQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-35031d4ecfdsi14474699f8f.186.2024.05.19.14.09.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 May 2024 14:09:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VjCxG69TCz6K8y0;
	Mon, 20 May 2024 05:09:06 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id DBD1A140736;
	Mon, 20 May 2024 05:09:52 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.126.174.235) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 19 May 2024 22:09:32 +0100
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
Subject: [PATCH V9 6/8] physmem: Add helper function to destroy CPU AddressSpace
Date: Sun, 19 May 2024 22:06:18 +0100
Message-ID: <20240519210620.228342-7-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240519210620.228342-1-salil.mehta@huawei.com>
References: <20240519210620.228342-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.174.235]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: kBPabogP9pCD

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
