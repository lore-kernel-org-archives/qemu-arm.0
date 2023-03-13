Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp169483ejb;
        Mon, 13 Mar 2023 04:44:25 -0700 (PDT)
X-Google-Smtp-Source: AK7set/pgpAN2caJOUsIwD7wIuLq3NLXKHSTY2GFjttcmLkwBgyJsg19ZpLZaPpwtrNbgpnznUuJ
X-Received: by 2002:a05:6214:5199:b0:537:6330:93a6 with SMTP id kl25-20020a056214519900b00537633093a6mr11678039qvb.34.1678707865623;
        Mon, 13 Mar 2023 04:44:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678707865; cv=none;
        d=google.com; s=arc-20160816;
        b=jwyT3e7qW1hXAHcvj5bMGKQ+EVZgWXBStk4y+j1ExxVvUz0kfHm4GyOwDkysJMCCNH
         xiZoJL/CkCAYjZvmBZFA1eMMHZuG9OFVSNUbKK8Jo/hPLKcThXUSTba3PNCYbcippMtp
         Bz8q6yxM9ki7fBLz8nhp4Oicvn8UjXHp4Wqq7E41d6kghttEauwPx1rKKJQXEVSxtdvg
         r54n3NrwzE6rvaxH73PWo41t7anLlVYDvImeGPlsna4Qf/aPe1gDRrWruiCzWEr7/+nX
         Udibjr2nyAdw3wjUwN0soRJpgaxen8GRYeM8QlP8ZV7rMggZwNXpUnFirBU32iRhnxZt
         AApA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BqxGsWxXmu7LEVQhkjkpbn+02NihnK+bVamWmx0KeA4=;
        b=AcV+wFFv32d/iSYBWdWJx8DshcCsN/7hIUu6vqHr5aX0Vqrctxpw6DXmd852hDzGXy
         mQm+C017jxkSoGWUFbc+IsfcuGBMiHGa+j3ohuWx1UTlZl/mLIt6rwTpehotVGLdEVql
         RcduYuqB+/5bWrhpbHyMW5r+O+DixZgzLbfa7otXV+7dzSZp9Skz/GBa0d93vQdCkGic
         k37G9Gt3nNdJpvrilNVoSo3QPXUTYTFYfKRW/7cJCpwj+4HveJg5gNTgjOXTeWWLHdmV
         P7Gtg6juaHu4RGwShL+pEhL6iyKOoxJxuGA+Wg5+UPNjNhJORCoA7u2hCsofTu16Lx7L
         38rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RvUkAjks;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id a10-20020a0ce34a000000b005a477ecd028si2904036qvm.448.2023.03.13.04.44.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:44:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RvUkAjks;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678707865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BqxGsWxXmu7LEVQhkjkpbn+02NihnK+bVamWmx0KeA4=;
	b=RvUkAjkswa5tech8LYGuFa+uHb0X85qebATzLDOIETf7j58A1BOyJ499xcxV5BKVt/T1ud
	z4FTD3A4A6YhzwMpVa7Nlay5haLcFAmYi7lf3M130ZpReR9q9pTf1wbzXOF2ZJyLo8jiEZ
	IvSBoEC+uIHAKtkD5XZp7fNmzgUkdvI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-ByUOM3VlMoOP0vCmhBa-1w-1; Mon, 13 Mar 2023 07:44:22 -0400
X-MC-Unique: ByUOM3VlMoOP0vCmhBa-1w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A434C3C0F676;
	Mon, 13 Mar 2023 11:44:21 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4F4461121315;
	Mon, 13 Mar 2023 11:44:20 +0000 (UTC)
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
Subject: [PULL 09/25] aio/win32: aio_set_fd_handler() only supports SOCKET
Date: Mon, 13 Mar 2023 15:43:19 +0400
Message-Id: <20230313114335.424093-10-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-TUID: tcGccBmLxWAY

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Let's check if the argument is actually a SOCKET, else report an error
and return.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Message-Id: <20230221124802.4103554-10-marcandre.lureau@redhat.com>
---
 util/aio-win32.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/util/aio-win32.c b/util/aio-win32.c
index 74d63fa21e..08e8f5615d 100644
--- a/util/aio-win32.c
+++ b/util/aio-win32.c
@@ -22,6 +22,7 @@
 #include "qemu/sockets.h"
 #include "qapi/error.h"
 #include "qemu/rcu_queue.h"
+#include "qemu/error-report.h"
 
 struct AioHandler {
     EventNotifier *e;
@@ -70,10 +71,14 @@ void aio_set_fd_handler(AioContext *ctx,
                         IOHandler *io_poll_ready,
                         void *opaque)
 {
-    /* fd is a SOCKET in our case */
     AioHandler *old_node;
     AioHandler *node = NULL;
 
+    if (!fd_is_socket(fd)) {
+        error_report("fd=%d is not a socket, AIO implementation is missing", fd);
+        return;
+    }
+
     qemu_lockcnt_lock(&ctx->list_lock);
     QLIST_FOREACH(old_node, &ctx->aio_handlers, node) {
         if (old_node->pfd.fd == fd && !old_node->deleted) {
-- 
2.39.2
