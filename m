Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1041939njc;
        Mon, 9 Jun 2025 00:35:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXSJxbF7AUJzC8RudpCLT8623ZkUI7BmRpFP6ZxUCNq+nndytIudECljJMES6ytXXNxzKXDni/57e//+w==@linaro.org
X-Google-Smtp-Source: AGHT+IH48rhvBQeNU/6LxU9Qo8/+edHm5QwLoRwXyne/SGEw3NLYVte099f+RqFvYmaxQT0ii+vA
X-Received: by 2002:a05:622a:5513:b0:491:1808:f6f2 with SMTP id d75a77b69052e-4a5b9e38bbbmr178987651cf.25.1749454551193;
        Mon, 09 Jun 2025 00:35:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749454551; cv=none;
        d=google.com; s=arc-20240605;
        b=YTkB/DRgNrw3qwP2JlGJvUG9W9Qv3a59iXjrs9kKKejPKQIJn3yQ5auH58IFuEEGdW
         uJAyWA/lyRDNA94Ku/h/7XWpkRgheT1T42MKKZH93KEdkGgLoriimGo7EZkSqKP3LH1M
         TShmQRlLLvSC2awcX7KtlUG+YyAOga+2/QwdXVo3+kqUapQmcNJifFQItlXRjAasTyFf
         3HkN0fhk5hgUi/Ew8qdQHmGJ+c9gBsr9hGchLsaFya+7V4o4la1oWKAjC2rrj6a3tnL9
         VqGoBpiTsMViwDE5bjw32eWhiJ/6jQYeKGpDMEV2so/wJCauthzIg718+qfmrdR/jZvv
         kbkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TcJoGsmjuY7yApxTpK2B0BsaJ06yASgzT1eWLc2qcfM=;
        fh=HMPsRw4KhNQ4Y8Ejio1jRBaNqzyJu0yhspsxxT61Ss0=;
        b=XK0PxmgJnc8rfArAGIWcCPDalo3aKI3jSPQRmZy2HfIm3N2Fb7q0gJsu5ZanlEnHSi
         C66ZXKQ1UnCk/X+ov2L3oreZ6gB+5xqwe2OIBV7xCWGTpkyFO+vodwrpp36fYDyFnotm
         xNuMl3Dv55qdcgphOp/wTAZWdERiVTBYZVSz3crK5v2VZNOFwKzCJFpqO/kmasxVtQdn
         ZOIuvCcZErXVaMqn099x+TOJOL7NML8yAJHdjCeP8dpGzW5d2EarlKRw6QnrLdVtEJZB
         o07I0YhB9QBuXsudxnsG8D1hLRQvfl9ydT2iNwXTc8g1Rg7t1lwbABajQ4L4LRLOWj4E
         VsDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AdjgiOHp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a611169d3csi73510461cf.133.2025.06.09.00.35.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jun 2025 00:35:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AdjgiOHp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uOX2O-0008Pv-EM; Mon, 09 Jun 2025 03:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uOX1q-0008DW-1A
 for qemu-arm@nongnu.org; Mon, 09 Jun 2025 03:34:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uOX1m-0005kM-ML
 for qemu-arm@nongnu.org; Mon, 09 Jun 2025 03:34:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749454481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TcJoGsmjuY7yApxTpK2B0BsaJ06yASgzT1eWLc2qcfM=;
 b=AdjgiOHpww2jSHLxEN0pieYiaahLPiFcHSaT8qhA7c3fcuGnRggumDISI+uGxDwJRLeUmA
 lPr7wuTZs8ra2FTHR5S0IEjxS4qws06DDZtreDidgOA0IzfSVUp683VBZY3p6zVfuAzhrG
 7jPbxt3LjFME9pKtnZvak9MNacxRtQ8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-515-DY9HLvsZOzOXGo9JX2F1Sw-1; Mon,
 09 Jun 2025 03:34:39 -0400
X-MC-Unique: DY9HLvsZOzOXGo9JX2F1Sw-1
X-Mimecast-MFC-AGG-ID: DY9HLvsZOzOXGo9JX2F1Sw_1749454478
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 852B718089B7; Mon,  9 Jun 2025 07:34:38 +0000 (UTC)
Received: from virt-mtcollins-01.lab.eng.rdu2.redhat.com
 (virt-mtcollins-01.lab.eng.rdu2.redhat.com [10.8.1.196])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 051B51956087; Mon,  9 Jun 2025 07:34:36 +0000 (UTC)
From: Shaoqin Huang <shahuang@redhat.com>
To: qemu-arm@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Auger <eauger@redhat.com>,
 Shaoqin Huang <shahuang@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] ramfb: Add property to control if load the romfile
Date: Mon,  9 Jun 2025 03:34:07 -0400
Message-Id: <20250609073408.2083831-2-shahuang@redhat.com>
In-Reply-To: <20250609073408.2083831-1-shahuang@redhat.com>
References: <20250609073408.2083831-1-shahuang@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=shahuang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: gJt0UcWy06wH

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

