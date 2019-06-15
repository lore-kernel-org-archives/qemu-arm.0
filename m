Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp676852wrg;
        Sat, 15 Jun 2019 08:47:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyOuKi0BTyp1vev9cv8ZNTBjIILL6LPHqKFC+jWnnl2g9W4nrgZeAsN+UheLWGEmEwTof3e
X-Received: by 2002:ac8:70d1:: with SMTP id g17mr42548500qtp.124.1560613624266;
        Sat, 15 Jun 2019 08:47:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560613624; cv=none;
        d=google.com; s=arc-20160816;
        b=rLKnlSaiM6O+tiskey8nc8FILqvqBxkXMzeb4472l+nGteRn4KONTxeqUcjKqPFmWS
         EE7iOH7itmrN6+ShQXhlY18W6esy+0TTzfXJg/UzrSvCBNsK6X+tXwDcIpd7a737AJ9l
         YVLhWqqtgcjobN7VUrOwNwJUVoycP5HwJS779/ubFIDnoNc3ys8bXJZwWhHzOoXalgl1
         Bpu4QKoWErVlxMq7d5+cwcVxr8TJJfyqysYjC2UjJ33Uak+KC7uiAavOydg+B+btM+VB
         LkKdPBkRdW7VmvXwPlzZxj4rMKyzOekyUmDccyn/kKUwKYLofpYGB2In9O3KOxwTnFSB
         6kOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=vaXCnrxp6GWAxPGpK2rygateeXM232VIVw/xdAqZa/0=;
        b=ZvBsoWp0WEbIGsV4aYX+WZiCYLpOuBXadw9kuNxUFn+h0s2XOQ3c/jJr7LQeIAEDPx
         Xk/GhE+ABM89SHe1JxW9Wk4oMVePViAlUiQhwGby+o8UJDevMQ02etdnrGK6isg9+NdX
         /UI8zXZoXXerCRWxlqajOi26Lp6OE3+TRJfuw175MY/RsErGi04X8Zy233qst7MBTJ9Z
         EQXdH8QJQJrY+w9P4Av3iS2OViIIwg39csF06bzlF39vRbxjyjytbX+NMVekDrfMDYit
         Tj5pq2XY7A4EobEpVI4UaEhQ6XUiVtKpWsfpQiYuU9Iwmegjxf1cNyOISKluB9YOrE41
         OjWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l18si89972qkg.84.2019.06.15.08.47.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Jun 2019 08:47:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32888 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcAtT-0005KN-6Z
	for alex.bennee@linaro.org; Sat, 15 Jun 2019 11:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35870)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hcAr2-00044P-Kh
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hcAr0-0000oQ-Le
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42100)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hcAr0-0000jz-Cw; Sat, 15 Jun 2019 11:44:30 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 06BEF85539;
 Sat, 15 Jun 2019 15:44:29 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-41.brq.redhat.com [10.40.204.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A91F1001B05;
 Sat, 15 Jun 2019 15:44:27 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 15 Jun 2019 17:43:44 +0200
Message-Id: <20190615154352.26824-16-philmd@redhat.com>
In-Reply-To: <20190615154352.26824-1-philmd@redhat.com>
References: <20190615154352.26824-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Sat, 15 Jun 2019 15:44:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 15/23] target/arm: Make ARM TLB filling
 routine static
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
 Samuel Ortiz <sameo@linux.intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 58kjl/IMjVje

From: Samuel Ortiz <sameo@linux.intel.com>

It's only used in op_helper.c, it does not need to be exported and
moreover it should only be build when TCG is enabled.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
[PMD: Rebased]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/helper.c    | 53 ---------------------------------------
 target/arm/internals.h |  2 ++
 target/arm/op_helper.c | 56 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+), 53 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 673ada1e86..a4af02c984 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10621,59 +10621,6 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUStat=
e *cs, vaddr addr,
=20
 #endif
=20
-bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                      MMUAccessType access_type, int mmu_idx,
-                      bool probe, uintptr_t retaddr)
-{
-    ARMCPU *cpu =3D ARM_CPU(cs);
-
-#ifdef CONFIG_USER_ONLY
-    cpu->env.exception.vaddress =3D address;
-    if (access_type =3D=3D MMU_INST_FETCH) {
-        cs->exception_index =3D EXCP_PREFETCH_ABORT;
-    } else {
-        cs->exception_index =3D EXCP_DATA_ABORT;
-    }
-    cpu_loop_exit_restore(cs, retaddr);
-#else
-    hwaddr phys_addr;
-    target_ulong page_size;
-    int prot, ret;
-    MemTxAttrs attrs =3D {};
-    ARMMMUFaultInfo fi =3D {};
-
-    /*
-     * Walk the page table and (if the mapping exists) add the page
-     * to the TLB.  On success, return true.  Otherwise, if probing,
-     * return false.  Otherwise populate fsr with ARM DFSR/IFSR fault
-     * register format, and signal the fault.
-     */
-    ret =3D get_phys_addr(&cpu->env, address, access_type,
-                        core_to_arm_mmu_idx(&cpu->env, mmu_idx),
-                        &phys_addr, &attrs, &prot, &page_size, &fi, NULL=
);
-    if (likely(!ret)) {
-        /*
-         * Map a single [sub]page. Regions smaller than our declared
-         * target page size are handled specially, so for those we
-         * pass in the exact addresses.
-         */
-        if (page_size >=3D TARGET_PAGE_SIZE) {
-            phys_addr &=3D TARGET_PAGE_MASK;
-            address &=3D TARGET_PAGE_MASK;
-        }
-        tlb_set_page_with_attrs(cs, address, phys_addr, attrs,
-                                prot, mmu_idx, page_size);
-        return true;
-    } else if (probe) {
-        return false;
-    } else {
-        /* now we have a real cpu fault */
-        cpu_restore_state(cs, retaddr, true);
-        arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
-    }
-#endif
-}
-
 /* Note that signed overflow is undefined in C.  The following routines =
are
    careful to use unsigned types where modulo arithmetic is required.
    Failure to do so _will_ break on newer gcc.  */
diff --git a/target/arm/internals.h b/target/arm/internals.h
index fe9e4665e2..37ca493635 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -761,9 +761,11 @@ static inline bool arm_extabort_type(MemTxResult res=
ult)
     return result !=3D MEMTX_DECODE_ERROR;
 }
=20
+#ifdef CONFIG_TCG
 bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       MMUAccessType access_type, int mmu_idx,
                       bool probe, uintptr_t retaddr);
+#endif
=20
 void arm_deliver_fault(ARMCPU *cpu, vaddr addr, MMUAccessType access_typ=
e,
                        int mmu_idx, ARMMMUFaultInfo *fi) QEMU_NORETURN;
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 29b56039e5..e43c99ebf0 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -179,6 +179,62 @@ void arm_deliver_fault(ARMCPU *cpu, vaddr addr, MMUA=
ccessType access_type,
     env->exception.fsr =3D fsr;
     raise_exception(env, exc, syn, target_el);
 }
+#endif
+
+bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool probe, uintptr_t retaddr)
+{
+    ARMCPU *cpu =3D ARM_CPU(cs);
+
+#ifdef CONFIG_USER_ONLY
+    cpu->env.exception.vaddress =3D address;
+    if (access_type =3D=3D MMU_INST_FETCH) {
+        cs->exception_index =3D EXCP_PREFETCH_ABORT;
+    } else {
+        cs->exception_index =3D EXCP_DATA_ABORT;
+    }
+    cpu_loop_exit_restore(cs, retaddr);
+#else
+    hwaddr phys_addr;
+    target_ulong page_size;
+    int prot, ret;
+    MemTxAttrs attrs =3D {};
+    ARMMMUFaultInfo fi =3D {};
+
+    /*
+     * Walk the page table and (if the mapping exists) add the page
+     * to the TLB.  On success, return true.  Otherwise, if probing,
+     * return false.  Otherwise populate fsr with ARM DFSR/IFSR fault
+     * register format, and signal the fault.
+     */
+    ret =3D get_phys_addr(&cpu->env, address, access_type,
+                        core_to_arm_mmu_idx(&cpu->env, mmu_idx),
+                        &phys_addr, &attrs, &prot, &page_size, &fi, NULL=
);
+    if (likely(!ret)) {
+        /*
+         * Map a single [sub]page. Regions smaller than our declared
+         * target page size are handled specially, so for those we
+         * pass in the exact addresses.
+         */
+        if (page_size >=3D TARGET_PAGE_SIZE) {
+            phys_addr &=3D TARGET_PAGE_MASK;
+            address &=3D TARGET_PAGE_MASK;
+        }
+        tlb_set_page_with_attrs(cs, address, phys_addr, attrs,
+                                prot, mmu_idx, page_size);
+        return true;
+    } else if (probe) {
+        return false;
+    } else {
+        /* now we have a real cpu fault */
+        cpu_restore_state(cs, retaddr, true);
+        arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
+    }
+#endif
+}
+
+#if !defined(CONFIG_USER_ONLY)
=20
 /* Raise a data fault alignment exception for the specified virtual addr=
ess */
 void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
--=20
2.20.1

