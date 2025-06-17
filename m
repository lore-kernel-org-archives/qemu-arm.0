Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e232e4asm178681425e9.11.2025.06.17.09.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:33:52 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id DB2275F834;
	Tue, 17 Jun 2025 17:33:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
	qemu-arm@nongnu.org,
	Mark Burton <mburton@qti.qualcomm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 00/11] kvm/arm: trap-me-harder implementation
Date: Tue, 17 Jun 2025 17:33:40 +0100
Message-ID: <20250617163351.2640572-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: JjAy7aoRWuLQ

The following is an RFC to explore how KVM would look if we forwarded
almost all traps back to QEMU to deal with.

Why - won't it be horribly slow?
--------------------------------

Maybe, that's why its an RFC.

Traditionally KVM tries to avoid full vmexit's to QEMU because the
additional context switches add to the latency of servicing requests.
For things like the GIC where latency really matters the normal KVM
approach is to implement it in the kernel and then just leave QEMU to
handling state saving and migration matters.

Where we have to exit, for example for device emulation, platforms
like VirtIO try really hard minimise the number of times we exit for
any data transfer.

However hypervisors can't virtualise everything and for some QEMU
use-cases you might want to run the full software stack (firmware,
hypervisor et all). This is the idea for the proposed SplitAccel where
EL1/EL0 are run under a hypervisor and EL2+ get run under TCG's
emulation. For this to work QEMU needs to be aware of the whole system
state and have full control over anything that is virtualised by the
hypervisor. We have an initial PoC for SplitAccel that works with
HVF's much simpler programming model.

This series is a precursor to implementing a SplitAccel for KVM and
investigates how hacky it might look.

Kernel
------

For this to work you need a modified kernel. You can find my tree
here:

  https://git.linaro.org/plugins/gitiles/people/alex.bennee/linux/+/refs/heads/kvm/trap-me-harder

I will be posting the kernel patches to LKML in due course but the
changes are pretty simple. We add a new creation flag
(KVM_VM_TYPE_ARM_TRAP_ALL) that when activated implement an
alternative table in KVM's handle_exit() code.

The ESR_ELx_EC_IABT_LOW/ESR_ELx_EC_DABT_LOW exceptions are still
handled by KVM as the kernel general has to deal with paging in the
required memory. I've also left the debug exceptions to be processed
in KVM as the handling of pstate gets tricky and takes care when
re-entering the guest.

Everything else exits with a new exit reason called
KVM_EXIT_ARM_TRAP_HARDER when exposed the ESR_EL1 and a few other
registers so QEMU can deal with things.

QEMU Patches
------------

Patches 1-2 - minor tweaks that make debugging easier
Patch   3   - bring in the uapi headers from Kernel
Patches 4-5 - plumbing in -accel kvm,trap-harder=on
Patches 6-7 - allow creation of an out-of-kernel GIC (kernel-irqchip=off)
Patches 8-11- trap handlers for the kvm_arm_handle_hard_trap path

Testing
-------

Currently I'm testing everything inside an emulated QEMU, so the guest
host is booted with a standard Debian Trixie although I use virtiofsd to
mount my real host home inside the guest hosts home:

  ./qemu-system-aarch64 \
             -machine type=virt,virtualization=on,pflash0=rom,pflash1=efivars,gic-version=max \
             -blockdev node-name=rom,driver=file,filename=(pwd)/pc-bios/edk2-aarch64-code.fd,read-only=true \
             -blockdev node-name=efivars,driver=file,filename=$HOME/images/qemu-arm64-efivars \
             -cpu cortex-a76 \
             -m 8192 \
             -object memory-backend-memfd,id=mem,size=8G,share=on \
             -numa node,memdev=mem \
             -smp 4 \
             -accel tcg \
             -serial mon:stdio \
             -device virtio-net-pci,netdev=unet \
             -netdev user,id=unet,hostfwd=tcp::2222-:22 \
             -device virtio-scsi-pci \
             -device scsi-hd,drive=hd \
             -blockdev driver=raw,node-name=hd,file.driver=host_device,file.filename=/dev/zen-ssd2/trixie-arm64,discard=unmap \
             -kernel /home/alex/lsrc/linux.git/builds/arm64/arch/arm64/boot/Image \
             -append "root=/dev/sda2" \
             -chardev socket,id=vfs,path=/tmp/virtiofsd.sock \
             -device vhost-user-fs-pci,chardev=vfs,tag=home \
             -display none -s -S

Inside the guest host I have built QEMU with:

  ../../configure --disable-docs \
    --enable-debug-info --extra-ldflags=-gsplit-dwarf \
    --disable-tcg --disable-xen --disable-tools \
    --target-list=aarch64-softmmu

  make qemu-system-aarch64 -j(nproc)

Even with a cut down configuration this can take awhile to build under
softmmu emulation!

And finally I can boot my guest image with:

  ./qemu-system-aarch64 \
             -machine type=virt,gic-version=3 \
             -cpu host \
             -smp 1 \
             -accel kvm,kernel-irqchip=off,trap-harder=on \
             -serial mon:stdio \
             -m 4096 \
             -kernel ~/lsrc/linux.git/builds/arm64.initramfs/arch/arm64/boot/Image \
             -append "console=ttyAMA0" \
             -display none -d unimp,trace:kvm_hypercall,trace:kvm_wfx_trap

And you can witness the system slowly booting up. Currently the system
hangs before displaying the login prompt because its not being woken
up from the WFI:

  [    0.315642] Serial: AMBA PL011 UART driver
  [    0.345625] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 (irq = 13, base_baud = 0) is a PL011 rev1
  [    0.348138] printk: console [ttyAMA0] enabled
  Saving 256 bits of creditable seed for next boot
  Starting syslogd: OK
  Starting klogd: OK
  Running sysctl: OK
  Populating /dev using udev: done
  Starting system message bus: done
  Starting network: udhcpc: started, v1.37.0
  kvm_wfx_trap 0: WFI @ 0xffffffc080cf9be4

Next steps
----------

I need to figure out whats going on with the WFI failing. I also
intend to boot up my Aarch64 system and try it out on real hardware.
Then I can start looking into the actual performance and what
bottlenecks this might introduce.

Once Philippe has posted the SplitAccel RFC I can look at what it
would take to integrate this approach so we can boot a full-stack with
EL3/EL2 starting.

Alex Bennée (11):
  target/arm: allow gdb to read ARM_CP_NORAW regs (!upstream)
  target/arm: re-arrange debug_cp_reginfo
  linux-headers: Update to Linux 6.15.1 with trap-mem-harder (WIP)
  kvm: expose a trap-harder option to the command line
  target/arm: enable KVM_VM_TYPE_ARM_TRAP_ALL when asked
  kvm/arm: allow out-of kernel GICv3 to work with KVM
  target/arm: clamp value on icc_bpr_write to account for RES0 fields
  kvm/arm: plumb in a basic trap harder handler
  kvm/arm: implement sysreg trap handler
  kvm/arm: implement a basic hypercall handler
  kvm/arm: implement WFx traps for KVM

 include/standard-headers/linux/virtio_pci.h |   1 +
 include/system/kvm_int.h                    |   4 +
 linux-headers/linux/kvm.h                   |   8 +
 linux-headers/linux/vhost.h                 |   4 +-
 target/arm/kvm_arm.h                        |  17 ++
 target/arm/syndrome.h                       |   4 +
 hw/arm/virt.c                               |  18 +-
 hw/intc/arm_gicv3_common.c                  |   4 -
 hw/intc/arm_gicv3_cpuif.c                   |   5 +-
 target/arm/cpu.c                            |   2 +-
 target/arm/debug_helper.c                   |  12 +-
 target/arm/gdbstub.c                        |   6 +-
 target/arm/helper.c                         |  15 +-
 target/arm/kvm-stub.c                       |   5 +
 target/arm/kvm.c                            | 243 ++++++++++++++++++++
 hw/intc/Kconfig                             |   2 +-
 target/arm/trace-events                     |   4 +
 17 files changed, 334 insertions(+), 20 deletions(-)

-- 
2.47.2
