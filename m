Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2891644ejb;
        Wed, 4 Oct 2023 12:46:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyojfmR4aijAAwE5fM86st/IXG48g9Q2RJtpuPl949Cr0mB6cCiNSbiqzE3N+dq0hiVg7U
X-Received: by 2002:a25:d152:0:b0:d81:a0c5:f274 with SMTP id i79-20020a25d152000000b00d81a0c5f274mr3190674ybg.48.1696448781419;
        Wed, 04 Oct 2023 12:46:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696448781; cv=none;
        d=google.com; s=arc-20160816;
        b=xQ/3G96eKTyTb4tTZBu+CWrDPl4tVjptFi56nnwLHkyY4H5c5/b30CVpieVxMOLwAU
         F+iY4AK4ipZLqz5NDQFMU7eyJWZ28vWne8OsDIgHxdJ/GSH+CUOYJpI+uv9WL5/ZwuBl
         RseB6OJ7HM1rUrxgMFwiJWSIyYxxouyrM7q7UqzLc5yqmDsJ2Q/4hy5N90KnyAlb6FRw
         vw73aRMaq/Yru9lB/+bJzroaY63CcHZ0g8NaDdscDSRD5Nzt5Vo7u5KJI86l+OkOhLbW
         OahuNDvpg3Z88QJ34zM/UYh96/2Rz772PWW1Xnpnw9uJOqG5WXtlCB1GMLhbZcSqq63Y
         Or6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=raq/k8U+cncgPegZd3oiql+A86isPBHe+RMtq6Gv31U=;
        fh=YYcUncbuZ8zA1+PNe3n/41UyzzQQmqdTXlaMDrLfUHg=;
        b=wxqukkMixa5IB2AmMYTqMQhqlxa254SCCSmqme8DEPfwqXIqqgfo5kbQLkY+Irq56I
         OkYddD+o1vj/GOtj+pyPpnpRnMzM71VDFEfYSVVaJMBuxDLWv8GrcS6o//CMi76IftET
         5+0w6d76VdKeVdgJAF9pTl09tBypG5tcCNlToDBHwMt0JktfXN18xOhM27nNtUi6dqH2
         +fTxmCsNXdqzUCOBJbD+9Qwjbgi6UAXJT+Ze2LW6T9Rc4OCTmQsIy1JgdMTwyzVY3/dS
         Jh7wMwFUd2m35dgkUToSmMWtO1FwIUhmaj3n5VVpDRjC860luxSALX2C2WuMBiaqlXJP
         uClw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L+YUIZqq;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id w1-20020a254901000000b00d7ba73a662asi2676482yba.622.2023.10.04.12.46.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 12:46:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L+YUIZqq;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696448780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=raq/k8U+cncgPegZd3oiql+A86isPBHe+RMtq6Gv31U=;
	b=L+YUIZqq/t6HI+OoDd/Rzil+I0edy10S9mo2ER26T7U8xuU7caXQI/sEQayt757SwT7DYE
	+1GKP3N1/wkb19dDzg/UxiDWULfISu4Vlr7z5cOilV7vODQk8oUFnS6snCM2U1NZQMp+nV
	fKdlqeGz4lJGx7v+FNc1k+FGU3DxLxU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-q-PJiirLMJ-5tivhjCvg0Q-1; Wed, 04 Oct 2023 15:46:19 -0400
X-MC-Unique: q-PJiirLMJ-5tivhjCvg0Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B52FB85A5BA;
	Wed,  4 Oct 2023 19:46:18 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BCFC31054FC1;
	Wed,  4 Oct 2023 19:46:17 +0000 (UTC)
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
Subject: [PULL 3/9] python/machine: close sock_pair in cleanup path
Date: Wed,  4 Oct 2023 15:46:07 -0400
Message-ID: <20231004194613.2900323-4-jsnow@redhat.com>
In-Reply-To: <20231004194613.2900323-1-jsnow@redhat.com>
References: <20231004194613.2900323-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-TUID: nlexthyx3Lbi

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
index 345610d6e46..e26109e6f0e 100644
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
