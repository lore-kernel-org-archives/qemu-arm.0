Received: by 10.25.150.194 with SMTP id y185csp897953lfd;
        Thu, 10 Nov 2016 08:51:57 -0800 (PST)
X-Received: by 10.28.216.9 with SMTP id p9mr7453164wmg.11.1478796716946;
        Thu, 10 Nov 2016 08:51:56 -0800 (PST)
Return-Path: <andre.przywara@arm.com>
Received: from cam-admin0.cambridge.arm.com (cam-admin0.cambridge.arm.com. [217.140.96.50])
        by mx.google.com with ESMTP id h10si6133845wjv.68.2016.11.10.08.51.56;
        Thu, 10 Nov 2016 08:51:56 -0800 (PST)
Received-SPF: pass (google.com: domain of andre.przywara@arm.com designates 217.140.96.50 as permitted sender) client-ip=217.140.96.50;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of andre.przywara@arm.com designates 217.140.96.50 as permitted sender) smtp.mailfrom=andre.przywara@arm.com
Received: from [192.168.67.35] ([10.1.207.46])
	by cam-admin0.cambridge.arm.com (8.12.6/8.12.6) with ESMTP id uAAGptWr028592;
	Thu, 10 Nov 2016 16:51:55 GMT
Subject: Re: [kvm-unit-tests PATCH v4 00/11] arm/arm64: add gic framework
To: Andrew Jones <drjones@redhat.com>, kvm@vger.kernel.org,
   kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <1478794084-5273-1-git-send-email-drjones@redhat.com>
Cc: pbonzini@redhat.com, peter.maydell@linaro.org, alex.bennee@linaro.org,
   marc.zyngier@arm.com, eric.auger@redhat.com, christoffer.dall@linaro.org
From: Andre Przywara <andre.przywara@arm.com>
Organization: ARM Ltd.
Message-ID: <77355b5b-9e26-16f9-4243-e11ef4d4c8ce@arm.com>
Date: Thu, 10 Nov 2016 16:52:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1478794084-5273-1-git-send-email-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-TUID: emanmyX4kLCm

Hi,

so is this actually v4 just resent?
Or is this is a new version with s/5/4/?
I can't spot any of the key changes quickly ...

Cheers,
Andre.

On 10/11/16 16:07, Andrew Jones wrote:
> v4:
>  - Eric's r-b's
>  - Andre's suggestion to only take defines we need
>  - several other changes listed in individual patches
> 
> v3:
>  - Rebased on latest master
>  - Added Alex's r-b's
> 
> v2:
>  Rebased on latest master + my "populate argv[0]" series (will
>  send a REPOST for that shortly. Additionally a few patches got
>  fixes/features;
>  07/10 got same fix as kernel 7c9b973061 "irqchip/gic-v3: Configure
>        all interrupts as non-secure Group-1" in order to continue
>        working over TCG, as the gicv3 code for TCG removed a hack
>        it had there to make Linux happy.
>  08/10 added more output for when things fail (if they fail)
>  09/10 switched gicv3 broadcast implementation to using IRM. This
>        found a bug in a recent (but not tip) kernel, which I was
>        about to fix, but then I saw MarcZ beat me to it.
>  10/10 actually check that the input irq is the received irq
> 
> 
> Import defines, and steal enough helper functions, from Linux to
> enable programming of the gic (v2 and v3). Then use the framework
> to add an initial test (an ipi test; self, target-list, broadcast).
> 
> It's my hope that this framework will be a suitable base on which
> more tests may be easily added, particularly because we have
> vgic-new and tcg gicv3 emulation getting close to merge. (v3 UPDATE:
> vgic-new and tcg gicv3 are merged now)
> 
> To run it, along with other tests, just do
> 
>  ./configure [ --arch=[arm|arm64] --cross-prefix=$PREFIX ]
>  make
>  export QEMU=$PATH_TO_QEMU
>  ./run_tests.sh
> 
> To run it separately do, e.g.
> 
> $QEMU -machine virt,accel=tcg -cpu cortex-a57 \
>  -device virtio-serial-device \
>  -device virtconsole,chardev=ctd -chardev testdev,id=ctd \
>  -display none -serial stdio \
>  -kernel arm/gic.flat \
>  -smp 123 -machine gic-version=3 -append ipi
>       ^^ note, we can go nuts with nr-cpus on TCG :-)
> 
> Or, a KVM example using a different "sender" cpu and irq (other than zero)
> 
> $QEMU -machine virt,accel=kvm -cpu host \
>  -device virtio-serial-device \
>  -device virtconsole,chardev=ctd -chardev testdev,id=ctd \
>  -display none -serial stdio \
>  -kernel arm/gic.flat \
>  -smp 48 -machine gic-version=3 -append 'ipi sender=42 irq=1'
> 
> 
> Patches:
> 01-05: fixes and functionality needed by the later gic patches
> 06-07: enable gicv2 and gicv2 IPI test
> 08-10: enable gicv3 and gicv3 IPI test
>    11: extend the IPI tests to take variable sender and irq
> 
> Available here: https://github.com/rhdrjones/kvm-unit-tests/commits/arm/gic-v4
> 
> 
> Andrew Jones (10):
>   lib: xstr: allow multiple args
>   arm64: fix get_"sysreg32" and make MPIDR 64bit
>   arm/arm64: smp: support more than 8 cpus
>   arm/arm64: add some delay routines
>   arm/arm64: irq enable/disable
>   arm/arm64: add initial gicv2 support
>   arm/arm64: gicv2: add an IPI test
>   arm/arm64: add initial gicv3 support
>   arm/arm64: gicv3: add an IPI test
>   arm/arm64: gic: don't just use zero
> 
> Peter Xu (1):
>   libcflat: add IS_ALIGNED() macro, and page sizes
> 
>  arm/Makefile.common        |   7 +-
>  arm/gic.c                  | 417 +++++++++++++++++++++++++++++++++++++++++++++
>  arm/run                    |  19 ++-
>  arm/selftest.c             |   5 +-
>  arm/unittests.cfg          |  13 ++
>  lib/arm/asm/arch_gicv3.h   |  65 +++++++
>  lib/arm/asm/gic-v2.h       |  28 +++
>  lib/arm/asm/gic-v3.h       |  92 ++++++++++
>  lib/arm/asm/gic.h          |  51 ++++++
>  lib/arm/asm/processor.h    |  38 ++++-
>  lib/arm/asm/setup.h        |   4 +-
>  lib/arm/gic.c              | 131 ++++++++++++++
>  lib/arm/processor.c        |  15 ++
>  lib/arm/setup.c            |  12 +-
>  lib/arm64/asm/arch_gicv3.h |  66 +++++++
>  lib/arm64/asm/gic-v2.h     |   1 +
>  lib/arm64/asm/gic-v3.h     |   1 +
>  lib/arm64/asm/gic.h        |   1 +
>  lib/arm64/asm/processor.h  |  53 +++++-
>  lib/arm64/asm/sysreg.h     |  44 +++++
>  lib/arm64/processor.c      |  15 ++
>  lib/libcflat.h             |  10 +-
>  22 files changed, 1062 insertions(+), 26 deletions(-)
>  create mode 100644 arm/gic.c
>  create mode 100644 lib/arm/asm/arch_gicv3.h
>  create mode 100644 lib/arm/asm/gic-v2.h
>  create mode 100644 lib/arm/asm/gic-v3.h
>  create mode 100644 lib/arm/asm/gic.h
>  create mode 100644 lib/arm/gic.c
>  create mode 100644 lib/arm64/asm/arch_gicv3.h
>  create mode 100644 lib/arm64/asm/gic-v2.h
>  create mode 100644 lib/arm64/asm/gic-v3.h
>  create mode 100644 lib/arm64/asm/gic.h
>  create mode 100644 lib/arm64/asm/sysreg.h
> 
