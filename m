Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp171899ejb;
        Mon, 13 Mar 2023 04:47:37 -0700 (PDT)
X-Google-Smtp-Source: AK7set/zF5e+A8vfcLq7Y5lO4ZyTp86XQhSS8Ei0OsWPHHzQbLvngkWUWOhCpwuLG2HVB+lYzwN8
X-Received: by 2002:a05:6214:2422:b0:56e:b1e0:3fef with SMTP id gy2-20020a056214242200b0056eb1e03fefmr14865811qvb.24.1678708056907;
        Mon, 13 Mar 2023 04:47:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678708056; cv=none;
        d=google.com; s=arc-20160816;
        b=xDbOhFURB1F6DmbtUnofSxVvg4fK/OuPEOotLJ8a28RrJyO5MDbWZn6PB1iPNo7qlj
         OXuAbXJuSG/u63d/afdJlzbnEOhUWVLp4u1vTgSje3DfbqKMsFvQP5/q+locjdGR67xY
         ntkz4Tpcrg4V0aYHx2J/w2hXVlVOmwjGzrAM2CVuJH5RUejkI7a2GJb+TP6loA4b8t+h
         k89suUN0VTKaZR/nqxnfXzuFjv7P7l3UskbK10TIPlftzTaNYeylO88wjVdrjNc+txmk
         +AfKKSg5rH4INNn0Wwy/UQCwDNKUmsGhOHyDEK9mfHat83W0D8jh+vjjambmEeJ+jkpJ
         SWpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BqxGsWxXmu7LEVQhkjkpbn+02NihnK+bVamWmx0KeA4=;
        b=V1zjFBZzu1rkM5dbcYCIQWB3wuPSvewCuy85+t5DhxNZvszV4ex1qG3poDEtCtIHu2
         NdaescvKBYWTcXgFQewyoWrcsSByMSkdlEmz8PJK2uWnmUF+1gbv1j01WOXhaedORA8Z
         cNZ/Zb0kPtW387x7tvi0p3g6306FarVahcilsm6rvQKCKTEMYuuX4duKlufYPvtFxb/b
         4xu3d5nk3jf0ORCXFTqST2dQPXVVL4toBmzbCG+kDBToFDLfIfXLpf/lnEpJ0NRkTqcN
         T0a5iYgYTNeWn5zAPdKKCH/4mH5o5e5hf3f5DSeMCxypxydXjwMQog/eS2Nu10SYb14L
         Q2Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TnoSdSK7;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id l15-20020a0cac0f000000b005a5226116fesi2347832qvb.497.2023.03.13.04.47.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:47:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TnoSdSK7;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678708056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BqxGsWxXmu7LEVQhkjkpbn+02NihnK+bVamWmx0KeA4=;
	b=TnoSdSK7BZrkXYkAl/NRvdawnVkMpiR/WHRZdyG6hEsnlFCKNRkuW1fyWZiLqlJIBhwjXx
	7R3Qamm4o+1ZQMOG7NYFFi+OcNPQ/2tU97jzq5+c+XX6YcTrN0FURSF8mcwXC35hhRPohG
	+sdTVdocRPgy2qkyUulCol9dVdF1sVI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-i4CaWVyjMPKajD6p4fYC_A-1; Mon, 13 Mar 2023 07:47:33 -0400
X-MC-Unique: i4CaWVyjMPKajD6p4fYC_A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D3503828887;
	Mon, 13 Mar 2023 11:47:32 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 94CE61410F1D;
	Mon, 13 Mar 2023 11:47:31 +0000 (UTC)
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
Subject: [PULL v2 09/25] aio/win32: aio_set_fd_handler() only supports SOCKET
Date: Mon, 13 Mar 2023 15:46:32 +0400
Message-Id: <20230313114648.426607-10-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-TUID: 3cND0byV+1xS

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
