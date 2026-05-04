Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625D1FF885A
	for <qemu-arm@archiver.kernel.org>; Mon,  4 May 2026 15:53:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wJvZv-00010Y-Qb; Mon, 04 May 2026 11:51:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wJvZu-0000zE-BU
 for qemu-arm@nongnu.org; Mon, 04 May 2026 11:51:26 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wJvZs-0006E3-AI
 for qemu-arm@nongnu.org; Mon, 04 May 2026 11:51:26 -0400
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-50e594413c2so26195181cf.0
 for <qemu-arm@nongnu.org>; Mon, 04 May 2026 08:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777909883; x=1778514683; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MG1iwnko83uMuVMCUIM9KDLK/vF8JVyEE/TaS9GVUps=;
 b=ZvOQttqBpltWABpGJZWbBcp4yxDvrGNoCAsseCAiVLSYumqyZstWFo3Eais5hzZZcc
 WYz6EnMZSBiSmga62pZRSqDZP/CgW0xEJg6+lWKCE6Gn87AZJ9hmPwGJSxUkZndXuPjX
 ReXwbsKDLBOfZo31p9nSNXePR+UjyoP1MZJIGJh+7u0eh/ZqwHhNVCWy/UJz9r0cn2Wu
 4EjXWY/H/SBIywjrO5+NvAa/o5uBuZTnr2L0avc9ltYuBoLLS1CbfQEo9QQe6HI3RKFj
 behE0h9vwHeYF9sw213zyquBM0tgAOrRoPQDu9wRxtEiJLRdej32akO74K5fzg3u0U1p
 Hd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777909883; x=1778514683;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MG1iwnko83uMuVMCUIM9KDLK/vF8JVyEE/TaS9GVUps=;
 b=jrIApuWwhbCC/oZ9+SrltuaEf/nUtShRcWTQgedn2LoEQXJ2ZJSfmt1E1YQ6a5BsRE
 hQLHI0GRvFc66z6kPhhIM3+JAvz7JQ+SnyauTEZgaCenczsk+ItqbgCNDbwEi+gwrSxT
 oJj5MIRDoOy3DRgAEijfJkaDQ5PjRX3ecX4c2AEFSZ7uKE0goaNF/BLKqIQTcWxCcXC5
 L5ueptXchxIcWL5qctjAJuM2/PEjm7b4tdDuZSZSqLBy/5TxtUlCYusonC20XWIYNiXq
 7hY/6MeyGSs199nDj3qKKpL8dvPV/5ihiF95JcntGAynVyj6Uqyz49UXHoan/7+UE2db
 /PUw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Cj7qtxsnG9rWyOAqDRHYKtX/AScfpyVl56BJm/g004gbqk59iqtlADIipdnLGNoV2b6m7RVZbtg==@nongnu.org
X-Gm-Message-State: AOJu0YyWId32IminkAZc0xoFqWUoF2KbOYLg7txZL4w+UveE55zgAkqL
 +85DdJ8I/LRROO7LoIaipluIVW785k+VQ3mOCWoXJbKTZv7gJwxK0Fdm
X-Gm-Gg: AeBDiesEaH6IEq5XV5/q4SX5aG/IIJT6V02uEssV7mTbq2Ekv0STL8KhEtT0C1a0QHW
 oiW3Xtoh21IhlheljnLqo7M0cHRUUvQfabJlsW6h99LRHuPhAj+3Rlk3ExE2iSsBrDlRQ+quOQd
 EKj2sEeMieXUP2RQOdQpJjz+O5oATdcZSagpWK9kBpOY3gjENJbC7qyzR9tAo4/DpZU3xCScEnG
 DKYPUbXWeT2uVtT2wXm5D/LSCeXHa85PRQPfSAfztu7ASnshjVegbSLgllms51bAVFLc6+4Ss62
 JAQ0cBWHmoRhNVWvveKcxkY0zNaUN2vOkb3RGJgxo+k702zoUof4aNKnZjFylQnXjS3zYqUR2v0
 oSSmQ44dW+vMdseTQVEH8WPaZGKTtmrlu2zRRMJR3imk1QmaGY4eIw3enyCLcA/dEz7cjpsD45e
 latytVzQvxe+OggbbsTu96Rxw30wo3hR/ptnqzNp0vD851bM2nzcQ=
X-Received: by 2002:a05:622a:1f8c:b0:50f:b7b3:2ec4 with SMTP id
 d75a77b69052e-5130534b3bbmr803141cf.25.1777909881921; 
 Mon, 04 May 2026 08:51:21 -0700 (PDT)
Received: from [192.168.1.164] ([2600:1009:a021:c665:5296:905f:3e4a:eb90])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51040931552sm99599011cf.12.2026.05.04.08.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 08:51:21 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Mon, 04 May 2026 11:50:42 -0400
Subject: [PATCH v5 09/15] target/arm: load on canonical tag loads ext bits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-feat-mte4-v5-9-232a648e63c6@gmail.com>
References: <20260504-feat-mte4-v5-0-232a648e63c6@gmail.com>
In-Reply-To: <20260504-feat-mte4-v5-0-232a648e63c6@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777909867; l=5681;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=Ws2Tqe13fBijY+IHknD2CyebZv1in1ArUctH8Hio2sA=;
 b=oz8eYjE5Vhv9ZTARi40/Hp4hw9BTP367GpMsUgRMbeoVgKXesDUDsrV4q+eHUAoXCN10U4XKi
 TjEmXWkKoGZCOfw5lW6i1VHoDaYhtfJGVF+zbu/NgSZ3rybx9vBpuSW
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=brookmangabriel@gmail.com; helo=mail-qt1-x829.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Loading tags from canonically tagged regions should use the canonical
tags (extension bits), not allocation tags. See AArch64_MemTagRead().

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
---
 target/arm/tcg/helper-a64-defs.h |  4 ++--
 target/arm/tcg/mte_helper.c      | 42 +++++++++++++++++++++++++++++++++++++---
 target/arm/tcg/translate-a64.c   |  4 ++--
 3 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/target/arm/tcg/helper-a64-defs.h b/target/arm/tcg/helper-a64-defs.h
index 3c3c5dddb7..c08c8c3991 100644
--- a/target/arm/tcg/helper-a64-defs.h
+++ b/target/arm/tcg/helper-a64-defs.h
@@ -102,14 +102,14 @@ DEF_HELPER_FLAGS_3(mte_check, TCG_CALL_NO_WG, i64, env, i32, i64)
 DEF_HELPER_FLAGS_3(mte_check_zva, TCG_CALL_NO_WG, i64, env, i32, i64)
 DEF_HELPER_FLAGS_3(irg, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_4(addsubg, TCG_CALL_NO_RWG_SE, i64, env, i64, s32, i32)
-DEF_HELPER_FLAGS_3(ldg, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_4(ldg, TCG_CALL_NO_WG, i64, env, i64, i64, i32)
 DEF_HELPER_FLAGS_3(stg, TCG_CALL_NO_WG, void, env, i64, i64)
 DEF_HELPER_FLAGS_3(stg_parallel, TCG_CALL_NO_WG, void, env, i64, i64)
 DEF_HELPER_FLAGS_2(stg_stub, TCG_CALL_NO_WG, void, env, i64)
 DEF_HELPER_FLAGS_3(st2g, TCG_CALL_NO_WG, void, env, i64, i64)
 DEF_HELPER_FLAGS_3(st2g_parallel, TCG_CALL_NO_WG, void, env, i64, i64)
 DEF_HELPER_FLAGS_2(st2g_stub, TCG_CALL_NO_WG, void, env, i64)
-DEF_HELPER_FLAGS_2(ldgm, TCG_CALL_NO_WG, i64, env, i64)
+DEF_HELPER_FLAGS_3(ldgm, TCG_CALL_NO_WG, i64, env, i64, i32)
 DEF_HELPER_FLAGS_3(stgm, TCG_CALL_NO_WG, void, env, i64, i64)
 DEF_HELPER_FLAGS_3(stzgm_tags, TCG_CALL_NO_WG, void, env, i64, i64)
 
diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index d35e3ef04d..8ed31ca2d8 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -304,7 +304,7 @@ int load_tag1(uint64_t ptr, uint8_t *mem)
     return extract32(*mem, ofs, 4);
 }
 
-uint64_t HELPER(ldg)(CPUARMState *env, uint64_t ptr, uint64_t xt)
+uint64_t HELPER(ldg)(CPUARMState *env, uint64_t ptr, uint64_t xt, uint32_t mtx)
 {
     int mmu_idx = arm_env_mmu_index(env);
     uint8_t *mem;
@@ -317,6 +317,11 @@ uint64_t HELPER(ldg)(CPUARMState *env, uint64_t ptr, uint64_t xt)
     /* Load if page supports tags. */
     if (mem) {
         rtag = load_tag1(ptr, mem);
+    } else {
+        uint64_t bit55 = extract64(ptr, 55, 1);
+        if (mtx) {
+            rtag = 0xF * bit55;
+        }
     }
 
     return address_with_allocation_tag(xt, rtag);
@@ -458,17 +463,19 @@ void HELPER(st2g_stub)(CPUARMState *env, uint64_t ptr)
     }
 }
 
-uint64_t HELPER(ldgm)(CPUARMState *env, uint64_t ptr)
+uint64_t HELPER(ldgm)(CPUARMState *env, uint64_t ptr, uint32_t mtx)
 {
     int mmu_idx = arm_env_mmu_index(env);
     uintptr_t ra = GETPC();
     int gm_bs = env_archcpu(env)->gm_blocksize;
     int gm_bs_bytes = 4 << gm_bs;
     void *tag_mem;
-    uint64_t ret;
+    uint64_t ret, canonical_tag_val;
     int shift;
+    bool bit55;
 
     ptr = QEMU_ALIGN_DOWN(ptr, gm_bs_bytes);
+    bit55 = extract64(ptr, 55, 1);
 
     /* Trap if accessing an invalid page.  */
     tag_mem = allocation_tag_mem(env, mmu_idx, ptr, MMU_DATA_LOAD,
@@ -476,6 +483,35 @@ uint64_t HELPER(ldgm)(CPUARMState *env, uint64_t ptr)
 
     /* The tag is squashed to zero if the page does not support tags.  */
     if (!tag_mem) {
+        /* Load canonical value if mtx is set (untagged memory region) */
+        if (mtx) {
+            canonical_tag_val = -(uint64_t)bit55;
+            switch (gm_bs) {
+            case 3:
+                /* 32 bytes -> 2 tags -> 8 result bits */
+                ret = (uint8_t)canonical_tag_val;
+                break;
+            case 4:
+                /* 64 bytes -> 4 tags -> 16 result bits */
+                ret = (uint16_t)canonical_tag_val;
+                break;
+            case 5:
+                /* 128 bytes -> 8 tags -> 32 result bits */
+                ret = (uint32_t)canonical_tag_val;
+                break;
+            case 6:
+                /* 256 bytes -> 16 tags -> 64 result bits */
+                return canonical_tag_val;
+            default:
+                /*
+                 * CPU configured with unsupported/invalid gm blocksize.
+                 * This is detected early in arm_cpu_realizefn.
+                 */
+                g_assert_not_reached();
+            }
+            shift = extract64(ptr, LOG2_TAG_GRANULE, 4) * 4;
+            return ret << shift;
+        }
         return 0;
     }
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index cd86178d56..5fbc54de4b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4711,7 +4711,7 @@ static bool trans_LDGM(DisasContext *s, arg_ldst_tag *a)
     tcg_rt = cpu_reg(s, a->rt);
 
     if (s->ata[0]) {
-        gen_helper_ldgm(tcg_rt, tcg_env, addr);
+        gen_helper_ldgm(tcg_rt, tcg_env, addr, tcg_constant_i32(s->mtx));
     } else {
         MMUAccessType acc = MMU_DATA_LOAD;
         int size = 4 << s->gm_blocksize;
@@ -4746,7 +4746,7 @@ static bool trans_LDG(DisasContext *s, arg_ldst_tag *a)
     tcg_gen_andi_i64(addr, addr, -TAG_GRANULE);
     tcg_rt = cpu_reg(s, a->rt);
     if (s->ata[0]) {
-        gen_helper_ldg(tcg_rt, tcg_env, addr, tcg_rt);
+        gen_helper_ldg(tcg_rt, tcg_env, addr, tcg_rt, tcg_constant_i32(s->mtx));
     } else {
         /*
          * Tag access disabled: we must check for aborts on the load

-- 
2.54.0


