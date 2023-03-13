Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp172830ejb;
        Mon, 13 Mar 2023 04:48:50 -0700 (PDT)
X-Google-Smtp-Source: AK7set9jISh13+fuzGWLrIwC4VOkcCX+ncdo2V9iFgBWUTHzUz16F7o1KvEOs8Le7vrs3uyS+jhV
X-Received: by 2002:ad4:4ea1:0:b0:5aa:17d5:bc2d with SMTP id ed1-20020ad44ea1000000b005aa17d5bc2dmr1328853qvb.32.1678708129982;
        Mon, 13 Mar 2023 04:48:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678708129; cv=none;
        d=google.com; s=arc-20160816;
        b=V4hWTSAZF9K9gFkdhoIlVBAyKt2su9e0pFVndI5Hn8ZeJqDjIkFj9Ny2ExvHX3BhmV
         7L2+DrtW7m31eAJF4xXjORhGSE2rJ/XsdPXj9yLrTCw4pCyZv5dZF0CLcH4AU/RwZZno
         IxJb1o3WlrKdzyIh1svtpexELU050+QZ0XL1PJ7lKoMpX6g8j25ieZEHWeXCjQaxvUC4
         HtRvmzT0zlHPr8Y0k7Urv9hYTc+k3ktOgNoHFlEr4r+GrC90cgNsrx9F3i6T8h0LVosz
         tk9srN9R6oyVXkFVeg1pkiFvvY35mTZRXAAIFZ1wSfEBmwCpQtHwMqlhHcONE32QxFz5
         9uMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=R25bg50OqmzQ3Y5wEs/8TI7A4DH0Jw/sYrrM0K5yItY=;
        b=xudh46UVivYqliNXaeT2yQSo5+MYFqLGywuEMnz6Hd3/7WeHFBGh8CKXW+XXgXUj0Z
         /ZTrpW4MmWLtNgOA2NGY8I7aK3hAFbYxJb8/boYNrZbOfSoF1ksqGEUlODtK7ZCB0Ywx
         TDHROi+WvI1CcZlMyQhPHP6FxpIKiBIOzD8sfyym7LhsNpKSEJ+76ga7jRKNEzBrg7UF
         MV3gvehs+PWjQyMgfdWZ0Hkn+yGFOiFWQHHkwp+d5KKZEolofCBU0KUL9UEmymdev7fT
         rsb1481JWCjlf+F+xnYf9mkpWqsyTcUOeEUDpgQKlACpZ3zz/evgj8Vu60JRRWEpjuXb
         MV+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D+nFBU4v;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id o11-20020a0ccb0b000000b0056eb4187816si4689870qvk.221.2023.03.13.04.48.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:48:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D+nFBU4v;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678708129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R25bg50OqmzQ3Y5wEs/8TI7A4DH0Jw/sYrrM0K5yItY=;
	b=D+nFBU4vAPMBN6gAWKCnyQ6ugBiKSglI55lw+nrWnSQOF6Nh77WAMI0wm0gSspQkC/M+1b
	6BV9UuNM1avp42XD8SvxQigZwiPoMac2nplyg9y5jcCU5p0Z3gXGqbwUaIlZHEOEWvN3Fd
	gy4OANXpMDtJvzJylv/1oq25GWn1Zs4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-4cQTnbtFMHKNpqfH7IWPzQ-1; Mon, 13 Mar 2023 07:48:43 -0400
X-MC-Unique: 4cQTnbtFMHKNpqfH7IWPzQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 004733C02B6B;
	Mon, 13 Mar 2023 11:48:43 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 38C654042AC0;
	Mon, 13 Mar 2023 11:48:41 +0000 (UTC)
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
Subject: [PULL v2 24/25] qtest: enable vnc-display test on win32
Date: Mon, 13 Mar 2023 15:46:47 +0400
Message-Id: <20230313114648.426607-25-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-TUID: /T+LXjNy4lhu

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Now that qtest_qmp_add_client() works on win32, we can enable the VNC
test.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230306122751.2355515-11-marcandre.lureau@redhat.com>
---
 tests/qtest/vnc-display-test.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/vnc-display-test.c b/tests/qtest/vnc-display-test.c
index e52a4326ec..f8933b0761 100644
--- a/tests/qtest/vnc-display-test.c
+++ b/tests/qtest/vnc-display-test.c
@@ -19,7 +19,7 @@ typedef struct Test {
     GMainLoop *loop;
 } Test;
 
-#if !defined(WIN32) && !defined(CONFIG_DARWIN)
+#if !defined(CONFIG_DARWIN)
 
 static void on_vnc_error(VncConnection* self,
                          const char* msg)
@@ -38,10 +38,7 @@ static void on_vnc_auth_failure(VncConnection *self,
 static bool
 test_setup(Test *test)
 {
-#ifdef WIN32
-    g_test_skip("Not supported on Windows yet");
-    return false;
-#elif defined(CONFIG_DARWIN)
+#if defined(CONFIG_DARWIN)
     g_test_skip("Broken on Darwin");
     return false;
 #else
@@ -59,7 +56,12 @@ test_setup(Test *test)
     g_signal_connect(test->conn, "vnc-auth-failure",
                      G_CALLBACK(on_vnc_auth_failure), NULL);
     vnc_connection_set_auth_type(test->conn, VNC_CONNECTION_AUTH_NONE);
+
+#ifdef WIN32
+    vnc_connection_open_fd(test->conn, _get_osfhandle(pair[0]));
+#else
     vnc_connection_open_fd(test->conn, pair[0]);
+#endif
 
     test->loop = g_main_loop_new(NULL, FALSE);
     return true;
-- 
2.39.2
