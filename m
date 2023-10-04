Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2891730ejb;
        Wed, 4 Oct 2023 12:46:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGybAaJYgtsICCX4wUedSLrAX0PEO2Zfum7xSju6ThFyI59W42bxYPqDGtIQs1081GmgRpw
X-Received: by 2002:a05:620a:2089:b0:76e:8403:8b2 with SMTP id e9-20020a05620a208900b0076e840308b2mr3149855qka.42.1696448790790;
        Wed, 04 Oct 2023 12:46:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696448790; cv=none;
        d=google.com; s=arc-20160816;
        b=vX8nzZeqSqilmg5SXJ/CVL+OhIAPeGHVtc30nOgMka69ptPo9NR8MYfrVacX4QGYA8
         SOS9IwN0Do2SM3UywzAZcKUYzifw/B8HLvOgxZpwrsaelLCEkLEgyYUGfiWro20h7vPl
         OiQTCY5m+AkOnsptgg6hYOjpvtSG1lfEn0kqPfawEfO4RFHp8IaKh8xsTTdTPXYOuq/3
         X/EsPuamGb1i9HSRltMAzYGXDy68RJL8wJiur+MVLu0FhQ3bT4Uq8RRerRlhPUya2eZ6
         q4IyTO7vYx3hhE3PwBdQ+7UpN/QyEmssmTPRbE3Tun1ntWT+JRKOr8V3JWqquCbva9YV
         v2iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Abfte2QvhByUnYhfpgXu9SAU3k87KQBC8t41fRUboEQ=;
        fh=T+SSTeAxrZ+7RtL9oY8pymA8+lHV6k3OjFi4ur0eRDs=;
        b=LLsa3/6o80Hh2YZjPg92Wscxj87gBJ8Eny2mfodUPlzR4/tMVt21UkT8rX38MgXqYh
         glMHwxlpwGYSlSlP3dmqUjCr7w3gBV1QyYrFCIUTxsf5aNmUWXFamu69YBdx5mCZzOAL
         7bSgXawg7Ha5hdTvUjhyEawCTh0UUn4+igiENe6GayNDMeHNekPOEy2LgAVuA1bJJ4z7
         QjM+fxyIpM/VKRKO1Hz+wCyE6Qb3ZqGQkrNk5jY7q37alOxitEbU3pTJjdNxSl2zod8O
         iCUoHP7HWFTtkqSS7GhtZzXyqG5atwYBBpUcLP8g0/d6jmgf2Le1+d4p4uyjQC78cQ9Z
         vyVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q0m6k8XB;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id pb7-20020a05620a838700b00768046bd0f6si1755064qkn.381.2023.10.04.12.46.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 12:46:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q0m6k8XB;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696448790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Abfte2QvhByUnYhfpgXu9SAU3k87KQBC8t41fRUboEQ=;
	b=Q0m6k8XBq8hZ4Yt+kXGftFnBHIYYotDEyYxLeVQezoBcrbqgVOQPMDJzF5AE2mcBNzHBUI
	7UFJRo1PiL4xGf8sRcKufYljfK/w14GcgZAwIUZ6Kguezv7wEmdecmintVZ8cDTA3A+WXy
	yG0DQydsRUkJXsU1g6ZYsm1Eto78YjQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-155-WByInjy9PTCHW3JQOUiCHQ-1; Wed, 04 Oct 2023 15:46:25 -0400
X-MC-Unique: WByInjy9PTCHW3JQOUiCHQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6202F2932495;
	Wed,  4 Oct 2023 19:46:24 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 818451054FC3;
	Wed,  4 Oct 2023 19:46:23 +0000 (UTC)
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
Subject: [PULL 9/9] Python: test Python 3.12
Date: Wed,  4 Oct 2023 15:46:13 -0400
Message-ID: <20231004194613.2900323-10-jsnow@redhat.com>
In-Reply-To: <20231004194613.2900323-1-jsnow@redhat.com>
References: <20231004194613.2900323-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-TUID: oEufjDmgBGAV

Python 3.12 has released, so update the test infrastructure to test
against this version.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/setup.cfg                       | 3 ++-
 tests/docker/dockerfiles/python.docker | 6 +++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/python/setup.cfg b/python/setup.cfg
index 8c67dce4579..48668609d3e 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -18,6 +18,7 @@ classifiers =
     Programming Language :: Python :: 3.9
     Programming Language :: Python :: 3.10
     Programming Language :: Python :: 3.11
+    Programming Language :: Python :: 3.12
     Typing :: Typed
 
 [options]
@@ -182,7 +183,7 @@ multi_line_output=3
 # of python available on your system to run this test.
 
 [tox:tox]
-envlist = py38, py39, py310, py311
+envlist = py38, py39, py310, py311, py312
 skip_missing_interpreters = true
 
 [testenv]
diff --git a/tests/docker/dockerfiles/python.docker b/tests/docker/dockerfiles/python.docker
index 383ccbdc3a5..a3c1321190c 100644
--- a/tests/docker/dockerfiles/python.docker
+++ b/tests/docker/dockerfiles/python.docker
@@ -11,7 +11,11 @@ ENV PACKAGES \
     python3-pip \
     python3-tox \
     python3-virtualenv \
-    python3.10
+    python3.10 \
+    python3.11 \
+    python3.12 \
+    python3.8 \
+    python3.9
 
 RUN dnf install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
-- 
2.41.0
