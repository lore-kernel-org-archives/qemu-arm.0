Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp169144ejb;
        Mon, 13 Mar 2023 04:43:58 -0700 (PDT)
X-Google-Smtp-Source: AK7set9yCephzuspEuizL2jy/lw6t7H0kqKjrj8B93ZoI4BDV3l0Tm9qW3sDnr7nW3IPC9MMQ00G
X-Received: by 2002:ac8:7fcc:0:b0:3bf:ca3d:673c with SMTP id b12-20020ac87fcc000000b003bfca3d673cmr28480344qtk.2.1678707838667;
        Mon, 13 Mar 2023 04:43:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678707838; cv=none;
        d=google.com; s=arc-20160816;
        b=XcWDQ21ZIxc6rGo5KsR9zrarngZyLhIHXsk1Dsr2YkMPh92+U2LYUQOajLmv7dCHgI
         Pc4YCWxwVmMFnuhUL61J2iZBcqISed+Vq5tmsS/Vq7QhilJBeQZhSRQuETD0V/Au4SnO
         kHISbjDJVnKiINRtzvaI3yICqb8sZCGNz86H1zHPbTNMpBmDTGleRTp1ebX0rKRfh3Ag
         yj3YsOwh2Y/CwM3UFJzUum1EKLgaWrIKN6C3hP7pYsNzm1zV4vn14v44AUd7yNo31NVa
         clM4QBUnB2lIe3WG2/F52NAG4fqcmt7p4xfaryxHd/pojpu1RvjKL7p3NfuwwPaeY67o
         5BaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xm0lHEQ+kD446lVnQEBlGlpaDaziioDWVa4kv1O5nzI=;
        b=V95QnmJqrRGCk+svJhkkfmKkm73Umhudeer42InLvzaAHe5BStvtM0fuurx4dB6p+Y
         I/UERl44i4nKLJL4HvYmTqJkUivIn9m90Ym+FwqePl2vYilats9cfDETPmdCkocrkhj5
         1/GOKd+SP0bCxvPfsquanpOxX2LobvQSsRkD2UOCZXngMY5AZTl0BC9t3Xe7mUUbHVUY
         vrxvNaxrxD/puZ4FimPBP2GvHToIOmuY/KT4f1UTvlAG5iFWdI1r6dHZ2+Sea0/XEVaR
         LTTUqlEu47dU00JnPn8mPWzMhzIpTlaJZKJBswRK09X0w9VpwKfujXuv8Tn0YlnvQqTd
         Zsag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NeiLwFB6;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id y13-20020a05622a120d00b003b9ec33eabesi5091854qtx.463.2023.03.13.04.43.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:43:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NeiLwFB6;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678707838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xm0lHEQ+kD446lVnQEBlGlpaDaziioDWVa4kv1O5nzI=;
	b=NeiLwFB6HXYeAyDj+gvu5IFCSCyrZ9f8ey5YET6T26YH+sGUlQMpdSY0UbKxHqxp4HYzcz
	q14mPyxxa+6EfRGk/ZRgkk7MGnECjK1M4kKNRKG/2XrrY5DDhcTdPq5es+mJlKhVII9lks
	E6hfe7GBaK6lGsxnvhZOElKY5SVR49o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-jypTNrj9NTyJKzUa-xHGJg-1; Mon, 13 Mar 2023 07:43:55 -0400
X-MC-Unique: jypTNrj9NTyJKzUa-xHGJg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70B1581B081;
	Mon, 13 Mar 2023 11:43:54 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9106F2A68;
	Mon, 13 Mar 2023 11:43:53 +0000 (UTC)
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
Subject: [PULL 03/25] io: use closesocket()
Date: Mon, 13 Mar 2023 15:43:13 +0400
Message-Id: <20230313114335.424093-4-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-TUID: 9gYf50rA87KD

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Because they are actually sockets...

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230221124802.4103554-4-marcandre.lureau@redhat.com>
---
 io/channel-socket.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/io/channel-socket.c b/io/channel-socket.c
index 7aca84f61a..2040297d2b 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -159,7 +159,7 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
 
     trace_qio_channel_socket_connect_complete(ioc, fd);
     if (qio_channel_socket_set_fd(ioc, fd, errp) < 0) {
-        close(fd);
+        closesocket(fd);
         return -1;
     }
 
@@ -233,7 +233,7 @@ int qio_channel_socket_listen_sync(QIOChannelSocket *ioc,
 
     trace_qio_channel_socket_listen_complete(ioc, fd);
     if (qio_channel_socket_set_fd(ioc, fd, errp) < 0) {
-        close(fd);
+        closesocket(fd);
         return -1;
     }
     qio_channel_set_feature(QIO_CHANNEL(ioc), QIO_CHANNEL_FEATURE_LISTEN);
@@ -310,7 +310,7 @@ int qio_channel_socket_dgram_sync(QIOChannelSocket *ioc,
 
     trace_qio_channel_socket_dgram_complete(ioc, fd);
     if (qio_channel_socket_set_fd(ioc, fd, errp) < 0) {
-        close(fd);
+        closesocket(fd);
         return -1;
     }
 
-- 
2.39.2
