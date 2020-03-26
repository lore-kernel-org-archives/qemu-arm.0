Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2515472lfi;
        Thu, 26 Mar 2020 16:24:01 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtz3+eB44Pdu/gjV4wcfRE0u9EOfjiL5QCYwkwbvV7Yb2J9aOvxfXQ/5N2E1Xw+S2lQO8ub
X-Received: by 2002:a05:620a:22b:: with SMTP id u11mr11332600qkm.225.1585265041411;
        Thu, 26 Mar 2020 16:24:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585265041; cv=none;
        d=google.com; s=arc-20160816;
        b=hhrwtPjd8ez13MbOQJxz5GlHI4bHuri5iZNBzwC8EPJVsOwLLoqSgQ6aJAl439Hpf/
         ZCJG+vHgsgnw6C6KFWRQHuArez5FqT7yQ+X1e0jwXOkg4NNtN1WHNuRJnuSJ/84dIyv2
         BQDKeN3Bu5amCq28sa9bo36ew3kbj8+ffG3gCjrOvfl4bmqfNrajxntY8fxlpLekBipc
         ML93Zut9bzSu9rl+7oI73XQCfBnc210/0qZ/R46VHtrCeNTmGNmaNG7CRzFmHTNCdiYw
         J3x5F4fdWNUMnBTxtK491P7JfnwKQlJBP7n9o1waW/51jD1keN6LzCJO0seL6VSogCtk
         iAfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gruaHJOeD8WvnhMIfKkze3XKHGHvv2/+9IJLAI7Js3I=;
        b=GkaQJi8sBTpr2LQBF7YR1SmKS/0778rNS0t+3QkGHuQbEF2q+U82nPzm5zS05+KqiV
         dr6Eh3xdzM02PNR3bImJY3FytkawESA6RWjyHXuaUR4WMG0n2zv+g4FLakvhAJxzKYIS
         vRRkE6oel+yFFI2YdARVc9yuBY5qvIx+IcbRH+K3dQkE35WUOGvsOO+yyMp7bh4OmTnl
         RnZ+TslKHmTfDrasTZ9kIcmrqPmeDsSYCiOb04b+uOHyJLHUnXZlnOPSmVkBPBIXCYpm
         Q8Jj8TKZ5Y5fUQwQHQmuIiR5gZNrkcXd8EfSl9k8Dgu+jm2Ejnj4r/dn6PRMdGcSh3bS
         qLdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T4spmkhx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12si2423703qke.348.2020.03.26.16.24.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 16:24:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T4spmkhx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHbqy-0000n6-O8
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 19:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59427)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbci-00035U-Nw
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 19:09:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbch-0001xl-7z
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 19:09:16 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:41257)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHbch-0001wZ-1c
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 19:09:15 -0400
Received: by mail-pf1-x441.google.com with SMTP id z65so3545055pfz.8
 for <qemu-devel@nongnu.org>; Thu, 26 Mar 2020 16:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gruaHJOeD8WvnhMIfKkze3XKHGHvv2/+9IJLAI7Js3I=;
 b=T4spmkhxY+XY0VoCM6cAeio6xDP/bnRE+S2bIyjiIN6IYxOPv8exi560GTi6kAUcpa
 hBnOBO5v3dTcj4NFoyWvTsPXW1uekeOEIunYMZjwaInR5jTKkNqMEXYLMniEMsXCl+ow
 6M2TwsX5S4MklHqCSZkpDBx+P2v6tTMJhOk+5eZGOAdFH863SIRwai13pMHeC/BGqvPv
 iEz3E3u/tRsBJdwT/8ixdmUtNJ0qrYf7Ns4/MmT/K9BlsJok8Vm6tas1oUT5FBczpHLv
 iXcxkPKScIo8Jhmsgf+/9smNbjaJSeRSsZx8zAcPHXCnupl75DAxTMYtD+Gm/ZPSsZlQ
 oXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gruaHJOeD8WvnhMIfKkze3XKHGHvv2/+9IJLAI7Js3I=;
 b=I05k7XVlskPStGMVpycqCrWV9AQsWA26hgHHGziBhBzAcwHPIdnFMVaRFWArGbgzzL
 Kxaxn2AfzyBUJO11/IJDdwiGxq72q0/T2cliln4uhBN4Qmtm8puZ8DAeAd7TV9Dl0Yk0
 s0YRNnyqKDEDFsxc4QarCHoPtUqP7lQkhrNWJp9hzixVVdh6hQhJZJ2DbbclqAYb8NIW
 8m3BwVoYO32oU7kV+OHLgJ707M1CZAaHSEGRenmiSHFdkhpoFlA/uHZl7/wrIRvPd3aR
 Lpq+Wj6+Ox8MHM+WivVLT0LzTwQDqY6xorAZbXnXv8PuZHUyTG9ELecmFgsaQUrvHyQf
 q3Iw==
X-Gm-Message-State: ANhLgQ1xRaFs4ZooEb6yORTuh3kPbuKL9E8yIFZn4RbnunmS11AdMj5X
 LQ5+yF753Fg1jOZJgPUNweJF4lWwvuw=
X-Received: by 2002:a63:7159:: with SMTP id b25mr10696807pgn.72.1585264153691; 
 Thu, 26 Mar 2020 16:09:13 -0700 (PDT)
Received: from localhost.localdomain (174-21-138-234.tukw.qwest.net.
 [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id i187sm2530037pfg.33.2020.03.26.16.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 16:09:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 27/31] target/arm: Tidy handle_vec_simd_shri
Date: Thu, 26 Mar 2020 16:08:34 -0700
Message-Id: <20200326230838.31112-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326230838.31112-1-richard.henderson@linaro.org>
References: <20200326230838.31112-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: rajav@quicinc.com, qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uEfiauLn1bTb

Now that we've converted all cases to gvec, there is quite a bit
of dead code at the end of the function.  Remove it.

Sink the call to gen_gvec_fn2i to the end, loading a function
pointer within the switch statement.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 56 ++++++++++----------------------------
 1 file changed, 14 insertions(+), 42 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index f7d492cce4..fc156a217a 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11096,16 +11096,7 @@ static void handle_vec_simd_shri(DisasContext *s, bool is_q, bool is_u,
     int size = 32 - clz32(immh) - 1;
     int immhb = immh << 3 | immb;
     int shift = 2 * (8 << size) - immhb;
-    bool accumulate = false;
-    int dsize = is_q ? 128 : 64;
-    int esize = 8 << size;
-    int elements = dsize/esize;
-    MemOp memop = size | (is_u ? 0 : MO_SIGN);
-    TCGv_i64 tcg_rn = new_tmp_a64(s);
-    TCGv_i64 tcg_rd = new_tmp_a64(s);
-    TCGv_i64 tcg_round;
-    uint64_t round_const;
-    int i;
+    GVecGen2iFn *gvec_fn;
 
     if (extract32(immh, 3, 1) && !is_q) {
         unallocated_encoding(s);
@@ -11119,13 +11110,12 @@ static void handle_vec_simd_shri(DisasContext *s, bool is_q, bool is_u,
 
     switch (opcode) {
     case 0x02: /* SSRA / USRA (accumulate) */
-        gen_gvec_fn2i(s, is_q, rd, rn, shift,
-                      is_u ? arm_gen_gvec_usra : arm_gen_gvec_ssra, size);
-        return;
+        gvec_fn = is_u ? arm_gen_gvec_usra : arm_gen_gvec_ssra;
+        break;
 
     case 0x08: /* SRI */
-        gen_gvec_fn2i(s, is_q, rd, rn, shift, arm_gen_gvec_sri, size);
-        return;
+        gvec_fn = arm_gen_gvec_sri;
+        break;
 
     case 0x00: /* SSHR / USHR */
         if (is_u) {
@@ -11133,49 +11123,31 @@ static void handle_vec_simd_shri(DisasContext *s, bool is_q, bool is_u,
                 /* Shift count the same size as element size produces zero.  */
                 tcg_gen_gvec_dup8i(vec_full_reg_offset(s, rd),
                                    is_q ? 16 : 8, vec_full_reg_size(s), 0);
-            } else {
-                gen_gvec_fn2i(s, is_q, rd, rn, shift, tcg_gen_gvec_shri, size);
+                return;
             }
+            gvec_fn = tcg_gen_gvec_shri;
         } else {
             /* Shift count the same size as element size produces all sign.  */
             if (shift == 8 << size) {
                 shift -= 1;
             }
-            gen_gvec_fn2i(s, is_q, rd, rn, shift, tcg_gen_gvec_sari, size);
+            gvec_fn = tcg_gen_gvec_sari;
         }
-        return;
+        break;
 
     case 0x04: /* SRSHR / URSHR (rounding) */
-        gen_gvec_fn2i(s, is_q, rd, rn, shift,
-                      is_u ? arm_gen_gvec_urshr : arm_gen_gvec_srshr, size);
-        return;
+        gvec_fn = is_u ? arm_gen_gvec_urshr : arm_gen_gvec_srshr;
+        break;
 
     case 0x06: /* SRSRA / URSRA (accum + rounding) */
-        gen_gvec_fn2i(s, is_q, rd, rn, shift,
-                      is_u ? arm_gen_gvec_ursra : arm_gen_gvec_srsra, size);
-        return;
+        gvec_fn = is_u ? arm_gen_gvec_ursra : arm_gen_gvec_srsra;
+        break;
 
     default:
         g_assert_not_reached();
     }
 
-    round_const = 1ULL << (shift - 1);
-    tcg_round = tcg_const_i64(round_const);
-
-    for (i = 0; i < elements; i++) {
-        read_vec_element(s, tcg_rn, rn, i, memop);
-        if (accumulate) {
-            read_vec_element(s, tcg_rd, rd, i, memop);
-        }
-
-        handle_shri_with_rndacc(tcg_rd, tcg_rn, tcg_round,
-                                accumulate, is_u, size, shift);
-
-        write_vec_element(s, tcg_rd, rd, i, size);
-    }
-    tcg_temp_free_i64(tcg_round);
-
-    clear_vec_high(s, is_q, rd);
+    gen_gvec_fn2i(s, is_q, rd, rn, shift, gvec_fn, size);
 }
 
 /* SHL/SLI - Vector shift left */
-- 
2.20.1

