Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 91sm171174498wrp.3.2019.08.05.06.02.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 06:02:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 65BD01FF87;
	Mon,  5 Aug 2019 14:02:26 +0100 (BST)
References: <20190803184800.8221-1-richard.henderson@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: Re: [PATCH v3 00/34] target/arm: Implement ARMv8.1-VHE
In-reply-to: <20190803184800.8221-1-richard.henderson@linaro.org>
Date: Mon, 05 Aug 2019 14:02:26 +0100
Message-ID: <8736ifkbod.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: khvsQ604wtG4


Richard Henderson <richard.henderson@linaro.org> writes:

> About half of this patch set is cleanup of the qemu tlb handling
> leading up to the actual implementation of VHE, and the biggest
> piece of that: The EL2&0 translation regime.
>
> Changes since v2:
>   * arm_mmu_idx was incomplete; test TGE+E2H not just E2H.
>   * arm_sctlr was incomplete; now uses arm_mmu_idx to avoid
>     duplication of tests.
>   * Update aa64_zva_access and ctr_el0_access for EL2.
>
> Changes since v1:
>   * Merge feedback from AJB.
>   * Split out 7 renaming patches from "Reorganize ARMMMUIdx".
>   * Alex's MIDR patch keeps the nested KVM from spitting warnings.
>
> I have tested
>
>   qemu-system-aarch64 -accel kvm -cpu host -M virt,gic-version-host \
>     -m 512 -bios /usr/share/edk2/aarch64/QEMU_EFI.fd -nographic

So testing with a host doing:

  ./aarch64-softmmu/qemu-system-aarch64 -machine type=3Dvirt,virtualization=
=3Don -cpu cortex-a57 -serial mon:stdio -nic user,model=3Dvirtio-net-pci,ho=
stfwd=3Dtcp::2222-:22 -device virtio-scsi-pci -drive file=3D/dev/zvol/hackp=
ool-0/debian-buster-arm64,id=3Dhd0,index=3D0,if=3Dnone,format=3Draw,discard=
=3Don -device scsi-hd,drive=3Dhd0 -kernel ../linux.git/builds/arm64/arch/ar=
m64/boot/Image -append "console=3DttyAMA0 root=3D/dev/sda2" -display none -=
m 4096 -smp 8

And a guest doing:

  ./aarch64-softmmu/qemu-system-aarch64 -machine type=3Dvirt -cpu host
  -serial mon:stdio -nic user,model=3Dvirtio-net-pci -device
  virtio-scsi-pci -kernel /boot/vmlinuz-4.19.0-5-arm64 -append "console=3Dt=
tyAMA0 panic=3D-1" -display none -m 256 -smp 4 --no-reboot
  --enable-kvm

I triggered:

  ERROR:/home/alex.bennee/lsrc/qemu.git/target/arm/helper.c:3436:update_lpa=
e_el1_asid: code should not be reached
fish: =E2=80=9C./aarch64-softmmu/qemu-system-a=E2=80=A6=E2=80=9D terminated=
 by signal SIGABRT (Abort)

With -cpu max on the host it hangs the whole thing. I'm going to
continue to experiment with explicit GIC versions.

>
> with fedora 30 system qemu, itself booted with
>
>   ../bld/aarch64-softmmu/qemu-system-aarch64 \
>     -cpu max -M virt,gic-version=3D3,virtualization=3Don \
>     -drive if=3Dvirtio,file=3D./f30.q,format=3Dqcow2 \
>     -m 4G -nographic
>
> It took a while, but eventually the nested bios arrived at the
> pxe boot sequence.  Thankfully (?), the f30 shipped bios has
> debug enabled, so there's some sense of progress in the meantime.
>
>
> r~
>
>
> Alex Benn=C3=A9e (2):
>   target/arm: check TGE and E2H flags for EL0 pauth traps
>   target/arm: generate a custom MIDR for -cpu max
>
> Richard Henderson (32):
>   cputlb: Add tlb_set_asid_for_mmuidx
>   cputlb: Add tlb_flush_asid_by_mmuidx and friends
>   target/arm: Install ASIDs for long-form from EL1
>   target/arm: Install ASIDs for short-form from EL1
>   target/arm: Install ASIDs for EL2
>   target/arm: Define isar_feature_aa64_vh
>   target/arm: Enable HCR_E2H for VHE
>   target/arm: Add CONTEXTIDR_EL2
>   target/arm: Add TTBR1_EL2
>   target/arm: Update CNTVCT_EL0 for VHE
>   target/arm: Add the hypervisor virtual counter
>   target/arm: Add VHE system register redirection and aliasing
>   target/arm: Split out vae1_tlbmask, vmalle1_tlbmask
>   target/arm: Simplify tlb_force_broadcast alternatives
>   target/arm: Rename ARMMMUIdx*_S12NSE* to ARMMMUIdx*_E10_*
>   target/arm: Rename ARMMMUIdx_S2NS to ARMMMUIdx_Stage2
>   target/arm: Rename ARMMMUIdx_S1NSE* to ARMMMUIdx_Stage1_E*
>   target/arm: Rename ARMMMUIdx_S1SE* to ARMMMUIdx_SE*
>   target/arm: Rename ARMMMUIdx*_S1E3 to ARMMMUIdx*_SE3
>   target/arm: Rename ARMMMUIdx_S1E2 to ARMMMUIdx_E2
>   target/arm: Reorganize ARMMMUIdx
>   target/arm: Add regime_has_2_ranges
>   target/arm: Update arm_mmu_idx for VHE
>   target/arm: Update arm_sctlr for VHE
>   target/arm: Update aa64_zva_access for EL2
>   target/arm: Update ctr_el0_access for EL2
>   target/arm: Install asids for E2&0 translation regime
>   target/arm: Flush tlbs for E2&0 translation regime
>   target/arm: Update arm_phys_excp_target_el for TGE
>   target/arm: Update regime_is_user for EL2&0
>   target/arm: Update {fp,sve}_exception_el for VHE
>   target/arm: Enable ARMv8.1-VHE in -cpu max
>
>  include/exec/cpu-all.h     |   11 +
>  include/exec/cpu-defs.h    |    2 +
>  include/exec/exec-all.h    |   35 ++
>  include/qom/cpu.h          |    2 +
>  target/arm/cpu-qom.h       |    1 +
>  target/arm/cpu.h           |  261 ++++-----
>  target/arm/internals.h     |   62 ++-
>  target/arm/translate.h     |    2 +-
>  accel/tcg/cputlb.c         |   81 +++
>  target/arm/cpu.c           |    2 +
>  target/arm/cpu64.c         |   20 +
>  target/arm/debug_helper.c  |   50 +-
>  target/arm/helper-a64.c    |    2 +-
>  target/arm/helper.c        | 1042 +++++++++++++++++++++++++-----------
>  target/arm/m_helper.c      |    6 +-
>  target/arm/pauth_helper.c  |   13 +-
>  target/arm/translate-a64.c |   13 +-
>  target/arm/translate.c     |   17 +-
>  18 files changed, 1134 insertions(+), 488 deletions(-)


--
Alex Benn=C3=A9e
