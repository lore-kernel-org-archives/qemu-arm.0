Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1722603ejc;
        Fri, 13 Oct 2023 12:10:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaKHSkJ5JyQuHpRn8bztwworfXoCHZprF7qOEF7J/cObyY2QZ77is/ILF27LtEPJcsSFc1
X-Received: by 2002:a05:622a:214:b0:410:8cb9:8dea with SMTP id b20-20020a05622a021400b004108cb98deamr32412080qtx.6.1697224211271;
        Fri, 13 Oct 2023 12:10:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697224211; cv=none;
        d=google.com; s=arc-20160816;
        b=Ssvk+PRI4+qvDQgrVcQy6leluhY8WGqrslnWmPjfFTFhhiki+uvK7gSLQ8FRSbxoj6
         ytcSzD0Holafpl48VsQI+PbIo/akkWJsf35+mmIiNz+SH4kOs+gPj372s1wtWzWfgBId
         2PjwFaJmN1KiV4QKvgZRNU7kzC4868ar7/hNPEf95o1JtaXyBvI0CsFPSOpB2B1MdI8X
         NZBQzbe3jjePMi5PeQhAG11teAeDxs+K9LL08+jv7PqLibcU4HdF6RgnK/9TzY9SStyX
         WHdj0ZBJbuXCMyftbYmKWXvn8+QcFY/ea96+PeKmNYaNYDKaNU3ZRobL9OncGniaiod0
         562w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iJ7wl0Ii06+M3pV66TBNc0GtswGn7yjmI2vwYEHWBIg=;
        fh=D6q9Zl84lh9f35IkUo72nHtoK2p7pHS0kVOpFtZg6qI=;
        b=vJTnBGa4Ay6MiroFNImBaZyiMjIOXeLglTkNeOAx4FK5SigddY7XUh2J7ysnLxaf9g
         laNcW1Fxb4NSE/thUPkuODbbrxEPDGz2PY4QNIUI2Vh1G58BwHBwhX5YOTtNaZrEHp0o
         fUO8+TpwgW3kerNNO0n3qYQSE+oTG3jZ//ii4aR8QturAV98NylcBU74tp8uvGoms2Bv
         iKPXFHyaoPkDFDMiBTIhr1RJQKMiuZbkJFwTe+J/HI/3BVNnxK6g1c5Vabdc7VEk73Mh
         Vhect0qVAf90YaSVmGUKxHf6vZwaNoIitfEQvnMDR+3SvYjIjjvY3lGystHsvHgjfBmn
         LD6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="QDHs/YrW";
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id m8-20020a05622a118800b00417cfd588cesi1696145qtk.766.2023.10.13.12.10.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 12:10:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="QDHs/YrW";
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697224210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iJ7wl0Ii06+M3pV66TBNc0GtswGn7yjmI2vwYEHWBIg=;
	b=QDHs/YrWOBh+awiDlO5RA3v7rWpEQQF4cQj8pCJYleTL8bIs03FyY/ryB25PgSOdLomsnP
	mQi576SrN9RGp13fZmF2XjV2UqNfK7VMCa9DB7XyI9GJwaqUq7gF1KJeaRY1+pCAp0RsEf
	Jtx80kMAagYR/SJA+ntAxombN532uAo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-FXReLPtdMmqGpbsaF9VE1A-1; Fri, 13 Oct 2023 15:10:02 -0400
X-MC-Unique: FXReLPtdMmqGpbsaF9VE1A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93CB28039C1;
	Fri, 13 Oct 2023 19:10:01 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5D6EB40C6CA0;
	Fri, 13 Oct 2023 19:10:00 +0000 (UTC)
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
Subject: [PULL 14/25] python: rename QEMUMonitorProtocol.cmd() to cmd_raw()
Date: Fri, 13 Oct 2023 15:09:29 -0400
Message-ID: <20231013190941.3699288-15-jsnow@redhat.com>
In-Reply-To: <20231013190941.3699288-1-jsnow@redhat.com>
References: <20231013190941.3699288-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-TUID: KZ+aorXRzVnB

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Having cmd() and command() methods in one class doesn't look good.
Rename cmd() to cmd_raw(), to show its meaning better.

We also want to rename command() to cmd() in future, so this commit is
a necessary step.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20231006154125.1068348-5-vsementsov@yandex-team.ru
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 2 +-
 python/qemu/qmp/legacy.py      | 4 ++--
 tests/qemu-iotests/iotests.py  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index d539e91268..50bba33729 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -702,7 +702,7 @@ def qmp(self, cmd: str,
             conv_keys = True
 
         qmp_args = self._qmp_args(conv_keys, args)
-        ret = self._qmp.cmd(cmd, args=qmp_args)
+        ret = self._qmp.cmd_raw(cmd, args=qmp_args)
         if cmd == 'quit' and 'error' not in ret and 'return' in ret:
             self._quit_issued = True
         return ret
diff --git a/python/qemu/qmp/legacy.py b/python/qemu/qmp/legacy.py
index fe115e301c..e5fa1ce9c4 100644
--- a/python/qemu/qmp/legacy.py
+++ b/python/qemu/qmp/legacy.py
@@ -194,8 +194,8 @@ def cmd_obj(self, qmp_cmd: QMPMessage) -> QMPMessage:
             )
         )
 
-    def cmd(self, name: str,
-            args: Optional[Dict[str, object]] = None) -> QMPMessage:
+    def cmd_raw(self, name: str,
+                args: Optional[Dict[str, object]] = None) -> QMPMessage:
         """
         Build a QMP command and send it to the QMP Monitor.
 
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 145c682713..0c061d8986 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -460,7 +460,7 @@ def __init__(self, *args: str, instance_id: str = 'a', qmp: bool = False):
     def qmp(self, cmd: str, args: Optional[Dict[str, object]] = None) \
             -> QMPMessage:
         assert self._qmp is not None
-        return self._qmp.cmd(cmd, args)
+        return self._qmp.cmd_raw(cmd, args)
 
     def get_qmp(self) -> QEMUMonitorProtocol:
         assert self._qmp is not None
-- 
2.41.0
