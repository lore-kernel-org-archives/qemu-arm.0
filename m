Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4644919ejc;
        Wed, 18 Oct 2023 06:39:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPNEifyWELoCRBODIRtqM9seYfTT4eFomWfepsNYSbklLRqJWjYeV7ewy5tt+7G+bVK3wU
X-Received: by 2002:a05:620a:414b:b0:775:99dd:431b with SMTP id k11-20020a05620a414b00b0077599dd431bmr5703587qko.58.1697636351273;
        Wed, 18 Oct 2023 06:39:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697636351; cv=none;
        d=google.com; s=arc-20160816;
        b=SIEbB3EXmFga3mJK9Kxb+9RgD5TZqfgX3ikjOPjzrVIlJsr88oFgLhMiomAZAMBh7g
         MAGn0tKifyR2LMDqXqkT8lECyUptrBvmusD0LTnNOpSTsG+2Vn/gjXK+JFCkapdfpwje
         pkGuoYgPjeDwagZvMMIr5TEpu1rVG06pqMJvVLfCK7HzMjov+kmL4BSsDAxaZIIPUin0
         0GTwG4mf/H0AkKmK7/mkfRdch24uRY9I7PKk8EZAh2T28XEOeQ97kEduZz6Q7gmeC/e2
         6D7eRCkVI5qeV1SSKLZAd6bpALluhhqmYhLh1CWACM9Nhvixy/MueM5fb4XDNkIJQ4qg
         VpjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tayuJtF4UXQT6RnTXg2RYSCRNSZPXRr7Go1RT6Hfc74=;
        fh=Szf62vI2mdRKxFE/n72kPzB8VnojR8p9hbcglhPNB2o=;
        b=QVR9e+ZtwiLD00TO8x1a3VqJwxYZ+wjHltBgx0ktS58mo9CIegtVQNS1JjLv14u/jL
         xlBviF5pJUmpvTO5I4BKKX2d4q9LQxUeWbWVY4KcY3zqIG7UqshVOdEqpRMlxgpx7mf2
         vBDft3j7ss1x6hjdAbZQQK6FYJ/gAAj8+ot1jPsbuyC0gE4q8+UUBmXXW7hMkCbwn2SI
         Hv6O+m1B2tsr3E+PsSwyaMa63pjR00LCOkIJxhT0LRzOW+71kEoVPLqoxvgRSe4weVBF
         iFdkE+WpKnKRkFFMXtRWRfRbWX0uQ9RbH9HhMsBVH7GBXlIdxKSRjRVha+1q3ut3ropz
         p1mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eFG5uBof;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ow24-20020a05620a821800b007756a7b3dfasi2589212qkn.503.2023.10.18.06.39.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 06:39:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eFG5uBof;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt6lN-0008Un-9H; Wed, 18 Oct 2023 09:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6lL-0008TK-IZ
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:39:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6lJ-0006Dy-Tb
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:39:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697636341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tayuJtF4UXQT6RnTXg2RYSCRNSZPXRr7Go1RT6Hfc74=;
 b=eFG5uBofJo4xZVxuOgEGNqWMxoM/+fhaGglQNkU/WWJwEOsKYM6NDgFBHgOlXXI2F045Kg
 o1DigpgDhkJhae09zUgxVN8JNUMM9+9McesPvczyzPQt/nQj9onOjuwQIpDIsu6kJARf8W
 xvtSIpaxbHMVPQe6ykRdDQzccus64i8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-690-M9t_bqS8MJSlWDMST9GomA-1; Wed, 18 Oct 2023 09:38:47 -0400
X-MC-Unique: M9t_bqS8MJSlWDMST9GomA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77F5610201F9;
 Wed, 18 Oct 2023 13:38:46 +0000 (UTC)
Received: from localhost (unknown [10.39.208.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B0C31121318;
 Wed, 18 Oct 2023 13:38:44 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v4 05/19] ui/console: allow to override the default VC
Date: Wed, 18 Oct 2023 17:38:06 +0400
Message-ID: <20231018133820.1556962-6-marcandre.lureau@redhat.com>
In-Reply-To: <20231018133820.1556962-1-marcandre.lureau@redhat.com>
References: <20231018133820.1556962-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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
X-TUID: w1uHSvR+kNQV

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
 system/vl.c          | 62 +++++++++++++++++++++++++-------------------
 ui/console.c         | 14 ++++++++++
 3 files changed, 51 insertions(+), 27 deletions(-)

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
index 73e4ed2bef..66b34f2ab9 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -1364,24 +1364,49 @@ static void qemu_create_default_devices(void)
         }
     }
 
-    if (nographic) {
-        if (default_parallel)
+#if defined(CONFIG_VNC)
+    if (!QTAILQ_EMPTY(&(qemu_find_opts("vnc")->head))) {
+        display_remote++;
+    }
+#endif
+    if (dpy.type == DISPLAY_TYPE_DEFAULT && !display_remote) {
+        if (!qemu_display_find_default(&dpy)) {
+            dpy.type = DISPLAY_TYPE_NONE;
+#if defined(CONFIG_VNC)
+            vnc_parse("localhost:0,to=99,id=default");
+#endif
+        }
+    }
+    if (dpy.type == DISPLAY_TYPE_DEFAULT) {
+        dpy.type = DISPLAY_TYPE_NONE;
+    }
+
+    const char *vc = qemu_display_get_vc(&dpy);
+
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
@@ -1392,23 +1417,6 @@ static void qemu_create_default_devices(void)
 #endif
     }
 
-#if defined(CONFIG_VNC)
-    if (!QTAILQ_EMPTY(&(qemu_find_opts("vnc")->head))) {
-        display_remote++;
-    }
-#endif
-    if (dpy.type == DISPLAY_TYPE_DEFAULT && !display_remote) {
-        if (!qemu_display_find_default(&dpy)) {
-            dpy.type = DISPLAY_TYPE_NONE;
-#if defined(CONFIG_VNC)
-            vnc_parse("localhost:0,to=99,id=default");
-#endif
-        }
-    }
-    if (dpy.type == DISPLAY_TYPE_DEFAULT) {
-        dpy.type = DISPLAY_TYPE_NONE;
-    }
-
     /* If no default VGA is requested, the default is "none".  */
     if (default_vga) {
         vga_model = get_default_vga_model(machine_class);
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

