Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3006664lfg;
        Mon, 3 May 2021 14:10:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZdVNERvebydBKr0Fp42xUTTio5OuTULPOHIRDaRBAQ06Tl4ka5tWhOFhciWLkvZrTl+0z
X-Received: by 2002:a05:6402:50c6:: with SMTP id h6mr6296312edb.327.1620076241570;
        Mon, 03 May 2021 14:10:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620076241; cv=none;
        d=google.com; s=arc-20160816;
        b=UtOZ7uBoCWgbnWG0avHRV8xn32e8M4+a52LGJ1vBgHNRj8uSAGDhP0njeht/M1mN/J
         ilpYSf5pTzJAhGrcQcriPMPEu42LJ5AfLNPFw3CaQGdptg9/7hqbl2BfXBx3kd+8nVR1
         APf2SYjA1hINEyKyulV3H9WTbaqZs5zDVhqzQBMSCIgsoAOsZZw6VUYPpnLg1oUczDB+
         I/FoLN4Aq9dTEb6VyRWEf8jrmVAXM4MSXW+sCzJTN97yU8VgBJaEWgdMwCKi0L/SW7po
         v6jJLKJet+0vIag+44i/8ZB76K3x5iVrX+6zFIriI6muQwsrhMl+Rqst6sp4TLfXxPkJ
         nCKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KvNHYhxkAqUqa9h+Qg11UCChxb8z3nuwgPPE3IGPHzY=;
        b=U90sKG36IXNF/4rv2cetZyByluBnRRKRz4qQNKIFYCxKEQt6jVXcar+C+7FD6/Bi6d
         xRQUefUNwFJyU61aqxapeev45SIlfa5MPS1tfht0e5/aWDcXJ7Rd6J7xVp/XPko3E90v
         p/1aYd7PIVR3u6AMs4fAPjBjRRayiFmQuQHng+KgWGZWHni8lMyGHXJYGei33JlRnuHy
         hmXyJG1Olxi3zglSsyNBdyYbeOAM9OEbO7r7xzAk+TUBdEDbFvhlErV/sEoBNZyCD95+
         atqmd85O7D3RLJH4gf8X2nNzyJ2Kgl4tV/5JO6o4fMD/jm10xCfOLECUEL0WvpdOA9dk
         Pe9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c6GMeflL;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id u23si370808edo.583.2021.05.03.14.10.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 May 2021 14:10:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c6GMeflL;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620076240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KvNHYhxkAqUqa9h+Qg11UCChxb8z3nuwgPPE3IGPHzY=;
	b=c6GMeflLwgBNh5HJfnkv6yD7lw9puZf5hYbELqST3Ii1ajxG0/26l8H3q/KD0bpvlaeTSy
	ws29l8QcaPlh+ryeIh+2Y56gZ/EOY1cIUPMO/0NoBSSRdEw+X3F+t9vJdzqF27AzpWYUHl
	T46URzg68NUI6Z5Bcs2TR/8PWhnIJCk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-G8yFXah5NlaqQMqEv2ZlFQ-1; Mon, 03 May 2021 17:10:39 -0400
X-MC-Unique: G8yFXah5NlaqQMqEv2ZlFQ-1
Received: by mail-wr1-f71.google.com with SMTP id v2-20020a0560001622b0290106e28f8af8so4625698wrb.9
        for <alex.bennee@linaro.org>; Mon, 03 May 2021 14:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KvNHYhxkAqUqa9h+Qg11UCChxb8z3nuwgPPE3IGPHzY=;
        b=qbfSLEzG7fNjpB2ZZIc76G58DDrE6Y2wcw1TjDMGPQxW/S4zapw3zl7ulo+fuo61p2
         0ni0AnPIehCmqbP992eU5BYXPmq4y5B1O01txvswoyqiIFiVhXrE19jhEw8uBIm3cbyf
         lUGKNiftwC0Mmw5pOqNoZhr9gj0JD+IA1CLZx8HC/DRDfNc+MfYCEAA2W0FmqrK+H+Op
         Ctv+Q08ln+X+ILWIMbA2j7aqxtkjbXsqfJrsdMlJ92pTXqz86Gi79shn+a1jxfJTJnZN
         pHJOefPanKoPgeXXQSp+hUPF6Ub3zfQyfEPnVQqsUiny6RhuNuTFKxKWdq4lN8e9MrCJ
         g9Eg==
X-Gm-Message-State: AOAM533OvkYhW+6ZLtna7tIxAHaU6ltDkfGAYVEHF+yxYcmPZ16E/Qxp
	yuTztB9nMVeC33yPs7A80OXZfyjMb/Kf8uU2734Bh049fXKDwvloLVwNw0IGR+9D3zIubDUeEsu
	Xo0e11HQUCygkGYxL
X-Received: by 2002:a5d:6e85:: with SMTP id k5mr10219320wrz.384.1620076238147;
        Mon, 03 May 2021 14:10:38 -0700 (PDT)
X-Received: by 2002:a5d:6e85:: with SMTP id k5mr10219301wrz.384.1620076238038;
        Mon, 03 May 2021 14:10:38 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
        by smtp.gmail.com with ESMTPSA id c2sm742764wmr.22.2021.05.03.14.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 14:10:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v6 03/12] qtest: Add qtest_has_accel() method
Date: Mon,  3 May 2021 23:10:11 +0200
Message-Id: <20210503211020.894589-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503211020.894589-1-philmd@redhat.com>
References: <20210503211020.894589-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KeZlCdv7Bfss

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
index 71e359efcd3..2156b7e3972 100644
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
