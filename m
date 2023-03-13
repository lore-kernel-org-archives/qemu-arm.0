Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp171557ejb;
        Mon, 13 Mar 2023 04:47:09 -0700 (PDT)
X-Google-Smtp-Source: AK7set+myh1x3zwPVa2oZH0yWftovjimqPus5y6ATCuLRc9prXiqPLcRbfW2jwEC1aUJFukn/2ry
X-Received: by 2002:a05:622a:34d:b0:3b8:6c8e:4f85 with SMTP id r13-20020a05622a034d00b003b86c8e4f85mr63371797qtw.43.1678708029527;
        Mon, 13 Mar 2023 04:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678708029; cv=none;
        d=google.com; s=arc-20160816;
        b=ghNnmBcbYx09FSKbq98odzyUFw73PmQ0UtYQze/YI9rMfHaFu1T82OHKBfBIorACgf
         orYPBt8T3Q2gG+bco5/DqQ5cH0mwwyskxHYuNKB/OWiP+FGdDbIcJBZT0a/6zMHbWyA+
         hlwqFJzuCOMSCrAKvo6dCmL/4/dW/05wWxcrJ4ZWdMhhrObDrvitjDuD+srKQQioPD3t
         n8ckSgwWUDOK7u2gk9/KVRp012j5CMlONqL2RAsMYN/O6kveOEL1f5Ls/0RwrWuDyNsu
         hpQy1xtdVZOAj63eHZm8yS0hxhSvqe3Lhe+wagdsrfe69fNf0LWVUtvCULt3/NeL9Nmv
         A0ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xm0lHEQ+kD446lVnQEBlGlpaDaziioDWVa4kv1O5nzI=;
        b=T3HsiGc92DHvzLkECFLcRm8/pMhyXUMFRVnvblXThzgnqOo4ALjyJnB/iVliNojHBU
         Td55GSDxlPPn4I4HfkhzwxW6dc8OAylCWcyEI6OAeZxdJG0wd5cFomQXIHMUfUlkIDFf
         cFEQEe6fSxDuNMJbwdciRR1Wgd+SaouRuicuEFNkOgtGZcQdfXunTbQn30rJbI8arbjb
         RE9Q9DZ1jfNPgvsk5oXqMg4yzixytsKGiLUyEeHYJq5KvtCJ44oJbPSy0T0KllsH1go7
         fI8UDWeXjiLiE8rijo9SwgOGyTZDSN/amAJY63tAkldIr55qfzsC7mdaiSb1iMwPU96j
         Ft+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JcFMWesV;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id g15-20020ac87f4f000000b003b8699a01a4si5312121qtk.18.2023.03.13.04.47.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:47:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JcFMWesV;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678708029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xm0lHEQ+kD446lVnQEBlGlpaDaziioDWVa4kv1O5nzI=;
	b=JcFMWesVMYjZNz/OPYup7hhAtvgeSPvIgfXQZpmfm5IHUtRSir3Y/yTfCrQLQdO91Q+FeV
	IWMjTAAgEEucJvRI0O+K7MM7KoPYmSK9JLKU1GFGzXFbiIR88oXVYUeNA8+ixLmzLKlhka
	X0EwRPIlOlNIKNl8tkzf2aayXcypmKU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-Nngxti5zOiW0TcgtkF2RhA-1; Mon, 13 Mar 2023 07:47:06 -0400
X-MC-Unique: Nngxti5zOiW0TcgtkF2RhA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B8641875045;
	Mon, 13 Mar 2023 11:47:05 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 58685492C14;
	Mon, 13 Mar 2023 11:47:04 +0000 (UTC)
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
Subject: [PULL v2 03/25] io: use closesocket()
Date: Mon, 13 Mar 2023 15:46:26 +0400
Message-Id: <20230313114648.426607-4-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-TUID: KL1P0WyMT3yH

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
