Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1156840njf;
        Fri, 16 Aug 2024 03:38:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUpomHrs3AnHsq1AqPMGMQ0GnnmDhyQkKqUqqnTRJlpNCWD4PS3JL9sa1gV6VuvSSS5ymsHB8RyX9z4nr5LjdNf3ULw0hT2
X-Google-Smtp-Source: AGHT+IGNaspKPgyfXqepo0P0E4HdHlkfu0DFe6BO5yt7BuRGfgtBz7tu9CAh6oS7ifj7tqvNR6eA
X-Received: by 2002:a05:6214:5c04:b0:6bf:7bcd:78e3 with SMTP id 6a1803df08f44-6bf7cdedbb5mr24331286d6.29.1723804706609;
        Fri, 16 Aug 2024 03:38:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723804706; cv=none;
        d=google.com; s=arc-20160816;
        b=XRHR2+0tiIG+10mhO0gjVGoSMChz8g2aHcY8ad8WLz+WXawefPFuQFMItZNq8LtKRy
         FGHderoN66IduEqoCeQOOucE8qnqKcbY+vH9QH1R1x3Wk1pjUbfqnpFhbBkYojNCbsOr
         Rc8J3zh1qj411Ys+qAyprUbU1/k+QcvOjaIWipwJXOFCj9Gp6eRE29awMjcJ7MNHwF8q
         rFLdGoV4Rlik4kKV/BCNNbK+PuaM3lVQ/FwJ01INIs3VLZOR3FJFbL+OY4KJilNCkDVQ
         BuZOtHnGyD+AVSufPOY32AKh90eLtT5nkrR8Txuggl6v3vgiss4aywaCa2T7M81GMWnj
         HvqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=bRFn2gcsCH1DPqIkJG2TXb2/rUer206MG55MbUglkdY=;
        fh=pFL8CH/6Tuwk/vbtKJv7HqaWBWBIqfdSq41ama2/Ra8=;
        b=K4leJiYOHZokjS44Oe+viZpSIGbvW/DNh4O1avtnrTwP7gQyIlXQGEllf7nJVYjgNy
         a7CYCQn3Eyj3a6t1aEZRcrU5nj3tVGuWK/qxEf3538zjtX3GD45OHB8rtDQweMtq1F29
         7aKo6zmjZaGb+hfFPPsqzGY5quSqRmNYcKdPGGAFOGl3r6KUMM0wuZiFV2fDfIYCh/zR
         qGbIamO/sWhICGPheTdrRSIN3TIkjed9LRH+e5hW0eLxZpB62fYPPaVIlkKQsvqRAqJ7
         8n661gTURD6xdbeQGwOCq3byZcTtCccjRjyn/yj+QkV+NCg+YCJ/nJ+SOH/G8nsWre4U
         /u6g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a6B9gYz6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bf6fdc88d3si38554596d6.38.2024.08.16.03.38.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2024 03:38:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a6B9gYz6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1seuLQ-0000tW-Bj; Fri, 16 Aug 2024 06:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1seuLO-0000o2-DL
 for qemu-arm@nongnu.org; Fri, 16 Aug 2024 06:38:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1seuL9-0006Ae-Uo
 for qemu-arm@nongnu.org; Fri, 16 Aug 2024 06:38:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723804669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bRFn2gcsCH1DPqIkJG2TXb2/rUer206MG55MbUglkdY=;
 b=a6B9gYz6Ou4uyQZif6BOKDUqML1ARlORdICZLQ0qjFaIXVb4uIQLOZGink3Klp9qu5g87w
 1YtOPUB6YcPrf19Ehp/OMcNyvZBSPuCHubjTUreFak4bjP59A5qSSkIJNq7Vix/V4NypED
 Ne6iCmJoP6klG131qq/L4RDZd7g8vIk=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-534-Hvm3FYjNNQ6ReahwXL9kvQ-1; Fri,
 16 Aug 2024 06:37:46 -0400
X-MC-Unique: Hvm3FYjNNQ6ReahwXL9kvQ-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A7DA71955D4B; Fri, 16 Aug 2024 10:37:41 +0000 (UTC)
Received: from gondolin.str.redhat.com (dhcp-192-244.str.redhat.com
 [10.33.192.244])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 176661955F2E; Fri, 16 Aug 2024 10:37:31 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH for-9.2] hw: add compat machines for 9.2
Date: Fri, 16 Aug 2024 12:37:23 +0200
Message-ID: <20240816103723.2325982-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.131,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 8ChSiJKgWhRg

Add 9.2 machine types for arm/i440fx/m68k/q35/s390x/spapr.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/arm/virt.c              |  9 ++++++++-
 hw/core/machine.c          |  3 +++
 hw/i386/pc.c               |  3 +++
 hw/i386/pc_piix.c          | 15 ++++++++++++---
 hw/i386/pc_q35.c           | 13 +++++++++++--
 hw/m68k/virt.c             |  9 ++++++++-
 hw/ppc/spapr.c             | 15 +++++++++++++--
 hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
 include/hw/boards.h        |  3 +++
 include/hw/i386/pc.h       |  3 +++
 10 files changed, 77 insertions(+), 10 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 687fe0bb8bc9..a5d3ad9bf9e7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3301,10 +3301,17 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
+static void virt_machine_9_2_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(9, 2)
+
 static void virt_machine_9_1_options(MachineClass *mc)
 {
+    virt_machine_9_2_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_9_1, hw_compat_9_1_len);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(9, 1)
+DEFINE_VIRT_MACHINE(9, 1)
 
 static void virt_machine_9_0_options(MachineClass *mc)
 {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 27dcda024834..adaba17ebac1 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -34,6 +34,9 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "audio/audio.h"
 
+GlobalProperty hw_compat_9_1[] = {};
+const size_t hw_compat_9_1_len = G_N_ELEMENTS(hw_compat_9_1);
+
 GlobalProperty hw_compat_9_0[] = {
     {"arm-cpu", "backcompat-cntfrq", "true" },
     { "scsi-hd", "migrate-emulated-scsi-request", "false" },
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c74931d577a8..0cf4cb0d9f29 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -79,6 +79,9 @@
     { "qemu64-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },\
     { "athlon-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },
 
+GlobalProperty pc_compat_9_1[] = {};
+const size_t pc_compat_9_1_len = G_N_ELEMENTS(pc_compat_9_1);
+
 GlobalProperty pc_compat_9_0[] = {
     { TYPE_X86_CPU, "x-amd-topoext-features-only", "false" },
     { TYPE_X86_CPU, "x-l1-cache-per-thread", "false" },
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index d9e69243b4a7..746bfe05d386 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -479,13 +479,24 @@ static void pc_i440fx_machine_options(MachineClass *m)
                                      "Use a different south bridge than PIIX3");
 }
 
-static void pc_i440fx_machine_9_1_options(MachineClass *m)
+static void pc_i440fx_machine_9_2_options(MachineClass *m)
 {
     pc_i440fx_machine_options(m);
     m->alias = "pc";
     m->is_default = true;
 }
 
+DEFINE_I440FX_MACHINE(9, 2);
+
+static void pc_i440fx_machine_9_1_options(MachineClass *m)
+{
+    pc_i440fx_machine_9_2_options(m);
+    m->alias = NULL;
+    m->is_default = false;
+    compat_props_add(m->compat_props, hw_compat_9_1, hw_compat_9_1_len);
+    compat_props_add(m->compat_props, pc_compat_9_1, pc_compat_9_1_len);
+}
+
 DEFINE_I440FX_MACHINE(9, 1);
 
 static void pc_i440fx_machine_9_0_options(MachineClass *m)
@@ -493,8 +504,6 @@ static void pc_i440fx_machine_9_0_options(MachineClass *m)
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
 
     pc_i440fx_machine_9_1_options(m);
-    m->alias = NULL;
-    m->is_default = false;
     m->smbios_memory_device_size = 16 * GiB;
 
     compat_props_add(m->compat_props, hw_compat_9_0, hw_compat_9_0_len);
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 9d108b194e47..67162ac88634 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -361,19 +361,28 @@ static void pc_q35_machine_options(MachineClass *m)
                      pc_q35_compat_defaults, pc_q35_compat_defaults_len);
 }
 
-static void pc_q35_machine_9_1_options(MachineClass *m)
+static void pc_q35_machine_9_2_options(MachineClass *m)
 {
     pc_q35_machine_options(m);
     m->alias = "q35";
 }
 
+DEFINE_Q35_MACHINE(9, 2);
+
+static void pc_q35_machine_9_1_options(MachineClass *m)
+{
+    pc_q35_machine_9_2_options(m);
+    m->alias = NULL;
+    compat_props_add(m->compat_props, hw_compat_9_1, hw_compat_9_1_len);
+    compat_props_add(m->compat_props, pc_compat_9_1, pc_compat_9_1_len);
+}
+
 DEFINE_Q35_MACHINE(9, 1);
 
 static void pc_q35_machine_9_0_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_machine_9_1_options(m);
-    m->alias = NULL;
     m->smbios_memory_device_size = 16 * GiB;
     compat_props_add(m->compat_props, hw_compat_9_0, hw_compat_9_0_len);
     compat_props_add(m->compat_props, pc_compat_9_0, pc_compat_9_0_len);
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index cda199af8faa..ea5c4a5a570b 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -366,10 +366,17 @@ type_init(virt_machine_register_types)
 #define DEFINE_VIRT_MACHINE(major, minor) \
     DEFINE_VIRT_MACHINE_IMPL(false, major, minor)
 
+static void virt_machine_9_2_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(9, 2)
+
 static void virt_machine_9_1_options(MachineClass *mc)
 {
+    virt_machine_9_2_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_9_1, hw_compat_9_1_len);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(9, 1)
+DEFINE_VIRT_MACHINE(9, 1)
 
 static void virt_machine_9_0_options(MachineClass *mc)
 {
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 370d7c35d3a7..8aa3ce7449be 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4837,15 +4837,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
 #define DEFINE_SPAPR_MACHINE_TAGGED(major, minor, tag) \
     DEFINE_SPAPR_MACHINE_IMPL(false, major, minor, _, tag)
 
+/*
+ * pseries-9.2
+ */
+static void spapr_machine_9_2_class_options(MachineClass *mc)
+{
+    /* Defaults for the latest behaviour inherited from the base class */
+}
+
+DEFINE_SPAPR_MACHINE_AS_LATEST(9, 2);
+
 /*
  * pseries-9.1
  */
 static void spapr_machine_9_1_class_options(MachineClass *mc)
 {
-    /* Defaults for the latest behaviour inherited from the base class */
+    spapr_machine_9_2_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_9_1, hw_compat_9_1_len);
 }
 
-DEFINE_SPAPR_MACHINE_AS_LATEST(9, 1);
+DEFINE_SPAPR_MACHINE(9, 1);
 
 /*
  * pseries-9.0
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index c483ff8064d4..18240a0fd8b4 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -871,14 +871,26 @@ static const TypeInfo ccw_machine_info = {
     DEFINE_CCW_MACHINE_IMPL(false, major, minor)
 
 
+static void ccw_machine_9_2_instance_options(MachineState *machine)
+{
+}
+
+static void ccw_machine_9_2_class_options(MachineClass *mc)
+{
+}
+DEFINE_CCW_MACHINE_AS_LATEST(9, 2);
+
 static void ccw_machine_9_1_instance_options(MachineState *machine)
 {
+    ccw_machine_9_2_instance_options(machine);
 }
 
 static void ccw_machine_9_1_class_options(MachineClass *mc)
 {
+    ccw_machine_9_2_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_9_1, hw_compat_9_1_len);
 }
-DEFINE_CCW_MACHINE_AS_LATEST(9, 1);
+DEFINE_CCW_MACHINE(9, 1);
 
 static void ccw_machine_9_0_instance_options(MachineState *machine)
 {
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 48ff6d8b93f7..9a492770cbb9 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -732,6 +732,9 @@ struct MachineState {
     } \
     type_init(machine_initfn##_register_types)
 
+extern GlobalProperty hw_compat_9_1[];
+extern const size_t hw_compat_9_1_len;
+
 extern GlobalProperty hw_compat_9_0[];
 extern const size_t hw_compat_9_0_len;
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 4e55d7ef6ea9..14ee06287da3 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -215,6 +215,9 @@ void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size);
 /* sgx.c */
 void pc_machine_init_sgx_epc(PCMachineState *pcms);
 
+extern GlobalProperty pc_compat_9_1[];
+extern const size_t pc_compat_9_1_len;
+
 extern GlobalProperty pc_compat_9_0[];
 extern const size_t pc_compat_9_0_len;
 
-- 
2.46.0

