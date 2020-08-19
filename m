Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp511393lfy;
        Wed, 19 Aug 2020 07:41:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWkEmS396JyWejMmrhuz9vOwMU2Jdo+LAbsubb/MWCK2dBn4ETpeEkwE4WpNHM83KzFjyp
X-Received: by 2002:a25:6f83:: with SMTP id k125mr35471430ybc.204.1597848070680;
        Wed, 19 Aug 2020 07:41:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597848070; cv=none;
        d=google.com; s=arc-20160816;
        b=an9GBGQYZuSGC2w/J1DlGYGQZreRY1sUxZAuKHYSnAexd7Ol7C3ZJtmqCHGyVMNrzB
         41TM0OAV5cFszgjBp2Z+c9B9HQwVUsr66cz6dO7OptSPF1yTz8Bi302uoxLl0ic7FptG
         XGVRSawQZMsBmSrGedbNMmciq2utQh3gbu+QUYh38/MrUvLBjGf7DTsS+ksWZ2YeE7HM
         fyayxOFF/pVcNS46e937WSNKXoFrTICDn2mePfSwXbPVsIJtfxLKlQb4tqNPpsr/pdtM
         4YcYLUxiHVjaAM/U6tmNKoBLmAsjszbzgJCnqC0KBSuasb9alnfqhrLHN7xhKJmMc3mV
         xgcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=64YXUZIx205AWRurEDDZH48JDrSFILOise8cW96VVf0=;
        b=vcHGC/zxilz7+BOc5ZCrUuyL21EB7DBU4gF+4hNFKVxgWLBavTrmSup6CNxl59kF41
         HNOOwXGDUpR8IJRLqtEU828LhQC7O2QMzv4dIAVn6hu7/eDG3Du6EqbyPU0CuLchBNhi
         fBU5JYdYtkuIFDZ1tIe2sgcOJa5hoRYCpSIs2dFTd5RIdLoyJmm2EEF9pwKsalvtWFq+
         ykMFVgEyStEYOHPQS59D/YyYoDokokpH8QyiG2SVwB2xrA5Cn9OAQwifJSjfvOcfsAQO
         lasl16RAYn6ekTOzusd2h10UkctcMDlBCMtub3CHHPvpMCMqpNF/avZ2JvbUe5y9xlUX
         pF4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YjhqR9yM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b12si24370063ybm.49.2020.08.19.07.41.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 07:41:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YjhqR9yM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8PH3-00041j-Ui
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 10:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k8PGT-0002uQ-G3
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 10:40:33 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32368
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k8PGR-0002Lj-9N
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 10:40:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597848030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=64YXUZIx205AWRurEDDZH48JDrSFILOise8cW96VVf0=;
 b=YjhqR9yMDKWIk0/DNYtOXd9GTEraeEdEBIqI+QU75tlkjUSduxDn+MG7iC48uRZAk5i4D1
 20jC5alFZUmKHwrarfhR69i8TN8gLMqq5zBUWeae98geWHJI55fuGxs8c8Vmfpe7YOzcqF
 XfLwbW5Gzn6mghkrJYT+Hsx9PjYwqcY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-ZcdDkgO7PC6w2MsXCjDeww-1; Wed, 19 Aug 2020 10:40:28 -0400
X-MC-Unique: ZcdDkgO7PC6w2MsXCjDeww-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86863186A575;
 Wed, 19 Aug 2020 14:40:26 +0000 (UTC)
Received: from localhost (ovpn-112-216.ams2.redhat.com [10.36.112.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2A6B166A5;
 Wed, 19 Aug 2020 14:40:19 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Subject: [PATCH v2] hw: add compat machines for 5.2
Date: Wed, 19 Aug 2020 16:40:16 +0200
Message-Id: <20200819144016.281156-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=cohuck@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 23:05:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sdaCfCLqYYbo

Add 5.2 machine types for arm/i440fx/q35/s390x/spapr.

Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---

v1->v2: rebased on current master

For whoever needs this :) I will include it into an eventually coming
s390x pull request, if nobody beats me to it.

---
 hw/arm/virt.c              |  9 ++++++++-
 hw/core/machine.c          |  3 +++
 hw/i386/pc.c               |  3 +++
 hw/i386/pc_piix.c          | 14 +++++++++++++-
 hw/i386/pc_q35.c           | 13 ++++++++++++-
 hw/ppc/spapr.c             | 15 +++++++++++++--
 hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
 include/hw/boards.h        |  3 +++
 include/hw/i386/pc.h       |  3 +++
 9 files changed, 71 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ecfee362a182..acf9bfbeceaf 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2546,10 +2546,17 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
+static void virt_machine_5_2_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(5, 2)
+
 static void virt_machine_5_1_options(MachineClass *mc)
 {
+    virt_machine_5_2_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_5_1, hw_compat_5_1_len);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(5, 1)
+DEFINE_VIRT_MACHINE(5, 1)
 
 static void virt_machine_5_0_options(MachineClass *mc)
 {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 8d1a90c6cf45..cf5f2dfaeb34 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -28,6 +28,9 @@
 #include "hw/mem/nvdimm.h"
 #include "migration/vmstate.h"
 
+GlobalProperty hw_compat_5_1[] = {};
+const size_t hw_compat_5_1_len = G_N_ELEMENTS(hw_compat_5_1);
+
 GlobalProperty hw_compat_5_0[] = {
     { "pci-host-bridge", "x-config-reg-migration-enabled", "off" },
     { "virtio-balloon-device", "page-poison", "false" },
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 47c5ca3e342b..9aa813949ca8 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -97,6 +97,9 @@
 #include "fw_cfg.h"
 #include "trace.h"
 
+GlobalProperty pc_compat_5_1[] = {};
+const size_t pc_compat_5_1_len = G_N_ELEMENTS(pc_compat_5_1);
+
 GlobalProperty pc_compat_5_0[] = {
 };
 const size_t pc_compat_5_0_len = G_N_ELEMENTS(pc_compat_5_0);
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index b789e83f9acb..c5ba70ca17cb 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -426,7 +426,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
 }
 
-static void pc_i440fx_5_1_machine_options(MachineClass *m)
+static void pc_i440fx_5_2_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_machine_options(m);
@@ -435,6 +435,18 @@ static void pc_i440fx_5_1_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_I440FX_MACHINE(v5_2, "pc-i440fx-5.2", NULL,
+                      pc_i440fx_5_2_machine_options);
+
+static void pc_i440fx_5_1_machine_options(MachineClass *m)
+{
+    pc_i440fx_5_2_machine_options(m);
+    m->alias = NULL;
+    m->is_default = false;
+    compat_props_add(m->compat_props, hw_compat_5_1, hw_compat_5_1_len);
+    compat_props_add(m->compat_props, pc_compat_5_1, pc_compat_5_1_len);
+}
+
 DEFINE_I440FX_MACHINE(v5_1, "pc-i440fx-5.1", NULL,
                       pc_i440fx_5_1_machine_options);
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index a3e607a544a5..0cb9c18cd44d 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -353,7 +353,7 @@ static void pc_q35_machine_options(MachineClass *m)
     m->max_cpus = 288;
 }
 
-static void pc_q35_5_1_machine_options(MachineClass *m)
+static void pc_q35_5_2_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_machine_options(m);
@@ -361,6 +361,17 @@ static void pc_q35_5_1_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_Q35_MACHINE(v5_2, "pc-q35-5.2", NULL,
+                   pc_q35_5_2_machine_options);
+
+static void pc_q35_5_1_machine_options(MachineClass *m)
+{
+    pc_q35_5_2_machine_options(m);
+    m->alias = NULL;
+    compat_props_add(m->compat_props, hw_compat_5_1, hw_compat_5_1_len);
+    compat_props_add(m->compat_props, pc_compat_5_1, pc_compat_5_1_len);
+}
+
 DEFINE_Q35_MACHINE(v5_1, "pc-q35-5.1", NULL,
                    pc_q35_5_1_machine_options);
 
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 0ae293ec9431..1c8d0981b382 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4579,15 +4579,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
     }                                                                \
     type_init(spapr_machine_register_##suffix)
 
+/*
+ * pseries-5.2
+ */
+static void spapr_machine_5_2_class_options(MachineClass *mc)
+{
+    /* Defaults for the latest behaviour inherited from the base class */
+}
+
+DEFINE_SPAPR_MACHINE(5_2, "5.2", true);
+
 /*
  * pseries-5.1
  */
 static void spapr_machine_5_1_class_options(MachineClass *mc)
 {
-    /* Defaults for the latest behaviour inherited from the base class */
+    spapr_machine_5_2_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_5_1, hw_compat_5_1_len);
 }
 
-DEFINE_SPAPR_MACHINE(5_1, "5.1", true);
+DEFINE_SPAPR_MACHINE(5_1, "5.1", false);
 
 /*
  * pseries-5.0
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index e72c61d2eae0..f4ea6a954597 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -801,14 +801,26 @@ bool css_migration_enabled(void)
     }                                                                         \
     type_init(ccw_machine_register_##suffix)
 
+static void ccw_machine_5_2_instance_options(MachineState *machine)
+{
+}
+
+static void ccw_machine_5_2_class_options(MachineClass *mc)
+{
+}
+DEFINE_CCW_MACHINE(5_2, "5.2", true);
+
 static void ccw_machine_5_1_instance_options(MachineState *machine)
 {
+    ccw_machine_5_2_instance_options(machine);
 }
 
 static void ccw_machine_5_1_class_options(MachineClass *mc)
 {
+    ccw_machine_5_2_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_5_1, hw_compat_5_1_len);
 }
-DEFINE_CCW_MACHINE(5_1, "5.1", true);
+DEFINE_CCW_MACHINE(5_1, "5.1", false);
 
 static void ccw_machine_5_0_instance_options(MachineState *machine)
 {
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 426ce5f625a4..bc5b82ad209e 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -319,6 +319,9 @@ struct MachineState {
     } \
     type_init(machine_initfn##_register_types)
 
+extern GlobalProperty hw_compat_5_1[];
+extern const size_t hw_compat_5_1_len;
+
 extern GlobalProperty hw_compat_5_0[];
 extern const size_t hw_compat_5_0_len;
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 3d7ed3a55e30..fe52e165b27c 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -193,6 +193,9 @@ void pc_system_firmware_init(PCMachineState *pcms, MemoryRegion *rom_memory);
 void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
                        const CPUArchIdList *apic_ids, GArray *entry);
 
+extern GlobalProperty pc_compat_5_1[];
+extern const size_t pc_compat_5_1_len;
+
 extern GlobalProperty pc_compat_5_0[];
 extern const size_t pc_compat_5_0_len;
 
-- 
2.25.4

