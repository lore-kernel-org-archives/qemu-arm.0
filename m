Received: by 10.182.158.201 with SMTP id ww9csp119053obb;
        Mon, 16 Nov 2015 06:05:34 -0800 (PST)
X-Received: by 10.28.125.73 with SMTP id y70mr16733840wmc.95.1447682729477;
        Mon, 16 Nov 2015 06:05:29 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id z131si25900912wme.44.2015.11.16.06.05.28
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 16 Nov 2015 06:05:29 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZyKPL-00012c-7M; Mon, 16 Nov 2015 14:05:23 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: [PATCH v2 00/19] Add support for multiple address spaces per CPU and use it for ARM TrustZone
Date: Mon, 16 Nov 2015 14:05:04 +0000
Message-Id: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-TUID: joxP+ZQNRtm2

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
one a small integer "address space index" (asidx). The target CPU
also defines the mapping from memory transaction attributes to
the asidx via a new QOM CPU method asidx_from_attrs. The memory
and cputlb core code then use the asidx to look up memory regions
in the correct AddressSpace (both at TLB fill time and in the
io_read/write stage at runtime).

Changes since v1:
 * the biggest change is that rather than having the target-cpu
   code pass us an asidx and storing asidxes in the IOTLB, we
   now determine the address space index from the memory transaction
   attributes. This has had effects all through the patchstack.
 * some reshuffling of patch order (among other things, all the
   core patches are now at the front, with the target-arm patches
   next and the virt board last).
 * added missing object_ref(OBJECT(cpu->memory)) when setting the
   default value of cpu->memory
 * don't allow sharing of ASes that weren't created via
   address_space_init_shareable
 * now only allocate cpu_ases array once (target has to set
   cpu->num_ases before first call to cpu_address_space_init())
 * new patch documenting tlb_set_page_with_attrs -- I no longer need
   to add a new argument to this function, but didn't want to throw
   away the doc comment I'd written...

The 'add secure memory region to virt board' patch is still RFC
because the device tree binding to say "device is secure-only" is
still under discussion on the kernel mailing list; patch 19
is a pure hack, and is here for testing purposes only.

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

Peter Maydell (17):
  exec.c: Don't set cpu->as until cpu_address_space_init
  exec.c: Allow target CPUs to define multiple AddressSpaces
  exec-all.h: Document tlb_set_page_with_attrs, tlb_set_page
  include/qom/cpu.h: Add new get_phys_page_attrs_debug method
  include/qom/cpu.h: Add new asidx_from_attrs method
  cputlb.c: Use correct address space when looking up
    MemoryRegionSection
  exec.c: Pass MemTxAttrs to iotlb_to_region so it uses the right AS
  exec.c: Add cpu_get_address_space()
  exec.c: Use cpu_get_phys_page_attrs_debug
  exec.c: Use correct AddressSpace in watch_mem_read and watch_mem_write
  target-arm: Add QOM property for Secure memory region
  target-arm: Implement asidx_from_attrs
  target-arm: Implement cpu_get_phys_page_attrs_debug
  target-arm: Support multiple address spaces in page table walks
  hw/arm/virt: Wire up memory region to CPUs explicitly
  [RFC] hw/arm/virt: add secure memory region and UART
  HACK: rearrange the virt memory map to suit OP-TEE

 cpus.c                  |  13 +++++-
 cputlb.c                |   9 +++--
 exec.c                  | 103 +++++++++++++++++++++++++++++++++++-------------
 hw/arm/virt.c           |  66 +++++++++++++++++++++++++------
 include/exec/exec-all.h |  69 ++++++++++++++++++++++++++++----
 include/exec/memory.h   |  18 +++++++++
 include/hw/arm/virt.h   |   1 +
 include/qom/cpu.h       |  57 ++++++++++++++++++++++++++-
 memory.c                |  27 +++++++++++++
 softmmu_template.h      |   4 +-
 target-arm/cpu-qom.h    |   6 ++-
 target-arm/cpu.c        |  35 +++++++++++++++-
 target-arm/cpu.h        |  23 +++++++++++
 target-arm/helper.c     |  15 ++++---
 target-i386/cpu.c       |   7 +++-
 15 files changed, 389 insertions(+), 64 deletions(-)

-- 
1.9.1
