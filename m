Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1722536ejc;
        Fri, 13 Oct 2023 12:10:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmUC2MdeXmKluoi8jblirZL6oAJNAzkRYJaQ7TPT3isbSxrMoahId7+yLi1PHZ6Enz82GQ
X-Received: by 2002:a1f:4b83:0:b0:49e:1be5:de9b with SMTP id y125-20020a1f4b83000000b0049e1be5de9bmr16799157vka.5.1697224202649;
        Fri, 13 Oct 2023 12:10:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697224202; cv=none;
        d=google.com; s=arc-20160816;
        b=Xj4esNYUI4NNAKDbszYxz98yj3vEvKRE7q27Jc6KPcvg7h+SAdKiQbMMyHVVwvytGO
         VGMDRjJRTDRSa+2098kH/Tcw6Z2CK3+9586uW+IwWtPQ9Qo7TNY3VlmVdM5elsUuIm6x
         EmQYk2lYOpAn4TSP7WYLOZiXipUuynoRdKEU2G/npluuU3mroPQhSbCx3eBShguHpCLy
         J374urgevNItbdRvnyFChAqva/12+pjl5GUz5h5TfzU/2rZ+mnAnqiMsAtVVzZE5GTiO
         qRHEvxmHAQtfG+V079gY3VrMvDECtYzvUHMQE/D1o1JQ33f0b+FlDZ9dp4LdIGUvSeU0
         IqCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=S55iOiMBHLn7mCEBQzBqeCldmVsvG97z++Q+ZUFBvvA=;
        fh=D6q9Zl84lh9f35IkUo72nHtoK2p7pHS0kVOpFtZg6qI=;
        b=ohjaRTeUX1MV2Y/98lTfQnXa9QkueJDXsCZsL4jV32nCDDRfdSBduD/yYxdGBJDv1k
         cPmdxsxenB0xcz3ULEar3sc+BDhdTBiasx2Bxii5Lfb9zMTxtgNqvCLIqkfZ5/cICH2W
         Rw73KMyjfwqrjwjmuqPbnCCzfCRXP87oKIWLEm3nbUQP4Nn6uD9Xinaq03lvVhDq3dxN
         oZU3oezj4VsmObvQpSn7yrRaz0DdoL2nIlhcNLLBruQ9SyUU2Y1cs+a46RqeIhZVe69m
         HQAT+pMpyRBe9xTOkZ8//DRk6VHFzvdkefFOQaCarThsz5yE+JEx+M5APsW5UAYUFI8L
         A3rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="LWx/4k1T";
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id a6-20020a05622a064600b00417cf21cf2esi1707634qtb.676.2023.10.13.12.10.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 12:10:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="LWx/4k1T";
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697224202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S55iOiMBHLn7mCEBQzBqeCldmVsvG97z++Q+ZUFBvvA=;
	b=LWx/4k1T2vsx7Jqk8LE6VOgOavGSoUq/6pekGvJmwyVzhamCiKuOWjMrtQVjm5uHDoTBZ0
	m0Dz0yrGqqdbTK9xDHnjlD/jrHv4ENrG5jeLKtE1giEcj+6eGx9PZ/kBMN398xDrH4BTVd
	lzgwDyewvlRbT7Shezg7sWoCnW7VgDs=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-PEWdQaN_ODmPQDXEChByeg-1; Fri, 13 Oct 2023 15:09:58 -0400
X-MC-Unique: PEWdQaN_ODmPQDXEChByeg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C3CE3C17128;
	Fri, 13 Oct 2023 19:09:56 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 240B940C6CA0;
	Fri, 13 Oct 2023 19:09:55 +0000 (UTC)
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
Subject: [PULL 10/25] Python: Enable python3.12 support
Date: Fri, 13 Oct 2023 15:09:25 -0400
Message-ID: <20231013190941.3699288-11-jsnow@redhat.com>
In-Reply-To: <20231013190941.3699288-1-jsnow@redhat.com>
References: <20231013190941.3699288-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-TUID: 43isDV5A/bGC

Python 3.12 has released, so update the test infrastructure to test
against this version. Update the configure script to look for it when an
explicit Python interpreter isn't chosen.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-id: 20231006195243.3131140-5-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 configure                              | 3 ++-
 python/setup.cfg                       | 3 ++-
 tests/docker/dockerfiles/python.docker | 6 +++++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index a49fc7b7e7..96d0dd5ffc 100755
--- a/configure
+++ b/configure
@@ -562,7 +562,8 @@ first_python=
 if test -z "${PYTHON}"; then
     # A bare 'python' is traditionally python 2.x, but some distros
     # have it as python 3.x, so check in both places.
-    for binary in python3 python python3.11 python3.10 python3.9 python3.8; do
+    for binary in python3 python python3.12 python3.11 \
+                          python3.10 python3.9 python3.8; do
         if has "$binary"; then
             python=$(command -v "$binary")
             if check_py_version "$python"; then
diff --git a/python/setup.cfg b/python/setup.cfg
index 8c67dce457..48668609d3 100644
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
index 383ccbdc3a..a3c1321190 100644
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
