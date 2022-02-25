Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp2063160lfq;
        Fri, 25 Feb 2022 13:03:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzp0TOnt37ppukpUaJsIJdbZI8TESJfTwPCAjRLAZOckYaVUepCJSpMcCCXogiUrDJWAWX1
X-Received: by 2002:ac8:7c4b:0:b0:2d1:bff6:e9ef with SMTP id o11-20020ac87c4b000000b002d1bff6e9efmr8662466qtv.22.1645822990296;
        Fri, 25 Feb 2022 13:03:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645822990; cv=none;
        d=google.com; s=arc-20160816;
        b=lS5Qe2/S+9gCOYD+lwCO/zgcidTk4eiMIID29cchoDLpvbIrJ0pWSHVErza3HJfryO
         3lKiieA/NFVaBrAkzA5kKUO+wEy0gvEyDt4OiQtCx4dGnGFWqKVxhf5nYyI0ETIbwLav
         846VyziPH30K54D8DG0qsy393ckxMSPh/dyHOzAFbNdAzgN8VroqvmocoyPUAv2MVVDm
         /1AU7RBLewTt5Uw961gmRzym2nOZEFQ2n/Z7Fz5Y6E41Vz9xtufSExEQ1FlLvMC3sRGY
         qKBPI3/Ru9qV3O91g5V+LCtK4rx39Or52OGx9CTgU2RRUKoAJDWP2jBz9kqvq46WNAK3
         OpAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=f1B/ExmGCc3kNjbey2HtHUXNy2IapyW5A0JVDq6/Ncg=;
        b=C3eanq6CJGLJ5if9EUaWLAQrJY9WUMYp6Gq1Wmv0hCxISx7uTjDjizzgm7/sVxn6WT
         5RxbhsG4fN9ZDrwDE9B5WKquQ++6rJN4VwmJvtnWjuk5SwcW7XuUhNBL2eHS2pBnXWsl
         sL2KqNjO2accfWaLcONAaNS1yXaJSUn9fimHmP6vUAe5ZE49T72IAHK7luK8+3Gljrjg
         L8o6Y9jj3q7G+YvIgX4bxa44aHyGIHU8wvOsefB3t6UXneciJmgvI9rIgW0fSahRGD85
         Oh4sPltqB7+bccoFlGehA3o/9lAVtUH/KZg5MmDjuw6VY1Xjih32b9VXn7rHQZgJblxX
         UjFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MgbfbvYK;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id p5-20020a05621421e500b00432670e6f3bsi1718566qvj.412.2022.02.25.13.03.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Feb 2022 13:03:10 -0800 (PST)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MgbfbvYK;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645822989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f1B/ExmGCc3kNjbey2HtHUXNy2IapyW5A0JVDq6/Ncg=;
	b=MgbfbvYKbVdaKoI/QbiW6MHGiHfVHmtT6Ei9mzqptoToLH3WZydmpo7kcQmB4aWrW15yaZ
	Jv59bzl6TEGpxmfAJoBh0SKDUORMD5w+2td8+nNw36G50i/XY4LKKPIUGzXZmYc3mLYfhc
	SLvTihUGfNm8uGCE9t5TiizefSJDTdE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-9IINanKgObSAFai1K7GrWg-1; Fri, 25 Feb 2022 16:03:08 -0500
X-MC-Unique: 9IINanKgObSAFai1K7GrWg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0603D801AAD;
	Fri, 25 Feb 2022 21:03:05 +0000 (UTC)
Received: from p50.localhost.localdomain.com (unknown [10.22.16.50])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C9592ED8A;
	Fri, 25 Feb 2022 21:02:55 +0000 (UTC)
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
Subject: [PATCH 1/9] Avocado GitLab CI jobs: don't reset TARGETS and simplify commands
Date: Fri, 25 Feb 2022 16:01:48 -0500
Message-Id: <20220225210156.2032055-2-crosa@redhat.com>
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
X-TUID: 3lqdz7yh7JUL

The Avocado tests rely on the TARGETS variable, which is computed
based on the built targets.  The current set of commands on the
inherited scripts section will reset those, leaving TARGETS empty and
consequently the AVOCADO_CMDLINE_TAGS empty too.

This is causing the list of tests to have no filtering by tags, which
can be seen by the large number of CANCEL/SKIP statuses (because of
the lack of a matching qemu-system-$(ARCH) binary).

With this change, the TARGETS variable is properly computed, and so is
the AVOCADO_CMDLINE_TAGS.  This causes a reduction in the number of
tests attempted to be run on each job, and less noise on the test
results.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 .gitlab-ci.d/buildtest-template.yml | 3 +++
 .gitlab-ci.d/buildtest.yml          | 9 ---------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index 2c7980a4f6..c038a0910f 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -64,6 +64,9 @@
         du -chs ${CI_PROJECT_DIR}/avocado-cache ;
       fi
     - export AVOCADO_ALLOW_UNTRUSTED_CODE=1
+  script:
+    - cd build
+    - make check-avocado
   after_script:
     - cd build
     - du -chs ${CI_PROJECT_DIR}/avocado-cache
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 0aa70213fb..d0bed9c382 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -33,7 +33,6 @@ avocado-system-alpine:
       artifacts: true
   variables:
     IMAGE: alpine
-    MAKE_CHECK_ARGS: check-avocado
 
 build-system-ubuntu:
   extends: .native_build_job_template
@@ -66,7 +65,6 @@ avocado-system-ubuntu:
       artifacts: true
   variables:
     IMAGE: ubuntu2004
-    MAKE_CHECK_ARGS: check-avocado
 
 build-system-debian:
   extends: .native_build_job_template
@@ -98,7 +96,6 @@ avocado-system-debian:
       artifacts: true
   variables:
     IMAGE: debian-amd64
-    MAKE_CHECK_ARGS: check-avocado
 
 crash-test-debian:
   extends: .native_test_job_template
@@ -143,7 +140,6 @@ avocado-system-fedora:
       artifacts: true
   variables:
     IMAGE: fedora
-    MAKE_CHECK_ARGS: check-avocado
 
 crash-test-fedora:
   extends: .native_test_job_template
@@ -189,7 +185,6 @@ avocado-system-centos:
       artifacts: true
   variables:
     IMAGE: centos8
-    MAKE_CHECK_ARGS: check-avocado
 
 build-system-opensuse:
   extends: .native_build_job_template
@@ -221,7 +216,6 @@ avocado-system-opensuse:
       artifacts: true
   variables:
     IMAGE: opensuse-leap
-    MAKE_CHECK_ARGS: check-avocado
 
 
 # This jobs explicitly disable TCG (--disable-tcg), KVM is detected by
@@ -382,7 +376,6 @@ avocado-cfi-aarch64:
       artifacts: true
   variables:
     IMAGE: fedora
-    MAKE_CHECK_ARGS: check-avocado
 
 build-cfi-ppc64-s390x:
   extends: .native_build_job_template
@@ -424,7 +417,6 @@ avocado-cfi-ppc64-s390x:
       artifacts: true
   variables:
     IMAGE: fedora
-    MAKE_CHECK_ARGS: check-avocado
 
 build-cfi-x86_64:
   extends: .native_build_job_template
@@ -460,7 +452,6 @@ avocado-cfi-x86_64:
       artifacts: true
   variables:
     IMAGE: fedora
-    MAKE_CHECK_ARGS: check-avocado
 
 tsan-build:
   extends: .native_build_job_template
-- 
2.35.1
