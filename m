Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087847lfc;
        Thu, 12 Mar 2020 12:42:58 -0700 (PDT)
X-Received: by 2002:a62:382:: with SMTP id 124mr9526809pfd.11.1584042177790;
        Thu, 12 Mar 2020 12:42:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042177; cv=none;
        d=google.com; s=arc-20160816;
        b=uL7IUTdhC57yPaYWEbzp+oPk3nz9cuG1UoTemALT3TMqGnoFkmJMsVmKcZkomICxAf
         KMkLFEJl9RDWt6CoHHNcjqFWeWOa2Z+7Kqk1Ge9ydsrDdqcsgPemJCwJYZrQiRWrqvEH
         h9qMzuMVVQVs42FW8WGqRrjNo60bKbRGgBg07sukuZdfXLAOkoPXmgaHKcPHhKMXStSv
         RqGnO7g7EJsPF1EaSbRNPQwzyU3Gh1IVNsUtOZFHFSsv7UIHNUWMai1SrphAT0sM7fnA
         GHTU8GwOMsyH3VrYx24olGUy7ouT/7v7b0qV8F1+0nkO3o2DPgIAB/2zijLzf+6NpRSj
         yUwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=l4fdd1qv21u4apgj2Ui/FEnaqkbJeg82GeHj3xsXxt4=;
        b=GFQCSpyussVGtyqCnhVgKq3QXKfk9dO8r8S/2DCpT8nXi0nUOaB3AXIZNwqdeaD9Au
         6ZbNBmq+1rra1HZlfTL3HX5uMYD/iX5pE44NCTFq9MmuNqcX8nFOcyyK+59hcEsTU1ar
         6EKilqldJaxlnQiTIvET6e6YEAOUjSynUAct+P5g4EekEXOtlP8Cg80J6wPNfKYI2qdo
         nYcHE8u93+z1qyDARWt2ZJNwKdmIV6slYdXmUeEFjpMyrSLYfuLChZFVXtIkgobT7Ngv
         zn1RmbcDkh98aKdlVfUsLhKbgq4oT4BdH9p8OJSiWQJ8PqPo32Cs/qpxe8AHoP3z0uh6
         lJgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gQFPzVmg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a19sor7732259pls.23.2020.03.12.12.42.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gQFPzVmg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l4fdd1qv21u4apgj2Ui/FEnaqkbJeg82GeHj3xsXxt4=;
        b=gQFPzVmg5+BGlQnuIAYnilzisoZZ+twJ5wd5VCADLC6oMJbIKsTbaFoQfpE9If9M0g
         paTqYtT1V3Cwt2vFuF/MBbQ0v7FbEDJYHJZCUEOnpWGoe4sXoPZ+NctzKrZYgayXX0I/
         ypnPCntmIL1yQN8+ILqbvpA4DqjFJ5U+txhwF9KHHT9hf4o1HKnXFRngNIKiIZG4Clm0
         911K33ycyv4xqfZ68nBj/W1EsDTX9WMHMNw+jPrnbbhmfR06vCRkluna2H2YX7l25wro
         f6xY8gxDtsegqALlk0JD3OZZuyXwj24Kw0lJ//KPN+H52honxJtSP/+yN8N39jqcxlLz
         dxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l4fdd1qv21u4apgj2Ui/FEnaqkbJeg82GeHj3xsXxt4=;
        b=MDb0Q2ZSki71m1/LeDjidv+py5x9VrG9ta3W1TKVqZhHdoAYKyFMHN5hsxK6YnQJY3
         sGuZ8LLyQ5L601pNSjI/jJE4PsD6++G4U5uHtCThVVmZAo48GYczCvZGu4aFBE3sFazm
         BtlZxqxDiIcVtMLDeAN4z1PkGOaGkllqiMTcDeAaTYOU9UuB78Pn/7PX8eI9Hd9TuDSQ
         nsGx/dALPQTQ0UYS6/W47efyqaRfj/U88i2TP1J0wsTyd0A+3cbF4H55/txshpsw3cJi
         gKz35B17/QF++CPlpllJd4zOxP/TzqiQAHecTRohrQPZyq6JyZ722hSmalBu3Vqsu7kr
         /INw==
X-Gm-Message-State: ANhLgQ1HwQUgKSfn6m7N7k6iaJuw4yV4YjgZSbggKHsvfst3rv5vUJ5F
	bCoZOa3j74En1SYv/ucoNqR1r1ed5RrrMA==
X-Google-Smtp-Source: ADFU+vseWBAauiE3eq/GJiFentIPu8Klge7yAzzer3YShMs1RJqXVWMZWFUxJpY7K7txwtEJOXPFaQ==
X-Received: by 2002:a17:902:bb83:: with SMTP id m3mr9738494pls.258.1584042177184;
        Thu, 12 Mar 2020 12:42:57 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 27/42] target/arm: Add helper_mte_check_zva
Date: Thu, 12 Mar 2020 12:42:04 -0700
Message-Id: <20200312194219.24406-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: B5K6GSVyvpGU

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
index 94f67b33d1..c51f7f04f4 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -658,3 +658,109 @@ uint64_t HELPER(mte_checkN)(CPUARMState *env, uint32_t desc, uint64_t ptr)
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
index c6187ccd60..d86c13a32d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1902,7 +1902,21 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
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
2.20.1
