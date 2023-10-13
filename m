Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1722491ejc;
        Fri, 13 Oct 2023 12:09:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBfiZUMudC4gIVOiv4AFTY7/H8Pv3tkNRA5vb2biaNHKfL2iSRlNFeVIMBT9UZK2ABW6pC
X-Received: by 2002:a2e:98d6:0:b0:2bd:1000:431d with SMTP id s22-20020a2e98d6000000b002bd1000431dmr24902640ljj.10.1697224197463;
        Fri, 13 Oct 2023 12:09:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697224197; cv=none;
        d=google.com; s=arc-20160816;
        b=aN0+6i8XNFwgC5CXSwALccSWw52IqlEmT6hn8k3Ufvoay/Q225OlEY9Cqiqnch7q9e
         cBSdqiSr/E1c8i7G7sBR4JcVdjIvhtNvsrp1+bmR2DrVf7MHvNol54Tg/yp8cH8g321U
         TTIxAEA1YHHFSSdmXaVHSFGXMTHL0xr7RRNdtg/4FJcAnZg3nq7siiW3HJAF3QMXBxU3
         8Wl0kqm95zgyQhLqYwk5gIQ+ZrJO0nLHjqfTzeyMGWb3NCy3Qfq8Q+5ZXKhXgHj0b+Km
         ChXC7EhI3ycA6EhVAA4aSQBN4f4+Mvy4KMnZuC5q4mF+rwBQS/g6U4e/i+qJgWi1rqrt
         IDHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Sz519R7DOSzxGsZ6pnZE5PJ0mp6TylEz4erYoFJyd2U=;
        fh=OrnKDpMzEp7wbNAUpJYWlPb6BZBa4HxNRhsHT4snMn4=;
        b=D8/ikpp8nmmhkC78X6ipvwGjepEuTfOVp5npUmUj50BJaQD8y3eKQ3db8Jt1kLDsd+
         eKqaVYM0PlppSxHQml/1m1YAt4a/ywbiiua14i893veadlDiCsxKq+oZBZM+jzL3qqMJ
         oXpMOyjA+Gf1/OpUj0Scp2IGDEPtQKUdnjCMkUeimP6WwXKCS23S+y3FvYR9m0kmKPoS
         tRzTTWW31Z+5+0c1pKX9xTUv4X/TQ3cKkc8Lv7Qxbrrv+R4EuuvMoPwm4XHLOwzIXX8K
         o2LprpkDFkC9lydgEhNOM0PMuXihSN7+dhCoSN28UAUoIy6wmiksKSxsi7vLGiLpm7Ar
         9faw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JY2h36b1;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id l22-20020a2ea316000000b002c145e94ac2si13689896lje.466.2023.10.13.12.09.57
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 12:09:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JY2h36b1;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697224196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sz519R7DOSzxGsZ6pnZE5PJ0mp6TylEz4erYoFJyd2U=;
	b=JY2h36b13rFcx5KK1XK2sOKUiQ+4iGYntxObeAX7OmPDmupfCN8npwrvko18xPQAPvK08D
	IXgU7L8CQfT+hf3se3DK3q5WRZ60764vKk1X4LIIHedj09DT1zo/E6JJDI/cpRe0CoXYe2
	gl90hmUr+23UxW8suBREZ0Sh1u3o+Rg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-sknuVkFTPi-8HIxaNLuW-w-1; Fri, 13 Oct 2023 15:09:47 -0400
X-MC-Unique: sknuVkFTPi-8HIxaNLuW-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECD3D800B23;
	Fri, 13 Oct 2023 19:09:45 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B3D6340C6CA0;
	Fri, 13 Oct 2023 19:09:44 +0000 (UTC)
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
Subject: [PULL 02/25] python/machine: close sock_pair in cleanup path
Date: Fri, 13 Oct 2023 15:09:17 -0400
Message-ID: <20231013190941.3699288-3-jsnow@redhat.com>
In-Reply-To: <20231013190941.3699288-1-jsnow@redhat.com>
References: <20231013190941.3699288-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-TUID: SA+ikvtaDdNx

If everything has gone smoothly, we'll already have closed the socket we
gave to the child during post_launch. The other half of the pair that we
gave to the QMP connection should, likewise, be definitively closed by
now.

However, in the cleanup path, it's possible we've created the socketpair
but flubbed the launch and need to clean up resources. These resources
*would* be handled by the garbage collector, but that can happen at
unpredictable times. Nicer to just clean them up synchronously on the
exit path, here.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Ani Sinha <anisinha@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20230928044943.849073-3-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 345610d6e4..e26109e6f0 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -396,6 +396,11 @@ def _post_shutdown(self) -> None:
         finally:
             assert self._qmp_connection is None
 
+        if self._sock_pair:
+            self._sock_pair[0].close()
+            self._sock_pair[1].close()
+            self._sock_pair = None
+
         self._close_qemu_log_file()
 
         self._load_io_log()
-- 
2.41.0
