Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1722620ejc;
        Fri, 13 Oct 2023 12:10:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcPQtZkeOQCc2h3Y06UmII8wDR7nrGyjcKuj5pY578gHyOoJmnFkQ4Dlpu7pP5eRg1TCNc
X-Received: by 2002:a05:6808:1b14:b0:3a8:3d5b:aad6 with SMTP id bx20-20020a0568081b1400b003a83d5baad6mr35199841oib.55.1697224212104;
        Fri, 13 Oct 2023 12:10:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697224212; cv=none;
        d=google.com; s=arc-20160816;
        b=YE61tOE10M1Dvo4yYtNs3mV642TwCUl7rCN/r5hmqo1PCXj9LrEJW+j2Xba9BNm8rc
         Vdglf8so+9rtVmEuOM3Tjcc50n130hLQmZh2eG/o+09rChrbbRseQnwqPWnMI1TUdrVF
         /mbh9F1vpKfowSYO/2ixwYdjv8z8a/SjLM/eLtZlHv2A47L7KeZUyGnhNVDIPlk0BGtk
         dwF70VrynWmAa1yhsohCI3wmHS3wIhuDhZVvI0CnDLTjqM6fyNYOq8JzjxyITtf+iJPG
         g2ccfDeVPmhM+UcQcToOgHavHl/+tUXAoh7TupeSkLdqZC84def0KoAo+OLLmHCeQ9Ti
         u/oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=uuDhxM4tw3ZrDHOQvof7Nf1mZEUGdYjBg+ik6qdLhOo=;
        fh=D6q9Zl84lh9f35IkUo72nHtoK2p7pHS0kVOpFtZg6qI=;
        b=UzSECw2VMIJoi+o++v76GI9upflprRNTC9CLpeHAtADFeamkpjYPLmItJnxj2U2Ihl
         tfmfZq6/y9pMJMpSnlfZ6hVugk8/jG39k6Hh83ijfjZpIYMCaUIxlLvYw8lTqV9IJUPa
         zqGWYgpWfy9HchzGvXVAf0mrd6x1EzhYaRwwXumS/i0HR/oUziVxv27HAb7DT9SY6JB7
         5bEuiTESiUY1QhxNlmwCxUw1ZureC12SVxHYDxgPtLOPzf5XSXXd6PCzDM2B2p9C0E0i
         Vn3FlmrV98/D1AhfuL7YS0d1PIFlnN0MSei5eAgG0w6Wego/66fSiFqVerqIKdHaJgqO
         K6iQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KvuOnOdG;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id az13-20020a05620a170d00b0077429d89227si1729209qkb.375.2023.10.13.12.10.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 12:10:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KvuOnOdG;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697224211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uuDhxM4tw3ZrDHOQvof7Nf1mZEUGdYjBg+ik6qdLhOo=;
	b=KvuOnOdGitX3WZDynr4r5UwU4jGgZRpoqKB0xP8Pn3GqHXw5ee4ym0ikTJSCckXXta5lxG
	s0zHJa8vu2b2u8EYGeFWjRkyvmx3pa3G8OMi0c3kqat5z/EM6gwfkyhv8/DSSs+M888mko
	4M4HdbDs0XrO4AMp+scFt2Kw2Tsb1tQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551--GPUsllrMQu8pBWWL4nzeg-1; Fri, 13 Oct 2023 15:10:05 -0400
X-MC-Unique: -GPUsllrMQu8pBWWL4nzeg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 462D53813BE0;
	Fri, 13 Oct 2023 19:10:04 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0F2CB40C6CA0;
	Fri, 13 Oct 2023 19:10:03 +0000 (UTC)
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
Subject: [PULL 16/25] python/machine.py: upgrade vm.cmd() method
Date: Fri, 13 Oct 2023 15:09:31 -0400
Message-ID: <20231013190941.3699288-17-jsnow@redhat.com>
In-Reply-To: <20231013190941.3699288-1-jsnow@redhat.com>
References: <20231013190941.3699288-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-TUID: PssU71NiPwHL

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

The method is not popular in iotests, we prefer use vm.qmp() and then
check success by hand. But that's not optimal. To simplify movement to
vm.cmd() let's support same interface improvements like in vm.qmp().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20231006154125.1068348-7-vsementsov@yandex-team.ru
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index eae193eb00..31cb9d617d 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -708,13 +708,23 @@ def qmp(self, cmd: str,
         return ret
 
     def cmd(self, cmd: str,
-            conv_keys: bool = True,
+            args_dict: Optional[Dict[str, object]] = None,
+            conv_keys: Optional[bool] = None,
             **args: Any) -> QMPReturnValue:
         """
         Invoke a QMP command.
         On success return the response dict.
         On failure raise an exception.
         """
+        if args_dict is not None:
+            assert not args
+            assert conv_keys is None
+            args = args_dict
+            conv_keys = False
+
+        if conv_keys is None:
+            conv_keys = True
+
         qmp_args = self._qmp_args(conv_keys, args)
         ret = self._qmp.cmd(cmd, **qmp_args)
         if cmd == 'quit':
-- 
2.41.0
