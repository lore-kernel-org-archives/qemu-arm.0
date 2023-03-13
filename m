Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp170102ejb;
        Mon, 13 Mar 2023 04:45:13 -0700 (PDT)
X-Google-Smtp-Source: AK7set9MLf6deIx2tu/gq7qMwUBiEYC8BdCOgq6SQ4j/oj1hsDHPfmhsWS1DtwYbltG/TFkPfQE2
X-Received: by 2002:a05:6214:21ee:b0:56e:93b6:27fc with SMTP id p14-20020a05621421ee00b0056e93b627fcmr11315033qvj.17.1678707913035;
        Mon, 13 Mar 2023 04:45:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678707913; cv=none;
        d=google.com; s=arc-20160816;
        b=E6drs/AMT1ZcW8gwS0c4IT2DNQx8HSq18SSszdSxPIjWzP7yKvx0xxIid7Q0ZM6wce
         9BS66SLZT6GYixa/SlvgvUCyRfRiweEsGYRfqykB2GCL/LGCJB6trEJjYldgTBr5B09O
         TYxp/xBXGIAbrPAYnWG4slRBU0VLapTvTUNfcN32VuxBRaFYWtV/YmkaA4X9jpX00h18
         Hwew8t5ZC4XtrhcmJZ8UOryNqZ2KLIT97xnbvmVYtPjMlqYEcFoUxev6FaOsEtBe3Cqv
         CX14pmwTDY23eskN51M4pVSfHBOjdMTG4lCz56aeAXcph4CX/EY93iIcOEOddnCCFkx4
         TiaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DlJpWzkaAkR3sDdRMPNxntR2XIIAqQPPi8tpLQwnpcQ=;
        b=U7ULmQX28qiUlSc0H72w541SN1oapi2dZvbf53P9XZ0XSnl7swuNgh5EBWX2oFVheH
         iBEBNF/qkZU/a9QKFrF4UQqlynpHaKSuystokipmrocazfedQT4LqW/Vq1wKHmBDBP5L
         wVK/aoGZsi94rNQg+puXpzpUOJsOKnMJGOQqlzl8nLapAmT89kkduFZuqIDKne+N3lpY
         RkWYfA7sY7rs4Ka+KbflBrTT6YMVUgiCrXS4/eFB1S6FkFt0T9e6CDnc4hrOTc/pEhpk
         fyBZ5LIhv1Pe0RuhDK6p8vPrCZ6ih2D5x3hbkqc3JEfL4R4a5UwXTuWeGsAiWzupJaKQ
         KghA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZtdCmE+C;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id w9-20020a0ce109000000b0056e9493e972si3331677qvk.441.2023.03.13.04.45.12
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:45:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZtdCmE+C;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678707912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DlJpWzkaAkR3sDdRMPNxntR2XIIAqQPPi8tpLQwnpcQ=;
	b=ZtdCmE+C9t0qP1MoQsfbLDTT0cRD1qPz2+jn/dw2/uoG/glQeA0T6eP2DCs5gYrF66Rj24
	O1LwWHoRv5EqmWpFKeuaa+pBLWtIqtUK3/zQw1sYKbQqa79bTP+80PchIgwR6GHVmj94+6
	15Lfcyh8MFh/2Xl3TiNBZErtpkQjocY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-nZ9MSheIM56EuV7NYwG-YA-1; Mon, 13 Mar 2023 07:45:09 -0400
X-MC-Unique: nZ9MSheIM56EuV7NYwG-YA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E4E285A588;
	Mon, 13 Mar 2023 11:45:08 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 690642166B26;
	Mon, 13 Mar 2023 11:45:07 +0000 (UTC)
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
Subject: [PULL 19/25] osdep: implement qemu_socketpair() for win32
Date: Mon, 13 Mar 2023 15:43:29 +0400
Message-Id: <20230313114335.424093-20-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: /k0InoHUR665

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Manually implement a socketpair() function, using UNIX sockets and
simple peer credential checking.

QEMU doesn't make much use of socketpair, beside vhost-user which is not
available for win32 at this point. However, I intend to use it for
writing some new portable tests.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230306122751.2355515-5-marcandre.lureau@redhat.com>
---
 include/qemu/sockets.h |   2 -
 util/oslib-win32.c     | 110 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 110 insertions(+), 2 deletions(-)

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 2b0698a7c9..d935fd80da 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -15,7 +15,6 @@ int inet_aton(const char *cp, struct in_addr *ia);
 bool fd_is_socket(int fd);
 int qemu_socket(int domain, int type, int protocol);
 
-#ifndef WIN32
 /**
  * qemu_socketpair:
  * @domain: specifies a communication domain, such as PF_UNIX
@@ -30,7 +29,6 @@ int qemu_socket(int domain, int type, int protocol);
  * Return 0 on success.
  */
 int qemu_socketpair(int domain, int type, int protocol, int sv[2]);
-#endif
 
 int qemu_accept(int s, struct sockaddr *addr, socklen_t *addrlen);
 /*
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 29a667ae3d..16f8a67f7e 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -310,6 +310,116 @@ bool qemu_socket_unselect(int sockfd, Error **errp)
     return qemu_socket_select(sockfd, NULL, 0, errp);
 }
 
+int qemu_socketpair(int domain, int type, int protocol, int sv[2])
+{
+    struct sockaddr_un addr = {
+        0,
+    };
+    socklen_t socklen;
+    int listener = -1;
+    int client = -1;
+    int server = -1;
+    g_autofree char *path = NULL;
+    int tmpfd;
+    u_long arg;
+    int ret = -1;
+
+    g_return_val_if_fail(sv != NULL, -1);
+
+    addr.sun_family = AF_UNIX;
+    socklen = sizeof(addr);
+
+    tmpfd = g_file_open_tmp(NULL, &path, NULL);
+    if (tmpfd == -1 || !path) {
+        errno = EACCES;
+        goto out;
+    }
+
+    close(tmpfd);
+
+    if (strlen(path) >= sizeof(addr.sun_path)) {
+        errno = EINVAL;
+        goto out;
+    }
+
+    strncpy(addr.sun_path, path, sizeof(addr.sun_path) - 1);
+
+    listener = socket(domain, type, protocol);
+    if (listener == -1) {
+        goto out;
+    }
+
+    if (DeleteFile(path) == 0 && GetLastError() != ERROR_FILE_NOT_FOUND) {
+        errno = EACCES;
+        goto out;
+    }
+    g_clear_pointer(&path, g_free);
+
+    if (bind(listener, (struct sockaddr *)&addr, socklen) == -1) {
+        goto out;
+    }
+
+    if (listen(listener, 1) == -1) {
+        goto out;
+    }
+
+    client = socket(domain, type, protocol);
+    if (client == -1) {
+        goto out;
+    }
+
+    arg = 1;
+    if (ioctlsocket(client, FIONBIO, &arg) != NO_ERROR) {
+        goto out;
+    }
+
+    if (connect(client, (struct sockaddr *)&addr, socklen) == -1 &&
+        WSAGetLastError() != WSAEWOULDBLOCK) {
+        goto out;
+    }
+
+    server = accept(listener, NULL, NULL);
+    if (server == -1) {
+        goto out;
+    }
+
+    arg = 0;
+    if (ioctlsocket(client, FIONBIO, &arg) != NO_ERROR) {
+        goto out;
+    }
+
+    arg = 0;
+    if (ioctlsocket(client, SIO_AF_UNIX_GETPEERPID, &arg) != NO_ERROR) {
+        goto out;
+    }
+
+    if (arg != GetCurrentProcessId()) {
+        errno = EPERM;
+        goto out;
+    }
+
+    sv[0] = server;
+    server = -1;
+    sv[1] = client;
+    client = -1;
+    ret = 0;
+
+out:
+    if (listener != -1) {
+        close(listener);
+    }
+    if (client != -1) {
+        close(client);
+    }
+    if (server != -1) {
+        close(server);
+    }
+    if (path) {
+        DeleteFile(path);
+    }
+    return ret;
+}
+
 #undef connect
 int qemu_connect_wrap(int sockfd, const struct sockaddr *addr,
                       socklen_t addrlen)
-- 
2.39.2
