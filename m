Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp171691ejb;
        Mon, 13 Mar 2023 04:47:20 -0700 (PDT)
X-Google-Smtp-Source: AK7set9a82KBCBnP9CdKF+ElPNc2Ndbclt55NF32dXCzl2btm78DOw6dHUf2iJuTpsFdxh2zDZQD
X-Received: by 2002:a05:6214:27c1:b0:56e:a6c6:445a with SMTP id ge1-20020a05621427c100b0056ea6c6445amr13155261qvb.31.1678708040234;
        Mon, 13 Mar 2023 04:47:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678708040; cv=none;
        d=google.com; s=arc-20160816;
        b=ywX6qthtJArQP6QT3EefZ2NmzdJ3OGJtLaNaq1duwoOpTGT2X7QVkH7IKZKpmor0D8
         xbYCcQ3qynJJsD1h4F9VgG6zJkUOCLGUN7eUdj0n2JfBlAPhqYGE5ZgYXvjZpK0cfmWm
         WE3FMBu+m89eMPbjXfq5JvgvKdVlUp0v0uR73YbTglh1m0hKlv0/ALjiSJYWOU5nXRAz
         kEypWrgXW6RtHlw/qBn0aKRdNDVjNytXauYs9PLoMQttKp3PVN4/0M7I12MpIgNhcd8u
         O8tuzY8AeKbLD7gAtRuQZQTiTqH1moTTWhN2cMAmWOtdMctrXVe3Hmh1V5/mhYH4PnHZ
         jKOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4gzdeG8JG14oBGCiEmZ9KbDQRdYnK6I+do8sqYfYSKI=;
        b=RLOItBC7DgsTUOiRYgtorqZTtklf8pQHKs2mk7N+y6/LPnAx7W4ZuK1wFkSRW4DrpY
         929746Oa4Dm2UlWuTD/EsZF35ZigMQNcEff+znY8kNEb9XA4FixVe4bjjEybZdsOUFmf
         NgIVGQ/zTa5gpdAgMdsIHaW5li0ApbI2xF/G1Ekzn1Y0z6EFfxfr1DAdzHwU2HSWVjs7
         exPY2f0P+nje4jq/tCWwMPNe0lSfiQXj/Q8etbXVel8P2cFRtrOuX9tZTQDonqqC07BC
         S+GqoSM/v64qF+8msiJVQ6AfYu8AIW+YCGUbZ5+5jlKVCt4ZKg5mMzhkVSl6oBeoNiA4
         rQ/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a2w6Ttdj;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id q3-20020a0c9a43000000b005a1ad63b3d4si4659541qvd.65.2023.03.13.04.47.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:47:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a2w6Ttdj;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678708039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4gzdeG8JG14oBGCiEmZ9KbDQRdYnK6I+do8sqYfYSKI=;
	b=a2w6Ttdj/SmaxVmRUf5kiThCGSr7mjIVlMrslLyLt3cSzKsa/Xif6/HMxbLBO2ECTax4bY
	MrxepoTVI6NMHuHBGZbkPYIXtJBlkYEdxiRO3Yjs5CGiPEgRLRCcOizPnDvsazZD+1So/u
	AAr/0HgM0QnFygQNjc5okp77YSlIa3s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-EzeXC2bTPLaWFNivBwP3kQ-1; Mon, 13 Mar 2023 07:47:14 -0400
X-MC-Unique: EzeXC2bTPLaWFNivBwP3kQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 109A03C10227;
	Mon, 13 Mar 2023 11:47:14 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 151BE47507A;
	Mon, 13 Mar 2023 11:47:12 +0000 (UTC)
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
Subject: [PULL v2 05/25] error: add global &error_warn destination
Date: Mon, 13 Mar 2023 15:46:28 +0400
Message-Id: <20230313114648.426607-6-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-TUID: IWEvHOjpUxCP

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This can help debugging issues or develop, when error handling is
introduced.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Message-Id: <20230221124802.4103554-6-marcandre.lureau@redhat.com>
---
 include/qapi/error.h           |  6 ++++++
 tests/unit/test-error-report.c | 18 ++++++++++++++++++
 util/error.c                   | 10 +++++++---
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/include/qapi/error.h b/include/qapi/error.h
index d798faeec3..f21a231bb1 100644
--- a/include/qapi/error.h
+++ b/include/qapi/error.h
@@ -519,6 +519,12 @@ static inline void error_propagator_cleanup(ErrorPropagator *prop)
 
 G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(ErrorPropagator, error_propagator_cleanup);
 
+/*
+ * Special error destination to warn on error.
+ * See error_setg() and error_propagate() for details.
+ */
+extern Error *error_warn;
+
 /*
  * Special error destination to abort on error.
  * See error_setg() and error_propagate() for details.
diff --git a/tests/unit/test-error-report.c b/tests/unit/test-error-report.c
index b09650687b..54319c86c9 100644
--- a/tests/unit/test-error-report.c
+++ b/tests/unit/test-error-report.c
@@ -12,6 +12,7 @@
 #include <locale.h>
 
 #include "qemu/error-report.h"
+#include "qapi/error.h"
 
 static void
 test_error_report_simple(void)
@@ -103,6 +104,22 @@ test_error_report_timestamp(void)
 ");
 }
 
+static void
+test_error_warn(void)
+{
+    if (g_test_subprocess()) {
+        error_setg(&error_warn, "Testing &error_warn");
+        return;
+    }
+
+    g_test_trap_subprocess(NULL, 0, 0);
+    g_test_trap_assert_passed();
+    g_test_trap_assert_stderr("\
+test-error-report: warning: Testing &error_warn*\
+");
+}
+
+
 int
 main(int argc, char *argv[])
 {
@@ -116,6 +133,7 @@ main(int argc, char *argv[])
     g_test_add_func("/error-report/glog", test_error_report_glog);
     g_test_add_func("/error-report/once", test_error_report_once);
     g_test_add_func("/error-report/timestamp", test_error_report_timestamp);
+    g_test_add_func("/error-report/warn", test_error_warn);
 
     return g_test_run();
 }
diff --git a/util/error.c b/util/error.c
index 1e7af665b8..5537245da6 100644
--- a/util/error.c
+++ b/util/error.c
@@ -27,8 +27,9 @@ struct Error
 
 Error *error_abort;
 Error *error_fatal;
+Error *error_warn;
 
-static void error_handle_fatal(Error **errp, Error *err)
+static void error_handle(Error **errp, Error *err)
 {
     if (errp == &error_abort) {
         fprintf(stderr, "Unexpected error in %s() at %s:%d:\n",
@@ -43,6 +44,9 @@ static void error_handle_fatal(Error **errp, Error *err)
         error_report_err(err);
         exit(1);
     }
+    if (errp == &error_warn) {
+        warn_report_err(err);
+    }
 }
 
 G_GNUC_PRINTF(6, 0)
@@ -71,7 +75,7 @@ static void error_setv(Error **errp,
     err->line = line;
     err->func = func;
 
-    error_handle_fatal(errp, err);
+    error_handle(errp, err);
     *errp = err;
 
     errno = saved_errno;
@@ -284,7 +288,7 @@ void error_propagate(Error **dst_errp, Error *local_err)
     if (!local_err) {
         return;
     }
-    error_handle_fatal(dst_errp, local_err);
+    error_handle(dst_errp, local_err);
     if (dst_errp && !*dst_errp) {
         *dst_errp = local_err;
     } else {
-- 
2.39.2
