Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1293960ejb;
        Mon, 23 Oct 2023 04:36:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVh+Hsc7APvjxM3Ia57dmXlWS86pjcnYf6HwMfNdwXO+UNzbzFLPrvCcSEeZhStPlOUln7
X-Received: by 2002:a05:620a:c4f:b0:777:f6ad:783e with SMTP id u15-20020a05620a0c4f00b00777f6ad783emr11919284qki.20.1698061001199;
        Mon, 23 Oct 2023 04:36:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698061001; cv=none;
        d=google.com; s=arc-20160816;
        b=P0hr6v68JEbNEATv3rc9PxbxjIhWlaloERcDP6Dc1NIltBoG/3iaZVNTWYXop7yfK2
         aGHgUIl7ZH23YrGzI6X3jpfw9AfoKrjqiaeFu8U1HK3KgDcIAIdAs/V97V2xRwzEupPz
         7ug8xsY06MvMDAUk+f01t+kHECsraRhVqcR/+W0PYX6LTyDxdv+N6p39atbSTKw8T/lw
         FKAzd3jG4iwzlfBDVazO8vF7cNh8wBXKhZirzWhRtdLhcthTzDrqYOqk9mgeXf1oS2TG
         rGLKX163db8UITU8iQ8rOUhmACyDUVvyTA8tyz+4YoP+h4G7650WxN2Ez3NfgUKPgLMc
         eFIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tTb3ro698lsOlZyEs7jHhQMOK97qw741KUptFZekI7c=;
        fh=r4fz3Foqx0ggjO5oI8v2vjNw5kzcdWLA6oCTkzfSTUk=;
        b=xqbJi/+82KSFVPtlnf52zxwDBdY8Ycesf98K2KZ5+q4swdZ/U95qzBuL0nXMg1HTDf
         RS8tddpJd0VlFaApZ9OhLsmkVwSj/jZYIq9s1JkhGZqHVFmUEdVE+BhQ5UU6HFwdBqy7
         /TPxIGV0shNHXmKfU4eoR1uEjwGx2WdkVd+st4+aNLd9ZXNf/xuxSdVKpzOxC66d00U5
         Ymm3gGXn0hPtWT/E2FnU+fD6JZxagvU5sbYchvZTQuPtQbSXL6zeIR52iQ8KErcaCXFm
         UZuXu8g9/QNUolnBGtOWW/oQeFLUMFRfPcsE7MVxoqXyQEShAWaguuYXKx7DaTmCZYhK
         HbXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TviV1Ly3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u23-20020a05620a023700b00767d5b81886si5445392qkm.458.2023.10.23.04.36.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 04:36:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TviV1Ly3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qut9Z-0007i1-9N; Mon, 23 Oct 2023 07:31:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qut9T-0007Wb-81
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 07:31:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qut9O-0003UT-Jw
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 07:31:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698060674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tTb3ro698lsOlZyEs7jHhQMOK97qw741KUptFZekI7c=;
 b=TviV1Ly3rR3x4DobG7CTuu2PKqbuLcXxpriv1V4kr8f+mtYHa3kjfgBvqbq1h1Lac8MZ8L
 60JZfdNaCzz8hrcBOuWUzw8RG5sL6vQEewN0s5zDfgquUY5fwd47EgfEsJMjXiRv9N40mK
 UcdkZ9bI+eD6laDJ2H812sWbm2qtFVw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-05t5Ry0LPLyxWCrJxgx-6g-1; Mon, 23 Oct 2023 07:31:10 -0400
X-MC-Unique: 05t5Ry0LPLyxWCrJxgx-6g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72167811E96;
 Mon, 23 Oct 2023 11:31:10 +0000 (UTC)
Received: from localhost (unknown [10.39.208.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51AB225C0;
 Mon, 23 Oct 2023 11:31:09 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v5 04/19] vl: move display early init before default devices
Date: Mon, 23 Oct 2023 15:30:31 +0400
Message-ID: <20231023113047.2572137-5-marcandre.lureau@redhat.com>
In-Reply-To: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
References: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: yON8/mZBgEyX

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The next commit needs to have the display registered itself before
creating the default VCs.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 system/vl.c | 41 +++++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/system/vl.c b/system/vl.c
index 92d29bf521..2cecb3d884 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -1349,6 +1349,28 @@ static void qemu_disable_default_devices(void)
     }
 }
 
+static void qemu_early_display_init(void)
+{
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
+    qemu_display_early_init(&dpy);
+}
+
 static void qemu_create_default_devices(void)
 {
     MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
@@ -1398,23 +1420,6 @@ static void qemu_create_default_devices(void)
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
@@ -1939,7 +1944,6 @@ static void qemu_create_early_backends(void)
                      "ignoring option");
     }
 
-    qemu_display_early_init(&dpy);
     qemu_console_early_init();
 
     if (dpy.has_gl && dpy.gl != DISPLAYGL_MODE_OFF && display_opengl == 0) {
@@ -3670,6 +3674,7 @@ void qemu_init(int argc, char **argv)
     suspend_mux_open();
 
     qemu_disable_default_devices();
+    qemu_early_display_init();
     qemu_create_default_devices();
     qemu_create_early_backends();
 
-- 
2.41.0

