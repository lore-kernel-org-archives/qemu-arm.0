Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp1242313wri;
        Thu, 31 Oct 2019 07:28:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzHNp3Ugz6HLcqfBY1QrFOJ7vB1BbyTfLle606oq7nh59u4uHqxynaz/L5qKLlO+N6Yl2uh
X-Received: by 2002:a81:3c43:: with SMTP id j64mr4156711ywa.27.1572532136732;
        Thu, 31 Oct 2019 07:28:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572532136; cv=none;
        d=google.com; s=arc-20160816;
        b=ryLfIePYarOeyVucmiqCrpM/ACxJFIPIDwNu4bMj19yuxpgoapvok2zMOwsMCHu+I9
         90G1QnYl3GXRceelGMHp8ieyrJEVAnqYasI+w23eDvO7bNxUd0ph1Scf+Bx8yX3OgRSo
         +5OxrvaKVwX5qocKHvD8G9CISgazu5nuAhqzOfio82uatmjXEDRT9gR1rm5waPjU6CUP
         DaKNRGF4XDjo34LgIiTT0qSyqoJfZnWBtGehUwQDZV7E/HkVR1BfMEFcJ2xEKAHp/5Pt
         SbxMzG7OtNUGN9m/A1ZMFxWzqeRBTqBnM5BRvxrmZMfkUmiZ0AVSSMB9tqLRjL0CHwvg
         7eGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=bhBm+YQq+Yju7H6yz3/y1F3DqeL4dc0Mh7ykeHBEMEQ=;
        b=i9nYFd0UApYyT9o0BLhDdx1AD9Ogk/6j4W2QbbNWArIis7BRkbfAJu2CXytXUy1rph
         Nge2tsFEWCmb3M0SJIY9PawUaiCfZJe9mrH18EndrIc2seRjiL/21zmQSHzOmDUZHZlR
         MDWlnc4Exf337dZ3chxq6/MzfqK2b0kriJ0Zb1pm+57MwknxLtGiP+DrkAgimDt26L59
         eiDGFYuN7QLG6RB2+wW02gp9owCB9caelMNISxDs1UzKWGQS0JGGcNZEDUoI+nHKACs6
         INl+1/1G+8dFNqxui2b4TRnpEvpuXtv8FuiFNQNg1AqtXQjW0qkKgalnQP5+eDmxFfOy
         orKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bRVeCeXI;
       spf=pass (google.com: domain of drjones@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id f187si3897843ybf.149.2019.10.31.07.28.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 07:28:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bRVeCeXI;
       spf=pass (google.com: domain of drjones@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572532136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bhBm+YQq+Yju7H6yz3/y1F3DqeL4dc0Mh7ykeHBEMEQ=;
	b=bRVeCeXIdY+9O+T7xCHgh7c36AASplLKXVD65RmWJe4EPlUwgapUVLpvtEuICwMiamRs+K
	dmzJW4G1iOBwuu61hHDbD/yJPp1FEPCEBnKTS8ZUSdBrMlk9Oz9UB4FIhlU6SjUYGTPm+M
	fQ0sSO7sMI0N6sVBgbzyObo5U2H9P+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-b4__aDwqOf6u3IyASCycXw-1; Thu, 31 Oct 2019 10:28:52 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AF0B8017E0;
	Thu, 31 Oct 2019 14:28:51 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-117-53.ams2.redhat.com [10.36.117.53])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C0DEA60852;
	Thu, 31 Oct 2019 14:27:49 +0000 (UTC)
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
Subject: [PATCH v8 0/9] target/arm/kvm: enable SVE in guests
Date: Thu, 31 Oct 2019 15:27:25 +0100
Message-Id: <20191031142734.8590-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: b4__aDwqOf6u3IyASCycXw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-TUID: JnczLKMycYho

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

v8:
  - Fixed another issue with the new make check tests. We weren't
    detecting kvm in a way that worked when running a cross-compiled
    aarch32 qemu on an aarch64 machine that had kvm. So now we detect
    kvm in a new, more robust way using the query-kvm qmp command.
    Besides some context changes after rebase, all the changes for
    this version are in 2/9, so I left all tags as they were.

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
 target/arm/cpu64.c        | 356 +++++++++++++++++++++++-
 target/arm/helper.c       |  10 +-
 target/arm/kvm.c          |  25 +-
 target/arm/kvm32.c        |   6 +-
 target/arm/kvm64.c        | 323 +++++++++++++++++++---
 target/arm/kvm_arm.h      |  39 +++
 target/arm/monitor.c      | 158 +++++++++++
 tests/Makefile.include    |   5 +-
 tests/arm-cpu-features.c  | 551 ++++++++++++++++++++++++++++++++++++++
 14 files changed, 1786 insertions(+), 57 deletions(-)
 create mode 100644 docs/arm-cpu-features.rst
 create mode 100644 tests/arm-cpu-features.c

--=20
2.21.0
