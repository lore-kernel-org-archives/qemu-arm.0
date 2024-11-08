Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp4965788njc;
        Fri, 8 Nov 2024 06:48:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWScaaPOII9MiNbbdDzbSmQy4Ny8Z552JfcoqNMpvG2kRxTBplxPSSZTPyBSHrjvPf8FqTS9peZJrIN+g==@linaro.org
X-Google-Smtp-Source: AGHT+IEIzpBga+Vw108mPHiZEwtpn14ZIhHTalMLskdGvKR0pPwE3G2ZDYK45Wx34U+5vYELWdW8
X-Received: by 2002:a05:622a:19a8:b0:458:5ed8:628 with SMTP id d75a77b69052e-46309319366mr41028601cf.2.1731077311645;
        Fri, 08 Nov 2024 06:48:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731077311; cv=none;
        d=google.com; s=arc-20240605;
        b=bjHPDsjJpWMT5XGSfAt0lMt9olqpvKEV7wjI7X8i+KSlnqOhUZqQc+hhN5pIv4iStI
         DFGNMNNhVe/XqSdyey+C94SGkqDALDlnKi3O9YqRR6qOs3WJurMjxgMJHh8eP34pTnk/
         6aavBAnIAI0Mga2GVy5linTB6wc6Fz4ONJaW61EeufpXtwYv8j8/GnoNkKDHaPODLt8J
         hLOt0LZB47GsXnxE2KOBiglgenRym2HxmkfzRPdMcX1Pda8eBB5g/90QTJ2r4BCS0V1U
         Uh3IBd+FvAdcZkncNgH3pRiccyakmqw5FmZDDEZRgSpJf/9VwLQdWCjNWAbQp+xfDfWD
         i/rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=P1Mki2ASEXCuT1yBzicaDYo4K1od7wuFNaDsUDLA72A=;
        fh=aLzVjLTcv4sU5YAqA3NNWG3mKOnVKPaEASLSjZOpGiw=;
        b=RyZN2ad1C2Z520dg6zEeubLVCgdfNlbzIjRLjImTx9AZfXnwd4moP/N+AFkzW51OOA
         jTPWi8DgBMy2b3Q4tWyEyXhUkb51GQulhrW4KfKc7OL2KirxbwyQyB9nmvZaMU56KAmo
         GRMD2aAK9xHXt7P3RZCfu7gnSR6aiwoFgvVWrd2G5t+CVrMQYKPrycW1IknDV6he8prL
         f9D2xrf5C71hfBuNnBSJd3ifqx13tsAqqMvQPgnXqdsrX8SwD2xrIG0WhaTEbSrQ97oo
         2QDRNLT0zYgduPweQZrmCTmBgzWdsP1/Q4aUYUqjzaZLv6kCBVm7eGsddGjhH9U5puPt
         NDvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=qvT3mjnL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff5c8fcasi40206271cf.220.2024.11.08.06.48.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2024 06:48:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=qvT3mjnL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t9QGh-00044R-2U; Fri, 08 Nov 2024 09:47:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t9QGe-000427-O6
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 09:47:20 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t9QGb-0005Ez-OT
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 09:47:20 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c9c28c1e63so2707519a12.0
 for <qemu-arm@nongnu.org>; Fri, 08 Nov 2024 06:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1731077236; x=1731682036;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P1Mki2ASEXCuT1yBzicaDYo4K1od7wuFNaDsUDLA72A=;
 b=qvT3mjnLVZkQhDkQsp0pXsV31KHsKn9HzorEK6QZG4al2BDgD70QsYeMsJx4MI4jDU
 i8UhSsMYbYCvMQvP/vGeic3bcy9iBV+lSF3DHx8b2QfRwvG1pKeBJ1FAG7VbLByMPK0q
 /MooYhiASdW/wc1b6lPt3YVyCYVdrLfGTnt/Pf9rOo0vd9PjoqhmgERoQFsqPd1sWeWV
 xZvFg/ZaDYXXAjAK3yj8gN3fDMDhMcYt6FjelHmPOqjQuned1IYiXP9cvbsxSPbx6CSR
 EqgxEt1pMbW4H6GmRa/BzO90nso/GkrzjCuXmXM2U/bt5fFRKjbTi59XxSNw5eMww3ZQ
 ahOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731077236; x=1731682036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P1Mki2ASEXCuT1yBzicaDYo4K1od7wuFNaDsUDLA72A=;
 b=G3jEkPuUBYQAAyQPtZg1vkBpfeZAeYVeZTNH1SUfKcYZYkJ4GujWO3H4yAQcwF9Pvw
 sfCI59eYiQdhbiy8DDvNXr9iCas1BG+frKJSZl+y6H2D8PmaeBnNRFCZmMK261dytY9R
 5lbrMaoaLpAHV8R40aDVATAzOYUG+Cjd1FCGzMv4rqeJrxbWcJFnxHWnVdoVVzG9TUxf
 w00xKAyWrKqfrcsXWbI3+RZACh6qEZteuZe8mNEZfVfcWzdoctaom4JhEQR4SreWHW9y
 nhyywpb4aKDIv4qNRXK1oo/u4GPEKQ+LOem7gVFPTMFbJTMI1PH035QHgnpoYKVGl/MU
 T2ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhcD23f0rS4SOLvkxxONf0ATGxPL3HWSP1dzUCRPZmamYa4zUMjoZWKpfh8W9CmBUiHUaRlOXS0g==@nongnu.org
X-Gm-Message-State: AOJu0YyL1hjtZdJGE9zHbO7RFd+02NbEU8uEFz0sW+GkR46oEPbRXLct
 vZpk/ZqzMYsTb37HMLqvCxYOeZuS8YaC1K9YSow3rcvCZj22Ed7UR8u2gp1ghQ==
X-Received: by 2002:a17:906:c112:b0:a99:6036:90a with SMTP id
 a640c23a62f3a-a9eeff0d262mr278255366b.14.1731077236087; 
 Fri, 08 Nov 2024 06:47:16 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a4a9b1sm240534066b.52.2024.11.08.06.47.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 08 Nov 2024 06:47:15 -0800 (PST)
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
Subject: [PATCH v8 01/15] ui & main loop: Redesign of system-specific main
 thread event handling
Date: Fri,  8 Nov 2024 15:46:55 +0100
Message-Id: <20241108144709.95498-2-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241108144709.95498-1-phil@philjordan.eu>
References: <20241108144709.95498-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::52a;
 envelope-from=phil@philjordan.eu; helo=mail-ed1-x52a.google.com
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
X-TUID: m3i6r73A3+bx

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
 * For other UIs, or in the absence of UIs, the platform's default
   behaviour is followed.

This means that on macOS, the platform's runloop events are always
handled, regardless of chosen UI. The new PV graphics device will
thus work in all configurations. There is no functional change on other
operating systems.

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
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

 include/qemu-main.h     |  3 +--
 include/qemu/typedefs.h |  1 +
 system/main.c           | 50 ++++++++++++++++++++++++++++++++++----
 ui/cocoa.m              | 54 ++++++++++-------------------------------
 ui/sdl2.c               |  4 +++
 5 files changed, 64 insertions(+), 48 deletions(-)

diff --git a/include/qemu-main.h b/include/qemu-main.h
index 940960a7dbc..4bd0d667edc 100644
--- a/include/qemu-main.h
+++ b/include/qemu-main.h
@@ -5,7 +5,6 @@
 #ifndef QEMU_MAIN_H
 #define QEMU_MAIN_H
 
-int qemu_default_main(void);
-extern int (*qemu_main)(void);
+extern qemu_main_fn qemu_main;
 
 #endif /* QEMU_MAIN_H */
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 3d84efcac47..b02cfe1f328 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -131,5 +131,6 @@ typedef struct IRQState *qemu_irq;
  * Function types
  */
 typedef void (*qemu_irq_handler)(void *opaque, int n, int level);
+typedef int (*qemu_main_fn)(void);
 
 #endif /* QEMU_TYPEDEFS_H */
diff --git a/system/main.c b/system/main.c
index 9b91d21ea8c..d9397a6d5d0 100644
--- a/system/main.c
+++ b/system/main.c
@@ -24,13 +24,14 @@
 
 #include "qemu/osdep.h"
 #include "qemu-main.h"
+#include "qemu/main-loop.h"
 #include "sysemu/sysemu.h"
 
-#ifdef CONFIG_SDL
-#include <SDL.h>
+#ifdef CONFIG_DARWIN
+#include <CoreFoundation/CoreFoundation.h>
 #endif
 
-int qemu_default_main(void)
+static int qemu_default_main(void)
 {
     int status;
 
@@ -40,10 +41,49 @@ int qemu_default_main(void)
     return status;
 }
 
-int (*qemu_main)(void) = qemu_default_main;
+/*
+ * Various macOS system libraries, including the Cocoa UI and anything using
+ * libdispatch, such as ParavirtualizedGraphics.framework, requires that the
+ * main runloop, on the main (initial) thread be running or at least regularly
+ * polled for events. A special mode is therefore supported, where the QEMU
+ * main loop runs on a separate thread and the main thread handles the
+ * CF/Cocoa runloop.
+ */
+
+static void *call_qemu_default_main(void *opaque)
+{
+    int status;
+
+    bql_lock();
+    status = qemu_default_main();
+    bql_unlock();
+
+    exit(status);
+}
+
+#ifdef CONFIG_DARWIN
+static int os_darwin_cfrunloop_main(void)
+{
+    CFRunLoopRun();
+    abort();
+}
+
+qemu_main_fn qemu_main = os_darwin_cfrunloop_main;
+#else
+qemu_main_fn qemu_main;
+#endif
 
 int main(int argc, char **argv)
 {
+    QemuThread main_loop_thread;
+
     qemu_init(argc, argv);
-    return qemu_main();
+    if (qemu_main) {
+        qemu_thread_create(&main_loop_thread, "qemu_main",
+                           call_qemu_default_main, NULL, QEMU_THREAD_DETACHED);
+        bql_unlock();
+        return qemu_main();
+    } else {
+        qemu_default_main();
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
2.39.3 (Apple Git-145)

