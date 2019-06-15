Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp684732wrg;
        Sat, 15 Jun 2019 08:59:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw5bz9YeFTs46cv04LpPOniZA18tUuhLv56DK/4dlx2/M3/YvLGI6kl0S9r1EQml037bmuu
X-Received: by 2002:a37:4d41:: with SMTP id a62mr74681500qkb.99.1560614376552;
        Sat, 15 Jun 2019 08:59:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560614376; cv=none;
        d=google.com; s=arc-20160816;
        b=azGSVS7lQPSO153dunCuNgJ/IU4ZFRgsdVnLuFfKJ0bvC87ctKfjB7FsH/pnNQMvSx
         5HV/H5Z5XtelqQY7thxETrUnDljzosXXkFhTfS/3g09n75ioU3m+8Rg36UTrw2gm+bGG
         wH4ESaW34+/s5eztE291SM4GP2vC+Urg3GKooSm3/vNDSJ/M64ItUTdCBdttDBZIw5KE
         OiG3g3vqTRGyHkYorj59USWkrgd6NBd/XbV8Xt0olksyrkF5B3fW514QcNR95zckoLYn
         Tc+WpF3XrLtrgp7TXh2pLLUgv/a5sqwYDfyj/4sV33M49oGA8S1ry45IFFx/WYJTcMBh
         R+fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=leieg5v/5b3fiJh6rc+Lr6NcRm6NtUnsnNVzbL0UOLA=;
        b=jUJyj53TUDutb8tjPob95/MlXWToXT5KhuimiW2SOUFDkSTSKOWqOG6Q+LVEkRTdqu
         bDPdiiqPBTIHwrUk0sr+NzklH5aTwbSeK72MlqeQSbVYPEIfPydc9WAWnX3+z/mpMVHV
         ms7Eg4/JWm0mwm7JEVATV9FdjFUon9xKAi1bTE6O6zGOhqCPwRa5Y4ny1F6LIxiPvKjZ
         81jvQM/BtbPAoDRs3j4LHGsjYtwmRIKZsEMbVCF5TUYHC5U0XjDs59LzGCF5jprhyiRb
         wR9GLMT27LKS8gCL9KsR4FYSQFA4cn+cmyBlRPqYzOMYNs1DX1WFWi4fizRswaEGJ++z
         9YIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13si4041121qtn.125.2019.06.15.08.59.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Jun 2019 08:59:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32996 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcB5c-0001DW-1v
	for alex.bennee@linaro.org; Sat, 15 Jun 2019 11:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35868)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hcAr2-00044O-KX
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hcAr0-0000nl-Do
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49026)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hcAqy-0000ei-I1; Sat, 15 Jun 2019 11:44:28 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 18BE82F8BF4;
 Sat, 15 Jun 2019 15:44:27 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-41.brq.redhat.com [10.40.204.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68D191001938;
 Sat, 15 Jun 2019 15:44:25 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 15 Jun 2019 17:43:43 +0200
Message-Id: <20190615154352.26824-15-philmd@redhat.com>
In-Reply-To: <20190615154352.26824-1-philmd@redhat.com>
References: <20190615154352.26824-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Sat, 15 Jun 2019 15:44:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 14/23] target/arm: Move the DC ZVA helper into
 op_helper
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Samuel Ortiz <sameo@linux.intel.com>,
 Robert Bradford <robert.bradford@intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UaqwQrb+xI6E

From: Samuel Ortiz <sameo@linux.intel.com>

Those helpers are a software implementation of the ARM v8 memory zeroing
op code. They should be moved to the op helper file, which is going to
eventually be built only when TCG is enabled.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Robert Bradford <robert.bradford@intel.com>
[PMD: Rebased]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/helper.c    | 92 -----------------------------------------
 target/arm/op_helper.c | 93 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+), 92 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 24d88eef17..673ada1e86 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10674,98 +10674,6 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr addres=
s, int size,
 #endif
 }
=20
-void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
-{
-    /*
-     * Implement DC ZVA, which zeroes a fixed-length block of memory.
-     * Note that we do not implement the (architecturally mandated)
-     * alignment fault for attempts to use this on Device memory
-     * (which matches the usual QEMU behaviour of not implementing eithe=
r
-     * alignment faults or any memory attribute handling).
-     */
-
-    ARMCPU *cpu =3D env_archcpu(env);
-    uint64_t blocklen =3D 4 << cpu->dcz_blocksize;
-    uint64_t vaddr =3D vaddr_in & ~(blocklen - 1);
-
-#ifndef CONFIG_USER_ONLY
-    {
-        /*
-         * Slightly awkwardly, QEMU's TARGET_PAGE_SIZE may be less than
-         * the block size so we might have to do more than one TLB looku=
p.
-         * We know that in fact for any v8 CPU the page size is at least=
 4K
-         * and the block size must be 2K or less, but TARGET_PAGE_SIZE i=
s only
-         * 1K as an artefact of legacy v5 subpage support being present =
in the
-         * same QEMU executable. So in practice the hostaddr[] array has
-         * two entries, given the current setting of TARGET_PAGE_BITS_MI=
N.
-         */
-        int maxidx =3D DIV_ROUND_UP(blocklen, TARGET_PAGE_SIZE);
-        void *hostaddr[DIV_ROUND_UP(2 * KiB, 1 << TARGET_PAGE_BITS_MIN)]=
;
-        int try, i;
-        unsigned mmu_idx =3D cpu_mmu_index(env, false);
-        TCGMemOpIdx oi =3D make_memop_idx(MO_UB, mmu_idx);
-
-        assert(maxidx <=3D ARRAY_SIZE(hostaddr));
-
-        for (try =3D 0; try < 2; try++) {
-
-            for (i =3D 0; i < maxidx; i++) {
-                hostaddr[i] =3D tlb_vaddr_to_host(env,
-                                                vaddr + TARGET_PAGE_SIZE=
 * i,
-                                                1, mmu_idx);
-                if (!hostaddr[i]) {
-                    break;
-                }
-            }
-            if (i =3D=3D maxidx) {
-                /*
-                 * If it's all in the TLB it's fair game for just writin=
g to;
-                 * we know we don't need to update dirty status, etc.
-                 */
-                for (i =3D 0; i < maxidx - 1; i++) {
-                    memset(hostaddr[i], 0, TARGET_PAGE_SIZE);
-                }
-                memset(hostaddr[i], 0, blocklen - (i * TARGET_PAGE_SIZE)=
);
-                return;
-            }
-            /*
-             * OK, try a store and see if we can populate the tlb. This
-             * might cause an exception if the memory isn't writable,
-             * in which case we will longjmp out of here. We must for
-             * this purpose use the actual register value passed to us
-             * so that we get the fault address right.
-             */
-            helper_ret_stb_mmu(env, vaddr_in, 0, oi, GETPC());
-            /* Now we can populate the other TLB entries, if any */
-            for (i =3D 0; i < maxidx; i++) {
-                uint64_t va =3D vaddr + TARGET_PAGE_SIZE * i;
-                if (va !=3D (vaddr_in & TARGET_PAGE_MASK)) {
-                    helper_ret_stb_mmu(env, va, 0, oi, GETPC());
-                }
-            }
-        }
-
-        /*
-         * Slow path (probably attempt to do this to an I/O device or
-         * similar, or clearing of a block of code we have translations
-         * cached for). Just do a series of byte writes as the architect=
ure
-         * demands. It's not worth trying to use a cpu_physical_memory_m=
ap(),
-         * memset(), unmap() sequence here because:
-         *  + we'd need to account for the blocksize being larger than a=
 page
-         *  + the direct-RAM access case is almost always going to be de=
alt
-         *    with in the fastpath code above, so there's no speed benef=
it
-         *  + we would have to deal with the map returning NULL because =
the
-         *    bounce buffer was in use
-         */
-        for (i =3D 0; i < blocklen; i++) {
-            helper_ret_stb_mmu(env, vaddr + i, 0, oi, GETPC());
-        }
-    }
-#else
-    memset(g2h(vaddr), 0, blocklen);
-#endif
-}
-
 /* Note that signed overflow is undefined in C.  The following routines =
are
    careful to use unsigned types where modulo arithmetic is required.
    Failure to do so _will_ break on newer gcc.  */
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index db4254a67b..29b56039e5 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -17,6 +17,7 @@
  * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
@@ -1316,3 +1317,95 @@ uint32_t HELPER(ror_cc)(CPUARMState *env, uint32_t=
 x, uint32_t i)
         return ((uint32_t)x >> shift) | (x << (32 - shift));
     }
 }
+
+void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
+{
+    /*
+     * Implement DC ZVA, which zeroes a fixed-length block of memory.
+     * Note that we do not implement the (architecturally mandated)
+     * alignment fault for attempts to use this on Device memory
+     * (which matches the usual QEMU behaviour of not implementing eithe=
r
+     * alignment faults or any memory attribute handling).
+     */
+
+    ARMCPU *cpu =3D env_archcpu(env);
+    uint64_t blocklen =3D 4 << cpu->dcz_blocksize;
+    uint64_t vaddr =3D vaddr_in & ~(blocklen - 1);
+
+#ifndef CONFIG_USER_ONLY
+    {
+        /*
+         * Slightly awkwardly, QEMU's TARGET_PAGE_SIZE may be less than
+         * the block size so we might have to do more than one TLB looku=
p.
+         * We know that in fact for any v8 CPU the page size is at least=
 4K
+         * and the block size must be 2K or less, but TARGET_PAGE_SIZE i=
s only
+         * 1K as an artefact of legacy v5 subpage support being present =
in the
+         * same QEMU executable. So in practice the hostaddr[] array has
+         * two entries, given the current setting of TARGET_PAGE_BITS_MI=
N.
+         */
+        int maxidx =3D DIV_ROUND_UP(blocklen, TARGET_PAGE_SIZE);
+        void *hostaddr[DIV_ROUND_UP(2 * KiB, 1 << TARGET_PAGE_BITS_MIN)]=
;
+        int try, i;
+        unsigned mmu_idx =3D cpu_mmu_index(env, false);
+        TCGMemOpIdx oi =3D make_memop_idx(MO_UB, mmu_idx);
+
+        assert(maxidx <=3D ARRAY_SIZE(hostaddr));
+
+        for (try =3D 0; try < 2; try++) {
+
+            for (i =3D 0; i < maxidx; i++) {
+                hostaddr[i] =3D tlb_vaddr_to_host(env,
+                                                vaddr + TARGET_PAGE_SIZE=
 * i,
+                                                1, mmu_idx);
+                if (!hostaddr[i]) {
+                    break;
+                }
+            }
+            if (i =3D=3D maxidx) {
+                /*
+                 * If it's all in the TLB it's fair game for just writin=
g to;
+                 * we know we don't need to update dirty status, etc.
+                 */
+                for (i =3D 0; i < maxidx - 1; i++) {
+                    memset(hostaddr[i], 0, TARGET_PAGE_SIZE);
+                }
+                memset(hostaddr[i], 0, blocklen - (i * TARGET_PAGE_SIZE)=
);
+                return;
+            }
+            /*
+             * OK, try a store and see if we can populate the tlb. This
+             * might cause an exception if the memory isn't writable,
+             * in which case we will longjmp out of here. We must for
+             * this purpose use the actual register value passed to us
+             * so that we get the fault address right.
+             */
+            helper_ret_stb_mmu(env, vaddr_in, 0, oi, GETPC());
+            /* Now we can populate the other TLB entries, if any */
+            for (i =3D 0; i < maxidx; i++) {
+                uint64_t va =3D vaddr + TARGET_PAGE_SIZE * i;
+                if (va !=3D (vaddr_in & TARGET_PAGE_MASK)) {
+                    helper_ret_stb_mmu(env, va, 0, oi, GETPC());
+                }
+            }
+        }
+
+        /*
+         * Slow path (probably attempt to do this to an I/O device or
+         * similar, or clearing of a block of code we have translations
+         * cached for). Just do a series of byte writes as the architect=
ure
+         * demands. It's not worth trying to use a cpu_physical_memory_m=
ap(),
+         * memset(), unmap() sequence here because:
+         *  + we'd need to account for the blocksize being larger than a=
 page
+         *  + the direct-RAM access case is almost always going to be de=
alt
+         *    with in the fastpath code above, so there's no speed benef=
it
+         *  + we would have to deal with the map returning NULL because =
the
+         *    bounce buffer was in use
+         */
+        for (i =3D 0; i < blocklen; i++) {
+            helper_ret_stb_mmu(env, vaddr + i, 0, oi, GETPC());
+        }
+    }
+#else
+    memset(g2h(vaddr), 0, blocklen);
+#endif
+}
--=20
2.20.1

