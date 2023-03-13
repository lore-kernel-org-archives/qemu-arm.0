Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp172055ejb;
        Mon, 13 Mar 2023 04:47:49 -0700 (PDT)
X-Google-Smtp-Source: AK7set/YLJfZm8IejG8Jr/MsnyIYP8DpxHj8PPUFW2ZOzXahPsqTbl1s4f9upoKxTkIfeI9VUYoY
X-Received: by 2002:ac8:5c13:0:b0:3b9:173e:45de with SMTP id i19-20020ac85c13000000b003b9173e45demr17938876qti.6.1678708069016;
        Mon, 13 Mar 2023 04:47:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678708068; cv=none;
        d=google.com; s=arc-20160816;
        b=bwt0OgPfbc+cwIWjTuLjq5StLfF7wLgtEoJxQkDYd+vt4kURX2OdoPGJ05VeU7kj/J
         D9JFscJGxPGQfTPzwLPKSRfuutulJjFMqdM8W+DnH19jyha1RgcW4tF6fatiaOJWS+Me
         Q2JLCpcTefQQl1k5Oq6t+jqvqycylGzy+3kIBXUS99bVI5u99oTmwhk6SrGknuxVYvIv
         /BqOy91bOhewiA4O4sGPr1jiLkXodQ7xKytT5GK6sAsa8TeSqoqk5vt6t51++J7dgIFJ
         fK8EK4HHzNAaKBlQ+kiN0xzH+QhPO5d3G4YbM59oOXs7MrZi0gY1RC3KsfHynlR9jNVj
         O0nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2sdYbjwoDK6asuv5xfaPJTDIzsW8PShUVAXy/wh1O5Y=;
        b=LX2pXv4BLV5MEWVWSn08e4/YQe+j+8gl7JCZ7AiXHTKUDpA8iz6WAe4OzQOHuYNCuK
         J5RbN7SxsjAfl8vF5eTnf65GvSRrKs64i8tVUMloCPPWHlbQ/S/DYI8rF3lloFrmgyfq
         WQ5yf4VyGZflBjQvjxKyNp7U/ZyHNj+GeAiI9kUWS89Wv90m+7gR3TQ4c0LnBTGTKJfc
         gs3fcrWnbPCVq+jyQ5XlfvaQdNvBLVQ95ENdA4NXYYjO0q5dd1oV7d3k1u24/4BMEY8i
         U7yFBd7vKPBexUIeMtVdN/dHi6LtVGeU9BEBePrpfLZdPlDyUj8HtLt8/IH6dmFj4fmZ
         X2dA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="dpu/R2qU";
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id q11-20020a05622a04cb00b003b82cb5cf10si5250362qtx.474.2023.03.13.04.47.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:47:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="dpu/R2qU";
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678708068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2sdYbjwoDK6asuv5xfaPJTDIzsW8PShUVAXy/wh1O5Y=;
	b=dpu/R2qUB/MhLixjQzFwpSoNI4Ard4dtIhcX/FMB7EJgO8sx5Ud03HDAXgb6XUYMBdL9Q2
	UOFNzz9E/tzepG0ZXZUWyDHehA1z5Eddt9VBhTFE9ZZblx+kbHuXR95c1egCeBiX81UmCu
	f3axuImhVnG5Mbw9Ft+2ZnDRzc7JbkQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-YjyP4I3yObW_QUav01jDAg-1; Mon, 13 Mar 2023 07:47:47 -0400
X-MC-Unique: YjyP4I3yObW_QUav01jDAg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB5FF100BB39;
	Mon, 13 Mar 2023 11:47:45 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CADA5C158C2;
	Mon, 13 Mar 2023 11:47:44 +0000 (UTC)
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
Subject: [PULL v2 12/25] slirp: open-code qemu_socket_(un)select()
Date: Mon, 13 Mar 2023 15:46:35 +0400
Message-Id: <20230313114648.426607-13-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-TUID: zTqC+vBpjF1l

From: Marc-André Lureau <marcandre.lureau@redhat.com>

We are about to make the QEMU socket API use file-descriptor space only,
but libslirp gives us SOCKET as fd, still.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Message-Id: <20230221124802.4103554-14-marcandre.lureau@redhat.com>
---
 net/slirp.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/net/slirp.c b/net/slirp.c
index a7c35778a6..c33b3e02e7 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -251,16 +251,20 @@ static void net_slirp_register_poll_fd(int fd, void *opaque)
 #ifdef WIN32
     AioContext *ctxt = qemu_get_aio_context();
 
-    qemu_socket_select(fd, event_notifier_get_handle(&ctxt->notifier),
+    if (WSAEventSelect(fd, event_notifier_get_handle(&ctxt->notifier),
                        FD_READ | FD_ACCEPT | FD_CLOSE |
-                       FD_CONNECT | FD_WRITE | FD_OOB, NULL);
+                       FD_CONNECT | FD_WRITE | FD_OOB) != 0) {
+        error_setg_win32(&error_warn, WSAGetLastError(), "failed to WSAEventSelect()");
+    }
 #endif
 }
 
 static void net_slirp_unregister_poll_fd(int fd, void *opaque)
 {
 #ifdef WIN32
-    qemu_socket_unselect(fd, NULL);
+    if (WSAEventSelect(fd, NULL, 0) != 0) {
+        error_setg_win32(&error_warn, WSAGetLastError(), "failed to WSAEventSelect()");
+    }
 #endif
 }
 
-- 
2.39.2
