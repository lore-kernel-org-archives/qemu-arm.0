Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3263481lfb;
        Sun, 8 Nov 2020 19:09:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4DF6TS66rMZP9NHAU/8/SA9vpT8O9JJnpi2fMWBMk0Cdg5djjWxj1BQ07+W5y+CTnlCIB
X-Received: by 2002:a0c:b664:: with SMTP id q36mr11908590qvf.6.1604891384081;
        Sun, 08 Nov 2020 19:09:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604891384; cv=none;
        d=google.com; s=arc-20160816;
        b=urS3PuA9D555Vxt6PXexuYQZIlbU0UBhxqg93ztNQy1Sc8afM9T42kDCm43DuReEob
         ek+tM53tDs620KiRxz+7jHLeq2wmq3RxXB2V3gKouFglPcF3fbVNS14STZ4OQCs3nmA6
         H6KMctOm+SsegXw8hCHnFT1SFmupUNl2NTHuDzyrCmrHw8IIqGMFMvZdy32LBvo1bS9I
         kuVeT/kq+9V5KPu3ANVxGl9f1uPVbqetUNKUqJKKyAmDDpmPyr1t9P/XtQ9Q/MpJZaU4
         19koHUgRsCTPIb4xv+aOWgOXAPYVPF/dAj3wTxfUuhVZnArnvhOK29seWxEIGKJATI9z
         65lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=WTu3XIpftv9ytktn+0hx+So5Xg1lM37braAxIIoA4mM=;
        b=aLl8ZdUyav8co6EpfUK3ok02rX1P0jK2KVBZkqMGLgnckspLaHKlXBQQa2wlLkWsBL
         eZ+PY7hsZrVX5fGrQBkiTj82YkxckyWhT5qs+wy0YjwCgU9QPrgQ/jug2ys29Pk1dFRB
         wL6jUvY3lpjEtiHqzx43ooJueUaKCc0qt/72/UBgXKho38d7Pha2Mf75/7iZUmUhxxPM
         AAXwA1uoY4rC++p4M1YUrDu+DUvNKkwLVVS5Rf/Drz/nfDNJEW4Cf4Se7lKQmImBxYU/
         lrtEqTEzPLtTcVFCyGgjc8CUyAP0JAeTypBtPax2S01huzNFHU/7I7BJqXMlJCpRoHdu
         ZBGg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g8si4213676qtx.154.2020.11.08.19.09.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Nov 2020 19:09:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kbxYt-0006xA-FW
	for alex.bennee@linaro.org; Sun, 08 Nov 2020 22:09:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kbxUv-0001iN-6v; Sun, 08 Nov 2020 22:05:37 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kbxUr-0006dv-4T; Sun, 08 Nov 2020 22:05:36 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CTwpb0XGQzLt75;
 Mon,  9 Nov 2020 11:05:11 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Mon, 9 Nov 2020
 11:05:12 +0800
From: Ying Fang <fangying1@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [RFC PATCH v3 05/13] hw: add compat machines for 5.3
Date: Mon, 9 Nov 2020 11:04:44 +0800
Message-ID: <20201109030452.2197-6-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201109030452.2197-1-fangying1@huawei.com>
References: <20201109030452.2197-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=fangying1@huawei.com;
 helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/08 22:05:18
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com, salil.mehta@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1oG4gBZN2lFd

Add 5.3 machine types for arm/i440fx/q35/s390x/spapr.

Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 hw/arm/virt.c              |  9 ++++++++-
 hw/core/machine.c          |  3 +++
 hw/i386/pc.c               |  3 +++
 hw/i386/pc_piix.c          | 15 ++++++++++++++-
 hw/i386/pc_q35.c           | 14 +++++++++++++-
 hw/ppc/spapr.c             | 15 +++++++++++++--
 hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
 include/hw/boards.h        |  3 +++
 include/hw/i386/pc.h       |  3 +++
 9 files changed, 73 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ba902b53ba..ff8a14439e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2665,10 +2665,17 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
+static void virt_machine_5_3_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(5, 3)
+
 static void virt_machine_5_2_options(MachineClass *mc)
 {
+    virt_machine_5_3_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(5, 2)
+DEFINE_VIRT_MACHINE(5, 2)
 
 static void virt_machine_5_1_options(MachineClass *mc)
 {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 7e2f4ec08e..6dc77699a9 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -28,6 +28,9 @@
 #include "hw/mem/nvdimm.h"
 #include "migration/vmstate.h"
 
+GlobalProperty hw_compat_5_2[] = { };
+const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
+
 GlobalProperty hw_compat_5_1[] = {
     { "vhost-scsi", "num_queues", "1"},
     { "vhost-user-blk", "num-queues", "1"},
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index e87be5d29a..eaa046ff5d 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -97,6 +97,9 @@
 #include "trace.h"
 #include CONFIG_DEVICES
 
+GlobalProperty pc_compat_5_2[] = { };
+const size_t pc_compat_5_2_len = G_N_ELEMENTS(pc_compat_5_2);
+
 GlobalProperty pc_compat_5_1[] = {
     { "ICH9-LPC", "x-smi-cpu-hotplug", "off" },
 };
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 3c2ae0612b..01254090ce 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -426,7 +426,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
 }
 
-static void pc_i440fx_5_2_machine_options(MachineClass *m)
+static void pc_i440fx_5_3_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_machine_options(m);
@@ -435,6 +435,19 @@ static void pc_i440fx_5_2_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_I440FX_MACHINE(v5_3, "pc-i440fx-5.3", NULL,
+                      pc_i440fx_5_3_machine_options);
+
+static void pc_i440fx_5_2_machine_options(MachineClass *m)
+{
+    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
+    pc_i440fx_machine_options(m);
+    m->alias = NULL;
+    m->is_default = false;
+    compat_props_add(m->compat_props, hw_compat_5_2, hw_compat_5_2_len);
+    compat_props_add(m->compat_props, pc_compat_5_2, pc_compat_5_2_len);
+}
+
 DEFINE_I440FX_MACHINE(v5_2, "pc-i440fx-5.2", NULL,
                       pc_i440fx_5_2_machine_options);
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index a3f4959c43..dd14803edb 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -344,7 +344,7 @@ static void pc_q35_machine_options(MachineClass *m)
     m->max_cpus = 288;
 }
 
-static void pc_q35_5_2_machine_options(MachineClass *m)
+static void pc_q35_5_3_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_machine_options(m);
@@ -352,6 +352,18 @@ static void pc_q35_5_2_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_Q35_MACHINE(v5_3, "pc-q35-5.3", NULL,
+                   pc_q35_5_3_machine_options);
+
+static void pc_q35_5_2_machine_options(MachineClass *m)
+{
+    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
+    pc_q35_machine_options(m);
+    m->alias = NULL;
+    compat_props_add(m->compat_props, hw_compat_5_2, hw_compat_5_2_len);
+    compat_props_add(m->compat_props, pc_compat_5_2, pc_compat_5_2_len);
+}
+
 DEFINE_Q35_MACHINE(v5_2, "pc-q35-5.2", NULL,
                    pc_q35_5_2_machine_options);
 
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 2db810f73a..c292a3edd9 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4511,15 +4511,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
     }                                                                \
     type_init(spapr_machine_register_##suffix)
 
+/*
+ * pseries-5.3
+ */
+static void spapr_machine_5_3_class_options(MachineClass *mc)
+{
+    /* Defaults for the latest behaviour inherited from the base class */
+}
+
+DEFINE_SPAPR_MACHINE(5_3, "5.3", true);
+
 /*
  * pseries-5.2
  */
 static void spapr_machine_5_2_class_options(MachineClass *mc)
 {
-    /* Defaults for the latest behaviour inherited from the base class */
+    spapr_machine_5_3_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
 }
 
-DEFINE_SPAPR_MACHINE(5_2, "5.2", true);
+DEFINE_SPAPR_MACHINE(5_2, "5.2", false);
 
 /*
  * pseries-5.1
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 28266a3a35..bde084e13d 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -789,14 +789,26 @@ bool css_migration_enabled(void)
     }                                                                         \
     type_init(ccw_machine_register_##suffix)
 
+static void ccw_machine_5_3_instance_options(MachineState *machine)
+{
+}
+
+static void ccw_machine_5_3_class_options(MachineClass *mc)
+{
+}
+DEFINE_CCW_MACHINE(5_3, "5.3", true);
+
 static void ccw_machine_5_2_instance_options(MachineState *machine)
 {
+    ccw_machine_5_3_instance_options(machine);
 }
 
 static void ccw_machine_5_2_class_options(MachineClass *mc)
 {
+    ccw_machine_5_3_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
 }
-DEFINE_CCW_MACHINE(5_2, "5.2", true);
+DEFINE_CCW_MACHINE(5_2, "5.2", false);
 
 static void ccw_machine_5_1_instance_options(MachineState *machine)
 {
diff --git a/include/hw/boards.h b/include/hw/boards.h
index bf53e8a16e..f631c1799d 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -311,6 +311,9 @@ struct MachineState {
     } \
     type_init(machine_initfn##_register_types)
 
+extern GlobalProperty hw_compat_5_2[];
+extern const size_t hw_compat_5_2_len;
+
 extern GlobalProperty hw_compat_5_1[];
 extern const size_t hw_compat_5_1_len;
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 84639d0ebc..6f1531ed14 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -190,6 +190,9 @@ void pc_system_firmware_init(PCMachineState *pcms, MemoryRegion *rom_memory);
 void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
                        const CPUArchIdList *apic_ids, GArray *entry);
 
+extern GlobalProperty pc_compat_5_2[];
+extern const size_t pc_compat_5_2_len;
+
 extern GlobalProperty pc_compat_5_1[];
 extern const size_t pc_compat_5_1_len;
 
-- 
2.23.0

