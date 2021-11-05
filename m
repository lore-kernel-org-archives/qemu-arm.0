Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2386798lfv;
        Fri, 5 Nov 2021 08:54:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzONtqx/MeyAkp3iUTwOGvrqMZm/8UfgDkoknwfBN33pDi4bMe+HuzdUTz7cDvJqrTyXfx4
X-Received: by 2002:a05:6402:10d2:: with SMTP id p18mr80203195edu.161.1636127657892;
        Fri, 05 Nov 2021 08:54:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1636127657; cv=none;
        d=google.com; s=arc-20160816;
        b=eunPnkLks38RFmPwrC+mGCrX7NdgnvbNN5aaHtR2YnI1EbmIRDryCQUDQvRH3eqqX6
         /wSb2Gyd48i8t4c8+FhP2LQMP91/B8ZLqyzbLSOJrSQ47qGyzVSQTJroBWfA4iYVbRLJ
         e2oyPgNTp5jzEc8rdoi9LjiFr63ieSAS4svFtX7ml9OVH8U3zWcrxo8W+v1p58b45az4
         ehunvLCQXNCpKyQ0JNxJpcEKrmlDPGVHVBAbEc6srBFcLWMHIcLhxdNJQSpwAGHak+eq
         RyB6yUCA9yi8MRO1TahKLucddz2vr1rJzJX13AoThfvn05zCzl8bdpEdiXGqzXCdQnXG
         uZaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YuRAummLDMr6+sUmTgsiz1zomCt7IF/ZJCgj5uSec9g=;
        b=keirsC9zgO+pEeOPU9n9qs8PGDtZ/Kt3cL1bJgTiOTcL32jwIumdIpu4lZ2v55XV0C
         tddkIA2zed3FVCzXA1B6fVkUUwBRUCekS+kDl0Gwh7nZiuhC47LX/k1fBNb8jPWCtupe
         DfhTzT3ody2hX0wYdzXs3pCfKG79ivKGQ38T4FLS5y7ictP8l51wJmtmQSIP9+M43h30
         /Pygjm8jonnSe08wQmEXsQDVPYG7g7IeZ8uSFM2yEeyqIblLDlEM9w4F2/5/3LMa9i9/
         hPT7cIEQpeIIjnLiioT6I4fpGiDKwUSuUx/GmTNQ57ceIOvaJv6tAfGPZkFwPdDmLbaD
         7HBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TmhodK1Y;
       spf=pass (google.com: domain of willianr@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=willianr@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <willianr@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id l24si4308706edw.133.2021.11.05.08.54.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Nov 2021 08:54:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of willianr@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TmhodK1Y;
       spf=pass (google.com: domain of willianr@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=willianr@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636127656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YuRAummLDMr6+sUmTgsiz1zomCt7IF/ZJCgj5uSec9g=;
	b=TmhodK1YSMbrNdbqdIIvrlbb7NDqK624gENGSrJgX4///BFFP8ccMBC8QWAs2ZG4hMmcUN
	L/7W1QdFyMvC3XQ24o9a2OVhoNL7E+ln3AwhnG1u6IW4m4crsVXghY39OcTXmGDGlan5vg
	7ga9P3zwXQ+g2hn7AKCrnRVijBsJbnU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-1od7i0AwMjCa8pguiv0G4Q-1; Fri, 05 Nov 2021 11:54:11 -0400
X-MC-Unique: 1od7i0AwMjCa8pguiv0G4Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C492879A0C;
	Fri,  5 Nov 2021 15:54:08 +0000 (UTC)
Received: from wrampazz.redhat.com (unknown [10.22.8.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC2D012546A;
	Fri,  5 Nov 2021 15:54:00 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	John Snow <jsnow@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-ppc@nongnu.org,
	Willian Rampazzo <willianr@redhat.com>,
	qemu-arm@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	libvir-list@redhat.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 1/2] tests/acceptance: introduce new check-avocado tartget
Date: Fri,  5 Nov 2021 12:53:53 -0300
Message-Id: <20211105155354.154864-2-willianr@redhat.com>
In-Reply-To: <20211105155354.154864-1-willianr@redhat.com>
References: <20211105155354.154864-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +NJp/QbkgwNw

This introduces a new `make` target, `check-avocado`, and adds a
deprecation message about the `check-acceptance` target. This is
a preparation for renaming the `tests/acceptance` folder to
 `tests/avocado`.

The plan is to remove the call to the `check-avocado` target one
or two months after the release and leave the warning to force
people to move to the new `check-avocado` target.

Later, the `check-acceptance` target can be removed. The intent
is to avoid a direct impact during the current soft freeze.

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Willian Rampazzo <willianr@redhat.com>
---
 docs/about/deprecated.rst | 13 +++++++++++++
 tests/Makefile.include    | 17 ++++++++++++-----
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 56f9ad15ab..7bf8da8325 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -410,3 +410,16 @@ nanoMIPS ISA
 
 The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchain.
 As it is hard to generate binaries for it, declare it deprecated.
+
+Testing
+-------
+
+Renaming of the acceptance folder to avocado
+''''''''''''''''''''''''''''''''''''''''''''
+
+The ``tests/acceptance`` folder was never used to store acceptance tests
+in terms of software engineering. This naming can confuse developers
+adding tests using the Avocado Framework to this folder. The folder
+name change to ``tests/avocado`` also changed the ``make`` target from
+``check-acceptance`` to ``check-avocado``. In this case, the use of the
+``check-acceptance`` target is deprecated.
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 8434a33fe6..8e8ee58493 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -16,7 +16,7 @@ ifneq ($(filter $(all-check-targets), check-softfloat),)
 	@echo " $(MAKE) check-tcg            Run TCG tests"
 	@echo " $(MAKE) check-softfloat      Run FPU emulation tests"
 endif
-	@echo " $(MAKE) check-acceptance     Run acceptance (functional) tests for currently configured targets"
+	@echo " $(MAKE) check-avocado        Run avocado (integration) tests for currently configured targets"
 	@echo
 	@echo " $(MAKE) check-report.tap     Generates an aggregated TAP test report"
 	@echo " $(MAKE) check-venv           Creates a Python venv for tests"
@@ -24,7 +24,7 @@ endif
 	@echo
 	@echo "The following are useful for CI builds"
 	@echo " $(MAKE) check-build          Build most test binaris"
-	@echo " $(MAKE) get-vm-images        Downloads all images used by acceptance tests, according to configured targets (~350 MB each, 1.5 GB max)"
+	@echo " $(MAKE) get-vm-images        Downloads all images used by avocado tests, according to configured targets (~350 MB each, 1.5 GB max)"
 	@echo
 	@echo
 	@echo "The variable SPEED can be set to control the gtester speed setting."
@@ -83,7 +83,7 @@ clean-tcg: $(CLEAN_TCG_TARGET_RULES)
 
 # Python venv for running tests
 
-.PHONY: check-venv check-acceptance
+.PHONY: check-venv check-avocado check-acceptance check-acceptance-deprecated-warning
 
 TESTS_VENV_DIR=$(BUILD_DIR)/tests/venv
 TESTS_VENV_REQ=$(SRC_PATH)/tests/requirements.txt
@@ -127,12 +127,12 @@ get-vm-image-fedora-31-%: check-venv
 	$(call quiet-command, \
              $(TESTS_VENV_DIR)/bin/python -m avocado vmimage get \
              --distro=fedora --distro-version=31 --arch=$*, \
-	"AVOCADO", "Downloading acceptance tests VM image for $*")
+	"AVOCADO", "Downloading avocado tests VM image for $*")
 
 # download all vm images, according to defined targets
 get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, $(FEDORA_31_DOWNLOAD))
 
-check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
+check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
 	$(call quiet-command, \
             $(TESTS_VENV_DIR)/bin/python -m avocado \
             --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
@@ -142,6 +142,13 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
             $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
             "AVOCADO", "tests/acceptance")
 
+check-acceptance-deprecated-warning:
+	@echo
+	@echo "Note '$(MAKE) check-acceptance' is deprecated, use '$(MAKE) check-avocado' instead."
+	@echo
+
+check-acceptance: check-acceptance-deprecated-warning | check-avocado
+
 # Consolidated targets
 
 .PHONY: check-block check check-clean get-vm-images
-- 
2.33.1
