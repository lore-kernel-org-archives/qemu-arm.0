Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3216250ejb;
        Tue, 21 Feb 2023 04:48:35 -0800 (PST)
X-Google-Smtp-Source: AK7set8wiP7epdInzexOwVM66iXQFj7JmogrG02tzGw/vsIQyuYAugSaFKlzxfsXzrGNyGiV/wjA
X-Received: by 2002:a05:622a:60c:b0:3ba:1d8d:f6eb with SMTP id z12-20020a05622a060c00b003ba1d8df6ebmr21239578qta.58.1676983715353;
        Tue, 21 Feb 2023 04:48:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676983715; cv=none;
        d=google.com; s=arc-20160816;
        b=tjbDMa02F6OsgWUkoI5FMOU1fLZzLEqLoW5c6K5o/mW236owXOc7+bcEgneCsDFLt8
         HDSpMopG0wUUIuUhb6/pqJQPWVjQy6MyIVAVPduIBoQZ76fpGSzhnd0DEEIMrxTenRBR
         p/usGjf/DNyH7PbKEAEOIvzxIYCPUmDBxOA6dDktuGsxpLweaVy67j9D/ISSt3Unhi7r
         8cvWTC0H00TfMG5UdCRPo/HpyIB1iF5iDGpUTh8sN3gjsazPapBBFZL6B40J3GxNHNUP
         BnjW0GZvLkhQWXB1mxv5B+kpCKcClrGJgHPlvQdnpwcSB2TSbPK4nLi1RTdyvGGeKMDG
         XbZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nl9rYr1LeoSXQmWX/qOPZeg0gY/F/3CSnvmyxLivaDA=;
        b=wXFH9szMPSrmg8oEDadc2ud2rjNahIHR/293TcoxGJPS1o/Q2G6MQkyN3u5U/fk8oX
         9Nsi4MAozWRVtZ1ZhV7wlbbtMPlYwAM1HyRyoMpTuMfYspneJv+MXyM8Ve118NIEzLcJ
         Ce93QkaQXJeUa+46aMzKEdOG4qVc4w+j43BSbbEo6SidOiXmALqTheXPwH4DjxUs573A
         pbWjXpACNmpAJOc628OHe/DwLajwdUewk6Iob3O67ozhKZkyK/bR428TMPjwJekAiRug
         pl3EXgkuWFVaHDB9qwlpPnj/J1ykRFWjj82ed7jzy7N08sDadHOcQJWyfv0m+UkicMoV
         JpOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cJRwvrI0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o21-20020ac87c55000000b003b85355c09esi2350667qtv.758.2023.02.21.04.48.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 04:48:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cJRwvrI0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUS4N-0005Ag-Ii; Tue, 21 Feb 2023 07:48:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4L-000583-NL
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 07:48:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4K-0007qS-0r
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 07:48:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676983707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nl9rYr1LeoSXQmWX/qOPZeg0gY/F/3CSnvmyxLivaDA=;
 b=cJRwvrI0Rkmj3pl7kgMH1uF0Hy/NPkNeGUJXjvs2qyItfudsXBMLdAT3Vb4PHrMNj052uf
 DEJ82wGxsHJY/imB8+pD8c+NePCkIoOWJYG8K0M+FdHBNsJinlfr0+kZJFVDrHu4fCNgeR
 xLf3gLiVEIf6I/OGt7JG6YZpq2M/IB4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-Eb3fgGvAOHmrmYe7D8semA-1; Tue, 21 Feb 2023 07:48:24 -0500
X-MC-Unique: Eb3fgGvAOHmrmYe7D8semA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC1C785A588;
 Tue, 21 Feb 2023 12:48:23 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E40B2026D4B;
 Tue, 21 Feb 2023 12:48:22 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, armbru@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 04/16] tests: add test-error-report
Date: Tue, 21 Feb 2023 16:47:49 +0400
Message-Id: <20230221124802.4103554-5-marcandre.lureau@redhat.com>
In-Reply-To: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: rXXsqli28Rsa

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/unit/test-error-report.c | 121 +++++++++++++++++++++++++++++++++
 tests/unit/meson.build         |   1 +
 2 files changed, 122 insertions(+)
 create mode 100644 tests/unit/test-error-report.c

diff --git a/tests/unit/test-error-report.c b/tests/unit/test-error-report.c
new file mode 100644
index 0000000000..b09650687b
--- /dev/null
+++ b/tests/unit/test-error-report.c
@@ -0,0 +1,121 @@
+/*
+ * Error reporting test
+ *
+ * Copyright (C) 2022 Red Hat Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "glib-compat.h"
+#include <locale.h>
+
+#include "qemu/error-report.h"
+
+static void
+test_error_report_simple(void)
+{
+    if (g_test_subprocess()) {
+        error_report("%s", "test error");
+        warn_report("%s", "test warn");
+        info_report("%s", "test info");
+        return;
+    }
+
+    g_test_trap_subprocess(NULL, 0, 0);
+    g_test_trap_assert_passed();
+    g_test_trap_assert_stderr("\
+test-error-report: test error*\
+test-error-report: warning: test warn*\
+test-error-report: info: test info*\
+");
+}
+
+static void
+test_error_report_loc(void)
+{
+    if (g_test_subprocess()) {
+        loc_set_file("some-file.c", 7717);
+        error_report("%s", "test error1");
+        loc_set_none();
+        error_report("%s", "test error2");
+        return;
+    }
+
+    g_test_trap_subprocess(NULL, 0, 0);
+    g_test_trap_assert_passed();
+    g_test_trap_assert_stderr("\
+test-error-report:some-file.c:7717: test error1*\
+test-error-report: test error2*\
+");
+}
+
+static void
+test_error_report_glog(void)
+{
+    if (g_test_subprocess()) {
+        g_message("gmessage");
+        return;
+    }
+
+    g_test_trap_subprocess(NULL, 0, 0);
+    g_test_trap_assert_passed();
+    g_test_trap_assert_stderr("test-error-report: info: gmessage*");
+}
+
+static void
+test_error_report_once(void)
+{
+    int i;
+
+    if (g_test_subprocess()) {
+        for (i = 0; i < 3; i++) {
+            warn_report_once("warn");
+            error_report_once("err");
+        }
+        return;
+    }
+
+    g_test_trap_subprocess(NULL, 0, 0);
+    g_test_trap_assert_passed();
+    g_test_trap_assert_stderr("\
+test-error-report: warning: warn*\
+test-error-report: err*\
+");
+}
+
+static void
+test_error_report_timestamp(void)
+{
+    if (g_test_subprocess()) {
+        message_with_timestamp = true;
+        warn_report("warn");
+        error_report("err");
+        return;
+    }
+
+    g_test_trap_subprocess(NULL, 0, 0);
+    g_test_trap_assert_passed();
+    g_test_trap_assert_stderr("\
+*-*-*:*:* test-error-report: warning: warn*\
+*-*-*:*:* test-error-report: err*\
+");
+}
+
+int
+main(int argc, char *argv[])
+{
+    setlocale(LC_ALL, "");
+
+    g_test_init(&argc, &argv, NULL);
+    error_init("test-error-report");
+
+    g_test_add_func("/error-report/simple", test_error_report_simple);
+    g_test_add_func("/error-report/loc", test_error_report_loc);
+    g_test_add_func("/error-report/glog", test_error_report_glog);
+    g_test_add_func("/error-report/once", test_error_report_once);
+    g_test_add_func("/error-report/timestamp", test_error_report_timestamp);
+
+    return g_test_run();
+}
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index ffa444f432..015e8131df 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -11,6 +11,7 @@ tests = {
   'check-qobject': [],
   'check-qjson': [],
   'check-qlit': [],
+  'test-error-report': [],
   'test-qobject-output-visitor': [testqapi],
   'test-clone-visitor': [testqapi],
   'test-qobject-input-visitor': [testqapi],
-- 
2.39.2

