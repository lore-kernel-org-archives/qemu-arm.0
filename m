Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp2056528ejb;
        Mon, 20 Nov 2023 01:43:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4KgVnTnaNAGP08jZ2Btm6+baBo0SwiAw8et2BvexDrf0pDoVz/PNm3pG0gwt6hYwsMbTG
X-Received: by 2002:ac8:5a84:0:b0:41e:2d8e:b364 with SMTP id c4-20020ac85a84000000b0041e2d8eb364mr7831093qtc.53.1700473427277;
        Mon, 20 Nov 2023 01:43:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700473427; cv=none;
        d=google.com; s=arc-20160816;
        b=ySJXKno/wxoAUN+zIE1c/Pg9PEcRmzc/gTUmE0/a7djRlCaFkdVa5AxXL98ygIz3EG
         Fyn+tKt5IgvWnKQQlwRrAU/Csbk6UnaZNDmE+8V2C0c7vJ0ve9O1FK+t2a7xKCmvpmQ9
         OmpBNNYIUZZGXBF0bXSZk1VorW78dt+0vVUlwqur9VZ8l+28hq1xb3JlLU9h9o8ODCG7
         S7Zg/XE9pbTTGvvGfbFx2vad71lzxb084nrN+LGbJldAf8Xa60PC+wjHHJ2aFYv+oxVt
         V1oK76Xfy6VRq1bLnpPhM/Qis/ls0rGK0/d9rV8EcBe05aCr+yLKjzINOQrOCiMts65l
         24HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=4sfUYh3YqBTVXRAVqPpqdIE9g7n71Bc4A19Mi6Pn4d0=;
        fh=Fd1484SSVlWiq54nfO7+HFYDylPTmPekx9kXWwHtQ68=;
        b=fixUDHpRDZs6vZqwZgrDfUJirAaqpNPsUjkibWcxDOnuvDPQ1HAp281qrFKmwlOZ5j
         j1Px6FUihPRwfewa8e2tMPQYDpJWfm9lOsgEpQMUvcOSqH0IavnFHqNbmUoQHkGW/a5s
         nOY5J9tzxDvvXZSKgHx8oNwAzyMGyqdIINbcSRku/A69F9tWAqj7Oa9L/kwX/uKA+jff
         iJl35lJAvBVi40yz+49qV5kSfD1Ui0dn5Jp+h4/dzU0vBhzutkSpFd1NJKh3Rgl5uPcn
         YkLxc/DDBbxcTzBvDly71RcIei5SiWz/o1loYtKr2c0iZJWUb8QbTnWAm/rqaouUjk9P
         vwQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UTTMoKQW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9-20020a05622a000900b00403e963cbdcsi7054452qtw.169.2023.11.20.01.43.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 01:43:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UTTMoKQW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r50oI-0006Zp-JD; Mon, 20 Nov 2023 04:43:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1r50oH-0006Yv-32
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 04:43:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1r50oD-0001Y8-Tp
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 04:43:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700473391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4sfUYh3YqBTVXRAVqPpqdIE9g7n71Bc4A19Mi6Pn4d0=;
 b=UTTMoKQWeZ3nTNrNpCNKUMp/ST+EhWLmfMWazCLYfhJfl/qxneG21Ry5SN7Wso4T0YvHtC
 CJJPu5onIkuY5GD80duqcUExNK/EbmdfFXEl0c+x4+Z3FzGWiItZchhpJeM0NG7L6w7XMn
 R7riCkOSF08zMXLatlXNjTjCE2t+XRQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-_ybS7R7OPtyqgCRuTiOW-w-1; Mon, 20 Nov 2023 04:43:08 -0500
X-MC-Unique: _ybS7R7OPtyqgCRuTiOW-w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21E63101B045;
 Mon, 20 Nov 2023 09:43:07 +0000 (UTC)
Received: from gondolin.str.redhat.com (dhcp-192-239.str.redhat.com
 [10.33.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C46A02026D66;
 Mon, 20 Nov 2023 09:43:03 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH for-9.0] hw: Add compat machines for 9.0
Date: Mon, 20 Nov 2023 10:42:59 +0100
Message-ID: <20231120094259.1191804-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: 7+q9ABnSSpaP

Add 9.0 machine types for arm/i440fx/m68k/q35/s390x/spapr.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/arm/virt.c              |  9 ++++++++-
 hw/core/machine.c          |  3 +++
 hw/i386/pc.c               |  3 +++
 hw/i386/pc_piix.c          | 17 ++++++++++++++---
 hw/i386/pc_q35.c           | 13 ++++++++++++-
 hw/m68k/virt.c             |  9 ++++++++-
 hw/ppc/spapr.c             | 15 +++++++++++++--
 hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
 include/hw/boards.h        |  3 +++
 include/hw/i386/pc.h       |  3 +++
 10 files changed, 80 insertions(+), 9 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index be2856c018aa..efd503d45e48 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3180,10 +3180,17 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
+static void virt_machine_9_0_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(9, 0)
+
 static void virt_machine_8_2_options(MachineClass *mc)
 {
+    virt_machine_9_0_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_8_2, hw_compat_8_2_len);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(8, 2)
+DEFINE_VIRT_MACHINE(8, 2)
 
 static void virt_machine_8_1_options(MachineClass *mc)
 {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 0c1739814124..2699bcba5357 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -32,6 +32,9 @@
 #include "hw/virtio/virtio-net.h"
 #include "audio/audio.h"
 
+GlobalProperty hw_compat_8_2[] = {};
+const size_t hw_compat_8_2_len = G_N_ELEMENTS(hw_compat_8_2);
+
 GlobalProperty hw_compat_8_1[] = {
     { TYPE_PCI_BRIDGE, "x-pci-express-writeable-slt-bug", "true" },
     { "ramfb", "x-migrate", "off" },
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 29b9964733ed..496498df3a8f 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -78,6 +78,9 @@
     { "qemu64-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },\
     { "athlon-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },
 
+GlobalProperty pc_compat_8_2[] = {};
+const size_t pc_compat_8_2_len = G_N_ELEMENTS(pc_compat_8_2);
+
 GlobalProperty pc_compat_8_1[] = {};
 const size_t pc_compat_8_1_len = G_N_ELEMENTS(pc_compat_8_1);
 
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index eace8543358a..042c13cdbc33 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -545,13 +545,26 @@ static void pc_i440fx_machine_options(MachineClass *m)
                                      "Use a different south bridge than PIIX3");
 }
 
-static void pc_i440fx_8_2_machine_options(MachineClass *m)
+static void pc_i440fx_9_0_machine_options(MachineClass *m)
 {
     pc_i440fx_machine_options(m);
     m->alias = "pc";
     m->is_default = true;
 }
 
+DEFINE_I440FX_MACHINE(v9_0, "pc-i440fx-9.0", NULL,
+                      pc_i440fx_9_0_machine_options);
+
+static void pc_i440fx_8_2_machine_options(MachineClass *m)
+{
+    pc_i440fx_9_0_machine_options(m);
+    m->alias = NULL;
+    m->is_default = false;
+
+    compat_props_add(m->compat_props, hw_compat_8_2, hw_compat_8_2_len);
+    compat_props_add(m->compat_props, pc_compat_8_2, pc_compat_8_2_len);
+}
+
 DEFINE_I440FX_MACHINE(v8_2, "pc-i440fx-8.2", NULL,
                       pc_i440fx_8_2_machine_options);
 
@@ -560,8 +573,6 @@ static void pc_i440fx_8_1_machine_options(MachineClass *m)
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
 
     pc_i440fx_8_2_machine_options(m);
-    m->alias = NULL;
-    m->is_default = false;
     pcmc->broken_32bit_mem_addr_check = true;
 
     compat_props_add(m->compat_props, hw_compat_8_1, hw_compat_8_1_len);
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 4f3e5412f6b8..f43d5142b8e5 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -383,12 +383,23 @@ static void pc_q35_machine_options(MachineClass *m)
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
 }
 
-static void pc_q35_8_2_machine_options(MachineClass *m)
+static void pc_q35_9_0_machine_options(MachineClass *m)
 {
     pc_q35_machine_options(m);
     m->alias = "q35";
 }
 
+DEFINE_Q35_MACHINE(v9_0, "pc-q35-9.0", NULL,
+                   pc_q35_9_0_machine_options);
+
+static void pc_q35_8_2_machine_options(MachineClass *m)
+{
+    pc_q35_9_0_machine_options(m);
+    m->alias = NULL;
+    compat_props_add(m->compat_props, hw_compat_8_2, hw_compat_8_2_len);
+    compat_props_add(m->compat_props, pc_compat_8_2, pc_compat_8_2_len);
+}
+
 DEFINE_Q35_MACHINE(v8_2, "pc-q35-8.2", NULL,
                    pc_q35_8_2_machine_options);
 
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 2e49e262ee0e..e2792ef46d93 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -346,10 +346,17 @@ type_init(virt_machine_register_types)
     } \
     type_init(machvirt_machine_##major##_##minor##_init);
 
+static void virt_machine_9_0_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE(9, 0, true)
+
 static void virt_machine_8_2_options(MachineClass *mc)
 {
+    virt_machine_9_0_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_8_2, hw_compat_8_2_len);
 }
-DEFINE_VIRT_MACHINE(8, 2, true)
+DEFINE_VIRT_MACHINE(8, 2, false)
 
 static void virt_machine_8_1_options(MachineClass *mc)
 {
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index df09aa9d6a00..9b6c1c129f25 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4785,15 +4785,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
     }                                                                \
     type_init(spapr_machine_register_##suffix)
 
+/*
+ * pseries-9.0
+ */
+static void spapr_machine_9_0_class_options(MachineClass *mc)
+{
+    /* Defaults for the latest behaviour inherited from the base class */
+}
+
+DEFINE_SPAPR_MACHINE(9_0, "9.0", true);
+
 /*
  * pseries-8.2
  */
 static void spapr_machine_8_2_class_options(MachineClass *mc)
 {
-    /* Defaults for the latest behaviour inherited from the base class */
+    spapr_machine_9_0_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_8_2, hw_compat_8_2_len);
 }
 
-DEFINE_SPAPR_MACHINE(8_2, "8.2", true);
+DEFINE_SPAPR_MACHINE(8_2, "8.2", false);
 
 /*
  * pseries-8.1
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 7262725d2e8a..1169e20b94fe 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -855,14 +855,26 @@ bool css_migration_enabled(void)
     }                                                                         \
     type_init(ccw_machine_register_##suffix)
 
+static void ccw_machine_9_0_instance_options(MachineState *machine)
+{
+}
+
+static void ccw_machine_9_0_class_options(MachineClass *mc)
+{
+}
+DEFINE_CCW_MACHINE(9_0, "9.0", true);
+
 static void ccw_machine_8_2_instance_options(MachineState *machine)
 {
+    ccw_machine_9_0_instance_options(machine);
 }
 
 static void ccw_machine_8_2_class_options(MachineClass *mc)
 {
+    ccw_machine_9_0_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_8_2, hw_compat_8_2_len);
 }
-DEFINE_CCW_MACHINE(8_2, "8.2", true);
+DEFINE_CCW_MACHINE(8_2, "8.2", false);
 
 static void ccw_machine_8_1_instance_options(MachineState *machine)
 {
diff --git a/include/hw/boards.h b/include/hw/boards.h
index a7359992980a..bda3c91efa5b 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -419,6 +419,9 @@ struct MachineState {
     } \
     type_init(machine_initfn##_register_types)
 
+extern GlobalProperty hw_compat_8_2[];
+extern const size_t hw_compat_8_2_len;
+
 extern GlobalProperty hw_compat_8_1[];
 extern const size_t hw_compat_8_1_len;
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index a10ceeabbfac..916af29f7c0d 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -210,6 +210,9 @@ void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
 /* sgx.c */
 void pc_machine_init_sgx_epc(PCMachineState *pcms);
 
+extern GlobalProperty pc_compat_8_2[];
+extern const size_t pc_compat_8_2_len;
+
 extern GlobalProperty pc_compat_8_1[];
 extern const size_t pc_compat_8_1_len;
 
-- 
2.41.0

