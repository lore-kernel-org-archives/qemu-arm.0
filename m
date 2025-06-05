Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp4501878njh;
        Wed, 4 Jun 2025 20:07:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXMPjryOLu8e+CgvLIKdcN1mGusTgnN+INY0ma+8WbKE5aRtlBrAuuTvts3dHIFFut6TxVMKmJNbNCfVA==@linaro.org
X-Google-Smtp-Source: AGHT+IFZzN+vG2DgTRMSHzx/xu4tg+8SfuigHvr7M7xiKo05jsMnQdaie5y0zBqhse9qCboDx8B5
X-Received: by 2002:a05:622a:1b22:b0:4a4:41c0:b256 with SMTP id d75a77b69052e-4a5a5806c0amr93419761cf.11.1749092844971;
        Wed, 04 Jun 2025 20:07:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749092844; cv=none;
        d=google.com; s=arc-20240605;
        b=Fq3GcwdgVhlaKn1u75VccIzw6B5nKPWwAlozr8EMWxKiKbUge4UHY6gfDYXhJFcRIk
         +oH4AIFkKbDDT/bwqArRdA1ak+parIeoCA3NWBaz81XFgxjYoaYoWyUxxX1Jb0MHj/r2
         TUac+UU+jorY+cfPJHdVh58UQw23BTEi+tU3yUEk9Jn+7rigm9yuFw9d+w2yghJBq6ap
         eSWsK6wrtdDA8MZHJ0tGi7Dir8dzT6fo/YEMPsbFtVBEh2SsAV96OKSojgva4s6wemOr
         9Dl4vjwQ2lBRybGsxNa4Nd6EQ8UD5tTFEgPDohTMnjGPJUHx2lJ+Wu5EfZGlkbIrfrNk
         TpYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=CQ6CaHOIvSVXqKfZ75w5fVWGcjD6yjEH0bz8R+yGGXc=;
        fh=HLSIHnrnX9KoFZTWemcUGdr3VIefJD10Y6cjfatKJvE=;
        b=MhMxT/yFtceH0OaNSJwTRImrGmDgq91hGIpG7sbmpVojPE160GsmDI53zjtBDA8f3t
         3CDbGOObMcrAYMwR9vKVwJVdBBH17Vd5VwPVcDC+7f4Kby7p/eIASUAzBzX7ZQyE75di
         4V8PXd8ZwO9FfZCfyG969RSYE6YjKkkQwi7y343U3/OVwKaGOOHZJcQb7nSotdpmeVGT
         gqafWWIyWv6idzEJ3itMPfQt/yW8/wV6KjZcjTTVdVI0y24z/jCDhuZc71y/3EiE2Mb+
         +m2IFIzsJBy65+dmFPZH43JlqHKskjwTtxpKdfwtpemFVpG6J4z77VYXfRWvqQQs0n8C
         23vg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FROviaUX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a435a9c18bsi164419151cf.621.2025.06.04.20.07.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Jun 2025 20:07:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FROviaUX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uN0wf-0007la-8G; Wed, 04 Jun 2025 23:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uN0wd-0007l4-2P
 for qemu-arm@nongnu.org; Wed, 04 Jun 2025 23:07:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uN0wa-000629-Ti
 for qemu-arm@nongnu.org; Wed, 04 Jun 2025 23:07:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749092823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=CQ6CaHOIvSVXqKfZ75w5fVWGcjD6yjEH0bz8R+yGGXc=;
 b=FROviaUXd85wkchbn0/J/z7FTujUlyLKqkMBX5NkRafl5l3z5pevizMPDP/eUTZIlQSJAA
 P6zl1KlV5PZSk/J6nHjCy4JcSCquv53bK7qYhI8IW4Xw6oN0WfY+cQAOp5k73Q20/f07cz
 jrjg1+a98CuqbCap0SVXG9+XeYAgI98=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-9-tn_opOLSO8edff2BH7IY-g-1; Wed,
 04 Jun 2025 23:05:46 -0400
X-MC-Unique: tn_opOLSO8edff2BH7IY-g-1
X-Mimecast-MFC-AGG-ID: tn_opOLSO8edff2BH7IY-g_1749092745
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D9DB51956089; Thu,  5 Jun 2025 03:05:44 +0000 (UTC)
Received: from virt-mtcollins-01.lab.eng.rdu2.redhat.com
 (virt-mtcollins-01.lab.eng.rdu2.redhat.com [10.8.1.196])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 995DB1954185; Thu,  5 Jun 2025 03:05:42 +0000 (UTC)
From: Shaoqin Huang <shahuang@redhat.com>
To: qemu-arm@nongnu.org
Cc: Eric Auger <eauger@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shaoqin Huang <shahuang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v1] ramfb: Add property to control if load the romfile
Date: Wed,  4 Jun 2025 23:03:51 -0400
Message-Id: <20250605030351.2056571-1-shahuang@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124; envelope-from=shahuang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.128,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: dtNwi2qiOWQl

Now the ramfb will load the vgabios-ramfb.bin unconditionally, but only
the x86 need the vgabios-ramfb.bin, this can cause that when use the
release package on arm64 it can't find the vgabios-ramfb.bin.

So add a new property ramfb-romfile in both ramfb and vfio_pci device,
because the vfio display also use the ramfb_setup() to load the
vgabios-ramfb.bin file.

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
index 1be106b57f..2b96a49baa 100644
--- a/hw/display/ramfb-standalone.c
+++ b/hw/display/ramfb-standalone.c
@@ -17,6 +17,7 @@ struct RAMFBStandaloneState {
     QemuConsole *con;
     RAMFBState *state;
     bool migrate;
+    bool ramfb_romfile;
 };
 
 static void display_update_wrapper(void *dev)
@@ -39,7 +40,7 @@ static void ramfb_realizefn(DeviceState *dev, Error **errp)
     RAMFBStandaloneState *ramfb = RAMFB(dev);
 
     ramfb->con = graphic_console_init(dev, 0, &wrapper_ops, dev);
-    ramfb->state = ramfb_setup(errp);
+    ramfb->state = ramfb_setup(ramfb->ramfb_romfile, errp);
 }
 
 static bool migrate_needed(void *opaque)
@@ -62,6 +63,7 @@ static const VMStateDescription ramfb_dev_vmstate = {
 
 static const Property ramfb_properties[] = {
     DEFINE_PROP_BOOL("x-migrate", RAMFBStandaloneState, migrate,  true),
+    DEFINE_PROP_BOOL("ramfb-romfile", RAMFBStandaloneState, ramfb_romfile, true),
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
index ea87830fe0..56f10564f9 100644
--- a/hw/vfio/display.c
+++ b/hw/vfio/display.c
@@ -365,7 +365,7 @@ static bool vfio_display_dmabuf_init(VFIOPCIDevice *vdev, Error **errp)
                                           &vfio_display_dmabuf_ops,
                                           vdev);
     if (vdev->enable_ramfb) {
-        vdev->dpy->ramfb = ramfb_setup(errp);
+        vdev->dpy->ramfb = ramfb_setup(vdev->ramfb_romfile, errp);
         if (!vdev->dpy->ramfb) {
             return false;
         }
@@ -494,7 +494,7 @@ static bool vfio_display_region_init(VFIOPCIDevice *vdev, Error **errp)
                                           &vfio_display_region_ops,
                                           vdev);
     if (vdev->enable_ramfb) {
-        vdev->dpy->ramfb = ramfb_setup(errp);
+        vdev->dpy->ramfb = ramfb_setup(vdev->ramfb_romfile, errp);
         if (!vdev->dpy->ramfb) {
             return false;
         }
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 7f1532fbed..bfdf365978 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3564,6 +3564,7 @@ static const TypeInfo vfio_pci_dev_info = {
 
 static const Property vfio_pci_dev_nohotplug_properties[] = {
     DEFINE_PROP_BOOL("ramfb", VFIOPCIDevice, enable_ramfb, false),
+    DEFINE_PROP_BOOL("ramfb-romfile", VFIOPCIDevice, ramfb_romfile, true),
     DEFINE_PROP_ON_OFF_AUTO("x-ramfb-migrate", VFIOPCIDevice, ramfb_migrate,
                             ON_OFF_AUTO_AUTO),
 };
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index d94ecaba68..d567de8f10 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -177,6 +177,7 @@ struct VFIOPCIDevice {
     bool no_kvm_ioeventfd;
     bool no_vfio_ioeventfd;
     bool enable_ramfb;
+    bool ramfb_romfile;
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

