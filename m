Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2149450njk;
        Sun, 1 Dec 2024 07:10:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVA8CuNPBFZ/JYzmEkLev4Xk0hTu2oG9AKbTSczaWnAau0NAFUEuZtrQ49ediQXa7/YbglW1BLkf2sd3A==@linaro.org
X-Google-Smtp-Source: AGHT+IHBVZsaxhZNXMhsWNXjeBTeGo/1KsoukwDj8FAtCWi8a+MAMclPj68FW/fYmDo/tnROY54D
X-Received: by 2002:a05:6902:2843:b0:e39:9d4f:8a4c with SMTP id 3f1490d57ef6-e399d4f8c5cmr3892205276.12.1733065836338;
        Sun, 01 Dec 2024 07:10:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733065836; cv=none;
        d=google.com; s=arc-20240605;
        b=SCAN4D8dkvdJ4UUgzV4anhsJtkPGKOqiT6jUV70kY7SoRwcIF/2ChH7EvgblFFrmIh
         4+swWtH/X4OnvP00JlMPJVowaCLKHc51ww5xzv00aQ05SnnoDy52pYHgM0pLMJLKLhbY
         QizFBjPFOP1oeDpae+EfTf0tEQbtJlxJ+0Bq8HxAUO6QSFbeFxetWX2QWxgq8ocKJiIe
         zm/vDf5wW96aVTkaHtTdLCLDHXcPzZFw69MNIXpi2yJdi6bh0vN8knkbCEcfcqNSWLsR
         a0GGBviXXmd8C1rakiSiZp2bHTvVa9Lw4yo74oNj3G4La/CEotxNb1nddXtcUNO6K0MK
         aidw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eh7xVPaRfsRfH2eRQWB4MOcGQGsVNj7odaVQGqJ2SLE=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=XrefOeBTB8XeOqbDlycPWzj7RL1x6/xV983RdsB77KgERMotH3FmXtnBgIwQ7teMph
         OkRRGSNkVAjjE5fkkZAu109c9kLyEuiaw9UoOOkfUp1ExlCQHkxAmOQ3/8L4t7wwMz7B
         8hpZFLqXylxvkx+8nsCFhVzj2ykSl0CXb3xJ0/jxMJAk6Ke37Gf2ZzpetOw0ZXiegKVH
         zu3E9YES5D64tIRbJGrJIxPNg++7s+eFrrhqufrIqCeOyNCU6dJvqHS8M8QnNNTzDN7i
         PBxzxuE6GsG+d+zRHc8fyoX4hptV5wDpJCVc3p6g6WNrY8dVHMMTgh5Bf00LjkXOG8d1
         TnuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jGZyqzLk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e3976ceea38si6613396276.482.2024.12.01.07.10.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:10:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jGZyqzLk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlWg-0001EQ-VL; Sun, 01 Dec 2024 10:06:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWe-0001As-7C
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:20 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWa-00043f-GV
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:18 -0500
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-71d4ff749baso1490918a34.0
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065575; x=1733670375; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eh7xVPaRfsRfH2eRQWB4MOcGQGsVNj7odaVQGqJ2SLE=;
 b=jGZyqzLkKUEzgrJtDWEpC8py/ae3QP5+sl8FQEB29hrzlKP/hrogS6cH0X0MmKys4l
 jX6BN9PaYZOZJBJhW/wI3o6UO7Tv1wkfN/rvNTeqmek7CAoWRjFdp+qzzJys8idPY1I8
 U1UBmlZi/veHLyDkgH006/YsoH03Zq/0UW94zJdN09ix3B+bcO/McMyFm53s5cpGsvJ9
 07BYbfIOFwxM8BlslojVTABYKVpRrki+L6nCwsN9urULV/RGPLZIxVgdzh3MVo6E1jVs
 Uk7LbR0lmluNYAAvKCCctsJFwTy2sACdJU5p/1+GVTt2gYrRWiLCuS8FCJGkHUHu4+Em
 4hoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065575; x=1733670375;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eh7xVPaRfsRfH2eRQWB4MOcGQGsVNj7odaVQGqJ2SLE=;
 b=dfy5lzbt8QpkykiMAlUL20TXjuQ2C4kJ82stFkIr7QjdypqYIIumBmvAUYUrqJTs+M
 yLy16Cmr6VgcqqlcrkomNTxEnkKT4MNqxgYTh33HNJWWtCcD4ozv78QCl3zVMGBQswCS
 D10LWERqIFhr5uf+hdz/SAFsWphCr64NwGdjVuGVFBSvBtGKur0KMvdfXdNw09D0SJrz
 oKWZFnZ8JwQTu/DHbdlcUgD16zakWGuo2Oa4LLpTZi2bHkh3/mV8tP2hcMEI9B0knliQ
 AxVs51afuqBLezGBuskBX87zR/gsz/gitTbTPh9gU82oKSYFH/f6Zb12ZCMv0Xw++hbr
 pw0g==
X-Gm-Message-State: AOJu0YxAhsrEFL7emyImkfRaKa0oekEWRji8Qw7mQ2TMWdl0q/FxBlw4
 f/7szMj34pUmZ82PL3T/Bbgua+FEPGOyWpDh+IaS1IyLnaDATBc3H/ba0D1WOgI=
X-Gm-Gg: ASbGncvFR7odzWZ4ax/8gpekLF8ybe9NgH7cPalHPNfh23La7MMAL3F8E9vuHYYx1ZE
 M4AcRC31moSrt5cwRO5GyggkFuiKtmr/J2kDgAVmFPRqo/+V4EzL8nEPWPm/p3cxw/M0gTfx3r9
 CCYE2v8XYZ9gQ4Ql6TIHmurJj3XM7IOa9enSkfOETrRGyR6QL0vjbiBiHHyIM/agWybCkWv0exc
 k+RJ33xD7vEZOmet9gf2GMYskKPJeEp2msPp6BJj6GAWItgzWAWOVRrMdIhYX3BiECtJR0idcnb
 b7K7V+pmvYA5Ef0sx37wGKW9gXTSZ7Her0oC
X-Received: by 2002:a05:6830:6d85:b0:715:4e38:a181 with SMTP id
 46e09a7af769-71d65d00744mr13406131a34.25.1733065574744; 
 Sun, 01 Dec 2024 07:06:14 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71d7254473asm1822220a34.27.2024.12.01.07.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:06:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 04/67] target/arm: Convert CRC32, CRC32C to decodetree
Date: Sun,  1 Dec 2024 09:05:03 -0600
Message-ID: <20241201150607.12812-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: adEKH4PWTvv2

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 101 +++++++++++++--------------------
 target/arm/tcg/a64.decode      |  12 ++++
 2 files changed, 53 insertions(+), 60 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 8b7ca2c68a..22594a1149 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7592,6 +7592,39 @@ TRANS(LSRV, do_shift_reg, a, A64_SHIFT_TYPE_LSR)
 TRANS(ASRV, do_shift_reg, a, A64_SHIFT_TYPE_ASR)
 TRANS(RORV, do_shift_reg, a, A64_SHIFT_TYPE_ROR)
 
+static bool do_crc32(DisasContext *s, arg_rrr_e *a, bool crc32c)
+{
+    TCGv_i64 tcg_acc, tcg_val, tcg_rd;
+    TCGv_i32 tcg_bytes;
+
+    switch (a->esz) {
+    case MO_8:
+    case MO_16:
+    case MO_32:
+        tcg_val = tcg_temp_new_i64();
+        tcg_gen_extract_i64(tcg_val, cpu_reg(s, a->rm), 0, 8 << a->esz);
+        break;
+    case MO_64:
+        tcg_val = cpu_reg(s, a->rm);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    tcg_acc = cpu_reg(s, a->rn);
+    tcg_bytes = tcg_constant_i32(1 << a->esz);
+    tcg_rd = cpu_reg(s, a->rd);
+
+    if (crc32c) {
+        gen_helper_crc32c_64(tcg_rd, tcg_acc, tcg_val, tcg_bytes);
+    } else {
+        gen_helper_crc32_64(tcg_rd, tcg_acc, tcg_val, tcg_bytes);
+    }
+    return true;
+}
+
+TRANS_FEAT(CRC32, aa64_crc32, do_crc32, a, false)
+TRANS_FEAT(CRC32C, aa64_crc32, do_crc32, a, true)
+
 /* Logical (shifted register)
  *   31  30 29 28       24 23   22 21  20  16 15    10 9    5 4    0
  * +----+-----+-----------+-------+---+------+--------+------+------+
@@ -8473,52 +8506,6 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
 }
 
 
-/* CRC32[BHWX], CRC32C[BHWX] */
-static void handle_crc32(DisasContext *s,
-                         unsigned int sf, unsigned int sz, bool crc32c,
-                         unsigned int rm, unsigned int rn, unsigned int rd)
-{
-    TCGv_i64 tcg_acc, tcg_val;
-    TCGv_i32 tcg_bytes;
-
-    if (!dc_isar_feature(aa64_crc32, s)
-        || (sf == 1 && sz != 3)
-        || (sf == 0 && sz == 3)) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    if (sz == 3) {
-        tcg_val = cpu_reg(s, rm);
-    } else {
-        uint64_t mask;
-        switch (sz) {
-        case 0:
-            mask = 0xFF;
-            break;
-        case 1:
-            mask = 0xFFFF;
-            break;
-        case 2:
-            mask = 0xFFFFFFFF;
-            break;
-        default:
-            g_assert_not_reached();
-        }
-        tcg_val = tcg_temp_new_i64();
-        tcg_gen_andi_i64(tcg_val, cpu_reg(s, rm), mask);
-    }
-
-    tcg_acc = cpu_reg(s, rn);
-    tcg_bytes = tcg_constant_i32(1 << sz);
-
-    if (crc32c) {
-        gen_helper_crc32c_64(cpu_reg(s, rd), tcg_acc, tcg_val, tcg_bytes);
-    } else {
-        gen_helper_crc32_64(cpu_reg(s, rd), tcg_acc, tcg_val, tcg_bytes);
-    }
-}
-
 /* Data-processing (2 source)
  *   31   30  29 28             21 20  16 15    10 9    5 4    0
  * +----+---+---+-----------------+------+--------+------+------+
@@ -8590,20 +8577,6 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
         gen_helper_pacga(cpu_reg(s, rd), tcg_env,
                          cpu_reg(s, rn), cpu_reg_sp(s, rm));
         break;
-    case 16:
-    case 17:
-    case 18:
-    case 19:
-    case 20:
-    case 21:
-    case 22:
-    case 23: /* CRC32 */
-    {
-        int sz = extract32(opcode, 0, 2);
-        bool crc32c = extract32(opcode, 2, 1);
-        handle_crc32(s, sf, sz, crc32c, rm, rn, rd);
-        break;
-    }
     default:
     do_unallocated:
     case 2: /* UDIV */
@@ -8612,6 +8585,14 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
     case 9: /* LSRV */
     case 10: /* ASRV */
     case 11: /* RORV */
+    case 16:
+    case 17:
+    case 18:
+    case 19:
+    case 20:
+    case 21:
+    case 22:
+    case 23: /* CRC32 */
         unallocated_encoding(s);
         break;
     }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 3db55b78a6..1664f4793c 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -45,7 +45,9 @@
 @rr_d           ........ ... ..... ...... rn:5 rd:5     &rr_e esz=3
 @rr_sd          ........ ... ..... ...... rn:5 rd:5     &rr_e esz=%esz_sd
 
+@rrr_b          ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=0
 @rrr_h          ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=1
+@rrr_s          ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=2
 @rrr_d          ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=3
 @rrr_sd         ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=%esz_sd
 @rrr_hsd        ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=%esz_hsd
@@ -663,6 +665,16 @@ LSRV            . 00 11010110 ..... 00100 1 ..... ..... @rrr_sf
 ASRV            . 00 11010110 ..... 00101 0 ..... ..... @rrr_sf
 RORV            . 00 11010110 ..... 00101 1 ..... ..... @rrr_sf
 
+CRC32           0 00 11010110 ..... 0100 00 ..... ..... @rrr_b
+CRC32           0 00 11010110 ..... 0100 01 ..... ..... @rrr_h
+CRC32           0 00 11010110 ..... 0100 10 ..... ..... @rrr_s
+CRC32           1 00 11010110 ..... 0100 11 ..... ..... @rrr_d
+
+CRC32C          0 00 11010110 ..... 0101 00 ..... ..... @rrr_b
+CRC32C          0 00 11010110 ..... 0101 01 ..... ..... @rrr_h
+CRC32C          0 00 11010110 ..... 0101 10 ..... ..... @rrr_s
+CRC32C          1 00 11010110 ..... 0101 11 ..... ..... @rrr_d
+
 # Data Processing (1-source)
 # Logical (shifted reg)
 # Add/subtract (shifted reg)
-- 
2.43.0

