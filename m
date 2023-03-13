Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp171612ejb;
        Mon, 13 Mar 2023 04:47:14 -0700 (PDT)
X-Google-Smtp-Source: AK7set/jFBThNltc55K2o4k0Dm6nk4QRp7mPpqfVy0NxMcKQgUnZGFskGTTdcndsfnWBYx/HFfAe
X-Received: by 2002:a05:622a:38d:b0:3b9:c889:ec24 with SMTP id j13-20020a05622a038d00b003b9c889ec24mr61336867qtx.12.1678708034433;
        Mon, 13 Mar 2023 04:47:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678708034; cv=none;
        d=google.com; s=arc-20160816;
        b=ANeZf70PgKjre2X02HzRgR1iDugVwsX5cBQdX87aq9Xfm62oL6/9iEulaQ94eRmikH
         cE0PIRQ6huDcUilS+oSMuixddbeJ5MV69mYNC8/XhpzOu5nawK4/CU5PoyPJwMGXUSRh
         U1ND2ZFIkq10A7aBrixn7s+QQjxFe9hJY6Zn1JPsKLuvuhY9S0Ny3btQhvBW7HRgX/Az
         dkrX8XosiGyVf7h/yeDZRFO/VF4eE7oCrLZExayVztuZVlBD97lQ7kuF4xRI56kKgHpr
         CK7yhsnch+Rl4f6zQKvQtPUkyfPDjpj4lLN4l4ajVqY7f9dL1kHTzNV3GR95kmBBdAk5
         LLVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cfNV7RjaIOfN3Dn3L+A2QafZQ00IrJbP8L8rITkyTzs=;
        b=TEK7xQWyinb2VF5yBrlvzahUwV+9d6vOF3EIy12Hg9AAyGVt90X0YU9pZFtVxR9J3/
         GtiTEDqVOvM8GlgUh6Ukyrvt/tVOgk8QdrCr8BhvzQXxOdkPntIy6tZ+s/1hJPdzd4cz
         RQxXrxhm+T5fjGTyAgbGxolw9fFWUxfI0hiOA1XahDM3zI6TOjBYFQRinqiSnRg8esXx
         3a93m8yBxaA8CF4+jRnySqnC4uppCsA8VevSd+TH1rS19FsWCBRd0BJ1uVRJiECOueoh
         fCRVxHfaRm2Hje1RI2t2hkuhlh09LE+pRJxssR7kfV+Spaw6tgyYlxErG3teXuF9PM2+
         Hcsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aeH4hRcE;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id v11-20020a05622a130b00b003bfba5b73fesi5119709qtk.369.2023.03.13.04.47.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:47:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aeH4hRcE;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678708034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cfNV7RjaIOfN3Dn3L+A2QafZQ00IrJbP8L8rITkyTzs=;
	b=aeH4hRcEz/1Ku+jh/8ygqmPR006XbCCPykeYiEpQmCYTr0utEWKqazqjlPOI7kpbmi65Ry
	fbjDGLKSnmT/YmkWkrc2tsaX2sXX8Igb8n8wM2YyJVcSrF7DHBnKMQmEkIgsvW/nFILWSx
	z/GfGWnHL9rTelTzQlPqdVEWMc0hqqk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-SV6MaOKuNhavlkg6HEpVrg-1; Mon, 13 Mar 2023 07:47:11 -0400
X-MC-Unique: SV6MaOKuNhavlkg6HEpVrg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4970A857A87;
	Mon, 13 Mar 2023 11:47:10 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EF85F202701E;
	Mon, 13 Mar 2023 11:47:08 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefan Weil <sw@weilnetz.de>,
	Thomas Huth <thuth@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Beraldo Leal <bleal@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PULL v2 04/25] tests: add test-error-report
Date: Mon, 13 Mar 2023 15:46:27 +0400
Message-Id: <20230313114648.426607-5-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-TUID: EV8cFt+6GGCe

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Message-Id: <20230221124802.4103554-5-marcandre.lureau@redhat.com>
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
index d9c0a7eae6..fa63cfe6ff 100644
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
