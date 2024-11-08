Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp4966160njc;
        Fri, 8 Nov 2024 06:49:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUp8MuWGDSXBjcVp0j9fG7auEoIKPbYZC2fVrK4P1nIFWYJz1WxUF/6CIu9OU9BDgAyXWCR6onPeg0dlg==@linaro.org
X-Google-Smtp-Source: AGHT+IHcLPP6pCZVQs4/cLvnwlWCaF1pOtTKdEnjwgTU+6PnpKuiDPYcsB935DeLnUH87NAg3mHV
X-Received: by 2002:a05:620a:2a0a:b0:79f:1cf:551e with SMTP id af79cd13be357-7b331dcd09bmr364394385a.5.1731077352539;
        Fri, 08 Nov 2024 06:49:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731077352; cv=none;
        d=google.com; s=arc-20240605;
        b=A9GYTH35abhUca2g+fYggXu5FjDbDGcui141PMPHxXxgr//TQ7CtOvAiLVT6q5/nNX
         rJZFbh8PmzhZr8j9R6mlI7zX3keRYcRQnncC3oBYQu96VorqItZU6KN0K756PgISAfk5
         ryz13BoKg7b20sKYkBzWlckohLDKPz7iJvJW/ZBciAAAfMawGfYzKcYd2Yg/hWq/+qAK
         3DwatN3bnl5R9IBWFUc05Pddh3Ao4Lm7EAv/GIy8Qrb3e3HCAEqu9H0/4wH2ReHkVxxH
         gMOaI0qZlrBC1kr9xkcNtQ+r28sfiXbI3iVmL/9EzrfD4YRPO7u4Ngej/WHmVFK/hRe6
         RuHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aEiRA/RwRGXxRWMc8CRQjpx8s1SsdVFqe3JdOV7WdrM=;
        fh=+bn2rj3YVNJH7JNrBu0F05p9pYCP4OwTdygEIi5Z6Ao=;
        b=PRwWrzphLyPSAdb6XRDoTnCjyauneBZctt7gSFfiVlqM5I3eFFkJCWmaOMe1OFXfE8
         fH9J/3ADhrtgt4zAb1NCtCQNkSkYr+J77eY+2GELn58q+sMjDLq/D23aach0y61nLUqq
         bO0Qfw6Os6l5eKnC7bKHNu90nIzF2DCtf2JxuaiEqYZWPrZhWeK7icq9dg3m2WjRX2vI
         U42Exq+QOyQ7TLSzAOtJU6tze0linsTdAJSXF5h95TJR5DxoJinW6ZpPkgpuuTSArxG9
         psww7i4v923feBWZgjBnBHAwi8PpDumQqYLPXbXynOt1JsTBFK1x5iqASPmkWLmsCrUx
         1U0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=kXRLdGTx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32acf662esi426808685a.424.2024.11.08.06.49.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2024 06:49:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=kXRLdGTx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t9QHb-0005E1-Hr; Fri, 08 Nov 2024 09:48:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t9QGk-0004CT-Jz
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 09:47:27 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t9QGh-0005Gb-QA
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 09:47:26 -0500
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a9e8522c10bso336673966b.1
 for <qemu-arm@nongnu.org>; Fri, 08 Nov 2024 06:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1731077242; x=1731682042;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aEiRA/RwRGXxRWMc8CRQjpx8s1SsdVFqe3JdOV7WdrM=;
 b=kXRLdGTx29D2qYpzIeCcXoZ//gQi945sK6JgyA6feYSMkyrkjLF6b8pjl/Hkx+neIc
 nhd1Sp6ivq0syDKpNucMjXcVTQbt8SwK+hs8D6T0FvfJLFyNrQ8e/2tpQcjAIfFVkng9
 SMrbHc1BD20vaheOGQVMr2qdSaW/tCBPFjYnBbnJVca6qr2M80scVkT4zCoUdGkMRP9h
 1JUfUfov50yfYa/UlpPFkTz8TYl315MJnBG5y5npXLUpZoXJ9klB0IkLsbGgFvFDvERG
 4bsvhfXHsZRi7x+wgAMZzQmYngEVhXu2cDK5CqGIM0SvH9h/Jjo/y5RadEcbE4oB8f8s
 AzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731077242; x=1731682042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aEiRA/RwRGXxRWMc8CRQjpx8s1SsdVFqe3JdOV7WdrM=;
 b=M01oHDC8dvWsxUROFpYo8aLPhTjLxo0RwACGbE4RRJS3YSWP06xTXODXzeCJvB4len
 gWnUR3c96Wnm1T9JaxZV5DO5+P1ooAds/9tIa28j+gmptNb9XC6yPPT1ZzQvf+AeQVqd
 /hO04ajZXAPAuxTkHBn+0m1KOz9MTB3AtwaJ/rBzanLj9H+/IWNtVXqEuNwNOygWMhOE
 Z9ylwgkwIPJHibCPVx2SQidE4kr9hoHrAJ9qKZSwhyOkVyIk3uY5iX5Vv5P5EKcWSdE1
 a6es5NxK7cuf0fZCtk0PxZDGgpzRpM4SBP0jj4liIYOVGkyyYjhMxyRBH6WGeXsNiHiE
 plOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqbaidTDGxSeSL8K+Rp30a1GIE3dlS6oFeglfh6PjwIstKxwMrtWBSiAGGSFw0G6kIKDTwbEpbIg==@nongnu.org
X-Gm-Message-State: AOJu0Yzp4OSsaKRObnyB2W8d0ZEURzVm3FzBGLLB07ygbt6RYX//SegH
 R9ot8eKFEqIIc6hbNJvXXpay67L5U8KagzVE7nDIu0bvI17J4Zv4xlv43ciczQ==
X-Received: by 2002:a17:907:d11:b0:a9e:85f8:2a49 with SMTP id
 a640c23a62f3a-a9eec982188mr376496566b.8.1731077242361; 
 Fri, 08 Nov 2024 06:47:22 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a4a9b1sm240534066b.52.2024.11.08.06.47.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 08 Nov 2024 06:47:21 -0800 (PST)
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
 qemu-riscv@nongnu.org
Subject: [PATCH v8 04/15] hw/display/apple-gfx: Adds configurable mode list
Date: Fri,  8 Nov 2024 15:46:58 +0100
Message-Id: <20241108144709.95498-5-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241108144709.95498-1-phil@philjordan.eu>
References: <20241108144709.95498-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::62b;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: 6YLTLgwT6cEJ

This change adds a property 'display_modes' on the graphics device
which permits specifying a list of display modes. (screen resolution
and refresh rate)

The property is an array of a custom type to make the syntax slightly
less awkward to use, for example:

-device '{"driver":"apple-gfx-pci", "display-modes":["1920x1080@60", "3840x2160@60"]}'

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
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

 hw/display/apple-gfx-mmio.m |   8 +++
 hw/display/apple-gfx-pci.m  |   9 ++-
 hw/display/apple-gfx.h      |  12 ++++
 hw/display/apple-gfx.m      | 136 +++++++++++++++++++++++++++++++-----
 hw/display/trace-events     |   2 +
 5 files changed, 147 insertions(+), 20 deletions(-)

diff --git a/hw/display/apple-gfx-mmio.m b/hw/display/apple-gfx-mmio.m
index 2c5f426886c..2e4d775a04b 100644
--- a/hw/display/apple-gfx-mmio.m
+++ b/hw/display/apple-gfx-mmio.m
@@ -259,6 +259,12 @@ static void apple_gfx_mmio_reset(Object *obj, ResetType type)
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
@@ -268,6 +274,8 @@ static void apple_gfx_mmio_class_init(ObjectClass *klass, void *data)
     rc->phases.hold = apple_gfx_mmio_reset;
     dc->hotpluggable = false;
     dc->realize = apple_gfx_mmio_realize;
+
+    device_class_set_props(dc, apple_gfx_mmio_properties);
 }
 
 static TypeInfo apple_gfx_mmio_types[] = {
diff --git a/hw/display/apple-gfx-pci.m b/hw/display/apple-gfx-pci.m
index 8bd7c0df443..712a08a5c8f 100644
--- a/hw/display/apple-gfx-pci.m
+++ b/hw/display/apple-gfx-pci.m
@@ -112,6 +112,13 @@ static void apple_gfx_pci_reset(Object *obj, ResetType type)
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
@@ -128,7 +135,7 @@ static void apple_gfx_pci_class_init(ObjectClass *klass, void *data)
     pci->class_id = PCI_CLASS_DISPLAY_OTHER;
     pci->realize = apple_gfx_pci_realize;
 
-    // TODO: Property for setting mode list
+    device_class_set_props(dc, apple_gfx_pci_properties);
 }
 
 static TypeInfo apple_gfx_pci_types[] = {
diff --git a/hw/display/apple-gfx.h b/hw/display/apple-gfx.h
index 14ac2af8fc3..a38bc1240a8 100644
--- a/hw/display/apple-gfx.h
+++ b/hw/display/apple-gfx.h
@@ -16,6 +16,7 @@
 #import <ParavirtualizedGraphics/ParavirtualizedGraphics.h>
 #include "qemu/typedefs.h"
 #include "exec/memory.h"
+#include "hw/qdev-properties.h"
 #include "ui/surface.h"
 
 @class PGDeviceDescriptor;
@@ -27,6 +28,7 @@
 
 typedef QTAILQ_HEAD(, PGTask_s) PGTaskList;
 
+struct AppleGFXDisplayMode;
 typedef struct AppleGFXState {
     /* Initialised on init/realize() */
     MemoryRegion iomem_gfx;
@@ -36,6 +38,8 @@ typedef struct AppleGFXState {
     id<MTLDevice> mtl;
     id<MTLCommandQueue> mtl_queue;
     dispatch_queue_t render_queue;
+    struct AppleGFXDisplayMode *display_modes;
+    uint32_t num_display_modes;
 
     /* List `tasks` is protected by task_mutex */
     QemuMutex task_mutex;
@@ -54,6 +58,12 @@ typedef struct AppleGFXState {
     bool cursor_show;
 } AppleGFXState;
 
+typedef struct AppleGFXDisplayMode {
+    uint16_t width_px;
+    uint16_t height_px;
+    uint16_t refresh_rate_hz;
+} AppleGFXDisplayMode;
+
 void apple_gfx_common_init(Object *obj, AppleGFXState *s, const char* obj_name);
 void apple_gfx_common_realize(AppleGFXState *s, PGDeviceDescriptor *desc,
                               Error **errp);
@@ -61,5 +71,7 @@ void* apple_gfx_host_ptr_for_gpa_range(uint64_t guest_physical,
                                        uint64_t length, bool read_only,
                                        MemoryRegion **mapping_in_region);
 
+extern const PropertyInfo qdev_prop_display_mode;
+
 #endif
 
diff --git a/hw/display/apple-gfx.m b/hw/display/apple-gfx.m
index 913937b5255..f4609f6728a 100644
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
@@ -684,22 +685,24 @@ static void apple_gfx_register_task_mapping_handlers(AppleGFXState *s,
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
@@ -735,6 +738,9 @@ void apple_gfx_common_realize(AppleGFXState *s, PGDeviceDescriptor *desc,
                               Error **errp)
 {
     PGDisplayDescriptor *disp_desc = nil;
+    const AppleGFXDisplayMode *display_modes = apple_gfx_default_modes;
+    uint32_t num_display_modes = ARRAY_SIZE(apple_gfx_default_modes);
+    NSArray<PGDisplayMode *> *mode_array;
 
     if (apple_gfx_mig_blocker == NULL) {
         error_setg(&apple_gfx_mig_blocker,
@@ -761,9 +767,101 @@ void apple_gfx_common_realize(AppleGFXState *s, PGDeviceDescriptor *desc,
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
 
     s->con = graphic_console_init(NULL, 0, &apple_gfx_fb_ops, s);
 
     qatomic_set(&s->cursor_show, true);
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
+    visit_type_str(v, name, &str, errp);
+    if (*errp) {
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

