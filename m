Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4197527njb;
        Wed, 11 Dec 2024 08:43:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWdg5GdSswH+Uqbu8Vwlq8zYBY7q41QKmvFqB3GFq+Qo0SyK7IrAQLr5SKvlKeWJKUFj/Vi69Gi8RTbiQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEMcWiWA9K2kDIu5vl56NG3dLg8vK7gYMuvkdeRyUyLdtcukWMPU06S0v86LtYCliyAlElA
X-Received: by 2002:a05:6214:20e6:b0:6d3:f1ff:f8d6 with SMTP id 6a1803df08f44-6d934ba5e77mr59377726d6.40.1733935409408;
        Wed, 11 Dec 2024 08:43:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935409; cv=none;
        d=google.com; s=arc-20240605;
        b=jAwoEjFrE0SvYzx2c6HfiliW+1diji044c2YC2UP7Yd71rrYpyQWnb3JDz8nia5Obl
         JRdN9RqO6hdkk1S+zvDl0ubX9a/2VNnkWptkk2IQTo39zaocmMNyGApg40lA2GFFlSun
         sQV3fmAelAgqVimCZi54h6nHg+zQhEX/Cvcy9CAQ/602D2FhRDYjBPt3urH/MeZgpxOi
         i1tZGWfv/8sYksq6Lx4n6/iGeYkVmpnweYh0/hGwQiyQRRzTHmDVmPYmflIjH2KZpVCB
         rc387CTX9VvA1pPCGH9OkzbcRamo3bBSmNX7Y57tjfn+nw6SRSKtc1UQk9Fw3Q3iUef4
         tfLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4Io19/CScrA5Q2D7CSJ00bcM9NMayI0ImV9POYZmxx0=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=Wbk6bFSf9oi+/5e4usYCCI8//GQOqUYF11QIG+6MnmllmYzKJUlFUz+J2uM2CSIa4j
         k64vG0KUV/R0mB6fjvnbMC5pKOGlxjvyrlUQ1XBKBYtPQ2vo+C7AVbAgyFbH/qvUjKsP
         YnGwXGqNYuDcjaYXolPOVsjzPdBG1swHR98LjFae4/9+7kjN4HK4zRTyldOAa0gK8LWZ
         HkmETW79lrRJNyPx+BczpSI0F6FzH65rE3u4M/oBLib0X1LwUdPaGGUYWzoqDwin1bWI
         WgssxzxkZQ/+fmykWHsUp24owTyaDmzzqjDRmyorCeUXi2Dh1fURS1y5REvMv9yj3NSf
         D9Qg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=skN+m7KZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8da67efafsi171313096d6.15.2024.12.11.08.43.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:43:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=skN+m7KZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tLPda-0006We-B4; Wed, 11 Dec 2024 11:32:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPci-0004RX-97
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 11:31:40 -0500
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPcg-0001HG-5j
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 11:31:39 -0500
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-467725245a2so18445731cf.3
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2024 08:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934697; x=1734539497; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Io19/CScrA5Q2D7CSJ00bcM9NMayI0ImV9POYZmxx0=;
 b=skN+m7KZVwBATTm1ZAtss8TLUhOWcDXWYTIBpUEmq7gIimz0wTTOQVtzaVSpNMvMak
 DbPJJhf+oQ9OsJdF5m+HxjchtFcVj6A8nINIMD3o6y3AtNG293Qzo3xLR01E/KexhOjT
 3UZVYhg7mZHkAHtYd29dwP271EVf6GkDb/p73sLA4AdaUGs/AeIIrllY3MIwP2+VscjZ
 KWZoe16zMMqWOjDCnxdQOWq07xJWdTw2Dx3PKoqjI6xoIBw+bCCoeUHWEDp+KDq6qVEC
 7vuNiMhBpQYkrqgCJV/geSqruWx251GYxYgZZDZBQ2Hf++Zqids2pslCGGc8aztaaIo1
 KuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934697; x=1734539497;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Io19/CScrA5Q2D7CSJ00bcM9NMayI0ImV9POYZmxx0=;
 b=WXfKhsfBmPemwr0csHcheuid7xlK3te+CAmpLbprRly16H38rmzHrga19USTAE6SXV
 zNuruIh13vVEV/LUo3jzMdZcOxLAj7JIqSELGUwti9+TY0sD4ksmpwNtNKlRJ5OyXyHw
 pXZOJ3pPZBT2+/e5bVd2O/NZOR647oo9nxzewqouH33dqb3uthtYJIDVwpjqgj9XNLzn
 A+dSyUHEwtwCI0Nyr69OEUCh3bwgXyuACI/0II87jR2VCCmy3Eu/MjEL4x6L6XjC850Z
 zLfvynV7aKP7nz8WTz55LrxMdkdYN3Eb14py4Bow6yRYM3Bl5ATMFTl/Mzr4fNxpWpiJ
 OiqA==
X-Gm-Message-State: AOJu0YwwrdblNeSdREVzWjMXtRpCKE6dClA6M0E7x1BfovKbi9xlzLoY
 rDaKawgc0hNDGcF+mRejj4VSyI+8J9Nmv4ec5PTBpndGryrBNGEZDMAkWanQIgsH8SLJ+t6zmhT
 Oa+RScnFO
X-Gm-Gg: ASbGncumRfDPIIINXM0zzsoU0kS67B9ox5YoCupxA53d6Jm/f+F0av7cVtkfpuMJRyY
 8LPuSqm4fe2TSm++BOs3MpPaCpmIfRSc/afuybp8eVhRSGghxItp0D4pzJohikW1ONcVGhmRPpI
 HJqanrr2j+yoQRk2l/FyiuL6mk6BXUpfKbJqY5QfBbg/aOl8VhfeD58F8Cfuf+2k+urv8TuoiCv
 aOOR8C4+rlRvp8ZRZqdOGXJTR7oMSMARiQTmOiE4qKuEOKbBWdelDL8mEjS5w==
X-Received: by 2002:a05:622a:198f:b0:467:6b64:2abb with SMTP id
 d75a77b69052e-467892e8a94mr64742961cf.5.1733934697028; 
 Wed, 11 Dec 2024 08:31:37 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46755db613csm43849381cf.70.2024.12.11.08.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:31:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 15/69] target/arm: Convert disas_adc_sbc to decodetree
Date: Wed, 11 Dec 2024 10:29:42 -0600
Message-ID: <20241211163036.2297116-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: f8woWuftIc/A

This includes ADC, SBC, ADCS, SBCS.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 43 +++++++++++++---------------------
 target/arm/tcg/a64.decode      |  6 +++++
 2 files changed, 22 insertions(+), 27 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 99ff787c61..d7747fcf57 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8017,42 +8017,34 @@ TRANS(SMSUBL, do_muladd, a, true, true, MO_SL)
 TRANS(UMADDL, do_muladd, a, true, false, MO_UL)
 TRANS(UMSUBL, do_muladd, a, true, true, MO_UL)
 
-/* Add/subtract (with carry)
- *  31 30 29 28 27 26 25 24 23 22 21  20  16  15       10  9    5 4   0
- * +--+--+--+------------------------+------+-------------+------+-----+
- * |sf|op| S| 1  1  0  1  0  0  0  0 |  rm  | 0 0 0 0 0 0 |  Rn  |  Rd |
- * +--+--+--+------------------------+------+-------------+------+-----+
- */
-
-static void disas_adc_sbc(DisasContext *s, uint32_t insn)
+static bool do_adc_sbc(DisasContext *s, arg_rrr_sf *a,
+                       bool is_sub, bool setflags)
 {
-    unsigned int sf, op, setflags, rm, rn, rd;
     TCGv_i64 tcg_y, tcg_rn, tcg_rd;
 
-    sf = extract32(insn, 31, 1);
-    op = extract32(insn, 30, 1);
-    setflags = extract32(insn, 29, 1);
-    rm = extract32(insn, 16, 5);
-    rn = extract32(insn, 5, 5);
-    rd = extract32(insn, 0, 5);
+    tcg_rd = cpu_reg(s, a->rd);
+    tcg_rn = cpu_reg(s, a->rn);
 
-    tcg_rd = cpu_reg(s, rd);
-    tcg_rn = cpu_reg(s, rn);
-
-    if (op) {
+    if (is_sub) {
         tcg_y = tcg_temp_new_i64();
-        tcg_gen_not_i64(tcg_y, cpu_reg(s, rm));
+        tcg_gen_not_i64(tcg_y, cpu_reg(s, a->rm));
     } else {
-        tcg_y = cpu_reg(s, rm);
+        tcg_y = cpu_reg(s, a->rm);
     }
 
     if (setflags) {
-        gen_adc_CC(sf, tcg_rd, tcg_rn, tcg_y);
+        gen_adc_CC(a->sf, tcg_rd, tcg_rn, tcg_y);
     } else {
-        gen_adc(sf, tcg_rd, tcg_rn, tcg_y);
+        gen_adc(a->sf, tcg_rd, tcg_rn, tcg_y);
     }
+    return true;
 }
 
+TRANS(ADC, do_adc_sbc, a, false, false)
+TRANS(SBC, do_adc_sbc, a, true, false)
+TRANS(ADCS, do_adc_sbc, a, false, true)
+TRANS(SBCS, do_adc_sbc, a, true, true)
+
 /*
  * Rotate right into flags
  *  31 30 29                21       15          10      5  4      0
@@ -8305,10 +8297,6 @@ static void disas_data_proc_reg(DisasContext *s, uint32_t insn)
     switch (op2) {
     case 0x0:
         switch (op3) {
-        case 0x00: /* Add/subtract (with carry) */
-            disas_adc_sbc(s, insn);
-            break;
-
         case 0x01: /* Rotate right into flags */
         case 0x21:
             disas_rotate_right_into_flags(s, insn);
@@ -8322,6 +8310,7 @@ static void disas_data_proc_reg(DisasContext *s, uint32_t insn)
             break;
 
         default:
+        case 0x00: /* Add/subtract (with carry) */
             goto do_unallocated;
         }
         break;
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index b0cc8bd476..7a40ca455e 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -746,6 +746,12 @@ ADDS_ext        . 01 01011001 ..... ... ... ..... .....     @addsub_ext
 SUBS_ext        . 11 01011001 ..... ... ... ..... .....     @addsub_ext
 
 # Add/subtract (carry)
+
+ADC             . 00 11010000 ..... 000000 ..... .....  @rrr_sf
+ADCS            . 01 11010000 ..... 000000 ..... .....  @rrr_sf
+SBC             . 10 11010000 ..... 000000 ..... .....  @rrr_sf
+SBCS            . 11 11010000 ..... 000000 ..... .....  @rrr_sf
+
 # Rotate right into flags
 # Evaluate into flags
 # Conditional compare (regster)
-- 
2.43.0

