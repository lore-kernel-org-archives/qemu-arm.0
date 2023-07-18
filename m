Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp6425752eje;
        Tue, 18 Jul 2023 07:40:07 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEi1ArvBph/U5Fdxzs3M9H8SeSG6Xj1wlHaWsIaiIonfpIdWI3FmWOkELku437KMO2TIaQt
X-Received: by 2002:a0c:bed1:0:b0:62e:ffc3:a9cc with SMTP id f17-20020a0cbed1000000b0062effc3a9ccmr2014233qvj.58.1689691207230;
        Tue, 18 Jul 2023 07:40:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689691207; cv=none;
        d=google.com; s=arc-20160816;
        b=Wb+X4b9UMiGE4Hnb+FcUXYa1K+8yi4USEYxYN6UvBr6bv8TCkn9NchtlSzEcQXe7ik
         dtUuWHfVIhvpalan0XcSvoP1LiwTZ6jmS9xWqdoTjoH85Ahl8ypUVfds23iUpl+1em30
         ISgPke4evkd2vFVaL1nw3ojy9ZDg4CLjN/RQPez7TF5YDYbjugMHfizeBvJ07IVHC5L+
         gBbYHn3Oa1WUTO3WiUZSQuf88DGOPN0TlQ/tiMXvUguWoF7AlbbMVrFFY2X8lIvSq2Tj
         NpaLtNKrautd0YbtjF/oSvz/gpFJhieG4fzAvyc6sT+pxJdIXMOU6PUpfmNu2dByZroC
         o+Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=abFGJTXIwIE9QYA0alRYzRTQLmxnZOlRbBhjd8pHtU8=;
        fh=9C/sPABICU4DpT06v8RVYdazcCjjN4ykJU0380tEE/8=;
        b=M9Utk4urEr4DIW10BAeqPV4YlaV69g9h+8mrXF30YQuUl6giQtm5urIfAjtUbsdij0
         AuW4W+Pmj1PfkdATqJPl9fHe8fKVZi1MIL1CN7oPKdx4kN1pael+SC3F7Kn2OcNdcke8
         aeiSIUoQ2TC34mMtUyBuF26oxTkTQVdvKR3Ab81C3fauNHPfERPIzDz+g+ws9HkDLyQc
         vsIQWhZXHcXvAxNHvd3mAjIsW0KkVzWA1CSI4dbNE1o9EsBFaYTtgbsNgzBF/8hKJM9a
         Mlfcw76Hh3Y8RJu4KeOcK+RILQxDf5mPaMftN2kBDKOFFubPJyuZYVFcK4HltCnGMYDG
         pXCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HksobhmX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s26-20020a05620a031a00b007680f9a01b8si1170033qkm.223.2023.07.18.07.40.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jul 2023 07:40:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HksobhmX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qLlrg-0005b9-IR; Tue, 18 Jul 2023 10:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1qLlre-0005ae-Qx
 for qemu-arm@nongnu.org; Tue, 18 Jul 2023 10:39:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1qLlrd-0008Uk-1O
 for qemu-arm@nongnu.org; Tue, 18 Jul 2023 10:39:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689691184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=abFGJTXIwIE9QYA0alRYzRTQLmxnZOlRbBhjd8pHtU8=;
 b=HksobhmXesk1TN1od1KfssMuvkVoq6Sje+I58rLjHKSrOe+6tgB15xYZ4DerMO6dsadgpl
 S1BBYn+SGmXYNnNpNx6Byhqo3UKKQje2rXODFIwgWtSMSq3gXPLCpt/MRJFJ8Bg4VYtCNQ
 BAUqgUTAbGkmm/4etpNw8O/aKfdyBUA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-W-30pLXFMxG_4jKs7QVq-Q-1; Tue, 18 Jul 2023 10:39:33 -0400
X-MC-Unique: W-30pLXFMxG_4jKs7QVq-Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 283AC18E537A;
 Tue, 18 Jul 2023 14:22:47 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.39.193.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3732D409BE81;
 Tue, 18 Jul 2023 14:22:43 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH] hw: Add compat machines for 8.2
Date: Tue, 18 Jul 2023 16:22:35 +0200
Message-ID: <20230718142235.135319-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-TUID: au4zzdjheD2l

Add 8.2 machine types for arm/i440fx/m68k/q35/s390x/spapr.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/arm/virt.c              |  9 ++++++++-
 hw/core/machine.c          |  3 +++
 hw/i386/pc.c               |  3 +++
 hw/i386/pc_piix.c          | 16 +++++++++++++---
 hw/i386/pc_q35.c           | 14 ++++++++++++--
 hw/m68k/virt.c             |  9 ++++++++-
 hw/ppc/spapr.c             | 15 +++++++++++++--
 hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
 include/hw/boards.h        |  3 +++
 include/hw/i386/pc.h       |  3 +++
 10 files changed, 79 insertions(+), 10 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7d9dbc26633a..2a560271b5fc 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3170,10 +3170,17 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
+static void virt_machine_8_2_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(8, 2)
+
 static void virt_machine_8_1_options(MachineClass *mc)
 {
+    virt_machine_8_2_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_8_1, hw_compat_8_1_len);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(8, 1)
+DEFINE_VIRT_MACHINE(8, 1)
 
 static void virt_machine_8_0_options(MachineClass *mc)
 {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index f0d35c640184..da699cf4e147 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -39,6 +39,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
+GlobalProperty hw_compat_8_1[] = {};
+const size_t hw_compat_8_1_len = G_N_ELEMENTS(hw_compat_8_1);
+
 GlobalProperty hw_compat_8_0[] = {
     { "migration", "multifd-flush-after-each-section", "on"},
     { TYPE_PCI_DEVICE, "x-pcie-ari-nextfn-1", "on" },
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 3109d5e0e035..54838c0c411d 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -114,6 +114,9 @@
     { "qemu64-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },\
     { "athlon-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },
 
+GlobalProperty pc_compat_8_1[] = {};
+const size_t pc_compat_8_1_len = G_N_ELEMENTS(pc_compat_8_1);
+
 GlobalProperty pc_compat_8_0[] = {
     { "virtio-mem", "unplugged-inaccessible", "auto" },
 };
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index ac72e8f5bee1..ce1ac9527493 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -504,13 +504,25 @@ static void pc_i440fx_machine_options(MachineClass *m)
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
 }
 
-static void pc_i440fx_8_1_machine_options(MachineClass *m)
+static void pc_i440fx_8_2_machine_options(MachineClass *m)
 {
     pc_i440fx_machine_options(m);
     m->alias = "pc";
     m->is_default = true;
 }
 
+DEFINE_I440FX_MACHINE(v8_2, "pc-i440fx-8.2", NULL,
+                      pc_i440fx_8_2_machine_options);
+
+static void pc_i440fx_8_1_machine_options(MachineClass *m)
+{
+    pc_i440fx_8_2_machine_options(m);
+    m->alias = NULL;
+    m->is_default = false;
+    compat_props_add(m->compat_props, hw_compat_8_1, hw_compat_8_1_len);
+    compat_props_add(m->compat_props, pc_compat_8_1, pc_compat_8_1_len);
+}
+
 DEFINE_I440FX_MACHINE(v8_1, "pc-i440fx-8.1", NULL,
                       pc_i440fx_8_1_machine_options);
 
@@ -519,8 +531,6 @@ static void pc_i440fx_8_0_machine_options(MachineClass *m)
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
 
     pc_i440fx_8_1_machine_options(m);
-    m->alias = NULL;
-    m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_8_0, hw_compat_8_0_len);
     compat_props_add(m->compat_props, pc_compat_8_0, pc_compat_8_0_len);
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index dc27a9e223a2..37c4814bedf2 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -379,12 +379,23 @@ static void pc_q35_machine_options(MachineClass *m)
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
 }
 
-static void pc_q35_8_1_machine_options(MachineClass *m)
+static void pc_q35_8_2_machine_options(MachineClass *m)
 {
     pc_q35_machine_options(m);
     m->alias = "q35";
 }
 
+DEFINE_Q35_MACHINE(v8_2, "pc-q35-8.2", NULL,
+                   pc_q35_8_2_machine_options);
+
+static void pc_q35_8_1_machine_options(MachineClass *m)
+{
+    pc_q35_8_2_machine_options(m);
+    m->alias = NULL;
+    compat_props_add(m->compat_props, hw_compat_8_1, hw_compat_8_1_len);
+    compat_props_add(m->compat_props, pc_compat_8_1, pc_compat_8_1_len);
+}
+
 DEFINE_Q35_MACHINE(v8_1, "pc-q35-8.1", NULL,
                    pc_q35_8_1_machine_options);
 
@@ -393,7 +404,6 @@ static void pc_q35_8_0_machine_options(MachineClass *m)
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
 
     pc_q35_8_1_machine_options(m);
-    m->alias = NULL;
     compat_props_add(m->compat_props, hw_compat_8_0, hw_compat_8_0_len);
     compat_props_add(m->compat_props, pc_compat_8_0, pc_compat_8_0_len);
 
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 731205b215b2..a0813f75c060 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -347,10 +347,17 @@ type_init(virt_machine_register_types)
     } \
     type_init(machvirt_machine_##major##_##minor##_init);
 
+static void virt_machine_8_2_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE(8, 2, true)
+
 static void virt_machine_8_1_options(MachineClass *mc)
 {
+    virt_machine_8_2_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_8_1, hw_compat_8_1_len);
 }
-DEFINE_VIRT_MACHINE(8, 1, true)
+DEFINE_VIRT_MACHINE(8, 1, false)
 
 static void virt_machine_8_0_options(MachineClass *mc)
 {
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 1c8b8d57a70a..622fea825605 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4752,15 +4752,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
     }                                                                \
     type_init(spapr_machine_register_##suffix)
 
+/*
+ * pseries-8.2
+ */
+static void spapr_machine_8_2_class_options(MachineClass *mc)
+{
+    /* Defaults for the latest behaviour inherited from the base class */
+}
+
+DEFINE_SPAPR_MACHINE(8_2, "8.2", true);
+
 /*
  * pseries-8.1
  */
 static void spapr_machine_8_1_class_options(MachineClass *mc)
 {
-    /* Defaults for the latest behaviour inherited from the base class */
+    spapr_machine_8_2_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_8_1, hw_compat_8_1_len);
 }
 
-DEFINE_SPAPR_MACHINE(8_1, "8.1", true);
+DEFINE_SPAPR_MACHINE(8_1, "8.1", false);
 
 /*
  * pseries-8.0
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 4516d73ff5fc..c52a1fcf6700 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -828,14 +828,26 @@ bool css_migration_enabled(void)
     }                                                                         \
     type_init(ccw_machine_register_##suffix)
 
+static void ccw_machine_8_2_instance_options(MachineState *machine)
+{
+}
+
+static void ccw_machine_8_2_class_options(MachineClass *mc)
+{
+}
+DEFINE_CCW_MACHINE(8_2, "8.2", true);
+
 static void ccw_machine_8_1_instance_options(MachineState *machine)
 {
+    ccw_machine_8_2_instance_options(machine);
 }
 
 static void ccw_machine_8_1_class_options(MachineClass *mc)
 {
+    ccw_machine_8_2_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_8_1, hw_compat_8_1_len);
 }
-DEFINE_CCW_MACHINE(8_1, "8.1", true);
+DEFINE_CCW_MACHINE(8_1, "8.1", false);
 
 static void ccw_machine_8_0_instance_options(MachineState *machine)
 {
diff --git a/include/hw/boards.h b/include/hw/boards.h
index ed8336019801..3b541ffd2472 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -390,6 +390,9 @@ struct MachineState {
     } \
     type_init(machine_initfn##_register_types)
 
+extern GlobalProperty hw_compat_8_1[];
+extern const size_t hw_compat_8_1_len;
+
 extern GlobalProperty hw_compat_8_0[];
 extern const size_t hw_compat_8_0_len;
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index d54e8b1101e4..0fabece236cf 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -200,6 +200,9 @@ void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
 /* sgx.c */
 void pc_machine_init_sgx_epc(PCMachineState *pcms);
 
+extern GlobalProperty pc_compat_8_1[];
+extern const size_t pc_compat_8_1_len;
+
 extern GlobalProperty pc_compat_8_0[];
 extern const size_t pc_compat_8_0_len;
 
-- 
2.41.0

