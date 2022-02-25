Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp2063520lfq;
        Fri, 25 Feb 2022 13:03:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIxoM6ZG0ElfzW8IzPX0jeBzGcV4OAQODa7ljnDxLshe6X7DdXcVnEd/nN770yFBfrLn5M
X-Received: by 2002:ad4:596e:0:b0:42c:33e4:e496 with SMTP id eq14-20020ad4596e000000b0042c33e4e496mr7388884qvb.35.1645823017168;
        Fri, 25 Feb 2022 13:03:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645823017; cv=none;
        d=google.com; s=arc-20160816;
        b=IXru40RGP0+0mQF2UVnu2jr0d3BKmxXO7elPtixH8lTuwDzdy7c7h7cgqjrG3rlrg+
         qkd229v1PonvrcEvpDrHbLWe45pa7gPKgB1BRUYx5xrH/pAOeQlstnWMDBuE0jtSgYkM
         1GQQ8o4tQD8zWEN6UuKnBBzNp9hu9J/kFW4LSR2r5AoUYs2DMLPOYqp2Jmcu/uwNyPJ4
         0iRfp23tiBJpRWu/3LhFlap+SSBS257/ZN4cJI7j6CfrU11xfpfY7ykHO0XxAIQRm6QP
         QCfGN1d/JH+/Q7MXjYybEQSnoutZyxKoOiuLjmhUmRw4GbBixgD7cTFcZmSVxTKcgu6v
         mHjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=pab33bVOuXSFeRJwLzNTvMzu0uHABihopxaPUGjTWBg=;
        b=fzncxRQZlP3AIK3IklvZDn1Qwx13tCq1RvLVclV/+++vRQz9EfD1eSKaJQ9I3KOklp
         drlTDTkQlgMCIoOITTkF/5jZWjJmxHCbE6iyuVyj5uihRe7Ab27wRkm/mPdJP4EhGHnQ
         u2hZWuSz2tAfSRDdWkgIosSixPUMobpkIlXVaw8KM6OKJ083Ezl0UGzyN0ttY59PLjC/
         CbYcc1SO+PjjZa6jBi//G+lro6NDylv2eX7tLQZEiGP2B60BIO3O17IBe4iV7rZ4bqjH
         Uw2fqkKB0c9/s+Bja17RTPVaFFPvoJzIujQzl08nZBu/pNPvyOoZkjV7BI0ZHr5y9olP
         mKuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HOp0QtKR;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 23-20020ac856f7000000b002deb28d4cf9si2012803qtu.257.2022.02.25.13.03.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Feb 2022 13:03:37 -0800 (PST)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HOp0QtKR;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645823016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pab33bVOuXSFeRJwLzNTvMzu0uHABihopxaPUGjTWBg=;
	b=HOp0QtKRZaUFOdGy9nZYv39gJx9fEbCO+yz2rVUhVjKNu1+Cw5XePCXNcSCvfaLHqkSrgg
	nYGA5iqE/cOxTTcfMrREas0iHhieBpLN0FuXni81uNYQm2L+vIEuPSG9rU+zxRzjE2Wu9/
	Y+Op0u5euGaHKOfycKv9Gm8w7gXlIUI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-Fp9uRNVmN1adrKrF6jR4Pw-1; Fri, 25 Feb 2022 16:03:34 -0500
X-MC-Unique: Fp9uRNVmN1adrKrF6jR4Pw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B56AB1006AA5;
	Fri, 25 Feb 2022 21:03:30 +0000 (UTC)
Received: from p50.localhost.localdomain.com (unknown [10.22.16.50])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F8702ED79;
	Fri, 25 Feb 2022 21:03:15 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	Fabien Chouteau <chouteau@adacore.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Greg Kurz <groug@kaod.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	David Gibson <david@gibson.dropbear.id.au>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	qemu-s390x@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Eric Farman <farman@linux.ibm.com>
Subject: [PATCH 4/9] Avocado: bump to version 95.0
Date: Fri, 25 Feb 2022 16:01:51 -0500
Message-Id: <20220225210156.2032055-5-crosa@redhat.com>
In-Reply-To: <20220225210156.2032055-1-crosa@redhat.com>
References: <20220225210156.2032055-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: f1SoDkkOaA3H

Even though there have been a number of improvements (and some pretty
deep internal changes) since Avocado 88.1, only one change should
affect "make check-avocado".

With the nrunner architecture, test execution happens in parallel by
default.  But, tests may fail due to insufficient timeouts or similar
reasons when run under systems with limited or shared resources.  To
avoid breakages, especially on CI, let's keep the serial execution
until proven that it won't impact the CI jobs.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/Makefile.include | 1 +
 tests/requirements.txt | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index e7153c8e91..676aa0d944 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -135,6 +135,7 @@ check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
             $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
 			--filter-by-tags-include-empty-key) \
             $(AVOCADO_CMDLINE_TAGS) \
+            --nrunner-max-parallel-tasks=1 \
             $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
             "AVOCADO", "tests/avocado")
 
diff --git a/tests/requirements.txt b/tests/requirements.txt
index a21b59b443..49aa0fd6f6 100644
--- a/tests/requirements.txt
+++ b/tests/requirements.txt
@@ -1,5 +1,5 @@
 # Add Python module requirements, one per line, to be installed
 # in the tests/venv Python virtual environment. For more info,
 # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
-avocado-framework==88.1
+avocado-framework==95.0
 pycdlib==1.11.0
-- 
2.35.1
