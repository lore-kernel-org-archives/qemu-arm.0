Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp1457796njl;
        Thu, 3 Oct 2024 07:02:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU8I9ec7zTKvnEWU/Dn++0ax7apKe+b9hVXOkfOd+bJkQESFswAN8UMInFtZL0MoY4vTBLhkOFIzjH3wA==@linaro.org
X-Google-Smtp-Source: AGHT+IG1G3DF6zOrKc9XfeB07qUsSnKtKPS/SBMsw4H0k4kdp8f7MO12OOsh/hwHRwLndZN7X+tY
X-Received: by 2002:a05:620a:2946:b0:7ac:b2d6:9ccf with SMTP id af79cd13be357-7ae62742f89mr1149484185a.61.1727964155319;
        Thu, 03 Oct 2024 07:02:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727964155; cv=none;
        d=google.com; s=arc-20240605;
        b=Y0lAZVnWw2qYYMKsLuK4ch25obcuFuBe5TmwAJEiB4nTdOovjMnFtR2aT1S+Pp30Z5
         ugb9bW/jHIBp9iQA5ZcA/YQLdNZIpb5mPAivHqk4hG39+GWzXSPKcerusSYBsvexJjIz
         Ixl2hdIDwojbEHRVqwtwIOvlEERCs9nBpSXnvRgwrjAQ+B/+mv8xJaoP7jNSDjsSHtwO
         izt+X4FNc0D5rM2rGsdx85FBmFAzmpisH6yb8QULAAUoHNLrynWPi0qyrlzZq3XS/xtx
         XG9TpjRSo1gZRa5JFTj0+JHjW5uiiUfKkMF0oUl3QWnJSqQ783jYNbGnafHLPPKjV3N2
         DFeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/NdtSVHO79et12wC7mRevKMLx4j9u2HZmS8+HJMur2g=;
        fh=dLP/YLBjMZxhHfH1sS7Ziu5zNyswdPoi/by3dAcRF0o=;
        b=g6MkIeVZW2eEJwxtgS5RSCKSkLhgbELUl0TUPQbz0fZ2MAYhTilX07ubPqmGPKW7dS
         hkDMowChTBKZ74/0lt40GnmvDXiMFQDT96gY56nHP3WNRJrybj5kByVNGnk8W2U4GdxR
         8VRRC8Au4MTxFpDFqJZSGeDQWh5bFEmu02CsUOs2dabvw8SDwbbXXOl6QNUcZq7u3j+O
         43JgSNA2Qz6EVx4lGcIPqmXLj9SDr5oK41G+mFop/Uk6nLVMKmhTM1lrL2ECMDvwVr5B
         /RvZOzcUpBUmFUr6vSuHwpeQCO5yCCmFbxqV3q3NjJMacQC0vgVYQHgArECUQgbBgw72
         llBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fik2p2y4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae6bb066desi105908085a.591.2024.10.03.07.02.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2024 07:02:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fik2p2y4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swMO8-0004Ht-1y; Thu, 03 Oct 2024 10:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swMNS-00047H-Mj
 for qemu-arm@nongnu.org; Thu, 03 Oct 2024 10:00:26 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swMNO-0002rm-FN
 for qemu-arm@nongnu.org; Thu, 03 Oct 2024 10:00:21 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42cb7a2e4d6so10302285e9.0
 for <qemu-arm@nongnu.org>; Thu, 03 Oct 2024 07:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727964017; x=1728568817; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/NdtSVHO79et12wC7mRevKMLx4j9u2HZmS8+HJMur2g=;
 b=Fik2p2y4e8bfjLBLZoePIJA+OcBr5qffo7kBeyD2APPYg19agQI22883QKHqHZg42T
 F8TK1u7Pq8t6tZbpdTqpuuYzrErmW3O1+BX4jCWrUA1uswWZhuG0MNsjzON+aF/NAXV+
 joXjViGMmuNvEd1aauhcnGRK7lQ+xnN0reLBOWx6GOJ91LPSZD3nFnD98dD8MrSSjB6B
 85e84d69BVCQmsfSjoCxGveig83QhybmC99UkQYBH4RebJedGfwfaVC/IUC/tYqy7Is0
 YxZuiGJmr/We5MMMA4ka07mqScE5o1rNWspAnZJw31nuarBFjjQPu3FLhyP3ZV3R9+C2
 eDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727964017; x=1728568817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/NdtSVHO79et12wC7mRevKMLx4j9u2HZmS8+HJMur2g=;
 b=qscuujVft32qfbvLYljj+61jk7ONsOqMNrrMTwnmC0MlhzwIhXtTocWpPp7wJIvXNK
 N/Hr0CC2+VvFoosTpLJREjxVQdARzVFDX4HZcWBiLVBOsA6KnboQ+Yr+kCv/r6HbvVG9
 MW591FBFIhWaiz1iPT5IFIbsclQgtsFtOAytcvwDclUB+OE0xw67ouhLieqeRVLReUhw
 EzO9Qq530fpAmbA2hVsjnL27DgKaecXwmx8u2F7lmKG9cstn42r66IGDLouu06FBHByy
 VZtzV0XnP7xJI0fiIF20Molnn+jTbhu7u42VPQSYnp1ggPBjTs+se5t1eAghkfD7lYkD
 k7NQ==
X-Gm-Message-State: AOJu0Yx7Pw8ZTnXYlJbV1PComjd1h8hecnunQASPfG4fxxdKEQIO0ME0
 qp4Vp9eh6lG5Rj2+T2Zc0ZpSLwFPeAoJI8gkYHLnelVzpXFd7OLJGHzhqQ7osUogtF2mfbYUsuG
 +
X-Received: by 2002:a05:600c:4f10:b0:42c:b5f1:4508 with SMTP id
 5b1f17b1804b1-42f778f360emr45374425e9.23.1727964016820; 
 Thu, 03 Oct 2024 07:00:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d0822bc38sm1340255f8f.45.2024.10.03.07.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 07:00:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 6/6] vl.c: Remove pxa2xx-specific -portrait and -rotate
 options
Date: Thu,  3 Oct 2024 15:00:10 +0100
Message-Id: <20241003140010.1653808-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003140010.1653808-1-peter.maydell@linaro.org>
References: <20241003140010.1653808-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: CYlpJLhcykWU

The ``-portrait`` and ``-rotate`` options were documented as only
working with the PXA LCD device, and all the machine types using
that display device were removed in 9.2.

These options were intended to simulate a mobile device being
rotated by the user, and had three effects:
 * the display output was rotated by 90, 180 or 270 degrees
   (implemented in the PXA display device models)
 * the mouse/trackpad input was rotated the opposite way
   (implemented in generic code)
 * the machine model would signal to the guest about its
   orientation
   (implemented by e.g. the spitz machine model)

Of these three things, the input-rotation was coded without being
restricted to boards which supported the full set of device-rotation
handling, so in theory the options were usable on other machine
models with odd effects (rotating input but not display output).  But
this was never intended or documented behaviour, so we can reasonably
drop these command line arguments without a formal deprecate-and-drop
cycle for them.

Remove the options, and their implementation and documentation.
Describe the removal in removed-features.rst.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/about/removed-features.rst | 22 ++++++++++++++++++++
 include/sysemu/sysemu.h         |  1 -
 system/globals.c                |  1 -
 system/vl.c                     | 11 ----------
 ui/input.c                      | 36 ---------------------------------
 qemu-options.hx                 | 16 ---------------
 6 files changed, 22 insertions(+), 65 deletions(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 6e96cd067fa..567e653e1d3 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -517,6 +517,28 @@ The virtio-blk SCSI passthrough feature is a legacy VIRTIO feature.  VIRTIO 1.0
 and later do not support it because the virtio-scsi device was introduced for
 full SCSI support.  Use virtio-scsi instead when SCSI passthrough is required.
 
+``-portrait`` and ``-rotate`` (since 9.2)
+'''''''''''''''''''''''''''''''''''''''''
+
+The ``-portrait`` and ``-rotate`` options were documented as only
+working with the PXA LCD device, and all the machine types using
+that display device were removed in 9.2, so these options also
+have been dropped.
+
+These options were intended to simulate a mobile device being
+rotated by the user, and had three effects:
+
+* the display output was rotated by 90, 180 or 270 degrees
+* the mouse/trackpad input was rotated the opposite way
+* the machine model would signal to the guest about its
+  orientation
+
+Of these three things, the input-rotation was coded without being
+restricted to boards which supported the full set of device-rotation
+handling, so in theory the options were usable on other machine models
+to produce an odd effect (rotating input but not display output). But
+this was never intended or documented behaviour, so we have dropped
+the options along with the machine models they were intended for.
 
 User-mode emulator command line arguments
 -----------------------------------------
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 5b4397eeb80..7ec419ce132 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -41,7 +41,6 @@ extern int graphic_height;
 extern int graphic_depth;
 extern int display_opengl;
 extern const char *keyboard_layout;
-extern int graphic_rotate;
 extern int old_param;
 extern uint8_t *boot_splash_filedata;
 extern bool enable_mlock;
diff --git a/system/globals.c b/system/globals.c
index d602a04fa28..84ce943ac96 100644
--- a/system/globals.c
+++ b/system/globals.c
@@ -40,7 +40,6 @@ int autostart = 1;
 int vga_interface_type = VGA_NONE;
 bool vga_interface_created;
 Chardev *parallel_hds[MAX_PARALLEL_PORTS];
-int graphic_rotate;
 QEMUOptionRom option_rom[MAX_OPTION_ROMS];
 int nb_option_roms;
 int old_param;
diff --git a/system/vl.c b/system/vl.c
index fe547ca47c2..e83b3b2608b 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -2910,17 +2910,6 @@ void qemu_init(int argc, char **argv)
                 nographic = true;
                 dpy.type = DISPLAY_TYPE_NONE;
                 break;
-            case QEMU_OPTION_portrait:
-                graphic_rotate = 90;
-                break;
-            case QEMU_OPTION_rotate:
-                graphic_rotate = strtol(optarg, (char **) &optarg, 10);
-                if (graphic_rotate != 0 && graphic_rotate != 90 &&
-                    graphic_rotate != 180 && graphic_rotate != 270) {
-                    error_report("only 90, 180, 270 deg rotation is available");
-                    exit(1);
-                }
-                break;
             case QEMU_OPTION_kernel:
                 qdict_put_str(machine_opts_dict, "kernel", optarg);
                 break;
diff --git a/ui/input.c b/ui/input.c
index dc745860f48..7ddefebc439 100644
--- a/ui/input.c
+++ b/ui/input.c
@@ -174,37 +174,6 @@ void qmp_input_send_event(const char *device,
     qemu_input_event_sync();
 }
 
-static int qemu_input_transform_invert_abs_value(int value)
-{
-  return (int64_t)INPUT_EVENT_ABS_MAX - value + INPUT_EVENT_ABS_MIN;
-}
-
-static void qemu_input_transform_abs_rotate(InputEvent *evt)
-{
-    InputMoveEvent *move = evt->u.abs.data;
-    switch (graphic_rotate) {
-    case 90:
-        if (move->axis == INPUT_AXIS_X) {
-            move->axis = INPUT_AXIS_Y;
-        } else if (move->axis == INPUT_AXIS_Y) {
-            move->axis = INPUT_AXIS_X;
-            move->value = qemu_input_transform_invert_abs_value(move->value);
-        }
-        break;
-    case 180:
-        move->value = qemu_input_transform_invert_abs_value(move->value);
-        break;
-    case 270:
-        if (move->axis == INPUT_AXIS_X) {
-            move->axis = INPUT_AXIS_Y;
-            move->value = qemu_input_transform_invert_abs_value(move->value);
-        } else if (move->axis == INPUT_AXIS_Y) {
-            move->axis = INPUT_AXIS_X;
-        }
-        break;
-    }
-}
-
 static void qemu_input_event_trace(QemuConsole *src, InputEvent *evt)
 {
     const char *name;
@@ -340,11 +309,6 @@ void qemu_input_event_send_impl(QemuConsole *src, InputEvent *evt)
 
     qemu_input_event_trace(src, evt);
 
-    /* pre processing */
-    if (graphic_rotate && (evt->type == INPUT_EVENT_KIND_ABS)) {
-            qemu_input_transform_abs_rotate(evt);
-    }
-
     /* send event */
     s = qemu_input_find_handler(1 << evt->type, src);
     if (!s) {
diff --git a/qemu-options.hx b/qemu-options.hx
index d94e2cbbaeb..d013742e4a3 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2377,22 +2377,6 @@ SRST
         pick the first available. (Since 2.9)
 ERST
 
-DEF("portrait", 0, QEMU_OPTION_portrait,
-    "-portrait       rotate graphical output 90 deg left (only PXA LCD)\n",
-    QEMU_ARCH_ALL)
-SRST
-``-portrait``
-    Rotate graphical output 90 deg left (only PXA LCD).
-ERST
-
-DEF("rotate", HAS_ARG, QEMU_OPTION_rotate,
-    "-rotate <deg>   rotate graphical output some deg left (only PXA LCD)\n",
-    QEMU_ARCH_ALL)
-SRST
-``-rotate deg``
-    Rotate graphical output some deg left (only PXA LCD).
-ERST
-
 DEF("vga", HAS_ARG, QEMU_OPTION_vga,
     "-vga [std|cirrus|vmware|qxl|xenfb|tcx|cg3|virtio|none]\n"
     "                select video card type\n", QEMU_ARCH_ALL)
-- 
2.34.1

