Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp169247ejb;
        Mon, 13 Mar 2023 04:44:08 -0700 (PDT)
X-Google-Smtp-Source: AK7set93+Uw0yI9928dZYlo6V/F3SXNur5x3fF2VW17LVCO52DE1L3CGeRuC4EsZ+wcxWEDYuqwI
X-Received: by 2002:ac8:7f49:0:b0:3bf:d184:7ca2 with SMTP id g9-20020ac87f49000000b003bfd1847ca2mr55352113qtk.21.1678707848042;
        Mon, 13 Mar 2023 04:44:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678707848; cv=none;
        d=google.com; s=arc-20160816;
        b=CsTKM2wIextQyl+2i6Y3hf4c9hZ+doSRjCJT+8VvVN/AiLQCoNG7M0zqKWdHu0gAFc
         RSn7ENLDukZueLcgvMge8Kr0h3SgefKs+RxlihJJQ+b5AdEOTzUR/os3awL+K84XfIbD
         xvQPic6vQcnN/WhNr5sBv9QX8mmJOTI0XhS8Q0lZw9zlIKOM/pqQsqz5TCeSmfe9LhZ4
         QcZBjyz9K071F6nTjOsHjZ9tziZbAnkc11IDoqEc7vwIyFLFY7h85pasegYdj1GzlQRV
         R+VVdjLaFn5g4f9v63jA3rncMImV8mYf/Dg3ntrM8UgZcb33ZbAMhJ+lmfEgdLgBIHng
         lRqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4gzdeG8JG14oBGCiEmZ9KbDQRdYnK6I+do8sqYfYSKI=;
        b=wKzOeor5/ebtvbmQVZLnCoDdSf5Gdnwv7lPt3RK71KD8tdEACwq0G00lVvs6DhSMRJ
         nn+7z7r7fbh9xQ6CugbmR/YK9VjvcF2MxeuFoWroPY+dRRGmxGQRccpq8zCyLkZgEer7
         2HgGeWWXHXjlf6QpREZPy88/bXGEh9ZNCwRDFpgTjqk9fOaRKbjmdtL4hdKeb/4z9lXv
         S/eKr4/Oyf0PE9K2cJUdicrQ9dlDzPBbNL9Kjmp0usRq1hzL1751UuQmv5VdbK35jxfI
         6hg6uSbIHA2ouoyFhJ4PrUfqRVrmwzimNjHMD/8e+EZtQaQiINlw1ZGH1geXGG4/TjzJ
         k3DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F0qZs3tF;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 67-20020a370b46000000b007458e361b7dsi1314352qkl.159.2023.03.13.04.44.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:44:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F0qZs3tF;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678707847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4gzdeG8JG14oBGCiEmZ9KbDQRdYnK6I+do8sqYfYSKI=;
	b=F0qZs3tFJX8wkXnkNpYjSDn2t8Ys3TqCO0nOOAkkXICP7FD5FHsJUKLkJ/3q9myAm+mjSV
	doOGqjqerH6lfLvn2py+5JhmsecWF1V54X7SOdEzxVXbt/P0KzrVsgyOsAIlWh9XYfffR0
	9GFcS8mMHqzyK5vXhY1XTAuK5HZ+Tjc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-184-3WwoBRzSM0Sad1v-0J7yJg-1; Mon, 13 Mar 2023 07:44:03 -0400
X-MC-Unique: 3WwoBRzSM0Sad1v-0J7yJg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 082253823A0E;
	Mon, 13 Mar 2023 11:44:03 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 041641410F1B;
	Mon, 13 Mar 2023 11:44:01 +0000 (UTC)
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
Subject: [PULL 05/25] error: add global &error_warn destination
Date: Mon, 13 Mar 2023 15:43:15 +0400
Message-Id: <20230313114335.424093-6-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-TUID: X97iSR0oRWUu

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
