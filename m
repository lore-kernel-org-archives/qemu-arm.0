Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp169415ejb;
        Mon, 13 Mar 2023 04:44:20 -0700 (PDT)
X-Google-Smtp-Source: AK7set8keqycTievcRy+aVuhn9V8FiPMdFfIvvKPBLLMnfopRRjqaCoRzhM+EZq7i4PrdZR7peQO
X-Received: by 2002:a05:622a:38d:b0:3b9:c889:ec24 with SMTP id j13-20020a05622a038d00b003b9c889ec24mr61323637qtx.12.1678707860760;
        Mon, 13 Mar 2023 04:44:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678707860; cv=none;
        d=google.com; s=arc-20160816;
        b=C5+arWeXWw5n4GM1qzlbfG7qdF/sa19qB3ai6gLWEMDJGOcjv6CWvKTdBdlO/HuzXx
         AZU+dX1hdYIGp2XtdEL2fWy/mezAHlcsMd5qvzBdObHMcd3Qp1rNQkLTKLohjudygk2/
         auUWPMsI3UkYpFsnCQUFMI56VIlOPfXlSaj+sy9M5/ZgsGwqFZ6qriCqx72Ka+OnNd4E
         D3KWV5tkrFfUcc6GaVLdAv/VUO3EFPha3jCszDkAoAhyWeKY6ZjVEPDGRLZBd/OZrEDd
         1lPgt3ulOuckpJuEy68hOe7SEgi/7d1k4vUveWS9iYP1d0lCsCFSot6ssApfmf2SagI4
         fzuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+WQwSwzIT10nPJnT3+0kLlVrIxZlCbistZ5wXabtCUE=;
        b=uBZLiZxlsAATrzh5CWtR1eEC5LMUI87zdSrHJCzDOUN2WM+ukKY4OeRHOsqPrn5c5a
         V4vtGiGp/yrtmstQuSy8+GlBUTguyzkGizYNnZU4QYefLJNUMxnAdzRfzK/covPwK5cp
         LmIuq7b4+cku6MDMI9eDpFLQ0wrxAdcryWVyUlLMVlA5Qe1SQUWMCXR6A6CFT8Gwj1n8
         iLG1Q7E8SQMw/Datfb+0yW1Te3And0KwxM85N4HQrN83opg5BvouMiFD7zPY2i8eNh2Y
         xH/RFT19vbyGQR5PrJOONl9OCEFtH7pKj6n1Qh8aNdYwbRKyleVyeYeIImxX87Idxshg
         BEWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VMTvW05a;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id v14-20020ac8578e000000b003b31886ab72si4948957qta.747.2023.03.13.04.44.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:44:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VMTvW05a;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678707860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+WQwSwzIT10nPJnT3+0kLlVrIxZlCbistZ5wXabtCUE=;
	b=VMTvW05abK2j1uEN8yN6GX2QzYxsr6aQ5Us7UZdb119LhsDwXmBz9V1V9dL39lxEI2vpuR
	hL9dMTpACnXab4ygu0WvNNl0JaEi+rpFh3P5HV7Py4kE/0iBGR8sbeuVpLEKJC0Ya7UKdc
	Q2IbfoMr7C//8xPJgGbmRT4AoceQGSs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-IKaS_LDIPKSTAJaoq5K2oA-1; Mon, 13 Mar 2023 07:44:17 -0400
X-MC-Unique: IKaS_LDIPKSTAJaoq5K2oA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E1D4857D07;
	Mon, 13 Mar 2023 11:44:16 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4ACCB2027040;
	Mon, 13 Mar 2023 11:44:14 +0000 (UTC)
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
Subject: [PULL 08/25] aio: make aio_set_fd_poll() static to aio-posix.c
Date: Mon, 13 Mar 2023 15:43:18 +0400
Message-Id: <20230313114335.424093-9-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-TUID: pW/HSavD2eVd

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Message-Id: <20230221124802.4103554-9-marcandre.lureau@redhat.com>
---
 include/block/aio.h | 8 --------
 util/aio-posix.c    | 6 +++---
 util/aio-win32.c    | 7 -------
 3 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/include/block/aio.h b/include/block/aio.h
index 8fba6a3584..543717f294 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -482,14 +482,6 @@ void aio_set_fd_handler(AioContext *ctx,
                         IOHandler *io_poll_ready,
                         void *opaque);
 
-/* Set polling begin/end callbacks for a file descriptor that has already been
- * registered with aio_set_fd_handler.  Do nothing if the file descriptor is
- * not registered.
- */
-void aio_set_fd_poll(AioContext *ctx, int fd,
-                     IOHandler *io_poll_begin,
-                     IOHandler *io_poll_end);
-
 /* Register an event notifier and associated callbacks.  Behaves very similarly
  * to event_notifier_set_handler.  Unlike event_notifier_set_handler, these callbacks
  * will be invoked when using aio_poll().
diff --git a/util/aio-posix.c b/util/aio-posix.c
index 6cc6256d53..a8be940f76 100644
--- a/util/aio-posix.c
+++ b/util/aio-posix.c
@@ -180,9 +180,9 @@ void aio_set_fd_handler(AioContext *ctx,
     }
 }
 
-void aio_set_fd_poll(AioContext *ctx, int fd,
-                     IOHandler *io_poll_begin,
-                     IOHandler *io_poll_end)
+static void aio_set_fd_poll(AioContext *ctx, int fd,
+                            IOHandler *io_poll_begin,
+                            IOHandler *io_poll_end)
 {
     AioHandler *node = find_aio_handler(ctx, fd);
 
diff --git a/util/aio-win32.c b/util/aio-win32.c
index be5136e486..74d63fa21e 100644
--- a/util/aio-win32.c
+++ b/util/aio-win32.c
@@ -125,13 +125,6 @@ void aio_set_fd_handler(AioContext *ctx,
     aio_notify(ctx);
 }
 
-void aio_set_fd_poll(AioContext *ctx, int fd,
-                     IOHandler *io_poll_begin,
-                     IOHandler *io_poll_end)
-{
-    /* Not implemented */
-}
-
 void aio_set_event_notifier(AioContext *ctx,
                             EventNotifier *e,
                             bool is_external,
-- 
2.39.2
