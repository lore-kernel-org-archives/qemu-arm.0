Received: by 2002:a17:906:564e:b0:a6f:1bf6:7fc1 with SMTP id v14csp97410ejr;
        Thu, 13 Jun 2024 16:40:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU7KNJyowpK+h6B0G6Kxk89lk1rgq96BXHNrY0nL+IJ7JuGOQ7jqUOWatHkTTQJdNm0HYWCJG5EnnPwM9YVRDxwlsltXHlI
X-Google-Smtp-Source: AGHT+IFKnc1eMCMmiz2/6srC9MNrw4kL1GCJ9UAQPZ+0uRr72txMjnW+fnHIc/EZZ8JSN3GxOcZW
X-Received: by 2002:adf:fa84:0:b0:35f:18ad:bccb with SMTP id ffacd0b85a97d-3607a76b722mr725280f8f.35.1718322056939;
        Thu, 13 Jun 2024 16:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718322056; cv=none;
        d=google.com; s=arc-20160816;
        b=GGCNLMTNN3pI1rs+VBlGNR25jp6JL7gsNg3V3F2l/2iqJ/Qr7NsQtgUqR+6WALbrQv
         o6Z9SPfKZ3rEvDitvKsgi4GBgU2SykTlVzA7u2zCLzuADICiJN6ts0ZX+uuLCoqha23k
         kCEAxxRLBJMeuI7fKmi9WcUCcs5Q8MO3fIQiK9GBFTaH8sSweP8TkKNfnRtzUYVkjO+q
         HEsrZB+mX1pk+gvYvFkFSWKR/TOj1hLP3P9p81+sL4k6HYuWuOvewIgPoC83Sul1+2Wq
         kFPG+v31W2D5NHClg+7MM+MO+AKOCmnS8rThUthUlVpacsZx8oeM7QkjnJFc0oBNUP3K
         H9gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=bJGhZYNPwplLz5ywM9RpG+NfqhhEIgmojgYygbnU0xA=;
        fh=LTv9rZypFCL5Yl51dJY3ojnjwtjMOAtIYwj21UMTdvU=;
        b=Vr7r5yfUmayQVWtWt3nWBq7LlpSCAnilDPC7mmvkDj0/jfLraDW7GWx/zOJGWPW+S+
         YknQg7byJ4bFLeFp7UpIDOX8DhUXqK4IoCGWbPeGIyht6oauJxAxPuUy+FQEP6tPavoZ
         F1iflt/PZwg1WNuhVFdlf3er2gMT7AIk9MV/mLhstwYEnawen84pie94s1zlqwub35+3
         W4SaYD+IG4ZSn/CjIhbZCi9dsxBlv+PQmxP3q8D18tUfgVnMw8X6RDgB1xb02A+BSEAk
         JTERm5kdGEyYyyIhoK4VYpbEKkjEq1U5pFmedwC/9HMyPucI3oQ2DuDIqim0+olUZRgd
         wewA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-360750b5e68si1417475f8f.73.2024.06.13.16.40.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2024 16:40:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W0f6s05Cnz687SH;
	Fri, 14 Jun 2024 07:40:53 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id D4665140AE5;
	Fri, 14 Jun 2024 07:40:55 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.245.24) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 00:40:33 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<gshan@redhat.com>, <rafael@kernel.org>, <borntraeger@linux.ibm.com>,
	<alex.bennee@linaro.org>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>
Subject: [PATCH RFC V3 08/29] arm/virt: Init PMU at host for all possible vcpus
Date: Fri, 14 Jun 2024 00:36:18 +0100
Message-ID: <20240613233639.202896-9-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613233639.202896-1-salil.mehta@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.245.24]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: 2AOaoYwI4o6c

PMU for all possible vCPUs must be initialized at the VM initialization time.
Refactor existing code to accomodate possible vCPUs. This also assumes that all
processor being used are identical.

Past discussion for reference:
Link: https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg00131.html

Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c         | 12 ++++++++----
 include/hw/arm/virt.h |  1 +
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ac53bfadca..57ec429022 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2045,12 +2045,14 @@ static void finalize_gic_version(VirtMachineState *vms)
  */
 static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
 {
+    CPUArchIdList *possible_cpus = vms->parent.possible_cpus;
     int max_cpus = MACHINE(vms)->smp.max_cpus;
-    bool aarch64, pmu, steal_time;
+    bool aarch64, steal_time;
     CPUState *cpu;
+    int n;
 
     aarch64 = object_property_get_bool(OBJECT(first_cpu), "aarch64", NULL);
-    pmu = object_property_get_bool(OBJECT(first_cpu), "pmu", NULL);
+    vms->pmu = object_property_get_bool(OBJECT(first_cpu), "pmu", NULL);
     steal_time = object_property_get_bool(OBJECT(first_cpu),
                                           "kvm-steal-time", NULL);
 
@@ -2077,8 +2079,10 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
             memory_region_add_subregion(sysmem, pvtime_reg_base, pvtime);
         }
 
-        CPU_FOREACH(cpu) {
-            if (pmu) {
+        for (n = 0; n < possible_cpus->len; n++) {
+            cpu = qemu_get_possible_cpu(n);
+
+            if (vms->pmu) {
                 assert(arm_feature(&ARM_CPU(cpu)->env, ARM_FEATURE_PMU));
                 if (kvm_irqchip_in_kernel()) {
                     kvm_arm_pmu_set_irq(ARM_CPU(cpu), VIRTUAL_PMU_IRQ);
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 36ac5ff4a2..d8dcc89a0d 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -155,6 +155,7 @@ struct VirtMachineState {
     bool ras;
     bool mte;
     bool dtb_randomness;
+    bool pmu;
     OnOffAuto acpi;
     VirtGICType gic_version;
     VirtIOMMUType iommu;
-- 
2.34.1
