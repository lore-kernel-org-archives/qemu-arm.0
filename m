Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1722544ejc;
        Fri, 13 Oct 2023 12:10:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEodsnHZfAQGsdZUtPYTZ7XzG/DP/w6qVJqUKSylIuVyK/2jKN9AKyqVEhKZbcwb0jxIyZi
X-Received: by 2002:a81:48ce:0:b0:5a7:c640:7003 with SMTP id v197-20020a8148ce000000b005a7c6407003mr11755758ywa.23.1697224203326;
        Fri, 13 Oct 2023 12:10:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697224203; cv=none;
        d=google.com; s=arc-20160816;
        b=smy7o0kdn6I0HM/uNC+FeLXD/TQXar+g4+aRJotV79NidML3y3XhhFI0LuLhkV32jI
         8+Dzzq+YpgVFAuN5ejoIm6ghGFInlJ4yjjDSjBv3CRekrEsXRehQcNT9mksGWUMVOwnM
         UoPHPc41VDwhLpaYkrPWKZALRFL5rD8Rt2e8VCeUHBnDJYmLxu6k4leUZWUHpUmTFzrN
         2r1tCwyaQjd99KBdW3D2stozdm/sFKlTOtwtTq2HLdwDRczAxAwV7iNXjtOt0uwSXAtH
         WfySgzFRCK6nTMamwS8Cgc4vWe4jDEOg7eF9GTXeQJgAKHFq06nLpdEUTThmXUs8SVWL
         gWbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=w3StD4bo+PpSuLq5pwNj05F876gF6NHUKZzqNiociig=;
        fh=D6q9Zl84lh9f35IkUo72nHtoK2p7pHS0kVOpFtZg6qI=;
        b=h4MkNt1h30pEGkrvHJXFBsC+bR21toO1ZIhUIdZ2VkBxtZpy2GTEH+qGCEuPYQtQN2
         TXi5+iLypgqnQwyN150v9zuReYoRanwyG/Dpr0kvIqGfLWlXJ9EZM8s+e5Yye3/UWD7V
         yyl+yzbT2PrvaBj2wLj0ffhBR2q31X2xza64WrpAvh9vh5tG+PHsaK59gEmEG3tMsOfn
         EcYfy+ccCPikDXqUTUhg7iXjJKVzRAukl7qaLhZSBrYrhX60jqUiGpPnoI8z46r9e7cO
         0kyadaX+typ9E9Z6+yzLdDaLCCq7tOO/sR62KXjTS9wuaIirHMRGaSnZ8ifHiKpExeGw
         VvZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Funi2ERR;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id az17-20020a05620a171100b0076cb6c9e0a6si1687032qkb.336.2023.10.13.12.10.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 12:10:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Funi2ERR;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697224202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w3StD4bo+PpSuLq5pwNj05F876gF6NHUKZzqNiociig=;
	b=Funi2ERRxf314C9n+mMkVKMzjDU6Gds9ikseipxoPDHYyAIW8+5jmcqyfKfwJ5u3Oa4HSw
	rFuvAo8G/hsr/aapye7K0NOzkfA1VXeqhhw73I9u5XE7MdmImn1UmMES6XUctFvluzAPbU
	AnCOI9ZUkKwERo2UFZA+Ul1zHqHZa3A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-TMkMF7QkN8aTAtOUq7MQ-Q-1; Fri, 13 Oct 2023 15:09:53 -0400
X-MC-Unique: TMkMF7QkN8aTAtOUq7MQ-Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 756C51029F40;
	Fri, 13 Oct 2023 19:09:52 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4233040C6CA0;
	Fri, 13 Oct 2023 19:09:51 +0000 (UTC)
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
Subject: [PULL 07/25] Python/iotests: Add type hint for nbd module
Date: Fri, 13 Oct 2023 15:09:22 -0400
Message-ID: <20231013190941.3699288-8-jsnow@redhat.com>
In-Reply-To: <20231013190941.3699288-1-jsnow@redhat.com>
References: <20231013190941.3699288-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-TUID: gLoD9I8JR/IN

The test bails gracefully if this module isn't installed, but linters
need a little help understanding that. It's enough to just declare the
type in this case.

(Fixes pylint complaining about use of an uninitialized variable because
it isn't wise enough to understand the notrun call is noreturn.)

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-id: 20231006195243.3131140-2-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/tests/nbd-multiconn | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/tests/nbd-multiconn b/tests/qemu-iotests/tests/nbd-multiconn
index 478a1eaba2..7e686a786e 100755
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
