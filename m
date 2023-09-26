Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp982790ejc;
        Tue, 26 Sep 2023 03:11:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkOJXOrCHiRQRGUXGVrLtMCk2gMslb2JJkfuwXpKA2i6kPBKwgXhZJwibHzRjA/Hv5PuHi
X-Received: by 2002:a5d:6a42:0:b0:314:15a8:7879 with SMTP id t2-20020a5d6a42000000b0031415a87879mr8300512wrw.34.1695723063592;
        Tue, 26 Sep 2023 03:11:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695723063; cv=none;
        d=google.com; s=arc-20160816;
        b=eWJbHZR5KTVMywsvlz9ydFMaxtXnaz2hBEqMhJ1ugCTeZVZAZu/TSNjxOIRaH0OIi1
         WZFwHjRIFkzolh5QVOGAQz1COXMIfIOXqz1TdEHJDQl19llQfnWEJV2qF3kTDhYW76lE
         nxKiTbPyEFEoE+pbNze7KGgcRZB2BdauUbQp43jo4VY7ZCAX7XZHd9RsTVsRj0Tbmsgu
         FuNCpHTAjT5Ol+cCIuywfiJoj6FlSD9RgFbD6Lsg9NX/GoHTXwucdTEvasWsP6GkL6Sy
         I7czmVeyVqIDx7QLYJDx3mWjwlG1Lyyb4tl2VNh3QFMOoZi3+4Boy0SsceUXQkFshBqO
         uCaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=6ssm8msVI3HRb5k8ZEe+7xWhpWkSgBFbRLcWAJxEyps=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=QOI8xs2a6LeUtJZn3Kzy0iwpBIKewkAlCfOZGj5b9U8L8STFne28WqJD/pJaZtMU1u
         OIa7B+PuMTore99Xi+iya3gc+xpshxCSORjke2y7EeyQ1/EWHm7rZlBUGcIhY/NMAZed
         RxlbIISp1zcQxLLYkg4rlM2wXIjvzOvk3UrJt82XIQlpRMTdJx88AZnwk3+/0eHvf2ZG
         sYjg+nIOsjihI5TemRwUCslNlVlLvg//p6XMm1eFoIWI3VXzukmm2LaW6XnPgHTGNcXZ
         iWNbZN000vxmEL0FYra2Hg2ITyvf8xWb6pBKwqEbPDczwpvnOaPoecjefSDHGt3begjN
         oOUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id j9-20020adfea49000000b0032331540da5si1075210wrn.593.2023.09.26.03.11.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:11:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvwSB4340z6D8bS;
	Tue, 26 Sep 2023 18:08:42 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:10:43 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<mst@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>
Subject: [PATCH RFC V2 18/37] arm/virt: Make ARM vCPU *present* status ACPI *persistent*
Date: Tue, 26 Sep 2023 11:04:17 +0100
Message-ID: <20230926100436.28284-19-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926100436.28284-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: xqyX2HVPOkD/

ARM arch does not allow CPUs presence to be changed [1] after kernel has booted.
Hence, firmware/ACPI/Qemu must ensure persistent view of the vCPUs to the Guest
kernel even when they are not present in the QoM i.e. are unplugged or are
yet-to-be-plugged

References:
[1] Check comment 5 in the bugzilla entry
   Link: https://bugzilla.tianocore.org/show_bug.cgi?id=4481#c5

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 cpus-common.c         |  6 ++++++
 hw/arm/virt.c         |  7 +++++++
 include/hw/core/cpu.h | 20 ++++++++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/cpus-common.c b/cpus-common.c
index 24c04199a1..d64aa63b19 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -128,6 +128,12 @@ bool qemu_enabled_cpu(CPUState *cpu)
     return cpu && !cpu->disabled;
 }
 
+bool qemu_persistent_cpu(CPUState *cpu)
+{
+    /* cpu state can be faked to the guest via acpi */
+    return cpu->acpi_persistent;
+}
+
 uint64_t qemu_get_cpu_archid(int cpu_index)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index cbb6199ec6..f1bee569d5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3006,6 +3006,13 @@ static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
         return;
     }
     virt_cpu_set_properties(OBJECT(cs), cpu_slot, errp);
+
+    /*
+     * To give persistent presence view of vCPUs to the guest, ACPI might need
+     * to fake the presence of the vCPUs to the guest but keep them disabled.
+     * This shall be used during the init of ACPI Hotplug state and hot-unplug
+     */
+     cs->acpi_persistent = true;
 }
 
 static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index b2201a98ee..dab572c9bd 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -425,6 +425,13 @@ struct CPUState {
      * By default every CPUState is enabled as of now across all archs.
      */
     bool disabled;
+    /*
+     * On certain architectures, to give persistent view of the 'presence' of
+     * vCPUs to the guest, ACPI might need to fake the 'presence' of the vCPUs
+     * but keep them ACPI disabled to the guest. This is done by returning
+     * _STA.PRES=True and _STA.Ena=False for the unplugged vCPUs in QEMU QoM.
+     */
+    bool acpi_persistent;
     /* TODO Move common fields from CPUArchState here. */
     int cpu_index;
     int cluster_index;
@@ -814,6 +821,19 @@ bool qemu_present_cpu(CPUState *cpu);
  */
 bool qemu_enabled_cpu(CPUState *cpu);
 
+/**
+ * qemu_persistent_cpu:
+ * @cpu: The vCPU to check
+ *
+ * Checks if the vCPU state should always be reflected as *present* via ACPI
+ * to the Guest. By default, this is False on all architectures and has to be
+ * explicity set during initialization.
+ *
+ * Returns: True if it is ACPI 'persistent' CPU
+ *
+ */
+bool qemu_persistent_cpu(CPUState *cpu);
+
 /**
  * qemu_get_cpu_archid:
  * @cpu_index: possible vCPU for which arch-id needs to be retreived
-- 
2.34.1
