Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp36812lfc;
        Tue, 2 Jun 2020 18:24:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNR9R7VdCTGb8UsBNlQboqOWrwJaeYhm2iB7+ZdJlTrO8Mmcj0mkd66aJIgy6orklTcW8+
X-Received: by 2002:a25:4e0a:: with SMTP id c10mr43696781ybb.346.1591147461132;
        Tue, 02 Jun 2020 18:24:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591147461; cv=none;
        d=google.com; s=arc-20160816;
        b=uGjenAY3wTFGBLWquggL/y45mYhHmeLV+o1lMiMkkJhAK9fLl0D6X2qzJkbzJp92E9
         pgefOy8eOj6RyLEa2+uR1vrEBq3zswlyGCZsMeDmtwAy1LGlKJ8gxmMCHq8cnCUO78EC
         eZN5oRyYGIQ+7QF4eu+XYFARAkQGmfTBbE8ICydPw971UdMDl1lXwu4ZkIRpjycprvYJ
         mdHW2+qaZS0obocN9y1dvikHmz21KygXvhA6tF/W0EUfOFoFE7Pyig0S58cDTVPB8Rcf
         4lrMgg5pvxgVlzRo2vMJsnmfg6+PiUquj5xWKFHX3NMovJAK+sLxPd5tJ9SysdMi35+5
         UtTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hOZXrSo9cXF1wY4dgGHftC4urn5UGRE1IwLPUAUKWmU=;
        b=NsldgY1uhWfT8K9+P7aN21QTsZ/wBJv9OAB0hiRHQ+xioj/sFPpeEp5NRUKoHQElJS
         ckAUe/HZg14gOKHE1cpiAHFwnurGdQY6df/Du+N+o1EfmnKTPlfEqitivY0dBX9oOs+i
         4Ae9G0zKwhNl9tbF3M5KM/S7j4woROzeG1RZQ5o8LkP6ZD8Jm+oEHDFKGwP7MdWKQTEE
         tBxHDO+adjg5Md7Rb5/BCyGYS6zDSpRCarToqS0g4F3dfyQ58MUqnoUJBxOQtZuuyS8p
         0AKCTcBnM9bZPE5hJgmHdDYmxynjvg0PUqp3MNmzwkV/qepIU/zZdpYRXugqKQq9kP29
         BtfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MvVqF6OB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8si293753ybn.417.2020.06.02.18.24.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 18:24:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MvVqF6OB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgI8i-000822-G9
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 21:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHye-0004RM-K8
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:56 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:42684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyd-0003dd-D1
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:56 -0400
Received: by mail-pg1-x542.google.com with SMTP id e9so532941pgo.9
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2020 18:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hOZXrSo9cXF1wY4dgGHftC4urn5UGRE1IwLPUAUKWmU=;
 b=MvVqF6OBkeoC7W7h08RMRuLfXBstRCnyDWGZZBg0/lIKMj0flbgH6EwhwJtk7aCiDM
 1IdN6FD6z7YqYNJl0nsS9Y5vmcbmILfZVtwPpujLKOohSG1a745yCeZlawFZpdW63oHm
 dzN1wPJ4XLHYG39f3VsDzDDnJCvnOWxWRZjCi7Ags7+cJagoTbzAXYXUbmbZgiml89Mu
 wmOAi4C9EF9GI1u/p2gbQlNwnuThGkiAMFIJUSXXfsw5RrcGP/DWeojXfYG09DQgGx/5
 audiKz/+aj4pnf2XwT9PtcDfXNqksim8x4fQsG2T465afPVdlT5eew5p4PByTC52zvBy
 51sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hOZXrSo9cXF1wY4dgGHftC4urn5UGRE1IwLPUAUKWmU=;
 b=cUXjvu3ZJlebjcFG+qOO6DcoF8znoXO1oOPEwZSNBPhu8KEnsv9GIVRllG2QGc828c
 hK5/fkjuI2snS5jkyujrBhJrloaCpLUMkz0b0xNI5/arlK/rNqQPyo7XUNn394MQIFPb
 vEziaJjQL2VgNFiYLzsEbbXXFvcU+VtEJ3/rAozH7Mcl8NfZjDnfN92FAa4qas8C0RtD
 xK3oZJl8pPATNpA+Uq7zdoDy6SQORM1/y9RMIZdNCZa7ma37A//XpyDjjMzCmyGssCwi
 lcVW7ymeDELdAP9EOtukCnOFTG7zVBkua71jNkv+q59bhnLqOZRMD9kZLtCYKYIOmLgy
 +0UQ==
X-Gm-Message-State: AOAM533YMJT4lGh92D2W+8irqedPKy790YOa9AMNDTllVnuuJcG8HMl9
 OIE4RHKjwoC8UIEx8korQf9a2FIOzj8=
X-Received: by 2002:a17:90a:c293:: with SMTP id
 f19mr1350383pjt.91.1591146834107; 
 Tue, 02 Jun 2020 18:13:54 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 3sm290067pfe.85.2020.06.02.18.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 18:13:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 27/42] target/arm: Add helper_mte_check_zva
Date: Tue,  2 Jun 2020 18:13:02 -0700
Message-Id: <20200603011317.473934-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603011317.473934-1-richard.henderson@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6EOgAI7xoJak

Use a special helper for DC_ZVA, rather than the more
general mte_checkN.  Leave the helper blank for now.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.h    |   1 +
 target/arm/mte_helper.c    | 106 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c |  16 +++++-
 3 files changed, 122 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 005af678c7..5b0b699a50 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -106,6 +106,7 @@ DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
 
 DEF_HELPER_FLAGS_3(mte_check1, TCG_CALL_NO_WG, i64, env, i32, i64)
 DEF_HELPER_FLAGS_3(mte_checkN, TCG_CALL_NO_WG, i64, env, i32, i64)
+DEF_HELPER_FLAGS_3(mte_check_zva, TCG_CALL_NO_WG, i64, env, i32, i64)
 DEF_HELPER_FLAGS_3(irg, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_4(addsubg, TCG_CALL_NO_RWG_SE, i64, env, i64, s32, i32)
 DEF_HELPER_FLAGS_3(ldg, TCG_CALL_NO_WG, i64, env, i64, i64)
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index c8a523ed4e..175da11e01 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -661,3 +661,109 @@ uint64_t HELPER(mte_checkN)(CPUARMState *env, uint32_t desc, uint64_t ptr)
 {
     return mte_checkN(env, desc, ptr, GETPC());
 }
+
+/*
+ * Perform an MTE checked access for DC_ZVA.
+ */
+uint64_t HELPER(mte_check_zva)(CPUARMState *env, uint32_t desc, uint64_t ptr)
+{
+    uintptr_t ra = GETPC();
+    int log2_dcz_bytes, log2_tag_bytes;
+    int mmu_idx, bit55;
+    intptr_t dcz_bytes, tag_bytes, i;
+    void *mem;
+    uint64_t ptr_tag, mem_tag, align_ptr;
+
+    bit55 = extract64(ptr, 55, 1);
+
+    /* If TBI is disabled, the access is unchecked, and ptr is not dirty. */
+    if (unlikely(!tbi_check(desc, bit55))) {
+        return ptr;
+    }
+
+    ptr_tag = allocation_tag_from_addr(ptr);
+
+    if (tcma_check(desc, bit55, ptr_tag)) {
+        goto done;
+    }
+
+    /*
+     * In arm_cpu_realizefn, we asserted that dcz > LOG2_TAG_GRANULE+1,
+     * i.e. 32 bytes, which is an unreasonably small dcz anyway, to make
+     * sure that we can access one complete tag byte here.
+     */
+    log2_dcz_bytes = env_archcpu(env)->dcz_blocksize + 2;
+    log2_tag_bytes = log2_dcz_bytes - (LOG2_TAG_GRANULE + 1);
+    dcz_bytes = (intptr_t)1 << log2_dcz_bytes;
+    tag_bytes = (intptr_t)1 << log2_tag_bytes;
+    align_ptr = ptr & -dcz_bytes;
+
+    /*
+     * Trap if accessing an invalid page.  DC_ZVA requires that we supply
+     * the original pointer for an invalid page.  But watchpoints require
+     * that we probe the actual space.  So do both.
+     */
+    mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
+    (void) probe_write(env, ptr, 1, mmu_idx, ra);
+    mem = allocation_tag_mem(env, mmu_idx, align_ptr, MMU_DATA_STORE,
+                             dcz_bytes, MMU_DATA_LOAD, tag_bytes, ra);
+    if (!mem) {
+        goto done;
+    }
+
+    /*
+     * Unlike the reasoning for checkN, DC_ZVA is always aligned, and thus
+     * it is quite easy to perform all of the comparisons at once without
+     * any extra masking.
+     *
+     * The most common zva block size is 64; some of the thunderx cpus use
+     * a block size of 128.  For user-only, aarch64_max_initfn will set the
+     * block size to 512.  Fill out the other cases for future-proofing.
+     *
+     * In order to be able to find the first miscompare later, we want the
+     * tag bytes to be in little-endian order.
+     */
+    switch (log2_tag_bytes) {
+    case 0: /* zva_blocksize 32 */
+        mem_tag = *(uint8_t *)mem;
+        ptr_tag *= 0x11u;
+        break;
+    case 1: /* zva_blocksize 64 */
+        mem_tag = cpu_to_le16(*(uint16_t *)mem);
+        ptr_tag *= 0x1111u;
+        break;
+    case 2: /* zva_blocksize 128 */
+        mem_tag = cpu_to_le32(*(uint32_t *)mem);
+        ptr_tag *= 0x11111111u;
+        break;
+    case 3: /* zva_blocksize 256 */
+        mem_tag = cpu_to_le64(*(uint64_t *)mem);
+        ptr_tag *= 0x1111111111111111ull;
+        break;
+
+    default: /* zva_blocksize 512, 1024, 2048 */
+        ptr_tag *= 0x1111111111111111ull;
+        i = 0;
+        do {
+            mem_tag = cpu_to_le64(*(uint64_t *)(mem + i));
+            if (unlikely(mem_tag != ptr_tag)) {
+                goto fail;
+            }
+            i += 8;
+            align_ptr += 16 * TAG_GRANULE;
+        } while (i < tag_bytes);
+        goto done;
+    }
+
+    if (likely(mem_tag == ptr_tag)) {
+        goto done;
+    }
+
+ fail:
+    /* Locate the first nibble that differs. */
+    i = ctz64(mem_tag ^ ptr_tag) >> 4;
+    mte_check_fail(env, mmu_idx, align_ptr + i * TAG_GRANULE, ra);
+
+ done:
+    return useronly_clean_ptr(ptr);
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index f40eee5a14..c7deeca86a 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1848,7 +1848,21 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         return;
     case ARM_CP_DC_ZVA:
         /* Writes clear the aligned block of memory which rt points into. */
-        tcg_rt = clean_data_tbi(s, cpu_reg(s, rt));
+        if (s->mte_active[0]) {
+            TCGv_i32 t_desc;
+            int desc = 0;
+
+            desc = FIELD_DP32(desc, MTEDESC, MIDX, get_mem_index(s));
+            desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
+            desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
+            t_desc = tcg_const_i32(desc);
+
+            tcg_rt = new_tmp_a64(s);
+            gen_helper_mte_check_zva(tcg_rt, cpu_env, t_desc, cpu_reg(s, rt));
+            tcg_temp_free_i32(t_desc);
+        } else {
+            tcg_rt = clean_data_tbi(s, cpu_reg(s, rt));
+        }
         gen_helper_dc_zva(cpu_env, tcg_rt);
         return;
     default:
-- 
2.25.1

