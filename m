Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp169365ejb;
        Mon, 13 Mar 2023 04:44:16 -0700 (PDT)
X-Google-Smtp-Source: AK7set8k2PYqnXu0n0+KzfKJHvOKYMS5dOOlT/J0UYE/qbZPeXeG62TJ1I7iFxk9x8Flb6NUIyia
X-Received: by 2002:a17:907:d02:b0:8b1:7eba:de5 with SMTP id gn2-20020a1709070d0200b008b17eba0de5mr12047729ejc.10.1678707856549;
        Mon, 13 Mar 2023 04:44:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678707856; cv=none;
        d=google.com; s=arc-20160816;
        b=vgWW/S5P9qqxQD6MXM5SmB8JvVYP4AG16T8mMYFGKhq7+6o2++LfI9tmxUpzgLxcx7
         EzGlJvDxb69gPIeY0H96Y6Rnvhoes3V2j+SdDbUfEiAgU28xc4V4Q0ynkNBd5GBMhdxm
         GB8KOSFmccG/GP9bLHifn3sdwoV1r6Q5EjWBA8OtOeaQmynycIpLk8zUeMiK75URWbCf
         ISpfEN1OMsczsqww9sL0/9b+kR6tiQItVSgw/LkMthSFYwMaEre549naLsHlsfelXpYj
         1FCbacDq77LJHRMB2oozYv5awzE18RIDEsyTBk4FVyT2VkvleF4OZzMBALG5QiCNyi4s
         4kKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ctK4P0EoigpL6m8TzkfXT3GOpy1xxNQXZQbM5oEWJQs=;
        b=Pm1qkYoMIUnpSpQOid/luvsZwpX+onoMpodp9bxh/O1UNT6xXU2WqpwiDja3MQixhv
         nXTp0B6m4FDbAuq4bWzRRxpm+mIfx9dPphZjRIK6+Q5YoOmiRlqqq38kQl2S9+sQO9zd
         ZGqnLAw5NmX8JrBuTkHYiExvkrOvXXqF1gF/LmbfEc7P1I0ke+vAxf4EBmh/hfxsoTbC
         8iEk6pf31ZnV9IeApIrmcx3ifhuF8dwPew9G51wrpGQruh+gacPNvRI6AhZe1Gdn6b7w
         2ed2N7vNnhUJmhMIfurOLJrIW9M24bgvbFx2dpa7DZlCN//k7GbZz/RypT2F2CvXCZlR
         99QA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gvYmCO5C;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id j15-20020a170906474f00b0092a26799239si2200780ejs.907.2023.03.13.04.44.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:44:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gvYmCO5C;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678707855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ctK4P0EoigpL6m8TzkfXT3GOpy1xxNQXZQbM5oEWJQs=;
	b=gvYmCO5CZQ2jq6MN+dT8q/YUPJH2jiSN3LFaz4nRlAzUaD8MDOTACx7mkbb7kHpkcWCThe
	YhrYQZaMqed+/hbY8tjt8h/kG9JopCcY2ShRBYLqFSoWoBed9od8uMOCnRfDwu1DXt5KPy
	qrbM15vSluzhIe1XxLXacekyfIvUXXY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-dr4TVGlxNQmez944p0XwAw-1; Mon, 13 Mar 2023 07:44:12 -0400
X-MC-Unique: dr4TVGlxNQmez944p0XwAw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF9A0803462;
	Mon, 13 Mar 2023 11:44:11 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2000F4042AC0;
	Mon, 13 Mar 2023 11:44:10 +0000 (UTC)
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
Subject: [PULL 07/25] win32/socket: introduce qemu_socket_unselect() helper
Date: Mon, 13 Mar 2023 15:43:17 +0400
Message-Id: <20230313114335.424093-8-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-TUID: 8Fuz12PlCQ36

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
