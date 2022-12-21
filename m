Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp5139438ejb;
        Wed, 21 Dec 2022 05:04:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv7E58szauqtUaGHa4L0j6FPIqMink+knyp3v64yTPyRYkBc9884GzN5e3AsuvJbYse4I7J
X-Received: by 2002:ac8:744f:0:b0:3a6:a19e:49dc with SMTP id h15-20020ac8744f000000b003a6a19e49dcmr1641299qtr.17.1671627895224;
        Wed, 21 Dec 2022 05:04:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671627895; cv=none;
        d=google.com; s=arc-20160816;
        b=NMxqNKAhx8V+Oeoi8SpzvOpqJVjRbUm5YH/jmMOpUWJkUq9mCUzfyqRmrfN8RCmPMa
         fT6itUUIzTZmYgKQ75z0jvj5HdjDf2axgvL7ZMybSQ2QXFfvnY5GggCjJm1DRix1USTu
         tVxLPMstYURwLFam2z+cxCCX8chYtsB3PlRZXDgEWVgYxjRycU6i4qhQJ/+Zjp0NPj9P
         ecBvi/8sdGDG9N5FwO0feJCoxJrzINL3FiUhHupQeRcgIF1Ft8DVq03MSvQnQ9mVfdI9
         h2xFsd71Eam8+N24G9bOvuPv6z2hzTTwnKPRLlcJ7Cs9G0yabBUVOAVW+MTbP5LdjxtC
         q+fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=hFtm+saribtaEu5jsFUH76NwE8LEK89AXxBe5Gnf/jo=;
        b=gLPSiBHp1jz834tzNMvMfq3bMgiFvmaDrCCasNL/GK9l7XMr4Tw3nBT5xWlcQ5gAUB
         SD8UkLCl3RlMVSlKkyp/IgAh+GPLqYXKSjLq2BCXkSGB0agHu8CFgNmdITxD6JnrSiP1
         pyYLIg7xCoHyd9iVPzWd1/9Sw1ltdOWLCRK6eJSzKdoYLfMNYAZS3WpPMtlPChPY6cWR
         XeHe4jejmvcVweWwbbmhCMTXhd8GFRv4L/je4CYPBCRz2DsKxSKe8NNKni3JuFEUaoGn
         Usyoexpkqng8bmfM/pz17mSDHJzz1JD8ARhtOeOipPPJ0TDjgBBD9xIHxohaGaBpTYTQ
         2Csw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="dEtOgV/J";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gc6-20020a05622a59c600b003a80badb52fsi4505966qtb.387.2022.12.21.05.04.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Dec 2022 05:04:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="dEtOgV/J";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ym5-00044T-Qn; Wed, 21 Dec 2022 08:04:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ym3-000438-PR
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:04:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ym0-0003vz-L6
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:04:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hFtm+saribtaEu5jsFUH76NwE8LEK89AXxBe5Gnf/jo=;
 b=dEtOgV/Jg7b4yxn6QzmkBtjR3hnRjIhBuyoSldIEBQp7l1QBLlKUHQfm6MYFePmNb1bE6z
 kgIES7XqR1LngN6hI+z/NRGTfCtJOe+Tk+EmFbNi5kzwsxHfcTC2dJZ6sEsVdK4yIL2IOw
 H6ZivaJzD6ymduC1BDQ8EqDeKj4PxYM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-190-EvLiMBowOwSBRumSSD8d4A-1; Wed, 21 Dec 2022 08:04:38 -0500
X-MC-Unique: EvLiMBowOwSBRumSSD8d4A-1
Received: by mail-wm1-f72.google.com with SMTP id
 125-20020a1c0283000000b003d1d8d7f266so7911899wmc.7
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:04:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hFtm+saribtaEu5jsFUH76NwE8LEK89AXxBe5Gnf/jo=;
 b=XNG0hsg1jfEd3Ijn7xgDz5Xi2sM7Nmb/StpHzFssMt/4FH4ouE0QQYJvOkoF4FkObq
 0ceDCMrCMhhrGqk7EFd1Aee4kibSusP4KEbdmVLiUKmwoEhC1yFKhCQyOff9f9ZAPtca
 6pQJObvdef+YJnvNzUnav26nF+nbFJoPw+IK/WgHVX9ge0kFxmJ4f57NahNWQG9/0LSa
 0k8LRpqAY8mjq/EmlLXYp7KSvsoBokNktbjjyyWZU9656pADFXC8XBdLP7UsouJoOtC9
 Ew3D+6DfquCH3IG0oVDOxgEmIM7ycjG34/xINoUW41TDvcG7JEsHfDgRCjd788IDwyHz
 gnnA==
X-Gm-Message-State: AFqh2krlKPly2C2GDViArJZwbpUkmQLzJpLRuG28oBTNhQ0dOk6mgTW6
 oGfqsUcE8mHTqCPcFMtWQ3ndo/YbdUl+rzxf8abEe7JTg7saPIznbxa50svB4WApsKWllGxyP6d
 MzYqjpzjpQn6rN0S0ffAYQ6GS8Pswb9rC+MrCFZX155hSfmqCA4JR1riSCriv
X-Received: by 2002:a05:600c:687:b0:3cf:e7c8:494 with SMTP id
 a7-20020a05600c068700b003cfe7c80494mr1641018wmn.29.1671627872754; 
 Wed, 21 Dec 2022 05:04:32 -0800 (PST)
X-Received: by 2002:a05:600c:687:b0:3cf:e7c8:494 with SMTP id
 a7-20020a05600c068700b003cfe7c80494mr1640979wmn.29.1671627872470; 
 Wed, 21 Dec 2022 05:04:32 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 g16-20020a05600c4ed000b003a6125562e1sm2584977wmq.46.2022.12.21.05.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:04:31 -0800 (PST)
Date: Wed, 21 Dec 2022 08:04:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
Subject: [PULL 04/41] hw: Add compat machines for 8.0
Message-ID: <20221221130339.1234592-5-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: J3/6lD8oOctT

From: Cornelia Huck <cohuck@redhat.com>

Add 8.0 machine types for arm/i440fx/m68k/q35/s390x/spapr.

Reviewed-by: Cédric Le Goater <clg@kaod.org> [ppc]
Reviewed-by: Thomas Huth <thuth@redhat.com> [s390x]
Reviewed-by: Greg Kurz <groug@kaod.org> [ppc]
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20221212152145.124317-2-cohuck@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/boards.h        |  3 +++
 include/hw/i386/pc.h       |  3 +++
 hw/arm/virt.c              | 11 +++++++++--
 hw/core/machine.c          |  3 +++
 hw/i386/pc.c               |  3 +++
 hw/i386/pc_piix.c          | 14 +++++++++++++-
 hw/i386/pc_q35.c           | 13 ++++++++++++-
 hw/m68k/virt.c             | 11 +++++++++--
 hw/ppc/spapr.c             | 17 ++++++++++++++---
 hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
 10 files changed, 82 insertions(+), 10 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 90f1dd3aeb..d18d6d0073 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -379,6 +379,9 @@ struct MachineState {
     } \
     type_init(machine_initfn##_register_types)
 
+extern GlobalProperty hw_compat_7_2[];
+extern const size_t hw_compat_7_2_len;
+
 extern GlobalProperty hw_compat_7_1[];
 extern const size_t hw_compat_7_1_len;
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index c95333514e..991f905f5d 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -200,6 +200,9 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
 /* sgx.c */
 void pc_machine_init_sgx_epc(PCMachineState *pcms);
 
+extern GlobalProperty pc_compat_7_2[];
+extern const size_t pc_compat_7_2_len;
+
 extern GlobalProperty pc_compat_7_1[];
 extern const size_t pc_compat_7_1_len;
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 04eb6c201d..ea2413a0ba 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3218,10 +3218,17 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
-static void virt_machine_7_2_options(MachineClass *mc)
+static void virt_machine_8_0_options(MachineClass *mc)
 {
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(7, 2)
+DEFINE_VIRT_MACHINE_AS_LATEST(8, 0)
+
+static void virt_machine_7_2_options(MachineClass *mc)
+{
+    virt_machine_8_0_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_7_2, hw_compat_7_2_len);
+}
+DEFINE_VIRT_MACHINE(7, 2)
 
 static void virt_machine_7_1_options(MachineClass *mc)
 {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 644b34cd24..f589b92909 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -40,6 +40,9 @@
 #include "hw/virtio/virtio-pci.h"
 #include "qom/object_interfaces.h"
 
+GlobalProperty hw_compat_7_2[] = {};
+const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
+
 GlobalProperty hw_compat_7_1[] = {
     { "virtio-device", "queue_reset", "false" },
 };
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index fa69b6f43e..d6c1d31c28 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -107,6 +107,9 @@
     { "qemu64-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },\
     { "athlon-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },
 
+GlobalProperty pc_compat_7_2[] = {};
+const size_t pc_compat_7_2_len = G_N_ELEMENTS(pc_compat_7_2);
+
 GlobalProperty pc_compat_7_1[] = {};
 const size_t pc_compat_7_1_len = G_N_ELEMENTS(pc_compat_7_1);
 
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 0ad0ed1603..1c0a7b83b5 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -435,7 +435,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
 }
 
-static void pc_i440fx_7_2_machine_options(MachineClass *m)
+static void pc_i440fx_8_0_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_machine_options(m);
@@ -444,6 +444,18 @@ static void pc_i440fx_7_2_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_I440FX_MACHINE(v8_0, "pc-i440fx-8.0", NULL,
+                      pc_i440fx_8_0_machine_options);
+
+static void pc_i440fx_7_2_machine_options(MachineClass *m)
+{
+    pc_i440fx_8_0_machine_options(m);
+    m->alias = NULL;
+    m->is_default = false;
+    compat_props_add(m->compat_props, hw_compat_7_2, hw_compat_7_2_len);
+    compat_props_add(m->compat_props, pc_compat_7_2, pc_compat_7_2_len);
+}
+
 DEFINE_I440FX_MACHINE(v7_2, "pc-i440fx-7.2", NULL,
                       pc_i440fx_7_2_machine_options);
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index a496bd6e74..10bb49f679 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -370,7 +370,7 @@ static void pc_q35_machine_options(MachineClass *m)
     m->max_cpus = 288;
 }
 
-static void pc_q35_7_2_machine_options(MachineClass *m)
+static void pc_q35_8_0_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_machine_options(m);
@@ -378,6 +378,17 @@ static void pc_q35_7_2_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_Q35_MACHINE(v8_0, "pc-q35-8.0", NULL,
+                   pc_q35_8_0_machine_options);
+
+static void pc_q35_7_2_machine_options(MachineClass *m)
+{
+    pc_q35_8_0_machine_options(m);
+    m->alias = NULL;
+    compat_props_add(m->compat_props, hw_compat_7_2, hw_compat_7_2_len);
+    compat_props_add(m->compat_props, pc_compat_7_2, pc_compat_7_2_len);
+}
+
 DEFINE_Q35_MACHINE(v7_2, "pc-q35-7.2", NULL,
                    pc_q35_7_2_machine_options);
 
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index da5eafd275..4cb5beef1a 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -346,10 +346,17 @@ type_init(virt_machine_register_types)
     } \
     type_init(machvirt_machine_##major##_##minor##_init);
 
-static void virt_machine_7_2_options(MachineClass *mc)
+static void virt_machine_8_0_options(MachineClass *mc)
 {
 }
-DEFINE_VIRT_MACHINE(7, 2, true)
+DEFINE_VIRT_MACHINE(8, 0, true)
+
+static void virt_machine_7_2_options(MachineClass *mc)
+{
+    virt_machine_8_0_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_7_2, hw_compat_7_2_len);
+}
+DEFINE_VIRT_MACHINE(7, 2, false)
 
 static void virt_machine_7_1_options(MachineClass *mc)
 {
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index dc850032ae..f067879c06 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4734,14 +4734,25 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
     type_init(spapr_machine_register_##suffix)
 
 /*
- * pseries-7.2
+ * pseries-8.0
  */
-static void spapr_machine_7_2_class_options(MachineClass *mc)
+static void spapr_machine_8_0_class_options(MachineClass *mc)
 {
     /* Defaults for the latest behaviour inherited from the base class */
 }
 
-DEFINE_SPAPR_MACHINE(7_2, "7.2", true);
+DEFINE_SPAPR_MACHINE(8_0, "8.0", true);
+
+/*
+ * pseries-7.2
+ */
+static void spapr_machine_7_2_class_options(MachineClass *mc)
+{
+    spapr_machine_8_0_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_7_2, hw_compat_7_2_len);
+}
+
+DEFINE_SPAPR_MACHINE(7_2, "7.2", false);
 
 /*
  * pseries-7.1
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index fab79045dd..f22f61b8b6 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -823,14 +823,26 @@ bool css_migration_enabled(void)
     }                                                                         \
     type_init(ccw_machine_register_##suffix)
 
+static void ccw_machine_8_0_instance_options(MachineState *machine)
+{
+}
+
+static void ccw_machine_8_0_class_options(MachineClass *mc)
+{
+}
+DEFINE_CCW_MACHINE(8_0, "8.0", true);
+
 static void ccw_machine_7_2_instance_options(MachineState *machine)
 {
+    ccw_machine_8_0_instance_options(machine);
 }
 
 static void ccw_machine_7_2_class_options(MachineClass *mc)
 {
+    ccw_machine_8_0_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_7_2, hw_compat_7_2_len);
 }
-DEFINE_CCW_MACHINE(7_2, "7.2", true);
+DEFINE_CCW_MACHINE(7_2, "7.2", false);
 
 static void ccw_machine_7_1_instance_options(MachineState *machine)
 {
-- 
MST

