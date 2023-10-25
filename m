Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2969958ejb;
        Wed, 25 Oct 2023 12:13:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpDcHOA+8jw79RlNNKHIiWfPuscNOiVKKwQ746c1QZxssjxPikPMC3YrGVV1mWZJCDiuYm
X-Received: by 2002:a05:6358:5d82:b0:168:e074:8c3f with SMTP id s2-20020a0563585d8200b00168e0748c3fmr10575036rwm.30.1698261238508;
        Wed, 25 Oct 2023 12:13:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698261238; cv=none;
        d=google.com; s=arc-20160816;
        b=sU/cLpDCpTyIFLCBPVFgDYV81Mwi7vFym207T9haqe95GN+cmeWrow9O9jQs1hNcHL
         dKtiam6dTNF7jRkbi7iUbjZeqmivW7yLGRN1/ReUQHHeVADlMhQ192F/sZzenIlhbgAU
         8WuPi581fxbaCAzmHcWG36gHfoxFNRP02YGTckIpkaT359d+IUNQoUYaPGzT1wNVzCNF
         hWW7DBxOGGfcDKNYnofwn8cBaUcgQ5lSgxJS0E8w/2mci3K5RjCMfb02S1XZ2Tq/2Usr
         8btcqY4RvNvBY3GhpSMZDlyUK7LnP0Q2FaMBf1qvLVCTq0l4Nhazf2DX77MLQFGfsAfZ
         0q1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6TPHZZbPX5YwmR+v8bRhw73QvmNTbMk63utWKnSQejU=;
        fh=xhblChOHn/9ohxmBdExAv8vV4InD5nB0dX6yBSUq53Q=;
        b=dheturXQZAP2hhBtE0umvzxu53LEhIbp9uyohCRt3Nsn4ne+3Q518FML/XFPKoYqSK
         3KFpN5ietcCRE0HZ5gGQheP30HAcpoBNPQOztKZAWwZHS+iazIHf4AV42YH1E7BP8XJv
         5ooRZjccMAVkBU42aR5W1aUoDJDtNv73yn61jtqC/wEUvjI8WIpX5aAM3MdjcTihCUdI
         tZP6hSWRao6OnHCG72IDOGFQlgzsBkwF2MPSmc0AxEnWv4R823L4SHjhk0UC8Pr8Dy2H
         BRFFObTGFdX5yicSUi5CWbDar7E8o9bYK/fpWVS8RAFm80xBKrKuzfgu9K7BppHfYjHL
         bw8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O+mfpuua;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ep5-20020a05621418e500b0066d03221211si8933992qvb.212.2023.10.25.12.13.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 12:13:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O+mfpuua;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvjFo-00050f-9Y; Wed, 25 Oct 2023 15:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjFh-0004s6-CJ
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 15:09:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjFd-0000Qa-5e
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 15:09:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698260948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6TPHZZbPX5YwmR+v8bRhw73QvmNTbMk63utWKnSQejU=;
 b=O+mfpuuarCfLMMIjl3pjNnXJT8Ndx7aRbI2MTPlaaLu6WH3ObrUg1zHWkU2nLIsdliRQKE
 DS8/Y7kyVfFt4YGO8ag2qcM2P6pcTYod7uK5ToWgCWSp4Oh3EKsbRAsCPfPfdI9M7p2p/R
 xQYcptdS79Ul1pDr1OR0U0a7UBdoQN4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-15-ukRY4PPZOxmyZUo9B50b5w-1; Wed,
 25 Oct 2023 15:09:05 -0400
X-MC-Unique: ukRY4PPZOxmyZUo9B50b5w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D872938062B3;
 Wed, 25 Oct 2023 19:09:04 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13C982166B26;
 Wed, 25 Oct 2023 19:09:03 +0000 (UTC)
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
Subject: [PATCH v6 10/23] ui/vc: console-vc requires PIXMAN
Date: Wed, 25 Oct 2023 23:08:04 +0400
Message-ID: <20231025190818.3278423-11-marcandre.lureau@redhat.com>
In-Reply-To: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
References: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: dxQftN+hxE3Q

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Add stubs for the fallback paths.

get_vc() now returns NULL by default if !PIXMAN.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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

