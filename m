Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3438257njb;
        Tue, 10 Dec 2024 08:19:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWgsZE6NI9R7I3aDVH8titIBm67T88qkFzsgiY59HkNKxqZl/0d7ulNlOFUur3Zl4CcR9kFpzhIvdzk/w==@linaro.org
X-Google-Smtp-Source: AGHT+IGryEmCltrt+4Q40Tf5fhQIaFuByvIpUM9W3nuYY7diMSe4PsQg7zhxDFUJ8Vfe69ZOSR5c
X-Received: by 2002:a05:622a:7c98:b0:467:451b:eba3 with SMTP id d75a77b69052e-467451beef2mr140481091cf.8.1733847572504;
        Tue, 10 Dec 2024 08:19:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733847572; cv=none;
        d=google.com; s=arc-20240605;
        b=h/bLR+SaasxxX2sOsTNFav6Qa3K26hUWrduWtB/kfVBC1PbBRVMblrqyBlnVL1s3JL
         5C63j7MOfbyFJyTiSc+S32SHSfXUNWxKNgYCbQCAe1x0z2iDVztREc2LO2Hz9xgMH0xD
         P7ZS+MNWWJeu/VdpC7kbX1OjhN86dEuV1ia1W0CibsMN9YHioreHrXi3OTimO1WDG2Sw
         GcOCvCM8b9b8O7VZo+GLQ2FRA14dz4I8ctbs8PKmxAWFIEpJkes7En49e0Gd/qGFHs4H
         SmgRUh8MxaYAlev3ilYqaXIftWXatogNaAk+0/EtYy+xOc2VoQL0mY/LpasWTCTfWRZl
         sF2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OheJzngdS+HhJoEVosRxkCExJJDmRaec59L8+hjrWV0=;
        fh=OZQBfL75rC14cCDy3q+1fYHCs9KjWAQ7ZJ3hTfS+5lQ=;
        b=iDym+6+eOWmhVOUMyfIWnhpg9K7/7FmhmPB0am/QKJuATmU1+BxVKfMIYspgEgAaVW
         RsbA+tdACgs4kJ6YqoX9vtKPLBIXiW5nZ5aFc5Zgk1vZUYEcvYiXmtX5q+3aMsoDK/4b
         WTIFS7jBMWKYQlnaUjWvBSh2zwRGcfyfE0dCskS8W0bX6kCnP5MZXAwTZ/3Dvt6/AXu/
         S44bvngMUqdxU5HBSeljQ397NVQFiKISF4pvSVXDF/7r0YrJx7cvucVASYxZGDVWoJGO
         tCrB2WRZaEgoSQQ8lDETV70Q56TanNKGN/b8eOM7JjWwl3A4kGdwpq9WlwpQGsJ1DPdA
         1ghg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UUtj3BR8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4676afec488si51155511cf.365.2024.12.10.08.19.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 08:19:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UUtj3BR8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL2w6-0002UF-LD; Tue, 10 Dec 2024 11:18:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2w4-0002Td-On
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:18:08 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2w3-0006Iv-2y
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:18:08 -0500
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-53df6322ea7so6684801e87.0
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 08:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733847485; x=1734452285; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OheJzngdS+HhJoEVosRxkCExJJDmRaec59L8+hjrWV0=;
 b=UUtj3BR8ZVebn1zMm/dxDMHkSNLuk4w21fZHE4SvxGscyzfM5z7swfUDQvX5WPlipU
 zkCVF5acsShyiqUfJm9L5mPo2LC6euS8i2Erj60LQLBAoUSuvGdxcfTZE1VmGwlEbh7z
 g1bkUXr33eYVpTbMgG6Nr3j2HMXyQSquijdzNzkMy0eqOxzPbLDMSswwxGw0SrVfqZfS
 MaUt2r0ZbrYhPL4A8SmWeYT6+OPJN0N9wHa8371+PHFArjcyLo9KG9FWj8KCXjjMEpLf
 kNmTrqomKUSRB0nuNVvoPP1+KsjXGTblWwfYJwW9R9h4dp+JC7KhHUlNge0/qIAE3XtT
 owQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733847485; x=1734452285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OheJzngdS+HhJoEVosRxkCExJJDmRaec59L8+hjrWV0=;
 b=ZzFZv29hkmCO/dSqTYgHovElrE8MnAha66H9fdzqmjT+A8XT5+SiAMbKKnFFkEuZkl
 C1elf9CkJNlH6kdFAocE22ZwXzAWLCrFxBLV6O1aVWwd/9d1icrd6jYFc8J4vqglfGHy
 7+GaLwQHR8RyKCIy2Sj6xHC6btlLTdgXBGwjWChsTSe1lIVrt/zQhHbHP7RQxoxKyYAV
 DvH70b7aOCBFqv/f83ox4vR85VzLemmCw/Wq9Zv/H9KY8iUEPXivC2yoJwhRfb3qy0/u
 /9ia8AchYouDqs1nbmyz40bOSWfWLAA9KP2RjU381I3ZEGQEP0ZBjCC3C+BywJ3X/Czw
 QLWA==
X-Gm-Message-State: AOJu0YzgBAdv4d36116bQSVMsu1tsTwYi5UeLVbZJ+RQUzzgOpr7IQMQ
 2iTdcZ0mX3Vy3cqc3G4Ru7PHOTVv+3ETYixbjSB/mvjHV98bq1H7zGzBUJnwqgM=
X-Gm-Gg: ASbGncuV2pubMfL1HD+jBpe7/YkbdMoBmltmevvrr8sty/lP/e8KkcoRoH9T/tC0RbY
 SMQrhKQXe1BxCxKOe5HNzL2mrjTtvJCjE+9zzU2MqvIet3TpnWLaMaFeIVEeafDv3m4NZpNW770
 CKBgDPDcUoHIgqSEEWR1XJre/cCQ9E0ZGyz8KBnSyu2Z9kkf3QujpEGjKxO1gI5oGNWgHW1UEM2
 5Q2al/KIoa3B68yny7sItbS54FrupivADsCb95Sm+JEsNbRqJHZXyWTfYs=
X-Received: by 2002:a05:6512:23a9:b0:53e:6503:4b45 with SMTP id
 2adb3069b0e04-540240bc9abmr2437525e87.17.1733847485005; 
 Tue, 10 Dec 2024 08:18:05 -0800 (PST)
Received: from stoup.. ([91.209.212.80]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53f93377eefsm1026343e87.67.2024.12.10.08.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:18:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 06/69] target/arm: Convert PACGA to decodetree
Date: Tue, 10 Dec 2024 10:16:30 -0600
Message-ID: <20241210161733.1830573-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210161733.1830573-1-richard.henderson@linaro.org>
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x129.google.com
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
X-TUID: 4Ha+ya0n8ern

Remove disas_data_proc_2src, as this was the last insn
decoded by that function.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 65 ++++++----------------------------
 target/arm/tcg/a64.decode      |  2 ++
 2 files changed, 13 insertions(+), 54 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 00e55d42ff..ca8b644dc7 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7674,6 +7674,16 @@ static bool trans_GMI(DisasContext *s, arg_rrr *a)
     return false;
 }
 
+static bool trans_PACGA(DisasContext *s, arg_rrr *a)
+{
+    if (dc_isar_feature(aa64_pauth, s)) {
+        gen_helper_pacga(cpu_reg(s, a->rd), tcg_env,
+                         cpu_reg(s, a->rn), cpu_reg_sp(s, a->rm));
+        return true;
+    }
+    return false;
+}
+
 /* Logical (shifted register)
  *   31  30 29 28       24 23   22 21  20  16 15    10 9    5 4    0
  * +----+-----+-----------+-------+---+------+--------+------+------+
@@ -8555,59 +8565,6 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
 }
 
 
-/* Data-processing (2 source)
- *   31   30  29 28             21 20  16 15    10 9    5 4    0
- * +----+---+---+-----------------+------+--------+------+------+
- * | sf | 0 | S | 1 1 0 1 0 1 1 0 |  Rm  | opcode |  Rn  |  Rd  |
- * +----+---+---+-----------------+------+--------+------+------+
- */
-static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
-{
-    unsigned int sf, rm, opcode, rn, rd, setflag;
-    sf = extract32(insn, 31, 1);
-    setflag = extract32(insn, 29, 1);
-    rm = extract32(insn, 16, 5);
-    opcode = extract32(insn, 10, 6);
-    rn = extract32(insn, 5, 5);
-    rd = extract32(insn, 0, 5);
-
-    if (setflag && opcode != 0) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    switch (opcode) {
-    case 12: /* PACGA */
-        if (sf == 0 || !dc_isar_feature(aa64_pauth, s)) {
-            goto do_unallocated;
-        }
-        gen_helper_pacga(cpu_reg(s, rd), tcg_env,
-                         cpu_reg(s, rn), cpu_reg_sp(s, rm));
-        break;
-    default:
-    do_unallocated:
-    case 0: /* SUBP(S) */
-    case 2: /* UDIV */
-    case 3: /* SDIV */
-    case 4: /* IRG */
-    case 5: /* GMI */
-    case 8: /* LSLV */
-    case 9: /* LSRV */
-    case 10: /* ASRV */
-    case 11: /* RORV */
-    case 16:
-    case 17:
-    case 18:
-    case 19:
-    case 20:
-    case 21:
-    case 22:
-    case 23: /* CRC32 */
-        unallocated_encoding(s);
-        break;
-    }
-}
-
 /*
  * Data processing - register
  *  31  30 29  28      25    21  20  16      10         0
@@ -8674,7 +8631,7 @@ static void disas_data_proc_reg(DisasContext *s, uint32_t insn)
         if (op0) {    /* (1 source) */
             disas_data_proc_1src(s, insn);
         } else {      /* (2 source) */
-            disas_data_proc_2src(s, insn);
+            goto do_unallocated;
         }
         break;
     case 0x8 ... 0xf: /* (3 source) */
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index f0a5ffb1cd..a23d6a6645 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -682,6 +682,8 @@ SUBPS           1 01 11010110 ..... 000000 ..... .....  @rrr
 IRG             1 00 11010110 ..... 000100 ..... .....  @rrr
 GMI             1 00 11010110 ..... 000101 ..... .....  @rrr
 
+PACGA           1 00 11010110 ..... 001100 ..... .....  @rrr
+
 # Data Processing (1-source)
 # Logical (shifted reg)
 # Add/subtract (shifted reg)
-- 
2.43.0

