Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp169196ejb;
        Mon, 13 Mar 2023 04:44:03 -0700 (PDT)
X-Google-Smtp-Source: AK7set8KsDmnw8Oe2k6nazyhdYmgU9sBJxgSFWh+atO872Ju5/OZ78OA0lRFvggIYphpQfqhSSBK
X-Received: by 2002:a05:622a:18c:b0:3bf:a760:cb5 with SMTP id s12-20020a05622a018c00b003bfa7600cb5mr25544500qtw.4.1678707843049;
        Mon, 13 Mar 2023 04:44:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678707843; cv=none;
        d=google.com; s=arc-20160816;
        b=qZ3kd+qYgRRe4VWEZDE1I99x+JC2dJSmkoEtwiwPxv1J2Q2y5HjdG9ZlZbmncgdLYb
         mGHz2eiG9o/ZRONACTwSqtX9dncQvbfZ5R+4LFTSNBE78UnqSAh7D3YY6pK3+JRJTKrf
         oAmM5z/zz8GnnI4yUbKe41j0hNVp5uNokEAEXfZw5m2umUUN/pjiTIDtV77GrQ8pzCAg
         bvPBCRaw/J4QibZpIL5MWB89wVhALEgWRAcObyIDSQAwS10z0ENGunY+k09hh30zl9/V
         AAEet3YzxckkZl+LLLItzg5XVo59ARBku/Ralf2o919ZwJFT7JQ8iEIKPYVpZBmn2ham
         PYmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cfNV7RjaIOfN3Dn3L+A2QafZQ00IrJbP8L8rITkyTzs=;
        b=vu1uEs9a4eSfeM0GZRdVysMvlD1rtMqTu/KgY929tHtpSOzOz+Bo3MhRnkZ8FDAYDG
         0WZWi0WuETog0hy1ikinAbDfABNDCZEEzBEMNVSNTlscFSTeTGs3V4wLLswxBMnonw8X
         zZ1Q1+fN9wTdF+e+N4WwvSi9YCLclNQYq6iT6L3K/vAjoUdDjoDQKHIGNphTqcKkx7vh
         yCxZH287TZRaqkrQp3YugkRHmKeP4kKOOUSWvNDoXIU3UOdyxyIHSNm03FGjU6g6pRDK
         8eZFtNjcoMZActYtX2VB5pEq6F8u+19Oh56Km8vCAd+5gYSLuZGULoA8hMmAJhXJyS7F
         Pt3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Fn+18//L";
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id j186-20020a3787c3000000b007437c394894si4627065qkd.405.2023.03.13.04.44.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:44:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Fn+18//L";
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678707842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cfNV7RjaIOfN3Dn3L+A2QafZQ00IrJbP8L8rITkyTzs=;
	b=Fn+18//LujmnHmZEgNc5saxo4FM4goVOeVvOA8kKndO58xaYwkR5rLykiNhW0suU+rrSmq
	0XrIj+kPsshKXlkQ8mlrHxFa1MagTiyGOVLlwzA1vKnRMiyGl2EmHifL59hTymB6C3wJQd
	IxbuFoIcZPdQhl3aEDWPyBSZwj+L2LI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-Tu8sZAyMPNee9W2I-eQybA-1; Mon, 13 Mar 2023 07:43:59 -0400
X-MC-Unique: Tu8sZAyMPNee9W2I-eQybA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C61051818E6A;
	Mon, 13 Mar 2023 11:43:58 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F21E40C6E67;
	Mon, 13 Mar 2023 11:43:57 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Stefan Weil <sw@weilnetz.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Roth <michael.roth@amd.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Fam Zheng <fam@euphon.net>,
	Hanna Reitz <hreitz@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Jason Wang <jasowang@redhat.com>
Subject: [PULL 04/25] tests: add test-error-report
Date: Mon, 13 Mar 2023 15:43:14 +0400
Message-Id: <20230313114335.424093-5-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-TUID: qqVBsYQ+Xna+

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
