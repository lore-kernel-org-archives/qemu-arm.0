Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp813312njk;
        Fri, 29 Nov 2024 07:28:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU0JAsBNfOH4ukE7QTH1SWEw8hbSGxOp07mMRDw8Boh/hJQBx1Cn9f2R9at1X0+hxFNa+Oq++uTtq8WIQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFr/vYZupe+MkPrw9pNEjmRAGVOfWKlyEy0xVVqtEMErkU6mfd2IlWVXMGsJ2iJHLcvGvwj
X-Received: by 2002:a05:620a:4090:b0:7b5:1fa4:850e with SMTP id af79cd13be357-7b683a3728amr1572939985a.18.1732894134735;
        Fri, 29 Nov 2024 07:28:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732894134; cv=none;
        d=google.com; s=arc-20240605;
        b=OwGUQkdr3mXR/LBibyUZ3FDaN0VDgQQ6PejOOytcoV9h0pPbF1VPFixZo1dL2kzIGW
         QodQinuERLmKj+d9c81xBCLAEAJFA+rhfje33vn3nswY/2CvgcQqKwjTRz1nEOiBn6qv
         GlN+88P/BILASiojIU9I+7zsJjTXTKvb2SO/BVRiph8NRYbf6ZLVNKm5aWdlaK/SCown
         3QWFzZvWukSwaeWoArqdKbRXPf9WDSGAOhQthlu2ntdxU7rX3lPEyNy8/sekGOLLuUNo
         j98sg1VNLxjT50nAdkzYcHRWWH2OWepJeBXRTISaRU7r6rRtm04GofMOJSeWZeUIQuW0
         LH7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+MPJiljEcM6ITFug6ej2iX1WmZqreYNS2cUzWwjIj/0=;
        fh=/OoBEZ8YtFwRT8SGYk8/6nRUBBGFe6S1BvNo9ArX6Ag=;
        b=K2Dr4HDVOS2Kjt+rds2XJdgdHuM24aQjcUX9N1g4Qz0iJM6VWC/jl76SSmUuPgJ7VT
         GVNwVqJNP/eVsqAmHmAe4yC3nyOVRIRZbp8nfRTtmDw7xba6IJfr26vkFmOm6YnuzyYz
         QafAXMPLFxhY0JrupvQEZrTIzy2x9m9YJopH5Cf9utf+afoOYFkh9/KpB9qs2rSjRY9F
         YIWrvAo922xzuMZH7393DBN0G49rUya0KcR4m8jaEmt/Uj8VPegDknYHSrjBAKRA43Vl
         /NJVvnQpDEme+MDU3s3kEpIGMHMkVDSTKDJrMmlB664eXitN5zHgMbbezfsQbylpS4gg
         03dQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=JizvK1iq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849e631dsi485077185a.559.2024.11.29.07.28.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2024 07:28:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=JizvK1iq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tH2ru-0008J5-W8; Fri, 29 Nov 2024 10:25:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tH2rt-0008IB-TU
 for qemu-arm@nongnu.org; Fri, 29 Nov 2024 10:25:17 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tH2rq-000217-DS
 for qemu-arm@nongnu.org; Fri, 29 Nov 2024 10:25:17 -0500
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53df1d1b726so2434830e87.0
 for <qemu-arm@nongnu.org>; Fri, 29 Nov 2024 07:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1732893913; x=1733498713;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+MPJiljEcM6ITFug6ej2iX1WmZqreYNS2cUzWwjIj/0=;
 b=JizvK1iqpuOScek2aQII4h0GutKalL9RYD0KG2fasKho6YATAL1WA77STIzZLDfGl4
 VlY/1t5MIeEYcoKSPmMkKzJQNpVQi0Ksue54bRLvG/eD3g3WgUR4/LXS8j7H+12f6P6t
 Q70sRSMcbV6XlU1NLOQDa29nCD4JiaD6Rg48FSJqTo2ZgXPmSCmhTc65gXbk0Y9ILhjw
 jPdWhoUGUtTfgQEJJwN8pPyvAkpDtjo6QZi8BTD1FE94bSzhcgU2ldWOvGJT8R1qPzPZ
 akGV7tnFqL3DFqRTu8vaFf2ASP9hqgF/QSFLPycsw7pNhdYMTvXHFJVp4pYasiRIZcx5
 Ix2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732893913; x=1733498713;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+MPJiljEcM6ITFug6ej2iX1WmZqreYNS2cUzWwjIj/0=;
 b=QiBgCnXFs/l4oW8wnqbbGYHrLnDVGp6usN+mPxn7+oXDYd5EOdo5ysUgKpvIYUdua+
 m/ThQeqOz8pNotxylJjuVaDeMSZcI4Brmm8aGOIggyNIrltDNhuMksopeyUYI1TD5S6n
 QAOkxvEJCETvvuIM8sJD1FVXL69PyRDGAtQMzfzVgdmw8LoTb75LrOAAaip8R5W67+/A
 p9psz1NeJq8+xcpQ05HPc6ojrY8YIQzHb/Qis/sXHRJdSR+n9jHxZ1+M6/E7A2NODpyB
 gjwcl0z+DIQRUsWBGdVlbp94czEadhBETq1Ii2aw0waCHmyRhxH/9AWJeNt25Jh/GaTt
 uiLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6n7tvAdbv/Afy8PZtJtznHd9h6gGYzZ//mVpWj6ml3InSSesSO5l7caJBBoQyWR6fyOoQnarVBg==@nongnu.org
X-Gm-Message-State: AOJu0Yxt+xexPleU6dUFWzM0JjazKbr7rFYowtbpHLtWOpJqHyULbDt+
 1fGbaFOCBi3VgjjrduzB7Rnc4uzRTVJypaQtZh/D6gjwJH9r2BvJKUx0Ai+gSQ==
X-Gm-Gg: ASbGncsg7eC8RuIptuHXACYmQiWQAKr5q/GtTVWdmJH3FLRlb0EKaorL00Zp/9CnXcp
 n2KEyf9dS69ve0j+vbcmXtxvqiqBcAt9etk1vzhWcc8VTkzDokOTXISHeG38QN4ZqseiJl3wSJ3
 cejuK4cTQqj/uKY/PzXpeG7rJj6JH2lEHMOkIDX0c2l+vcdXRTTCxgkBd93lc5HXMOMM01agnYH
 OOepqBeONyHH54NwNdtLEuNsoC3Fcb7BHLGX2ie23WqV7icSN2tb0yXHCx9vA1SpQ9s4o8+mEK/
 2O8dS6nJnJFh4LUIm6QPuEyY7g==
X-Received: by 2002:a05:6512:2309:b0:539:8a9a:4e63 with SMTP id
 2adb3069b0e04-53df01046eamr7411296e87.42.1732893912591; 
 Fri, 29 Nov 2024 07:25:12 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ccd2db2dsm4685119f8f.14.2024.11.29.07.25.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 Nov 2024 07:25:12 -0800 (PST)
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
Subject: [PATCH v12 01/15] ui & main loop: Redesign of system-specific main
 thread event handling
Date: Fri, 29 Nov 2024 16:24:52 +0100
Message-Id: <20241129152506.59390-2-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241129152506.59390-1-phil@philjordan.eu>
References: <20241129152506.59390-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::131;
 envelope-from=phil@philjordan.eu; helo=mail-lf1-x131.google.com
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
X-TUID: M1Rmz0zYWou6

macOS's Cocoa event handling must be done on the initial (main) thread
of the process. Furthermore, if library or application code uses
libdispatch, the main dispatch queue must be handling events on the main
thread as well.

So far, this has affected Qemu in both the Cocoa and SDL UIs, although
in different ways: the Cocoa UI replaces the default qemu_main function
with one that spins Qemu's internal main event loop off onto a
background thread. SDL (which uses Cocoa internally) on the other hand
uses a polling approach within Qemu's main event loop. Events are
polled during the SDL UI's dpy_refresh callback, which happens to run
on the main thread by default.

As UIs are mutually exclusive, this works OK as long as nothing else
needs platform-native event handling. In the next patch, a new device is
introduced based on the ParavirtualizedGraphics.framework in macOS.
This uses libdispatch internally, and only works when events are being
handled on the main runloop. With the current system, it works when
using either the Cocoa or the SDL UI. However, it does not when running
headless. Moreover, any attempt to install a similar scheme to the
Cocoa UI's main thread replacement fails when combined with the SDL
UI.

This change tidies up main thread management to be more flexible.

 * The qemu_main global function pointer is a custom function for the
   main thread, and it may now be NULL. When it is, the main thread
   runs the main Qemu loop. This represents the traditional setup.
 * When non-null, spawning the main Qemu event loop on a separate
   thread is now done centrally rather than inside the Cocoa UI code.
 * For most platforms, qemu_main is indeed NULL by default, but on
   Darwin, it defaults to a function that runs the CFRunLoop.
 * The Cocoa UI sets qemu_main to a function which runs the
   NSApplication event handling runloop, as is usual for a Cocoa app.
 * The SDL UI overrides the qemu_main function to NULL, thus
   specifying that Qemu's main loop must run on the main
   thread.
 * The GTK UI also overrides the qemu_main function to NULL.
 * For other UIs, or in the absence of UIs, the platform's default
   behaviour is followed.

This means that on macOS, the platform's runloop events are always
handled, regardless of chosen UI. The new PV graphics device will
thus work in all configurations. There is no functional change on other
operating systems.

Implementing this via a global function pointer variable is a bit
ugly, but it's probably worth investigating the existing UI thread rule
violations in the SDL (e.g. #2537) and GTK+ back-ends. Fixing those
issues might precipitate requirements similar but not identical to those
of the Cocoa UI; hopefully we'll see some kind of pattern emerge, which
can then be used as a basis for an overhaul. (In fact, it may turn
out to be simplest to split the UI/native platform event thread from the
QEMU main event loop on all platforms, with any UI or even none at all.)

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
---

v5:

 * Simplified the way of setting/clearing the main loop by going back
   to setting qemu_main directly, but narrowing the scope of what it
   needs to do, and it can now be NULL.

v6:

 * Folded function qemu_run_default_main_on_new_thread's code into
   main()
 * Removed whitespace changes left over on lines near code removed
   between v4 and v5

v9:

 * Set qemu_main to NULL for GTK UI as well.

v10:

 * Added comments clarifying the functionality and purpose of qemu_main.

v11:

 * Removed the qemu_main_fn typedef again.
 * Consolidation of main, qemu_default_main, and call_qemu_default_main
   so that the latter has been eliminated altogether.
 * Reinstated the #include <SDL.h> directive, added comment saying
   why it's needed.
 * Improved the comment on the qemu_main global variable.
 * Expanded the commit message.

v12:

 * More precise wording of code comments.

 include/qemu-main.h | 14 +++++++++++-
 system/main.c       | 37 +++++++++++++++++++++++++++----
 ui/cocoa.m          | 54 +++++++++++----------------------------------
 ui/gtk.c            |  4 ++++
 ui/sdl2.c           |  4 ++++
 5 files changed, 67 insertions(+), 46 deletions(-)

diff --git a/include/qemu-main.h b/include/qemu-main.h
index 940960a7dbc..2ee83bedff3 100644
--- a/include/qemu-main.h
+++ b/include/qemu-main.h
@@ -5,7 +5,19 @@
 #ifndef QEMU_MAIN_H
 #define QEMU_MAIN_H
 
-int qemu_default_main(void);
+/*
+ * The function to run on the main (initial) thread of the process.
+ * NULL means QEMU's main event loop.
+ * When non-NULL, QEMU's main event loop will run on a purposely created
+ * thread, after which the provided function pointer will be invoked on
+ * the initial thread.
+ * This is useful on platforms which treat the main thread as special
+ * (macOS/Darwin) and/or require all UI API calls to occur from the main
+ * thread. Those platforms can initialise it to a specific function,
+ * while UI implementations may reset it to NULL during their init if they
+ * will handle system and UI events on the main thread via QEMU's own main
+ * event loop.
+ */
 extern int (*qemu_main)(void);
 
 #endif /* QEMU_MAIN_H */
diff --git a/system/main.c b/system/main.c
index 9b91d21ea8c..668d0ecfe8c 100644
--- a/system/main.c
+++ b/system/main.c
@@ -24,26 +24,55 @@
 
 #include "qemu/osdep.h"
 #include "qemu-main.h"
+#include "qemu/main-loop.h"
 #include "sysemu/sysemu.h"
 
 #ifdef CONFIG_SDL
+/*
+ * SDL insists on wrapping the main() function with its own implementation on
+ * some platforms; it does so via a macro that renames our main function, so
+ * <SDL.h> must be #included here even with no SDL code called from this file.
+ */
 #include <SDL.h>
 #endif
 
-int qemu_default_main(void)
+#ifdef CONFIG_DARWIN
+#include <CoreFoundation/CoreFoundation.h>
+#endif
+
+static void *qemu_default_main(void *opaque)
 {
     int status;
 
+    bql_lock();
     status = qemu_main_loop();
     qemu_cleanup(status);
+    bql_unlock();
 
-    return status;
+    exit(status);
 }
 
-int (*qemu_main)(void) = qemu_default_main;
+int (*qemu_main)(void);
+
+#ifdef CONFIG_DARWIN
+static int os_darwin_cfrunloop_main(void)
+{
+    CFRunLoopRun();
+    g_assert_not_reached();
+}
+int (*qemu_main)(void) = os_darwin_cfrunloop_main;
+#endif
 
 int main(int argc, char **argv)
 {
     qemu_init(argc, argv);
-    return qemu_main();
+    bql_unlock();
+    if (qemu_main) {
+        QemuThread main_loop_thread;
+        qemu_thread_create(&main_loop_thread, "qemu_main",
+                           qemu_default_main, NULL, QEMU_THREAD_DETACHED);
+        return qemu_main();
+    } else {
+        qemu_default_main(NULL);
+    }
 }
diff --git a/ui/cocoa.m b/ui/cocoa.m
index 4c2dd335323..30b8920d929 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -73,6 +73,8 @@
     int height;
 } QEMUScreen;
 
+@class QemuCocoaPasteboardTypeOwner;
+
 static void cocoa_update(DisplayChangeListener *dcl,
                          int x, int y, int w, int h);
 
@@ -107,6 +109,7 @@ static void cocoa_switch(DisplayChangeListener *dcl,
 static NSInteger cbchangecount = -1;
 static QemuClipboardInfo *cbinfo;
 static QemuEvent cbevent;
+static QemuCocoaPasteboardTypeOwner *cbowner;
 
 // Utility functions to run specified code block with the BQL held
 typedef void (^CodeBlock)(void);
@@ -1321,8 +1324,10 @@ - (void) dealloc
 {
     COCOA_DEBUG("QemuCocoaAppController: dealloc\n");
 
-    if (cocoaView)
-        [cocoaView release];
+    [cocoaView release];
+    [cbowner release];
+    cbowner = nil;
+
     [super dealloc];
 }
 
@@ -1938,8 +1943,6 @@ - (void)pasteboard:(NSPasteboard *)sender provideDataForType:(NSPasteboardType)t
 
 @end
 
-static QemuCocoaPasteboardTypeOwner *cbowner;
-
 static void cocoa_clipboard_notify(Notifier *notifier, void *data);
 static void cocoa_clipboard_request(QemuClipboardInfo *info,
                                     QemuClipboardType type);
@@ -2002,43 +2005,8 @@ static void cocoa_clipboard_request(QemuClipboardInfo *info,
     }
 }
 
-/*
- * The startup process for the OSX/Cocoa UI is complicated, because
- * OSX insists that the UI runs on the initial main thread, and so we
- * need to start a second thread which runs the qemu_default_main():
- * in main():
- *  in cocoa_display_init():
- *   assign cocoa_main to qemu_main
- *   create application, menus, etc
- *  in cocoa_main():
- *   create qemu-main thread
- *   enter OSX run loop
- */
-
-static void *call_qemu_main(void *opaque)
-{
-    int status;
-
-    COCOA_DEBUG("Second thread: calling qemu_default_main()\n");
-    bql_lock();
-    status = qemu_default_main();
-    bql_unlock();
-    COCOA_DEBUG("Second thread: qemu_default_main() returned, exiting\n");
-    [cbowner release];
-    exit(status);
-}
-
 static int cocoa_main(void)
 {
-    QemuThread thread;
-
-    COCOA_DEBUG("Entered %s()\n", __func__);
-
-    bql_unlock();
-    qemu_thread_create(&thread, "qemu_main", call_qemu_main,
-                       NULL, QEMU_THREAD_DETACHED);
-
-    // Start the main event loop
     COCOA_DEBUG("Main thread: entering OSX run loop\n");
     [NSApp run];
     COCOA_DEBUG("Main thread: left OSX run loop, which should never happen\n");
@@ -2120,8 +2088,6 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
 
     COCOA_DEBUG("qemu_cocoa: cocoa_display_init\n");
 
-    qemu_main = cocoa_main;
-
     // Pull this console process up to being a fully-fledged graphical
     // app with a menubar and Dock icon
     ProcessSerialNumber psn = { 0, kCurrentProcess };
@@ -2185,6 +2151,12 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
     qemu_clipboard_peer_register(&cbpeer);
 
     [pool release];
+
+    /*
+     * The Cocoa UI will run the NSApplication runloop on the main thread
+     * rather than the default Core Foundation one.
+     */
+    qemu_main = cocoa_main;
 }
 
 static QemuDisplay qemu_display_cocoa = {
diff --git a/ui/gtk.c b/ui/gtk.c
index bf9d3dd679a..c8dcd95350c 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -38,6 +38,7 @@
 #include "qemu/cutils.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
+#include "qemu-main.h"
 
 #include "ui/console.h"
 #include "ui/gtk.h"
@@ -2485,6 +2486,9 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
 #ifdef CONFIG_GTK_CLIPBOARD
     gd_clipboard_init(s);
 #endif /* CONFIG_GTK_CLIPBOARD */
+
+    /* GTK's event polling must happen on the main thread. */
+    qemu_main = NULL;
 }
 
 static void early_gtk_display_init(DisplayOptions *opts)
diff --git a/ui/sdl2.c b/ui/sdl2.c
index bd4f5a9da14..44ab2762262 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -34,6 +34,7 @@
 #include "sysemu/sysemu.h"
 #include "ui/win32-kbd-hook.h"
 #include "qemu/log.h"
+#include "qemu-main.h"
 
 static int sdl2_num_outputs;
 static struct sdl2_console *sdl2_console;
@@ -965,6 +966,9 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
     }
 
     atexit(sdl_cleanup);
+
+    /* SDL's event polling (in dpy_refresh) must happen on the main thread. */
+    qemu_main = NULL;
 }
 
 static QemuDisplay qemu_display_sdl2 = {
-- 
2.39.5 (Apple Git-154)

