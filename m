Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp8156962wrp;
        Tue, 1 Oct 2019 05:58:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzC6UpsUFSe/6Vfn7QfKLQqtzsfV1JRTE/DgR6EWKYTvB8UymbxsYTj/Ed3/lt4t3Colph2
X-Received: by 2002:a92:4698:: with SMTP id d24mr22911524ilk.222.1569934734059;
        Tue, 01 Oct 2019 05:58:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569934734; cv=none;
        d=google.com; s=arc-20160816;
        b=c6Ni2+c6U1UpVW1Z7Tz9ZDHS453yGBQJ4PNImAcF8cn5TLjHyiw2KMGSxrXSs/W3v4
         HvFXg0njKck3nReuPIRQFSy8kLYyeXxh1OKIGCNwkqGavNac2+ghG48O0UmALIRGvqXw
         bOONrGvCbwTfPvT4pgOW2BvxHLLk+1MBbTNcU8N415qAVKZ3htQw2aPzH8aKrJNgzcIh
         15fehQ48bbqPmNoI58Dlw7iKrtu3O7cYiDKKV+HGcqM/rQHFv1pYryLUQvZUtFszxhwE
         3qY47URpLSxB6IVEnKYMUkfAGHA+MJITu+JnqR2aPfcj/0cOmqxIKT0ZUFf3YPdiwVGl
         KdgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=z68W5/vrvvDQSYeQDmpnQOJt0EfdnlpCOB2A41tULRQ=;
        b=lcBv02xzm3wsGcmJza4QE088nHYYk3rqaQDAqP8jReh7juETfplNI1GseHgkVuaejE
         J6WFDIT32kTloWy0/6rGlMGCYcCGZ4uIgeNJ6XiktylXwnq+22Q1FMcCYO1GABVXj/xL
         +w7ahrFza5NgrvzKwkG65aKqy5vWg83t3sJQ+HE9hes6xIGj2VmJYCiajg7Zzzha61t2
         ZvYZ8utQ/YO/UJSN2gNHDAivLImGZsn36HhEPOWpZjFENY5LyDWCYKzx6UMtN1fXaumC
         rU0Y6QknABLIHbt5OjRdDeZTwi9BfEd1cvcz4+U3wGBdp0zYuFGph3OZeS6kK4jHb61Z
         9nvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id c18si14973428ilr.55.2019.10.01.05.58.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 05:58:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4718D88307;
	Tue,  1 Oct 2019 12:58:53 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 92245261C2;
	Tue,  1 Oct 2019 12:58:46 +0000 (UTC)
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
Subject: [PATCH v5 0/9] target/arm/kvm: enable SVE in guests
Date: Tue,  1 Oct 2019 14:58:36 +0200
Message-Id: <20191001125845.8793-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Tue, 01 Oct 2019 12:58:53 +0000 (UTC)
X-TUID: 3iZCq1+ZZDHu

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

v5:
  - Now generate an error if vector lengths have been explicitly
    enabled, but SVE is disabled
  - Fixed a bug in sve_zcr_len_for_el()
  - Fixed a bug in kvm_arch_put/get_sve() and brought back the
    put/get of FPSR/FPCR
  - A few document clarifications and added some new sentences
  - Added a couple more tests
  - Added BIT_ULL and use it in the test
  - Removed an unnecessary bitmap search
  - Moved a cpu_max_get_sve_max_vq() hunk from 4/9 to 3/9 and
    added a fix for it in 8/9
  - Picked up some more tags from Eric

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

 docs/arm-cpu-features.rst | 317 ++++++++++++++++++++++
 include/qemu/bitops.h     |   1 +
 qapi/machine-target.json  |   6 +-
 target/arm/cpu.c          |  25 +-
 target/arm/cpu.h          |  21 ++
 target/arm/cpu64.c        | 356 ++++++++++++++++++++++++-
 target/arm/helper.c       |  10 +-
 target/arm/kvm.c          |  25 +-
 target/arm/kvm32.c        |   6 +-
 target/arm/kvm64.c        | 323 ++++++++++++++++++++---
 target/arm/kvm_arm.h      |  39 +++
 target/arm/monitor.c      | 157 +++++++++++
 tests/Makefile.include    |   5 +-
 tests/arm-cpu-features.c  | 542 ++++++++++++++++++++++++++++++++++++++
 14 files changed, 1776 insertions(+), 57 deletions(-)
 create mode 100644 docs/arm-cpu-features.rst
 create mode 100644 tests/arm-cpu-features.c

-- 
2.20.1
