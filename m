Received: by 2002:a19:8587:0:0:0:0:0 with SMTP id h129csp3405lfd;
        Wed, 2 Sep 2020 15:53:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcrsH2/NDRAaNNkHegtPGM6yBYB+/j0Phea6DyXWxSUHwKVAct1hVB81YCoSR13ohs0fSj
X-Received: by 2002:a25:6885:: with SMTP id d127mr12916909ybc.27.1599087208899;
        Wed, 02 Sep 2020 15:53:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599087208; cv=none;
        d=google.com; s=arc-20160816;
        b=xS50Hq6eOreeFOPjLrTDLM2Zf2mjYUmC4q4uNVCDjGNSmtRG/E1we5zqk0ijPdL4nz
         i/C1gUw8T75VvMi+wFFsIffVEfrp47PiQPMYASmX36YYC4uNz68RP1eJq6xxYZ0fFShm
         x9GZlRgN/YrMCNrxg7KazVs9b5K9SPHAG/cyNh6t70qHspWIZZ+RHp0PX+oXb9Y3lvEa
         KMGnFLvOciGjADAY7L3HACpZYskRYvsqewXvQseAH7+5rfnQPMeWeXVj2KMQs8fgWPMP
         GUwD8NvcbtimsWtW5FMopjRw3iJJ9apwSEsPChSReu3r4Bj1Wy0cGnYuVq3aY+lth/MU
         dfQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2timywTLyViFpE3A6e1YsrsQIxAx0L1qUWJsoBnIaW4=;
        b=Wz3YjMkKpihPD79kbdLH+TME/eurEzH1fKktXWxG24nOPtjS9ZNigIg5cbyhaczF69
         /WcUnZGud8QDia+5ZViLEYDQp/Mg1JOAX7kvgwWSUvztUz2tRW3Vv/npo0G6/qRzApuS
         5d7cWM1RrlQ3So9IBUoVDluayDQL5lCGspGCU7mo606Q7nUgy7T8aar4uO+6lmE+P9CJ
         b3f6RbsjH7kvOHuhN3u7W8C4ko05G6Ez3QDqf+j2ZdZ5DegUdI28SUTDv+uSaa6dImBH
         MnVoKCkhfDteUo2iaonISxL0QXL8qA7ryXO4RRVn5tw3Y9JnZnnSZluER5UXh7+UaZIF
         kImA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fiprUwfV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j3si969773ybh.200.2020.09.02.15.53.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Sep 2020 15:53:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fiprUwfV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDbd5-0004HI-2q
	for alex.bennee@linaro.org; Wed, 02 Sep 2020 18:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbUa-0003EN-AX
 for qemu-arm@nongnu.org; Wed, 02 Sep 2020 18:44:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbUY-0008P3-A1
 for qemu-arm@nongnu.org; Wed, 02 Sep 2020 18:44:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599086673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2timywTLyViFpE3A6e1YsrsQIxAx0L1qUWJsoBnIaW4=;
 b=fiprUwfViqekaHPDkyhx7vGqIV+he/xsz8wXUDBMykAMxmLjoR8EH2NKARWvUnD3yCy0d/
 K8OEne69g3auQQwceUt7sDd6fkpM0IhNCUn5lzuHuS3XhOFM/Eue1Z87vvNhTNzoDYWKp8
 R8JSkQGSaNP19lGLdNPYDqDrPmiZQSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-yDu-LXBmMOGuLv4FfxIJ2g-1; Wed, 02 Sep 2020 18:44:32 -0400
X-MC-Unique: yDu-LXBmMOGuLv4FfxIJ2g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBD5F1DE00;
 Wed,  2 Sep 2020 22:44:30 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F37751002D40;
 Wed,  2 Sep 2020 22:44:24 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/63] ramfb: Rename TYPE_RAMFB_DEVICE to TYPE_RAMFB
Date: Wed,  2 Sep 2020 18:42:31 -0400
Message-Id: <20200902224311.1321159-24-ehabkost@redhat.com>
In-Reply-To: <20200902224311.1321159-1-ehabkost@redhat.com>
References: <20200902224311.1321159-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 17:54:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MzM1DvOTMxZR

This will make the type name constant consistent with the name of
the type checking macro.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 include/hw/display/ramfb.h    | 2 +-
 hw/arm/sysbus-fdt.c           | 2 +-
 hw/arm/virt.c                 | 2 +-
 hw/display/ramfb-standalone.c | 4 ++--
 hw/i386/pc_piix.c             | 2 +-
 hw/i386/pc_q35.c              | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/hw/display/ramfb.h b/include/hw/display/ramfb.h
index b33a2c467b..c4b0150c88 100644
--- a/include/hw/display/ramfb.h
+++ b/include/hw/display/ramfb.h
@@ -7,6 +7,6 @@ void ramfb_display_update(QemuConsole *con, RAMFBState *s);
 RAMFBState *ramfb_setup(Error **errp);
 
 /* ramfb-standalone.c */
-#define TYPE_RAMFB_DEVICE "ramfb"
+#define TYPE_RAMFB "ramfb"
 
 #endif /* RAMFB_H */
diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index 6b6906f4cf..e8baa118a6 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -489,7 +489,7 @@ static const BindingEntry bindings[] = {
     VFIO_PLATFORM_BINDING("amd,xgbe-seattle-v1a", add_amd_xgbe_fdt_node),
 #endif
     TYPE_BINDING(TYPE_TPM_TIS_SYSBUS, add_tpm_tis_fdt_node),
-    TYPE_BINDING(TYPE_RAMFB_DEVICE, no_fdt_node),
+    TYPE_BINDING(TYPE_RAMFB, no_fdt_node),
     TYPE_BINDING("", NULL), /* last element */
 };
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index acf9bfbece..bf81b5a373 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2414,7 +2414,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = 512;
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_CALXEDA_XGMAC);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
-    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
     mc->block_default_type = IF_VIRTIO;
diff --git a/hw/display/ramfb-standalone.c b/hw/display/ramfb-standalone.c
index 8c0094397f..a86730393b 100644
--- a/hw/display/ramfb-standalone.c
+++ b/hw/display/ramfb-standalone.c
@@ -9,7 +9,7 @@
 
 typedef struct RAMFBStandaloneState RAMFBStandaloneState;
 DECLARE_INSTANCE_CHECKER(RAMFBStandaloneState, RAMFB,
-                         TYPE_RAMFB_DEVICE)
+                         TYPE_RAMFB)
 
 struct RAMFBStandaloneState {
     SysBusDevice parent_obj;
@@ -51,7 +51,7 @@ static void ramfb_class_initfn(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo ramfb_info = {
-    .name          = TYPE_RAMFB_DEVICE,
+    .name          = TYPE_RAMFB,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(RAMFBStandaloneState),
     .class_init    = ramfb_class_initfn,
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 32b1453e6a..7ac4e65820 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -422,7 +422,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
     m->desc = "Standard PC (i440FX + PIIX, 1996)";
     m->default_machine_opts = "firmware=bios-256k.bin";
     m->default_display = "std";
-    machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
+    machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB);
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
 }
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 0cb9c18cd4..dd2223b659 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -348,7 +348,7 @@ static void pc_q35_machine_options(MachineClass *m)
     m->no_floppy = 1;
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_AMD_IOMMU_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_INTEL_IOMMU_DEVICE);
-    machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
+    machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB);
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
     m->max_cpus = 288;
 }
-- 
2.26.2

