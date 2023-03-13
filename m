Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp170426ejb;
        Mon, 13 Mar 2023 04:45:35 -0700 (PDT)
X-Google-Smtp-Source: AK7set9OizDHirNAw7gdkwL7UGDp1AOTzmZNvNHSaOzUbNyDcx4QH/hkpfYWXI78Bp1lAG6UMrjR
X-Received: by 2002:a05:6214:2301:b0:56e:a2cb:5732 with SMTP id gc1-20020a056214230100b0056ea2cb5732mr13317471qvb.9.1678707935217;
        Mon, 13 Mar 2023 04:45:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678707935; cv=none;
        d=google.com; s=arc-20160816;
        b=jEhs1TlTsMm1eh0O+2d9yL0pqG0mppdsOCp2cJNfoy8DlslpYjtAnAKSlxWkLNZlBs
         afJzrC64tkPYDmv3CL+RjYm9jtrHXUzmSwboboim4kT/JZLr1ID42q6A7F1ru7691aKC
         K42iVL9c/LuBBt0AIDto0xiP6D9h5lWRBU+LNXHkBUIfq5qBq0PaiVoG7crNWB8Uk3Xc
         dLN4o1IDr0wal6E+uVinjKFuOb3FjbNYIZgUDMk1+YvKT7qFnJs+f4HGm0AxaEvLTXWP
         0LewvawThoLuN5DJj4o61oqegZ2oD0dTdXUV549BXyhE4i3Tb1sWuwto9IJH4rZc2JCU
         xjWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=R25bg50OqmzQ3Y5wEs/8TI7A4DH0Jw/sYrrM0K5yItY=;
        b=xRMnbw0O5Rjuk+kEEa2GQ/UnfW9b/jcDwKe+D/UKFy8M/NPB2a1NoZvH6W9VY02h8L
         X4fiWI1pUVo6q6xLsjXi4yTS5v5o6a1Nnop8GHJ42wDrFMVy988I1feGoXp4iH40PKUo
         bgfo4c3iNItJsSbi/lbC85rLwHPK2QHM7JqqnT3UBsFhmz7NQ1wq7f/LjRZbMhHUrbgI
         lZGAFMcR0UrRtNhWUrMmVOIz6WcQ1BoFtOEd1WxEuvPo7OllJvBQyulflu8bk48NeR3u
         lYikmrbDvMl1NJKU82SV02Ql6dXGAYDwsGJr2Cd+dXXxexzAWh6Ta6styzXiR8j6RrGc
         ixTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vhpfswx5;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id y5-20020a0cd985000000b0056f1dbe897dsi4923614qvj.269.2023.03.13.04.45.35
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:45:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vhpfswx5;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678707934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R25bg50OqmzQ3Y5wEs/8TI7A4DH0Jw/sYrrM0K5yItY=;
	b=Vhpfswx5zFLiiEBUuIlfRwZs5n3I5Oeai22oDZdMcv221hLw/gWjuwWZKblEkTLMEzEApI
	vDOmdJ4eebz9D/t4UL/lZu+tBXkV0+JIUf+tmXS69huuK1WNje/CThYOwyCfDXEYofmDYI
	5DqiqQHm1c/sUNuf3Z5mVRU/A4X/e0I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-kQZA9i1XMh-k56y4L3HaIg-1; Mon, 13 Mar 2023 07:45:31 -0400
X-MC-Unique: kQZA9i1XMh-k56y4L3HaIg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4344F1C04324;
	Mon, 13 Mar 2023 11:45:31 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4A2734042AC3;
	Mon, 13 Mar 2023 11:45:29 +0000 (UTC)
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
Subject: [PULL 24/25] qtest: enable vnc-display test on win32
Date: Mon, 13 Mar 2023 15:43:34 +0400
Message-Id: <20230313114335.424093-25-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-TUID: d4U7Z1NN/hIM

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
