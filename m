Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id k10sm17321663wrz.113.2022.01.18.09.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 09:42:12 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BC1B01FFB7;
	Tue, 18 Jan 2022 17:42:11 +0000 (GMT)
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Shashi Mallela <shashi.mallela@linaro.org>,
 Andrew Jones <drjones@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Andre.przywara@arm.com
Subject: Re: [PATCH v2 00/13] arm gicv3 ITS: Various bug fixes and refactorings
Date: Tue, 18 Jan 2022 17:37:23 +0000
In-reply-to: <20220111171048.3545974-1-peter.maydell@linaro.org>
Message-ID: <87pmop7xfw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: aw8tkz+Kys+E


Peter Maydell <peter.maydell@linaro.org> writes:

> I've been working on the ITS to add support for the GICv4 functionality.
> In the course of that I found a handful of bugs in it and also some
> places where the code benefited from refactoring to make it a better
> base to put in the GICv4 parts. This patchset is just the bugfixes
> and cleanups, because there are enough patches here that I figured it
> made sense to send them out now rather than holding on to them.
>
> Most of these patches were in v1 and have been reviewed already.

I've reviewed the patches and they look good to me. kvm-unit-tests is
still failing some tests but the ones it fails hasn't changed from
before this patch:

  =E2=9C=97  env QEMU=3D$HOME/lsrc/qemu.git/builds/arm.all/qemu-system-aarc=
h64 ./run_tests.sh -g gic
  PASS gicv2-ipi (3 tests)
  PASS gicv2-mmio (17 tests, 1 skipped)
  FAIL gicv2-mmio-up (17 tests, 2 unexpected failures)
  FAIL gicv2-mmio-3p (17 tests, 3 unexpected failures)
  PASS gicv3-ipi (3 tests)
  PASS gicv2-active (1 tests)
  PASS gicv3-active (1 tests)

That said running with -d unimp,guest_errors there are some things that
should probably be double checked, e.g.:

  /home/alex/lsrc/qemu.git/builds/arm.all/qemu-system-aarch64 -nodefaults -=
machine virt -accel tcg -cpu cortex-a57 -device virtio-serial-device -devic=
e virtconsole,chardev=3D
  ctd -chardev testdev,id=3Dctd -device pci-testdev -display none -serial s=
tdio -kernel arm/gic.flat -machine gic-version=3D2 -smp 1 -append "mmio" -d=
 unimp,guest_errors
  PASS: gicv2: mmio: all CPUs have interrupts
  gic_dist_readb: Bad offset 8=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_readb: Bad offset 9=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_readb: Bad offset a=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_readb: Bad offset b=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  INFO: gicv2: mmio: IIDR: 0x00000000=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_writeb: Bad offset 4=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_writeb: Bad offset 5=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_writeb: Bad offset 6=20
  gic_dist_writeb: Bad offset 7=20
  gic_dist_writeb: Bad offset 4=20
  gic_dist_writeb: Bad offset 5=20
  gic_dist_writeb: Bad offset 6=20=20
  gic_dist_writeb: Bad offset 7=20=20
  gic_dist_writeb: Bad offset 4=20=20
  gic_dist_writeb: Bad offset 5=20=20
  gic_dist_writeb: Bad offset 6=20
  gic_dist_writeb: Bad offset 7=20
  PASS: gicv2: mmio: GICD_TYPER is read-only
  gic_dist_readb: Bad offset 8=20=20
  gic_dist_readb: Bad offset 9=20=20=20
  gic_dist_readb: Bad offset a=20=20=20
  gic_dist_readb: Bad offset b=20=20=20
  gic_dist_writeb: Bad offset 8=20=20
  gic_dist_writeb: Bad offset 9=20
  gic_dist_writeb: Bad offset a=20
  gic_dist_writeb: Bad offset b=20
  gic_dist_readb: Bad offset 8=20=20
  gic_dist_readb: Bad offset 9=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_readb: Bad offset a=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_readb: Bad offset b=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_writeb: Bad offset 8=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_writeb: Bad offset 9=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_writeb: Bad offset a=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_writeb: Bad offset b=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_readb: Bad offset 8=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_readb: Bad offset 9=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_readb: Bad offset a=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_readb: Bad offset b=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20
  PASS: gicv2: mmio: GICD_IIDR is read-only=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
  gic_dist_writeb: Bad offset fe8=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_writeb: Bad offset fe9=20=20=20=20=20=20=20=20=20
  gic_dist_writeb: Bad offset fea
  gic_dist_writeb: Bad offset feb
  gic_dist_writeb: Bad offset fe8
  gic_dist_writeb: Bad offset fe9
  gic_dist_writeb: Bad offset fea
  gic_dist_writeb: Bad offset feb
  gic_dist_writeb: Bad offset fe8
  gic_dist_writeb: Bad offset fe9
  gic_dist_writeb: Bad offset fea
  gic_dist_writeb: Bad offset feb
  PASS: gicv2: mmio: ICPIDR2 is read-only
  INFO: gicv2: mmio: value of ICPIDR2: 0x0000002b
  PASS: gicv2: mmio: IPRIORITYR: consistent priority masking
  INFO: gicv2: mmio: IPRIORITYR: priority mask is 0xffffffff
  PASS: gicv2: mmio: IPRIORITYR: implements at least 4 priority bits
  INFO: gicv2: mmio: IPRIORITYR: 8 priority bits implemented
  PASS: gicv2: mmio: IPRIORITYR: clearing priorities
  gic_dist_readb: Bad offset 520
  gic_dist_readb: Bad offset 521
  gic_dist_readb: Bad offset 522
  gic_dist_readb: Bad offset 523
  gic_dist_writeb: Bad offset 520
  gic_dist_writeb: Bad offset 521
  gic_dist_writeb: Bad offset 522
  gic_dist_writeb: Bad offset 523
  gic_dist_readb: Bad offset 520
  gic_dist_readb: Bad offset 521
  gic_dist_readb: Bad offset 522
  gic_dist_readb: Bad offset 523
  gic_dist_writeb: Bad offset 520
  gic_dist_writeb: Bad offset 521
  gic_dist_writeb: Bad offset 522
  gic_dist_writeb: Bad offset 523
  gic_dist_readb: Bad offset 520
  gic_dist_readb: Bad offset 521
  gic_dist_readb: Bad offset 522
  gic_dist_readb: Bad offset 523
  PASS: gicv2: mmio: IPRIORITYR: accesses beyond limit RAZ/WI
  PASS: gicv2: mmio: IPRIORITYR: accessing last SPIs
  PASS: gicv2: mmio: IPRIORITYR: priorities are preserved
  PASS: gicv2: mmio: IPRIORITYR: byte reads successful
  PASS: gicv2: mmio: IPRIORITYR: byte writes successful
  PASS: gicv2: mmio: ITARGETSR: bits for non-existent CPUs masked
  INFO: gicv2: mmio: ITARGETSR: 7 non-existent CPUs
  PASS: gicv2: mmio: ITARGETSR: accesses beyond limit RAZ/WI
  FAIL: gicv2: mmio: ITARGETSR: register content preserved
  INFO: gicv2: mmio: ITARGETSR: writing 01010001 reads back as 00000000
  PASS: gicv2: mmio: ITARGETSR: byte reads successful
  FAIL: gicv2: mmio: ITARGETSR: byte writes successful
  INFO: gicv2: mmio: ITARGETSR: writing 0x1f into bytes 2 =3D> 0x00000000
  SUMMARY: 17 tests, 2 unexpected failures


>
> Changes from v1:
>  * first half of the series is now upstream
>  * patch 1 now has the '1ULL' and uint64_t fixes that were
>    partly split across two patches in the old series and partly missing
>  * new patches 12 and 13
>
> NB: I left the returns of -1 in patch 11.
>
> Patches still needing review: 1, 12, 13
>
> thanks
> -- PMM
>
> Peter Maydell (13):
>   hw/intc/arm_gicv3_its: Fix event ID bounds checks
>   hw/intc/arm_gicv3_its: Convert int ID check to num_intids convention
>   hw/intc/arm_gicv3_its: Fix handling of process_its_cmd() return value
>   hw/intc/arm_gicv3_its: Don't use data if reading command failed
>   hw/intc/arm_gicv3_its: Use enum for return value of process_*
>     functions
>   hw/intc/arm_gicv3_its: Fix return codes in process_its_cmd()
>   hw/intc/arm_gicv3_its: Refactor process_its_cmd() to reduce nesting
>   hw/intc/arm_gicv3_its: Fix return codes in process_mapti()
>   hw/intc/arm_gicv3_its: Fix return codes in process_mapc()
>   hw/intc/arm_gicv3_its: Fix return codes in process_mapd()
>   hw/intc/arm_gicv3_its: Factor out "find address of table entry" code
>   hw/intc/arm_gicv3_its: Check indexes before use, not after
>   hw/intc/arm_gicv3_its: Range-check ICID before indexing into
>     collection table
>
>  hw/intc/arm_gicv3_its.c | 492 ++++++++++++++++++----------------------
>  1 file changed, 225 insertions(+), 267 deletions(-)


--=20
Alex Benn=C3=A9e
