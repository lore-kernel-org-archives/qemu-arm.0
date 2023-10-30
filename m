Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1773272ejc;
        Mon, 30 Oct 2023 03:49:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvoObHzf3iAQuDMTju6DLJCeL396R1DXHVyw5SreXJ/lpPXij7Oqw6ub9TLcT/TPxhsfBf
X-Received: by 2002:ad4:4191:0:b0:66d:59a4:a2f3 with SMTP id e17-20020ad44191000000b0066d59a4a2f3mr15028874qvp.14.1698662961483;
        Mon, 30 Oct 2023 03:49:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698662961; cv=none;
        d=google.com; s=arc-20160816;
        b=Uvsfz16Ur2FT6mPla6B7z8dzFM0qFCZI3L1qj16e3+4G9WD/xDA2cK5orGs0R05K11
         0PuhMp1oZBxLmwGYQ6RzZoeS2jiE9QIc9xsH4enLARvQQRYcQWXAcs98wyoB3hHQm4L+
         3p/5EH/fjAJcPXXsnohXlb8Nu6/NqtCZ+u51UZISsSm7/k3nyIxlliJWQHMddXiubPIV
         SD/24SiJTAAYD5bmX4gnVAN+X88CAB7mCyHIIbVqb+vE7TvhF3hZGf0n/F8k4enKnV/X
         9vWMeNZLFl6iH5Xg+Nv/t0eY4o8K8hdUVZvPjkKJ65GJZpUelfs6+sQt4uy4eOBrKDZA
         utEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gPT015W0PbRyFxOHs7nwx2+/BQzoOH/swmOsdeWxQEw=;
        fh=Ci9wK9l4xitOqL9yuxnV9ynOTs+kWb6MxTZujaeFoew=;
        b=kjT3Cs5Zh2LZqeQYVOPoHIo8J7rVLtTQoVNtORvGjNbbElBj/mobSMSHt3pgUyGy/K
         o8I0ixdxLTEeADUehlPmZ7BkbbbwdZhRaT/JS5xqYrpMI7aYj0gwtSTtnNyuiX4qYR4b
         InOk9eKvsf4LlrKA6by8SqA/hShn/oozMqq8Lvsoug1uofsE16F5EGlEXyXgGDZvLs1M
         DH7ZG3LRbm9WqOdVPjNGXU1EXFmn5sNHY6h9zHdzXDCDq2oFlaPtIntXpogdgERWYXfV
         COKj3K2SR+2Z1gcJZ2A6YdMNkYeK6gpousXamptjdSE/Uo1zWFMVDjJJbw1fB1Dtq5xI
         6/gA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZpjODPgu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ec10-20020ad44e6a000000b0065cfc03bc17si3829299qvb.7.2023.10.30.03.49.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 03:49:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZpjODPgu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxPp8-0001xY-Mk; Mon, 30 Oct 2023 06:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPp7-0001wi-5Z
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 06:48:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPp5-0002aQ-NT
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 06:48:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698662923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gPT015W0PbRyFxOHs7nwx2+/BQzoOH/swmOsdeWxQEw=;
 b=ZpjODPgudwfEWBLnY3rs2msdqVxXAUoutHng5riqR4xTB58t4cvI174Il3+NPQF2WK+mHa
 kq/xID6EZv4VoZ6kIEFLM2/bR0zgB2RLLCd6MgwkWE3DDWEFkIRq7W9Li3bI3i4UgErgff
 1JnILvdjcIdgUIt42HKyGhKk3geVXUE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-T9fv_HIWNuSdtPlwevMLGA-1; Mon, 30 Oct 2023 06:48:40 -0400
X-MC-Unique: T9fv_HIWNuSdtPlwevMLGA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A4B0101AA42;
 Mon, 30 Oct 2023 10:48:39 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E80B10EA1;
 Mon, 30 Oct 2023 10:48:38 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v7 08/23] vl: move display early init before default devices
Date: Mon, 30 Oct 2023 14:47:39 +0400
Message-ID: <20231030104755.124188-9-marcandre.lureau@redhat.com>
In-Reply-To: <20231030104755.124188-1-marcandre.lureau@redhat.com>
References: <20231030104755.124188-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.478,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: JQKbbMgQBilu

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The next commit needs to have the display registered itself before
creating the default VCs.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 system/vl.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/system/vl.c b/system/vl.c
index b07805d476..db4d5ee79a 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -1352,6 +1352,23 @@ static void qemu_disable_default_devices(void)
     }
 }
 
+static void qemu_setup_display(void)
+{
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
@@ -1401,18 +1418,6 @@ static void qemu_create_default_devices(void)
 #endif
     }
 
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
@@ -1937,7 +1942,6 @@ static void qemu_create_early_backends(void)
                      "ignoring option");
     }
 
-    qemu_display_early_init(&dpy);
     qemu_console_early_init();
 
     if (dpy.has_gl && dpy.gl != DISPLAYGL_MODE_OFF && display_opengl == 0) {
@@ -3666,6 +3670,7 @@ void qemu_init(int argc, char **argv)
     suspend_mux_open();
 
     qemu_disable_default_devices();
+    qemu_setup_display();
     qemu_create_default_devices();
     qemu_create_early_backends();
 
-- 
2.41.0

