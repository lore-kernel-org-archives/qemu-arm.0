Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1722460ejc;
        Fri, 13 Oct 2023 12:09:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjiu1ZDYPCT+bLmeC2nx9H1Pq3BwcNELaRCxNPpSbgGFnkb3ZgQLAwCFNdBpx2CzoIQ/gR
X-Received: by 2002:ac8:57d3:0:b0:403:a814:ef4d with SMTP id w19-20020ac857d3000000b00403a814ef4dmr34186779qta.49.1697224193542;
        Fri, 13 Oct 2023 12:09:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697224193; cv=none;
        d=google.com; s=arc-20160816;
        b=xPCb4o56L+5d/0Nu64qpzFaAMJnhqpmC2WAHZOCkEWVc0rP587VVPTD3FgSFIJFNbs
         CnMNioKbe3kt2qxLcugo4iOGmWR34tfY2OkOgNNk609kzaM6ZLU/Ijbt1bRLqbNpUjAL
         WIKi/hU+M8EI4pxmLF213Inj+Wg8u6+VFs9u3dphCSTQdvLeOo3PUWy5X0gInbIlqiCi
         GD6SGhsZTp/0f2mu7SdNumn5/cbbwYFh5TBVWttSvqJRijhM4ekQPuejsYS0JXxS7bzM
         Gzpjrp5FRG+VgaIdJ/zY/sxpsaQkIDuhGCqC66IUxAqev/IKGen8TjgDk0lEm75FM5pF
         AVFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OAVtoVSpnW5Wvlas0E9i9zwJ+HL17YG1l57fv8jrf5Y=;
        fh=OrnKDpMzEp7wbNAUpJYWlPb6BZBa4HxNRhsHT4snMn4=;
        b=x9bpEzXWBjlLmGBMwZEYUlh7VjOWGHIGraqwzP8X6CIW0+7+i5bBF0dHT3J14U/8VK
         wUli7b+knMEXYSK3NrPA/SA7R+3BXbgSUds1qUx47JgBsOtdzjVEhQJnaPTiKunpdmOj
         jhwbMcbmmRMnJXS++K84uKCQaaqpc8iFK28wKa4jRF8LKKnwlGZUkhxejPSAJHU+asmg
         3nurKCYxOu58jdNtY2PUoo5xRrvDQai9mpYrMOiKp8y79DjRBK3p57NivC6jSauzFRP+
         qAP4j1BPzQCq4qbpM+eevjHOV+TmW9QVKUfqXF/ZSkz9Mg2Dc3sErnRH1NvjcUb5XOR1
         QGtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="i/S3ev1o";
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id t9-20020a05622a180900b0041812c64682si1699140qtc.112.2023.10.13.12.09.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 12:09:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="i/S3ev1o";
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697224192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OAVtoVSpnW5Wvlas0E9i9zwJ+HL17YG1l57fv8jrf5Y=;
	b=i/S3ev1oaW33ytWGN3wIQ4+sw8RENc4Mc0X33TZi8TopbSrjK2sGiZE6ko/m48MLij/7r0
	fFB7JUIBonGgl/PeKUQxYv+Hat4V3rVOq6CWqRtzCufuIwmVqALpbLzjusyHOktaqu0+jh
	8IcX81203rNS530rSrBVrMxZ5ceM89E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-BGnS8LPcOJu4EmIAQpmnUQ-1; Fri, 13 Oct 2023 15:09:45 -0400
X-MC-Unique: BGnS8LPcOJu4EmIAQpmnUQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5AD685A5A8;
	Fri, 13 Oct 2023 19:09:44 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6C8A640C6CA3;
	Fri, 13 Oct 2023 19:09:43 +0000 (UTC)
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
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 01/25] python/machine: move socket setup out of _base_args property
Date: Fri, 13 Oct 2023 15:09:16 -0400
Message-ID: <20231013190941.3699288-2-jsnow@redhat.com>
In-Reply-To: <20231013190941.3699288-1-jsnow@redhat.com>
References: <20231013190941.3699288-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-TUID: t3x/Zv6yERZ3

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
index 35d5a672db..345610d6e4 100644
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
