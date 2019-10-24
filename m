Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp2271018wrq;
        Thu, 24 Oct 2019 05:18:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy8eLikvl/1Ur2hHygNNe9Z/byGbCTB7pAFfGvnyarIk0cu8ZSDq2eRw3T96G+aZ30LGTq2
X-Received: by 2002:a50:b2c4:: with SMTP id p62mr42287540edd.128.1571919507219;
        Thu, 24 Oct 2019 05:18:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571919507; cv=none;
        d=google.com; s=arc-20160816;
        b=rYU3QW7FkKSIm/ukNIyoTrjgQzdW4OrcDFGC3XZTyW60/RGj77lu/It7c4BIvScQzb
         mEm/w0DnK8SJhmSOau140eRQVpjeemIWJA0gE0WFPi8s5M0g5fM/k7wGM3ThgOzEN7Ld
         cuU8Xd1qosySII0WTrMudRxZcrkOfGcHNFN1YJMSepGq7NpjPG/O/uGaBsixNgWh7/xa
         C6PftreUT+wnUgQVQmf3SRb4ak16eAI3QvF+u9TWMlZ0j5F0mz5CPGbDOwd8kUEI9bQE
         1Dy3JpUzp5WBDLECnOZ9X1NyPTSO3QgyUqAdNrSDtSjSHbffjKwHT0HfBzicmYSbnid9
         wiyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=GLcYd4i5i9PPotTsUudi6evcUiwsVCtXhAmjNpWRGUE=;
        b=FdBHfC4jko1Kd2G2vbbQjz5D77CXLRRNAbcyaMGoDZXcZqvLJr2fENQ3+FXb7lbYGw
         rj/g10WeqtgMWyVhC1SRFFmPlfDIQdtaZxGMnXnB+SRJeIx0IdP6JtBu8eAaTbIQu53e
         QpqH6bnNLL7U0Kusp9fL5+5cuJXH7oX85WfxEiUTUgYO37oTr3Z763/ExEdgUic8YxHk
         8dVyBmaV/uiJsq4e75QeV9yhhWNpJ1KinD8ibDdKqtlWOFk160rGglsHzPGBe35+tEOT
         2gw2NIMh+DkXwCfWAm7ty5sbvaUx8/ojiGyyk2Nl9nwjZ0ttaicT0TjSptuyHZ8izJJE
         Z7Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H3BOm8zZ;
       spf=pass (google.com: domain of drjones@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id q7si12727572edi.103.2019.10.24.05.18.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Oct 2019 05:18:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H3BOm8zZ;
       spf=pass (google.com: domain of drjones@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571919506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GLcYd4i5i9PPotTsUudi6evcUiwsVCtXhAmjNpWRGUE=;
	b=H3BOm8zZu07G0nyrY/O3XISUdrKFJFMt1Nz42hwD6jwlLRxoNlHb3+ytAhFLCPPcyV4qYq
	z2AgDffQcTiu/r3W3OWsdIYoALbzm5gVGdd/nopVFEbkkg4CtYQ96ZP4e7k6WH3vA3coPz
	7P0ef5fxwv27k4UCnDJyXg8Bqndexe8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-u9WNLrYoPBKlAC2SHdke5g-1; Thu, 24 Oct 2019 08:18:22 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C89B1800D6B;
	Thu, 24 Oct 2019 12:18:21 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EFCE860BF3;
	Thu, 24 Oct 2019 12:18:09 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	eric.auger@redhat.com,
	beata.michalska@linaro.org,
	m.mizuma@jp.fujitsu.com,
	alex.bennee@linaro.org,
	Dave.Martin@arm.com,
	armbru@redhat.com,
	eblake@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v7 0/9] target/arm/kvm: enable SVE in guests
Date: Thu, 24 Oct 2019 14:17:59 +0200
Message-Id: <20191024121808.9612-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: u9WNLrYoPBKlAC2SHdke5g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-TUID: VDXQkQd+Hy6q

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

v7:
  - Fixed kvm32 tests and added a couple
  - Picked up r-b's from Beata and t-b's from Masa

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
 target/arm/monitor.c      | 158 +++++++++++
 tests/Makefile.include    |   5 +-
 tests/arm-cpu-features.c  | 540 ++++++++++++++++++++++++++++++++++++++
 14 files changed, 1775 insertions(+), 57 deletions(-)
 create mode 100644 docs/arm-cpu-features.rst
 create mode 100644 tests/arm-cpu-features.c

--=20
2.21.0
