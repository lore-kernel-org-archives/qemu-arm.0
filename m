Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF00CD6E4A
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 19:53:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT3Gl-0005cy-UZ; Fri, 29 May 2026 15:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wT3GY-00050S-R1
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:53:11 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wT3GW-0005aL-Ur
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:53:10 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-7e6201aeb2aso6482052a34.3
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 12:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780084388; x=1780689188; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OJWK/EkTlXrsXIihSwbH79j1+Y9Z/xhoRkrOHiWGDKk=;
 b=Qy3KWGOryzu0R/RDeo7KnWhOBpBipKfcYIcMqH6R/jPBtOR4FGIWpDbkKkXrUMVPCk
 wsoSWXyJhdsfD749YxPEJ5L71bdx6KAvvncbP/Leb157tYLVxjYK8M/7nxH2q9WFh79E
 8gm6l4vGF7PtBJ5OQDJCqurJoSQpy8w/UNAC6LTbuXcO82qBWuPD0h4Q+p48V0ZH+MML
 YZD70B3HUEgjE0K2dhqZ7NQ0KTHjhBF8F3qn7CiB/ejqG+PL5b4di6+0Jwqds7PYrPFr
 wBMrIbbt28UjsMhWSUoYQ2yaypV9iUR+XK3oNdfuhQqikUhFyxwMJ3d9nNtRO62OWG/1
 LZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780084388; x=1780689188;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OJWK/EkTlXrsXIihSwbH79j1+Y9Z/xhoRkrOHiWGDKk=;
 b=E0naztRNk5NlEYqPqrqxewAtVyBHob5yrs9/PAtjbyq61xlU/RCmKBeRQFQhhSXais
 dJbg4Yz6LgpyImlRp9/w7+LgJqjyl1O91nwfTFa87tHg+wqTFQ3GhZfcNfpysSaVkegy
 bFnoBaoo4n5EymoPHmLkIrCKXfOzwMLk2Y7gMFcd1t5WyscKvE7duYsT3j83qwsuDDb4
 B62MneKNOgYT7dPdYS0Ty5OmY9pY9qd45SKQELWeBVx2CSIkWOtpL00bq8l48aIiraua
 OIdUJnXikNgwtgCpXgflFo/pnyu5986rdZDtXS2x5kr5hjtMjYTrGggh7ZZNBJoPWoUd
 xcbw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9TMJFqwVwc5NFr+HGJ2I1DnGBYwpJzP0UKPQCBno2dsqhganrfDBBeUSxAuX/6GLc6CO4MrGnHhQ==@nongnu.org
X-Gm-Message-State: AOJu0YzcYP3IYkp9KR0STT5boEInyb5mucpVbqzcuGYar7D3ImEaaW7a
 sT2N0xMpBaT2M+1nNrvwKog6eXa1s20oXSdsfMwnSFr+FOj87iIUJM4/
X-Gm-Gg: Acq92OHTyGYp8bYf8vY+wOnpOVjJbIk86R/SgUeiMyOVW6Twu1Hhkri4U+fzBgq2MCd
 cg4qjUjs/Mvx9+gZ70ON+xxnwteT2c+v9mXFV/cZSGGYDebUf3757Xn2H7MD96LmrDVDgt0LlhI
 ZR8+MW5szr+1T3ee25gl0dDzSGlrXmjP/dGtgHIf+ck+WjFkNDK4hFTfR+k7IPZZad2adqOZRUq
 sDUwEnBZG0xbXf2GejGz9Km6MK4nTyk7IrvlDsQnVfovTDoKCZRDjqkiG+xuX7f8CToEuWNug8E
 wJ5HUo/WbqGTgxr8ygA2pLdjTj+2jsctTu3fH+6t4wFk/aaUyxn/vN/WI3W3Slz5/EXMGThGIb7
 A9oMClYv1Io9trCNQqxzMMgSYXgtZPzFsslPXT36x6arMl36nEvuGTFvpbhQ3Gf43+/k+Nx9lK9
 h53fBAW3xpuS2FmJP0BeHdLWL40aMvO0RL24qIqso/2lbHcyLiEpv9Dw==
X-Received: by 2002:a05:6820:2906:b0:69d:f794:5959 with SMTP id
 006d021491bc7-69e105c89bbmr380990eaf.56.1780084387759; 
 Fri, 29 May 2026 12:53:07 -0700 (PDT)
Received: from [10.21.163.79] ([146.74.94.63])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-69e06587eecsm1626692eaf.0.2026.05.29.12.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 12:53:07 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Fri, 29 May 2026 12:52:49 -0700
Subject: [PATCH v7 09/15] target/arm: load on canonical tag loads ext bits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-feat-mte4-v7-9-ccbd3c14eb3c@gmail.com>
References: <20260529-feat-mte4-v7-0-ccbd3c14eb3c@gmail.com>
In-Reply-To: <20260529-feat-mte4-v7-0-ccbd3c14eb3c@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780084373; l=4424;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=ucqsYSjKNLvRjA8zNnf+RDqvB6/wlstLRsyvDgUe30c=;
 b=uTgMOcWX5l91glXE/ctf6rvfNpOSuGieGWKAhAlj4MWi7/Kw7JfHSOqHippSJuKyE2bs0lXw1
 OHuoZoqmQAaC0p0nW60B2jxYiX8pNq7pgTtafpnIUMdMyA14VB4mOEO
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=brookmangabriel@gmail.com; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-a64-defs.h |  4 ++--
 target/arm/tcg/mte_helper.c      | 14 ++++++++++++--
 target/arm/tcg/translate-a64.c   |  4 ++--
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/target/arm/tcg/helper-a64-defs.h b/target/arm/tcg/helper-a64-defs.h
index b7880f773e..c196c927f4 100644
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
index d35e3ef04d..c382f0149f 100644
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
@@ -317,6 +317,9 @@ uint64_t HELPER(ldg)(CPUARMState *env, uint64_t ptr, uint64_t xt)
     /* Load if page supports tags. */
     if (mem) {
         rtag = load_tag1(ptr, mem);
+    } else if (mtx) {
+        uint64_t bit55 = extract64(ptr, 55, 1);
+        rtag = 0xF * bit55;
     }
 
     return address_with_allocation_tag(xt, rtag);
@@ -458,7 +461,7 @@ void HELPER(st2g_stub)(CPUARMState *env, uint64_t ptr)
     }
 }
 
-uint64_t HELPER(ldgm)(CPUARMState *env, uint64_t ptr)
+uint64_t HELPER(ldgm)(CPUARMState *env, uint64_t ptr, uint32_t mtx)
 {
     int mmu_idx = arm_env_mmu_index(env);
     uintptr_t ra = GETPC();
@@ -476,6 +479,13 @@ uint64_t HELPER(ldgm)(CPUARMState *env, uint64_t ptr)
 
     /* The tag is squashed to zero if the page does not support tags.  */
     if (!tag_mem) {
+        /* Load canonical value if mtx is set (untagged memory region) */
+        if (mtx) {
+            bool bit55 = extract64(ptr, 55, 1);
+            ret = extract64(-bit55, 0, 1 << gm_bs);
+            shift = extract64(ptr, LOG2_TAG_GRANULE, 4) * 4;
+            return ret << shift;
+        }
         return 0;
     }
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 036081d897..852578aae1 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4715,7 +4715,7 @@ static bool trans_LDGM(DisasContext *s, arg_ldst_tag *a)
     tcg_rt = cpu_reg(s, a->rt);
 
     if (s->ata[0]) {
-        gen_helper_ldgm(tcg_rt, tcg_env, addr);
+        gen_helper_ldgm(tcg_rt, tcg_env, addr, tcg_constant_i32(s->mtx));
     } else {
         MMUAccessType acc = MMU_DATA_LOAD;
         int size = 4 << s->gm_blocksize;
@@ -4750,7 +4750,7 @@ static bool trans_LDG(DisasContext *s, arg_ldst_tag *a)
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


