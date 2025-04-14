Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp1882025njc;
        Mon, 14 Apr 2025 02:47:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUC5b/gX2hRZBLJgdvUZXOLDeATS+W9tkIjpZ7uhrbnlFKZufNG0zTnWbn4fPUyf6IDiGwzgjSEgcgB2w==@linaro.org
X-Google-Smtp-Source: AGHT+IGxRSWD2xnJmzeMJhueR9KvW26BBmc5kzp4IkyFajek6u9l3Vgyv9Bc7hEiBbM5b+plh0he
X-Received: by 2002:a05:622a:1986:b0:476:a895:7e87 with SMTP id d75a77b69052e-479775d5876mr180009981cf.48.1744624023550;
        Mon, 14 Apr 2025 02:47:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744624023; cv=none;
        d=google.com; s=arc-20240605;
        b=B3paj3Ru+2VZVGDlFGi3U7k8BIaN5KnEsDnjk1hra4lBQXoZTnv3vVHYYgxm3sHC4p
         4z0PiwtnsMLMst9BIbE+DB2XgnZQ2QoqMUjTm2cpSZiVEZo/OsKvmqej1TQXdNS4wcj9
         d/TfgUNq/GZkDhnYoOdTvrZxb3eVwwC/H3jBpI8dIa4Tn9Z27/VAJLe16LS9aosyVK5K
         4I7PbrUVTzPiRg3+vmVUSjR+ALfdVAnMIb/cFvK+1GV+p/bKVWRZeOqjYVQuERynC1em
         bXBOijwi0+MkMuT5snrB+1Akn6DfgIQCnWBWA2RdnKxLBkxk1XGNWdxeVDim5o+ON9hY
         spcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=3SMAp6T2FkH5opRLib2Mq7ookQAClD6885mvsjGnnaM=;
        fh=l6gIlmi/bG9zvEb7iHBlLdcOmEINnOg2+FvEAXQVskA=;
        b=OUJXvRHs3xr/VdGmcvmyXzWHyRytFLpoW9+Zqby8vd6n5uDlPsWt3nZP3fFK47MUCg
         KDMT9cPBcxQuwrgTUy9QGaRr/psYLh3whQSByedxyMz6m8NqXXorL357ib4Ajw4UBqDJ
         pOBoXiiSeiPTv1S0GCyGbQJjc4roB144OdTYhloMkXOwUP/A8haJpqip43T46jIrMjBi
         qN4fmI/cV6ys/o1oOsPukV6EV5aWM6HFlpknCftIxHvGklZAxKZDLwQn4uYvwB6Ev5Nn
         l4q2fUrriOc+eE/+oPMpkisBI4TebPVG5FAaWhm3O0auKPFW7Usu1ndgmDAgB2wgvqOX
         MaIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ehpy45Ar;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4796ee1372esi81949851cf.615.2025.04.14.02.47.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Apr 2025 02:47:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ehpy45Ar;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u4GOv-0006yk-0l; Mon, 14 Apr 2025 05:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1u4GOQ-0006vM-3A
 for qemu-arm@nongnu.org; Mon, 14 Apr 2025 05:46:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1u4GOK-0000Nw-7s
 for qemu-arm@nongnu.org; Mon, 14 Apr 2025 05:46:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744623970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3SMAp6T2FkH5opRLib2Mq7ookQAClD6885mvsjGnnaM=;
 b=ehpy45Ar8OloDUJI3TJFIwZhrwvG+kMc7sk0T9waFGNJy/WmZInTsPwbD3VCZ+NG6pSdHb
 EL0CZC0F+RiJE/s7LcfxovgFXkTh+CBrfV/p+bKu/WPbkp/GkiH4xz2bRn88Cd7B5aZDtq
 JV6xKiJPWHt2KSVrQuQd0Je4jpFb4bE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-549-Ijm-brf2OZeT7gVdbyExeQ-1; Mon,
 14 Apr 2025 05:46:06 -0400
X-MC-Unique: Ijm-brf2OZeT7gVdbyExeQ-1
X-Mimecast-MFC-AGG-ID: Ijm-brf2OZeT7gVdbyExeQ_1744623964
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A825318001F9; Mon, 14 Apr 2025 09:46:03 +0000 (UTC)
Received: from gondolin.str.redhat.com (dhcp-192-216.str.redhat.com
 [10.33.192.216])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id EFAA6180B487; Mon, 14 Apr 2025 09:45:52 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH] hw: add compat machines for 10.1
Date: Mon, 14 Apr 2025 11:45:43 +0200
Message-ID: <20250414094543.221241-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: i7NADj1su7oW

Add 10.1 machine types for arm/i440fx/m68k/q35/s390x/spapr.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/arm/virt.c              |  9 ++++++++-
 hw/core/machine.c          |  3 +++
 hw/i386/pc.c               |  3 +++
 hw/i386/pc_piix.c          | 13 +++++++++++--
 hw/i386/pc_q35.c           | 13 +++++++++++--
 hw/m68k/virt.c             |  9 ++++++++-
 hw/ppc/spapr.c             | 15 +++++++++++++--
 hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
 include/hw/boards.h        |  3 +++
 include/hw/i386/pc.h       |  3 +++
 10 files changed, 76 insertions(+), 9 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a96452f17a48..3e72adaa918f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3408,10 +3408,17 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
+static void virt_machine_10_1_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(10, 1)
+
 static void virt_machine_10_0_options(MachineClass *mc)
 {
+    virt_machine_10_1_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_10_0, hw_compat_10_0_len);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(10, 0)
+DEFINE_VIRT_MACHINE(10, 0)
 
 static void virt_machine_9_2_options(MachineClass *mc)
 {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 63c6ef93d296..abfcedd4a5f7 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -37,6 +37,9 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "audio/audio.h"
 
+GlobalProperty hw_compat_10_0[] = {};
+const size_t hw_compat_10_0_len = G_N_ELEMENTS(hw_compat_10_0);
+
 GlobalProperty hw_compat_9_2[] = {
     {"arm-cpu", "backcompat-pauth-default-use-qarma5", "true"},
     { "virtio-balloon-pci", "vectors", "0" },
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 01d0581f62a3..1b5d55e96d51 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -79,6 +79,9 @@
     { "qemu64-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },\
     { "athlon-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },
 
+GlobalProperty pc_compat_10_0[] = {};
+const size_t pc_compat_10_0_len = G_N_ELEMENTS(pc_compat_10_0);
+
 GlobalProperty pc_compat_9_2[] = {};
 const size_t pc_compat_9_2_len = G_N_ELEMENTS(pc_compat_9_2);
 
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 6c91e2d29298..dbb59df64f75 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -479,12 +479,21 @@ static void pc_i440fx_machine_options(MachineClass *m)
                                      "Use a different south bridge than PIIX3");
 }
 
-static void pc_i440fx_machine_10_0_options(MachineClass *m)
+static void pc_i440fx_machine_10_1_options(MachineClass *m)
 {
     pc_i440fx_machine_options(m);
 }
 
-DEFINE_I440FX_MACHINE_AS_LATEST(10, 0);
+DEFINE_I440FX_MACHINE_AS_LATEST(10, 1);
+
+static void pc_i440fx_machine_10_0_options(MachineClass *m)
+{
+    pc_i440fx_machine_10_1_options(m);
+    compat_props_add(m->compat_props, hw_compat_10_0, hw_compat_10_0_len);
+    compat_props_add(m->compat_props, pc_compat_10_0, pc_compat_10_0_len);
+}
+
+DEFINE_I440FX_MACHINE(10, 0);
 
 static void pc_i440fx_machine_9_2_options(MachineClass *m)
 {
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index fd96d0345c7d..c538b3d05b47 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -361,12 +361,21 @@ static void pc_q35_machine_options(MachineClass *m)
                      pc_q35_compat_defaults, pc_q35_compat_defaults_len);
 }
 
-static void pc_q35_machine_10_0_options(MachineClass *m)
+static void pc_q35_machine_10_1_options(MachineClass *m)
 {
     pc_q35_machine_options(m);
 }
 
-DEFINE_Q35_MACHINE_AS_LATEST(10, 0);
+DEFINE_Q35_MACHINE_AS_LATEST(10, 1);
+
+static void pc_q35_machine_10_0_options(MachineClass *m)
+{
+    pc_q35_machine_10_1_options(m);
+    compat_props_add(m->compat_props, hw_compat_10_0, hw_compat_10_0_len);
+    compat_props_add(m->compat_props, pc_compat_10_0, pc_compat_10_0_len);
+}
+
+DEFINE_Q35_MACHINE(10, 0);
 
 static void pc_q35_machine_9_2_options(MachineClass *m)
 {
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index d967bdd7438e..295a614e1619 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -366,10 +366,17 @@ type_init(virt_machine_register_types)
 #define DEFINE_VIRT_MACHINE(major, minor) \
     DEFINE_VIRT_MACHINE_IMPL(false, major, minor)
 
+static void virt_machine_10_1_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(10, 1)
+
 static void virt_machine_10_0_options(MachineClass *mc)
 {
+    virt_machine_10_1_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_10_0, hw_compat_10_0_len);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(10, 0)
+DEFINE_VIRT_MACHINE(10, 0)
 
 static void virt_machine_9_2_options(MachineClass *mc)
 {
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index b0a0f8c68951..6fef1d167ae6 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4766,15 +4766,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
 #define DEFINE_SPAPR_MACHINE(major, minor) \
     DEFINE_SPAPR_MACHINE_IMPL(false, major, minor)
 
+/*
+ * pseries-10.1
+ */
+static void spapr_machine_10_1_class_options(MachineClass *mc)
+{
+    /* Defaults for the latest behaviour inherited from the base class */
+}
+
+DEFINE_SPAPR_MACHINE_AS_LATEST(10, 1);
+
 /*
  * pseries-10.0
  */
 static void spapr_machine_10_0_class_options(MachineClass *mc)
 {
-    /* Defaults for the latest behaviour inherited from the base class */
+    spapr_machine_10_1_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_10_0, hw_compat_10_0_len);
 }
 
-DEFINE_SPAPR_MACHINE_AS_LATEST(10, 0);
+DEFINE_SPAPR_MACHINE(10, 0);
 
 /*
  * pseries-9.2
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 75b32182eb01..d64923a2c86b 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -921,14 +921,26 @@ static const TypeInfo ccw_machine_info = {
     DEFINE_CCW_MACHINE_IMPL(false, major, minor)
 
 
+static void ccw_machine_10_1_instance_options(MachineState *machine)
+{
+}
+
+static void ccw_machine_10_1_class_options(MachineClass *mc)
+{
+}
+DEFINE_CCW_MACHINE_AS_LATEST(10, 1);
+
 static void ccw_machine_10_0_instance_options(MachineState *machine)
 {
+    ccw_machine_10_1_instance_options(machine);
 }
 
 static void ccw_machine_10_0_class_options(MachineClass *mc)
 {
+    ccw_machine_10_1_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_10_0, hw_compat_10_0_len);
 }
-DEFINE_CCW_MACHINE_AS_LATEST(10, 0);
+DEFINE_CCW_MACHINE(10, 0);
 
 static void ccw_machine_9_2_instance_options(MachineState *machine)
 {
diff --git a/include/hw/boards.h b/include/hw/boards.h
index f22b2e7fc75b..bfe8643a27ad 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -761,6 +761,9 @@ struct MachineState {
     } \
     type_init(machine_initfn##_register_types)
 
+extern GlobalProperty hw_compat_10_0[];
+extern const size_t hw_compat_10_0_len;
+
 extern GlobalProperty hw_compat_9_2[];
 extern const size_t hw_compat_9_2_len;
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 103b54301f82..8677dc8950b4 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -215,6 +215,9 @@ void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size);
 /* sgx.c */
 void pc_machine_init_sgx_epc(PCMachineState *pcms);
 
+extern GlobalProperty pc_compat_10_0[];
+extern const size_t pc_compat_10_0_len;
+
 extern GlobalProperty pc_compat_9_2[];
 extern const size_t pc_compat_9_2_len;
 
-- 
2.49.0

