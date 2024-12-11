Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4190461njb;
        Wed, 11 Dec 2024 08:33:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVAVS5Dp6zA4h+vJmbBs5mTfYiY9yMoJMJOAcnq6IBIFsE/U+HlxORTqaVyALExDiH3Qv671N/wOV/7ag==@linaro.org
X-Google-Smtp-Source: AGHT+IGGAclts7j6rIaOqetBqN/aNQnpKgpGks+pKC+sV5sPVDP87p4t8ntm8lrOZKJWgBmJ/7Gd
X-Received: by 2002:a05:622a:114:b0:466:91f3:12ca with SMTP id d75a77b69052e-467894ee98dmr55951561cf.8.1733934792137;
        Wed, 11 Dec 2024 08:33:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733934792; cv=none;
        d=google.com; s=arc-20240605;
        b=HGZVdjow4H9CHz6nSze0492kUMp0laf9ibtkbl9quVJh2tGPePCzy8PK2xRE3v+yOE
         jcEPrGMqMkZdpbIZrn+0ffG4EOkYTgraGO619/gnOIojWnkEKXuKxb3LUR3RBYhAiwsA
         RJFAMT+kKgHZVKqJGNTvwgDY6iEXUzBJMeQkPUyLVYxFxF5cjvNxSDOSxZHhA/4JHQKD
         USR0Rl4cyu/utTlGg8XI3TYg4JzoBqkpuNVA5Tk+4wjtazj5hdt/8VIJqCydxCI0aj4H
         Ko+YHqLvni36f75Ckid0jMveMZQFzMBbdu127UgEuQGrfqNnb3AXYb/TLonv6+sZw5yo
         tsgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4AznEk9/hIp6KCRRVqDdnFfH0hvsbNa1L/nyYxE6eHM=;
        fh=OZQBfL75rC14cCDy3q+1fYHCs9KjWAQ7ZJ3hTfS+5lQ=;
        b=Ji+ggV6cGR4RKEL4TZt3swAXdW+s1BwBo98n2EBbmWndKZODe4nJx8Hnf+Hhe4ISl6
         bi427l65isyv0/sQnppo1BAiH3GjO5/ce8eFj4SZZZb/gQwdur93RcQSMw3VHfUHegDP
         1XHjuOU6AUBWTU3/Bap4KVJGphxW/RzY+ID41+mNuY7M9IrYVf91FzPVEeYPn5Qlv/Fe
         sXIRyfHO65LBwmKu7WrkYy91uYxPDrVI1BNO6TRuyN2fDSyxLFEewW86uembDQe17Fwf
         7yYO+lWUkonA9RviJZTdPeZuhDdtT2afoh6p1hw74j9f9j+eeswI/ll1mZamLkGO0Yhj
         Atwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D4SalArO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467923a5458si8143421cf.590.2024.12.11.08.33.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:33:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D4SalArO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPcS-00041H-HB; Wed, 11 Dec 2024 11:31:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPcD-0003Oa-Tj
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:31:14 -0500
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPcC-00019p-3K
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:31:09 -0500
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-4676f1a43dfso8011881cf.1
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934667; x=1734539467; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4AznEk9/hIp6KCRRVqDdnFfH0hvsbNa1L/nyYxE6eHM=;
 b=D4SalArOVTqs0FRyHOACiuy+eZI9vFZ5CngIShrsc+HzQg6rWV7pytg/lAdlsXS4KK
 NOZsfICxRlgnOs2F2eSKk7PdWw3JXMfC9QZMF/+n8vLi+6iiUTxsehtGvGCr18vrkfmX
 b9tVV66MFQmFlFbnjoKV1V99JD84uUKT942G3UW1rApoPqqkPtrR9FBULtQIgIbPzTGT
 KGood7h1LjT/J7xFnPGK657mn4oPhM0lgHPEnjad04VD0kHNstZphxjVIZFN9emotkC/
 hVfIejIL6v9s/Yrbh/1b+uZVs7UY2BUqwdvX2OzRWlqxlKvCYqdK4UlDM2kO68kVx7Ok
 yW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934667; x=1734539467;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4AznEk9/hIp6KCRRVqDdnFfH0hvsbNa1L/nyYxE6eHM=;
 b=MPHjZSeNIW+hsfuq4zROXCCt7/m1Y64s703vDWFm0jxzEuEoLT5Wi8hrGM4sHJSDOW
 NIBkBkqavPyP25XVee6gw9yn6FynDKUn5D95EmtNRwWgTENVtROE33YJLv6NkFub/T4K
 KowbhqtPzyhlpCO6MUalf6pTYl5Tfy1fiWMAaAtGsikDR2Mqx//dtCs4zArI+xMnCxbu
 g1gu0vS0dIUb6PG/1RvKTT2Ea0okMTcCbN2GBoOY1fQ1yirvxlMwSf+M7pQmP4seLX1V
 MJ/EaP4VWDVhVFPA6H3gUTYJe2MoGengWRWw3PT4/nTkGVlIrGIz6mzO3z6qA3SxkzOw
 g0MA==
X-Gm-Message-State: AOJu0Yz9IZe38ARettUpV6S3azmnSQcbR2yR3vQXln3R1k10QWfNqy6K
 VdbOlKoc4GrD95Vc/Qfz7vxwlRYQt+khB37iDHi2XchRNPrfFloBcpPnkTUY6nCDmfNqdsrV5fB
 rfeY0hvpj
X-Gm-Gg: ASbGnctZYRARTBm0VScKKiTn5BnFD7nhUtUL8Tha18Yr2huA8SrwPmhzW1t+n6Rzu+6
 OFb0tjpR6N5w9jeJIwevaUX/eyqKIvUMXJSSD8G9jI5LBYkaD9Ec9t6N3MzDoykSZMGkWhkCJWN
 oqfFX67/2EC24uqTGpDMOQTCv+TlrnEQPV5YXQIrGff2ch0lrkXA0TTDavU8eO6AZ1jeHmctsHX
 Ow0fF3K1lCxGuC1Gq0lCz8o1es8nIoH4AZbqkGMnE/GDUEkaLa/U2GkvlUVNw==
X-Received: by 2002:a05:622a:309:b0:466:d559:b528 with SMTP id
 d75a77b69052e-467895d581emr50703941cf.17.1733934667053; 
 Wed, 11 Dec 2024 08:31:07 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46755db613csm43849381cf.70.2024.12.11.08.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:31:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 04/69] target/arm: Convert CRC32, CRC32C to decodetree
Date: Wed, 11 Dec 2024 10:29:31 -0600
Message-ID: <20241211163036.2297116-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pqLR006/jLnV

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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

