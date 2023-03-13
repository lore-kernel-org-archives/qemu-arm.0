Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp171503ejb;
        Mon, 13 Mar 2023 04:47:05 -0700 (PDT)
X-Google-Smtp-Source: AK7set/hVc1MTUpaTnqTqFR2uBG7+tkU1BVF+g6M7DqvK2q7z2l4IOXBKOm7HhEZZiksMk4thos/
X-Received: by 2002:a17:906:3087:b0:8b1:7eda:702e with SMTP id 7-20020a170906308700b008b17eda702emr34202568ejv.32.1678708025111;
        Mon, 13 Mar 2023 04:47:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678708025; cv=none;
        d=google.com; s=arc-20160816;
        b=Ldmki3VKXNOOgl95DVG0nifaOoh1EDBbq0A3IWCmyG7jaRRI5VDmCZiHzGP8Cv8n4R
         1fHEzPGPoh2Zyf8nKLex/LrxI6nFvjgVBIxQzhoHVaaIqaWurlWtJa4B++0ODQqhnEtQ
         XCcTokp+gHGLkGJPNEM6KTrZEmsroas9gwDQSHTYVEHWr6EPCzzHeZvArKxJ/B8Y7BV1
         TguNtf/cSyVwoNE9uzn8reTMpqAZ0nSJ+RWUOpxV5NPp9domTDmSnLv6QmsVQXPqwYTW
         6SdExsQETTLU8zjAGdH6cutwgy42yCDKi0vUc3ZLQPDxYAGRdVNzHkiKs/eLMr5rkG7r
         0Jgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kXF6xwhHvbGVEA39/svzIufoa5QlnPAUqyPSW/tB6aw=;
        b=AGw+kd0+3DQE+SOdPSE+qpQkSOzNqUWqAQeY3RUmMM0OA1nqczHvrxwRjHBiFwuhdw
         DTfhC/+9qCIclYLkIKK72qobIAx+IPs7YEyIBYx3Lx/ReGF+HpIaRU1EwWhJ9+5iYwP9
         QpgTSxdOOihG6wxbwuSN0n2Rd/2jE4GNg70/GqW+KDWROXMQ91sCyY2sN6FX7rKbiz9O
         cyuGmLP9KJbPNO9Oer9ER6M72wmy6f52OIcXSbODsBsC8FVPCErk3Dms4JiqwLtfnict
         cpiD7S9KhgKJk9TwhEYfMgbR587BGNpJBYObTWEt2vpRplLyLgjLNVF7xFXp3FID99aL
         wOdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C1zqenTK;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id lc21-20020a170906dff500b008d02052ed2asi5136849ejc.637.2023.03.13.04.47.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:47:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C1zqenTK;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678708024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kXF6xwhHvbGVEA39/svzIufoa5QlnPAUqyPSW/tB6aw=;
	b=C1zqenTKXOBHC2qihzmresYFs3KBFLolc9+Szs/oVrKEuQpyYJw4A7udXwHLsl4dd0z7+b
	VhInLtTZTgkH7VuKP631GtR2D27xmwNLbcOYEfPJ4dJewUP/PbqTO8v0t28EWHyoPxmv7u
	jfGQKLAfmFOW9BlBVeX1Tfp0aCTnrcc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-lB2I-ezaPMGQyzKaN3P_Fw-1; Mon, 13 Mar 2023 07:47:01 -0400
X-MC-Unique: lB2I-ezaPMGQyzKaN3P_Fw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72CC21C04183;
	Mon, 13 Mar 2023 11:47:00 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AA4C91121315;
	Mon, 13 Mar 2023 11:46:59 +0000 (UTC)
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
Subject: [PULL v2 02/25] tests: use closesocket()
Date: Mon, 13 Mar 2023 15:46:25 +0400
Message-Id: <20230313114648.426607-3-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-TUID: oCrOJhx1k6+F

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Because they are actually sockets...

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230221124802.4103554-3-marcandre.lureau@redhat.com>
---
 tests/unit/socket-helpers.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/unit/socket-helpers.c b/tests/unit/socket-helpers.c
index eecadf3a3c..914b3aa0cf 100644
--- a/tests/unit/socket-helpers.c
+++ b/tests/unit/socket-helpers.c
@@ -117,13 +117,13 @@ static int socket_can_bind_connect(const char *hostname, int family)
 
  cleanup:
     if (afd != -1) {
-        close(afd);
+        closesocket(afd);
     }
     if (cfd != -1) {
-        close(cfd);
+        closesocket(cfd);
     }
     if (lfd != -1) {
-        close(lfd);
+        closesocket(lfd);
     }
     if (res) {
         freeaddrinfo(res);
-- 
2.39.2
