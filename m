Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A945AC79FB7
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Jan 2026 18:17:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vcp7X-00019q-NN; Mon, 05 Jan 2026 13:15:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vcp7P-00015c-6x
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 13:15:51 -0500
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vcp76-00034p-0Z
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 13:15:37 -0500
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-888bd3bd639so2575296d6.1
 for <qemu-arm@nongnu.org>; Mon, 05 Jan 2026 10:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767636930; x=1768241730; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JsFy8Iyum9ah2SkooVn94rXucxc4Cbh0xRfZphDpj7A=;
 b=RT2hpjnryePmIjObN1FkTJr27MBU5JLvSHLDKGNt437Yv9BD6l/f1mvKE5oiBEi+Lr
 qsLsgDwguHaBwgM+ORoyBNMH5Wkt/N7jcctEbEeSkXKJr3Hf/ny+ecb52pJTWi0lM82P
 yVmN3ykefbiwGHjcjBLPNJvPwWSLFqdo+XD6yaruQDjoQ2YTVi7dSURjSMvQP48ROuXu
 yw+OVh2pa+hCkvpRYyxwX3XtUbcual/TZSHHI7vLf876g8SCBErbaoEGId99PT8xdc2s
 qKhB+qiSLI8MHqRgbzbK3tqau9NQRb+iqhXI50eK1jdAhx7KnPTxnVIhIuxP1fdeaMHe
 eAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767636930; x=1768241730;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JsFy8Iyum9ah2SkooVn94rXucxc4Cbh0xRfZphDpj7A=;
 b=HcDUYw2AiFBTHiq8gV3oHVqivRefqnqSXhB7HtD/rPZ2BgGYQO7wl2LPrl8kGcFYLX
 lMXljAbP+9wlBDxgx1tBRzeEWcgOddpF7Jz7YxUCef46Y9+OAFUSSUzQX1Mz+xyr1v40
 HGTTgoMDPku0bGOUjQuGFZFIKwMG3EK5oTw8C62V6XI+j3ZIQlbL/Jl7RuciM0hHKzKh
 D2V7nrGZbkTBb/9E1smHVQ8w5EARQNkiZuLeO6+ok2GzKrpCaqw26mYEhZ/xWBRi+JmI
 3F/QAaJdLzDlj/UAvVu4qpGX1m+CUTz3uTaa7F2N5gKtZ4eJ+2Et7dHdo9kNVTxEnkCe
 hG6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUquEmK10qFUco/qVW+amNvhNEFQvS+ha1x8UyYZMoSaT7CziFCZHJECWp8fCIvhKVa3dG7Ss4YMA==@nongnu.org
X-Gm-Message-State: AOJu0YxEZnC+LWU/+6T6b6SASBKE16X1IQFV4SNgIMh/iSp/uUWZokaP
 u9zmoEJ83XkX4ullTjoSdm06r7lr3rYCPPBQ4IhsLXRlBjThBN37V0DU
X-Gm-Gg: AY/fxX7BkT7lfONi86g1Syx3Iv39MbFkP/St5GHDwDz873tp6Bfv4A/4KikjC7kudiw
 D2diod57kMPu7V9FH0LPRRB2xugBMUhUGdW9gXEN/z5rAM1BSRdTpSB0qkRuDpW7puelGK+VHBI
 BtY6Curc2nTuXwv4zxhmu+0IMMYpPxM+eZ2wyu7+k/3Nq5h8o3u0ig3oE1L86ypumrnzNl3FjqC
 RTMlPdU4s7sPZUD+m00RZC8gwFw/SJJNLPBcTBpgSyq3ZbYtJDn4DrbFnW7OfMNoEoFAsN1Rp5N
 zzFYgeC5bDmByt4XXfzJMSQwCC506Tx7r4jgXcyxLqwIHacLk54VWDcoKHIXFPSfrXt300Y3JYT
 Gsh6THc9UMIU0laXcnrmpv/+0BdnSslPFKTh8UZu49xjMnS0fZWLWc/U8w6O5M4qzOP2ZKG6y9b
 7GdtTKbhYL4w6iALY6Q/I8pMVs
X-Google-Smtp-Source: AGHT+IEaJcXRrOe3Dcc3gidmKy5VGVo3pwvdlerE6eUAquN8ACRKvMTcT7x92a+kdLjAS6JStjuNYw==
X-Received: by 2002:ad4:5cc8:0:b0:88a:2867:981f with SMTP id
 6a1803df08f44-89076993aa8mr1446086d6.13.1767636930277; 
 Mon, 05 Jan 2026 10:15:30 -0800 (PST)
Received: from [192.168.1.204] ([185.213.193.254])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8907540e24csm3855706d6.25.2026.01.05.10.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 10:15:29 -0800 (PST)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Mon, 05 Jan 2026 11:14:52 -0700
Subject: [PATCH RFC v3 03/12] target/arm: mte_check unemitted on STORE_ONLY
 load
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-feat-mte4-v3-3-86a0d99ef2e4@gmail.com>
References: <20260105-feat-mte4-v3-0-86a0d99ef2e4@gmail.com>
In-Reply-To: <20260105-feat-mte4-v3-0-86a0d99ef2e4@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767636923; l=4634;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=nX8YQtvx/EZ/E/bQK1h3CLSfeL6r95IQJ8DtaChx8a0=;
 b=PhSTQBkGzHcBzkP+y8TI3mpqz63Qokgw5v6cCBHd383lAr/dpXcC80LjuuQUGy3Uia/xn9EpF
 bLXH0VsyPvvAI2JWZYoywLmjZ9VRPN/bO1mMgJ65VPQnVZP9F1nNjPr
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=brookmangabriel@gmail.com; helo=mail-qv1-xf33.google.com
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

This feature disables generation of the mte check helper on loads when
STORE_ONLY tag checking mode is enabled.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
---
 target/arm/cpu.h               |  2 ++
 target/arm/tcg/hflags.c        | 14 ++++++++++++++
 target/arm/tcg/translate-a64.c |  8 ++++++--
 target/arm/tcg/translate.h     |  2 ++
 4 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 393bfc0dc9..4087484faf 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2496,6 +2496,8 @@ FIELD(TBFLAG_A64, ZT0EXC_EL, 39, 2)
 FIELD(TBFLAG_A64, GCS_EN, 41, 1)
 FIELD(TBFLAG_A64, GCS_RVCEN, 42, 1)
 FIELD(TBFLAG_A64, GCSSTR_EL, 43, 2)
+FIELD(TBFLAG_A64, MTE_STORE_ONLY, 45, 1)
+FIELD(TBFLAG_A64, MTE0_STORE_ONLY, 46, 1)
 
 /*
  * Helpers for using the above. Note that only the A64 accessors use
diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index 5c9b9bec3b..c4696af5d8 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -425,6 +425,16 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                      */
                     DP_TBFLAG_A64(flags, MTE0_ACTIVE, 1);
                 }
+                /*
+                 * Repeat for MTE_STORE_ONLY
+                 */
+                if (cpu_isar_feature(aa64_mte4, env_archcpu(env)) &&
+                    ((el == 0 ? SCTLR_TCSO0 : SCTLR_TCSO) & sctlr)) {
+                    DP_TBFLAG_A64(flags, MTE_STORE_ONLY, 1);
+                    if (!EX_TBFLAG_A64(flags, UNPRIV)) {
+                        DP_TBFLAG_A64(flags, MTE0_STORE_ONLY, 1);
+                    }
+                }
             }
         }
         /* And again for unprivileged accesses, if required.  */
@@ -434,6 +444,10 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
             && (sctlr & SCTLR_TCF0)
             && allocation_tag_access_enabled(env, 0, sctlr)) {
             DP_TBFLAG_A64(flags, MTE0_ACTIVE, 1);
+            if (cpu_isar_feature(aa64_mte4, env_archcpu(env)) &&
+                (SCTLR_TCSO0 & sctlr)) {
+                DP_TBFLAG_A64(flags, MTE0_STORE_ONLY, 1);
+            }
         }
         /*
          * For unpriv tag-setting accesses we also need ATA0. Again, in
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index cde22a5cca..8b39d5357a 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -298,7 +298,8 @@ static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
                                       MemOp memop, bool is_unpriv,
                                       int core_idx)
 {
-    if (tag_checked && s->mte_active[is_unpriv]) {
+    if (tag_checked && s->mte_active[is_unpriv] &&
+        (is_write || !s->mte_store_only[is_unpriv])) {
         TCGv_i64 ret;
         int desc = 0;
 
@@ -330,7 +331,8 @@ TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
 TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, int total_size, MemOp single_mop)
 {
-    if (tag_checked && s->mte_active[0]) {
+    if (tag_checked && s->mte_active[0] &&
+        (is_write || !s->mte_store_only[0])) {
         TCGv_i64 ret;
         int desc = 0;
 
@@ -10693,6 +10695,8 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->ata[1] = EX_TBFLAG_A64(tb_flags, ATA0);
     dc->mte_active[0] = EX_TBFLAG_A64(tb_flags, MTE_ACTIVE);
     dc->mte_active[1] = EX_TBFLAG_A64(tb_flags, MTE0_ACTIVE);
+    dc->mte_store_only[0] = EX_TBFLAG_A64(tb_flags, MTE_STORE_ONLY);
+    dc->mte_store_only[1] = EX_TBFLAG_A64(tb_flags, MTE0_STORE_ONLY);
     dc->pstate_sm = EX_TBFLAG_A64(tb_flags, PSTATE_SM);
     dc->pstate_za = EX_TBFLAG_A64(tb_flags, PSTATE_ZA);
     dc->sme_trap_nonstreaming = EX_TBFLAG_A64(tb_flags, SME_TRAP_NONSTREAMING);
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index b62104b4ae..206aadcb17 100644
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
2.52.0


