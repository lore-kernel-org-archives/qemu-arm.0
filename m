Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp169105ejb;
        Mon, 13 Mar 2023 04:43:56 -0700 (PDT)
X-Google-Smtp-Source: AK7set+xBfkwXB0jg84/loBJSmyW6f5i7F3mhBKf/mEY/GemA3DIuGMgHaSjGAfRASY+bMA4VwLa
X-Received: by 2002:a05:6402:1009:b0:4be:3918:9217 with SMTP id c9-20020a056402100900b004be39189217mr10907211edu.8.1678707835995;
        Mon, 13 Mar 2023 04:43:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678707835; cv=none;
        d=google.com; s=arc-20160816;
        b=IoY/NDHNijEQqJh42fVD67+vvIv/NYGp3nd9YJ64GKqnfSKGDDHKNpiBNPzlK/Gdeq
         IkNQ3B4iZ//lk5EfTBWIL2pBepKvPdMpeIULGxYkueunoq8/2Qh5gGP0CZueC+rDAE/I
         KlW0yCIIo2fuDMuHc9/ath5VFWsK0TUxfV7E2QHL82TFtqvWGBZL5ESTHOVRN5ZyYHjz
         z1sSBaA6p181MP0SiXo5/wm5sdSvFvggntlQARybiE5/SFjMJqCfjOGO07/vzYbMf0GO
         1slT20azw8Udn0aRIyicO/fmy/0jX31vRElCo5RTYwTjp89UXDoTnLvmmVEPUgp51Y+L
         LtQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kXF6xwhHvbGVEA39/svzIufoa5QlnPAUqyPSW/tB6aw=;
        b=fE3MbpWlUg5u2jVJ/jZf079D6QBR0xRzdl/KUHlrV+bCzZ9sYpS5RLfGTAnzZNDXPc
         6/9tOT17rO4o5HYZdHpzJXoxkglcjIBlK2uMb3pTM13x/dlOdJa92Q9j79lCDBhOrYcd
         +SbEcnzjGY52pTeoMvYd06zHGKxOqH4y1MEJl4XN3xiATzFMU5A8s5inSDeW/KPKVysR
         e6X2XFGMlW4XjHmBbMCKMLPsG8jdLIlkaTLt4GBHCcLisOe3XMce4jXZ/vpqbkD0hX14
         eQ1ks4cO0keIxiwKwX1gDhX3du9DDLfTH4TyNTFD5ZehcSLptWXsgbIS9d4cKux7sOmf
         Y9uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZfcCbFiN;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id a24-20020a50ff18000000b004ad7c4bc8b5si7224064edu.261.2023.03.13.04.43.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:43:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZfcCbFiN;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678707835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kXF6xwhHvbGVEA39/svzIufoa5QlnPAUqyPSW/tB6aw=;
	b=ZfcCbFiN+akc0W/oppIdXOzkNIUdk3whLBR2B3BuWj1LOZfyTEDQ999XfBxLcQE3xVjC0T
	CfQ21ZtLT6H7RO3tRATtP6Ca+4kawBn/+qcQC38/gPfKdKbeM3tcEUxPDCfkLQKAs1JIsH
	1U8DHcqS9gJLnhF0ypRbssuvDwVipHQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-ojLoA5xIMISuSZoOnvuZag-1; Mon, 13 Mar 2023 07:43:50 -0400
X-MC-Unique: ojLoA5xIMISuSZoOnvuZag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 520D0800050;
	Mon, 13 Mar 2023 11:43:50 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2C9C94042AC0;
	Mon, 13 Mar 2023 11:43:48 +0000 (UTC)
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
Subject: [PULL 02/25] tests: use closesocket()
Date: Mon, 13 Mar 2023 15:43:12 +0400
Message-Id: <20230313114335.424093-3-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-TUID: ThBJ626b01cS

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Because they are actually sockets...

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230221124802.4103554-3-marcandre.lureau@redhat.com>
---
 tests/unit/socket-helpers.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/unit/socket-helpers.c b/tests/unit/socket-helpers.c
index eecadf3a3c..914b3aa0cf 100644
--- a/tests/unit/socket-helpers.c
+++ b/tests/unit/socket-helpers.c
@@ -117,13 +117,13 @@ static int socket_can_bind_connect(const char *hostname, int family)
 
  cleanup:
     if (afd != -1) {
-        close(afd);
+        closesocket(afd);
     }
     if (cfd != -1) {
-        close(cfd);
+        closesocket(cfd);
     }
     if (lfd != -1) {
-        close(lfd);
+        closesocket(lfd);
     }
     if (res) {
         freeaddrinfo(res);
-- 
2.39.2
