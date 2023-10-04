Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2891723ejb;
        Wed, 4 Oct 2023 12:46:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeo2K4bjX8uACeveOMDHveRYUewvU4U45sdIT93WRSBygNLSIEwEBT6PBbgUI0UyUj+SBU
X-Received: by 2002:a0c:f285:0:b0:655:87a1:49c0 with SMTP id k5-20020a0cf285000000b0065587a149c0mr3298545qvl.3.1696448790122;
        Wed, 04 Oct 2023 12:46:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696448790; cv=none;
        d=google.com; s=arc-20160816;
        b=pfOpmR9TwW90VPTRDWMmYA8mIA2spw/DnhQO5WLL5FxUPde/ClxDH6rtT4ytRlHRrr
         JbdL3bglnYMZ9eJbe077IRg/g+RKxM2xqtr28a6tbWbnrg3SEUpYEzvvYBHBvdYcdBlP
         ncXIDo6/1cXn9REHAu+dIyh3ieuJWbbGcwxLfxZ85TA59ZH4gtWO1pPuISlCY3SXtAqH
         s/iesaPKTmWROtOT5O2/VmasCKdfUeL+imSqB0bJ3Ccp7ZWR/RpMFD+raZysZzNYvhEb
         7M3FSqZN3QJ7V/puTxwtjdK80UKlDCgR9mM61bdohS30cvzbyYCarJgjXWVYN5OF3nzL
         3pEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qQJsZrMtJpzIhg4gUKqXc9fp4eSxo3ZE8MOIZ9Pskjs=;
        fh=T+SSTeAxrZ+7RtL9oY8pymA8+lHV6k3OjFi4ur0eRDs=;
        b=1GllPQkE4cwmIAcYgfTGrHSwResULRcZZ8sMwNXuv05qiyWoD3oOgoKHEjolN6PXE8
         HR1dLUZ5vwnsInUUuWEKUrUQNRksYDP17ECarDQUHQaOjhnpKFzxF+zRFS45zIX8Ad/O
         Ehx7hoxZiS+VLpveJ7BZT9lS+as/h3/t94Rcs4PVVqr62vOlHRKg8fuyT2vhueGZNQb8
         o/ZnpYvO2gje7QNs26NuM+Wo5fIWUwY+h04FQXaYYtf/2VM691NTsPH+zroJcwBW+02E
         YVhD0lMekMkHpUG+t9//OOiaMfz23X8a27NuaYH0hYwDr7IO6tZ2AE4StsS1WJQw4m3W
         U1sA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="b6yS/xzr";
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id o13-20020a0ce40d000000b0065aff063eafsi1741426qvl.538.2023.10.04.12.46.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 12:46:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="b6yS/xzr";
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696448789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qQJsZrMtJpzIhg4gUKqXc9fp4eSxo3ZE8MOIZ9Pskjs=;
	b=b6yS/xzre3TBo0s55mjG4EEy/McVeib9OO1C2Efi9Z2cY91kFQSNgYQ/FR+DrMTYymi4qq
	bUdjN2OLJn1pBLlW3gvP235l7vKzKFAGsFWRGXoAs5LozU3ErQSIttZByce+NVpOoqtV5t
	vXi1kk/89SPqF6Dm8DeKev2OmDpIdkM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-kh1flpC0OjiRnEAaMKYx6g-1; Wed, 04 Oct 2023 15:46:24 -0400
X-MC-Unique: kh1flpC0OjiRnEAaMKYx6g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7533685A5BD;
	Wed,  4 Oct 2023 19:46:23 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 924151054FC3;
	Wed,  4 Oct 2023 19:46:22 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	qemu-block@nongnu.org,
	Beraldo Leal <bleal@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Hanna Reitz <hreitz@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
	Thomas Huth <thuth@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Markus Armbruster <armbru@redhat.com>
Subject: [PULL 8/9] python/qmp: remove Server.wait_closed() call for Python 3.12
Date: Wed,  4 Oct 2023 15:46:12 -0400
Message-ID: <20231004194613.2900323-9-jsnow@redhat.com>
In-Reply-To: <20231004194613.2900323-1-jsnow@redhat.com>
References: <20231004194613.2900323-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-TUID: Dkf9w2rnv8N+

This patch is a backport from
https://gitlab.com/qemu-project/python-qemu-qmp/-/commit/e03a3334b6a477beb09b293708632f2c06fe9f61

According to Guido in https://github.com/python/cpython/issues/104344 ,
this call was never meant to wait for the server to shut down - that is
handled synchronously - but instead, this waits for all connections to
close. Or, it would have, if it wasn't broken since it was introduced.

3.12 fixes the bug, which now causes a hang in our code. The fix is just
to remove the wait.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/qmp/protocol.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/python/qemu/qmp/protocol.py b/python/qemu/qmp/protocol.py
index 753182131fd..a4ffdfad51b 100644
--- a/python/qemu/qmp/protocol.py
+++ b/python/qemu/qmp/protocol.py
@@ -495,7 +495,6 @@ async def _stop_server(self) -> None:
         try:
             self.logger.debug("Stopping server.")
             self._server.close()
-            await self._server.wait_closed()
             self.logger.debug("Server stopped.")
         finally:
             self._server = None
-- 
2.41.0
