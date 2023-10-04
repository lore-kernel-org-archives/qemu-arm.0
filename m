Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2891793ejb;
        Wed, 4 Oct 2023 12:46:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+fOE0HPNPp+qP4bt1JAY/GINWpJBOXmpgidWdmDczl+GsLO90RBSi9iUWtpruCH27Crti
X-Received: by 2002:a05:6870:a10b:b0:1dc:bb65:f2be with SMTP id m11-20020a056870a10b00b001dcbb65f2bemr3848671oae.10.1696448797185;
        Wed, 04 Oct 2023 12:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696448797; cv=none;
        d=google.com; s=arc-20160816;
        b=PSQydVnJsY6cr2fvnEa3bHwr3CeIFdj8jxQ1A7bwDtij6aam+Bot3ZbcE4apNZMdwS
         XKWEzmQjyaPL6vq3pNy/6OhLMjOl0k+ouSjorVQn9BEWqgg/XuD2nV4bcynAPpAUU0Iw
         3cPRTGeifQQnUOS2fw0zleQzToz9Qi5GRRLEaGh+hPkL7lNT2b7gFPl7Hfo73860F4Lg
         VMNxnGkMiae7x6M0YWsa3FBtWHT5jy2hfvvusuR9KJUbxdPC2E6NB2Dv1pXGuBWmWG3Z
         tiIMez6X2CZSNMe80hlG0fTBjZemqKM5fkFQFRWKZ9Lf5Qpp95SoEuLQrd5RId5889mf
         qNGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=E9MWhcZdOckvKdPPyQRZQPaqlNKCSIWZTSIJBtiOjhQ=;
        fh=T+SSTeAxrZ+7RtL9oY8pymA8+lHV6k3OjFi4ur0eRDs=;
        b=b298xxTqiYDnTu6WUTyjhGUOm/jNxNvtH4EbEnpDOVd4g6yq1CB8TFJkR2kYTf2LTf
         o9akeYzQjjrs6kzIQxg9Mk8o8wUaoSpDrwmByk+AA9oFT7Gge8fHxwjFUcHj+ogB7HKB
         6AHxr8a4HFdu1QTSghK6DE/ktr44WvWiUWXJpyYnlpJX1VkfoB1TUdRrPavgN4HptQGn
         bHBf9Kh5JpkJ3pHHRB76WxTK/wK+TPpJ7wgO+d9hfrNstff74a9HcPXiFtndeOGdclkD
         jdioH+jGBqSFtu9H5ZrEt0GqA+3HDoTWqKY1Dp++qxd6h9tlOK90uOUT7Y0Q209w8a0b
         5oDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dLgNUiZH;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id eb8-20020a05620a480800b0077593f7148csi1762046qkb.273.2023.10.04.12.46.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 12:46:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dLgNUiZH;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696448796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E9MWhcZdOckvKdPPyQRZQPaqlNKCSIWZTSIJBtiOjhQ=;
	b=dLgNUiZHEccP++sh8h+BtdODhKxfUsgFm1DWHhr9SgtNIY/FxQCSxnCWHV2aJHBKwaf6l6
	I2k3uU3G8c2U/gvyYl9kBdvWEYiC34Ap862P5mwMnepmsv5Bnz3iNiUrVHCBoltNrpOR1Q
	llNE3upZhFeOGA6QAbA3rB10CQpA10I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-zk3WSzupN8mkdp0C85VPSg-1; Wed, 04 Oct 2023 15:46:17 -0400
X-MC-Unique: zk3WSzupN8mkdp0C85VPSg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 954AA8007A4;
	Wed,  4 Oct 2023 19:46:16 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 91D111006B48;
	Wed,  4 Oct 2023 19:46:15 +0000 (UTC)
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
Subject: [PULL 1/9] Python/iotests: Add type hint for nbd module
Date: Wed,  4 Oct 2023 15:46:05 -0400
Message-ID: <20231004194613.2900323-2-jsnow@redhat.com>
In-Reply-To: <20231004194613.2900323-1-jsnow@redhat.com>
References: <20231004194613.2900323-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-TUID: IXJSThRgQgDm

The test bails gracefully if this module isn't installed, but linters
need a little help understanding that. It's enough to just declare the
type in this case.

(Fixes pylint complaining about use of an uninitialized variable because
it isn't wise enough to understand the notrun call is noreturn.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/tests/nbd-multiconn | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/tests/nbd-multiconn b/tests/qemu-iotests/tests/nbd-multiconn
index 478a1eaba27..7e686a786ea 100755
--- a/tests/qemu-iotests/tests/nbd-multiconn
+++ b/tests/qemu-iotests/tests/nbd-multiconn
@@ -20,6 +20,8 @@
 
 import os
 from contextlib import contextmanager
+from types import ModuleType
+
 import iotests
 from iotests import qemu_img_create, qemu_io
 
@@ -28,7 +30,7 @@ disk = os.path.join(iotests.test_dir, 'disk')
 size = '4M'
 nbd_sock = os.path.join(iotests.sock_dir, 'nbd_sock')
 nbd_uri = 'nbd+unix:///{}?socket=' + nbd_sock
-
+nbd: ModuleType
 
 @contextmanager
 def open_nbd(export_name):
-- 
2.41.0
