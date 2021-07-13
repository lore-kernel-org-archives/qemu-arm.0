Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp1027831qvs;
        Tue, 13 Jul 2021 14:22:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqbVxqgzxgOrmQyG1pVxiZW14yRph2lLl1IUiOCtBKFmDaJlskKlGWeFDHkpNZveGU9pFl
X-Received: by 2002:a17:906:af87:: with SMTP id mj7mr7979517ejb.397.1626211325951;
        Tue, 13 Jul 2021 14:22:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626211325; cv=none;
        d=google.com; s=arc-20160816;
        b=ptE2+Z2WBe90zGKsfxvVQ2hJP0zM/jYpMquCoczE8IFjf9ofdG9+vE3/P2dlavAqr/
         Pc5MwFx2m0cLR2Nza+zr8OxFexgs87RcS0o+ZoJxV3x+JixcWY09tw64SZLV5czBXXtt
         4xufufYUxk7ISTe+c6pxhWOdhAZ2ZKslW/e4jG00Acu/LhyrF+96xl1pT0ELqibgJWgq
         izHQrZVbttq44QxC70PwFFuBDUoKtxKc5PIbRNAygxHxVb0AxDwT0/Rfshags8t1bHhI
         q1ZNVoybo/hsUJi9H18GUZflBBmmHtg47LESEIPTIIPyTQlX2FaGBifRG6K1UbpuZ1iI
         t2CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8VEQG7uRmU1E/VwX2Tg7eiPcHjc2JykR0vK+XzqfOgY=;
        b=ZYzQPhzlswR3N1L8et5PfbqGDV/SUTSXzHRFzw3WXxoMmfqSVtdzcZhspkfYTFjwAs
         v4VT67qLXIleORNh3PKRWpOA1i9XzvHcDIr1vhSi0AtU/y61XlCIKZAa6Q8CfB6bNZeK
         RZ4nCKhpIiXgZzy8piNIsbF24VthaAuHGHkBBbOOyvRLeV+nrCL7EOHmNfCeqXeHg2wf
         AUFVFXmStr7QslQ7dYVVDxZ0nnRWXsdlfIhVgprzByJrRnTfg24PFY30xDvOmBR3rOnt
         WtT/bQVYdNGHE0vldM0i5CvdAruqX8ucjBTf62Kmdxc2NAtfpR5AQoIN93nbSMGiiLBC
         txBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kftn5TqX;
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id j5si21805498ejs.749.2021.07.13.14.22.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Jul 2021 14:22:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kftn5TqX;
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626211324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8VEQG7uRmU1E/VwX2Tg7eiPcHjc2JykR0vK+XzqfOgY=;
	b=Kftn5TqXHrGq06/Nqzic7Bn7mlfpnBFlm/Cn3X4Xd1twgEQVCDH5K+4Y6jj8lZouSAoMab
	bejGnYYLFY9DA0AbVYa+EZCx+45gP4mPffpoubGVKIr2f+DE+LJ9BExu1KYjdZvRl9w/BK
	LonbHt/2j4lbz9BxCmGDLyctgjnLTOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-ZnyprlTUMD6sFsIYQmTQYA-1; Tue, 13 Jul 2021 17:22:03 -0400
X-MC-Unique: ZnyprlTUMD6sFsIYQmTQYA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D63D3802C87;
	Tue, 13 Jul 2021 21:22:00 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7578E19C44;
	Tue, 13 Jul 2021 21:21:58 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Ryo ONODERA <ryoon@netbsd.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Willian Rampazzo <willianr@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	John Snow <jsnow@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Willian Rampazzo <wrampazz@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Beraldo Leal <bleal@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-ppc@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Thomas Huth <thuth@redhat.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Cleber Rosa <crosa@redhat.com>
Subject: [PULL 20/23] python: Configure tox to skip missing interpreters
Date: Tue, 13 Jul 2021 17:19:20 -0400
Message-Id: <20210713211923.3809241-21-crosa@redhat.com>
In-Reply-To: <20210713211923.3809241-1-crosa@redhat.com>
References: <20210713211923.3809241-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: JqgnPTqa3qMt

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

Currently tox tests against the installed interpreters, however if any
supported interpreter is absent then it will return fail. It seems not
reasonable to expect developers to have all supported interpreters
installed on their systems. Luckily tox can be configured to skip
missing interpreters.

This changed the tox setup so that missing interpreters are skipped by
default. On the CI, however, we still want to enforce it tests
against all supported. This way on CI the
--skip-missing-interpreters=false option is passed to tox.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210630184546.456582-1-wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 .gitlab-ci.d/static_checks.yml | 1 +
 python/Makefile                | 5 ++++-
 python/setup.cfg               | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
index b01f6ec231..96dbd9e310 100644
--- a/.gitlab-ci.d/static_checks.yml
+++ b/.gitlab-ci.d/static_checks.yml
@@ -43,6 +43,7 @@ check-python-tox:
     - make -C python check-tox
   variables:
     GIT_DEPTH: 1
+    QEMU_TOX_EXTRA_ARGS: --skip-missing-interpreters=false
   needs:
     job: python-container
   allow_failure: true
diff --git a/python/Makefile b/python/Makefile
index ac46ae33e7..fe27a3e12e 100644
--- a/python/Makefile
+++ b/python/Makefile
@@ -1,4 +1,5 @@
 QEMU_VENV_DIR=.dev-venv
+QEMU_TOX_EXTRA_ARGS ?=
 
 .PHONY: help
 help:
@@ -15,6 +16,8 @@ help:
 	@echo "    These tests use the newest dependencies."
 	@echo "    Requires: Python 3.6 - 3.10, and tox."
 	@echo "    Hint (Fedora): 'sudo dnf install python3-tox python3.10'"
+	@echo "    The variable QEMU_TOX_EXTRA_ARGS can be use to pass extra"
+	@echo "    arguments to tox".
 	@echo ""
 	@echo "make check-dev:"
 	@echo "    Run tests in a venv against your default python3 version."
@@ -87,7 +90,7 @@ check:
 
 .PHONY: check-tox
 check-tox:
-	@tox
+	@tox $(QEMU_TOX_EXTRA_ARGS)
 
 .PHONY: clean
 clean:
diff --git a/python/setup.cfg b/python/setup.cfg
index 11f71d5312..14bab90288 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -121,6 +121,7 @@ multi_line_output=3
 
 [tox:tox]
 envlist = py36, py37, py38, py39, py310
+skip_missing_interpreters = true
 
 [testenv]
 allowlist_externals = make
-- 
2.31.1
