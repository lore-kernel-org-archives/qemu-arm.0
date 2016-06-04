Received: by 10.25.27.66 with SMTP id b63csp799001lfb;
        Sat, 4 Jun 2016 11:16:14 -0700 (PDT)
X-Received: by 10.55.39.146 with SMTP id n140mr9147487qkn.10.1465064174030;
        Sat, 04 Jun 2016 11:16:14 -0700 (PDT)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id g27si1040782qtc.19.2016.06.04.11.16.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 Jun 2016 11:16:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx11.intmail.prod.int.phx2.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A05C463E1F;
	Sat,  4 Jun 2016 18:16:12 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-205.brq.redhat.com [10.34.1.205])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u54IG9nq008070;
	Sat, 4 Jun 2016 14:16:09 -0400
From: Andrew Jones <drjones@redhat.com>
To: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, pbonzini@redhat.com,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com,
        peter.maydell@linaro.org, alex.bennee@linaro.org
Cc: christoffer.dall@linaro.org, marc.zyngier@arm.com
Subject: [kvm-unit-tests PATCH v2 00/10] arm/arm64: add gic framework
Date: Sat,  4 Jun 2016 20:15:55 +0200
Message-Id: <1465064165-14885-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Sat, 04 Jun 2016 18:16:13 +0000 (UTC)
X-TUID: Q7ANdYWIfWnl

v2:
 Rebased on on latest master + my "populate argv[0]" series (will
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
vgic-new and tcg gicv3 emulation getting close to merge.

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
06-07: code theft from Linux (defines, helper functions)
08-10: arm/gic.flat (the base of the gic unit test), currently just IPI

Available here: https://github.com/rhdrjones/kvm-unit-tests/commits/arm/gic


Andrew Jones (10):
  lib: xstr: allow multiple args
  arm64: fix get_"sysreg32" and make MPIDR 64bit
  arm/arm64: smp: support more than 8 cpus
  arm/arm64: add some delay routines
  arm/arm64: irq enable/disable
  arm/arm64: add initial gicv2 support
  arm/arm64: add initial gicv3 support
  arm/arm64: gicv2: add an IPI test
  arm/arm64: gicv3: add an IPI test
  arm/arm64: gic: don't just use zero

 arm/Makefile.common        |   7 +-
 arm/gic.c                  | 381 +++++++++++++++++++++++++++++++++++++++++++++
 arm/run                    |  19 ++-
 arm/selftest.c             |   5 +-
 arm/unittests.cfg          |  13 ++
 lib/arm/asm/arch_gicv3.h   | 184 ++++++++++++++++++++++
 lib/arm/asm/gic-v2.h       |  74 +++++++++
 lib/arm/asm/gic-v3.h       | 321 ++++++++++++++++++++++++++++++++++++++
 lib/arm/asm/gic.h          |  21 +++
 lib/arm/asm/processor.h    |  38 ++++-
 lib/arm/asm/setup.h        |   4 +-
 lib/arm/gic.c              | 142 +++++++++++++++++
 lib/arm/processor.c        |  15 ++
 lib/arm/setup.c            |  12 +-
 lib/arm64/asm/arch_gicv3.h | 169 ++++++++++++++++++++
 lib/arm64/asm/gic-v2.h     |   1 +
 lib/arm64/asm/gic-v3.h     |   1 +
 lib/arm64/asm/gic.h        |   1 +
 lib/arm64/asm/processor.h  |  53 ++++++-
 lib/arm64/asm/sysreg.h     |  44 ++++++
 lib/arm64/processor.c      |  15 ++
 lib/libcflat.h             |   4 +-
 22 files changed, 1498 insertions(+), 26 deletions(-)
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
2.4.11
