Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp434185lfy;
        Wed, 5 Aug 2020 02:18:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjGkgNP4f4opAMZROINnBsiUE9WkZnJ8dn6FfjPRLfebrFTrks1MAcRydMpz6qAt8ZvYkG
X-Received: by 2002:a5b:40b:: with SMTP id m11mr3364688ybp.308.1596619093157;
        Wed, 05 Aug 2020 02:18:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596619093; cv=none;
        d=google.com; s=arc-20160816;
        b=HjKdlfOIkSa/NarkCDqz4JGCOwZYhzltmFkr0Segwwr7bkEHkznM3dc866nY3zhyRN
         NUJkHH2qyNxK1CSeH6f8CSjNPL5gDBpuoZh9xVhiHjvfDO5EcIRDHzBi2KFV/sqDj1tP
         VgOM1WBbRqiUX7M/wm21CSISi5sfod8UKy9ghmrN07AxjzcY/dwC9Lg2PMxtkaMvpqen
         tFiGUoEi1sm1bpcezXvhtcCY2mypbbbl92Y/Ng6fMCksuWVxy9XVb8TYZECJDV1OMAoa
         3+/nBxtJHVRjMLndnToHMO+oizzwC2X3KrKyqwmuki7pY2okMMxxcN7N5Bwky1Lm585H
         zwKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=l9MiLHEL0ZusiqXXJdZN9mvCOzvDNMq7vWBxDe63SLg=;
        b=faaHBZCcRfbUBPnlwToCsvYnE/rRW2SIBonAdLReE6kLhFmuvpm8YRsA46rWsXyifC
         UfanUVnl9QfBmTkmp0GDn4EkPPmh5hJUjXxxtcaAULM8PNn0xHV/Jv+7v+eB/5m2kxvz
         eBsNftIDXMz8Ucdnsoiuj3D7gFJDpXFzj2t5uDlMmweWcy0c7A7bbSziH2A84Psd0VJV
         V/84KuUDCyHifq2tDAqYFLv2zXD+odeZObmVJK7OcFWjhZzZHuV5swrL/tnO/ImqGu3P
         4c4ie38F5k/ID9HMl5kmfMWgFcevxsT/dBLgmRcJ+1tyVYvPYPHrnImirffEbkhN3cw8
         pC2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zuk+qMAR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i67si1794273ybb.71.2020.08.05.02.18.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Aug 2020 02:18:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zuk+qMAR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3FYq-0000UF-Gj
	for alex.bennee@linaro.org; Wed, 05 Aug 2020 05:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k3FXX-0007De-EA
 for qemu-arm@nongnu.org; Wed, 05 Aug 2020 05:16:53 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:47491
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k3FXU-0003ik-6K
 for qemu-arm@nongnu.org; Wed, 05 Aug 2020 05:16:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596619007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l9MiLHEL0ZusiqXXJdZN9mvCOzvDNMq7vWBxDe63SLg=;
 b=Zuk+qMARTeKFSVBUTVNStKu/65Cir1jvSLWUmUK6BqHZBzp1qUUwRG6wtbTARhcKJN9p42
 WDDD2Ryv+iP8UaQuLOYJXXYterUksy5ctDe562+uTfu3IEL2vloX4Q0NrePlXIf0Zi0zkE
 TFv2WQ3AbGjXiGaxJnvDdisrpHEe4Fo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-hHurUTLGNS2Ix1xfwAtT6Q-1; Wed, 05 Aug 2020 05:16:45 -0400
X-MC-Unique: hHurUTLGNS2Ix1xfwAtT6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8ABA7100CCC0;
 Wed,  5 Aug 2020 09:16:44 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D4072DE66;
 Wed,  5 Aug 2020 09:16:43 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 1/5] hw: add compat machines for 5.2
Date: Wed,  5 Aug 2020 11:16:36 +0200
Message-Id: <20200805091640.11134-2-drjones@redhat.com>
In-Reply-To: <20200805091640.11134-1-drjones@redhat.com>
References: <20200805091640.11134-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/05 03:37:07
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v0U3AdgY5Rne

From: Cornelia Huck <cohuck@redhat.com>

Add 5.2 machine types for arm/i440fx/q35/s390x/spapr.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/arm/virt.c              |  9 ++++++++-
 hw/core/machine.c          |  3 +++
 hw/i386/pc.c               |  6 ++++--
 hw/i386/pc_piix.c          | 14 +++++++++++++-
 hw/i386/pc_q35.c           | 13 ++++++++++++-
 hw/ppc/spapr.c             | 15 +++++++++++++--
 hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
 include/hw/boards.h        |  3 +++
 include/hw/i386/pc.h       |  3 +++
 9 files changed, 72 insertions(+), 8 deletions(-)

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
index 47c5ca3e342b..1733b5341a62 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -97,8 +97,10 @@
 #include "fw_cfg.h"
 #include "trace.h"
 
-GlobalProperty pc_compat_5_0[] = {
-};
+GlobalProperty pc_compat_5_1[] = {};
+const size_t pc_compat_5_1_len = G_N_ELEMENTS(pc_compat_5_1);
+
+GlobalProperty pc_compat_5_0[] = {};
 const size_t pc_compat_5_0_len = G_N_ELEMENTS(pc_compat_5_0);
 
 GlobalProperty pc_compat_4_2[] = {
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

