Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp849256njb;
        Wed, 27 Nov 2024 07:06:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWDhtMpB2CDdBAR8PjmFdUL5pS/z/l7qW3CIc97njt7VtnV/IPJFfF6Aq/vn+iP+RkTfujGyUetdouA/g==@linaro.org
X-Google-Smtp-Source: AGHT+IF6ZiVGXEgrauJDMmOqOhyBCGOptsyOYe2HcqcoimBdkOaOX1hgdKCvA1wRlvl828sXIMwJ
X-Received: by 2002:a05:6402:2491:b0:5cf:f470:a4b4 with SMTP id 4fb4d7f45d1cf-5d080bdc45dmr4159328a12.20.1732719969574;
        Wed, 27 Nov 2024 07:06:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732719969; cv=none;
        d=google.com; s=arc-20240605;
        b=dZSyN36O9UvPZnIywPUeElbIJPtHyBPTu1ewhDoZo1+1+67wNQV0Ga+fSrGt4GSHwk
         PfGE8BIJPLo4rXpjgXKMH6e48yg02KqroFVvzLBXLbqHte4H/OFCGndoVt/OLnOZXgKu
         I6Ewq0a4noTMI1LoYjlddsD9UdqxGMFVcL/Q7zolSz8NqEJGEOYnFJ6x1lh9ZgYUKMyF
         oTXyL3GCarF1OlC7QML0pqcZNOW54kFtQfXVSB1QRx8/q2s+Oi+lVEhdquwlMlym27Tq
         cQAbCLmLqybK2MhtCoVQKhcpE0v5XO5NBvtgrCrwFhdYEDuUl6GMqlDELnbPgTUR5Skh
         Ty4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sSpmbrE3NXfIYA4lszghmFKOuf7C0Mlau4VplMopA70=;
        fh=q48CSvb2e74i1q2K9ypVzHuEIhhD/60/EXZj01Nhb50=;
        b=FwgvRcInEnRFmetCO0kZ5le4qlgxRqryriawDAGt41PRlM+87ZxhtEtp3M8yMBD9GO
         V2L6v/v1OjxAdo6Vq87PqG+iEBczlcXpTWOUUe1soNRz4DFXotX4PekJhlqcFBECXWaP
         jAZFYlxoeQJzUNtUcq9dM82gl0cIbEzwH4o0lm2s/r5xusIWuWgZkcBk1sPabi78weK5
         z1YmjKEPDiEJqlk+2DVHeKRqsYMnHRWqiRRP33fiTL7Pslmxk/PLexEVYE+Xed0RAVU2
         RM/kpA04OMBigtenWjAt18zSMwvDjBhKutVjkIzMO8ZHGrfT5QcGc6EnUwMZqxTdoyjh
         gYqw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=DAabFWpV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5d06779cfc8si3071626a12.593.2024.11.27.07.06.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2024 07:06:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=DAabFWpV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tGJbi-0008Ha-7S; Wed, 27 Nov 2024 10:05:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tGJaZ-0007Dg-3k
 for qemu-arm@nongnu.org; Wed, 27 Nov 2024 10:04:24 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tGJaW-0007L1-6g
 for qemu-arm@nongnu.org; Wed, 27 Nov 2024 10:04:22 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-434aabd688fso5057535e9.3
 for <qemu-arm@nongnu.org>; Wed, 27 Nov 2024 07:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1732719858; x=1733324658;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sSpmbrE3NXfIYA4lszghmFKOuf7C0Mlau4VplMopA70=;
 b=DAabFWpVVY9w0XFjgo+r4d5WtNki4Af/tFJEb8od4ytI1yEMTuR+qF4jqEiiZUBMEI
 AVf7SRHIS1N/67E6M4mJymALNywzVsqe4+CB7qX849hRx5m9oCFC+0Ww3QOsUGW4d1mY
 xcY81HGA0N7G9OldTZkBjYegVcOl2y/jV0MCKwcgJLmWeZ1ds0HWdLFVM3zV8Q4U8wVb
 1qB77SR+FxfZLNHC/kfV6oiNs1Gl/iUwD1Fpd6m7ZB7GPxtF+xLKRAdUgc2XxsY1Yvjp
 g8rLQ8qx9IJKTSSWFkxPDFSSjmFeHvntIaMPOLStUiCNZp0rMZuab9fg6xKgjGUaAhSF
 53ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732719858; x=1733324658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sSpmbrE3NXfIYA4lszghmFKOuf7C0Mlau4VplMopA70=;
 b=OAgPAU+fMjbJbO+++VBA/FgsFHIalzUIuvdPCSRkkRHDwHusqq6QSYw5UHjJSNvK3k
 9aJnkZgzsfUKU7tXPPNyW+ccgmTyqe3q55ZsvdRapaVTZRBpwHRIUFOkpbSG1QN2c776
 uvydOwZnRF5AcWDRMklE62aDlVRbKYgPMlGMlmRfxWsQ+AW0ePii3htScp+S1aeq4Oa4
 wNue/t6WUZylJoDGWhuh+zZk9sulLSeS9xbipCfPXQ8ZEtySWIDgI6jkSTx6UQWy70fl
 AbvIv/ks+byh63Fq/gqkmS2zujKvlAkz64tSz/J8TxtaDtmju/fz8MZtiys4nc7mHGYJ
 ISQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsCSvkfgNRyAn2S3q4csr6BIZ/Y3nYu8IJl8OHcmDVZNKI0Ed0S8FsC4vp6ZOG5Kei4GNQ3RQfoA==@nongnu.org
X-Gm-Message-State: AOJu0YxnufPjdXfvqH1ZFLFBKtgU0lX1zp0WoyIqiRV3JkIvLnswiTqA
 //qVQPeoxsrr7bAZXsWLEOL6LULxWzlcP/6gtEWEEyDiIXJ9BdrF9rqLD2mdKg==
X-Gm-Gg: ASbGncsrC1ApLYtmkpv5/0/WqNDz4/ZDZMCQeCBbsr1VJXVAqOiWduECS9HjG+oID8y
 UQ/Xed7wrWGSl0aeB4ycaVxmsFpOUf45vwfFg68pqc8kpDjf4TzQZeUNsn4H8shz7IocIAj2ARL
 9caYT3waseU13NAD72mSDoZfgBxRLs1iAsEOX9sbP4Y6s6jfvhQn+h7MFOZAhhnifloMklT8/d+
 ybjvDeiLVqmZQYbS7jGDHnJK6CiDC3Bq0IpQOhc7Vna+GxaiYLQ8v1lWAeczrTyT+GBTqSA7fmg
 bBTa20RUPCOH5Jhk6EG0pfX+Bw==
X-Received: by 2002:a05:600c:1d03:b0:434:a367:2bd9 with SMTP id
 5b1f17b1804b1-434a9dc501bmr35860065e9.14.1732719851248; 
 Wed, 27 Nov 2024 07:04:11 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa7e256esm23339155e9.32.2024.11.27.07.04.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 27 Nov 2024 07:04:10 -0800 (PST)
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
Subject: [PATCH v11 04/15] hw/display/apple-gfx: Adds configurable mode list
Date: Wed, 27 Nov 2024 16:02:38 +0100
Message-Id: <20241127150249.50767-5-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241127150249.50767-1-phil@philjordan.eu>
References: <20241127150249.50767-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::332;
 envelope-from=phil@philjordan.eu; helo=mail-wm1-x332.google.com
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
X-TUID: PxQeHW4rquRm

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
index 5ff6a487cfc..765b210287d 100644
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
 
-    /* TODO: Property for setting mode list */
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
index c3ea98424e1..a5fc786f7b4 100644
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
-    NSArray<PGDisplayMode*>* mode_array;
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
@@ -732,6 +735,9 @@ bool apple_gfx_common_realize(AppleGFXState *s, DeviceState *dev,
                               PGDeviceDescriptor *desc, Error **errp)
 {
     PGDisplayDescriptor *disp_desc = nil;
+    const AppleGFXDisplayMode *display_modes = apple_gfx_default_modes;
+    uint32_t num_display_modes = ARRAY_SIZE(apple_gfx_default_modes);
+    NSArray<PGDisplayMode *> *mode_array;
 
     if (apple_gfx_mig_blocker == NULL) {
         error_setg(&apple_gfx_mig_blocker,
@@ -769,8 +775,99 @@ bool apple_gfx_common_realize(AppleGFXState *s, DeviceState *dev,
                                               port:0
                                          serialNum:next_pgdisplay_serial_num++];
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
2.39.5 (Apple Git-154)

