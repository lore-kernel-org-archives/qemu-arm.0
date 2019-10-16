Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp6857960wrm;
        Wed, 16 Oct 2019 01:54:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw6ISitSwjF6eIUTZ/AulBkChBe+c+glhy0G5yg93VvZ9kwotNVjU1kv5WpRdky0n2RsPAc
X-Received: by 2002:a02:cceb:: with SMTP id l11mr9308213jaq.80.1571216055839;
        Wed, 16 Oct 2019 01:54:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571216055; cv=none;
        d=google.com; s=arc-20160816;
        b=H5xzKIzu5BsgyMVx2dmCyNivldhBUjV40NfM2j7a2bYqFfoWXC6v/XX9rNicGDAnH2
         cOleZIgT+/ww6HlCNVyM+vwg0SDlfBtctgiCL3bJ8v3Sfg9QA0ZSPiyrrbm2C666kfhF
         vF7UBa58ELr1cbqovCz8bQ6wNjxblpgFXNdawb0OpSsvioBu9U56Aw5AT8dBSWkL63Rr
         0IPazejocP+6zoUybmS0cI6RYC3YFhOQ05r2NDaYOa+eYVvs09Jw5Ae28mvohvbnlHh1
         JZdMa11iGM7V14MCXIh2IJpLAHLx1QcbIeBi9iknvpg6YLlTaxtAL50rYaa620IUV7WW
         eaVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=zbFFZJ9MR/HvgifEw5XaF1KFUbEoZ1xhUSPvQm1Mpq0=;
        b=e1llJzYzhKu1sM2docKhLmk7v30eQLZ7ViGYhUuVqYqhBnX52/j1wQkHNbXtDdQLNq
         F2bwqwycBR0gSJRLP9Bxa3RMDILPlqZAHBejVAsYfzPA7v2byJ/H6oErPcXnvQCTcS+0
         519lufFo54FG5MDPico23CTBYqEmn1H0XpATO0qoZhz2VNhtXB4URCPDypjmy5HWIxfk
         jMQ/0ar+AW0VfRuhrPB7rW303BHsdNownSM64BoBcOf2uO5jSAHn85rbZcrUtErn1ttP
         lrtVlmtQG43ma3Y0zYLB+Q5a2vLQVoKJb6VeFuaE2G6erOb63FijhZ+ox4xU3+oVXm2/
         8LoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id c3si40266528jae.49.2019.10.16.01.54.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 01:54:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EBA753082E0F;
	Wed, 16 Oct 2019 08:54:14 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6BCEC5D9CD;
	Wed, 16 Oct 2019 08:54:10 +0000 (UTC)
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
Subject: [PATCH v6 0/9] target/arm/kvm: enable SVE in guests
Date: Wed, 16 Oct 2019 10:53:59 +0200
Message-Id: <20191016085408.24360-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Wed, 16 Oct 2019 08:54:15 +0000 (UTC)
X-TUID: LYpxRCWcocW/

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

v6:
  - Adding missing visit_free() to an error path in
    qmp_query_cpu_model_expansion() in patch 1/9.
  - Rebased on latest master (applied cleanly)
  - Picked up r-b's from Richard and Eric

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


*** BLURB HERE ***

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
 target/arm/cpu64.c        | 358 ++++++++++++++++++++++++-
 target/arm/helper.c       |  10 +-
 target/arm/kvm.c          |  25 +-
 target/arm/kvm32.c        |   6 +-
 target/arm/kvm64.c        | 323 ++++++++++++++++++++---
 target/arm/kvm_arm.h      |  39 +++
 target/arm/monitor.c      | 158 +++++++++++
 tests/Makefile.include    |   5 +-
 tests/arm-cpu-features.c  | 542 ++++++++++++++++++++++++++++++++++++++
 14 files changed, 1778 insertions(+), 58 deletions(-)
 create mode 100644 docs/arm-cpu-features.rst
 create mode 100644 tests/arm-cpu-features.c

-- 
2.21.0
