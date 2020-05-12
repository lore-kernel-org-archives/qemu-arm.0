Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1317739lfb;
        Tue, 12 May 2020 09:39:25 -0700 (PDT)
X-Google-Smtp-Source: APiQypIbjIM5G2bpPw4zo36CD7I5zQZZTqKXuV1HgV79/L8rFFW21Ke8uXNj8A2EiCsy49/tKV9f
X-Received: by 2002:a0c:b78a:: with SMTP id l10mr20915868qve.121.1589301565353;
        Tue, 12 May 2020 09:39:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589301565; cv=none;
        d=google.com; s=arc-20160816;
        b=yrc/65vMfc85kf2GFMaWDZzS9DKSeIBl5NeoBzhVIe1G0aoQTXjGlHtrXmtzu+7c8Z
         ucwWCVOapjAR6eoOx56UUlP4nT8PHo7v6sdSQM9ZBvScJjf/r38soSq5yGQYfYrnknBE
         bvMCT+QbJNeEzADB9FODM6yjbXwQ0FQsOGDmZzUjZIK7uhIvR6wY1gFzjgMiO9SCr67G
         bpp+TpwKLxoLldg2Dj5G5eSc7EJfL1ovDOwiYivxuW94oJ9Dv5FgZ/WDwsY473ipcm9p
         IDxGK0APjJHbNhppNz3iUNRbTjYbkjQN5Xf4na5/aqDsdqapXJwMUc/i0WH1aR1FgWft
         1zSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NRx9HxkT7GwADPC7+Ge+K4Hy5E9A9Z7xxkBA/YQUIh8=;
        b=ktko4KTeIenJorpJdLAMg9Mu2etOufUoKqMshijFaugkao3gC2izZhsS8XsmK8Jras
         3Vihy5/vBSx26UVTt7WHTFdHgtR8ppo1IF6KuW8yXLV+aEBxaU8EYn+zevgOg57AgPDG
         DZa9jJ1nwGNoybDLSkOgH2diG6aPQ+E4Oi4YA6z0cjgkYYszvISv+lX5t91a0iGk8d+e
         4qhNYLFdXhm6yG/OxP2JeMGQ2IKYfvpZH/u6kyvQ8UBT18UNBSb/WLIlMgvziH5+5fQr
         LiIR05D51vFYnfKs/oaNy1L/GqWjHOoCD7NWg7/szuSObEnKgPn+SlxZ275XMSWwhwIu
         MLWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gm2WNXkA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y5si7960948qty.313.2020.05.12.09.39.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 09:39:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gm2WNXkA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYXwC-0006ID-MX
	for alex.bennee@linaro.org; Tue, 12 May 2020 12:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYXw1-0006F5-V0
 for qemu-arm@nongnu.org; Tue, 12 May 2020 12:39:13 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYXw1-000635-0A
 for qemu-arm@nongnu.org; Tue, 12 May 2020 12:39:13 -0400
Received: by mail-wr1-x42a.google.com with SMTP id l11so10389861wru.0
 for <qemu-arm@nongnu.org>; Tue, 12 May 2020 09:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NRx9HxkT7GwADPC7+Ge+K4Hy5E9A9Z7xxkBA/YQUIh8=;
 b=Gm2WNXkArhuo0Vmrq9nTihLB4e6i4PkKuI3XcQPj3xwsL4dT7Y3wyMB+GnF0BJsuEq
 0DAU6NPdP0IrmajDxc+trJA+dJDrrv/rPvBvoCexQDTHEDhbezHaf4zzCZPZC9W4gYn4
 IZAfLrfVrim+78o6FUkyBxQ7QcDVAHes5J1HqqnFw+MfXavLbjs0zzwQy4ltYg1RSx1a
 IjENSpa7QX+VDiyRv8wlUQYkjAPZ6rwxYjInevf9VCgWBQY9UXqyCUFMHmW0HBKPo3YN
 UE5L+2TLFa7j/lbkGM/b2NiF2mXQrDwN3KejH7SMuB72Qhmi+mjw19sGiE0l8TUOJJQW
 XqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NRx9HxkT7GwADPC7+Ge+K4Hy5E9A9Z7xxkBA/YQUIh8=;
 b=Wu6LsBPNI2WnhcDbgNYMM0VhQjTKDfBYoZ1Xto8Fu0Rsj6EyDps9zOWpaQXBpULEHb
 ZdL2u69b5CsS4xyX9nhH/SYcUg3n1CU+ut+DxXYFkRumk3bjxJM//dxVl5tCjf3nSWcY
 E72MNj+hPyU6mn81bQ+Bd+ZamyWHY4PnvE1Lv8Hd2dpAh6vByiLIFSyiQswXryYhsYgR
 r0KoYiBW8hpNRT8MuPLO2L3idd0ON5IGLAIsgyqm/dkOlWzBUoMm8vrHkYv9vu/VGh5P
 Hg38Hfb/4JYGMC/tgMLGib9AA5IJAM1h0oJ5iX3TH9/vTBIX+mIiUnXLLntnA5qIkfKy
 aVvg==
X-Gm-Message-State: AGi0PuZc6jaJKvMFkc9wAn0SsECSzeHKOkzToaFBFpCOfeHJ1rAjVAx7
 h6KyNOcn3mBMpwOj0nziBxcSxPxxxLVgbg==
X-Received: by 2002:adf:e4d0:: with SMTP id v16mr25924554wrm.294.1589301550972; 
 Tue, 12 May 2020 09:39:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o205sm18525981wmo.32.2020.05.12.09.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 09:39:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 03/17] target/arm: Convert Neon 64-bit element 3-reg-same
 insns
Date: Tue, 12 May 2020 17:38:50 +0100
Message-Id: <20200512163904.10918-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200512163904.10918-1-peter.maydell@linaro.org>
References: <20200512163904.10918-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1TPRfaC+uGAD

Convert the 64-bit element insns in the 3-reg-same group
to decodetree. This covers VQSHL, VRSHL and VQRSHL where
size==0b11.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/neon-dp.decode       | 21 ++++++++++++++++++
 target/arm/translate-neon.inc.c | 24 +++++++++++++++++++++
 target/arm/translate.c          | 38 ++-------------------------------
 3 files changed, 47 insertions(+), 36 deletions(-)

diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index 68b0a44793f..fe649038547 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -73,6 +73,27 @@ VCGE_U_3s        1111 001 1 0 . .. .... .... 0011 . . . 1 .... @3same
 VSHL_S_3s        1111 001 0 0 . .. .... .... 0100 . . . 0 .... @3same_rev
 VSHL_U_3s        1111 001 1 0 . .. .... .... 0100 . . . 0 .... @3same_rev
 
+# Insns operating on 64-bit elements (size!=0b11 handled elsewhere)
+# The _rev suffix indicates that Vn and Vm are reversed. This is
+# the case for shifts. In the Arm ARM these insns are documented
+# with the Vm and Vn fields in their usual places, but in the
+# assembly the operands are listed "backwards", ie in the order
+# Dd, Dm, Dn where other insns use Dd, Dn, Dm. For QEMU we choose
+# to consider Vm and Vm as being in different fields in the insn,
+# which allows us to avoid special-casing shifts in the trans_
+# function code (where we would otherwise need to manually swap
+# the operands over to call Neon helper functions that are shared
+# with AArch64 which does not have this odd reversed-operand situation).
+@3same_64_rev    .... ... . . . 11 .... .... .... . q:1 . . .... \
+                 &3same vm=%vn_dp vn=%vm_dp vd=%vd_dp size=3
+
+VQSHL_S64_3s     1111 001 0 0 . .. .... .... 0100 . . . 1 .... @3same_64_rev
+VQSHL_U64_3s     1111 001 1 0 . .. .... .... 0100 . . . 1 .... @3same_64_rev
+VRSHL_S64_3s     1111 001 0 0 . .. .... .... 0101 . . . 0 .... @3same_64_rev
+VRSHL_U64_3s     1111 001 1 0 . .. .... .... 0101 . . . 0 .... @3same_64_rev
+VQRSHL_S64_3s    1111 001 0 0 . .. .... .... 0101 . . . 1 .... @3same_64_rev
+VQRSHL_U64_3s    1111 001 1 0 . .. .... .... 0101 . . . 1 .... @3same_64_rev
+
 VMAX_S_3s        1111 001 0 0 . .. .... .... 0110 . . . 0 .... @3same
 VMAX_U_3s        1111 001 1 0 . .. .... .... 0110 . . . 0 .... @3same
 VMIN_S_3s        1111 001 0 0 . .. .... .... 0110 . . . 1 .... @3same
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 03b3337e460..05c6dcdc9b9 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -825,3 +825,27 @@ static bool trans_SHA256SU1_3s(DisasContext *s, arg_SHA256SU1_3s *a)
 
     return true;
 }
+
+#define DO_3SAME_64(INSN, FUNC)                                         \
+    static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,         \
+                                uint32_t rn_ofs, uint32_t rm_ofs,       \
+                                uint32_t oprsz, uint32_t maxsz)         \
+    {                                                                   \
+        static const GVecGen3 op = { .fni8 = FUNC };                    \
+        tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, oprsz, maxsz, &op);      \
+    }                                                                   \
+    DO_3SAME(INSN, gen_##INSN##_3s)
+
+#define DO_3SAME_64_ENV(INSN, FUNC)                                     \
+    static void gen_##INSN##_elt(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m)    \
+    {                                                                   \
+        FUNC(d, cpu_env, n, m);                                         \
+    }                                                                   \
+    DO_3SAME_64(INSN, gen_##INSN##_elt)
+
+DO_3SAME_64(VRSHL_S64, gen_helper_neon_rshl_s64)
+DO_3SAME_64(VRSHL_U64, gen_helper_neon_rshl_u64)
+DO_3SAME_64_ENV(VQSHL_S64, gen_helper_neon_qshl_s64)
+DO_3SAME_64_ENV(VQSHL_U64, gen_helper_neon_qshl_u64)
+DO_3SAME_64_ENV(VQRSHL_S64, gen_helper_neon_qrshl_s64)
+DO_3SAME_64_ENV(VQRSHL_U64, gen_helper_neon_qrshl_u64)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index ee2b8d6f6e3..1ce3e182867 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5459,42 +5459,8 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         }
 
         if (size == 3) {
-            /* 64-bit element instructions. */
-            for (pass = 0; pass < (q ? 2 : 1); pass++) {
-                neon_load_reg64(cpu_V0, rn + pass);
-                neon_load_reg64(cpu_V1, rm + pass);
-                switch (op) {
-                case NEON_3R_VQSHL:
-                    if (u) {
-                        gen_helper_neon_qshl_u64(cpu_V0, cpu_env,
-                                                 cpu_V1, cpu_V0);
-                    } else {
-                        gen_helper_neon_qshl_s64(cpu_V0, cpu_env,
-                                                 cpu_V1, cpu_V0);
-                    }
-                    break;
-                case NEON_3R_VRSHL:
-                    if (u) {
-                        gen_helper_neon_rshl_u64(cpu_V0, cpu_V1, cpu_V0);
-                    } else {
-                        gen_helper_neon_rshl_s64(cpu_V0, cpu_V1, cpu_V0);
-                    }
-                    break;
-                case NEON_3R_VQRSHL:
-                    if (u) {
-                        gen_helper_neon_qrshl_u64(cpu_V0, cpu_env,
-                                                  cpu_V1, cpu_V0);
-                    } else {
-                        gen_helper_neon_qrshl_s64(cpu_V0, cpu_env,
-                                                  cpu_V1, cpu_V0);
-                    }
-                    break;
-                default:
-                    abort();
-                }
-                neon_store_reg64(cpu_V0, rd + pass);
-            }
-            return 0;
+            /* 64-bit element instructions: handled by decodetree */
+            return 1;
         }
         pairwise = 0;
         switch (op) {
-- 
2.20.1

