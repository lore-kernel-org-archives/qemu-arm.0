Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1500134njf;
        Tue, 3 Sep 2024 09:09:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXPSFWkNqqmRoO/7kaUjXXy3C/pt03IkC963CA551287574uKubY0Ei2Zbe7xRN76PwjRmemzMsqdP1hQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG7w7jjPkQe4wKp+vGO3XrAywCEElToiHDWBqqt6JbAvQkPDm62zKBBW0ao+yn2T4pG/zIu
X-Received: by 2002:a05:6808:14ce:b0:3d9:ed9e:ac0 with SMTP id 5614622812f47-3df1d6cb035mr13191587b6e.32.1725379749339;
        Tue, 03 Sep 2024 09:09:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725379749; cv=none;
        d=google.com; s=arc-20160816;
        b=em4x8/6lJnbwFj1UQqJVNqG/y4BRt2g076Qy2DtqIh5UPf2BhIoMV0uouUCwV6MOce
         wgBZcqRLinb0LbjxQdqbz6ToBx6mqdCasKDNJbpnCBL3sX2j5DpghYuLRDwf5T45MBcF
         JPg7zPZJ8GxwCSyIx3dph+62ZPFb2z18xyXqjmEKpNggI5U/iTerIWtAFyRml0vaFPYR
         0HYJO2OTInR4TksYzw2si+iS5/foFdKl5IdrzHsjRMP5n/YVqhV91wKgtjIfcVLG/KB5
         MSFlU2kiNazVimmrVd1saHbE/YtuFQ8y5KIyDRkLhLO8Jx3AF9IEBwO/HPYFXrMaiyJv
         P6LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qY0vkjfvPS3/ad2LMh+feVqt/PDo4lEoToYRvCJ2Ai0=;
        fh=wjix5by4SLqh6gBC0L0zD47cy6CEQTsdvAPV9bueD5s=;
        b=WbdSdxUMJhfTJPJnQEUrZUyYEdzgtrM7eVhd6VUIUaRa+euItTl+B/nSzur8IccFu4
         BX9SebiUaBksncav2jTdugFlDvslaqDI7MzopbAoAByrs0a5NcACiKLKOu7UTcMGs6ck
         1dFaWDaVcbFCCETmR3ZLque6cHGvpcS2E+DqOiYUQKzy153OBS7q+AOadeaheH0SN665
         mi6nnW0hpp+DT4fWEALdo3yJ4acTa7BAvSUdsySCkO0sK6xANFm27urM2kj2owmghU9o
         Oa+ku8T9bau0dLxh7XWj1FsPI22jl9nE+DcY5cxjKNykf9sU9utxGTb2pWBk0wxUndoN
         N8zA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JEVzMN57;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-846a9e021besi2361358241.201.2024.09.03.09.09.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 09:09:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JEVzMN57;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1slW5B-0007MI-07; Tue, 03 Sep 2024 12:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slW59-0007DJ-8T
 for qemu-devel@nongnu.org; Tue, 03 Sep 2024 12:08:39 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slW54-0002ox-7B
 for qemu-devel@nongnu.org; Tue, 03 Sep 2024 12:08:38 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42c5347b2f7so31165475e9.0
 for <qemu-devel@nongnu.org>; Tue, 03 Sep 2024 09:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725379713; x=1725984513; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qY0vkjfvPS3/ad2LMh+feVqt/PDo4lEoToYRvCJ2Ai0=;
 b=JEVzMN57IJ6W9/4alFcDUXeq7+5QTisCY5Sm6VBVpFiiTbFiEcGEPajW+WaMDuV0aJ
 qLdXQWR0w8FpeIfQTonf1kwrnmrf0ockbZYUKGqwmw7xkTk8buorEttSEPz7cB54ZFsi
 mxbKriRUMg2sz2sv0tpXXIKY6t0/VznckJXTxY3qqT/s8dMwcsdeRabXnO31kdWtwQuv
 L/Ujh6nKBXkXdLn0B0r24++2FS+WAUFRKha4uD1EnClImijumWS53t/iTolJ4ygD+cMj
 4Jfze79BooDqxbnabrdACobH43s8IsKDQKcoJ4CyTsk8IHGxbnC/YVRagxKTTmBXZi6m
 /eWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725379713; x=1725984513;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qY0vkjfvPS3/ad2LMh+feVqt/PDo4lEoToYRvCJ2Ai0=;
 b=Gjqz49aJoVVOLnaBYx2y9GSA23tx5cZjh0rRIEI7A08fnQPxNxUlOmWVxYz/Rxco+2
 G+GslvgkC2zZbp/EjPik6FAxM0/++dPtRgdSVXgPvdSTx4yc2z/jkPuR5miXp+lJNIkE
 YN2H332oAmdvUtsobkGqfS9wkjwB9LJ5ov2+Cj5rMQo0gvubkWg87xx6Rvgbjsxqtd4i
 9pSn5Qq4BUCqUnBTYne1lqQZhLr2ydsZAyKAci/HWogKLqtM6W5FmLIVBo+IzNxviSBb
 4uFAYZ4QEOIbmfWOrCkm/euHy0Gn+J4+uQShZXMjP8P1B/F6NeZdmw782bfhfhR38tp2
 lrOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGOluiDYfUa7enDGJ9A/pwfjlpeyxzx9WoIOWJHBNVqRDIfi8SCfoGEr5I5ZwdoEVkeIXDl+gdtLOt@nongnu.org
X-Gm-Message-State: AOJu0YyMmYST0VucCPuSCnWcmHGrwJUnmxPpeqCMwngiKe8LUlnOF6b8
 pE2Ox4/lw0uq6asL8eNalLyyfH1guPicG2k2qvTB3GcqDPaVsSVB3QrJBmQX02fxSN9VuE5z41r
 4
X-Received: by 2002:adf:f2d1:0:b0:374:c3f7:6af1 with SMTP id
 ffacd0b85a97d-374c3f76cd2mr5480480f8f.15.1725379712642; 
 Tue, 03 Sep 2024 09:08:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df1066sm175123065e9.18.2024.09.03.09.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 09:08:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-9.2 24/53] vl.c: Remove pxa2xx-specific -portrait and
 -rotate options
Date: Tue,  3 Sep 2024 17:07:22 +0100
Message-Id: <20240903160751.4100218-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903160751.4100218-1-peter.maydell@linaro.org>
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: +Pp2cWTMoyfN

We have two command line options that are specific to the now-removed
pxa2xx LCD display device, that allowed the user to rotate the
display output by 90, 180 or 270 degrees.  Since these are now
useless, we can remove them, and the corresponding code in ui/input.c
that transformed the input coordinates of mouse events to match the
rotation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Q: Do we need a separate deprecation period for these command
line options? They were only useful and only documented as
useful with the pxa2xx machines. Technically they did have an
undocumented effect with other display devices in that the
"rotate the input coordinates" part of the code would still
do something even if the display device doesn't rotate the
guest output. But that seems more like an unintended bug to me;
we should really have made the options error out if the display
device didn't handle them...
---
 include/sysemu/sysemu.h |  1 -
 system/globals.c        |  1 -
 system/vl.c             | 11 -----------
 ui/input.c              | 36 ------------------------------------
 qemu-options.hx         | 16 ----------------
 5 files changed, 65 deletions(-)

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
index 01b8b8e77ad..f5675214cc9 100644
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

