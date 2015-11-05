Received: by 10.182.105.169 with SMTP id gn9csp619098obb;
        Thu, 5 Nov 2015 10:16:25 -0800 (PST)
X-Received: by 10.28.87.67 with SMTP id l64mr5194072wmb.72.1446747372238;
        Thu, 05 Nov 2015 10:16:12 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id uz5si9489234wjc.199.2015.11.05.10.16.11
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Thu, 05 Nov 2015 10:16:12 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZuP4o-0004kF-Sd; Thu, 05 Nov 2015 18:15:58 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: [PATCH 00/16] Add support for multiple address spaces per CPU and use it for ARM TrustZone
Date: Thu,  5 Nov 2015 18:15:42 +0000
Message-Id: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-TUID: sDAvZHl2qfXw

This patch series adds support to QEMU's core exec/memory code for
CPUs which have more than one address space, and uses it for
ARM TrustZone. In particular, a TZ CPU will have two physical
address spaces (Secure and Non-secure), and the patchset allows a
board model to create these both separately and connect them to
the CPU, so that we can have devices or memory which are visible
only in the Secure address space. (We already have support for
TZ in the CPU emulation itself, and support for devices like the
GIC which respond differently to Secure and Non-secure accesses,
so this is the last part of the puzzle for 32-bit.)

The general approach is that we allow a target-* cpu to define
more than one address space at initialization, allocating each
one a small integer "address space index" (asidx). The asidx
can then be specified when filling a TLB entry via tlb_set_page_with_attrs
and is used to look up the memory region in the appropriate AS.
The asidx is also stored in the iotlb, since for MMIO we need it at
the io_read/write stage when we call iotlb_to_region().
The first 8 or so patches implement the handling of this in core code.

Patches 9 and 10 are the target-arm specific code for multiple
AS support (passing back asidxes in the right places, and using
the correct AS when doing direct physical loads and stores from
target-specific code).

Patch 11 is Peter Crosthwaite's "share AddressSpaces if they're really
rooted on the same memory region" patch, though I have made some
changes to it (notably, not checking the debug-name when checking if
we can share an AS, and fixing a use-after-free bug). I think it
makes sense but I'd appreciate review from Paolo here in particular.

Patches 12 and 13 add new QOM properties to the base CPU object
and to ARM CPU objects for 'memory' and 'secure-memory' so the
board code can pass the AddressSpaces in. I'd quite like to see
us end up with a consistent naming scheme for all bus masters
(eg "should all be foo-memory" or something), rather than just
naming the properties based on random whim or whatever the hardware
calls the bus. Better naming proposals welcome.

Patches 14, 15 and 16 are changes to the 'virt' board. 14 is trivial.
15 adds a secure address space and a secure-only UART if the board
is started with '-machine secure=on'. It's marked RFC mostly because
the device tree binding to say "device is secure-only" is still
under discussion on the kernel mailing list. Patch 16 is a pure
hack, and is here for testing purposes only.

You can run OP-TEE on QEMU with these patches:
see https://github.com/OP-TEE/optee_os for details of how to
get, build and run it. The 'make run' will use the custom QEMU
version that comes with OP-TEE (do that first to make sure your
OP-TEE has built and works ok). To get it to use a locally built QEMU
with these patches do:

make run-only QEMU_PATH=/path/to/your/qemu/build/directory QEMU_EXTRA_ARGS='-machine secure=on'

Notes on a couple of things the patchset doesn't address:
 (1) image/romfile/kernel loading etc will load only into the nonsecure
address space. This would be conceptually simple to implement (you just
need to pass an AS into lots of functions) but since OP-TEE doesn't need
it I felt it could safely be left for later rather than making this
patchset bigger.

 (2) Using multiple address spaces in one CPU won't work with KVM
(and we assert if you try; nothing at the moment will attempt it).
Using different address spaces in different CPUs in an SMP setup
will also not work with KVM, but we don't assert on that because
I wasn't sure where best to put the assert. (Also, it would be
nice if we could do that, because the modelling for ARM SMP
setups would really be cleaner if we could put the per-CPU
devices and so on in a set of per-CPU ASes.)

You can find a git branch with this patchset in here:
 https://git.linaro.org/people/peter.maydell/qemu-arm.git multi-ases

thanks
-- PMM


Peter Crosthwaite (2):
  memory: Add address_space_init_shareable()
  qom/cpu: Add MemoryRegion property

Peter Maydell (14):
  exec.c: Don't set cpu->as until cpu_address_space_init
  exec.c: Allow target CPUs to define multiple AddressSpaces
  tlb_set_page_with_attrs: Take argument specifying AddressSpace to use
  exec.c: Add address space index to CPUIOTLBEntry
  exec.c: Add cpu_get_address_space()
  include/qom/cpu.h: Add new get_phys_page_asidx_debug method
  exec.c: Use cpu_get_phys_page_asidx_debug
  exec.c: Have one io_mem_watch per AddressSpace
  target-arm: Support multiple address spaces in page table walks
  target-arm: Implement cpu_get_phys_page_asidx_debug
  target-arm: Add QOM property for Secure memory region
  hw/arm/virt: Wire up memory region to CPUs explicitly
  [RFC] hw/arm/virt: add secure memory region and UART
  HACK: rearrange the virt memory map to suit OP-TEE

 cpus.c                  |  12 ++++-
 cputlb.c                |  13 +++--
 exec.c                  | 125 +++++++++++++++++++++++++++++++++---------------
 hw/arm/virt.c           |  66 ++++++++++++++++++++-----
 include/exec/cpu-defs.h |   1 +
 include/exec/exec-all.h |  60 +++++++++++++++++++++--
 include/exec/memory.h   |  20 ++++++++
 include/hw/arm/virt.h   |   1 +
 include/qom/cpu.h       |  37 +++++++++++++-
 memory.c                |  27 +++++++++++
 softmmu_template.h      |   4 +-
 target-arm/cpu-qom.h    |   5 +-
 target-arm/cpu.c        |  28 ++++++++++-
 target-arm/cpu.h        |  29 +++++++++++
 target-arm/helper.c     |  13 +++--
 target-i386/cpu.c       |   6 ++-
 target-i386/helper.c    |   2 +-
 17 files changed, 374 insertions(+), 75 deletions(-)

-- 
1.9.1
