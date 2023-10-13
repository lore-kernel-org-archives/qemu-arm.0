Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1722698ejc;
        Fri, 13 Oct 2023 12:10:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXE0JgHUuX97nQCVerRMaXFXUkizauEk9UN9Z8x8u3ZJ7FIXaqg5DH7g5w3DG9anH8qJ8R
X-Received: by 2002:a05:6214:5585:b0:65a:f55e:5a77 with SMTP id mi5-20020a056214558500b0065af55e5a77mr28763982qvb.34.1697224217769;
        Fri, 13 Oct 2023 12:10:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697224217; cv=none;
        d=google.com; s=arc-20160816;
        b=H+Ha5uYXFwyd1i3XZuzAwP9A+FDZeQY2423qKH6QNMfCVTtSSlgowvyt3tAQm6bayL
         HHLbkKBJY4LojO+OvaejzO7dpurrXENDE4NkI3zz/7W6aj0l86Yd/DZAgKdQTS+oLBRY
         4HKXk580+WdfulLwc8DBRdh7MRbMwnJhVQs2kj+SnVPv8UvFq1LAGUcDs7qiHpeYn1Aq
         BaaGQtn/0ji8ovge1/ohOuij9jiFS/whEXfcesQi8tb204Dwp8yBBWeVOOshm3wKDxlU
         9twXRaqeSIuKG6iQc5FszUB8s4Gj9boBuCaMhhZY3Qx8B9p4ve4tF8z0uTRXLpxzDmKo
         31AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1+ZZC3bykVxdgOH9/pQEMomsenatIinVGwwEBZIBiPg=;
        fh=D6q9Zl84lh9f35IkUo72nHtoK2p7pHS0kVOpFtZg6qI=;
        b=aPe87Ch7q/Sj3KUXdyLiXQ+goVtLBNlm43IMVANykkXix5R2Ktwaxtur1MEujaXlCd
         uHzslogfOnGfAfxXhEjVrNQrMIZdlb7Y+h8zJAqFnRr8Ko/zm9aEVykrEAYH3yetEOv+
         U+QEgHdvxCsCK/z139lUCfd5QLkNCCgxyrIe5GesrnNvLZh69MP1uIqVN0tHWNC5lBzk
         Yr+m2qcWeF4fo5wbVzfzJ2SSR+4lqVVhtLpO4Fl+IU2i8gMb2b+YsjFZT8tafYd1o8Bs
         tUzoGjCk9Tj9Z59VM8CKQ1HRg8ZYsJ/kpABX+Jl6iWJDPTe218H/OgijeEkmK+HYDVXt
         z18g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=efCDafbm;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id q7-20020a0cfa07000000b0064188f9b3d0si1661144qvn.188.2023.10.13.12.10.17
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 12:10:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=efCDafbm;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697224217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1+ZZC3bykVxdgOH9/pQEMomsenatIinVGwwEBZIBiPg=;
	b=efCDafbmdiu5uV+O/+emUl1/u1ndSfgkBxQoawpgjKKlnRSAB3XYuV9iO4zOnXqjO5BxPN
	wlp69+BHtHU6ytEhNOBiRerBrZpg8BejFUlq+1p3v0onIGp/DcWFOWThT8jETJdQK9go1+
	3wdZINpSt559VbuuEqn2PTKm1FOG5aA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-DJNftSlSMzu147xcnQjrFA-1; Fri, 13 Oct 2023 15:10:14 -0400
X-MC-Unique: DJNftSlSMzu147xcnQjrFA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39424805BC3;
	Fri, 13 Oct 2023 19:10:13 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC16040C6CA0;
	Fri, 13 Oct 2023 19:10:11 +0000 (UTC)
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
Subject: [PULL 23/25] tests/vm/basevm.py: use cmd() instead of qmp()
Date: Fri, 13 Oct 2023 15:09:38 -0400
Message-ID: <20231013190941.3699288-24-jsnow@redhat.com>
In-Reply-To: <20231013190941.3699288-1-jsnow@redhat.com>
References: <20231013190941.3699288-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-TUID: NNgukyO/40WR

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

We don't expect failure here and need 'result' object. cmd() is better
in this case.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20231006154125.1068348-14-vsementsov@yandex-team.ru
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/vm/basevm.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index a97e23b0ce..8aef4cff96 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -312,8 +312,8 @@ def boot(self, img, extra_args=[]):
         self._guest = guest
         # Init console so we can start consuming the chars.
         self.console_init()
-        usernet_info = guest.qmp("human-monitor-command",
-                                 command_line="info usernet").get("return")
+        usernet_info = guest.cmd("human-monitor-command",
+                                 command_line="info usernet")
         self.ssh_port = get_info_usernet_hostfwd_port(usernet_info)
         if not self.ssh_port:
             raise Exception("Cannot find ssh port from 'info usernet':\n%s" % \
-- 
2.41.0
