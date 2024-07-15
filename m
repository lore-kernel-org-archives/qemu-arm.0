Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2391807nji;
        Mon, 15 Jul 2024 10:33:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVU1b7+NMMUp2jOcJLq4XxBN6Yf6ft1cCtunnrEP7kQ9m0lyM1yei/xjKJZcvjkJ0i/DkSBjpNakv8bMHkxiCDOggAEpza4
X-Google-Smtp-Source: AGHT+IHWMgLPrOlDns3xiJo3o0BdMblbuQGehhXGXnESmhqipjDqIEIJpTKGwbWg19KM5AUk0UVo
X-Received: by 2002:a81:8412:0:b0:65f:77c3:63a0 with SMTP id 00721157ae682-66353ec88edmr2145107b3.7.1721064811103;
        Mon, 15 Jul 2024 10:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721064811; cv=none;
        d=google.com; s=arc-20160816;
        b=BTsOWm4rwQL3jrSBjGcBLnWvAZ1HbxxNWhL+tzeyBIdz6F6B5on+oODDKzChe223AK
         ylWntWqoUL1U0NqJfsQJofs/PN2SjTcn/Imt4dUwPgVhAENRqZtWEmzK68rD8nLoJTnw
         iuq/x43h0li1LYrCQQUZ4fbKK1EGiisrHRprezb7y1Ks9jKCn3OZxI97LoOilAVoN9xq
         HP178xEqrXm846l8kIhQFcnaE6Ztbh3d1SDNKX8NqShvVYZqJY8YxRquwUssaym9VchC
         mlIzSDqWd1V+iFg9X/HS9AG5+Jo3KGtnRV1xYxyZOyb47ZC0n3WmmIC9RGtSgvWrd28h
         mwFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=84gULfID2dmN3qMFmM1QQba22rzLGpbtfxJ8osV+b80=;
        fh=Vh4aLTjuyylyycFlCkrZ7Ouz37ZrS6wbH/qgUthxXT8=;
        b=cHgmb6JO/bCEofzztGm1lcHwx1eGSUdUx+4q+TYHraC+yJoPsd/CxbwNtG8x11JoPj
         9nw6tncqwY+1FW6tMka/u78HWpYI6HfCUkfbbBgeu1q9w+JLWBmviIDRnMReJ6c25cJ2
         k2AZuF0UIroltQGBb4gOrV24RLbRkrxFPEP1I4nyqhQ5239H05oCzw3xgOlvoRlMFAU+
         mA0gPi3Ti3Jhzdg9tENCvz+3ZpkKyK+YShEmqi+5bMF2nDMWbBRNYqIng50BWp09AvtN
         7A0uN8htHp2uVok3mhTT0mInTBTsyXXcwztKNCTaWVNGNpfoIJIOUpxeNMQbanoLOR/V
         K9EQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iOJjg1sK;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b819f6bsi57432481cf.563.2024.07.15.10.33.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 10:33:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iOJjg1sK;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721064810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=84gULfID2dmN3qMFmM1QQba22rzLGpbtfxJ8osV+b80=;
	b=iOJjg1sKRGBXF0xWO5dbwBZqWh5Ey5Bn86t8cqxgVI3Gy0D0pM6b0gP0/e3NT/9c2Itjcp
	cJkm5Ror3waGBXbYdTxFgnUUkDoZNmGWCWZajVqDgOLqP8Ufql2iMEL50nO1E+NslHOlGL
	0TGG7IDTnVr8CTsmv1Phu9bScCU2ONE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-135-nZzUBtQmMiWEGsRIW5k4Wg-1; Mon,
 15 Jul 2024 13:33:22 -0400
X-MC-Unique: nZzUBtQmMiWEGsRIW5k4Wg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 173061955D60;
	Mon, 15 Jul 2024 17:33:18 +0000 (UTC)
Received: from scv.localdomain (unknown [10.22.65.127])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7CEE01955D42;
	Mon, 15 Jul 2024 17:33:12 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Leonardo Bras <leobras@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
	Cleber Rosa <crosa@redhat.com>,
	qemu-arm@nongnu.org,
	Fabiano Rosas <farosas@suse.de>,
	Hanna Reitz <hreitz@redhat.com>,
	qemu-s390x@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Michael Roth <michael.roth@amd.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Andrew Jeffery <andrew@aj.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Xu <peterx@redhat.com>
Subject: [PULL 4/6] python: enable testing for 3.13
Date: Mon, 15 Jul 2024 13:32:39 -0400
Message-ID: <20240715173241.572048-5-jsnow@redhat.com>
In-Reply-To: <20240715173241.572048-1-jsnow@redhat.com>
References: <20240715173241.572048-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: pmKyuHpzjZE4

Python 3.13 is in beta and Fedora 41 is preparing to make it the default
system interpreter; enable testing for it.

(In the event problems develop prior to release, it should only impact
the check-python-tox job, which is not run by default and is allowed to
fail.)

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20240626232230.408004-5-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/setup.cfg                       | 3 ++-
 tests/docker/dockerfiles/python.docker | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/python/setup.cfg b/python/setup.cfg
index 8ebd345d7ed..3b4e2cc5501 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -19,6 +19,7 @@ classifiers =
     Programming Language :: Python :: 3.10
     Programming Language :: Python :: 3.11
     Programming Language :: Python :: 3.12
+    Programming Language :: Python :: 3.13
     Typing :: Typed
 
 [options]
@@ -184,7 +185,7 @@ multi_line_output=3
 # of python available on your system to run this test.
 
 [tox:tox]
-envlist = py38, py39, py310, py311, py312
+envlist = py38, py39, py310, py311, py312, py313
 skip_missing_interpreters = true
 
 [testenv]
diff --git a/tests/docker/dockerfiles/python.docker b/tests/docker/dockerfiles/python.docker
index a3c1321190c..8f0af9ef25f 100644
--- a/tests/docker/dockerfiles/python.docker
+++ b/tests/docker/dockerfiles/python.docker
@@ -14,6 +14,7 @@ ENV PACKAGES \
     python3.10 \
     python3.11 \
     python3.12 \
+    python3.13 \
     python3.8 \
     python3.9
 
-- 
2.45.0
