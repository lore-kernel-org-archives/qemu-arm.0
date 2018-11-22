Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp718649wrt;
        Thu, 22 Nov 2018 05:58:43 -0800 (PST)
X-Google-Smtp-Source: AJdET5fcxjaZMuKSUSdcQqtegPyt+7Rwxho/JDzYmjZQEh0H+DsSNQLKtl1b5iO90yGJQQa+XtlH
X-Received: by 2002:a0d:f7c3:: with SMTP id h186-v6mr11056530ywf.449.1542895123736;
        Thu, 22 Nov 2018 05:58:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542895123; cv=none;
        d=google.com; s=arc-20160816;
        b=Fwk2BCn3I5EVZtvMlpzpL77LlFxJ8rNYYY4vPsD5cfsHFGRDSHFYxDPTx+zjYATutN
         hJJ/+tigqu/tvnCtc88+swyj3icGhCnG6EhRausGaeSbUVjx1VVv0UUYw/Ghl3qkgptF
         MjwDrRmot/DTHYuqnhB0mHK/KC92tlLpnLrmkNt3tBhYeM7WtaWRnJ9VGYF9q/pDpGQZ
         HFa46JiyuDaJx6aQNWHhidkHh1wdB5I72E4BFCcgXeSlJvuCM/ewqTxMBp4iLql7QQC4
         H66blbh4P++uuW5AKJliHB8zd7GaZSWMAOXU38WZYcQczwwZ8EfI494En1LF1SIgmLO/
         kF+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=NP/WSxPbU9EjvhBnya4S4sosh/b4qDv5R0TIxB4DNGg=;
        b=Mg7VFzYBAH9dmDkdHLbEflo85uvj+N21zVuOZJTtgQUON7ouX8n7jzJVNTWOuRemKU
         22VyAvOH+Wk5KeuF1YlZZm9vhVWmCRYomBupFCyoRMhuNeKCGP/Eu6pgNhII/jkdeuOf
         IRoLyQN1UW3dKdM6J+IJDnmtrBywjyqvrEE0wRViURYlU9y1+XQD5dlDJq++YcrB97g1
         XpuCz+a7hALOsu6tSbw6gBlK272a7tJ1Ve1yCnefGGFURUNk4gil0hQ5k6P4hIgC+ow3
         MhqHl+yPXdjcBxcnP9Si4PyALlmJx6OvmYuiCECngEYth3VmgtBWQ6tgXJCXvEB9VPxl
         XD3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q62si2894698ywb.137.2018.11.22.05.58.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Nov 2018 05:58:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46743 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPpVD-0000qG-8E
	for alex.bennee@linaro.org; Thu, 22 Nov 2018 08:58:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59685)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gPpV5-0000qB-1F
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 08:58:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gPpV3-00070x-19
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 08:58:34 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:52766)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gPpV2-0006wi-NK; Thu, 22 Nov 2018 08:58:32 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gPp8R-0005Ak-Rx; Thu, 22 Nov 2018 13:35:11 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 22 Nov 2018 13:35:07 +0000
Message-Id: <20181122133507.30950-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181122133507.30950-1-peter.maydell@linaro.org>
References: <20181122133507.30950-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-4.0 2/2] Rename
 cpu_physical_memory_write_rom() to address_space_write_rom()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>, patches@linaro.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tXkmTgl/Rtl6

The API of cpu_physical_memory_write_rom() is odd, because it
takes an AddressSpace, unlike all the other cpu_physical_memory_*
access functions. Rename it to address_space_write_rom(), and
bring its API into line with address_space_write().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/cpu-common.h   |  2 --
 include/exec/memory.h       | 26 ++++++++++++++++++++++++++
 exec.c                      | 14 ++++++++------
 hw/core/loader.c            |  4 ++--
 hw/intc/apic.c              |  7 ++++---
 hw/misc/tz-mpc.c            |  2 +-
 hw/sparc/sun4m.c            |  5 +++--
 docs/devel/loads-stores.rst | 35 ++++++++++++++++-------------------
 8 files changed, 60 insertions(+), 35 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 18b40d6145c..2ad2d6d86bb 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -111,8 +111,6 @@ bool cpu_physical_memory_is_io(hwaddr phys_addr);
  */
 void qemu_flush_coalesced_mmio_buffer(void);
 
-void cpu_physical_memory_write_rom(AddressSpace *as, hwaddr addr,
-                                   const uint8_t *buf, int len);
 void cpu_flush_icache_range(hwaddr start, int len);
 
 extern struct MemoryRegion io_mem_rom;
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 8e61450de32..ffd23ed8d8d 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1792,6 +1792,32 @@ MemTxResult address_space_write(AddressSpace *as, hwaddr addr,
                                 MemTxAttrs attrs,
                                 const uint8_t *buf, int len);
 
+/**
+ * address_space_write_rom: write to address space, including ROM.
+ *
+ * This function writes to the specified address space, but will
+ * write data to both ROM and RAM. This is used for non-guest
+ * writes like writes from the gdb debug stub or initial loading
+ * of ROM contents.
+ *
+ * Note that portions of the write which attempt to write data to
+ * a device will be silently ignored -- only real RAM and ROM will
+ * be written to.
+ *
+ * Return a MemTxResult indicating whether the operation succeeded
+ * or failed (eg unassigned memory, device rejected the transaction,
+ * IOMMU fault).
+ *
+ * @as: #AddressSpace to be accessed
+ * @addr: address within that address space
+ * @attrs: memory transaction attributes
+ * @buf: buffer with the data transferred
+ * @len: the number of bytes to write
+ */
+MemTxResult address_space_write_rom(AddressSpace *as, hwaddr addr,
+                                    MemTxAttrs attrs,
+                                    const uint8_t *buf, int len);
+
 /* address_space_ld*: load from an address space
  * address_space_st*: store to an address space
  *
diff --git a/exec.c b/exec.c
index 92679508ba3..6e875f0640a 100644
--- a/exec.c
+++ b/exec.c
@@ -3430,11 +3430,12 @@ static inline MemTxResult address_space_write_rom_internal(AddressSpace *as,
 }
 
 /* used for ROM loading : can write in RAM and ROM */
-void cpu_physical_memory_write_rom(AddressSpace *as, hwaddr addr,
-                                   const uint8_t *buf, int len)
+MemTxResult address_space_write_rom(AddressSpace *as, hwaddr addr,
+                                    MemTxAttrs attrs,
+                                    const uint8_t *buf, int len)
 {
-    address_space_write_rom_internal(as, addr, MEMTXATTRS_UNSPECIFIED,
-                                     buf, len, WRITE_DATA);
+    return address_space_write_rom_internal(as, addr, attrs,
+                                            buf, len, WRITE_DATA);
 }
 
 void cpu_flush_icache_range(hwaddr start, int len)
@@ -3879,8 +3880,9 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
             l = len;
         phys_addr += (addr & ~TARGET_PAGE_MASK);
         if (is_write) {
-            cpu_physical_memory_write_rom(cpu->cpu_ases[asidx].as,
-                                          phys_addr, buf, l);
+            address_space_write_rom(cpu->cpu_ases[asidx].as, phys_addr,
+                                    MEMTXATTRS_UNSPECIFIED,
+                                    buf, l);
         } else {
             address_space_rw(cpu->cpu_ases[asidx].as, phys_addr,
                              MEMTXATTRS_UNSPECIFIED,
diff --git a/hw/core/loader.c b/hw/core/loader.c
index aa0b3fc8679..66a616608af 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1103,8 +1103,8 @@ static void rom_reset(void *unused)
             void *host = memory_region_get_ram_ptr(rom->mr);
             memcpy(host, rom->data, rom->datasize);
         } else {
-            cpu_physical_memory_write_rom(rom->as, rom->addr, rom->data,
-                                          rom->datasize);
+            address_space_write_rom(rom->as, rom->addr, MEMTXATTRS_UNSPECIFIED,
+                                    rom->data, rom->datasize);
         }
         if (rom->isrom) {
             /* rom needs to be written only once */
diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index 97ffdd820f2..c9dd65b3a03 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -122,9 +122,10 @@ static void apic_sync_vapic(APICCommonState *s, int sync_type)
         }
         vapic_state.irr = vector & 0xff;
 
-        cpu_physical_memory_write_rom(&address_space_memory,
-                                      s->vapic_paddr + start,
-                                      ((void *)&vapic_state) + start, length);
+        address_space_write_rom(&address_space_memory,
+                                s->vapic_paddr + start,
+                                MEMTXATTRS_UNSPECIFIED,
+                                ((void *)&vapic_state) + start, length);
     }
 }
 
diff --git a/hw/misc/tz-mpc.c b/hw/misc/tz-mpc.c
index e0c58ba37ec..fb48a1540b9 100644
--- a/hw/misc/tz-mpc.c
+++ b/hw/misc/tz-mpc.c
@@ -448,7 +448,7 @@ static int tz_mpc_attrs_to_index(IOMMUMemoryRegion *iommu, MemTxAttrs attrs)
 {
     /* We treat unspecified attributes like secure. Transactions with
      * unspecified attributes come from places like
-     * cpu_physical_memory_write_rom() for initial image load, and we want
+     * rom_reset() for initial image load, and we want
      * those to pass through the from-reset "everything is secure" config.
      * All the real during-emulation transactions from the CPU will
      * specify attributes.
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 3c29b68e67f..639906cca30 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -559,8 +559,9 @@ static void idreg_init(hwaddr addr)
     s = SYS_BUS_DEVICE(dev);
 
     sysbus_mmio_map(s, 0, addr);
-    cpu_physical_memory_write_rom(&address_space_memory,
-                                  addr, idreg_data, sizeof(idreg_data));
+    address_space_write_rom(&address_space_memory, addr,
+                            MEMTXATTRS_UNSPECIFIED,
+                            idreg_data, sizeof(idreg_data));
 }
 
 #define MACIO_ID_REGISTER(obj) \
diff --git a/docs/devel/loads-stores.rst b/docs/devel/loads-stores.rst
index 57d8c524bfe..c74cd090e64 100644
--- a/docs/devel/loads-stores.rst
+++ b/docs/devel/loads-stores.rst
@@ -253,6 +253,22 @@ Regexes for git grep
  - ``\<address_space_ldu\?[bwql]\(_[lb]e\)\?\>``
  - ``\<address_space_st[bwql]\(_[lb]e\)\?\>``
 
+``address_space_write_rom``
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+This function performs a write by physical address like
+``address_space_write``, except that if the write is to a ROM then
+the ROM contents will be modified, even though a write by the guest
+CPU to the ROM would be ignored. This is used for non-guest writes
+like writes from the gdb debug stub or initial loading of ROM contents.
+
+Note that portions of the write which attempt to write data to a
+device will be silently ignored -- only real RAM and ROM will
+be written to.
+
+Regexes for git grep
+ - ``address_space_write_rom``
+
 ``{ld,st}*_phys``
 ~~~~~~~~~~~~~~~~~
 
@@ -315,25 +331,6 @@ For new code they are better avoided:
 Regexes for git grep
  - ``\<cpu_physical_memory_\(read\|write\|rw\)\>``
 
-``cpu_physical_memory_write_rom``
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-This function performs a write by physical address like
-``address_space_write``, except that if the write is to a ROM then
-the ROM contents will be modified, even though a write by the guest
-CPU to the ROM would be ignored.
-
-Note that unlike ``cpu_physical_memory_write()`` this function takes
-an AddressSpace argument, but unlike ``address_space_write()`` this
-function does not take a ``MemTxAttrs`` or return a ``MemTxResult``.
-
-**TODO**: we should probably clean up this inconsistency and
-turn the function into ``address_space_write_rom`` with an API
-matching ``address_space_write``.
-
-``cpu_physical_memory_write_rom``
-
-
 ``cpu_memory_rw_debug``
 ~~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.19.1

