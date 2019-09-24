Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3786289wrp;
        Tue, 24 Sep 2019 04:31:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy5tXvTWn14eF9Vr4x/EdWqEaDWWYn3hsFkRW9c5/19IwqCST1BRuEiOFrkTtkypoKuZ33j
X-Received: by 2002:a02:c65a:: with SMTP id k26mr3169228jan.56.1569324675078;
        Tue, 24 Sep 2019 04:31:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569324675; cv=none;
        d=google.com; s=arc-20160816;
        b=ZCF1WI8JnhIgBcRrrkxHitlHl/qfOfdJ5uIswDaJ3ojZf3w3JGH/uJonopFL8rnvzs
         AIVvFXE0liusLK4bLN+XKdJltUQjit+xzk/yUuNTRKvXRpqQAGxKJJDWzL2Fk7FtKSC5
         0504prp/wZy0jRbnaPBdsUVemMg6hYY2/wB4zWseTLed84uEudHFVWEydrtdtqa7QjYW
         QMtoxkQGLtM9wJbStotY9wnDfNkml6+8z8ddosLQcIIWt616Qc8WTP3npIkm8jbh2eqk
         JE0S/EVKZt4lD1Ryj2Kw2vAfJ9EdijFuniw9y6CVAnMbmzztSDohp1dQoVTWmZ8xqB/0
         IVYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=wAqrctI8L1UlIbGBdMHyliiU33jkyuhpPAni/4PvDFY=;
        b=sLbVN7i9CvJV5wBAsj8lAH4QImY1D5KrDg1I04tTsRjsf9X29krg7MkSVRnhRlq7DF
         qpUwfzFc4p82vWOL0tkgY3l7aciwcil/FIDn96vQ3jS+deBhYrJNeHPKfsll2lwCmmOh
         zcakt8/7hoJg5YX7GPuEz1zWhL0EcyPfHIJaqKg6la4F0Vqcn+Y4W/EdQ8lm4+eS0tra
         /5q6NHdQ2B35K3Uu5DpYHNpQJCJq6ZeQ+l9QEp7AThpqy+nQ9f4xCKorZwf20f6z7os1
         fCqPimcqixEC2pYbg1xIhI4GX36YuJP2waRQ5+Y4Uq6v9bW5f0CgpZW/ZkQrQnz1kBZp
         gjlg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id c15si2230671ioc.116.2019.09.24.04.31.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 04:31:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2096B300413C;
	Tue, 24 Sep 2019 11:31:14 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C3A575D772;
	Tue, 24 Sep 2019 11:31:06 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	armbru@redhat.com,
	eblake@redhat.com,
	Dave.Martin@arm.com,
	eric.auger@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v4 0/9] target/arm/kvm: enable SVE in guests
Date: Tue, 24 Sep 2019 13:30:56 +0200
Message-Id: <20190924113105.19076-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Tue, 24 Sep 2019 11:31:14 +0000 (UTC)
X-TUID: n4VICJWxRiD4

Since Linux kernel v5.2-rc1 KVM has support for enabling SVE in guests.
This series provides the QEMU bits for that enablement. First, we
select existing CPU properties representing features we want to
advertise in addition to the SVE vector lengths and prepare
them for a qmp query. Then we introduce the qmp query, applying
it immediately to those selected features. We also document ARM CPU
features at this time. We next add a qtest for the selected CPU
features that uses the qmp query for its tests - and we continue to
add tests as we add CPU features with the following patches. So then,
once we have the support we need for CPU feature querying and testing,
we add our first SVE CPU feature property, 'sve', which just allows
SVE to be completely enabled/disabled. Following that feature property,
we add all 16 vector length properties along with the input validation
they need and tests to prove the validation works. At this point the
SVE features are still only for TCG, so we provide some patches to
prepare for KVM and then a patch that allows the 'max' CPU type to
enable SVE with KVM, but at first without vector length properties.
After a bit more preparation we add the SVE vector length properties
to the KVM-enabled 'max' CPU type along with the additional input
validation and tests that that needs.  Finally we allow the 'host'
CPU type to also enjoy these properties by simply sharing them with it.

v4:
  - Integrated Richard Henderson's rework for the sve property
    validation, in order to do all validating at finalize time
    and save several lines of code.
  - Fixed 'host' cpu SVE default. It was still off by default.
  - Cleaned up #ifdef's for sve_bswap64()
  - Removed redundant KVM_CAP_ARM_SVE extension check in
    kvm_arm_sve_get_vls()
  - Improved the KVM SVE qtest
  - Renamed sve<vl-bits> to sve<N> everywhere
  - Renamed power-of-2 to power-of-two everywhere
  - Picked up some more tags from Richard

Thanks!
drew


Andrew Jones (9):
  target/arm/monitor: Introduce qmp_query_cpu_model_expansion
  tests: arm: Introduce cpu feature tests
  target/arm: Allow SVE to be disabled via a CPU property
  target/arm/cpu64: max cpu: Introduce sve<N> properties
  target/arm/kvm64: Add kvm_arch_get/put_sve
  target/arm/kvm64: max cpu: Enable SVE when available
  target/arm/kvm: scratch vcpu: Preserve input kvm_vcpu_init features
  target/arm/cpu64: max cpu: Support sve properties with KVM
  target/arm/kvm: host cpu: Add support for sve<N> properties

 docs/arm-cpu-features.rst | 301 +++++++++++++++++++++
 qapi/machine-target.json  |   6 +-
 target/arm/cpu.c          |  25 +-
 target/arm/cpu.h          |  21 ++
 target/arm/cpu64.c        | 341 +++++++++++++++++++++++-
 target/arm/helper.c       |  13 +-
 target/arm/kvm.c          |  25 +-
 target/arm/kvm32.c        |   6 +-
 target/arm/kvm64.c        | 277 +++++++++++++++++++-
 target/arm/kvm_arm.h      |  39 +++
 target/arm/monitor.c      | 157 +++++++++++
 tests/Makefile.include    |   5 +-
 tests/arm-cpu-features.c  | 537 ++++++++++++++++++++++++++++++++++++++
 13 files changed, 1718 insertions(+), 35 deletions(-)
 create mode 100644 docs/arm-cpu-features.rst
 create mode 100644 tests/arm-cpu-features.c

-- 
2.20.1
