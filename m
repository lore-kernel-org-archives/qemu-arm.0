Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2252888njc;
        Mon, 16 Jun 2025 20:06:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXYbt70fCDP0EAIrymzr3wDD/0Z5G0ZKDbJfFDNuwODLIYFtG3uweQCfSWx44L49gcnZWTyNx5XmA2CkA==@linaro.org
X-Google-Smtp-Source: AGHT+IEZJPh7C1nCyr/uRv06oarfZePvpBcv9ED9w54I/GmcySZMca/RMrlAEDKnVqwf+j5KXonX
X-Received: by 2002:ad4:5aa8:0:b0:6fa:c0f8:4dff with SMTP id 6a1803df08f44-6fb4777c238mr184090696d6.37.1750129583049;
        Mon, 16 Jun 2025 20:06:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750129583; cv=none;
        d=google.com; s=arc-20240605;
        b=TM5E3S98SoM6KxPR4Ne73wuLLA0X/MtDl+Y7KncNCv2beRiJNCX+NFXGL5PMmMi2UH
         vrdrouqHDLVe4JhrhkAko1fPY5ikFy5Uz4U60m3wftFvo5WE7JyhLdBcfCW6t748dqQB
         Tp+rQ667bg4xRPNpq4easdlz1Gvmz81+L7AWx5GH5PAkstJ72+hi38fKCcjIUvo/D3su
         HiMVyIfpoB3K1QG7KgV+wWMW0bjPJkg69Fqdd2BPd18aigagnpzzOUQJeIBVhpT0bduM
         gyN2B0s3FWCKYbEiQn9k5/31aMkIxct+2Eb1csws+kNNu8lOGTQBoqu1w1vSJ8PfDjJN
         VRHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TcJoGsmjuY7yApxTpK2B0BsaJ06yASgzT1eWLc2qcfM=;
        fh=HMPsRw4KhNQ4Y8Ejio1jRBaNqzyJu0yhspsxxT61Ss0=;
        b=EQpoiD9vf27WYbnviaoKJaYM7IKXzMcORe99yo2xHHPiGfZB+KKacmA0gotDIAlomD
         e3GWqy0Lu6AvIWgFyziRy/u+WIfFuypp1CT+zi1HNYZAV0I2HdHt5KmNyaJIO1Xy2O52
         s4rcTv8Mnqr6QEgrp3QXAneYH7GlZI/4qzh89mT8aPeCAwBLaOoBLnMYPmKGllsAh0Us
         oTJ9PHtA0rZMnoU4k/VJnChU7ZLu5CdM2ZlGNYRU+/Yu3iK6eLKR9S19LsVOmCinXA60
         tU6n+PfSxTxMw13p+Adg5OYvkJPW2lQATmtjzMHeB5odjz6jGlgWtagjyb7sRVuxxCmX
         eGRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="T/VQCdHg";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb527a3ec0si51397116d6.42.2025.06.16.20.06.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jun 2025 20:06:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="T/VQCdHg";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uRMdn-00051b-Lb; Mon, 16 Jun 2025 23:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uRMdl-00050C-BE
 for qemu-devel@nongnu.org; Mon, 16 Jun 2025 23:05:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uRMdi-0004as-NZ
 for qemu-devel@nongnu.org; Mon, 16 Jun 2025 23:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750129533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TcJoGsmjuY7yApxTpK2B0BsaJ06yASgzT1eWLc2qcfM=;
 b=T/VQCdHg1npkSr//85Io9XNMpgDCNhgVSCtJU1ZUH1ymvuzslpsKC5UbINPCNUAkgwZXcg
 1llAVmcZ4fcnWXw8dRcozCF6BAY87F5O35S63gesvTRqS7etuoRiBqCUHK/j3xzNiwHP+V
 C9/dDPxeeVYcqMG9FcjQgrxjVpJiq3U=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-223-CrkfuWhxM9CiFSeFE__5DQ-1; Mon,
 16 Jun 2025 23:05:30 -0400
X-MC-Unique: CrkfuWhxM9CiFSeFE__5DQ-1
X-Mimecast-MFC-AGG-ID: CrkfuWhxM9CiFSeFE__5DQ_1750129529
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 240841800297; Tue, 17 Jun 2025 03:05:29 +0000 (UTC)
Received: from virt-mtcollins-01.lab.eng.rdu2.redhat.com
 (virt-mtcollins-01.lab.eng.rdu2.redhat.com [10.8.1.196])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C25F819560A3; Tue, 17 Jun 2025 03:05:27 +0000 (UTC)
From: Shaoqin Huang <shahuang@redhat.com>
To: qemu-arm@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Auger <eauger@redhat.com>,
 Shaoqin Huang <shahuang@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v4 1/2] ramfb: Add property to control if load the romfile
Date: Mon, 16 Jun 2025 23:05:20 -0400
Message-Id: <20250617030521.2109305-2-shahuang@redhat.com>
In-Reply-To: <20250617030521.2109305-1-shahuang@redhat.com>
References: <20250617030521.2109305-1-shahuang@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=shahuang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.892,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: P6pZI0qaWfAl

Now the ramfb will load the vgabios-ramfb.bin unconditionally, but only
the x86 need the vgabios-ramfb.bin, this can cause that when use the
release package on arm64 it can't find the vgabios-ramfb.bin.

Because only seabios will use the vgabios-ramfb.bin, load the rom logic
is x86-specific. For other !x86 platforms, the edk2 ships an EFI driver
for ramfb, so they don't need to load the romfile.

So add a new property use_legacy_x86_rom in both ramfb and vfio_pci
device, because the vfio display also use the ramfb_setup() to load
the vgabios-ramfb.bin file.

After have this property, the machine type can set the compatibility to
not load the vgabios-ramfb.bin if the arch doesn't need it.

Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
---
 hw/display/ramfb-standalone.c | 4 +++-
 hw/display/ramfb-stubs.c      | 2 +-
 hw/display/ramfb.c            | 6 ++++--
 hw/vfio/display.c             | 4 ++--
 hw/vfio/pci.c                 | 1 +
 hw/vfio/pci.h                 | 1 +
 include/hw/display/ramfb.h    | 2 +-
 7 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/hw/display/ramfb-standalone.c b/hw/display/ramfb-standalone.c
index 1be106b57f..af1175bf96 100644
--- a/hw/display/ramfb-standalone.c
+++ b/hw/display/ramfb-standalone.c
@@ -17,6 +17,7 @@ struct RAMFBStandaloneState {
     QemuConsole *con;
     RAMFBState *state;
     bool migrate;
+    bool use_legacy_x86_rom;
 };
 
 static void display_update_wrapper(void *dev)
@@ -39,7 +40,7 @@ static void ramfb_realizefn(DeviceState *dev, Error **errp)
     RAMFBStandaloneState *ramfb = RAMFB(dev);
 
     ramfb->con = graphic_console_init(dev, 0, &wrapper_ops, dev);
-    ramfb->state = ramfb_setup(errp);
+    ramfb->state = ramfb_setup(ramfb->use_legacy_x86_rom, errp);
 }
 
 static bool migrate_needed(void *opaque)
@@ -62,6 +63,7 @@ static const VMStateDescription ramfb_dev_vmstate = {
 
 static const Property ramfb_properties[] = {
     DEFINE_PROP_BOOL("x-migrate", RAMFBStandaloneState, migrate,  true),
+    DEFINE_PROP_BOOL("use-legacy-x86-rom", RAMFBStandaloneState, use_legacy_x86_rom, true),
 };
 
 static void ramfb_class_initfn(ObjectClass *klass, void *data)
diff --git a/hw/display/ramfb-stubs.c b/hw/display/ramfb-stubs.c
index cf64733b10..b83551357b 100644
--- a/hw/display/ramfb-stubs.c
+++ b/hw/display/ramfb-stubs.c
@@ -8,7 +8,7 @@ void ramfb_display_update(QemuConsole *con, RAMFBState *s)
 {
 }
 
-RAMFBState *ramfb_setup(Error **errp)
+RAMFBState *ramfb_setup(bool romfile, Error **errp)
 {
     error_setg(errp, "ramfb support not available");
     return NULL;
diff --git a/hw/display/ramfb.c b/hw/display/ramfb.c
index 8c0f907673..9a17d97d07 100644
--- a/hw/display/ramfb.c
+++ b/hw/display/ramfb.c
@@ -135,7 +135,7 @@ const VMStateDescription ramfb_vmstate = {
     }
 };
 
-RAMFBState *ramfb_setup(Error **errp)
+RAMFBState *ramfb_setup(bool romfile, Error **errp)
 {
     FWCfgState *fw_cfg = fw_cfg_find();
     RAMFBState *s;
@@ -147,7 +147,9 @@ RAMFBState *ramfb_setup(Error **errp)
 
     s = g_new0(RAMFBState, 1);
 
-    rom_add_vga("vgabios-ramfb.bin");
+    if (romfile) {
+        rom_add_vga("vgabios-ramfb.bin");
+    }
     fw_cfg_add_file_callback(fw_cfg, "etc/ramfb",
                              NULL, ramfb_fw_cfg_write, s,
                              &s->cfg, sizeof(s->cfg), false);
diff --git a/hw/vfio/display.c b/hw/vfio/display.c
index ea87830fe0..8bfd8eb1e3 100644
--- a/hw/vfio/display.c
+++ b/hw/vfio/display.c
@@ -365,7 +365,7 @@ static bool vfio_display_dmabuf_init(VFIOPCIDevice *vdev, Error **errp)
                                           &vfio_display_dmabuf_ops,
                                           vdev);
     if (vdev->enable_ramfb) {
-        vdev->dpy->ramfb = ramfb_setup(errp);
+        vdev->dpy->ramfb = ramfb_setup(vdev->use_legacy_x86_rom, errp);
         if (!vdev->dpy->ramfb) {
             return false;
         }
@@ -494,7 +494,7 @@ static bool vfio_display_region_init(VFIOPCIDevice *vdev, Error **errp)
                                           &vfio_display_region_ops,
                                           vdev);
     if (vdev->enable_ramfb) {
-        vdev->dpy->ramfb = ramfb_setup(errp);
+        vdev->dpy->ramfb = ramfb_setup(vdev->use_legacy_x86_rom, errp);
         if (!vdev->dpy->ramfb) {
             return false;
         }
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 7f1532fbed..ff0d93fae0 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3564,6 +3564,7 @@ static const TypeInfo vfio_pci_dev_info = {
 
 static const Property vfio_pci_dev_nohotplug_properties[] = {
     DEFINE_PROP_BOOL("ramfb", VFIOPCIDevice, enable_ramfb, false),
+    DEFINE_PROP_BOOL("use-legacy-x86-rom", VFIOPCIDevice, use_legacy_x86_rom, true),
     DEFINE_PROP_ON_OFF_AUTO("x-ramfb-migrate", VFIOPCIDevice, ramfb_migrate,
                             ON_OFF_AUTO_AUTO),
 };
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index d94ecaba68..713956157e 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -177,6 +177,7 @@ struct VFIOPCIDevice {
     bool no_kvm_ioeventfd;
     bool no_vfio_ioeventfd;
     bool enable_ramfb;
+    bool use_legacy_x86_rom;
     OnOffAuto ramfb_migrate;
     bool defer_kvm_irq_routing;
     bool clear_parent_atomics_on_exit;
diff --git a/include/hw/display/ramfb.h b/include/hw/display/ramfb.h
index a7e0019144..172aa6dc89 100644
--- a/include/hw/display/ramfb.h
+++ b/include/hw/display/ramfb.h
@@ -6,7 +6,7 @@
 /* ramfb.c */
 typedef struct RAMFBState RAMFBState;
 void ramfb_display_update(QemuConsole *con, RAMFBState *s);
-RAMFBState *ramfb_setup(Error **errp);
+RAMFBState *ramfb_setup(bool romfile, Error **errp);
 
 extern const VMStateDescription ramfb_vmstate;
 
-- 
2.40.1

