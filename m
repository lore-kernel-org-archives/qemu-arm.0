Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1722500ejc;
        Fri, 13 Oct 2023 12:09:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDLwuw3+zbtvJGnxUDfr3HM5DptaSlLV/rXGKM6U9G774OsOTGCciFfSLxGoqLoozmtk7e
X-Received: by 2002:ac8:5946:0:b0:412:1fd7:dfa1 with SMTP id 6-20020ac85946000000b004121fd7dfa1mr33464880qtz.8.1697224198306;
        Fri, 13 Oct 2023 12:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697224198; cv=none;
        d=google.com; s=arc-20160816;
        b=nQgerkQvPZ/4DyiOrXArLGxV6y2/ihivJJt9RCwiMffCYgMBC8KjqtyPFnUeuQrvNa
         wOfl2q0TiKtjKKRs6Lc3s+PVNCVguy5M5Q042K9p3iIJhBWG054YEeLE8rovJw2SXxvz
         MPkPV/SdY4NrbTm8ts5hKqEXgdidDe5Zg1xNe20KVTSyJds+lfDbz1m78uaDxAcJTgG/
         95VeWxRdhke3ay8AzGs6x+Dt5OFmuNl5QhSHIJjj1ClPWJDX9vNQhTQYtz79gmMCfIYF
         LIvTiNhEM9sxRKLMlEfKM0d9SVLN0m3qXIyiDapTGEgjw7JXfoTEjP+lTULVGjGAjVbS
         5SxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6Wk63tEYkkJ6DYHqO2WS70EapGOvR59GzuZeJ88eG2Y=;
        fh=D6q9Zl84lh9f35IkUo72nHtoK2p7pHS0kVOpFtZg6qI=;
        b=Ay7KforzGVREt6tMh1ibZGV7G6b9COSjApyqSSezog2L3Vf/bJZ6rrIPEKcymrjghY
         IRrdJfmwCupJ69N8cruMHX61lN07zvCNmUGKtcTFIYRz0ktZEGRcfiu/uw9EV7o81oVR
         cMTNaudgce5RbT0CBv1MUVehHbDfO7O5uI90sw150gHK2CPGg9KUc0h19Snu/cXEpdop
         bQnytBqD6BvDMVR81JJQA4EQdDItSBXZw66OuHTnhl3Neaxp6JxF3xJq77CyVjI3Zlj9
         O9qJGJ1VWnBtzOZJG3I5O+ds0PQVCYJDj5/G3rj2jLU+ofsvbPCqV9gydbD9GIlLdMLu
         Nzqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EKuyQFbo;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id c7-20020a05622a024700b00418142e802dsi1693077qtx.417.2023.10.13.12.09.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 12:09:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EKuyQFbo;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697224197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Wk63tEYkkJ6DYHqO2WS70EapGOvR59GzuZeJ88eG2Y=;
	b=EKuyQFbom+J1CPXW9SluJvwYOfW5CU0Z5BBm1Bt4huZOW1XCt0LcBLUxOVlzZTBhSzFxfb
	Rn8Ln6/ojI9KQZY8Ex2keobZUMOHWshUbHDniz4uwK5wVI8FMUrWJPtMTmxwLtUSN2o3Jp
	aMPB7+MY7yXzN2PefE1GDFTSsKrEoh0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-Ldv_5wPROWaY9-AE9jcnBg-1; Fri, 13 Oct 2023 15:09:54 -0400
X-MC-Unique: Ldv_5wPROWaY9-AE9jcnBg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB4EF1029F41;
	Fri, 13 Oct 2023 19:09:53 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8369740C6F79;
	Fri, 13 Oct 2023 19:09:52 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org,
	Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
	Ani Sinha <anisinha@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-s390x@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	John Snow <jsnow@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Juan Quintela <quintela@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Eric Farman <farman@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Cleber Rosa <crosa@redhat.com>
Subject: [PULL 08/25] python/qmp: remove Server.wait_closed() call for Python 3.12
Date: Fri, 13 Oct 2023 15:09:23 -0400
Message-ID: <20231013190941.3699288-9-jsnow@redhat.com>
In-Reply-To: <20231013190941.3699288-1-jsnow@redhat.com>
References: <20231013190941.3699288-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-TUID: awJlx4FvOIhS

This patch is a backport from
https://gitlab.com/qemu-project/python-qemu-qmp/-/commit/e03a3334b6a477beb09b293708632f2c06fe9f61

According to Guido in https://github.com/python/cpython/issues/104344 ,
this call was never meant to wait for the server to shut down - that is
handled synchronously - but instead, this waits for all connections to
close. Or, it would have, if it wasn't broken since it was introduced.

3.12 fixes the bug, which now causes a hang in our code. The fix is just
to remove the wait.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-id: 20231006195243.3131140-3-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/qmp/protocol.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/python/qemu/qmp/protocol.py b/python/qemu/qmp/protocol.py
index 753182131f..a4ffdfad51 100644
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
