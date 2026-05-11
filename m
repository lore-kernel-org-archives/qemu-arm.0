Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0602CCD484C
	for <qemu-arm@archiver.kernel.org>; Mon, 11 May 2026 14:07:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMRDR-0004Pb-K8; Mon, 11 May 2026 10:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wMRCA-0003x7-TY
 for qemu-arm@nongnu.org; Mon, 11 May 2026 10:01:35 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wMRC4-000620-7x
 for qemu-arm@nongnu.org; Mon, 11 May 2026 10:01:15 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-631a7868228so1391686137.0
 for <qemu-arm@nongnu.org>; Mon, 11 May 2026 07:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778508070; x=1779112870; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=B3SZytY5PYBqvEiH+OmJzIbvZ0fUKiNr0im7vtwJjxA=;
 b=EuUy9kJYy+uzNW8VFfRtrnzAtHUC1akEYGOBbwBQsO7eDjqjnkrGBXj+CR6bHT3ipj
 IayDSi10P1VJ64d5saWU0t7rl/sDyL04hhlHGeJ/AGL77Ed9hqRWNWOzCOh9KRPEIYyQ
 a8g348VQSM9sMdwa8fd0XoqA3UkRw4RNY7zMZ2zpu9KG01adUdkKjnzIzJEL/GBghuSR
 qKw5M/Pcw8bKRJ0IX0ASbIqoKvNpmdSc2Nia54nkWB42InjBZkV9mBBF39boUzWzVhjH
 nMe5vO+jDdh9NmsYDazgD8eyRWdxY6Jx5Xw9WbQA4B+ptihG217poeGbXn9P6avBmKND
 LBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778508070; x=1779112870;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=B3SZytY5PYBqvEiH+OmJzIbvZ0fUKiNr0im7vtwJjxA=;
 b=V9HWoamFrHKoOHF92dth8iRxYM0XBkaNelMbZmTe47DcKJsKPGOZUSZtWv+5zs2QdG
 box9jAZ5W/4mPKEle1ApyEI3YAQ83693xboBhKbQk4dpG9Qs1ojaGpq9XraRfWMA5+Xh
 XF2lLVXdzEm1wg5IfdYaPVDwveUpfX8F+/c/wxtuOlg+Z4+0Jo+GxNiV29td9lzpnCkt
 hz/dSLMU5FMAn96CYohD5xsUXTpwNV17ihLVP/gv9RgNvUMHchO2NugMCmRNKjfNllOe
 az5KP66b/a52Rq6m7AjqipoGyBxh6I3+L5aflU1DtQfCZ86807ZL37LgHwnnWtoUxN0A
 NIXA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8cgojVI071mHWKI1QeAU495Uzhd1dXcjmi8xnEBk55i9SKyoOOMNyHOMBdH9s4QQZ4gEBJytCC/w==@nongnu.org
X-Gm-Message-State: AOJu0Yz+bg1RphA1/pKD4TWrVbbOaZjItXyOnkIM/87WDCxsSyrZwUF3
 t5H2rTG5EtkJgWtEB5n5dxpm08+eTw64laT1h8D4cIIJVvlLP/g1Xu7k
X-Gm-Gg: Acq92OEs/29NRssqEjEAQfYdeITIUtaTUCBCLnaaXKo6xWgP9Gl9T5kT0waK4LHK0oT
 afqAfBUsy1j4yZnQ2x29LIkMOStjcSst3ipqG5fOFl0d3LoC75EYOEtQ0xb2qsvvs3pwt9WV+yc
 ea3yBi9kZHLgu7m/MupZ20v5oNCitqj9uzh8/fD1zc/MEy9UQmlFZfJO02YnwVsyWZEaDudzqAK
 hXvN5BdKSwPeV6FnjJWPcsNBMquhSy6Oy5Xys6pAT8fhLtoKSTe4zFFmFL4Gu0v1LZFFIx0hSyd
 azgbGnZdzjZMeRiQeRZ0g8AUCPATwy+6Sef8XIAvPR5MkHonyOZdgx2K9Cj1YvJf1ORMze8k61x
 RDhxptzXz0utAnKgp/jC6X2ScbebL/WSE9Bi4EnQgfs9iPEj8MB+Z9GDaaCUNDas66rFn/l5tRy
 dXTysAFlU3sNrcSOMDLwecCo7qTo0jenlJqBkCj4Ex
X-Received: by 2002:a05:6102:418e:b0:632:73ad:6c8 with SMTP id
 ada2fe7eead31-63273ad1419mr3576864137.7.1778508070281; 
 Mon, 11 May 2026 07:01:10 -0700 (PDT)
Received: from [192.168.1.160] ([2600:4041:54f3:a400:c013:3550:ed5f:a59a])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8bf39c7dd09sm94773756d6.31.2026.05.11.07.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 07:01:09 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Mon, 11 May 2026 10:01:01 -0400
Subject: [PATCH v6 03/15] target/arm: mte_check unemitted on STORE_ONLY
 load
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-feat-mte4-v6-3-8557cc1313b9@gmail.com>
References: <20260511-feat-mte4-v6-0-8557cc1313b9@gmail.com>
In-Reply-To: <20260511-feat-mte4-v6-0-8557cc1313b9@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778508062; l=4552;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=rH8vC1onC8Ly7tRYKkxqsrL8toXuandudSiZ9ut8IVY=;
 b=CRJQuU7GXeChta0scZqptI8Qg/vLNxIT7BkVl9Uc2V+Qrg5+b/K6Ssb2SFApymVjN/9UBX/S0
 3t+zA40h7EQCIYk2UnI3aOqN4c8i7HB7/Ha5p1s7Nv6UEADKxlB6PMt
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=brookmangabriel@gmail.com; helo=mail-vs1-xe2b.google.com
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

This feature disables generation of the mte check helper on loads when
STORE_ONLY tag checking mode is enabled.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h               |  2 ++
 target/arm/tcg/hflags.c        | 12 ++++++++++++
 target/arm/tcg/translate-a64.c |  8 ++++++--
 target/arm/tcg/translate.h     |  2 ++
 4 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 0894a050b1..fce0bde168 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2531,6 +2531,8 @@ FIELD(TBFLAG_A64, ZT0EXC_EL, 39, 2)
 FIELD(TBFLAG_A64, GCS_EN, 41, 1)
 FIELD(TBFLAG_A64, GCS_RVCEN, 42, 1)
 FIELD(TBFLAG_A64, GCSSTR_EL, 43, 2)
+FIELD(TBFLAG_A64, MTE_STORE_ONLY, 45, 1)
+FIELD(TBFLAG_A64, MTE0_STORE_ONLY, 46, 1)
 
 /*
  * Helpers for using the above. Note that only the A64 accessors use
diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index 7e6f8d3647..75c55b1a6d 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -423,6 +423,15 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                      */
                     DP_TBFLAG_A64(flags, MTE0_ACTIVE, 1);
                 }
+                /*
+                 * Repeat for MTE_STORE_ONLY
+                 */
+                if ((el == 0 ? SCTLR_TCSO0 : SCTLR_TCSO) & sctlr) {
+                    DP_TBFLAG_A64(flags, MTE_STORE_ONLY, 1);
+                    if (!EX_TBFLAG_A64(flags, UNPRIV)) {
+                        DP_TBFLAG_A64(flags, MTE0_STORE_ONLY, 1);
+                    }
+                }
             }
         }
         /* And again for unprivileged accesses, if required.  */
@@ -432,6 +441,9 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
             && (sctlr & SCTLR_TCF0)
             && allocation_tag_access_enabled(env, 0, sctlr)) {
             DP_TBFLAG_A64(flags, MTE0_ACTIVE, 1);
+            if (SCTLR_TCSO0 & sctlr) {
+                DP_TBFLAG_A64(flags, MTE0_STORE_ONLY, 1);
+            }
         }
         /*
          * For unpriv tag-setting accesses we also need ATA0. Again, in
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 9a27c4c6ec..ce6249649a 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -302,7 +302,8 @@ static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
                                       MemOp memop, bool is_unpriv,
                                       int core_idx)
 {
-    if (tag_checked && s->mte_active[is_unpriv]) {
+    if (tag_checked && s->mte_active[is_unpriv] &&
+        (is_write || !s->mte_store_only[is_unpriv])) {
         TCGv_i64 ret;
         int desc = 0;
 
@@ -334,7 +335,8 @@ TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
 TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, int total_size, MemOp single_mop)
 {
-    if (tag_checked && s->mte_active[0]) {
+    if (tag_checked && s->mte_active[0] &&
+        (is_write || !s->mte_store_only[0])) {
         TCGv_i64 ret;
         int desc = 0;
 
@@ -10697,6 +10699,8 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->ata[1] = EX_TBFLAG_A64(tb_flags, ATA0);
     dc->mte_active[0] = EX_TBFLAG_A64(tb_flags, MTE_ACTIVE);
     dc->mte_active[1] = EX_TBFLAG_A64(tb_flags, MTE0_ACTIVE);
+    dc->mte_store_only[0] = EX_TBFLAG_A64(tb_flags, MTE_STORE_ONLY);
+    dc->mte_store_only[1] = EX_TBFLAG_A64(tb_flags, MTE0_STORE_ONLY);
     dc->pstate_sm = EX_TBFLAG_A64(tb_flags, PSTATE_SM);
     dc->pstate_za = EX_TBFLAG_A64(tb_flags, PSTATE_ZA);
     dc->sme_trap_nonstreaming = EX_TBFLAG_A64(tb_flags, SME_TRAP_NONSTREAMING);
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 77fdc5f3a1..c74a4f6675 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -140,6 +140,8 @@ typedef struct DisasContext {
     bool ata[2];
     /* True if v8.5-MTE tag checks affect the PE; index with is_unpriv.  */
     bool mte_active[2];
+    /* True if v8.5-MTE tag checks disabled for reads; index with is_unpriv. */
+    bool mte_store_only[2];
     /* True with v8.5-BTI and SCTLR_ELx.BT* set.  */
     bool bt;
     /* True if any CP15 access is trapped by HSTR_EL2 */

-- 
2.54.0


