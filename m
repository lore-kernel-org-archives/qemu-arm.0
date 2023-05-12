Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp4842622ejq;
        Fri, 12 May 2023 07:43:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7ad2s1R6VgNbraCxs8wdZ01E3IdKYc3qHqbxLVFxIhpu7m+CZ6Ir1YfcMdqn4B6uPx3r5u
X-Received: by 2002:a05:6214:1c87:b0:621:599d:2fa0 with SMTP id ib7-20020a0562141c8700b00621599d2fa0mr13247801qvb.18.1683902590496;
        Fri, 12 May 2023 07:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683902590; cv=none;
        d=google.com; s=arc-20160816;
        b=Fnrp7ovdp2YK3WI6IY7Vk2JdOO3w/CgbpRoGlMJqOuY3y1ZVGKAOeslbIpBftOrNY3
         TCkWiR8Ag8njtrJETv8nun3IMnrXztaBy94ydECEBxkMtjUwuH8Maa90O8SsBZNbYKFC
         abLKt1wwdY9mBxcLosH98/0QmFnJWtc95RQbYiF/g10zn2LL4LXXdSLKjmaqVZ7KvKhU
         SRFk0jIc0YWOSDUxMLYuwfFQ7CRFck6ofTa9gRrPi0lLrKiKbVAppFF3z2xxfbosoeTu
         Vfo9KNsaPEcUKLNDP0Sz14nznSK6/IXDN4cWLB5juxojmtT05vkiZ1/8CQWqILk7dOSu
         B+YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WFWx3ixalVla371utWzQEGMgJNlwfauaj/lO3THOe6A=;
        b=sg/D+M+1ldC8Kab1r+/ar0I1zAbSO2B99GzbKkCxY7305up55GOO3R+Rb8Pw4Gk112
         UiFD4QSNlbIewPXEqiYP3J2w69lf0DF2i/FbmIxt7PwALLujJgOSpXP1nX9/S3AyNm6q
         Zs7gxCiTsEa649kb+Xl0LK4cCYNNC2Y4gNnG72q3Rh7/5xHACFU+R7ZZlb5MlVeEeOSc
         PJkuA1QO2aej0bGZTuCR84j6eo5QMO/8BAgGirMmpeLRDcd7bCKWoYxnvGTfKw3/suVo
         di9rJL2ZkCjdazhEz0/b3oG4pLePWScOxTQz9N47h9Syc5VOfImlz+lWX683KTC597PZ
         DcIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ku+z6cFi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3-20020a05622a1a0300b003f391692b09si5331546qtb.16.2023.05.12.07.43.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 May 2023 07:43:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ku+z6cFi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxTxg-0007Cb-6k; Fri, 12 May 2023 10:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxa-00075d-Ox
 for qemu-arm@nongnu.org; Fri, 12 May 2023 10:41:30 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxL-0004jY-8x
 for qemu-arm@nongnu.org; Fri, 12 May 2023 10:41:30 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f42769a0c1so58308225e9.2
 for <qemu-arm@nongnu.org>; Fri, 12 May 2023 07:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902474; x=1686494474;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WFWx3ixalVla371utWzQEGMgJNlwfauaj/lO3THOe6A=;
 b=ku+z6cFiemc4DZHymCGKwkJxpqK3J+aKORnaxL/NjGGpyj9J5vaY8bmzXWI4zTLs2f
 1zCjg3GKSgPGy2Bfu3HugZybZZyfAPBLM5LsHJha9GS4s/Zq/OrNRF1YWNcfqZcURvsS
 F3ZRfahKlt0mKkyCSwfSpIraMWNtz+ah+y+MLbDD9gDYXxvywP2c6eiVfu+hO10CI4Yh
 muzWJQxqOW17LmZ9VHD295O5QRiDJK8iKUiSaMYGLCIKtKfjBxgfZl/ohiHfLYM9md5r
 y/nq3PdNhjOum2jKpfRd+O0AEUGEvj9ItPBHgB2mVWtrYwUK3UnVeybIksoA9iKO0/gS
 3+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902474; x=1686494474;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WFWx3ixalVla371utWzQEGMgJNlwfauaj/lO3THOe6A=;
 b=HR7iQ9HPWs7hbl/VZ86mSO8LtTgFIrSGQl7IZi0esFKES2UT1vE+1eUxfrv87BseuO
 NfxaNUHUHajLNWCTVpKJR4TbMP02/RIG+bJCnrZ+cFJCxfeQ/MwiilicuD4ryAqXPKO/
 BFhvjS8BUmkRQ7p2DFABGLVzUT/iyc+V6C3KyLcVtmrR1pZg40+7amPHZlAR925hCscd
 6asac9aGBFscgYGGt8mcxgeWGnN5RfUY+Xy1AjWmxWZ7U+PSYTtoJDY0sSv8dDrcRf2R
 UABX6TTNftMNDj+YEyvP29Ub0af8XGg5vNonEFNNb8BrDbXW9jGR78HZC5hASWwURy/d
 Y/mg==
X-Gm-Message-State: AC+VfDyzjeM1Px33KBKInA7qXWpQqYIFYzxw7Z6GFVkzwWITDPEoWbrr
 BiR2sGaRTEix+bclV/7BXTSe1rFPbZLS9y+1HwU=
X-Received: by 2002:a05:600c:cf:b0:3f4:29c2:61e6 with SMTP id
 u15-20020a05600c00cf00b003f429c261e6mr10509339wmm.34.1683902474026; 
 Fri, 12 May 2023 07:41:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm28916167wmh.27.2023.05.12.07.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:41:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 12/20] target/arm: Convert Extract instructions to decodetree
Date: Fri, 12 May 2023 15:40:58 +0100
Message-Id: <20230512144106.3608981-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512144106.3608981-1-peter.maydell@linaro.org>
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: bltvqgqEO6Gq

Convert the EXTR instruction to decodetree (this is the
only one in the 'Extract" class). This is the last of
the dp-immediate insns in the legacy decoder, so we
can now remove disas_data_proc_imm().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/a64.decode      |  9 ++++
 target/arm/tcg/translate-a64.c | 94 +++++++++++-----------------------
 2 files changed, 38 insertions(+), 65 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 4d5709f9857..eb5d4cb0d57 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -97,3 +97,12 @@ BFM             . 01 100110 . ...... ...... ..... ..... @bitfield_64
 BFM             . 01 100110 . ...... ...... ..... ..... @bitfield_32
 UBFM            . 10 100110 . ...... ...... ..... ..... @bitfield_64
 UBFM            . 10 100110 . ...... ...... ..... ..... @bitfield_32
+
+# Extract
+
+&extract        rd rn rm imm sf
+@extract_64     1 .. ...... 1 . rm:5 imm:6 rn:5 rd:5      &extract sf=1
+@extract_32     0 .. ...... 0 . rm:5 0 imm:5 rn:5 rd:5    &extract sf=0
+
+EXTR            . 00 100111 . 0 ..... ...... ..... ..... @extract_64
+EXTR            . 00 100111 . 0 ..... ...... ..... ..... @extract_32
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index f5649de60a8..4319559057f 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4530,77 +4530,44 @@ static bool trans_BFM(DisasContext *s, arg_BFM *a)
     return true;
 }
 
-/* Extract
- *   31  30  29 28         23 22   21  20  16 15    10 9    5 4    0
- * +----+------+-------------+---+----+------+--------+------+------+
- * | sf | op21 | 1 0 0 1 1 1 | N | o0 |  Rm  |  imms  |  Rn  |  Rd  |
- * +----+------+-------------+---+----+------+--------+------+------+
- */
-static void disas_extract(DisasContext *s, uint32_t insn)
+static bool trans_EXTR(DisasContext *s, arg_extract *a)
 {
-    unsigned int sf, n, rm, imm, rn, rd, bitsize, op21, op0;
+    TCGv_i64 tcg_rd, tcg_rm, tcg_rn;
 
-    sf = extract32(insn, 31, 1);
-    n = extract32(insn, 22, 1);
-    rm = extract32(insn, 16, 5);
-    imm = extract32(insn, 10, 6);
-    rn = extract32(insn, 5, 5);
-    rd = extract32(insn, 0, 5);
-    op21 = extract32(insn, 29, 2);
-    op0 = extract32(insn, 21, 1);
-    bitsize = sf ? 64 : 32;
+    tcg_rd = cpu_reg(s, a->rd);
 
-    if (sf != n || op21 || op0 || imm >= bitsize) {
-        unallocated_encoding(s);
-    } else {
-        TCGv_i64 tcg_rd, tcg_rm, tcg_rn;
-
-        tcg_rd = cpu_reg(s, rd);
-
-        if (unlikely(imm == 0)) {
-            /* tcg shl_i32/shl_i64 is undefined for 32/64 bit shifts,
-             * so an extract from bit 0 is a special case.
-             */
-            if (sf) {
-                tcg_gen_mov_i64(tcg_rd, cpu_reg(s, rm));
-            } else {
-                tcg_gen_ext32u_i64(tcg_rd, cpu_reg(s, rm));
-            }
+    if (unlikely(a->imm == 0)) {
+        /*
+         * tcg shl_i32/shl_i64 is undefined for 32/64 bit shifts,
+         * so an extract from bit 0 is a special case.
+         */
+        if (a->sf) {
+            tcg_gen_mov_i64(tcg_rd, cpu_reg(s, a->rm));
         } else {
-            tcg_rm = cpu_reg(s, rm);
-            tcg_rn = cpu_reg(s, rn);
+            tcg_gen_ext32u_i64(tcg_rd, cpu_reg(s, a->rm));
+        }
+    } else {
+        tcg_rm = cpu_reg(s, a->rm);
+        tcg_rn = cpu_reg(s, a->rn);
 
-            if (sf) {
-                /* Specialization to ROR happens in EXTRACT2.  */
-                tcg_gen_extract2_i64(tcg_rd, tcg_rm, tcg_rn, imm);
+        if (a->sf) {
+            /* Specialization to ROR happens in EXTRACT2.  */
+            tcg_gen_extract2_i64(tcg_rd, tcg_rm, tcg_rn, a->imm);
+        } else {
+            TCGv_i32 t0 = tcg_temp_new_i32();
+
+            tcg_gen_extrl_i64_i32(t0, tcg_rm);
+            if (a->rm == a->rn) {
+                tcg_gen_rotri_i32(t0, t0, a->imm);
             } else {
-                TCGv_i32 t0 = tcg_temp_new_i32();
-
-                tcg_gen_extrl_i64_i32(t0, tcg_rm);
-                if (rm == rn) {
-                    tcg_gen_rotri_i32(t0, t0, imm);
-                } else {
-                    TCGv_i32 t1 = tcg_temp_new_i32();
-                    tcg_gen_extrl_i64_i32(t1, tcg_rn);
-                    tcg_gen_extract2_i32(t0, t0, t1, imm);
-                }
-                tcg_gen_extu_i32_i64(tcg_rd, t0);
+                TCGv_i32 t1 = tcg_temp_new_i32();
+                tcg_gen_extrl_i64_i32(t1, tcg_rn);
+                tcg_gen_extract2_i32(t0, t0, t1, a->imm);
             }
+            tcg_gen_extu_i32_i64(tcg_rd, t0);
         }
     }
-}
-
-/* Data processing - immediate */
-static void disas_data_proc_imm(DisasContext *s, uint32_t insn)
-{
-    switch (extract32(insn, 23, 6)) {
-    case 0x27: /* Extract */
-        disas_extract(s, insn);
-        break;
-    default:
-        unallocated_encoding(s);
-        break;
-    }
+    return true;
 }
 
 /* Shift a TCGv src by TCGv shift_amount, put result in dst.
@@ -14125,9 +14092,6 @@ static bool btype_destination_ok(uint32_t insn, bool bt, int btype)
 static void disas_a64_legacy(DisasContext *s, uint32_t insn)
 {
     switch (extract32(insn, 25, 4)) {
-    case 0x8: case 0x9: /* Data processing - immediate */
-        disas_data_proc_imm(s, insn);
-        break;
     case 0xa: case 0xb: /* Branch, exception generation and system insns */
         disas_b_exc_sys(s, insn);
         break;
-- 
2.34.1

