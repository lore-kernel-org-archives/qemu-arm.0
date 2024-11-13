Received: by 2002:a17:505:7d82:b0:1be9:327d:8ee3 with SMTP id wv2csp398352njc;
        Wed, 13 Nov 2024 06:24:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWZIOC5heHdu9eTWpQDNgkL2uDS5erknSQFKuMg/Nr2xGV9pZcgtt7syJQyBsIUYCBOg+ZWFs2T23Ai8w==@linaro.org
X-Google-Smtp-Source: AGHT+IFcl772OjARZKeruralc9d4a9NMwgiaWOGqDPvmOezQSWukkpjZcfVSKylLZ751j5mK2g2p
X-Received: by 2002:a05:622a:4b0d:b0:460:a82a:39c9 with SMTP id d75a77b69052e-46309a73915mr308980351cf.10.1731507866592;
        Wed, 13 Nov 2024 06:24:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731507866; cv=none;
        d=google.com; s=arc-20240605;
        b=BxMwVt3qSSTMESXgDEmISxANtPPaavlVuM8XDPhT4rmi0yV8+kGH1l4f5KkKhu/8/D
         e6KJ4xfwJpLfVY+VKMB7tQfjUbPn8KeeNmjtVldfQbBMKW5VdZXEwcNx1y8oZ1IUXgp8
         sF31+0LW3U+2c1ENdfHVMY9nL2VGF4ieSlpjajMnPTtaDyOsO72aHrXyLDMWpCwI3WwW
         qHzUqnxRgbgeHuLf1iTrlJEoHoi9S51wS6n3qq4J9qPnPQlPHmZ5Ck/+3KkkUWn8jK9K
         NscKcPdn7fjqSqQt6rCXVzaiLWHfuV6AmzZYjpW0o0X87KvswsKx2rNY3EgYTjdHso9G
         sWjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SZeqyVtyEkSWn2paOWWapaHKdIoD5DPb6ITijkgKHp4=;
        fh=Q5lMjft58uPW26MkbpUu0L01PdNEPJvZhpCBYNkdnFI=;
        b=lVoEXza7jBxrdcBhwg/5x08RqZuW3WGLhYer5AWQJt5ZK3+0t1u6f0d3+HaPz0EalP
         7w9sqc0tWenRsk7dOT13yIM1dgtQ2jRgvdAv9YUdTxh16+VcaGYqcwTBlX3YRupXMT0m
         iwyZY5YSZKGYV+LMWeMSCT5OlIL1MV6rDvRQKDoFZ60vRFt2K6c704OTnlJJI1zBpNKC
         Rb1Y09qu+Qmsq0SFd03g05etKw3L1cwlp4wJtBFHqnS4Fi/PAWOkhXMViJV9KnSF/Vtz
         6amtXgNs9gH7Wfnz8HS5TaIU5c9gST6+0U/9dsn0hEyk3dubaeIC8ok3x93V9/6WDOrN
         tBdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=WpLjJVCY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff62582bsi173691431cf.499.2024.11.13.06.24.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Nov 2024 06:24:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=WpLjJVCY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBEHq-0003pt-Il; Wed, 13 Nov 2024 09:24:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tBEHo-0003nx-BI
 for qemu-arm@nongnu.org; Wed, 13 Nov 2024 09:24:00 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tBEHk-0008RL-84
 for qemu-arm@nongnu.org; Wed, 13 Nov 2024 09:24:00 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5cb6ca2a776so10521539a12.0
 for <qemu-arm@nongnu.org>; Wed, 13 Nov 2024 06:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1731507835; x=1732112635;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SZeqyVtyEkSWn2paOWWapaHKdIoD5DPb6ITijkgKHp4=;
 b=WpLjJVCYyVLDwzFIUaHdOA5+mQDUh43hlBs5lArVYbgPuGS+ekONiT9UBV3szZuBYF
 V/8el1T9uEXAWHZx8klIi3VkMBKaAytAEWlGWQsf2bsWUku8PpKZPCaCv3SJyx1el9n1
 wUaUFMb0vgh222HeGb9hGLqVd2iCmlu4IlvvY6yw61GUIR1q6f+85UO2z1S+Xu9I0pKL
 JNIZYUDRaoVGCUJ0AA49bV1+lxtudJxbm2SgaET028p89rI6kDwV0UyuccWzWpAJXCCf
 kBOaeB2EWr9oMymbYH905ruFQwrIYXjob4rAZUOECFExQQ24xs9BZe6yKp8omMtmNIju
 BoPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731507835; x=1732112635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SZeqyVtyEkSWn2paOWWapaHKdIoD5DPb6ITijkgKHp4=;
 b=UZZp4zF483n4s+3HwwMmbjkiv8fC7NZLneNqQ/GMyb+z0J/xl0aJ/HIywAvH4cRDSn
 YYjajfyHNb0NqDg9NeLO/75E8kiMPyOeIXECSgEEsj8yJEGDtdWAr5DFvTVuzmPoIWZU
 oSK/J4Zo7gSoOx0TpGkhyE75ASKCh9GNBILWjzkFkU9mfKcZg3l93+9JmLn3IYTHT0jI
 j467HhvBz6bvLcI2Zo/ZtW0wst5sH0h8Q2UB23ylU6fFUkcbGGidAvu5o4FUVcTR8Sch
 eUHgcHL+0XhibSlqHRp22zEWdAFhmlENDajt+oPNex9vgx270OciA/1U57rZ8zvCIRE/
 mhbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGWqbQ9QhpKs83Xt2d9oukBrpdACBXKWSmb/6omPr0dR/p/ef6KrIwbKbpb0MYK+R7CQ6auyazMA==@nongnu.org
X-Gm-Message-State: AOJu0YzFIO9B63dh1EIXsibUjkxQIBTKYveqRnu1dVS5RJ2WAP8cxWiW
 Mr3njLy8d49NYkotm9w8vBY7ZWNqBjLhtTvPvVOWYJsDd0j6mzKnxtFwo7pvMQ==
X-Received: by 2002:a05:6402:51cf:b0:5cf:9ec:1b05 with SMTP id
 4fb4d7f45d1cf-5cf4f35122emr5126499a12.11.1731507834592; 
 Wed, 13 Nov 2024 06:23:54 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03b5d76esm7134612a12.9.2024.11.13.06.23.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 13 Nov 2024 06:23:53 -0800 (PST)
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
Subject: [PATCH v10 01/15] ui & main loop: Redesign of system-specific main
 thread event handling
Date: Wed, 13 Nov 2024 15:23:29 +0100
Message-Id: <20241113142343.40832-2-phil@philjordan.eu>
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
X-TUID: i0YhjyDi7+Ep

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

v9:

 * Set qemu_main to NULL for GTK UI as well.

v10:

 * Added comments clarifying the functionality and purpose of qemu_main.

 include/qemu-main.h     | 21 ++++++++++++++--
 include/qemu/typedefs.h |  1 +
 system/main.c           | 50 ++++++++++++++++++++++++++++++++++----
 ui/cocoa.m              | 54 ++++++++++-------------------------------
 ui/gtk.c                |  8 ++++++
 ui/sdl2.c               |  4 +++
 6 files changed, 90 insertions(+), 48 deletions(-)

diff --git a/include/qemu-main.h b/include/qemu-main.h
index 940960a7dbc..fc70681c8b5 100644
--- a/include/qemu-main.h
+++ b/include/qemu-main.h
@@ -5,7 +5,24 @@
 #ifndef QEMU_MAIN_H
 #define QEMU_MAIN_H
 
-int qemu_default_main(void);
-extern int (*qemu_main)(void);
+/*
+ * The function to run on the main (initial) thread of the process.
+ * NULL means QEMU's main event loop.
+ * When non-NULL, QEMU's main event loop will run on a purposely created
+ * thread, after which the provided function pointer will be invoked on
+ * the initial thread.
+ * This is useful on platforms which treat the main thread as special
+ * (macOS/Darwin) and/or require all UI API calls to occur from a
+ * specific thread.
+ * Implementing this via a global function pointer variable is a bit
+ * ugly, but it's probably worth investigating the existing UI thread rule
+ * violations in the SDL (e.g. #2537) and GTK+ back-ends. Fixing those
+ * issues might precipitate requirements similar but not identical to those
+ * of the Cocoa UI; hopefully we'll see some kind of pattern emerge, which
+ * can then be used as a basis for an overhaul. (In fact, it may turn
+ * out to be simplest to split the UI/native platform event thread from the
+ * QEMU main event loop on all platforms, with any UI or even none at all.)
+ */
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
diff --git a/ui/gtk.c b/ui/gtk.c
index bf9d3dd679a..fbf20161f36 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -38,6 +38,7 @@
 #include "qemu/cutils.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
+#include "qemu-main.h"
 
 #include "ui/console.h"
 #include "ui/gtk.h"
@@ -2485,6 +2486,13 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
 #ifdef CONFIG_GTK_CLIPBOARD
     gd_clipboard_init(s);
 #endif /* CONFIG_GTK_CLIPBOARD */
+
+    /*
+     * GTK+ calls must happen on the main thread at least on some platforms,
+     * and on macOS the main runloop is polled via GTK+'s event handling.
+     * Don't allow QEMU's event loop to be moved off the main thread.
+     */
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
2.39.3 (Apple Git-145)

