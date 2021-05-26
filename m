Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp5615554lfm;
        Wed, 26 May 2021 10:05:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNsCqTfpy4xKrBc/aJK//ov0Mz292y9GTbY++wLzGmV9Fm9SVM22kZSgHVLII2GLluXr1o
X-Received: by 2002:aa7:d705:: with SMTP id t5mr3377015edq.347.1622048713856;
        Wed, 26 May 2021 10:05:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622048713; cv=none;
        d=google.com; s=arc-20160816;
        b=RwRhkL6AnTDfK3nHgGN2ngN0AFqPSN5fBzH+PsdPnosvL7GFzdfxPJG8G5xJ1/BIPl
         H+5DtuMTSWbBEs45jtM+eIR1f6NT0MzO2P4K6CYLXhanOCsZ8+L57MLWcsgK8ZjDE5E9
         sTPTtw/8Ri81UWxR6JO6dSWT+Pq88yOG4QSfDcgkEBGma7VwckPkZQ2HEN+6O6KXrS7n
         U/nW/Dba0Q/UST+atMVWun+1FM9MIhu/x8wjoUSLdbjlW1sKI3UqgvRZoqFuboSWzYAO
         /A02nMbkEJf96hRr8BZWziZ/XrrTwbv3UYwYUYB4b/40jweSZFmTx5tQ89eentyps5yX
         L2sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tsozEC/O65XrXttGJnvmQubqaZycdAh0e//OeWpacrI=;
        b=Vl0UiA2OsH3CCCUXLdqaRns7BZoxFJEPrGtsEI/HluuYGX4q1JHGHJnDmUuV9BvR8F
         riuG47mR5jzyeQdmhctfUlWY5ihcjnysBsk+u3FFd8UgRUGjs20kDHY59d6CnyUDsY79
         c5vDpZ9SCIdFnBWYkzCMpp9lL2gDjBSkBcphaoRfHPEJUDSzmSYH61UqwCryLSOo3wyF
         Akj9ZGxtDw1Q+2qSJ9wnbiZ/nALfoemJ31JIoSWwAO9ounM8OwayKoLgiGKwW5+pfQ22
         zNnYD7QJ0JDK/ZeNHJ4scngX4sYjC8bBWlNtkkz3ZgI31N1NrUrkW94WMXBDyDuIbHws
         DJDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ApDg/FL5";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id c17si20002224eds.113.2021.05.26.10.05.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 May 2021 10:05:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ApDg/FL5";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622048712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tsozEC/O65XrXttGJnvmQubqaZycdAh0e//OeWpacrI=;
	b=ApDg/FL51dMVaRqM/ClYXzEpGmWZCS+emYnb+s/tifYDI0dJZtu5maadojoWIxw/M2NRMX
	dvmtaPuvC3UAL+kTVax8Kicr0AsIls9aLEL2+vrvJBp84f+XAuZxZcKevmYaxFQnZj2df1
	1EXIJmmngwE+1zC2AHXHiFHY6+0XkjE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-6FYwnvQbOhOVRTIfhvptKw-1; Wed, 26 May 2021 13:05:11 -0400
X-MC-Unique: 6FYwnvQbOhOVRTIfhvptKw-1
Received: by mail-wr1-f72.google.com with SMTP id u5-20020adf9e050000b029010df603f280so593170wre.18
        for <alex.bennee@linaro.org>; Wed, 26 May 2021 10:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tsozEC/O65XrXttGJnvmQubqaZycdAh0e//OeWpacrI=;
        b=SeLwh4XxbL9gsXkfFxeCKle30C6bXdPcd3MqizmVFnh2wIJSO7FPl4Oi8hZ5jJNqJC
         n3Xqv8cuWQFlkQT2goVZdssZNrSNuDAEX+jsjix3rI71MFNx+zUadvKjI4QvqsqMnJ9G
         lEUULDis2BV+dvDsixodZUZYmQlzE+rSSDyGHxdEyKkbzBTTMR5dWr3fhIopDxPWT5C7
         wUBqcP6AjwS9LsIqHn2UV+3/DqtOXtSITCMEhERMiceozF+FGaPaR6udc5zQzkBzKBi4
         LyNf0kzGq+rCa+6OOSStqJv/Z1M8fQWC1HIj+i58KKrkG6fT6/VNTG8aMF1pI1zw4C5x
         kSwA==
X-Gm-Message-State: AOAM5318FZKWzjzySJznNmbxbAREfbDw9ajDUukzxpac9RdELKiMRwFC
	d44sjM7oT7ZU8y+aZtV+RJyqftdrHCH+aZ33eDBZwRWFvLNDsLlulIEdfDnm8KNgdGQYHWWy1hM
	z6WmoXthD2ZX4E7Uo
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr30088620wmq.138.1622048709960;
        Wed, 26 May 2021 10:05:09 -0700 (PDT)
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr30088602wmq.138.1622048709808;
        Wed, 26 May 2021 10:05:09 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (64.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.64])
        by smtp.gmail.com with ESMTPSA id p2sm21017502wrj.10.2021.05.26.10.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 10:05:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v8 03/12] qtest: Add qtest_has_accel() method
Date: Wed, 26 May 2021 19:04:23 +0200
Message-Id: <20210526170432.343588-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526170432.343588-1-philmd@redhat.com>
References: <20210526170432.343588-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: QVo7FGYfS/my

Introduce the qtest_has_accel() method which allows a runtime
query on whether a QEMU instance has an accelerator built-in.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/libqos/libqtest.h |  8 ++++++++
 tests/qtest/libqtest.c        | 29 +++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
index a68dcd79d44..d80c618c18d 100644
--- a/tests/qtest/libqos/libqtest.h
+++ b/tests/qtest/libqos/libqtest.h
@@ -763,6 +763,14 @@ void qmp_expect_error_and_unref(QDict *rsp, const char *class);
  */
 bool qtest_probe_child(QTestState *s);
 
+/**
+ * qtest_has_accel:
+ * @accel_name: Accelerator name to check for.
+ *
+ * Returns: true if the accelerator is built in.
+ */
+bool qtest_has_accel(const char *accel_name);
+
 /**
  * qtest_set_expected_status:
  * @s: QTestState instance to operate on.
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 825b13a44c7..6bda6e1f331 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -393,6 +393,35 @@ QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd)
     return qts;
 }
 
+bool qtest_has_accel(const char *accel_name)
+{
+    bool has_accel = false;
+    QDict *response;
+    QList *accels;
+    QListEntry *accel;
+    QTestState *qts;
+
+    qts = qtest_initf("-accel qtest -machine none");
+    response = qtest_qmp(qts, "{'execute': 'query-accels'}");
+    accels = qdict_get_qlist(response, "return");
+
+    QLIST_FOREACH_ENTRY(accels, accel) {
+        QDict *accel_dict = qobject_to(QDict, qlist_entry_obj(accel));
+        const char *name = qdict_get_str(accel_dict, "name");
+
+        if (g_str_equal(name, accel_name)) {
+            has_accel = true;
+            break;
+        }
+    }
+    qobject_unref(response);
+
+    qtest_quit(qts);
+
+    return has_accel;
+}
+
+
 void qtest_quit(QTestState *s)
 {
     qtest_remove_abrt_handler(s);
-- 
2.26.3
