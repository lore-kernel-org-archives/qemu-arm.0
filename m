Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp171786ejb;
        Mon, 13 Mar 2023 04:47:27 -0700 (PDT)
X-Google-Smtp-Source: AK7set8C4aqDiZvWaHc3BOh/mPnQHanKEmVagkVLYKHhINqYpRGJ8769O3/kB8waW0jXL8NugPRF
X-Received: by 2002:aa7:c781:0:b0:4fb:fd9f:737a with SMTP id n1-20020aa7c781000000b004fbfd9f737amr3871042eds.4.1678708047645;
        Mon, 13 Mar 2023 04:47:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678708047; cv=none;
        d=google.com; s=arc-20160816;
        b=cV5olEHRnrsH7nR3ZjjNLOYd1IAi9QqBVXnFKvGjXKtSeFav+ZTKbfFqxKCNGgHj5+
         BkBlU90rJd0pHc2DTh/C6Y+oFfZmuLJ0/E0PJF3oqYwq1DWFirhzgIZwNp41oGgwAPcD
         yDo9v2A/DYB+xYGddoyVH1RkPq3lsgH/1CGtgYgjENntIRtkqxW16dJxGxECfxY7g3Li
         /lh5cUW2DptLsa0sqV+pbjQYYXFf6Kb2nn4OH1LM+FZ9WSvBF3bzWzEl9gA6E4JCbwEM
         cWSdh7wiBWtKUFAt5wz+GZ6MwPoeM4wCVFInAVACNNLnB1ConJLFdb3f3K8XP4tdzq2F
         CuyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ctK4P0EoigpL6m8TzkfXT3GOpy1xxNQXZQbM5oEWJQs=;
        b=B/ZSMtpqAG53ZuV3Qe50QNT3mPfYPzp3Kk0DEErRSc9eDtOrza+T+EY4Fkkg+CgZ7C
         ++qaszScGj9dvqdRT79f7Er4Ig/FpzYYsmt0i/d7uHTnfRvcrQqNIa/yCL6+syqtAUXA
         JtuYNJBAe6as7fIh1npS0BBdWxqoqSSpjFmDMaqzNVLySlf7A9DwJosIQ0NItdrsutmQ
         3kJvXq62CyBlX1d40vraWJvCzvflx6zpRYIYh8hsWXaEJ2Go8J3PvQ6r5uhKc9hbM9w6
         cEcgxLmdmBZdW/fZHIUa07eVboUlqu9rlmz5q2ngh0JJH8Iijqeg9CK3u5EJv2Y+73Nk
         6opw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dcoj7Z74;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id g20-20020a056402181400b004fd228408c9si625276edy.222.2023.03.13.04.47.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:47:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dcoj7Z74;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678708046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ctK4P0EoigpL6m8TzkfXT3GOpy1xxNQXZQbM5oEWJQs=;
	b=Dcoj7Z74CxHEe94mT4XQZ/IS0j2dqhhIqQfbDD85aY1jsppvTLhY5e6iGwgKk+CzabBcXd
	CcCHRIqVHQQGugbUsyzXgpAgQLaCRmcBijZRiVaNIF+vjSmOxd9IQs+kiNgDKl7VXLvo+d
	gq+eixDO/dmVknrXsv8DaRjC7rQMNqw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-3MRgM9vJNA6nr-hhT6Sc7w-1; Mon, 13 Mar 2023 07:47:23 -0400
X-MC-Unique: 3MRgM9vJNA6nr-hhT6Sc7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10B6D86C164;
	Mon, 13 Mar 2023 11:47:23 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F0BE41121318;
	Mon, 13 Mar 2023 11:47:21 +0000 (UTC)
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
Subject: [PULL v2 07/25] win32/socket: introduce qemu_socket_unselect() helper
Date: Mon, 13 Mar 2023 15:46:30 +0400
Message-Id: <20230313114648.426607-8-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-TUID: voU+17Upoz+o

From: Marc-André Lureau <marcandre.lureau@redhat.com>

A more explicit version of qemu_socket_select() with no events.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Message-Id: <20230221124802.4103554-8-marcandre.lureau@redhat.com>
---
 include/sysemu/os-win32.h | 2 ++
 io/channel-socket.c       | 4 ++--
 util/oslib-win32.c        | 7 ++++++-
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index 9f842ae643..504a8966c3 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -169,6 +169,8 @@ static inline void qemu_funlockfile(FILE *f)
 bool qemu_socket_select(SOCKET s, WSAEVENT hEventObject,
                         long lNetworkEvents, Error **errp);
 
+bool qemu_socket_unselect(SOCKET s, Error **errp);
+
 /* We wrap all the sockets functions so that we can
  * set errno based on WSAGetLastError()
  */
diff --git a/io/channel-socket.c b/io/channel-socket.c
index 0bc29c4808..03757c7a7e 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -442,7 +442,7 @@ static void qio_channel_socket_finalize(Object *obj)
             }
         }
 #ifdef WIN32
-        qemu_socket_select(ioc->fd, NULL, 0, NULL);
+        qemu_socket_unselect(ioc->fd, NULL);
 #endif
         closesocket(ioc->fd);
         ioc->fd = -1;
@@ -846,7 +846,7 @@ qio_channel_socket_close(QIOChannel *ioc,
 
     if (sioc->fd != -1) {
 #ifdef WIN32
-        qemu_socket_select(sioc->fd, NULL, 0, NULL);
+        qemu_socket_unselect(sioc->fd, NULL);
 #endif
         if (qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_LISTEN)) {
             socket_listen_cleanup(sioc->fd, errp);
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index df752fc762..dbd32acc98 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -180,7 +180,7 @@ static int socket_error(void)
 void qemu_socket_set_block(int fd)
 {
     unsigned long opt = 0;
-    qemu_socket_select(fd, NULL, 0, NULL);
+    qemu_socket_unselect(fd, NULL);
     ioctlsocket(fd, FIONBIO, &opt);
 }
 
@@ -298,6 +298,11 @@ bool qemu_socket_select(SOCKET s, WSAEVENT hEventObject,
     return true;
 }
 
+bool qemu_socket_unselect(SOCKET s, Error **errp)
+{
+    return qemu_socket_select(s, NULL, 0, errp);
+}
+
 #undef connect
 int qemu_connect_wrap(int sockfd, const struct sockaddr *addr,
                       socklen_t addrlen)
-- 
2.39.2
