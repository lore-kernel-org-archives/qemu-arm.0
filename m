Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp169826ejb;
        Mon, 13 Mar 2023 04:44:52 -0700 (PDT)
X-Google-Smtp-Source: AK7set/CrDkgGeIQFL20P44BMJZM6SC/rwq/nA5aeFyOI598uyU+mtqS8PSPD/Htbe1kDqksDzUd
X-Received: by 2002:a17:906:db05:b0:8ec:4334:fe with SMTP id xj5-20020a170906db0500b008ec433400femr44685893ejb.26.1678707892719;
        Mon, 13 Mar 2023 04:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678707892; cv=none;
        d=google.com; s=arc-20160816;
        b=b5D3A+zTBvZ5lQo2CjiFTr8DzV1eUMl1EPUnDTgM64WFTnUUztV5d1BqYZbxs0cVX0
         cKWNLlXURfS70qMYhxycGb7nLj6/wXWE6sqegXAtpcxfPA/bbANyWnzpY6pKwa0sJUv2
         CBfqe6tIlyZDW9qBETzLL290M0PEzbMw48P3YryDugROekX1m/246UvuyUwBSU3rGzMO
         0/+rBLN/ELspyelUu0pvgR0aCVr1rjQERHfJ+Walr5o3W9mupXiKRxbqkNb2kdtzJr/G
         E02TKyJjOdUcy5xT6x8jSoG+7HD18vZP+Xw5RSKbVy1+IKCWwjVer6q4/OkkUjnw/WTp
         c4aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2ZtHfe71bBeZH0qfQl+pgQTnbShfcreRwLlaFYvhfQE=;
        b=SIXOLTHU1oCbqkWcH1PXyl42rZL+8i6QTgAT9ADJ/31/20ZfDDZhj/x/KdfcE+1aqk
         h+uujfoNuqR32ukWuOEno+v9/k1mFBon0obvwITmHT/r727ZBSGPwe9y5pEoCL5MoSJR
         /0UHXMwoeBifCv7R988OQmkFWyayrexgAdci7jZnytV7Hp6hu4vACmKrKuLwx4v6p/oJ
         1S+0cOPf51Nfgk0oc8P+Gy72lb8kjLbou96JeWCI6LRs9IYAkY5DBCvgMmLa+29obcmi
         wdwswQeW3/3nbL2oNqtJBkqorEv1GGAmGX8P8Hrdz4DNm+IpdAMdf7wSrtnYQJVkgd2n
         1MVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=INT8dter;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id qb1-20020a1709077e8100b009232ea923a8si7141156ejc.917.2023.03.13.04.44.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:44:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=INT8dter;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678707891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2ZtHfe71bBeZH0qfQl+pgQTnbShfcreRwLlaFYvhfQE=;
	b=INT8dter4avDLXcaMqJ7xcv6O/k+SIooWpE+T3ai4hTfQKKDpR3mAA4Uf5s8uvMsjeoig1
	Sw0D/3RG/z0DcSiAIZ3FYph/M3BD47TsAOLzGjs+DLRel4MOYnsg0VWiZU4R51E4rL10uz
	+JvxSdSlMoCv8C9FVpkIR1b6mfeRWE0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-_TAyh0rrPrSZo_p5acszOQ-1; Mon, 13 Mar 2023 07:44:45 -0400
X-MC-Unique: _TAyh0rrPrSZo_p5acszOQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63FD33823A01;
	Mon, 13 Mar 2023 11:44:44 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F8614042AC0;
	Mon, 13 Mar 2023 11:44:42 +0000 (UTC)
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
Subject: [PULL 14/25] os-posix: remove useless ioctlsocket() define
Date: Mon, 13 Mar 2023 15:43:24 +0400
Message-Id: <20230313114335.424093-15-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-TUID: wjYqf+2jsEow

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The API is specific to win32.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230221124802.4103554-16-marcandre.lureau@redhat.com>
---
 include/sysemu/os-posix.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/sysemu/os-posix.h b/include/sysemu/os-posix.h
index 58de7c994d..378213fc86 100644
--- a/include/sysemu/os-posix.h
+++ b/include/sysemu/os-posix.h
@@ -52,7 +52,6 @@ void os_setup_post(void);
 int os_mlock(void);
 
 #define closesocket(s) close(s)
-#define ioctlsocket(s, r, v) ioctl(s, r, v)
 
 int os_set_daemonize(bool d);
 bool is_daemonized(void);
-- 
2.39.2
