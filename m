Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2891661ejb;
        Wed, 4 Oct 2023 12:46:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX7AzjvWWYyDobwDpvC1YGA1IO2HqQ/b1dwUPt0sbLV0DDaid/v+/jrFJc0XpfFYAqdpiy
X-Received: by 2002:ac8:5c52:0:b0:412:1ba6:32c7 with SMTP id j18-20020ac85c52000000b004121ba632c7mr3731360qtj.44.1696448782917;
        Wed, 04 Oct 2023 12:46:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696448782; cv=none;
        d=google.com; s=arc-20160816;
        b=nPm6ZBYgHBiknqfz/mzEM+E2GTULTZDnrTxlIxILqy5gMi8Zse/aTchLFN8vPha5Sh
         Q0TjrjnKkNDNdI69PnqEY0zcTrm81uMKgU6b/ZbcuvNen5zepAaew9Dsvq2eC+H6nFT4
         2GL+BmHNSnmX6ITFezyKii1jfHVcMoe12nyda3++1lQsYAdLlfwDliS7B4OqCrxtYVeX
         kVe41Hjag6Efguaft3VI/3PMbm1+UpR8YTuiHO+lvrBhr9QZ3epgeX2hNOlbQN7C72kK
         NvEZ6V+e4Z0CovOlfRZdPHdBZeo9KrAJM5akv+H0Sku25WRuyy2zLaJV8Mzam765HBnO
         4rZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=q9h+cageP+sFv7Pz8M2/uena7/9BQ+/VSci8+mUVQIo=;
        fh=YYcUncbuZ8zA1+PNe3n/41UyzzQQmqdTXlaMDrLfUHg=;
        b=S1EaRTuVXdWFsmyRxIPBhvPSQD+KvuDomVMy1GQTLPPZXw0QVfFCa298g8ddU9THzq
         rgzkR1yGVNM6JroRRpA/qwpzMol6ujqJ1r3TF1xsRlMyjUeh5pW+o86lxhRW5QFLJbU9
         tEQD4FQLGinEJTEP/wNvhyrhF87c8CvNQFeXy5N8a6KVR4U1ivlqg/O7RQw4G7PPKy8+
         zbmd72rg7RXLjlD3CCCNiXpOIyQaGolDW+zy8ANobvXwv4x+1lS3D74TA/7G5BAel2K0
         CkrdO82/B0nSImRsEtKuUE55GKq1D/BSnenf3l7QS+GmlfxWjXrJJhkgT2lpxpPyIOEH
         BUfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ak58GLhn;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id u7-20020a05622a010700b00418d6b2d48dsi1818659qtw.187.2023.10.04.12.46.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 12:46:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ak58GLhn;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696448782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q9h+cageP+sFv7Pz8M2/uena7/9BQ+/VSci8+mUVQIo=;
	b=ak58GLhnnSS/YRmbr6L2mdm9JedNFZV96L3YnyTManV3NBGQSbnbgW+bYQYeN9XT819kob
	ATGLPpMUNWJKBtxwZIQmW1lTxWk91rKrgW7a3ec3/9Ydq/KBQladhBOtVuKz3E8ufqUQ30
	uaPga46Uhp9DBN6wyFeoLF/7qqJPB/Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-94-3DTRmH4zM9mG88Pv9be21g-1; Wed, 04 Oct 2023 15:46:18 -0400
X-MC-Unique: 3DTRmH4zM9mG88Pv9be21g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0048185A79B;
	Wed,  4 Oct 2023 19:46:17 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A87731005B8E;
	Wed,  4 Oct 2023 19:46:16 +0000 (UTC)
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
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 2/9] python/machine: move socket setup out of _base_args property
Date: Wed,  4 Oct 2023 15:46:06 -0400
Message-ID: <20231004194613.2900323-3-jsnow@redhat.com>
In-Reply-To: <20231004194613.2900323-1-jsnow@redhat.com>
References: <20231004194613.2900323-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-TUID: /VUwrGm69sFH

This property isn't meant to do much else besides return a list of
strings, so move this setup back out into _pre_launch().

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Ani Sinha <anisinha@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20230928044943.849073-2-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 35d5a672dbb..345610d6e46 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -301,9 +301,7 @@ def _base_args(self) -> List[str]:
 
         if self._qmp_set:
             if self._sock_pair:
-                fd = self._sock_pair[0].fileno()
-                os.set_inheritable(fd, True)
-                moncdev = f"socket,id=mon,fd={fd}"
+                moncdev = f"socket,id=mon,fd={self._sock_pair[0].fileno()}"
             elif isinstance(self._monitor_address, tuple):
                 moncdev = "socket,id=mon,host={},port={}".format(
                     *self._monitor_address
@@ -340,6 +338,7 @@ def _pre_launch(self) -> None:
         if self._qmp_set:
             if self._monitor_address is None:
                 self._sock_pair = socket.socketpair()
+                os.set_inheritable(self._sock_pair[0].fileno(), True)
                 sock = self._sock_pair[1]
             if isinstance(self._monitor_address, str):
                 self._remove_files.append(self._monitor_address)
-- 
2.41.0
