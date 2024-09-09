Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp984846njb;
        Mon, 9 Sep 2024 09:26:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVnM9v/cfcKgs5YtxnRWBZbQfHbNFynzWAq3HZ40eXnl3p9xozmI6j2v3ck4Jzz9RplzYGWTUb7l1Hd0w==@linaro.org
X-Google-Smtp-Source: AGHT+IG8f2fIOof3bwiDxBDhBplXmxpLAPN4cBEUSNAYeNZ8+ae2KjxmpxIQ0uwNj0Z5rxfVuSYX
X-Received: by 2002:a05:620a:4156:b0:7a9:9eb0:1c36 with SMTP id af79cd13be357-7a9a38ca913mr900526985a.31.1725899175416;
        Mon, 09 Sep 2024 09:26:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725899175; cv=none;
        d=google.com; s=arc-20240605;
        b=k0oV5Lwtuo6/kvuVmpK1i1HGWYiuIoiLzlAQzvzsc9A83BjEMlQ3tJzPw7F12ROx0R
         MQJoUCyTvVRvVNnduPxPD+/DaVRX/0US7vwYemyCysv/jgedtAAv2BQNCA/q9s/i3DXo
         0ypH2e7NOGs39MER8usYEOFqCdgGMJnK/s+kJ0J216ZqWdRtHEbE0a6ormS78rVZ/SAw
         cxBOnMuSRtKHcJ7tKMm70TpXYT10eYzCq1pvTojarZIfRyY13XGpHentpvpx0zc5RTUk
         NJ2nCRpkcLr4oXQwI5t2ixhvQXwKeZrF1LGxChvGM9N3Md70xMiiDhyZioc0XJA26buX
         8T9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gFwePBIJVpBdu1416185wluTAZjFVqA7tnKNghfskr8=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=Woez7ZEbpSRgR2+vJ7FEF/P2abRWQErI8F+XyH8QD++S/rZ/uhJAO1l476lkiAHaoZ
         W+u5Fe1losdIOUTQc4ql1yUHq9Cv/6sC0eLioTSFkGZemloeNWEg0Njiw49JtkjBziY/
         HauWLbpQ5afbcCkrELitfmjre7Rf+Bs1l45EkRsBEzvfItK3Mmhi7AK0IoMhxAcKdg21
         8PolQ6a0viPg7fueZ0gjb9oufAQJQ5LjUespnHOWyj/ZsLT/GYNBdFzWVL/6JMTOglRY
         VD1wP9MkqOrZarC2LGu9qJq6VDF4sE0sV8F5JTNLgdww0U9ADqGlXkLIamYaOfm7WUIB
         mwDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="o9/q7ZB4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a79c5188si584551485a.98.2024.09.09.09.26.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 09:26:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="o9/q7ZB4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1snhAO-0003Jh-Lk; Mon, 09 Sep 2024 12:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1snhAM-00036I-M9
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 12:23:02 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1snhAK-0007ln-Qp
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 12:23:02 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2057835395aso40117955ad.3
 for <qemu-arm@nongnu.org>; Mon, 09 Sep 2024 09:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725898979; x=1726503779; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gFwePBIJVpBdu1416185wluTAZjFVqA7tnKNghfskr8=;
 b=o9/q7ZB4yeIGOA4tj0wbMi6RDuKVyBZC/TYu2wVvtId+niUoqDcal/Alta7MjF/1rv
 BlCbgC0Kl7DoNSBB5w5qaDIaH5/043XgVGJ7v/CwGxH2GmNy4MyQvpbsp5nxuZ4FYH/b
 kL7gPGEdpE2DBZRgCKnMf6dF5Nb7akBK/5SQnC1b2P+pZ6ajLW1NExScWfhwGniU7Q0B
 PVK7DzXcMhLGxs2u4Cgw7IodMg4xe16MPJHltdkmAYj0sek3uMaiQjX3a2lpX8gbNNA6
 56DX3rt9ZS8D6wFrHnPuThwAniwLDjulDrTzD3c09SmKMM8RWlO9nwFWfI2ojmQjtgii
 YKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725898979; x=1726503779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gFwePBIJVpBdu1416185wluTAZjFVqA7tnKNghfskr8=;
 b=U4wy2/+pGC9yFJySqHV8gC7dl4vgk4Nl44sUxmm4L5LYxhvPu2oW66dj4NXwmgxZn1
 h32lB+hwK4BnDeDKqfZ0SOphfHkzkjwZuMlAp4A6kQeQas0tl/hsCR9btYmdiC3NnAo4
 5+kI5Dvv6E8nPlty8GAWiYhDmTRYZ4Kn2QnnKT7Bk4phvK4hHg/ixqxxDBhrtlXgevU0
 ULDIBNR1VyBf7oxV0lsTCRS2Ip7N9SQey1FjnStkDAO5r8W7LKXNUUY3BZPDaB3vJL9R
 wQnwgkbRrP01f/SQFieB1Zolc1N5VHz0yr+Yt9UWB6qs4vHGlbwDNWjBgwS2yxjTkojz
 e7Jg==
X-Gm-Message-State: AOJu0YwXhcbMjICxn64O5d9Hoe/MVvgmiX9Ktr8ELw7cYHybo/J7RAOh
 Aio+1w0wqhrBViZ38ro9BzKCpMPtHGGyehgwOk5zWOzKoiwrQBJPmmOzLILsn6Y=
X-Received: by 2002:a17:902:e745:b0:207:1616:60db with SMTP id
 d9443c01a7336-207161660edmr94410595ad.6.1725898979344; 
 Mon, 09 Sep 2024 09:22:59 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20710f35d79sm35753305ad.288.2024.09.09.09.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:22:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 19/29] target/arm: Convert SSHLL, USHLL to decodetree
Date: Mon,  9 Sep 2024 09:22:29 -0700
Message-ID: <20240909162240.647173-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162240.647173-1-richard.henderson@linaro.org>
References: <20240909162240.647173-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
X-TUID: oNIC+hJb34eg

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 81 ++++++++++++++++------------------
 target/arm/tcg/a64.decode      |  8 ++++
 2 files changed, 45 insertions(+), 44 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 740620074a..e00d7fbf48 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6983,6 +6983,42 @@ TRANS(SRI_v, do_vec_shift_imm, a, gen_gvec_sri)
 TRANS(SHL_v, do_vec_shift_imm, a, tcg_gen_gvec_shli)
 TRANS(SLI_v, do_vec_shift_imm, a, gen_gvec_sli);
 
+static bool do_vec_shift_imm_wide(DisasContext *s, arg_qrri_e *a, bool is_u)
+{
+    TCGv_i64 tcg_rn, tcg_rd;
+    int esz = a->esz;
+    int esize;
+
+    if (!fp_access_check(s)) {
+        return true;
+    }
+
+    /*
+     * For the LL variants the store is larger than the load,
+     * so if rd == rn we would overwrite parts of our input.
+     * So load everything right now and use shifts in the main loop.
+     */
+    tcg_rd = tcg_temp_new_i64();
+    tcg_rn = tcg_temp_new_i64();
+    read_vec_element(s, tcg_rn, a->rn, a->q, MO_64);
+
+    esize = 8 << esz;
+    for (int i = 0, elements = 8 >> esz; i < elements; i++) {
+        if (is_u) {
+            tcg_gen_extract_i64(tcg_rd, tcg_rn, i * esize, esize);
+        } else {
+            tcg_gen_sextract_i64(tcg_rd, tcg_rn, i * esize, esize);
+        }
+        tcg_gen_shli_i64(tcg_rd, tcg_rd, a->imm);
+        write_vec_element(s, tcg_rd, a->rd, i, esz + 1);
+    }
+    clear_vec_high(s, true, a->rd);
+    return true;
+}
+
+TRANS(SSHLL_v, do_vec_shift_imm_wide, a, false)
+TRANS(USHLL_v, do_vec_shift_imm_wide, a, true)
+
 /* Shift a TCGv src by TCGv shift_amount, put result in dst.
  * Note that it is the caller's responsibility to ensure that the
  * shift amount is in range (ie 0..31 or 0..63) and provide the ARM
@@ -10447,47 +10483,6 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
     }
 }
 
-/* USHLL/SHLL - Vector shift left with widening */
-static void handle_vec_simd_wshli(DisasContext *s, bool is_q, bool is_u,
-                                 int immh, int immb, int opcode, int rn, int rd)
-{
-    int size = 32 - clz32(immh) - 1;
-    int immhb = immh << 3 | immb;
-    int shift = immhb - (8 << size);
-    int dsize = 64;
-    int esize = 8 << size;
-    int elements = dsize/esize;
-    TCGv_i64 tcg_rn = tcg_temp_new_i64();
-    TCGv_i64 tcg_rd = tcg_temp_new_i64();
-    int i;
-
-    if (size >= 3) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    if (!fp_access_check(s)) {
-        return;
-    }
-
-    /* For the LL variants the store is larger than the load,
-     * so if rd == rn we would overwrite parts of our input.
-     * So load everything right now and use shifts in the main loop.
-     */
-    read_vec_element(s, tcg_rn, rn, is_q ? 1 : 0, MO_64);
-
-    for (i = 0; i < elements; i++) {
-        if (is_u) {
-            tcg_gen_extract_i64(tcg_rd, tcg_rn, i * esize, esize);
-        } else {
-            tcg_gen_sextract_i64(tcg_rd, tcg_rn, i * esize, esize);
-        }
-        tcg_gen_shli_i64(tcg_rd, tcg_rd, shift);
-        write_vec_element(s, tcg_rd, rd, i, size + 1);
-    }
-    clear_vec_high(s, true, rd);
-}
-
 /* SHRN/RSHRN - Shift right with narrowing (and potential rounding) */
 static void handle_vec_simd_shrn(DisasContext *s, bool is_q,
                                  int immh, int immb, int opcode, int rn, int rd)
@@ -10577,9 +10572,6 @@ static void disas_simd_shift_imm(DisasContext *s, uint32_t insn)
         handle_vec_simd_sqshrn(s, false, is_q, is_u, is_u, immh, immb,
                                opcode, rn, rd);
         break;
-    case 0x14: /* SSHLL / USHLL */
-        handle_vec_simd_wshli(s, is_q, is_u, immh, immb, opcode, rn, rd);
-        break;
     case 0x1c: /* SCVTF / UCVTF */
         handle_simd_shift_intfp_conv(s, false, is_q, is_u, immh, immb,
                                      opcode, rn, rd);
@@ -10604,6 +10596,7 @@ static void disas_simd_shift_imm(DisasContext *s, uint32_t insn)
     case 0x06: /* SRSRA / URSRA (accum + rounding) */
     case 0x08: /* SRI */
     case 0x0a: /* SHL / SLI */
+    case 0x14: /* SSHLL / USHLL */
         unallocated_encoding(s);
         return;
     }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 77b860a3f2..bf67f8a357 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1269,3 +1269,11 @@ SLI_v           0.10 11110 .... ... 01010 1 ..... .....     @q_shli_b
 SLI_v           0.10 11110 .... ... 01010 1 ..... .....     @q_shli_h
 SLI_v           0.10 11110 .... ... 01010 1 ..... .....     @q_shli_s
 SLI_v           0.10 11110 .... ... 01010 1 ..... .....     @q_shli_d
+
+SSHLL_v         0.00 11110 .... ... 10100 1 ..... .....     @q_shli_b
+SSHLL_v         0.00 11110 .... ... 10100 1 ..... .....     @q_shli_h
+SSHLL_v         0.00 11110 .... ... 10100 1 ..... .....     @q_shli_s
+
+USHLL_v         0.10 11110 .... ... 10100 1 ..... .....     @q_shli_b
+USHLL_v         0.10 11110 .... ... 10100 1 ..... .....     @q_shli_h
+USHLL_v         0.10 11110 .... ... 10100 1 ..... .....     @q_shli_s
-- 
2.43.0

