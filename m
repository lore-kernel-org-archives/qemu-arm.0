Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2967345ejb;
        Wed, 25 Oct 2023 12:09:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSqgXAY/VMaHsTt/oi7JI3TuY0zFJoXhBUJPL1SJlnUbADt2vieoPFLXVK4EZ4wphDt01x
X-Received: by 2002:a05:651c:2220:b0:2c5:462:3048 with SMTP id y32-20020a05651c222000b002c504623048mr14106833ljq.1.1698260971400;
        Wed, 25 Oct 2023 12:09:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698260971; cv=none;
        d=google.com; s=arc-20160816;
        b=eHNATksbyA+rdsuDcBUZrQeesCEdtaNqXgUmYbs+eX1b0nQDF2e/tuS53r5RsaeQNo
         BhKvb2ALtoTcwKng+l+Pvn9iV8MS9IUf+TGbGklbSI5tnza5LgkNzjvOeNaERkNdTmfZ
         kyyR0KuP81NcpZMPfyeuADLrqSD+dOUlkmdQSf0EY6bql7lgY6lxu0DpjUjLEPVR/y0t
         z/Wa1CvDN1gkGPgq43lbJAkg5YYdJHy+5etncLEq9LVESf9MjMDp105d3cUrLDZbhXvW
         LGkmuYXU1pUEZ8aQBNG2nAyfD4wtxjBCdJmRc2PzN42m3ckQVNZfPkF1Bw4fErENHRyu
         tssA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YP87HK9J12wuCuTUJQzAESNv0IT7Xi6Ydvww2HjOm3s=;
        fh=xhblChOHn/9ohxmBdExAv8vV4InD5nB0dX6yBSUq53Q=;
        b=mxOX6pDyz31EqWnW4n09XBcSv3DidaEpuNz2CsZEIAxqdNt9WN1nA7qgdCIjsL750i
         IEySacAYQlONafwY5wBc7S9cO8WMwBMIW4RUPeD2/5ga9VWfjxJlWcl5G1kbCdtTUyQn
         0M52Eu0vp0584GQNVqx/xtdRd68ZP1b10SKQgMZUIYui/WGrgxXdSTOUlXYTwG4b9MOv
         otPS1X1fk80gIOvimKYT3BCg+LCRK76L44EFVGUi0afTVBketeWUd0qoELKbxH7VbozL
         Cs5QAKIlZ/OsqQPiadoj3UgMu4oo5GlDvhuApY+di0z1MnBk9ZlcP4jS5pnNkwAXellv
         ULYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MMmlkF+y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id je9-20020a05600c1f8900b004074ed8796bsi385136wmb.197.2023.10.25.12.09.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 12:09:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MMmlkF+y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvjFv-0005Ff-U9; Wed, 25 Oct 2023 15:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjFo-00051L-Ji
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 15:09:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjFm-0000Tv-8L
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 15:09:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698260957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YP87HK9J12wuCuTUJQzAESNv0IT7Xi6Ydvww2HjOm3s=;
 b=MMmlkF+yw9YWROOmelCciE/W6KZtKAv9D0DlEPFwRyUiQpgZtjnwdJL39LBIRUL9I9ZcmM
 sYqlkdkahZCX4FLryH/6dsl4BWuR6C9DSqHpEIXjRyn7gcfYsMy87KcMeoFTLX8Qd96hEq
 4BAr3WGrGvCgMzkRxvrSDR6BkpEXK8s=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-402-SQO9E2R6ONqRugeY8ylHWg-1; Wed,
 25 Oct 2023 15:09:01 -0400
X-MC-Unique: SQO9E2R6ONqRugeY8ylHWg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 168DD3C01B96;
 Wed, 25 Oct 2023 19:09:01 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E99AF40C6F7B;
 Wed, 25 Oct 2023 19:08:59 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Eric Blake <eblake@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v6 09/23] ui/console: allow to override the default VC
Date: Wed, 25 Oct 2023 23:08:03 +0400
Message-ID: <20231025190818.3278423-10-marcandre.lureau@redhat.com>
In-Reply-To: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
References: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: wTYMirTHTy8J

From: Marc-André Lureau <marcandre.lureau@redhat.com>

If a display is backed by a specialized VC, allow to override the
default "vc:80Cx24C". For that, set the dpy.type just before creating
the default serial/parallel/monitor.

As suggested by Paolo, if the display doesn't implement a VC (get_vc()
returns NULL), use a fallback that will use a muxed console on stdio.

This changes the behaviour of "qemu -display none", to create a muxed
serial/monitor by default.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/console.h |  2 ++
 system/vl.c          | 27 +++++++++++++++++----------
 ui/console.c         | 14 ++++++++++++++
 3 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index acb61a7f15..a4a49ffc64 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -462,12 +462,14 @@ struct QemuDisplay {
     DisplayType type;
     void (*early_init)(DisplayOptions *opts);
     void (*init)(DisplayState *ds, DisplayOptions *opts);
+    const char *vc;
 };
 
 void qemu_display_register(QemuDisplay *ui);
 bool qemu_display_find_default(DisplayOptions *opts);
 void qemu_display_early_init(DisplayOptions *opts);
 void qemu_display_init(DisplayState *ds, DisplayOptions *opts);
+const char *qemu_display_get_vc(DisplayOptions *opts);
 void qemu_display_help(void);
 
 /* vnc.c */
diff --git a/system/vl.c b/system/vl.c
index db4d5ee79a..86dd2dce28 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -1372,6 +1372,7 @@ static void qemu_setup_display(void)
 static void qemu_create_default_devices(void)
 {
     MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
+    const char *vc = qemu_display_get_vc(&dpy);
 
     if (is_daemonized()) {
         /* According to documentation and historically, -nographic redirects
@@ -1390,24 +1391,30 @@ static void qemu_create_default_devices(void)
         }
     }
 
-    if (nographic) {
-        if (default_parallel)
+    if (nographic || (!vc && !is_daemonized() && isatty(STDOUT_FILENO))) {
+        if (default_parallel) {
             add_device_config(DEV_PARALLEL, "null");
+        }
         if (default_serial && default_monitor) {
             add_device_config(DEV_SERIAL, "mon:stdio");
         } else {
-            if (default_serial)
+            if (default_serial) {
                 add_device_config(DEV_SERIAL, "stdio");
-            if (default_monitor)
+            }
+            if (default_monitor) {
                 monitor_parse("stdio", "readline", false);
+            }
         }
     } else {
-        if (default_serial)
-            add_device_config(DEV_SERIAL, "vc:80Cx24C");
-        if (default_parallel)
-            add_device_config(DEV_PARALLEL, "vc:80Cx24C");
-        if (default_monitor)
-            monitor_parse("vc:80Cx24C", "readline", false);
+        if (default_serial) {
+            add_device_config(DEV_SERIAL, vc ?: "null");
+        }
+        if (default_parallel) {
+            add_device_config(DEV_PARALLEL, vc ?: "null");
+        }
+        if (default_monitor && vc) {
+            monitor_parse(vc, "readline", false);
+        }
     }
 
     if (default_net) {
diff --git a/ui/console.c b/ui/console.c
index 8ee66d10c5..a758ed62ad 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1675,6 +1675,20 @@ void qemu_display_init(DisplayState *ds, DisplayOptions *opts)
     dpys[opts->type]->init(ds, opts);
 }
 
+const char *qemu_display_get_vc(DisplayOptions *opts)
+{
+    assert(opts->type < DISPLAY_TYPE__MAX);
+    if (opts->type == DISPLAY_TYPE_NONE) {
+        return NULL;
+    }
+    assert(dpys[opts->type] != NULL);
+    if (dpys[opts->type]->vc) {
+        return dpys[opts->type]->vc;
+    } else {
+        return "vc:80Cx24C";
+    }
+}
+
 void qemu_display_help(void)
 {
     int idx;
-- 
2.41.0

