Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp172019ejb;
        Mon, 13 Mar 2023 04:47:47 -0700 (PDT)
X-Google-Smtp-Source: AK7set/5F2m88mtiMpFRdHvwlwLXLJVxXLUHnBd9Hz/hj32qBOTdhoWDC8ZUtXRMek6rcTAR8sRg
X-Received: by 2002:a05:622a:2c2:b0:3ba:1a25:f66 with SMTP id a2-20020a05622a02c200b003ba1a250f66mr54855479qtx.53.1678708067012;
        Mon, 13 Mar 2023 04:47:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678708067; cv=none;
        d=google.com; s=arc-20160816;
        b=OsbsBTaW32q22jODfl/dJcRQVFF4UO99edBzyYkeFhOEVDjbeVcMeVbzyQ9hG9ZVZs
         dZNoVqpEkjGpo8hWsFTX0srSYB3fZwcC9USSfK3FP4AMHUFajE116pu+g/pCgN1wMBpP
         rDTXYdqh3/d/FFDhnBD2wx5ZORic3xn0om46vOxyohiRVQgpcXaDWRnGEwx7hrYDSWHh
         MwWO5OjSw6CHs3879qsFHHvl6H138KSyUhdN3xY+UV2QvBWJ/bHDYLSGuZFNrLlDK5E9
         PcFgDJ/efoBZgxQDNMmnQOmWOcX+WKtk+OYqHgJchOdEsLPQUzhSDzJSMj0nL2xrTbEn
         wmaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VtD5+mhq5qkIqCEjk+4JaeG/DzPz0DCTzI3RPR/hu68=;
        b=cAQmVXPcF1ckuCblZy/ZZO9KXilf8zcU2IDB9r2iI32Gh5Z05Mpgu1Jt+xGh0RKTrx
         0ChaBZukaj0crK+PQQbe5VdnIWSCM1Uf2ybHolB1YlpjCnwMo8+rkmz32JNm5C80Zi3L
         1e/q7QWkLf/4c3fW9NnOSHZh0xHv8Dq2UP6hxYYXdOazdU/Mb9RqiVLpmKoN5Bq7NLrc
         VRpVul5koZ6yNGp8nh+Q3VCplcMyYbalMEAAkTxgu+tW95kMl7DMwEEE1fEz7O/KmbPL
         7C8BrPyQAdskewjUjnsGxpwleOx1CEvVBRKGdEqbOX3TNWcQhMEJJRF3HxnJH/yO0pus
         Pg7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Usu3Eubb;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id t1-20020a05622a148100b003b9c185dc39si5316009qtx.92.2023.03.13.04.47.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:47:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Usu3Eubb;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678708066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VtD5+mhq5qkIqCEjk+4JaeG/DzPz0DCTzI3RPR/hu68=;
	b=Usu3EubbJEmC7bzpmvq/Umzbv/dQRHiraAT+ilvzQGSFddy8uMh8ZMWsbT9sEWqRTf7UY8
	uJC1SPhLWlQOT9HYSfaB2KNOsopq+z+tBL4Wbt7VlpCBxc12W6TeaFJsQwjnozcRf7dw00
	Liu3SxEUSyKT4li4kD2DgVoMJp38b3Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-Y_dSDxPDMd2pVr3GTsUv8w-1; Mon, 13 Mar 2023 07:47:42 -0400
X-MC-Unique: Y_dSDxPDMd2pVr3GTsUv8w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 483A385CCE0;
	Mon, 13 Mar 2023 11:47:41 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A9C71410F1B;
	Mon, 13 Mar 2023 11:47:39 +0000 (UTC)
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
Subject: [PULL v2 11/25] slirp: unregister the win32 SOCKET
Date: Mon, 13 Mar 2023 15:46:34 +0400
Message-Id: <20230313114648.426607-12-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-TUID: kcK2ZGjlLbBw

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Presumably, this is what should happen when the SOCKET is to be removed.
(it probably worked until now because closesocket() does it implicitly,
but we never now how the slirp library could use the SOCKET later)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Message-Id: <20230221124802.4103554-13-marcandre.lureau@redhat.com>
---
 net/slirp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/slirp.c b/net/slirp.c
index 0730a935ba..a7c35778a6 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -259,7 +259,9 @@ static void net_slirp_register_poll_fd(int fd, void *opaque)
 
 static void net_slirp_unregister_poll_fd(int fd, void *opaque)
 {
-    /* no qemu_fd_unregister */
+#ifdef WIN32
+    qemu_socket_unselect(fd, NULL);
+#endif
 }
 
 static void net_slirp_notify(void *opaque)
-- 
2.39.2
