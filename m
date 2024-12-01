Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2148002njk;
        Sun, 1 Dec 2024 07:08:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW4eZHDIsXVwn3QuDqr48VNkSeUj8ajsY9mwLzTC3pY5E6J9GHLsjUGiDE8eQuTWiLD40vlxwqEneghFA==@linaro.org
X-Google-Smtp-Source: AGHT+IGp7VAgour6eEU/bjT5ML3zmJAxE8QXFH1OOZvcvB5ec+yQB7G8SwVh0fJirgHlmQgxOkoT
X-Received: by 2002:a05:6000:2a2:b0:385:e8e7:d09a with SMTP id ffacd0b85a97d-385e8e7d1efmr4183355f8f.2.1733065716923;
        Sun, 01 Dec 2024 07:08:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733065716; cv=none;
        d=google.com; s=arc-20240605;
        b=NIJVYMRWZXmO1Ip3LHGcMuy5TktAB5D2IsvnTWGd87cP7cdo58WBaZ2avfAL8a6q/1
         lFl0bW6KnYWm8Qxy0stidFVxZPWTJJVizIR0O9yYleqYXqWEV/yrG3LqPgu75/A1Jm4V
         gWkoj0VAZLO8k/2h7JTCF052TowXbPNqoKjp+QoX90qM7IX+vfhC0MPD57rWaYjgRBeG
         xfEd1m/7+NqQW21FFBWSdKS+RHFileRsKGebrfdgTMjmSju+kXL+9JrAL3gdXnWYlLni
         LFZerUjOfsNB4dB075DHeZRvB3CsXR5/7vPG7BfxHUKakHM9sVi2lkiGsz+GTiQgZfLI
         sPFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=70aykTODOkdi7LTuMRpkxW0+O38YaCX5SmqDXfk4TvQ=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=A3+vN+/c1MGwvU0YWITmwA/6k67RlOVr86j96mZRGEIDBSWiyVXIjwQZm1hEiLyRL+
         dU8GLrw29xZ4wFEXd1nYSKIcWkCjFX2qp9FuPeN3AK4TZ4w19hcuc0obX9NKAiArDeiE
         WupJrTfQ2oJ8d7YyJRHKves/OmZtExBGT2ke6uVLsnEjeJdPBhk8neCSoXy2whioK+fz
         9Xlmkq+V4YlkW7r8QxnSBfbAiI4lNVvKZRi0phMSXpNJiTgEnZsifJ52tEx3nMpUXHmB
         f11EWC4X33tbAtB/keqrmkeacDGldMghdtge7rSPal481eKhp3jeA/ZBwege0AXmlMSK
         djjw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=swBybefu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-385df2dfa97si3405695f8f.234.2024.12.01.07.08.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:08:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=swBybefu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlWo-0001KK-Et; Sun, 01 Dec 2024 10:06:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWg-0001DF-0D
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:22 -0500
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWd-00046i-Rz
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:21 -0500
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-71d47201b3fso1269291a34.2
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065578; x=1733670378; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=70aykTODOkdi7LTuMRpkxW0+O38YaCX5SmqDXfk4TvQ=;
 b=swBybefu+MZ/uE2kmqciisj4A8Id3PLRGMXkxHS+lB8RGYKbsLDekdf9/zW1fAM4LV
 O+uQOMKcgRpPhpCHlv/2MD0A0WFpg/NhVZJli/gWYgzORr0rZsDcNwYuHC5VHNt6dB6d
 FBa5pT38ZomZ885KLsWTm+6CjSUFPLGN6czp7m/IAE0q31wtkr3Vth0UqZJawRrzRytM
 bN5poWbE9JVejHT28LeHNhPzi7QznZ7KH73gQV9qRjjY89pb39kBYK/7AhSBlG4kwMZP
 ag82dK4w2F4mHR1b1o8TVZiSmmOSQThfm5hUj9MZ+G1EvDDx0TOvoNhAovQFEqFfD+GB
 jGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065578; x=1733670378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=70aykTODOkdi7LTuMRpkxW0+O38YaCX5SmqDXfk4TvQ=;
 b=uVNFsQUFitfVwzrgjLdRDdc4L9qpyly6GPqhuHG2dyqyv3/3PeHSJIdlXKoKfeLXaA
 PY755nCdMrK37NO0/t2WsySBSjTDQgjrfNNOYRAsLfWEsKkCvrzdcYwtAxe6kJ4wSiI0
 bmrUDYWdluJ9+u42M5+cOJ6HGfPbg3XkvW8UseYHS5v4HLU29Zm0In1lYZtnZR/QZNXq
 rRy/k0lwsKviAJ1U6Oc2kFZ8PcSy6yupxfctQbriDmb7NPOrRYBTWZmJpwqDsfrF9x/h
 2ETcCl6Zdmv6mcq0QltoJfeA2GclUkLvFheHtTUm47mlXjhOysebNKhkyVpUmU8WYbNT
 Hbyg==
X-Gm-Message-State: AOJu0Yy56aEU0zjyt4yvRnCTCSTKDB6UClj9IbMCKrg0dlzIZMUbLXHo
 eheEtKLLlLDVvRyws1Hwr9IU2dMgrqf4bCqn1N7KJIk50tr1f3xEn/vXkYLdGYQ=
X-Gm-Gg: ASbGncsXlbFA8uhPvP3ao9WTmiKt0WE8CWmEwiNjXpEIwgiioygUazLPwBgsiATYXjv
 qJXKm9Wlqonvd8DH6K+WHoLW70g1fUpsiLwTYX3XPcMob1+SC3fVVE8xF+uLjOi6f98kYi8q7z/
 R37r78PPaneMgtzkqgUAN5A3dlN+aZfAZo2V285/KbcOmGtUN2UyGspt43U0bM/jn+wqo82AXMs
 EF5FV9W2fGy1QhTgppPxyNxxXhgQnbUUnaWQObCRSXbnb2RZa7mPl7U4xlRKw/N5AhmsJcdDUyn
 TyhbNivkywcQ0YZCeGEVC7RX6yYMkzoCK0Lh
X-Received: by 2002:a05:6830:44a2:b0:718:6da0:72b with SMTP id
 46e09a7af769-71d65c96d51mr16436397a34.7.1733065577911; 
 Sun, 01 Dec 2024 07:06:17 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71d7254473asm1822220a34.27.2024.12.01.07.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:06:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 07/67] target/arm: Convert RBIT, REV16, REV32,
 REV64 to decodetree
Date: Sun,  1 Dec 2024 09:05:06 -0600
Message-ID: <20241201150607.12812-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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
X-TUID: er5VBcRHOfUO

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 137 +++++++++++++++------------------
 target/arm/tcg/a64.decode      |  11 +++
 2 files changed, 72 insertions(+), 76 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index ca8b644dc7..1805d77f43 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7684,6 +7684,60 @@ static bool trans_PACGA(DisasContext *s, arg_rrr *a)
     return false;
 }
 
+typedef void ArithOneOp(TCGv_i64, TCGv_i64);
+
+static bool gen_rr(DisasContext *s, int rd, int rn, ArithOneOp fn)
+{
+    fn(cpu_reg(s, rd), cpu_reg(s, rn));
+    return true;
+}
+
+static void gen_rbit32(TCGv_i64 tcg_rd, TCGv_i64 tcg_rn)
+{
+    TCGv_i32 t32 = tcg_temp_new_i32();
+
+    tcg_gen_extrl_i64_i32(t32, tcg_rn);
+    gen_helper_rbit(t32, t32);
+    tcg_gen_extu_i32_i64(tcg_rd, t32);
+}
+
+static void gen_rev16_xx(TCGv_i64 tcg_rd, TCGv_i64 tcg_rn, TCGv_i64 mask)
+{
+    TCGv_i64 tcg_tmp = tcg_temp_new_i64();
+
+    tcg_gen_shri_i64(tcg_tmp, tcg_rn, 8);
+    tcg_gen_and_i64(tcg_rd, tcg_rn, mask);
+    tcg_gen_and_i64(tcg_tmp, tcg_tmp, mask);
+    tcg_gen_shli_i64(tcg_rd, tcg_rd, 8);
+    tcg_gen_or_i64(tcg_rd, tcg_rd, tcg_tmp);
+}
+
+static void gen_rev16_32(TCGv_i64 tcg_rd, TCGv_i64 tcg_rn)
+{
+    gen_rev16_xx(tcg_rd, tcg_rn, tcg_constant_i64(0x00ff00ff));
+}
+
+static void gen_rev16_64(TCGv_i64 tcg_rd, TCGv_i64 tcg_rn)
+{
+    gen_rev16_xx(tcg_rd, tcg_rn, tcg_constant_i64(0x00ff00ff00ff00ffull));
+}
+
+static void gen_rev_32(TCGv_i64 tcg_rd, TCGv_i64 tcg_rn)
+{
+    tcg_gen_bswap32_i64(tcg_rd, tcg_rn, TCG_BSWAP_OZ);
+}
+
+static void gen_rev32(TCGv_i64 tcg_rd, TCGv_i64 tcg_rn)
+{
+    tcg_gen_bswap64_i64(tcg_rd, tcg_rn);
+    tcg_gen_rotri_i64(tcg_rd, tcg_rd, 32);
+}
+
+TRANS(RBIT, gen_rr, a->rd, a->rn, a->sf ? gen_helper_rbit64 : gen_rbit32)
+TRANS(REV16, gen_rr, a->rd, a->rn, a->sf ? gen_rev16_64 : gen_rev16_32)
+TRANS(REV32, gen_rr, a->rd, a->rn, a->sf ? gen_rev32 : gen_rev_32)
+TRANS(REV64, gen_rr, a->rd, a->rn, tcg_gen_bswap64_i64)
+
 /* Logical (shifted register)
  *   31  30 29 28       24 23   22 21  20  16 15    10 9    5 4    0
  * +----+-----+-----------+-------+---+------+--------+------+------+
@@ -8302,67 +8356,6 @@ static void handle_cls(DisasContext *s, unsigned int sf,
     }
 }
 
-static void handle_rbit(DisasContext *s, unsigned int sf,
-                        unsigned int rn, unsigned int rd)
-{
-    TCGv_i64 tcg_rd, tcg_rn;
-    tcg_rd = cpu_reg(s, rd);
-    tcg_rn = cpu_reg(s, rn);
-
-    if (sf) {
-        gen_helper_rbit64(tcg_rd, tcg_rn);
-    } else {
-        TCGv_i32 tcg_tmp32 = tcg_temp_new_i32();
-        tcg_gen_extrl_i64_i32(tcg_tmp32, tcg_rn);
-        gen_helper_rbit(tcg_tmp32, tcg_tmp32);
-        tcg_gen_extu_i32_i64(tcg_rd, tcg_tmp32);
-    }
-}
-
-/* REV with sf==1, opcode==3 ("REV64") */
-static void handle_rev64(DisasContext *s, unsigned int sf,
-                         unsigned int rn, unsigned int rd)
-{
-    if (!sf) {
-        unallocated_encoding(s);
-        return;
-    }
-    tcg_gen_bswap64_i64(cpu_reg(s, rd), cpu_reg(s, rn));
-}
-
-/* REV with sf==0, opcode==2
- * REV32 (sf==1, opcode==2)
- */
-static void handle_rev32(DisasContext *s, unsigned int sf,
-                         unsigned int rn, unsigned int rd)
-{
-    TCGv_i64 tcg_rd = cpu_reg(s, rd);
-    TCGv_i64 tcg_rn = cpu_reg(s, rn);
-
-    if (sf) {
-        tcg_gen_bswap64_i64(tcg_rd, tcg_rn);
-        tcg_gen_rotri_i64(tcg_rd, tcg_rd, 32);
-    } else {
-        tcg_gen_bswap32_i64(tcg_rd, tcg_rn, TCG_BSWAP_OZ);
-    }
-}
-
-/* REV16 (opcode==1) */
-static void handle_rev16(DisasContext *s, unsigned int sf,
-                         unsigned int rn, unsigned int rd)
-{
-    TCGv_i64 tcg_rd = cpu_reg(s, rd);
-    TCGv_i64 tcg_tmp = tcg_temp_new_i64();
-    TCGv_i64 tcg_rn = read_cpu_reg(s, rn, sf);
-    TCGv_i64 mask = tcg_constant_i64(sf ? 0x00ff00ff00ff00ffull : 0x00ff00ff);
-
-    tcg_gen_shri_i64(tcg_tmp, tcg_rn, 8);
-    tcg_gen_and_i64(tcg_rd, tcg_rn, mask);
-    tcg_gen_and_i64(tcg_tmp, tcg_tmp, mask);
-    tcg_gen_shli_i64(tcg_rd, tcg_rd, 8);
-    tcg_gen_or_i64(tcg_rd, tcg_rd, tcg_tmp);
-}
-
 /* Data-processing (1 source)
  *   31  30  29  28             21 20     16 15    10 9    5 4    0
  * +----+---+---+-----------------+---------+--------+------+------+
@@ -8388,21 +8381,6 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
 #define MAP(SF, O2, O1) ((SF) | (O1 << 1) | (O2 << 7))
 
     switch (MAP(sf, opcode2, opcode)) {
-    case MAP(0, 0x00, 0x00): /* RBIT */
-    case MAP(1, 0x00, 0x00):
-        handle_rbit(s, sf, rn, rd);
-        break;
-    case MAP(0, 0x00, 0x01): /* REV16 */
-    case MAP(1, 0x00, 0x01):
-        handle_rev16(s, sf, rn, rd);
-        break;
-    case MAP(0, 0x00, 0x02): /* REV/REV32 */
-    case MAP(1, 0x00, 0x02):
-        handle_rev32(s, sf, rn, rd);
-        break;
-    case MAP(1, 0x00, 0x03): /* REV64 */
-        handle_rev64(s, sf, rn, rd);
-        break;
     case MAP(0, 0x00, 0x04): /* CLZ */
     case MAP(1, 0x00, 0x04):
         handle_clz(s, sf, rn, rd);
@@ -8557,6 +8535,13 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
         break;
     default:
     do_unallocated:
+    case MAP(0, 0x00, 0x00): /* RBIT */
+    case MAP(1, 0x00, 0x00):
+    case MAP(0, 0x00, 0x01): /* REV16 */
+    case MAP(1, 0x00, 0x01):
+    case MAP(0, 0x00, 0x02): /* REV/REV32 */
+    case MAP(1, 0x00, 0x02):
+    case MAP(1, 0x00, 0x03): /* REV64 */
         unallocated_encoding(s);
         break;
     }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index a23d6a6645..dd44651f34 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -28,6 +28,8 @@
 &r              rn
 &rrr            rd rn rm
 &ri             rd imm
+&rr             rd rn
+&rr_sf          rd rn sf
 &rri_sf         rd rn imm sf
 &rrr_sf         rd rn rm sf
 &i              imm
@@ -685,6 +687,15 @@ GMI             1 00 11010110 ..... 000101 ..... .....  @rrr
 PACGA           1 00 11010110 ..... 001100 ..... .....  @rrr
 
 # Data Processing (1-source)
+
+@rr             . .......... ..... ...... rn:5 rd:5     &rr
+@rr_sf          sf:1 .......... ..... ...... rn:5 rd:5  &rr_sf
+
+RBIT            . 10 11010110 00000 000000 ..... .....  @rr_sf
+REV16           . 10 11010110 00000 000001 ..... .....  @rr_sf
+REV32           . 10 11010110 00000 000010 ..... .....  @rr_sf
+REV64           1 10 11010110 00000 000011 ..... .....  @rr
+
 # Logical (shifted reg)
 # Add/subtract (shifted reg)
 # Add/subtract (extended reg)
-- 
2.43.0

