Received: by 2002:a17:505:7d82:b0:1be9:327d:8ee3 with SMTP id wv2csp399812njc;
        Wed, 13 Nov 2024 06:26:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX06ps7DzeKVlIuJ2eZ6gy9WcODx7ILw9MrzHzUjOsctj/3MabRojeLdzdDjnxDn1SLuitLkSg+twEvfw==@linaro.org
X-Google-Smtp-Source: AGHT+IEYp16ERxyMkFFmL0Du6CiPRut2Eyl+4GD+W4B+xcBYsCdxIrAIQFgE3dMh3HjS9w0ySnUd
X-Received: by 2002:a05:622a:1990:b0:460:ae0f:4707 with SMTP id d75a77b69052e-4630942c0d6mr311118801cf.45.1731507993117;
        Wed, 13 Nov 2024 06:26:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731507993; cv=none;
        d=google.com; s=arc-20240605;
        b=ZCd2kqmgwG6q0pNPCYnlV1vPeW73RnJBvtMeVXN4206qsxGh5O//XcXiKQegwzDnBI
         h1ipxdTJpb++7CXVYNtAUxwXKWMgpe3txwUNGV4Zp8Btb2N203QHusRgPvR58k+atuqE
         TV/hsGo089SGwAKnLKSKeE7vrith+UZFT4h4evr+yQvzrtbSmnvVACndn4kga8zfW2ib
         nvylt3Mis7jUm5/FGj9mm654es/c71SQPrQ9ZsXdCArAEGV20+7KB4hdralwNTrVhxM2
         LnUzqR0MaNMgSLb28XFM3eRa3cXSAmsf/zjeKJXbEWkgwPB882vcqN3IwMo9VVyL0bb1
         0M9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OLCp6YATjhRmBhwfqK1mkocBtILTkE9/iTp0tibmWMc=;
        fh=XgncJnChD89f8YcbUPv/zS+JHnV3t/pCNdyLfi17LkQ=;
        b=ARkZYgPEEs+ER2wwiSU2VUNgBapEisGY7ZoPjCCNR5UClbJ8XIxWATkix4IuPKEraR
         jpZEFICeEOuyIpmksJNfOi1d0M3yQ/8wUqtQb6RCZFOSrTjYOcXZAc0e1zAWIKma2+VD
         MdhTTzE/ICrg08hBer8f/t58kcABsqx8RAIyZ1TsesVIXQB4yNUgjZvU893xdLYFJ0H7
         2TvqCppWrlVAjbFFoYnIkXATS5pAOQgV6tdm6Gq1cJ1IFV3EX5F8upssSu6BujpviZYE
         6Ga3GOGKJQulV9o+WJGQcYJN5L23Jh+iskxCk+7kBYaRjdF8tq9lCaj8LsSRnikdb48R
         91jw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=Fw9DE1IM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff6c3401si157486621cf.664.2024.11.13.06.26.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Nov 2024 06:26:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=Fw9DE1IM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tBEHw-0003uo-Dz; Wed, 13 Nov 2024 09:24:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tBEHu-0003s4-6b
 for qemu-devel@nongnu.org; Wed, 13 Nov 2024 09:24:06 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tBEHq-0008TH-Bu
 for qemu-devel@nongnu.org; Wed, 13 Nov 2024 09:24:05 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5cf6f804233so702603a12.2
 for <qemu-devel@nongnu.org>; Wed, 13 Nov 2024 06:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1731507841; x=1732112641;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OLCp6YATjhRmBhwfqK1mkocBtILTkE9/iTp0tibmWMc=;
 b=Fw9DE1IMvXq53mG3tsHDDAfPSPV+PFFAajCVdfHvMBZoimN/vvyJTOyiZVHFauhu3E
 lLOVSO4LnEUYNU778ZXwzbQNC2iQurDk1/LwvEiFotjzIIUPkDE0yCO8GX3dGbAOyGdN
 bBF3RrOgw2O1wSiEuKQJVNY8Wt2GAnTAv8DPDf3qMrcsf6/uOy+Pp5baz3aChj5O1JSG
 4jW2OPkmES+allhrOIHq3Jb4o13KOLcG3cVENPkP+gwNeSHu1mUAd3twIqCaXilM7bxJ
 0zBHa04IvhUOXK2or9iM0F2brzlfyJXrcUkHUpx0azDHoSqt2tfhTEZI5oJs9kBT6sqm
 dVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731507841; x=1732112641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OLCp6YATjhRmBhwfqK1mkocBtILTkE9/iTp0tibmWMc=;
 b=cYmuLePDuXyLC0V3Ba6jRIstQjqMgBTdiJvBU+iqTrzDwfpKAOM29XDHorxxOvxM1R
 iAVaFSCvNK+0XyH0yFRzPkmKlhjneIKU4y2wURzOwvUx5833oWJQgEQ62MBLUD9HwKVW
 4/APq5SamzkTdSEbvrstDaGaC51NbdlKACKX9wtoN7I50V7N3D0+2lr6DH7DUg3h/ylj
 fxl7cLm3AiW2qucwX59VrTt9bORtff53LBfWK6wtDJaopeOT8YaCNVCjoP5/8mD/ybbx
 oMNz056k7T6nn+GzkJYWaxy4NhWW/mP7h7oliaawviiDpT+3kBGanw285TQpqjLblZAz
 YX8w==
X-Gm-Message-State: AOJu0Yx5KGx3zdWE4JVZ18T3EFnk7D5f5nZX0aBFpGC1DX6hSpJVM2Ci
 zo4aulKKYJbCv25IKNN9mBPKCRuvg0BeREmpBaewejZrxTJl2lKThXg5vEmdF59QCB8SV1JFAiR
 oFw==
X-Received: by 2002:a05:6402:51c7:b0:5c9:2a8c:8961 with SMTP id
 4fb4d7f45d1cf-5cf630fa735mr2685487a12.22.1731507840851; 
 Wed, 13 Nov 2024 06:24:00 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03b5d76esm7134612a12.9.2024.11.13.06.23.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 13 Nov 2024 06:24:00 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, balaton@eik.bme.hu
Subject: [PATCH v10 04/15] hw/display/apple-gfx: Adds configurable mode list
Date: Wed, 13 Nov 2024 15:23:32 +0100
Message-Id: <20241113142343.40832-5-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241113142343.40832-1-phil@philjordan.eu>
References: <20241113142343.40832-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::530;
 envelope-from=phil@philjordan.eu; helo=mail-ed1-x530.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: qzI1g+HEpKqQ

This change adds a property 'display_modes' on the graphics device
which permits specifying a list of display modes. (screen resolution
and refresh rate)

The property is an array of a custom type to make the syntax slightly
less awkward to use, for example:

-device '{"driver":"apple-gfx-pci", "display-modes":["1920x1080@60", "3840x2160@60"]}'

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---

v4:

 * Switched to the native array property type, which recently gained
	 command line support.
 * The property has also been added to the -mmio variant.
 * Tidied up the code a little.

v5:

 * Better error handling and buffer management in property parsing and
   output.

v6:

 * Switched to using NSMutableArray for the mode list to avoid need for
   allocating a temporary array - previously done with alloca.

v7:

 * Simplified error handling in property parsing

v8:

 * More consistent integer variable types.

v9:

 * Re-ordered type definitions so we can drop a 'struct' keyword.

 hw/display/apple-gfx-mmio.m |   8 +++
 hw/display/apple-gfx-pci.m  |   9 ++-
 hw/display/apple-gfx.h      |  11 +++
 hw/display/apple-gfx.m      | 135 +++++++++++++++++++++++++++++++-----
 hw/display/trace-events     |   2 +
 5 files changed, 145 insertions(+), 20 deletions(-)

diff --git a/hw/display/apple-gfx-mmio.m b/hw/display/apple-gfx-mmio.m
index 2d76e7375bd..99935a155c7 100644
--- a/hw/display/apple-gfx-mmio.m
+++ b/hw/display/apple-gfx-mmio.m
@@ -258,6 +258,12 @@ static void apple_gfx_mmio_reset(Object *obj, ResetType type)
     [s->common.pgdev reset];
 }
 
+static Property apple_gfx_mmio_properties[] = {
+    DEFINE_PROP_ARRAY("display-modes", AppleGFXMMIOState,
+                      common.num_display_modes, common.display_modes,
+                      qdev_prop_display_mode, AppleGFXDisplayMode),
+    DEFINE_PROP_END_OF_LIST(),
+};
 
 static void apple_gfx_mmio_class_init(ObjectClass *klass, void *data)
 {
@@ -267,6 +273,8 @@ static void apple_gfx_mmio_class_init(ObjectClass *klass, void *data)
     rc->phases.hold = apple_gfx_mmio_reset;
     dc->hotpluggable = false;
     dc->realize = apple_gfx_mmio_realize;
+
+    device_class_set_props(dc, apple_gfx_mmio_properties);
 }
 
 static TypeInfo apple_gfx_mmio_types[] = {
diff --git a/hw/display/apple-gfx-pci.m b/hw/display/apple-gfx-pci.m
index 5a27b95ac79..765b210287d 100644
--- a/hw/display/apple-gfx-pci.m
+++ b/hw/display/apple-gfx-pci.m
@@ -114,6 +114,13 @@ static void apple_gfx_pci_reset(Object *obj, ResetType type)
     [s->common.pgdev reset];
 }
 
+static Property apple_gfx_pci_properties[] = {
+    DEFINE_PROP_ARRAY("display-modes", AppleGFXPCIState,
+                      common.num_display_modes, common.display_modes,
+                      qdev_prop_display_mode, AppleGFXDisplayMode),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void apple_gfx_pci_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -130,7 +137,7 @@ static void apple_gfx_pci_class_init(ObjectClass *klass, void *data)
     pci->class_id = PCI_CLASS_DISPLAY_OTHER;
     pci->realize = apple_gfx_pci_realize;
 
-    // TODO: Property for setting mode list
+    device_class_set_props(dc, apple_gfx_pci_properties);
 }
 
 static TypeInfo apple_gfx_pci_types[] = {
diff --git a/hw/display/apple-gfx.h b/hw/display/apple-gfx.h
index 220276b7492..a34c53cda34 100644
--- a/hw/display/apple-gfx.h
+++ b/hw/display/apple-gfx.h
@@ -16,6 +16,7 @@
 #import <ParavirtualizedGraphics/ParavirtualizedGraphics.h>
 #include "qemu/typedefs.h"
 #include "exec/memory.h"
+#include "hw/qdev-properties.h"
 #include "ui/surface.h"
 
 @class PGDeviceDescriptor;
@@ -27,6 +28,12 @@
 
 typedef QTAILQ_HEAD(, PGTask_s) PGTaskList;
 
+typedef struct AppleGFXDisplayMode {
+    uint16_t width_px;
+    uint16_t height_px;
+    uint16_t refresh_rate_hz;
+} AppleGFXDisplayMode;
+
 typedef struct AppleGFXState {
     /* Initialised on init/realize() */
     MemoryRegion iomem_gfx;
@@ -36,6 +43,8 @@ typedef struct AppleGFXState {
     id<MTLDevice> mtl;
     id<MTLCommandQueue> mtl_queue;
     dispatch_queue_t render_queue;
+    AppleGFXDisplayMode *display_modes;
+    uint32_t num_display_modes;
 
     /* List `tasks` is protected by task_mutex */
     QemuMutex task_mutex;
@@ -63,5 +72,7 @@ void *apple_gfx_host_ptr_for_gpa_range(uint64_t guest_physical,
                                        uint64_t length, bool read_only,
                                        MemoryRegion **mapping_in_region);
 
+extern const PropertyInfo qdev_prop_display_mode;
+
 #endif
 
diff --git a/hw/display/apple-gfx.m b/hw/display/apple-gfx.m
index b9f92eb6656..6aaef0452bf 100644
--- a/hw/display/apple-gfx.m
+++ b/hw/display/apple-gfx.m
@@ -31,9 +31,10 @@
 #include "sysemu/dma.h"
 #include "ui/console.h"
 
-static const PGDisplayCoord_t apple_gfx_modes[] = {
-    { .x = 1440, .y = 1080 },
-    { .x = 1280, .y = 1024 },
+static const AppleGFXDisplayMode apple_gfx_default_modes[] = {
+    { 1920, 1080, 60 },
+    { 1440, 1080, 60 },
+    { 1280, 1024, 60 },
 };
 
 /* ------ PGTask and task operations: new/destroy/map/unmap ------ */
@@ -679,22 +680,24 @@ static void new_frame_handler_bh(void *opaque)
     return disp_desc;
 }
 
-static NSArray<PGDisplayMode*>* apple_gfx_prepare_display_mode_array(void)
+static NSArray<PGDisplayMode *> *apple_gfx_create_display_mode_array(
+    const AppleGFXDisplayMode display_modes[], uint32_t display_mode_count)
 {
-    PGDisplayMode *modes[ARRAY_SIZE(apple_gfx_modes)];
-    NSArray<PGDisplayMode*>* mode_array = nil;
-    int i;
-
-    for (i = 0; i < ARRAY_SIZE(apple_gfx_modes); i++) {
-        modes[i] =
-            [[PGDisplayMode alloc] initWithSizeInPixels:apple_gfx_modes[i] refreshRateInHz:60.];
-    }
-
-    mode_array = [NSArray arrayWithObjects:modes count:ARRAY_SIZE(apple_gfx_modes)];
-
-    for (i = 0; i < ARRAY_SIZE(apple_gfx_modes); i++) {
-        [modes[i] release];
-        modes[i] = nil;
+    uint32_t i;
+    PGDisplayMode *mode_obj;
+    NSMutableArray<PGDisplayMode *> *mode_array =
+        [[NSMutableArray alloc] initWithCapacity:display_mode_count];
+
+    for (i = 0; i < display_mode_count; i++) {
+        const AppleGFXDisplayMode *mode = &display_modes[i];
+        trace_apple_gfx_display_mode(i, mode->width_px, mode->height_px);
+        PGDisplayCoord_t mode_size = { mode->width_px, mode->height_px };
+
+        mode_obj =
+            [[PGDisplayMode alloc] initWithSizeInPixels:mode_size
+                                        refreshRateInHz:mode->refresh_rate_hz];
+        [mode_array addObject:mode_obj];
+        [mode_obj release];
     }
 
     return mode_array;
@@ -730,6 +733,9 @@ bool apple_gfx_common_realize(AppleGFXState *s, DeviceState *dev,
                               PGDeviceDescriptor *desc, Error **errp)
 {
     PGDisplayDescriptor *disp_desc = nil;
+    const AppleGFXDisplayMode *display_modes = apple_gfx_default_modes;
+    uint32_t num_display_modes = ARRAY_SIZE(apple_gfx_default_modes);
+    NSArray<PGDisplayMode *> *mode_array;
 
     if (apple_gfx_mig_blocker == NULL) {
         error_setg(&apple_gfx_mig_blocker,
@@ -758,8 +764,99 @@ bool apple_gfx_common_realize(AppleGFXState *s, DeviceState *dev,
     s->pgdisp = [s->pgdev newDisplayWithDescriptor:disp_desc
                                               port:0 serialNum:1234];
     [disp_desc release];
-    s->pgdisp.modeList = apple_gfx_prepare_display_mode_array();
+
+    if (s->display_modes != NULL && s->num_display_modes > 0) {
+        trace_apple_gfx_common_realize_modes_property(s->num_display_modes);
+        display_modes = s->display_modes;
+        num_display_modes = s->num_display_modes;
+    }
+    s->pgdisp.modeList = mode_array =
+        apple_gfx_create_display_mode_array(display_modes, num_display_modes);
+    [mode_array release];
 
     s->con = graphic_console_init(dev, 0, &apple_gfx_fb_ops, s);
     return true;
 }
+
+/* ------ Display mode list device property ------ */
+
+static void apple_gfx_get_display_mode(Object *obj, Visitor *v,
+                                       const char *name, void *opaque,
+                                       Error **errp)
+{
+    Property *prop = opaque;
+    AppleGFXDisplayMode *mode = object_field_prop_ptr(obj, prop);
+    /* 3 uint16s (max 5 digits) + 2 separator characters + nul. */
+    char buffer[5 * 3 + 2 + 1];
+    char *pos = buffer;
+
+    int rc = snprintf(buffer, sizeof(buffer),
+                      "%"PRIu16"x%"PRIu16"@%"PRIu16,
+                      mode->width_px, mode->height_px,
+                      mode->refresh_rate_hz);
+    assert(rc < sizeof(buffer));
+
+    visit_type_str(v, name, &pos, errp);
+}
+
+static void apple_gfx_set_display_mode(Object *obj, Visitor *v,
+                                       const char *name, void *opaque,
+                                       Error **errp)
+{
+    Property *prop = opaque;
+    AppleGFXDisplayMode *mode = object_field_prop_ptr(obj, prop);
+    const char *endptr;
+    g_autofree char *str = NULL;
+    int ret;
+    int val;
+
+    if (!visit_type_str(v, name, &str, errp)) {
+        return;
+    }
+
+    endptr = str;
+
+    ret = qemu_strtoi(endptr, &endptr, 10, &val);
+    if (ret || val > UINT16_MAX || val <= 0) {
+        error_setg(errp, "width in '%s' must be a decimal integer number "
+                   "of pixels in the range 1..65535", name);
+        return;
+    }
+    mode->width_px = val;
+    if (*endptr != 'x') {
+        goto separator_error;
+    }
+
+    ret = qemu_strtoi(endptr + 1, &endptr, 10, &val);
+    if (ret || val > UINT16_MAX || val <= 0) {
+        error_setg(errp, "height in '%s' must be a decimal integer number "
+                   "of pixels in the range 1..65535", name);
+        return;
+    }
+    mode->height_px = val;
+    if (*endptr != '@') {
+        goto separator_error;
+    }
+
+    ret = qemu_strtoi(endptr + 1, &endptr, 10, &val);
+    if (ret || val > UINT16_MAX || val <= 0) {
+        error_setg(errp, "refresh rate in '%s'"
+                   " must be a positive decimal integer (Hertz)", name);
+        return;
+    }
+    mode->refresh_rate_hz = val;
+    return;
+
+separator_error:
+    error_setg(errp, "Each display mode takes the format "
+               "'<width>x<height>@<rate>'");
+}
+
+const PropertyInfo qdev_prop_display_mode = {
+    .name  = "display_mode",
+    .description =
+        "Display mode in pixels and Hertz, as <width>x<height>@<refresh-rate> "
+        "Example: 3840x2160@60",
+    .get   = apple_gfx_get_display_mode,
+    .set   = apple_gfx_set_display_mode,
+};
diff --git a/hw/display/trace-events b/hw/display/trace-events
index a50e4eea0c0..52786e6e184 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -212,6 +212,8 @@ apple_gfx_cursor_set(uint32_t bpp, uint64_t width, uint64_t height) "bpp=%d widt
 apple_gfx_cursor_show(uint32_t show) "show=%d"
 apple_gfx_cursor_move(void) ""
 apple_gfx_common_init(const char *device_name, size_t mmio_size) "device: %s; MMIO size: %zu bytes"
+apple_gfx_common_realize_modes_property(uint32_t num_modes) "using %u modes supplied by 'display-modes' device property"
+apple_gfx_display_mode(uint32_t mode_idx, uint16_t width_px, uint16_t height_px) "mode %2"PRIu32": %4"PRIu16"x%4"PRIu16
 
 # apple-gfx-mmio.m
 apple_gfx_mmio_iosfc_read(uint64_t offset, uint64_t res) "offset=0x%"PRIx64" res=0x%"PRIx64
-- 
2.39.3 (Apple Git-145)

