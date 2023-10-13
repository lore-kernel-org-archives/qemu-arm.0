Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1722695ejc;
        Fri, 13 Oct 2023 12:10:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnrSIx2q6uuYeNWfN/wQnb13aBRZdHD3kHoY86eBBmynw+DpYwLa1PBXSpHlklMcZhmjoA
X-Received: by 2002:a05:6808:dc2:b0:3ae:524a:fcd6 with SMTP id g2-20020a0568080dc200b003ae524afcd6mr25054039oic.51.1697224217623;
        Fri, 13 Oct 2023 12:10:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697224217; cv=none;
        d=google.com; s=arc-20160816;
        b=IYWYlBQK7SzUfZfHdQVwZN1MZV+0UKv17vEfZYteMuWO9T7OZyq5tG3xRV292uyHAI
         VMMgQWLE14Fh0fDxF/tPHCCg6yR4FDI9NaJUN4fJEwPMPnsoBSWRJwVhfx3+lRJE7c6E
         L4R6kKMBOLikJPJBAIYmMuBBrhbH01BTBwJZZ972cT5INhHnQ4D8u+jvIN4ovB5pEARN
         T5a41zLGKY0LPntn+OhJaPoaZ7RxwwQLmWt2qzNIAsYJyiyyI2jTSB9DWcuLbGv2QQQA
         328c4dvkq9GnkBQ2SnhqQdCqSbVJ726Q4kVf9LhuUF/ml/UKKAjCHrdkYYbSj2hsUKkx
         zwwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TQTYOTWid1Fw+cf9QBy9KAEHE/HDVmmzcztVlOI0G7g=;
        fh=D6q9Zl84lh9f35IkUo72nHtoK2p7pHS0kVOpFtZg6qI=;
        b=I7Mzzf6bRxQ5w8WpaO3COIIzBkPqZ+ZAYnLPx8e5iYeTphUk4T1bQDBffD0NPeb6g5
         OWNdI24/wazHYw6G1zZstSqT5dFFSeisZXUC9ih/eKpF18mT1A1mJ8HpQzDxcAgH4HE9
         IlW+jHXBEDXQkzRq+MjBcjygDpvI8eqwB0fNIdjvXOepOeNUsAaHL3Hg6DzmSbV7OFpG
         fmzfWdr+G3zctMEpMJYXRzjN0un+L0FD/swc/Ae3jcjHe8/pSy+2wvgLx1bLmKO74gFV
         cXdbBBMKsLFCPlaBofWe5EvlBKNkqLSwEE721SIJ9CqnFTVjbu9nqOA5IhxLQnj8IwiM
         iQmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="QW/2kXwJ";
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ee16-20020a0562140a5000b0064f72cc4bdasi1646422qvb.575.2023.10.13.12.10.17
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 12:10:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="QW/2kXwJ";
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697224217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TQTYOTWid1Fw+cf9QBy9KAEHE/HDVmmzcztVlOI0G7g=;
	b=QW/2kXwJTIj3rccfe0ZyEHj3PKOE6NckSK3Mb7QHK7u783VNv/Fwdk6r2y5+jYlW+/afkf
	PeJYpQFVN/UfqSjyUoZfsWHcvjhGVrdK9OqR6TEcFasGCy9W+ekqACbqeuyZk979GI2oXf
	owN4fQw6J8h6IxAB7laBy2ylz705grs=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-689-AOwaVW6NOKiQVa8kAEaogQ-1; Fri, 13 Oct 2023 15:10:12 -0400
X-MC-Unique: AOwaVW6NOKiQVa8kAEaogQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE2D21C00D1F;
	Fri, 13 Oct 2023 19:10:11 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A80F040C6CA0;
	Fri, 13 Oct 2023 19:10:10 +0000 (UTC)
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
Subject: [PULL 22/25] iotests.py: pause_job(): drop return value
Date: Fri, 13 Oct 2023 15:09:37 -0400
Message-ID: <20231013190941.3699288-23-jsnow@redhat.com>
In-Reply-To: <20231013190941.3699288-1-jsnow@redhat.com>
References: <20231013190941.3699288-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-TUID: PhcdT9oOsJQo

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

The returned value is unused. It's simple to check by command

 git grep -B 3 '\.pause_job('

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20231006154125.1068348-13-vsementsov@yandex-team.ru
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index ee7b6ddeff..f43814e802 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1338,8 +1338,7 @@ def pause_job(self, job_id='job0', wait=True):
         result = self.vm.qmp('block-job-pause', device=job_id)
         self.assert_qmp(result, 'return', {})
         if wait:
-            return self.pause_wait(job_id)
-        return result
+            self.pause_wait(job_id)
 
     def case_skip(self, reason):
         '''Skip this test case'''
-- 
2.41.0
