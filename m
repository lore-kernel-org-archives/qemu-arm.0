Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp171864ejb;
        Mon, 13 Mar 2023 04:47:34 -0700 (PDT)
X-Google-Smtp-Source: AK7set+MndnCvQ5skTsvSIRJhIm+O1KNpxdTWCCfErODgLOKqbRU0VnEXmQ10HsytRy++3IgY+Q8
X-Received: by 2002:ac8:58cb:0:b0:3b8:68df:fc75 with SMTP id u11-20020ac858cb000000b003b868dffc75mr25826887qta.31.1678708053986;
        Mon, 13 Mar 2023 04:47:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678708053; cv=none;
        d=google.com; s=arc-20160816;
        b=uCnFMujdjS4xcYsdjdupk/M0GMRTi+t98k7qNXLWSDLwRrVbIjFr8fG9mq0URSqMNh
         3zcKkaMi8oENjzdE6GUqlHV8EnNFJq6KxgrDtbLjaYv3DUay1gCQTZY0xCG8U+vOfbLy
         wwPi13/5tv3b2kWpc0P0gJQTC0F+WWdsCeEVe0z9M0WTK6Y54pYUMUzDoXzLZ7GXO65K
         Hy3B8kpQ8zoCScpjyEqWAW+7A0XjNkAoyoHwImlqfIHN8ElPTy5Pyjkb+qMLaMIOwq76
         FUkrlfDD5Pj1Yle6WWq0gJhF5Q06ntZdvbi1ObOUNROqvvwxfeGnZ8AOU1btktFG97EM
         Vqqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+WQwSwzIT10nPJnT3+0kLlVrIxZlCbistZ5wXabtCUE=;
        b=KS7Zq4nibamdHPcX5cRX6tGs+WQURWBha/Ao87wEa6jaZyZoAtTqPhGiqBcHVAS3Py
         U90ZLKZOkUKR4F4AfceTVFEgi0+rcsjSYTfVftwfmAHyV2kW5aW6sJFUNMRoPiiXK/oa
         33UQ9vtrtELkMrk+LdSQoSVJwk5ocukHQzkRDs/8BbvPak4hV2gn5e9C8yT8ob32/5IF
         lrFUgzXfTBCgL63byqgvXg74ID5xQKAYFE57q5/dBWzx+fm8Zcgk1zqkH8JMMO7FXx9e
         GerXkNrYZ89QSHI+vr5IieeZntv6Q6x1aUTGBqVDOBLK2VgRj+qno131s4UsidJwkSzf
         HRyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FLUi15QU;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 12-20020a370c0c000000b0073b9b15d8e8si4871228qkm.149.2023.03.13.04.47.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:47:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FLUi15QU;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678708053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+WQwSwzIT10nPJnT3+0kLlVrIxZlCbistZ5wXabtCUE=;
	b=FLUi15QUX6SqBdgMrmiZyaMYsiC2y2+OvJdWapoG7NA7XiGFIOU3Csmrq+Il/WuxnDnzWQ
	HuZ6mXvHZPQdxkOiFRBTzYvPJapK6Zne7+fKoNfgABVlAhbMq4XIhUXSEsCFi4K0s1sWVP
	TodTqYHvMiTRMlXuDm/LslHXwxIJ73w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-FeLLXPnzPzyNMe7x3XRYBQ-1; Mon, 13 Mar 2023 07:47:29 -0400
X-MC-Unique: FeLLXPnzPzyNMe7x3XRYBQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 921B129DD987;
	Mon, 13 Mar 2023 11:47:28 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D8894042AC0;
	Mon, 13 Mar 2023 11:47:26 +0000 (UTC)
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
Subject: [PULL v2 08/25] aio: make aio_set_fd_poll() static to aio-posix.c
Date: Mon, 13 Mar 2023 15:46:31 +0400
Message-Id: <20230313114648.426607-9-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-TUID: CxLiXVnKAXZp

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
