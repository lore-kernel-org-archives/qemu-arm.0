Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp848825wrg;
        Fri, 21 Jun 2019 09:34:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwMAfhE8LqM++x7hr1IDlQGu4zlbyk/308sUsytSgG39wtEE+wfJ5n/0nZz/EKhbvVmOZcV
X-Received: by 2002:a37:aa8e:: with SMTP id t136mr44705980qke.222.1561134880873;
        Fri, 21 Jun 2019 09:34:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561134880; cv=none;
        d=google.com; s=arc-20160816;
        b=ZE6KXN8Uh7WdJbPXDr0qxOu1mfW897F/xQsbxDy7Yl6Y5gMgcA1sLcNdGbf3eQqYax
         I/XO2zUffYGhJVOUVjlfRwEw3HuEaAKRtTq5UAhTUhsvuKVG7LBkeOAxU35nbpnVcP67
         ybBOwS3oUUwxLykAYMGiJJf/kvi5ZM2p5pJ27SBs3OU7eyEli7aXsTTcOLfEeoTeEDW2
         XCuiJkt/OCPz4LDH21vlT/vAlcIdi3MgUFTufSZq3zN/UbC0M81i5s4pcboedACHvd+h
         PKExtf1b/aCBlyks+FuJ7gbKgFJkE/2BAfiinBano1nVDkU5vKqJPPYunXw8qjSlCopV
         pDxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=QjXVBEtOWrKkTwB8hrMrJr0gRudFpqjoUNrek57m/fY=;
        b=jDw2fEMZwqA9OuZa6UWGdJF3Fy+7Z4WmY8VSmo7jbMWIEyLkAGzEYABJal87jiQ1hI
         RyULNafLYJdP/yfClo9dPD9qnJJnEwpU0DYwJZX0up+fAYLuPnAkg+2lqQK6CcpVbP5F
         ck8nu5eTQe1k7jnvrLqe1Hr2hfEtVqd3gXqExHBtnjp52dJR8pr4t5wtG5+aONnZURUC
         CukKFvblR2IH84EgVg8HypBUfKU1DFIqe7KaLIVLvusOa3dJlzmB3WO7ITHOka3TLSJ6
         vrQA1F/c1FC1k/zdn1p8TrjfMkwr0PYeWCDfaFLD30KiPYR/tuR/9O10ptPmnLVHGMLC
         1y2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id i22si2386004qvh.223.2019.06.21.09.34.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 09:34:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3ABBD2E95AF;
	Fri, 21 Jun 2019 16:34:30 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D03B31001DDD;
	Fri, 21 Jun 2019 16:34:23 +0000 (UTC)
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
Subject: [PATCH v2 00/14] target/arm/kvm: enable SVE in guests
Date: Fri, 21 Jun 2019 18:34:08 +0200
Message-Id: <20190621163422.6127-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Fri, 21 Jun 2019 16:34:30 +0000 (UTC)
X-TUID: lk7dXEg62zUE

Since Linux kernel v5.2-rc1 KVM has support for enabling SVE in guests.
This series provides the QEMU bits for that enablement. This is a v2
series, however it looks completely different than v1. Thank you to
all who reviewed v1. I've included all input still relevant to this
new approach. And the new approach is thanks to Igor for suggesting
it. The new approach is to use a CPU property for each vector length
and then implement the preexisting qmp_query_cpu_model_expansion
query for Arm to expose them. Here's how the series goes:

First, we select existing CPU properties representing features we
want to advertise in addition to the SVE vector lengths and prepare
them for the qmp query. Then we introduce the qmp query, applying
it immediately to those selected features. We next add a qtest for
the selected CPU features that uses the qmp query for its tests - and
we continue to add tests as we add CPU features with the following
patches. So then, once we have the support we need for CPU feature
querying and testing, we add our first SVE CPU feature property, sve,
which just allows SVE to be completely enabled/disabled. Following
that feature property, we add all 16 vector length properties along
with the input validation they need and tests to prove the validation
works. At this point the SVE features are still only for TCG, so we
provide some patches to prepare for KVM and then a patch that allows
the 'max' CPU type to enable SVE with KVM, but at first without
vector length properties. After a bit more preparation we add the
SVE vector length properties to the KVM-enabled 'max' CPU type along
with the additional input validation and tests that that needs.
Finally we allow the 'host' CPU type to also enjoy these properties
by simply sharing them with it.

Phew, I think that's everything.

Thanks!
drew

Andrew Jones (14):
  target/arm/cpu64: Ensure kvm really supports aarch64=off
  target/arm/cpu: Ensure we can use the pmu with kvm
  target/arm/monitor: Introduce qmp_query_cpu_model_expansion
  tests: arm: Introduce cpu feature tests
  target/arm/helper: zcr: Add build bug next to value range assumption
  target/arm: Allow SVE to be disabled via a CPU property
  target/arm/cpu64: max cpu: Introduce sve<vl-bits> properties
  target/arm/kvm64: Fix error returns
  target/arm/kvm64: Move the get/put of fpsimd registers out
  target/arm/kvm64: Add kvm_arch_get/put_sve
  target/arm/kvm64: max cpu: Enable SVE when available
  target/arm/kvm: scratch vcpu: Preserve input kvm_vcpu_init features
  target/arm/cpu64: max cpu: Support sve properties with KVM
  target/arm/kvm: host cpu: Add support for sve<vl-bits> properties

 qapi/target.json         |   6 +-
 target/arm/cpu.c         |  47 +++-
 target/arm/cpu.h         |  17 ++
 target/arm/cpu64.c       | 548 +++++++++++++++++++++++++++++++++++++--
 target/arm/helper.c      |  20 +-
 target/arm/kvm.c         |  34 ++-
 target/arm/kvm32.c       |   6 +-
 target/arm/kvm64.c       | 428 +++++++++++++++++++++++++-----
 target/arm/kvm_arm.h     |  73 ++++++
 target/arm/monitor.c     | 148 +++++++++++
 tests/Makefile.include   |   5 +-
 tests/arm-cpu-features.c | 509 ++++++++++++++++++++++++++++++++++++
 12 files changed, 1738 insertions(+), 103 deletions(-)
 create mode 100644 tests/arm-cpu-features.c

-- 
2.20.1
