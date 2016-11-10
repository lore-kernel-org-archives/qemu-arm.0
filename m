Received: by 10.25.150.194 with SMTP id y185csp912425lfd;
        Thu, 10 Nov 2016 09:21:27 -0800 (PST)
X-Received: by 10.237.38.226 with SMTP id q89mr6885670qtd.153.1478798486956;
        Thu, 10 Nov 2016 09:21:26 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id a190si3920519qkg.233.2016.11.10.09.21.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Nov 2016 09:21:26 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 00B0F7EBA4;
	Thu, 10 Nov 2016 17:21:26 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uAAHLMja006894;
	Thu, 10 Nov 2016 12:21:23 -0500
From: Andrew Jones <drjones@redhat.com>
To: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org
Cc: pbonzini@redhat.com, andre.przywara@arm.com, peter.maydell@linaro.org,
        alex.bennee@linaro.org, marc.zyngier@arm.com, eric.auger@redhat.com,
        christoffer.dall@linaro.org
Subject: [kvm-unit-tests PATCH v5 00/11] arm/arm64: add gic framework
Date: Thu, 10 Nov 2016 18:21:10 +0100
Message-Id: <1478798481-25030-1-git-send-email-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Thu, 10 Nov 2016 17:21:26 +0000 (UTC)
X-TUID: R1RNkRGIeHkG

v5:
 - fix arm32/gicv3 compile [drew]
 - use modern register names [Andre]
 - one Andre r-b

v4:
 - Eric's r-b's
 - Andre's suggestion to only take defines we need
 - several other changes listed in individual patches

v3:
 - Rebased on latest master
 - Added Alex's r-b's

v2:
 Rebased on latest master + my "populate argv[0]" series (will
 send a REPOST for that shortly. Additionally a few patches got
 fixes/features;
 07/10 got same fix as kernel 7c9b973061 "irqchip/gic-v3: Configure
       all interrupts as non-secure Group-1" in order to continue
       working over TCG, as the gicv3 code for TCG removed a hack
       it had there to make Linux happy.
 08/10 added more output for when things fail (if they fail)
 09/10 switched gicv3 broadcast implementation to using IRM. This
       found a bug in a recent (but not tip) kernel, which I was
       about to fix, but then I saw MarcZ beat me to it.
 10/10 actually check that the input irq is the received irq


Import defines, and steal enough helper functions, from Linux to
enable programming of the gic (v2 and v3). Then use the framework
to add an initial test (an ipi test; self, target-list, broadcast).

It's my hope that this framework will be a suitable base on which
more tests may be easily added, particularly because we have
vgic-new and tcg gicv3 emulation getting close to merge. (v3 UPDATE:
vgic-new and tcg gicv3 are merged now)

To run it, along with other tests, just do

 ./configure [ --arch=[arm|arm64] --cross-prefix=$PREFIX ]
 make
 export QEMU=$PATH_TO_QEMU
 ./run_tests.sh

To run it separately do, e.g.

$QEMU -machine virt,accel=tcg -cpu cortex-a57 \
 -device virtio-serial-device \
 -device virtconsole,chardev=ctd -chardev testdev,id=ctd \
 -display none -serial stdio \
 -kernel arm/gic.flat \
 -smp 123 -machine gic-version=3 -append ipi
      ^^ note, we can go nuts with nr-cpus on TCG :-)

Or, a KVM example using a different "sender" cpu and irq (other than zero)

$QEMU -machine virt,accel=kvm -cpu host \
 -device virtio-serial-device \
 -device virtconsole,chardev=ctd -chardev testdev,id=ctd \
 -display none -serial stdio \
 -kernel arm/gic.flat \
 -smp 48 -machine gic-version=3 -append 'ipi sender=42 irq=1'


Patches:
01-05: fixes and functionality needed by the later gic patches
06-07: enable gicv2 and gicv2 IPI test
08-10: enable gicv3 and gicv3 IPI test
   11: extend the IPI tests to take variable sender and irq

Available here: https://github.com/rhdrjones/kvm-unit-tests/commits/arm/gic-v5


Andrew Jones (10):
  lib: xstr: allow multiple args
  arm64: fix get_"sysreg32" and make MPIDR 64bit
  arm/arm64: smp: support more than 8 cpus
  arm/arm64: add some delay routines
  arm/arm64: irq enable/disable
  arm/arm64: add initial gicv2 support
  arm/arm64: gicv2: add an IPI test
  arm/arm64: add initial gicv3 support
  arm/arm64: gicv3: add an IPI test
  arm/arm64: gic: don't just use zero

Peter Xu (1):
  libcflat: add IS_ALIGNED() macro, and page sizes

 arm/Makefile.common        |   7 +-
 arm/gic.c                  | 417 +++++++++++++++++++++++++++++++++++++++++++++
 arm/run                    |  19 ++-
 arm/selftest.c             |   5 +-
 arm/unittests.cfg          |  13 ++
 lib/arm/asm/arch_gicv3.h   |  65 +++++++
 lib/arm/asm/gic-v2.h       |  36 ++++
 lib/arm/asm/gic-v3.h       |  94 ++++++++++
 lib/arm/asm/gic.h          |  43 +++++
 lib/arm/asm/processor.h    |  42 ++++-
 lib/arm/asm/setup.h        |   4 +-
 lib/arm/gic.c              | 141 +++++++++++++++
 lib/arm/processor.c        |  15 ++
 lib/arm/setup.c            |  10 ++
 lib/arm64/asm/arch_gicv3.h |  66 +++++++
 lib/arm64/asm/gic-v2.h     |   1 +
 lib/arm64/asm/gic-v3.h     |   1 +
 lib/arm64/asm/gic.h        |   1 +
 lib/arm64/asm/processor.h  |  53 +++++-
 lib/arm64/asm/sysreg.h     |  44 +++++
 lib/arm64/processor.c      |  15 ++
 lib/libcflat.h             |  10 +-
 22 files changed, 1075 insertions(+), 27 deletions(-)
 create mode 100644 arm/gic.c
 create mode 100644 lib/arm/asm/arch_gicv3.h
 create mode 100644 lib/arm/asm/gic-v2.h
 create mode 100644 lib/arm/asm/gic-v3.h
 create mode 100644 lib/arm/asm/gic.h
 create mode 100644 lib/arm/gic.c
 create mode 100644 lib/arm64/asm/arch_gicv3.h
 create mode 100644 lib/arm64/asm/gic-v2.h
 create mode 100644 lib/arm64/asm/gic-v3.h
 create mode 100644 lib/arm64/asm/gic.h
 create mode 100644 lib/arm64/asm/sysreg.h

-- 
2.7.4
