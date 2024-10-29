Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp542627njj;
        Tue, 29 Oct 2024 14:04:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXibM/8VrQvIketlwxyF053LVQmqik9sFWpBwJMpQK6soE9MF2lDLNKq1x9EVCV22T7YToGuIyXiHZwWA==@linaro.org
X-Google-Smtp-Source: AGHT+IEuSGgpp1xoiUqvF7amfwvnhYHRn4q1lTOw5TcNhIuq/g9K5H0AbwUiZOQJJJnZ0832Ekgl
X-Received: by 2002:a05:6358:94a2:b0:1bc:573a:401a with SMTP id e5c5f4694b2df-1c3f9d13410mr634266955d.5.1730235847365;
        Tue, 29 Oct 2024 14:04:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730235847; cv=none;
        d=google.com; s=arc-20240605;
        b=gYLwoCILXpodRHI8eRV4EVe98VNPocUuOAxzpbHTJXqyR1m4v6qq4/jcl94SckHqbY
         tf/wVrVj6j3B9cUYlnd/bS08LJQFdhFmk+PrUMu+awMpjmgiMM1jsuye54RCIjab3jdS
         ySCgOj0OKRKzwasbaYMbs4ppJ3xbdm9up7ioW5EXuyu7LHMif/NW/n6O9iR7KgaxktnI
         Qby05RihBa1SYMqKrz89R7WZceZFd9j41SDwnUi+FKIkcrcQrBNaJgEwjAqEqVH9KuSZ
         xOB45OjiUflVyweafBpfu9cq5+yAsz3r3RmzvRTSGtjrnomIwg+qfVzal3il8Pf1O4TP
         +BjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eHMN46rJt9QcxyBveWaVh/b2Y4BBk6tAt2nO8pjIz70=;
        fh=X/cEeG0IecOcbktZzhggOUgW8rnsW2Y9KQE40BZHOoA=;
        b=GnIgIRsXcJAbv8Q/NnA8mi3Nk7kWpGG6339YPYBGafbgdYa+0s9bwODqbdq4X1nZ+a
         8p5ycepV0OLca/cAo1uiWYQFgCY+LZNW+TzivCqCxrsAmWh1I2bm9flAtr7sy9TyYCXq
         Ap+mzHByY6mBr4d37E2j5jqDEbH7Ho8MPCd2a3omunRfvnepHbTqkGB/X9P9QHk8tjcA
         G1PAnkI/S1bZb0FUIerlZUdfqa9CVl15SE+DDX+gBDhlcDOgm4d3IdJS52M/ZzsgSRLR
         1SKrgtDV8jfLr7h9IE0J8wfJCAx5xiCKWe1FUH/Fmo0AFFmWUKX+4K74bdXFOk5HL9D1
         fJ0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=MyG+cP5U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b18d378c7asi1155103585a.683.2024.10.29.14.04.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 14:04:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=MyG+cP5U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t5tIm-0003e4-Vh; Tue, 29 Oct 2024 16:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t5tIk-0003bF-Pc
 for qemu-devel@nongnu.org; Tue, 29 Oct 2024 16:58:55 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t5tIe-0005XO-Ny
 for qemu-devel@nongnu.org; Tue, 29 Oct 2024 16:58:54 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c9454f3bfaso7058588a12.2
 for <qemu-devel@nongnu.org>; Tue, 29 Oct 2024 13:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1730235527; x=1730840327;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eHMN46rJt9QcxyBveWaVh/b2Y4BBk6tAt2nO8pjIz70=;
 b=MyG+cP5UkEMFyOHjTzNLkMibFV63+8eOhV+4CzBDhho8EC5QGE5XUhNCTrpzCVfuc5
 B7TsAJWPelSya+g9aLqbNH9etbuyFNMUssWByzE8nAsLWC0iyUjVUJ2qsl14gXqPsr07
 K1iLDIvYMSbscdB4jrJfkGtw6W+WIv7xZTr+Lq68fWd83Kja+7po8wIaWergS77FlPA6
 XzqbngmPQp5AaJcNqngOOLWF0/OsyCAZLcSSSrU2jzRu38mcVHwVwgqin5pTSz6AE6am
 tpDkGYamD1ITxmBQYc4zrBBFMqkwQXXlJ9evsurmODV5PqM5rpFq1rC4r5RdCuJv+Oqo
 62pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730235527; x=1730840327;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eHMN46rJt9QcxyBveWaVh/b2Y4BBk6tAt2nO8pjIz70=;
 b=fVcOdQs+rPZu4vDOtAtpvbzPeZM9V7N3LLjUBBlADKAjcrCa2f1db+lANJtZt3LLSD
 yBGlkewvf+jKRd/qJlAPOOEl1Fef+p7GtpNPoPRokRUNL800ShOXJub9718Tq1krC+ub
 cv+N3gmJqcvJ4e0FtJC0XW6DOnkoB1mlLXU7lN99kvx0sWxpDFwEx4RXb1U13puBEABH
 zhwR36jOD90ZSiPOqv0+2LbvsIu6ah6jQ8XE7rJHjZfnEgnN1tH66BXUjOoo+fOr1qJw
 FbQLQra/ibso8DyVFXrA1b4R0fZzxLLWSqHXosZCMsvm1E10OO9qw4jo6cN6u4Xyb0DQ
 yXxg==
X-Gm-Message-State: AOJu0YwfMfn1lutGYrnD2sJdLWYvYY7ybJ9v4gLPp57zZHwAdKJdDeGq
 J4En4zJ48/4rPkQkxG02vMIc1G9AcbiIerC0iXM7jyOO8UmIGWGKFCwVyAbz8CYsUjScAZYu0+v
 08Q==
X-Received: by 2002:a05:6402:51d0:b0:5cb:66c6:d82a with SMTP id
 4fb4d7f45d1cf-5cbbf88a35fmr9930969a12.3.1730235527106; 
 Tue, 29 Oct 2024 13:58:47 -0700 (PDT)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb629d5besm4217341a12.33.2024.10.29.13.58.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 29 Oct 2024 13:58:46 -0700 (PDT)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, stefanha@redhat.com, mst@redhat.com,
 slp@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v5 04/15] hw/display/apple-gfx: Adds configurable mode list
Date: Tue, 29 Oct 2024 21:58:08 +0100
Message-Id: <20241029205819.69888-5-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241029205819.69888-1-phil@philjordan.eu>
References: <20241029205819.69888-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::535;
 envelope-from=phil@philjordan.eu; helo=mail-ed1-x535.google.com
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
X-TUID: ARKLx/JJmcLk

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

 hw/display/apple-gfx-mmio.m |   8 +++
 hw/display/apple-gfx-pci.m  |   9 ++-
 hw/display/apple-gfx.h      |  12 ++++
 hw/display/apple-gfx.m      | 121 ++++++++++++++++++++++++++++++++----
 hw/display/trace-events     |   2 +
 5 files changed, 139 insertions(+), 13 deletions(-)

diff --git a/hw/display/apple-gfx-mmio.m b/hw/display/apple-gfx-mmio.m
index b0c5669a344..a801c5fa722 100644
--- a/hw/display/apple-gfx-mmio.m
+++ b/hw/display/apple-gfx-mmio.m
@@ -364,6 +364,12 @@ static void apple_gfx_mmio_reset(Object *obj, ResetType type)
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
@@ -373,6 +379,8 @@ static void apple_gfx_mmio_class_init(ObjectClass *klass, void *data)
     rc->phases.hold = apple_gfx_mmio_reset;
     dc->hotpluggable = false;
     dc->realize = apple_gfx_mmio_realize;
+
+    device_class_set_props(dc, apple_gfx_mmio_properties);
 }
 
 static TypeInfo apple_gfx_mmio_types[] = {
diff --git a/hw/display/apple-gfx-pci.m b/hw/display/apple-gfx-pci.m
index 870d0c41e66..e2fa2567c99 100644
--- a/hw/display/apple-gfx-pci.m
+++ b/hw/display/apple-gfx-pci.m
@@ -113,6 +113,13 @@ static void apple_gfx_pci_reset(Object *obj, ResetType type)
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
@@ -129,7 +136,7 @@ static void apple_gfx_pci_class_init(ObjectClass *klass, void *data)
     pci->class_id = PCI_CLASS_DISPLAY_OTHER;
     pci->realize = apple_gfx_pci_realize;
 
-    // TODO: Property for setting mode list
+    device_class_set_props(dc, apple_gfx_pci_properties);
 }
 
 static TypeInfo apple_gfx_pci_types[] = {
diff --git a/hw/display/apple-gfx.h b/hw/display/apple-gfx.h
index ef34e8160c8..e9fef09e37e 100644
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
     /*
      * QemuMutex & QemuConds for awaiting completion of PVG memory-mapping and
      * reading requests after submitting them to run in the AIO context.
@@ -66,6 +70,12 @@ typedef struct AppleGFXState {
     id<MTLTexture> texture;
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
@@ -75,5 +85,7 @@ uintptr_t apple_gfx_host_address_for_gpa_range(uint64_t guest_physical,
 void apple_gfx_await_bh_job(AppleGFXState *s, QemuCond *job_cond,
                             bool *job_done_flag);
 
+extern const PropertyInfo qdev_prop_display_mode;
+
 #endif
 
diff --git a/hw/display/apple-gfx.m b/hw/display/apple-gfx.m
index 101b38e8a6e..2e264e5561f 100644
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
 
 /* This implements a type defined in <ParavirtualizedGraphics/PGDevice.h>
@@ -320,7 +321,6 @@ static void set_mode(AppleGFXState *s, uint32_t width, uint32_t height)
 static void create_fb(AppleGFXState *s)
 {
     s->con = graphic_console_init(NULL, 0, &apple_gfx_fb_ops, s);
-    set_mode(s, 1440, 1080);
 
     s->cursor_show = true;
 }
@@ -686,20 +686,25 @@ static void apple_gfx_register_task_mapping_handlers(AppleGFXState *s,
     return disp_desc;
 }
 
-static NSArray<PGDisplayMode*>* apple_gfx_prepare_display_mode_array(void)
+static NSArray<PGDisplayMode*>* apple_gfx_create_display_mode_array(
+    const AppleGFXDisplayMode display_modes[], uint32_t display_mode_count)
 {
-    PGDisplayMode *modes[ARRAY_SIZE(apple_gfx_modes)];
+    PGDisplayMode **modes = alloca(sizeof(modes[0]) * display_mode_count);
     NSArray<PGDisplayMode*>* mode_array = nil;
-    int i;
+    uint32_t i;
 
-    for (i = 0; i < ARRAY_SIZE(apple_gfx_modes); i++) {
+    for (i = 0; i < display_mode_count; i++) {
+        const AppleGFXDisplayMode *mode = &display_modes[i];
+        trace_apple_gfx_display_mode(i, mode->width_px, mode->height_px);
+        PGDisplayCoord_t mode_size = { mode->width_px, mode->height_px };
         modes[i] =
-            [[PGDisplayMode alloc] initWithSizeInPixels:apple_gfx_modes[i] refreshRateInHz:60.];
+            [[PGDisplayMode alloc] initWithSizeInPixels:mode_size
+                                        refreshRateInHz:mode->refresh_rate_hz];
     }
 
-    mode_array = [NSArray arrayWithObjects:modes count:ARRAY_SIZE(apple_gfx_modes)];
+    mode_array = [NSArray arrayWithObjects:modes count:display_mode_count];
 
-    for (i = 0; i < ARRAY_SIZE(apple_gfx_modes); i++) {
+    for (i = 0; i < display_mode_count; i++) {
         [modes[i] release];
         modes[i] = nil;
     }
@@ -737,6 +742,8 @@ void apple_gfx_common_realize(AppleGFXState *s, PGDeviceDescriptor *desc,
                               Error **errp)
 {
     PGDisplayDescriptor *disp_desc = nil;
+    const AppleGFXDisplayMode *display_modes = apple_gfx_default_modes;
+    int num_display_modes = ARRAY_SIZE(apple_gfx_default_modes);
 
     if (apple_gfx_mig_blocker == NULL) {
         error_setg(&apple_gfx_mig_blocker,
@@ -763,7 +770,14 @@ void apple_gfx_common_realize(AppleGFXState *s, PGDeviceDescriptor *desc,
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
+    s->pgdisp.modeList =
+        apple_gfx_create_display_mode_array(display_modes, num_display_modes);
 
     create_fb(s);
 
@@ -771,3 +785,86 @@ void apple_gfx_common_realize(AppleGFXState *s, PGDeviceDescriptor *desc,
     qemu_cond_init(&s->task_map_job_cond);
     qemu_cond_init(&s->mem_read_job_cond);
 }
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
+    Error *local_err = NULL;
+    const char *endptr;
+    g_autofree char *str = NULL;
+    int ret;
+    int val;
+
+    visit_type_str(v, name, &str, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
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
index d63fba6d094..0e223075375 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -209,6 +209,8 @@ apple_gfx_cursor_set(uint32_t bpp, uint64_t width, uint64_t height) "bpp=%d widt
 apple_gfx_cursor_show(uint32_t show) "show=%d"
 apple_gfx_cursor_move(void) ""
 apple_gfx_common_init(const char *device_name, size_t mmio_size) "device: %s; MMIO size: %zu bytes"
+apple_gfx_common_realize_modes_property(uint32_t num_modes) "using %u modes supplied by 'display-modes' device property"
+apple_gfx_display_mode(uint32_t mode_idx, uint16_t width_px, uint16_t height_px) "mode %2"PRIu32": %4"PRIu16"x%4"PRIu16
 
 # apple-gfx-mmio.m
 apple_gfx_mmio_iosfc_read(uint64_t offset, uint64_t res) "offset=0x%"PRIx64" res=0x%"PRIx64
-- 
2.39.3 (Apple Git-145)

