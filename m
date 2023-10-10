Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp296771ejb;
        Tue, 10 Oct 2023 00:39:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3i0MmU2lTnNe/1e6o3YC3kdqoOWy588PkfchV52qeE49Lk7GktMTDLofoo7mQtfjxWAkT
X-Received: by 2002:a05:620a:3189:b0:775:8040:ede6 with SMTP id bi9-20020a05620a318900b007758040ede6mr22028496qkb.21.1696923581989;
        Tue, 10 Oct 2023 00:39:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696923581; cv=none;
        d=google.com; s=arc-20160816;
        b=eGqwf0njEfR22KHDztz6SbwEcPFj0j4+8AUegg0yr/YCQvPDyZIdVMBSGbLowfeXDV
         il3CKAwfdtN7070sfavs4FsrO02ZQuap7HY0L6hbNF2fUxxuAEwj+1r/3/Jd0SdeY4rF
         kpLXOyMVpzMzQ1dtuBfYd0d0LiRIvp5oZ7tOyECbFGbavdF0ivrMsLzSO26zhLO+4oFC
         e/oiUmNc932aqhCl602IzOfEKCZnw335lHxRdspyI4tW2NGtoaWuLUznmmMEbdkTulxT
         DAPw7puqWbHrzSu/s65b9ziXp1QYiV1xptCqahSKne1vt3MbvqjZEiOxMwjPf/cRlxtG
         a9yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LLtp42eavMrt9LDrZHqCTM5yCoIPlb9aqGSwIquAUUE=;
        fh=46wv1No7OOLuZCRbeGSaV31Ktmo6cwaISz6jgi4/xrY=;
        b=eHbOG5cBbsB4XRI4q2EpOyhS764n5Iy+o6Lb3obFFUOypIYv0ptZ5JYpl9GtT8okem
         YxD1uFSAe+eSeuDALe9v1JJa2+t8jXhA1Gnd4L1yg0IFaN2smvSNAIWW6d1jevDJwHLa
         0S6UkrdtPk7mqd3Fbq+E/g5X/5pvPT+QwMY7StYIdR9AKGqd1ve9cPb2MEyLVvuFe7Bi
         b+WiPkGaQ2Z0r9xwCl8IlvW54Nq/ESw7fxTsptV7Bt54J+grZZS353bbkODIf+KWNOnl
         oO807RyxlROT5ZUMfdCteBZ7TJ1WglORyIolvjyI6Z86TQ7/0qqrh6goaCUD+kY4DHAx
         UvYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hC2t3v4D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a35-20020a05620a43a300b0076dbe1d6084si7274733qkp.675.2023.10.10.00.39.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 00:39:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hC2t3v4D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qq7Ki-0000bG-NM; Tue, 10 Oct 2023 03:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qq7Kh-0000ah-C7
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 03:39:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qq7Kf-0001hM-M4
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 03:39:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696923549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LLtp42eavMrt9LDrZHqCTM5yCoIPlb9aqGSwIquAUUE=;
 b=hC2t3v4DkDvFcGKJoLIMjFL0eMaeGrfaWzhSBtLAqadWQwS+SEtuRu1ur8C7Wvl3dATHpT
 xVPoQYessjB6Hkz+wxRbUH91wnoczMSX6dluTXqnnELg8SOdXMM8pqyE78cgIudMIe5n5j
 xUC+TARI2rL/QU4C8zblRZZCSBwN7JY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-CHEBv1GFNhyUYiH7fX5LVA-1; Tue, 10 Oct 2023 03:38:56 -0400
X-MC-Unique: CHEBv1GFNhyUYiH7fX5LVA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 746023812599;
 Tue, 10 Oct 2023 07:38:56 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 19CC9C0FE2D;
 Tue, 10 Oct 2023 07:38:54 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 05/18] ui/vc: console-vc requires PIXMAN
Date: Tue, 10 Oct 2023 11:38:17 +0400
Message-ID: <20231010073830.606570-6-marcandre.lureau@redhat.com>
In-Reply-To: <20231010073830.606570-1-marcandre.lureau@redhat.com>
References: <20231010073830.606570-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
X-TUID: TwGoZIREa8Kr

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Add stubs for the fallback paths.

get_vc() now returns NULL by default if !PIXMAN.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/console-vc-stubs.c | 32 ++++++++++++++++++++++++++++++++
 ui/console.c          |  3 +++
 ui/meson.build        |  2 +-
 3 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 ui/console-vc-stubs.c

diff --git a/ui/console-vc-stubs.c b/ui/console-vc-stubs.c
new file mode 100644
index 0000000000..0827961b2b
--- /dev/null
+++ b/ui/console-vc-stubs.c
@@ -0,0 +1,32 @@
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
+const char * qemu_text_console_get_label(QemuTextConsole *c)
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

