Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6571639ejq;
        Mon, 15 May 2023 08:00:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6AAAiPR7GpUsMgsmnMazKl5fj40ooIxzv/CUAL8u1tQCST4vMJrHJFqMkxAWN1dTIPZJG+
X-Received: by 2002:ad4:5f8e:0:b0:5ef:410f:88be with SMTP id jp14-20020ad45f8e000000b005ef410f88bemr52953690qvb.1.1684162821470;
        Mon, 15 May 2023 08:00:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684162821; cv=none;
        d=google.com; s=arc-20160816;
        b=p83voxTx9xKFyvyH0deDPwd7RZE0YUccQon7X7e1kCpLkr4AXyS7SWGXkYVIad5jB9
         kN/HHsEw02EdSP9o7M+GL99lobkwwpHsnhKhvphaYRKWFv87n3Ja0oVkzYdyftGvvKTW
         /OVHYnEP/NrvqBE3QgR8aDdOSG6DafOIVmEkTbkqEpG0uQQJsJW2c0+oWU8KZ/cmhHog
         ypdgz7LubAnnaUgphT8ifJSRXHm3TH3H/pynEwbKyEtAnKJlQPxA6edoF/yDGJblUT2A
         1fNp8uCsk3BhapiKm4MrXqoPCAyaxRK9s4IGd+ssJ4VassF6A0YV6NEhanLAFatDtd6J
         HRQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=W/061ZE7ccFdh+QezoQH0JEIcD0VyHiX4WZjQj5eRxI=;
        b=RjG4R7L768zLgvH1O74df/7dTxGlv4/6uhirg7IDpkLKsBZs9bocTZHSC3YkHHH5M3
         ek0LmwSbDNpJ6Ajm6x6KHeg7WLhrtG447wC8e6JH2OeRT2w3Tl/eG2KiWQa0av3abq0C
         mj1rD0X42IRxiDlV8RyNCaM5W0aGHWeTnz6IjxATuWBXAf5I9NFKDFP0TJtlnMHaLs67
         G1szzihhSN6j3gp2viRPhUnOuftfztsJITkBhCevA3hvTxGY2J23aXwIT8FXOqbQyku1
         VYaLDpj4RRf6uCWKj9ZD3My150Mmnb/rLW4Q963ETCqKLT1BVXIO+H6aRB2wvhTPrJyD
         Al1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="RT/N3c2v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13-20020a0562140e4d00b006236822ff82si1150600qvc.585.2023.05.15.08.00.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 08:00:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="RT/N3c2v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyZHz-0007PY-Mq; Mon, 15 May 2023 10:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZGR-0006iY-GF
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:33:29 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZGL-0004rV-Av
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:33:27 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1ab0c697c84so97895075ad.3
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 07:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161199; x=1686753199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W/061ZE7ccFdh+QezoQH0JEIcD0VyHiX4WZjQj5eRxI=;
 b=RT/N3c2vTmNgcoB81oZuieoiDVmokMUmMnsIrhz/T2POKNkGWYobLow58qn2uy2EQB
 g8bIPmdCCUs0ib0LZPnSQsDOEaAbTECFHliHjtclw4JSBBZsL8169DpLKYP9KAmIKwqN
 16UNXPS1hizdHrBQy2KdZiudP0qPJE8sICZ/Tcm03Bnz7LKoF5H9m1BHCK7KwKD/+l7W
 c+5oTSkL7vP+854/P2heiSvrgaDlpRBJYlehOj3CylcgXyhtwDIdmld3ShrGZBlD9uaB
 z1L9plM3iJVgvrgD+CeQwtHm6VAu4+u1eY81YldhO9q6i6Zec7oFiwBZMx45hRzyPpRW
 zglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161199; x=1686753199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W/061ZE7ccFdh+QezoQH0JEIcD0VyHiX4WZjQj5eRxI=;
 b=S0oQX2aNO/kiHAIu3gh3HxJp4EpG4STCTLD/n5xwcjCovuoeOZrBSgbrrE5Ze6KSf3
 uJYtoLPkP/DMIHygCX0dUKvmH6zIWetnoVm6g0ljcjTSHSeE70F10qzsY+YqcXV9Osv5
 tjJUdqa/i+Bh+eXb6kNgpbJosr0zNcHRP6tzViPLMOu4fhqlBmBobRDxsHDor/eu49Ar
 TCz9OTSsGfxzMb0qamoLHSwKCqGpexLWoiRj3+Nz49qwKDZW6ibP07Qb2Uz8i9KBjScY
 JvMWdbWAsLmbEBep6OyCt3Q64FGaPelmJCEULYDgUSAFYbSU9RmbImTJUf6qw47QgSKI
 erFQ==
X-Gm-Message-State: AC+VfDwlBIrxY/rHGY8OY7NRxGgsV2vsIrZkqUn2ql89GFfzTf4vKIVI
 b93XOAdyc3Bv0R4CEvwhDutuMQ==
X-Received: by 2002:a17:903:1247:b0:1ab:afd:903a with SMTP id
 u7-20020a170903124700b001ab0afd903amr44832805plh.24.1684161199510; 
 Mon, 15 May 2023 07:33:19 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 05/54] accel/tcg: Implement helper_{ld,
 st}*_mmu for user-only
Date: Mon, 15 May 2023 07:32:24 -0700
Message-Id: <20230515143313.734053-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Fowd7IZX6kw+

TCG backends may need to defer to a helper to implement
the atomicity required by a given operation.  Mirror the
interface used in system mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-ldst.h |   6 +-
 accel/tcg/user-exec.c  | 393 ++++++++++++++++++++++++++++-------------
 tcg/tcg.c              |   6 +-
 3 files changed, 278 insertions(+), 127 deletions(-)

diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
index 3d897ca942..57fafa14b1 100644
--- a/include/tcg/tcg-ldst.h
+++ b/include/tcg/tcg-ldst.h
@@ -25,8 +25,6 @@
 #ifndef TCG_LDST_H
 #define TCG_LDST_H
 
-#ifdef CONFIG_SOFTMMU
-
 /* Value zero-extended to tcg register size.  */
 tcg_target_ulong helper_ldub_mmu(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi, uintptr_t retaddr);
@@ -58,10 +56,10 @@ void helper_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
 void helper_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                     MemOpIdx oi, uintptr_t retaddr);
 
-#else
+#ifdef CONFIG_USER_ONLY
 
 G_NORETURN void helper_unaligned_ld(CPUArchState *env, target_ulong addr);
 G_NORETURN void helper_unaligned_st(CPUArchState *env, target_ulong addr);
 
-#endif /* CONFIG_SOFTMMU */
+#endif /* CONFIG_USER_ONLY */
 #endif /* TCG_LDST_H */
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index b89fa35a83..d9f9766b7f 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -889,21 +889,6 @@ void page_reset_target_data(target_ulong start, target_ulong last) { }
 
 /* The softmmu versions of these helpers are in cputlb.c.  */
 
-/*
- * Verify that we have passed the correct MemOp to the correct function.
- *
- * We could present one function to target code, and dispatch based on
- * the MemOp, but so far we have worked hard to avoid an indirect function
- * call along the memory path.
- */
-static void validate_memop(MemOpIdx oi, MemOp expected)
-{
-#ifdef CONFIG_DEBUG_TCG
-    MemOp have = get_memop(oi) & (MO_SIZE | MO_BSWAP);
-    assert(have == expected);
-#endif
-}
-
 void helper_unaligned_ld(CPUArchState *env, target_ulong addr)
 {
     cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_LOAD, GETPC());
@@ -914,10 +899,9 @@ void helper_unaligned_st(CPUArchState *env, target_ulong addr)
     cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_STORE, GETPC());
 }
 
-static void *cpu_mmu_lookup(CPUArchState *env, target_ulong addr,
-                            MemOpIdx oi, uintptr_t ra, MMUAccessType type)
+static void *cpu_mmu_lookup(CPUArchState *env, abi_ptr addr,
+                            MemOp mop, uintptr_t ra, MMUAccessType type)
 {
-    MemOp mop = get_memop(oi);
     int a_bits = get_alignment_bits(mop);
     void *ret;
 
@@ -933,100 +917,206 @@ static void *cpu_mmu_lookup(CPUArchState *env, target_ulong addr,
 
 #include "ldst_atomicity.c.inc"
 
-uint8_t cpu_ldb_mmu(CPUArchState *env, abi_ptr addr,
-                    MemOpIdx oi, uintptr_t ra)
+static uint8_t do_ld1_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOp mop, uintptr_t ra)
 {
     void *haddr;
     uint8_t ret;
 
-    validate_memop(oi, MO_UB);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
+    tcg_debug_assert((mop & MO_SIZE) == MO_8);
+    haddr = cpu_mmu_lookup(env, addr, mop, ra, MMU_DATA_LOAD);
     ret = ldub_p(haddr);
     clear_helper_retaddr();
+    return ret;
+}
+
+tcg_target_ulong helper_ldub_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t ra)
+{
+    return do_ld1_mmu(env, addr, get_memop(oi), ra);
+}
+
+tcg_target_ulong helper_ldsb_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t ra)
+{
+    return (int8_t)do_ld1_mmu(env, addr, get_memop(oi), ra);
+}
+
+uint8_t cpu_ldb_mmu(CPUArchState *env, abi_ptr addr,
+                    MemOpIdx oi, uintptr_t ra)
+{
+    uint8_t ret = do_ld1_mmu(env, addr, get_memop(oi), ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
     return ret;
 }
 
+static uint16_t do_ld2_he_mmu(CPUArchState *env, abi_ptr addr,
+                              MemOp mop, uintptr_t ra)
+{
+    void *haddr;
+    uint16_t ret;
+
+    tcg_debug_assert((mop & MO_SIZE) == MO_16);
+    haddr = cpu_mmu_lookup(env, addr, mop, ra, MMU_DATA_LOAD);
+    ret = load_atom_2(env, ra, haddr, mop);
+    clear_helper_retaddr();
+    return ret;
+}
+
+tcg_target_ulong helper_lduw_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    uint16_t ret = do_ld2_he_mmu(env, addr, mop, ra);
+
+    if (mop & MO_BSWAP) {
+        ret = bswap16(ret);
+    }
+    return ret;
+}
+
+tcg_target_ulong helper_ldsw_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    int16_t ret = do_ld2_he_mmu(env, addr, mop, ra);
+
+    if (mop & MO_BSWAP) {
+        ret = bswap16(ret);
+    }
+    return ret;
+}
+
 uint16_t cpu_ldw_be_mmu(CPUArchState *env, abi_ptr addr,
                         MemOpIdx oi, uintptr_t ra)
 {
-    void *haddr;
+    MemOp mop = get_memop(oi);
     uint16_t ret;
 
-    validate_memop(oi, MO_BEUW);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
-    ret = load_atom_2(env, ra, haddr, get_memop(oi));
-    clear_helper_retaddr();
+    tcg_debug_assert((mop & MO_BSWAP) == MO_BE);
+    ret = do_ld2_he_mmu(env, addr, mop, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
     return cpu_to_be16(ret);
 }
 
-uint32_t cpu_ldl_be_mmu(CPUArchState *env, abi_ptr addr,
-                        MemOpIdx oi, uintptr_t ra)
-{
-    void *haddr;
-    uint32_t ret;
-
-    validate_memop(oi, MO_BEUL);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
-    ret = load_atom_4(env, ra, haddr, get_memop(oi));
-    clear_helper_retaddr();
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
-    return cpu_to_be32(ret);
-}
-
-uint64_t cpu_ldq_be_mmu(CPUArchState *env, abi_ptr addr,
-                        MemOpIdx oi, uintptr_t ra)
-{
-    void *haddr;
-    uint64_t ret;
-
-    validate_memop(oi, MO_BEUQ);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
-    ret = load_atom_8(env, ra, haddr, get_memop(oi));
-    clear_helper_retaddr();
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
-    return cpu_to_be64(ret);
-}
-
 uint16_t cpu_ldw_le_mmu(CPUArchState *env, abi_ptr addr,
                         MemOpIdx oi, uintptr_t ra)
 {
-    void *haddr;
+    MemOp mop = get_memop(oi);
     uint16_t ret;
 
-    validate_memop(oi, MO_LEUW);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
-    ret = load_atom_2(env, ra, haddr, get_memop(oi));
-    clear_helper_retaddr();
+    tcg_debug_assert((mop & MO_BSWAP) == MO_LE);
+    ret = do_ld2_he_mmu(env, addr, mop, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
     return cpu_to_le16(ret);
 }
 
+static uint32_t do_ld4_he_mmu(CPUArchState *env, abi_ptr addr,
+                              MemOp mop, uintptr_t ra)
+{
+    void *haddr;
+    uint32_t ret;
+
+    tcg_debug_assert((mop & MO_SIZE) == MO_32);
+    haddr = cpu_mmu_lookup(env, addr, mop, ra, MMU_DATA_LOAD);
+    ret = load_atom_4(env, ra, haddr, mop);
+    clear_helper_retaddr();
+    return ret;
+}
+
+tcg_target_ulong helper_ldul_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    uint32_t ret = do_ld4_he_mmu(env, addr, mop, ra);
+
+    if (mop & MO_BSWAP) {
+        ret = bswap32(ret);
+    }
+    return ret;
+}
+
+tcg_target_ulong helper_ldsl_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    int32_t ret = do_ld4_he_mmu(env, addr, mop, ra);
+
+    if (mop & MO_BSWAP) {
+        ret = bswap32(ret);
+    }
+    return ret;
+}
+
+uint32_t cpu_ldl_be_mmu(CPUArchState *env, abi_ptr addr,
+                        MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    uint32_t ret;
+
+    tcg_debug_assert((mop & MO_BSWAP) == MO_BE);
+    ret = do_ld4_he_mmu(env, addr, mop, ra);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
+    return cpu_to_be32(ret);
+}
+
 uint32_t cpu_ldl_le_mmu(CPUArchState *env, abi_ptr addr,
                         MemOpIdx oi, uintptr_t ra)
 {
-    void *haddr;
+    MemOp mop = get_memop(oi);
     uint32_t ret;
 
-    validate_memop(oi, MO_LEUL);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
-    ret = load_atom_4(env, ra, haddr, get_memop(oi));
-    clear_helper_retaddr();
+    tcg_debug_assert((mop & MO_BSWAP) == MO_LE);
+    ret = do_ld4_he_mmu(env, addr, mop, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
     return cpu_to_le32(ret);
 }
 
+static uint64_t do_ld8_he_mmu(CPUArchState *env, abi_ptr addr,
+                              MemOp mop, uintptr_t ra)
+{
+    void *haddr;
+    uint64_t ret;
+
+    tcg_debug_assert((mop & MO_SIZE) == MO_64);
+    haddr = cpu_mmu_lookup(env, addr, mop, ra, MMU_DATA_LOAD);
+    ret = load_atom_8(env, ra, haddr, mop);
+    clear_helper_retaddr();
+    return ret;
+}
+
+uint64_t helper_ldq_mmu(CPUArchState *env, target_ulong addr,
+                        MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    uint64_t ret = do_ld8_he_mmu(env, addr, mop, ra);
+
+    if (mop & MO_BSWAP) {
+        ret = bswap64(ret);
+    }
+    return ret;
+}
+
+uint64_t cpu_ldq_be_mmu(CPUArchState *env, abi_ptr addr,
+                        MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    uint64_t ret;
+
+    tcg_debug_assert((mop & MO_BSWAP) == MO_BE);
+    ret = do_ld8_he_mmu(env, addr, mop, ra);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
+    return cpu_to_be64(ret);
+}
+
 uint64_t cpu_ldq_le_mmu(CPUArchState *env, abi_ptr addr,
                         MemOpIdx oi, uintptr_t ra)
 {
-    void *haddr;
+    MemOp mop = get_memop(oi);
     uint64_t ret;
 
-    validate_memop(oi, MO_LEUQ);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
-    ret = load_atom_8(env, ra, haddr, get_memop(oi));
-    clear_helper_retaddr();
+    tcg_debug_assert((mop & MO_BSWAP) == MO_LE);
+    ret = do_ld8_he_mmu(env, addr, mop, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
     return cpu_to_le64(ret);
 }
@@ -1037,7 +1127,7 @@ Int128 cpu_ld16_be_mmu(CPUArchState *env, abi_ptr addr,
     void *haddr;
     Int128 ret;
 
-    validate_memop(oi, MO_128 | MO_BE);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == (MO_128 | MO_BE));
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
     memcpy(&ret, haddr, 16);
     clear_helper_retaddr();
@@ -1055,7 +1145,7 @@ Int128 cpu_ld16_le_mmu(CPUArchState *env, abi_ptr addr,
     void *haddr;
     Int128 ret;
 
-    validate_memop(oi, MO_128 | MO_LE);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == (MO_128 | MO_LE));
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
     memcpy(&ret, haddr, 16);
     clear_helper_retaddr();
@@ -1067,87 +1157,153 @@ Int128 cpu_ld16_le_mmu(CPUArchState *env, abi_ptr addr,
     return ret;
 }
 
-void cpu_stb_mmu(CPUArchState *env, abi_ptr addr, uint8_t val,
-                 MemOpIdx oi, uintptr_t ra)
+static void do_st1_mmu(CPUArchState *env, abi_ptr addr, uint8_t val,
+                       MemOp mop, uintptr_t ra)
 {
     void *haddr;
 
-    validate_memop(oi, MO_UB);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
+    tcg_debug_assert((mop & MO_SIZE) == MO_8);
+    haddr = cpu_mmu_lookup(env, addr, mop, ra, MMU_DATA_STORE);
     stb_p(haddr, val);
     clear_helper_retaddr();
+}
+
+void helper_stb_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
+                    MemOpIdx oi, uintptr_t ra)
+{
+    do_st1_mmu(env, addr, val, get_memop(oi), ra);
+}
+
+void cpu_stb_mmu(CPUArchState *env, abi_ptr addr, uint8_t val,
+                 MemOpIdx oi, uintptr_t ra)
+{
+    do_st1_mmu(env, addr, val, get_memop(oi), ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
+static void do_st2_he_mmu(CPUArchState *env, abi_ptr addr, uint16_t val,
+                          MemOp mop, uintptr_t ra)
+{
+    void *haddr;
+
+    tcg_debug_assert((mop & MO_SIZE) == MO_16);
+    haddr = cpu_mmu_lookup(env, addr, mop, ra, MMU_DATA_STORE);
+    store_atom_2(env, ra, haddr, mop, val);
+    clear_helper_retaddr();
+}
+
+void helper_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
+                    MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+
+    if (mop & MO_BSWAP) {
+        val = bswap16(val);
+    }
+    do_st2_he_mmu(env, addr, val, mop, ra);
+}
+
 void cpu_stw_be_mmu(CPUArchState *env, abi_ptr addr, uint16_t val,
                     MemOpIdx oi, uintptr_t ra)
 {
-    void *haddr;
+    MemOp mop = get_memop(oi);
 
-    validate_memop(oi, MO_BEUW);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
-    store_atom_2(env, ra, haddr, get_memop(oi), be16_to_cpu(val));
-    clear_helper_retaddr();
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
-}
-
-void cpu_stl_be_mmu(CPUArchState *env, abi_ptr addr, uint32_t val,
-                    MemOpIdx oi, uintptr_t ra)
-{
-    void *haddr;
-
-    validate_memop(oi, MO_BEUL);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
-    store_atom_4(env, ra, haddr, get_memop(oi), be32_to_cpu(val));
-    clear_helper_retaddr();
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
-}
-
-void cpu_stq_be_mmu(CPUArchState *env, abi_ptr addr, uint64_t val,
-                    MemOpIdx oi, uintptr_t ra)
-{
-    void *haddr;
-
-    validate_memop(oi, MO_BEUQ);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
-    store_atom_8(env, ra, haddr, get_memop(oi), be64_to_cpu(val));
-    clear_helper_retaddr();
+    tcg_debug_assert((mop & MO_BSWAP) == MO_BE);
+    do_st2_he_mmu(env, addr, be16_to_cpu(val), mop, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
 void cpu_stw_le_mmu(CPUArchState *env, abi_ptr addr, uint16_t val,
                     MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+
+    tcg_debug_assert((mop & MO_BSWAP) == MO_LE);
+    do_st2_he_mmu(env, addr, le16_to_cpu(val), mop, ra);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
+}
+
+static void do_st4_he_mmu(CPUArchState *env, abi_ptr addr, uint32_t val,
+                          MemOp mop, uintptr_t ra)
 {
     void *haddr;
 
-    validate_memop(oi, MO_LEUW);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
-    store_atom_2(env, ra, haddr, get_memop(oi), le16_to_cpu(val));
+    tcg_debug_assert((mop & MO_SIZE) == MO_32);
+    haddr = cpu_mmu_lookup(env, addr, mop, ra, MMU_DATA_STORE);
+    store_atom_4(env, ra, haddr, mop, val);
     clear_helper_retaddr();
+}
+
+void helper_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
+                    MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+
+    if (mop & MO_BSWAP) {
+        val = bswap32(val);
+    }
+    do_st4_he_mmu(env, addr, val, mop, ra);
+}
+
+void cpu_stl_be_mmu(CPUArchState *env, abi_ptr addr, uint32_t val,
+                    MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+
+    tcg_debug_assert((mop & MO_BSWAP) == MO_BE);
+    do_st4_he_mmu(env, addr, be32_to_cpu(val), mop, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
 void cpu_stl_le_mmu(CPUArchState *env, abi_ptr addr, uint32_t val,
                     MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+
+    tcg_debug_assert((mop & MO_BSWAP) == MO_LE);
+    do_st4_he_mmu(env, addr, le32_to_cpu(val), mop, ra);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
+}
+
+static void do_st8_he_mmu(CPUArchState *env, abi_ptr addr, uint64_t val,
+                          MemOp mop, uintptr_t ra)
 {
     void *haddr;
 
-    validate_memop(oi, MO_LEUL);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
-    store_atom_4(env, ra, haddr, get_memop(oi), le32_to_cpu(val));
+    tcg_debug_assert((mop & MO_SIZE) == MO_64);
+    haddr = cpu_mmu_lookup(env, addr, mop, ra, MMU_DATA_STORE);
+    store_atom_8(env, ra, haddr, mop, val);
     clear_helper_retaddr();
+}
+
+void helper_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
+                    MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+
+    if (mop & MO_BSWAP) {
+        val = bswap64(val);
+    }
+    do_st8_he_mmu(env, addr, val, mop, ra);
+}
+
+void cpu_stq_be_mmu(CPUArchState *env, abi_ptr addr, uint64_t val,
+                    MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+
+    tcg_debug_assert((mop & MO_BSWAP) == MO_BE);
+    do_st8_he_mmu(env, addr, cpu_to_be64(val), mop, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
 void cpu_stq_le_mmu(CPUArchState *env, abi_ptr addr, uint64_t val,
                     MemOpIdx oi, uintptr_t ra)
 {
-    void *haddr;
+    MemOp mop = get_memop(oi);
 
-    validate_memop(oi, MO_LEUQ);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
-    store_atom_8(env, ra, haddr, get_memop(oi), le64_to_cpu(val));
-    clear_helper_retaddr();
+    tcg_debug_assert((mop & MO_BSWAP) == MO_LE);
+    do_st8_he_mmu(env, addr, cpu_to_le64(val), mop, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
@@ -1156,7 +1312,7 @@ void cpu_st16_be_mmu(CPUArchState *env, abi_ptr addr,
 {
     void *haddr;
 
-    validate_memop(oi, MO_128 | MO_BE);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == (MO_128 | MO_BE));
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
     if (!HOST_BIG_ENDIAN) {
         val = bswap128(val);
@@ -1171,7 +1327,7 @@ void cpu_st16_le_mmu(CPUArchState *env, abi_ptr addr,
 {
     void *haddr;
 
-    validate_memop(oi, MO_128 | MO_LE);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == (MO_128 | MO_LE));
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
     if (HOST_BIG_ENDIAN) {
         val = bswap128(val);
@@ -1269,7 +1425,6 @@ uint64_t cpu_ldq_code_mmu(CPUArchState *env, abi_ptr addr,
     void *haddr;
     uint64_t ret;
 
-    validate_memop(oi, MO_BEUQ);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
     ret = ldq_p(haddr);
     clear_helper_retaddr();
diff --git a/tcg/tcg.c b/tcg/tcg.c
index a26410fb68..dc1c0fdf2b 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -197,8 +197,7 @@ static void tcg_out_st_helper_args(TCGContext *s, const TCGLabelQemuLdst *l,
                                    const TCGLdstHelperParam *p)
     __attribute__((unused));
 
-#ifdef CONFIG_SOFTMMU
-static void * const qemu_ld_helpers[MO_SSIZE + 1] = {
+static void * const qemu_ld_helpers[MO_SSIZE + 1] __attribute__((unused)) = {
     [MO_UB] = helper_ldub_mmu,
     [MO_SB] = helper_ldsb_mmu,
     [MO_UW] = helper_lduw_mmu,
@@ -210,13 +209,12 @@ static void * const qemu_ld_helpers[MO_SSIZE + 1] = {
 #endif
 };
 
-static void * const qemu_st_helpers[MO_SIZE + 1] = {
+static void * const qemu_st_helpers[MO_SIZE + 1] __attribute__((unused)) = {
     [MO_8]  = helper_stb_mmu,
     [MO_16] = helper_stw_mmu,
     [MO_32] = helper_stl_mmu,
     [MO_64] = helper_stq_mmu,
 };
-#endif
 
 TCGContext tcg_init_ctx;
 __thread TCGContext *tcg_ctx;
-- 
2.34.1

