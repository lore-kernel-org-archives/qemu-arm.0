Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4644905ejc;
        Wed, 18 Oct 2023 06:39:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIiG3Zb6FdM9A+SEykjuF+bNn+GGpCnoJ9lhYcOJ+ZTDHbg9M1tWItSq8mGancTckKu3sk
X-Received: by 2002:ac8:7d48:0:b0:419:4e31:efef with SMTP id h8-20020ac87d48000000b004194e31efefmr6017871qtb.56.1697636349773;
        Wed, 18 Oct 2023 06:39:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697636349; cv=none;
        d=google.com; s=arc-20160816;
        b=ln9ly1FFZz7BaYZQ6LREp9pzIJ3vz6heOUuCAYc8/U4IceBT7x94vm6oCVkIp0CAbP
         oEXc0MliGw3yPUVpmNEkEewr/MQxOVXNQ/ay9jbI8CJLrke8zcyWqeDACRu5pZMScxub
         HNoE+24Yg6l2pw1nUR4Dq7rNBrhqYAZUs3q8dH9qwm8CZQXKSPDe0TTA4aDaZefrmHUS
         8jQOyIFomiSOaEsa2nn3TwVHYF59kwXh6OgBfIVaz1yjdaI5EgCB2MawYc1DFNE5Famz
         bJOzoVZlWPocPMjg3mTrJi5Q5z2xGfs1qOvlSMIKPF+/m19RIEocXsvEG75pb/evAMTa
         Xjng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8tekbQ8dc6eVQqWGwmAxzuhv07EEyzoaXzuD1sAwzyc=;
        fh=Szf62vI2mdRKxFE/n72kPzB8VnojR8p9hbcglhPNB2o=;
        b=cttwQxImIBIDnOT5rsg+/+isbnC59KP4UdcQGQMQqCr/+RmwPYHrAe9d6unoBMn4Ug
         hdaVag92AvBtJsi0JVddt5gdEIsNfID6ubndnZmT8PVDQpL7tybWx1Y/h0+Elyy4EwNN
         x/tnqYZoVimF4BqYApkbrzZHaS1CYo5giKx9BD0NYyoXE/TidGjJ9MqyOrGLN29l3EYc
         2Bgzxn8fvxH782QRKGclXCXukJZHlmW/sxtIT49Fsz7LWZANaZZiqcciOh+J0dDewuZM
         0wSVqXQUKXS9givNSc2RIndqwJsQr2lSficeN5lGRFw5l/lgMOQnrqft4SZ0C6fFF8Gr
         YwVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a27unIHb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f22-20020ac859d6000000b0040fd49cc939si2806015qtf.245.2023.10.18.06.39.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 06:39:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a27unIHb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt6lF-0008N9-Gl; Wed, 18 Oct 2023 09:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6lD-0008II-L6
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:38:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6lC-0006CB-1e
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:38:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697636333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8tekbQ8dc6eVQqWGwmAxzuhv07EEyzoaXzuD1sAwzyc=;
 b=a27unIHbm/FooFeidq6if0TQtZ/nR/3GMJ/siU6MTjZ8GZoJfGJ4gFfZ1JLrM0yjr962+Q
 aK6n+jmUn/u5Qh5gp81YaUR5ywUl60DbU1ZfDjhLOl0OiLcL81RFtOkmnWVODWtFsZ2PsZ
 OB0unUVIJ/+fovhHqDJfTMvCopI7cWI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-WzP4LV6uNn-UjLEz93aV0w-1; Wed, 18 Oct 2023 09:38:51 -0400
X-MC-Unique: WzP4LV6uNn-UjLEz93aV0w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1BA887A9F7;
 Wed, 18 Oct 2023 13:38:50 +0000 (UTC)
Received: from localhost (unknown [10.39.208.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C7178C2;
 Wed, 18 Oct 2023 13:38:49 +0000 (UTC)
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
Subject: [PATCH v4 06/19] ui/vc: console-vc requires PIXMAN
Date: Wed, 18 Oct 2023 17:38:07 +0400
Message-ID: <20231018133820.1556962-7-marcandre.lureau@redhat.com>
In-Reply-To: <20231018133820.1556962-1-marcandre.lureau@redhat.com>
References: <20231018133820.1556962-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: MZl1HB/VnfXr

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Add stubs for the fallback paths.

get_vc() now returns NULL by default if !PIXMAN.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/console-vc-stubs.c | 33 +++++++++++++++++++++++++++++++++
 ui/console.c          |  3 +++
 ui/meson.build        |  2 +-
 3 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 ui/console-vc-stubs.c

diff --git a/ui/console-vc-stubs.c b/ui/console-vc-stubs.c
new file mode 100644
index 0000000000..2afc52329f
--- /dev/null
+++ b/ui/console-vc-stubs.c
@@ -0,0 +1,33 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * QEMU VC stubs
+ */
+#include "qemu/osdep.h"
+
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "qemu/option.h"
+#include "chardev/char.h"
+#include "ui/console-priv.h"
+
+void qemu_text_console_select(QemuTextConsole *c)
+{
+}
+
+const char *
+qemu_text_console_get_label(QemuTextConsole *c)
+{
+    return NULL;
+}
+
+void qemu_text_console_update_cursor(void)
+{
+}
+
+void qemu_text_console_handle_keysym(QemuTextConsole *s, int keysym)
+{
+}
+
+void qemu_console_early_init(void)
+{
+}
diff --git a/ui/console.c b/ui/console.c
index a758ed62ad..a72c495b5a 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1685,8 +1685,11 @@ const char *qemu_display_get_vc(DisplayOptions *opts)
     if (dpys[opts->type]->vc) {
         return dpys[opts->type]->vc;
     } else {
+#ifdef CONFIG_PIXMAN
         return "vc:80Cx24C";
+#endif
     }
+    return NULL;
 }
 
 void qemu_display_help(void)
diff --git a/ui/meson.build b/ui/meson.build
index 0a1e8272a3..3085e10a72 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -6,7 +6,6 @@ system_ss.add(png)
 system_ss.add(files(
   'clipboard.c',
   'console.c',
-  'console-vc.c',
   'cursor.c',
   'input-keymap.c',
   'input-legacy.c',
@@ -19,6 +18,7 @@ system_ss.add(files(
   'ui-qmp-cmds.c',
   'util.c',
 ))
+system_ss.add(when: pixman, if_true: files('console-vc.c'), if_false: files('console-vc-stubs.c'))
 if dbus_display
   system_ss.add(files('dbus-module.c'))
 endif
-- 
2.41.0

