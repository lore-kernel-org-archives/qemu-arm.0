Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6258737wrv;
        Wed, 7 Aug 2019 01:39:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzjavCqGqnfpw8KMPNWF3grO7ytooGCfimsXiGvILOPZldd3XUPlVpXM0JhnhfRqk5g2yy8
X-Received: by 2002:a17:906:5c4e:: with SMTP id c14mr7098282ejr.73.1565167181115;
        Wed, 07 Aug 2019 01:39:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565167181; cv=none;
        d=google.com; s=arc-20160816;
        b=CTscpRoJIXGzqRACvguvPtmoaWIxoYW6/XS/+T8f5NG4gl/rN5MOvUfz9Pfyq7C/Bz
         PEwDuR9pqCJSXKSJzKB7As82rhyrq9IVyZmA3huVyBw4Fjmb1/EoTcpBPE/5ZUxvdTzU
         VIqOwllw3ZPMZP3zgliB1VxuHzDTW1eM8D9+H7L0Oj5HpgwqNxzoJjFREYaETu7na8ay
         cZXbSv751xsL2o8l7NN/xBN8E+kZdVEK3itKzTEWYtUUoNla3zicYQdsh9Z/qFkApxx6
         hWg2wWTy+fc2XmL/JyzicRClDL5wlJwIN77J9LhxzwugYpULfImGocx3X+hnp9gG/bhw
         8CPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:to:from;
        bh=nAdLcUNY1lBtuCBetrQu2WnZm89cJajhINkaszDV4Ec=;
        b=x2RGMOY/6dW/UXj+UAZwaSJY9khHUSkyIJRg/4awLOV078bQxiKFdOEp0Ds2tQ14En
         U8lK32lZOscdoupEDTX+s9lv6GJu5Askx8S/IB2DRUbSpoCpe5d3RsHu/3T4sDzybHBA
         /HUXRuAKe4tYO9Mbfipol6587rGyjnqv5cE6ghFKZPfxjKMoT7ORiEvdwOrFw8fpkY98
         B7T0L2gM76YcLU7ckBVS4N8NUpfwWcBzPRRuHYySYl7QZe7TF/5f3815A8ocHKRPzgVD
         1f/r9/L+omp/yPpB6GtN7Lb+cWQxrHaVFO7zn9u0GD9DyFdwivIAmLe8qs5ztbXsFEW/
         J+TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9si36004028edb.96.2019.08.07.01.39.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 01:39:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:38756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvHTw-0006lL-4m
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 04:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45998)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hvHPl-0006lW-9j
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 04:35:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hvHPe-00043J-RZ
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 04:35:21 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.71]:48118)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hvHOU-0003Q9-PE; Wed, 07 Aug 2019 04:34:03 -0400
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 BWP09926076.bt.com (10.36.82.107) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 09:33:49 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 09:34:00 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 09:34:00 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v6 22/26] memory: Single byte swap along the
 I/O path
Thread-Index: AQHVTPrcPP0GeVzFXUWOeAkpajngqg==
Date: Wed, 7 Aug 2019 08:34:00 +0000
Message-ID: <1565166840081.62776@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.44]
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.71
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: [Qemu-devel] [PATCH v6 22/26] memory: Single byte swap along the
 I/O path
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 cohuck@redhat.com, sagark@eecs.berkeley.edu, david@redhat.com,
 jasowang@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 i.mitsyanko@gmail.com, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, dmitry.fleytman@gmail.com, kraxel@redhat.com,
 edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn, pburton@wavecomp.com,
 xiaoguangrong.eric@gmail.com, peter.chubb@nicta.com.au, philmd@redhat.com,
 robh@kernel.org, hare@suse.com, sstabellini@kernel.org, berto@igalia.com,
 chouteau@adacore.com, qemu-block@nongnu.org, arikalo@wavecomp.com,
 jslaby@suse.cz, deller@gmx.de, mst@redhat.com, magnus.damm@gmail.com,
 jcd@tribudubois.net, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 mreitz@redhat.com, hpoussin@reactos.org, joel@jms.id.au,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 david@gibson.dropbear.id.au, lersek@redhat.com, green@moxielogic.com,
 atar4qemu@gmail.com, antonynpavlov@gmail.com, marex@denx.de, jiri@resnulli.us,
 ehabkost@redhat.com, minyard@acm.org, qemu-s390x@nongnu.org, sw@weilnetz.de,
 alistair@alistair23.me, yuval.shaia@oracle.com, b.galvani@gmail.com,
 eric.auger@redhat.com, alex.williamson@redhat.com, qemu-arm@nongnu.org,
 jan.kiszka@web.de, clg@kaod.org, stefanha@redhat.com,
 marcandre.lureau@redhat.com, shorne@gmail.com, jsnow@redhat.com,
 rth@twiddle.net, kwolf@redhat.com, qemu-riscv@nongnu.org, proljc@gmail.com,
 pbonzini@redhat.com, andrew@aj.id.au, kbastian@mail.uni-paderborn.de,
 crwulff@gmail.com, laurent@vivier.eu, Andrew.Baumann@microsoft.com,
 sundeep.lkml@gmail.com, andrew.smirnov@gmail.com, michael@walle.cc,
 paul.durrant@citrix.com, qemu-ppc@nongnu.org, huth@tuxfamily.org,
 amarkovic@wavecomp.com, imammedo@redhat.com, aurelien@aurel32.net,
 stefanb@linux.ibm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JGgb7xFMEJoz

Now that MemOp has been pushed down into the memory API, and
callers are encoding endianness, we can collapse byte swaps
along the I/O path into the accelerator and target independent
adjust_endianness.

Collapsing byte swaps along the I/O path enables additional endian
inversion logic, e.g. SPARC64 Invert Endian TTE bit, with redundant
byte swaps cancelling out.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 accel/tcg/cputlb.c     | 42 +++------------------------------
 hw/virtio/virtio-pci.c | 10 ++++----
 memory.c               | 33 ++++++++++----------------
 memory_ldst.inc.c      | 64 ----------------------------------------------=
----
 4 files changed, 19 insertions(+), 130 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 86d85cc..473b8e6 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1200,38 +1200,6 @@ static void *atomic_mmu_lookup(CPUArchState *env, ta=
rget_ulong addr,
     cpu_loop_exit_atomic(env_cpu(env), retaddr);
 }

-#ifdef TARGET_WORDS_BIGENDIAN
-#define NEED_BE_BSWAP 0
-#define NEED_LE_BSWAP 1
-#else
-#define NEED_BE_BSWAP 1
-#define NEED_LE_BSWAP 0
-#endif
-
-/*
- * Byte Swap Helper
- *
- * This should all dead code away depending on the build host and
- * access type.
- */
-
-static inline uint64_t handle_bswap(uint64_t val, MemOp op)
-{
-    if ((memop_big_endian(op) && NEED_BE_BSWAP) ||
-        (!memop_big_endian(op) && NEED_LE_BSWAP)) {
-        switch (op & MO_SIZE) {
-        case MO_8: return val;
-        case MO_16: return bswap16(val);
-        case MO_32: return bswap32(val);
-        case MO_64: return bswap64(val);
-        default:
-            g_assert_not_reached();
-        }
-    } else {
-        return val;
-    }
-}
-
 /*
  * Load Helpers
  *
@@ -1306,10 +1274,8 @@ load_helper(CPUArchState *env, target_ulong addr, TC=
GMemOpIdx oi,
             }
         }

-        /* FIXME: io_readx ignores MO_BSWAP.  */
-        res =3D io_readx(env, &env_tlb(env)->d[mmu_idx].iotlb[index],
-                       mmu_idx, addr, retaddr, access_type, op);
-        return handle_bswap(res, op);
+        return io_readx(env, &env_tlb(env)->d[mmu_idx].iotlb[index],
+                        mmu_idx, addr, retaddr, access_type, op);
     }

     /* Handle slow unaligned access (it spans two pages or IO).  */
@@ -1552,10 +1518,8 @@ store_helper(CPUArchState *env, target_ulong addr, u=
int64_t val,
             }
         }

-        /* FIXME: io_writex ignores MO_BSWAP.  */
         io_writex(env, &env_tlb(env)->d[mmu_idx].iotlb[index], mmu_idx,
-                  handle_bswap(val, op),
-                  addr, retaddr, op);
+                  val, addr, retaddr, op);
         return;
     }

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 70eb161..f3fe6ca 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -542,16 +542,15 @@ void virtio_address_space_write(VirtIOPCIProxy *proxy=
, hwaddr addr,
         val =3D pci_get_byte(buf);
         break;
     case 2:
-        val =3D cpu_to_le16(pci_get_word(buf));
+        val =3D pci_get_word(buf);
         break;
     case 4:
-        val =3D cpu_to_le32(pci_get_long(buf));
+        val =3D pci_get_long(buf);
         break;
     default:
         /* As length is under guest control, handle illegal values. */
         return;
     }
-    /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
     memory_region_dispatch_write(mr, addr, val, size_memop(len),
                                  MEMTXATTRS_UNSPECIFIED);
 }
@@ -576,7 +575,6 @@ virtio_address_space_read(VirtIOPCIProxy *proxy, hwaddr=
 addr,
     /* Make sure caller aligned buf properly */
     assert(!(((uintptr_t)buf) & (len - 1)));

-    /* FIXME: memory_region_dispatch_read ignores MO_BSWAP.  */
     memory_region_dispatch_read(mr, addr, &val, size_memop(len),
                                 MEMTXATTRS_UNSPECIFIED);
     switch (len) {
@@ -584,10 +582,10 @@ virtio_address_space_read(VirtIOPCIProxy *proxy, hwad=
dr addr,
         pci_set_byte(buf, val);
         break;
     case 2:
-        pci_set_word(buf, le16_to_cpu(val));
+        pci_set_word(buf, val);
         break;
     case 4:
-        pci_set_long(buf, le32_to_cpu(val));
+        pci_set_long(buf, val);
         break;
     default:
         /* As length is under guest control, handle illegal values. */
diff --git a/memory.c b/memory.c
index 264c624..9d3c3a6 100644
--- a/memory.c
+++ b/memory.c
@@ -343,32 +343,23 @@ static void flatview_simplify(FlatView *view)
     }
 }

-static bool memory_region_wrong_endianness(MemoryRegion *mr)
+static void adjust_endianness(MemoryRegion *mr, uint64_t *data, MemOp op)
 {
-#ifdef TARGET_WORDS_BIGENDIAN
-    return mr->ops->endianness =3D=3D MO_LE;
-#else
-    return mr->ops->endianness =3D=3D MO_BE;
-#endif
-}
-
-static void adjust_endianness(MemoryRegion *mr, uint64_t *data, unsigned s=
ize)
-{
-    if (memory_region_wrong_endianness(mr)) {
-        switch (size) {
-        case 1:
+    if ((op & MO_BSWAP) !=3D mr->ops->endianness) {
+        switch (op & MO_SIZE) {
+        case MO_8:
             break;
-        case 2:
+        case MO_16:
             *data =3D bswap16(*data);
             break;
-        case 4:
+        case MO_32:
             *data =3D bswap32(*data);
             break;
-        case 8:
+        case MO_64:
             *data =3D bswap64(*data);
             break;
         default:
-            abort();
+            g_assert_not_reached();
         }
     }
 }
@@ -1446,7 +1437,7 @@ MemTxResult memory_region_dispatch_read(MemoryRegion =
*mr,
     }

     r =3D memory_region_dispatch_read1(mr, addr, pval, size, attrs);
-    adjust_endianness(mr, pval, size);
+    adjust_endianness(mr, pval, op);
     return r;
 }

@@ -1489,7 +1480,7 @@ MemTxResult memory_region_dispatch_write(MemoryRegion=
 *mr,
         return MEMTX_DECODE_ERROR;
     }

-    adjust_endianness(mr, &data, size);
+    adjust_endianness(mr, &data, op);

     if ((!kvm_eventfds_enabled()) &&
         memory_region_dispatch_write_eventfds(mr, addr, data, size, attrs)=
) {
@@ -2335,7 +2326,7 @@ void memory_region_add_eventfd(MemoryRegion *mr,
     }

     if (size) {
-        adjust_endianness(mr, &mrfd.data, size);
+        adjust_endianness(mr, &mrfd.data, size_memop(size));
     }
     memory_region_transaction_begin();
     for (i =3D 0; i < mr->ioeventfd_nb; ++i) {
@@ -2370,7 +2361,7 @@ void memory_region_del_eventfd(MemoryRegion *mr,
     unsigned i;

     if (size) {
-        adjust_endianness(mr, &mrfd.data, size);
+        adjust_endianness(mr, &mrfd.data, size_memop(size));
     }
     memory_region_transaction_begin();
     for (i =3D 0; i < mr->ioeventfd_nb; ++i) {
diff --git a/memory_ldst.inc.c b/memory_ldst.inc.c
index ff28b30..33868f7 100644
--- a/memory_ldst.inc.c
+++ b/memory_ldst.inc.c
@@ -37,17 +37,7 @@ static inline uint32_t glue(address_space_ldl_internal, =
SUFFIX)(ARG1_DECL,
         release_lock |=3D prepare_mmio_access(mr);

         /* I/O case */
-        /* FIXME: memory_region_dispatch_read ignores MO_BSWAP.  */
         r =3D memory_region_dispatch_read(mr, addr1, &val, MO_32 | endian,=
 attrs);
-#if defined(TARGET_WORDS_BIGENDIAN)
-        if (endian =3D=3D MO_LE) {
-            val =3D bswap32(val);
-        }
-#else
-        if (endian =3D=3D MO_BE) {
-            val =3D bswap32(val);
-        }
-#endif
     } else {
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
@@ -113,17 +103,7 @@ static inline uint64_t glue(address_space_ldq_internal=
, SUFFIX)(ARG1_DECL,
         release_lock |=3D prepare_mmio_access(mr);

         /* I/O case */
-        /* FIXME: memory_region_dispatch_read ignores MO_BSWAP.  */
         r =3D memory_region_dispatch_read(mr, addr1, &val, MO_64 | endian,=
 attrs);
-#if defined(TARGET_WORDS_BIGENDIAN)
-        if (endian =3D=3D MO_LE) {
-            val =3D bswap64(val);
-        }
-#else
-        if (endian =3D=3D MO_BE) {
-            val =3D bswap64(val);
-        }
-#endif
     } else {
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
@@ -223,17 +203,7 @@ static inline uint32_t glue(address_space_lduw_interna=
l, SUFFIX)(ARG1_DECL,
         release_lock |=3D prepare_mmio_access(mr);

         /* I/O case */
-        /* FIXME: memory_region_dispatch_read ignores MO_BSWAP.  */
         r =3D memory_region_dispatch_read(mr, addr1, &val, MO_16 | endian,=
 attrs);
-#if defined(TARGET_WORDS_BIGENDIAN)
-        if (endian =3D=3D MO_LE) {
-            val =3D bswap16(val);
-        }
-#else
-        if (endian =3D=3D MO_BE) {
-            val =3D bswap16(val);
-        }
-#endif
     } else {
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
@@ -299,7 +269,6 @@ void glue(address_space_stl_notdirty, SUFFIX)(ARG1_DECL=
,
     mr =3D TRANSLATE(addr, &addr1, &l, true, attrs);
     if (l < 4 || !memory_access_is_direct(mr, true)) {
         release_lock |=3D prepare_mmio_access(mr);
-
         r =3D memory_region_dispatch_write(mr, addr1, val, MO_32 | MO_TE, =
attrs);
     } else {
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
@@ -336,17 +305,6 @@ static inline void glue(address_space_stl_internal, SU=
FFIX)(ARG1_DECL,
     mr =3D TRANSLATE(addr, &addr1, &l, true, attrs);
     if (l < 4 || !memory_access_is_direct(mr, true)) {
         release_lock |=3D prepare_mmio_access(mr);
-
-#if defined(TARGET_WORDS_BIGENDIAN)
-        if (endian =3D=3D MO_LE) {
-            val =3D bswap32(val);
-        }
-#else
-        if (endian =3D=3D MO_BE) {
-            val =3D bswap32(val);
-        }
-#endif
-        /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
         r =3D memory_region_dispatch_write(mr, addr1, val, MO_32 | endian,=
 attrs);
     } else {
         /* RAM case */
@@ -442,17 +400,6 @@ static inline void glue(address_space_stw_internal, SU=
FFIX)(ARG1_DECL,
     mr =3D TRANSLATE(addr, &addr1, &l, true, attrs);
     if (l < 2 || !memory_access_is_direct(mr, true)) {
         release_lock |=3D prepare_mmio_access(mr);
-
-#if defined(TARGET_WORDS_BIGENDIAN)
-        if (endian =3D=3D MO_LE) {
-            val =3D bswap16(val);
-        }
-#else
-        if (endian =3D=3D MO_BE) {
-            val =3D bswap16(val);
-        }
-#endif
-        /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
         r =3D memory_region_dispatch_write(mr, addr1, val, MO_16 | endian,=
 attrs);
     } else {
         /* RAM case */
@@ -516,17 +463,6 @@ static void glue(address_space_stq_internal, SUFFIX)(A=
RG1_DECL,
     mr =3D TRANSLATE(addr, &addr1, &l, true, attrs);
     if (l < 8 || !memory_access_is_direct(mr, true)) {
         release_lock |=3D prepare_mmio_access(mr);
-
-#if defined(TARGET_WORDS_BIGENDIAN)
-        if (endian =3D=3D MO_LE) {
-            val =3D bswap64(val);
-        }
-#else
-        if (endian =3D=3D MO_BE) {
-            val =3D bswap64(val);
-        }
-#endif
-        /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
         r =3D memory_region_dispatch_write(mr, addr1, val, MO_64 | endian,=
 attrs);
     } else {
         /* RAM case */
--
1.8.3.1

?
