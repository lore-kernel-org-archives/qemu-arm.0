Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp781854wrv;
        Fri, 2 Aug 2019 05:25:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqziy5PicvOB83/zAKSMEfVyaotaQ99pyfVIYLk2GrspFV5FPc0mCo04dlry9uo301niO9wc
X-Received: by 2002:ac8:47d5:: with SMTP id d21mr36991120qtr.360.1564748751812;
        Fri, 02 Aug 2019 05:25:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564748751; cv=none;
        d=google.com; s=arc-20160816;
        b=AJzvCKYvO3C2W2Xo3xLc/pV82M/lAbUQ9P14GUgPccQFtsJp1641JSEQdZV+BPAZSJ
         RdjgDOe9ag2x6nw1Llfv4kUmpOrMJJtbUvbWFdg1kHhdFlDdCyhUFzGvSijnAIcfcl0s
         l+RYnO58hFw6y3gTykic6++/SAUibE+8a6tJ8h4nCGwe1UdeFzvwvhJOjZrTaBwnH57e
         n0zY/zM/MPNMCS+M3J9LQixxuuNbdHS74G5w5Zx03sVtYkCnfavShk93CfCXjQLmoaep
         yYcjSV5GttdKYGMwAiABm+nC4t/3ryfoKghgfYnmmkfVxP3EIbWw4Z7SDqwjInd+1pRm
         O6pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=132o1IYQKKmEDopk4bXzr/JnShfAwwPL4HpF6ZwcGKk=;
        b=hlwm8lD4HLo0l1L3D6SV279gC6Z4JWWYzgzTf4EFxtQ3ufiRPdYR9olQ5qthPJh2Lh
         NHWyZTLkfEoCbkepho78R4vkQJI6UL6fbHR6dqimT9WCt981W17ZEyb4B1uPxKExCZ5L
         +GDvhRfFqol+0XusDbVDCUE9ToDYmxW1dQOX0tK2zj98zHWCjwXOXS2N7xSg1Ct2mK33
         ygEqnA26CWkHgII6s4kUvCf2qisPbrD7Fb/82RQHK4zMvMxTpU2moqc95Vi0yTq8mpYT
         r/mKG/Cy+t18Sv90aZS46Iwm78EobJbMs6lvOnGnoNqkBhkbSsUOyC5+D+pHJl6AWiLM
         1KiA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id m139si2736003qke.257.2019.08.02.05.25.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 05:25:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E2309307D88D;
	Fri,  2 Aug 2019 12:25:50 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B3D455C205;
	Fri,  2 Aug 2019 12:25:41 +0000 (UTC)
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
Subject: [PATCH v3 00/15] target/arm/kvm: enable SVE in guests
Date: Fri,  2 Aug 2019 14:25:25 +0200
Message-Id: <20190802122540.26385-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Fri, 02 Aug 2019 12:25:51 +0000 (UTC)
X-TUID: AUqx70RHp6yD

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

v3:
  - Added documentation (docs/arm-cpu-features.rst)
  - Fixed TCG emulation of ZCR
  - Fixed KVM put/get_sve registers to not forget to bswap FFR
  - Now ensure we never end up with no vector lengths selected and sve=on
  - Now also auto-disable uninitialized larger vector lengths that are
    no longer possible due to disabling a dependent smaller length
  - Now only use cpu_isar_feature(aa64_sve, cpu) to track SVE enablement
  - Now sve-max-vq can come wherever it wants in an sve* property sequence
  - No longer abuse sve_max_vq for additional states; instead use a couple
    new helper functions to determine the same states
  - Changed some error messages
  - Dropped some asserts
  - Added more code comments
  - Churned a good amount of code for refactoring and cleanups
  - Picked up some tags from Eric and Richard


Thanks!
drew

Andrew Jones (15):
  target/arm/cpu64: Ensure kvm really supports aarch64=off
  target/arm/cpu: Ensure we can use the pmu with kvm
  target/arm/monitor: Introduce qmp_query_cpu_model_expansion
  tests: arm: Introduce cpu feature tests
  target/arm/helper: zcr: Add build bug next to value range assumption
  target/arm/cpu: Use div-round-up to determine predicate register array
    size
  target/arm: Allow SVE to be disabled via a CPU property
  target/arm/cpu64: max cpu: Introduce sve<vl-bits> properties
  target/arm/kvm64: Fix error returns
  target/arm/kvm64: Move the get/put of fpsimd registers out
  target/arm/kvm64: Add kvm_arch_get/put_sve
  target/arm/kvm64: max cpu: Enable SVE when available
  target/arm/kvm: scratch vcpu: Preserve input kvm_vcpu_init features
  target/arm/cpu64: max cpu: Support sve properties with KVM
  target/arm/kvm: host cpu: Add support for sve<vl-bits> properties

 docs/arm-cpu-features.rst | 301 ++++++++++++++++++++++
 qapi/machine-target.json  |   6 +-
 target/arm/cpu.c          |  38 ++-
 target/arm/cpu.h          |  19 +-
 target/arm/cpu64.c        | 499 +++++++++++++++++++++++++++++++++--
 target/arm/helper.c       |  14 +-
 target/arm/kvm.c          |  32 ++-
 target/arm/kvm32.c        |   6 +-
 target/arm/kvm64.c        | 439 ++++++++++++++++++++++++++-----
 target/arm/kvm_arm.h      |  67 +++++
 target/arm/monitor.c      | 154 +++++++++++
 tests/Makefile.include    |   5 +-
 tests/arm-cpu-features.c  | 529 ++++++++++++++++++++++++++++++++++++++
 13 files changed, 2005 insertions(+), 104 deletions(-)
 create mode 100644 docs/arm-cpu-features.rst
 create mode 100644 tests/arm-cpu-features.c

-- 
2.20.1
