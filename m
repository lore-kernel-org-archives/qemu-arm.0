Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2180987njb;
        Sun, 8 Dec 2024 12:23:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVZxd5le+VI/Gj3q5bKXEh1vOTgt//rmUzFQJcIVzUlLJXyp78SbzywpRfzlBpV0i1d3ZKZqgNZDx8mYA==@linaro.org
X-Google-Smtp-Source: AGHT+IFnm4fbkPYR/nEf93dlE5Ce/f1wTLf0I75kHwUv1GiyIWPc7h0IX0WOZ+9/mWViSXwU4ydh
X-Received: by 2002:a05:622a:19a2:b0:466:8eb7:59c5 with SMTP id d75a77b69052e-46734f7c520mr212830641cf.34.1733689406118;
        Sun, 08 Dec 2024 12:23:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733689406; cv=none;
        d=google.com; s=arc-20240605;
        b=BEth3AFUtts4e5cShVhNZJaPHy4bs9w/tlFExYXDet+iXKw/edi0SHeo5PfHZwAiHJ
         61UD1PTprE/sYr1n45JEmHWT23kdGwpl5mIwjz8Y/eIoBLcaR2+UAzoXnfdZFJY3mHxt
         dMNOxwdUwVhVM8+i7ifYmgrb4tdfH4grJL0zJcubxXCd8OqwXu7cTdggPdkpiNZJmPdC
         oiThszRGwF3MtgT2lt/2/Tkn5LVgi0FFhVo7AsvE2yLiorbGoBOE4JWxNZ6wNFbOooye
         D6tp7hUko7egkOyKdwMQ38wjZzYzhSsMhCJbT8CcreHzNgoZKWO3226D+mYzrVDSUrhc
         oQRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XmgJyWpCuCi2HoyxP/grcFhqMBy46PCyGsue2fZsSxs=;
        fh=5A5b6VKRCkCg4cNuUGmxV3n90qqZ+iRgsbiMQP6bYds=;
        b=eTaWCmJj0uFpSvQkvC1zGYchcozXKDjU8uW0Vv/qmLJQ8kRr21Iu69airYiX89O8wx
         WLIVDNk9mQAf/5a7zmjQv6+Y/5ctZp3M9teQvzWFTkK3EmjsakMlTPKnJqHMJbV3hBnE
         3sZ25LallemBia7BEkuqsET3ikVuKkDEJeYC3IPc8S4QlMBxTUqZ451hyG+iUxQw5+2E
         H24Y3hYiN3rr8B58Xx//RkaaswrLQwINysBz3sjFh/R26m3sffhbLrVzvvZweAY40IZw
         ACAtPo0diD4ICC1lcu71BT8DBdOGMWTRNhC5ta9wF50MVc/qKJuuU3ukqJC17w4IhVYA
         ZNWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=aGHeV2fk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467591a6727si26622321cf.529.2024.12.08.12.23.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Dec 2024 12:23:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=aGHeV2fk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tKNnn-00027j-IX; Sun, 08 Dec 2024 15:22:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tKNnl-00026w-Mw
 for qemu-arm@nongnu.org; Sun, 08 Dec 2024 15:22:49 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tKNni-000817-6K
 for qemu-arm@nongnu.org; Sun, 08 Dec 2024 15:22:49 -0500
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aa64f3c5a05so250550866b.3
 for <qemu-arm@nongnu.org>; Sun, 08 Dec 2024 12:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1733689365; x=1734294165;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XmgJyWpCuCi2HoyxP/grcFhqMBy46PCyGsue2fZsSxs=;
 b=aGHeV2fkKmAouKlC9HBuDSY0rCiJ9SndThF/nrthEDR6CXw1TH2AMCL7MHI4v5dtvU
 99GRqvCz3zoR/xZCkNBZCRXiIO7zqr2zDB/nVzslSVeQ3wi4VuFtC2YoZMDHnlxiEfXA
 qUwrfcP5dbX2oU0D8YwJbnEUh+SGkfqIyyMDxQGUiPgj+G+tK+dVGRTPw93CEITpPfDP
 O90Gzkq5Ptr4YVAIEKkdutofMjWQ/mJNwnqvjXouErCNp/vm1es/01yS8bxr7Bg1cJ17
 X/yPG4LnqCT9fWKh56+YIh3eaW156tLoDfQFNVOVgMH0qA4f7ZkKklaOS1cmTCkzs2Le
 veoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733689365; x=1734294165;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XmgJyWpCuCi2HoyxP/grcFhqMBy46PCyGsue2fZsSxs=;
 b=UC3Rh6DI86SMe8Xb9hJ6y2p/4ip+QjNY5WBR3YX4jP4CGQ087SE+gVKGge3fwADWLz
 co9zT/7jPqvmpKMSQdSAySMVyO/ZrAATZGgoC4f1OuyLCic8yTuXOwI/aF7oWOnbaCp/
 T7MT5/e66GPqoEKtikfX2ZhK69Yh4XAd1Qo9i0Dsb/QxwuvRHByW80W1KujOyAegHJ4x
 EuQXBX43SYLXSS4Ri7Mo9VGTHWKp1sMS1exZOK3wWgJT7O0bDo1T1yX/seG1ygp2jvq4
 h0xFMMnY2NHNYFF8m2VHXVhjrThMx8M+BrdCmkQ2TZSRAPxcHLY6n/FBnWGaA90McMkD
 nkeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA04vv480syT8US50BPFvDDn8nyV2N4+RO1gIY9rW3S/7VH1rk3nKoVZSZazPnSFS18GFCu6PE6w==@nongnu.org
X-Gm-Message-State: AOJu0YxHjvtS8hgYkMndXk5N4P1jIjy8RrKDRU/ZvOjqQELObKg+G0A7
 Mwila7VF+SI02C5eOb8O6MaKGZ6rMYymg7IIff++kZnaaGj6WBsG6mtvEB+9mQX+0MWYWTi9w8l
 Eduog
X-Gm-Gg: ASbGnct9ntM51TDbziAp8eAT4otmupr2Y8vkxX0vGdEYNEcVaeQ/V9hcQenqoDkSsW6
 vtP66ZNmUaX4KeBKzngo0gfV+nj4gkER1mrtV6VqWV96MPfzBPW5ZNMFtk6KgLnvzrPX05dbqwD
 eR9DaItMssqYfJ2PLcGsX7EYe/bFE59ZFvEwqcQfVGhOx34fOmP8ddZvvLEgh7gWeAkTzuzO84l
 YyNI36alGVIbnLBPJt8rbVAIW7SMnz31X/GmQgOkXSzLxbW5pRwsjDjPG02XKwt+xECBSyNxZlz
 aPSXT+x6Muzm2gyQlVpgwNRppA==
X-Received: by 2002:a17:907:9556:b0:aa6:6ece:8eb1 with SMTP id
 a640c23a62f3a-aa66ece9010mr493428266b.54.1733689364722; 
 Sun, 08 Dec 2024 12:22:44 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa625e4eee4sm585759266b.26.2024.12.08.12.22.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 08 Dec 2024 12:22:44 -0800 (PST)
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
Subject: [PATCH v13 01/15] ui & main loop: Redesign of system-specific main
 thread event handling
Date: Sun,  8 Dec 2024 21:22:24 +0100
Message-Id: <20241208202238.68873-2-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241208202238.68873-1-phil@philjordan.eu>
References: <20241208202238.68873-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::62d;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x62d.google.com
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
X-TUID: QLGnUqCAXbvp

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
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
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
index dd88115dc6f..0a9ad824aa5 100644
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
@@ -1326,8 +1329,10 @@ - (void) dealloc
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
 
@@ -1943,8 +1948,6 @@ - (void)pasteboard:(NSPasteboard *)sender provideDataForType:(NSPasteboardType)t
 
 @end
 
-static QemuCocoaPasteboardTypeOwner *cbowner;
-
 static void cocoa_clipboard_notify(Notifier *notifier, void *data);
 static void cocoa_clipboard_request(QemuClipboardInfo *info,
                                     QemuClipboardType type);
@@ -2007,43 +2010,8 @@ static void cocoa_clipboard_request(QemuClipboardInfo *info,
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
@@ -2125,8 +2093,6 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
 
     COCOA_DEBUG("qemu_cocoa: cocoa_display_init\n");
 
-    qemu_main = cocoa_main;
-
     // Pull this console process up to being a fully-fledged graphical
     // app with a menubar and Dock icon
     ProcessSerialNumber psn = { 0, kCurrentProcess };
@@ -2190,6 +2156,12 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
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

