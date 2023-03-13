Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp169674ejb;
        Mon, 13 Mar 2023 04:44:38 -0700 (PDT)
X-Google-Smtp-Source: AK7set+BXi6vDE0U2RBFzDVHBVRhEc15KP1ujIR61rbRoxF8Typ+A3UHAWwZMKfK/xonl00hP2/O
X-Received: by 2002:a17:906:1846:b0:8b2:abcd:624 with SMTP id w6-20020a170906184600b008b2abcd0624mr33659663eje.0.1678707878838;
        Mon, 13 Mar 2023 04:44:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678707878; cv=none;
        d=google.com; s=arc-20160816;
        b=Lmi9Jwn5qTKSNSnJk15JuwOHZj+zWJLFsiUii7Sv4be+uz72xa7B1TExoNVaBzlwRa
         QbUgd8S8kIDdlDXjZeBUITz0hFIuL7gorj1/NjLQdRyMmZXE/bYzbX87Xy7NMr1Dgpct
         OXwOGlhuYDmX32aRn5Qt7Rg58CBjnzUNaq88GJcpiyLatkigKUS+eBb6NLSpZP/G0EHU
         4NPP+9Sp9kZsBUoj+CluLWO32AJBwdZeJdlspYn/RpKr+4isRRtxa+ufTvoM7AV1qqru
         dSlnyXIYMVXZH7FUlzUgIQEYkt+q4ARSU05CmpNECCfu5KKkIR6Tl36igOob/ZZ9F2SW
         u+ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VtD5+mhq5qkIqCEjk+4JaeG/DzPz0DCTzI3RPR/hu68=;
        b=NoIDPdAyas6y1lCCbPhubgRAyJgv/AT3vvCKBpHsScayI3eoOLVUZduj3MFWWdqPnt
         LhbzTLA2qL06RoJ48lC2xMa/J0hNGRNCKa1z7SVrnyj8olcUCaE1Kfr1ujcfvxDDHvV6
         KxEjSKkEFAgbszJ1101+LdHjo/WnHo5DpqnSGy3oVM9c5v+C4VhGXQiU62ziw2gDqEiM
         va9RGFJW9V1cBaiRSg+ezp56ccyxWnLcZEhWVVHfQ5hyjHxx3FWKxDFscVDJ2LLNwhoZ
         NowaQttOliCEAdNm3Hs21aO19AVYKl7eVQswiY2IOzCkfDKA+8j7wOHHu9JPwvCcR6Gk
         NTxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="LPXjwOy/";
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id r7-20020aa7cfc7000000b004ad73eb9374si5576383edy.147.2023.03.13.04.44.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:44:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="LPXjwOy/";
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678707877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VtD5+mhq5qkIqCEjk+4JaeG/DzPz0DCTzI3RPR/hu68=;
	b=LPXjwOy/G6lDCZqjUtgPxx799CthBmcgltS5gYxcRku5QJz6yTUiiwIc84FISxQh+a/zNF
	LdI+8h32UudTp8s9ClxMe5wFKxLvrsnIZZXPozE3lCYtErDkBLozK5Vb974TpgIwkQ0xwI
	SZD/yZqdGYCUuiOjgIiYgxy+qD/BgIc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-TAb_ITvkNGqPO40jFO0AOg-1; Mon, 13 Mar 2023 07:44:30 -0400
X-MC-Unique: TAb_ITvkNGqPO40jFO0AOg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BA0C1C04325;
	Mon, 13 Mar 2023 11:44:30 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 73F081410F1C;
	Mon, 13 Mar 2023 11:44:29 +0000 (UTC)
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
Subject: [PULL 11/25] slirp: unregister the win32 SOCKET
Date: Mon, 13 Mar 2023 15:43:21 +0400
Message-Id: <20230313114335.424093-12-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-TUID: VsY8pYrbJN+P

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
