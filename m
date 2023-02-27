Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4299462ejc;
        Sun, 26 Feb 2023 21:47:29 -0800 (PST)
X-Google-Smtp-Source: AK7set8R+/AXnERKvF4zriRrtJxB2RNSYmAox/XApNkZFi8LGDm9HObchQjpn4IUqcnsjSZ8vyIR
X-Received: by 2002:a05:6214:1d04:b0:572:592c:655d with SMTP id e4-20020a0562141d0400b00572592c655dmr27678325qvd.42.1677476849005;
        Sun, 26 Feb 2023 21:47:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476848; cv=none;
        d=google.com; s=arc-20160816;
        b=Is8lbYSx4liZQzbV7bt2CKG2Cl8ZTal161+fiR/bgr5p2sJTIRo2K2ZP+7IiOuG4au
         z8i+0D8nnGsdNNtoR5lKt4cc9EMK5hb69OHZQRB1lu1nstvzBBMXoc03YP6JC6k248VZ
         MI+VqItwXvXgZnv5Dvoza8ENvg4xzExMK+9E6sZ49fTVDLyvilNJAnw4VQ4PYEv2H4Th
         3InHdj8Jk7jDmFP146FSRgbOztIMdTYPTrrk/XlBIUDhaQOuxBeZQXqBqo3P4iHyVg3I
         gtCq8NX1NnnNmzkbJbsyHk6hAiLDiUDPOZ2FIVn78eWasgXbHcnYlbxm9SOdBFXoyxgb
         EKwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IK5cdibGrlxCvWnzF9s1ITVzwrnk5CQSmad2m4SDXHo=;
        b=Kp5ltB6eu4iWY/4fbvsM6MJ3GAsfGg3PMJTXElDWODS4h6hKBumaioksLgz3GQ9e+h
         30e5T7chpdaflRb+SxwdcK8rzOp3V7T2r9n0fUeME5B5tT8bfvqM7JTBN7sGBETqklhJ
         scD3bT106QVj7jJcb5AG2yMTHUu/2cvQhVju2c//y4Yy+IKNC3KHgDqxzL9Cur8yR1rO
         JISqOObJsYbDx3k5Hmx8F4G5/ttjndo/F3sPB24PCVSIHrsC14o5iDYdA5L4CKznVg78
         Q5NHXpOW4dGfbKllFhSfY1T2w7rHcIIt0Uxtqmgwnuc68vF2jK8s61BtGhjsE1ogQDKf
         Yp8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hL6eJN8Q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2-20020a0cf302000000b0056ea2d16338si5620701qvl.515.2023.02.26.21.47.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:47:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hL6eJN8Q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWIJ-0003yZ-GJ; Mon, 27 Feb 2023 00:43:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIH-0003la-6M
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:25 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIC-0004k3-7P
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:24 -0500
Received: by mail-pf1-x42c.google.com with SMTP id cp12so2045614pfb.5
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IK5cdibGrlxCvWnzF9s1ITVzwrnk5CQSmad2m4SDXHo=;
 b=hL6eJN8QUq0KkvG1eM6hrYIoztabAEq8R30mW6QVaNAgX3AlMNZ88MK07ILpsmnXgU
 5rAk3Bz3n/4d4AWylAqEtqGYCutrrdyM8QfXanJpsdiHv/6YbgASRajmbRRvvCa7fX+J
 MgWZ4SyinnXLKdL61DZn7OxOr3jiUiUpcHs9j7kTMI44DDijClkadAgjpHuDiRC5Fjc2
 EfXHt+QqFJ+N8LkXaywzV7ULNXwuapmspaB8ZN6bbK6s/0htk1exyK9Met/Yum2EqqUJ
 ynnecKAqvyyFFQk6AIno74u6UIYNh5h7yBIOuAdyfg9QVgqdIk3pxGHUgPT2cm9eTye1
 AXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IK5cdibGrlxCvWnzF9s1ITVzwrnk5CQSmad2m4SDXHo=;
 b=Uy7ZPYOHHZOtiGElFeirBN7bzE3wF/ZxXwDyKVg8eBi8bBvnFBoHYkGK9KiM804EbK
 cqxAi1QoP50EBXsnqGNqfyQlY9CB8kWAdBuVfvuk3MmTZK5fB3c43zB+y7RiFmypINjV
 NfGJBlG/Z5tQ4HKzvD4K6xp08gkgLOZTwkW1/md3DURF7k/aLvnOMRSFYwAhGwg5yo5R
 +01U5k37Ho22z9KnVdxivw9zbBv/qRuZaxvIngJHWRVGRDrWv8hYsNbssfTLqz5Qq7Xe
 hqQysEplk6EWmtZ74ooRc0F777d4aeveNqghvlwoIUmW+YbVWjF7unDQwb3v5de7B/Vy
 QcCA==
X-Gm-Message-State: AO0yUKVKw+J+PyVywiszvBdo1K4SuNSNjP6oPlCN8C/WvHARj7thOCgh
 uciVrrenUjx3TknnHhUQjoyjJrTtyJEbdoQPmKo=
X-Received: by 2002:a62:1b4a:0:b0:5a8:acd9:765b with SMTP id
 b71-20020a621b4a000000b005a8acd9765bmr20858357pfb.16.1677476598819; 
 Sun, 26 Feb 2023 21:43:18 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 13/70] target/avr: Avoid use of tcg_const_i32 throughout
Date: Sun, 26 Feb 2023 19:41:36 -1000
Message-Id: <20230227054233.390271-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: CqgqF0XnSWji

All remaining uses are strictly read-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/translate.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index 190d0c3f97..a6aeae6dfa 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -400,7 +400,7 @@ static bool trans_SUB(DisasContext *ctx, arg_SUB *a)
 static bool trans_SUBI(DisasContext *ctx, arg_SUBI *a)
 {
     TCGv Rd = cpu_r[a->rd];
-    TCGv Rr = tcg_const_i32(a->imm);
+    TCGv Rr = tcg_constant_i32(a->imm);
     TCGv R = tcg_temp_new_i32();
 
     tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Imm */
@@ -425,7 +425,7 @@ static bool trans_SBC(DisasContext *ctx, arg_SBC *a)
     TCGv Rd = cpu_r[a->rd];
     TCGv Rr = cpu_r[a->rr];
     TCGv R = tcg_temp_new_i32();
-    TCGv zero = tcg_const_i32(0);
+    TCGv zero = tcg_constant_i32(0);
 
     tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Rr - Cf */
     tcg_gen_sub_tl(R, R, cpu_Cf);
@@ -453,9 +453,9 @@ static bool trans_SBC(DisasContext *ctx, arg_SBC *a)
 static bool trans_SBCI(DisasContext *ctx, arg_SBCI *a)
 {
     TCGv Rd = cpu_r[a->rd];
-    TCGv Rr = tcg_const_i32(a->imm);
+    TCGv Rr = tcg_constant_i32(a->imm);
     TCGv R = tcg_temp_new_i32();
-    TCGv zero = tcg_const_i32(0);
+    TCGv zero = tcg_constant_i32(0);
 
     tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Rr - Cf */
     tcg_gen_sub_tl(R, R, cpu_Cf);
@@ -637,7 +637,7 @@ static bool trans_COM(DisasContext *ctx, arg_COM *a)
 static bool trans_NEG(DisasContext *ctx, arg_NEG *a)
 {
     TCGv Rd = cpu_r[a->rd];
-    TCGv t0 = tcg_const_i32(0);
+    TCGv t0 = tcg_constant_i32(0);
     TCGv R = tcg_temp_new_i32();
 
     tcg_gen_sub_tl(R, t0, Rd); /* R = 0 - Rd */
@@ -930,19 +930,19 @@ static void gen_jmp_z(DisasContext *ctx)
 static void gen_push_ret(DisasContext *ctx, int ret)
 {
     if (avr_feature(ctx->env, AVR_FEATURE_1_BYTE_PC)) {
-        TCGv t0 = tcg_const_i32((ret & 0x0000ff));
+        TCGv t0 = tcg_constant_i32(ret & 0x0000ff);
 
         tcg_gen_qemu_st_tl(t0, cpu_sp, MMU_DATA_IDX, MO_UB);
         tcg_gen_subi_tl(cpu_sp, cpu_sp, 1);
     } else if (avr_feature(ctx->env, AVR_FEATURE_2_BYTE_PC)) {
-        TCGv t0 = tcg_const_i32((ret & 0x00ffff));
+        TCGv t0 = tcg_constant_i32(ret & 0x00ffff);
 
         tcg_gen_subi_tl(cpu_sp, cpu_sp, 1);
         tcg_gen_qemu_st_tl(t0, cpu_sp, MMU_DATA_IDX, MO_BEUW);
         tcg_gen_subi_tl(cpu_sp, cpu_sp, 1);
     } else if (avr_feature(ctx->env, AVR_FEATURE_3_BYTE_PC)) {
-        TCGv lo = tcg_const_i32((ret & 0x0000ff));
-        TCGv hi = tcg_const_i32((ret & 0xffff00) >> 8);
+        TCGv lo = tcg_constant_i32(ret & 0x0000ff);
+        TCGv hi = tcg_constant_i32((ret & 0xffff00) >> 8);
 
         tcg_gen_qemu_st_tl(lo, cpu_sp, MMU_DATA_IDX, MO_UB);
         tcg_gen_subi_tl(cpu_sp, cpu_sp, 2);
@@ -1211,7 +1211,7 @@ static bool trans_CPC(DisasContext *ctx, arg_CPC *a)
     TCGv Rd = cpu_r[a->rd];
     TCGv Rr = cpu_r[a->rr];
     TCGv R = tcg_temp_new_i32();
-    TCGv zero = tcg_const_i32(0);
+    TCGv zero = tcg_constant_i32(0);
 
     tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Rr - Cf */
     tcg_gen_sub_tl(R, R, cpu_Cf);
@@ -1238,7 +1238,7 @@ static bool trans_CPI(DisasContext *ctx, arg_CPI *a)
 {
     TCGv Rd = cpu_r[a->rd];
     int Imm = a->imm;
-    TCGv Rr = tcg_const_i32(Imm);
+    TCGv Rr = tcg_constant_i32(Imm);
     TCGv R = tcg_temp_new_i32();
 
     tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Rr */
@@ -2124,7 +2124,7 @@ static bool trans_SPMX(DisasContext *ctx, arg_SPMX *a)
 static bool trans_IN(DisasContext *ctx, arg_IN *a)
 {
     TCGv Rd = cpu_r[a->rd];
-    TCGv port = tcg_const_i32(a->imm);
+    TCGv port = tcg_constant_i32(a->imm);
 
     gen_helper_inb(Rd, cpu_env, port);
     return true;
@@ -2137,7 +2137,7 @@ static bool trans_IN(DisasContext *ctx, arg_IN *a)
 static bool trans_OUT(DisasContext *ctx, arg_OUT *a)
 {
     TCGv Rd = cpu_r[a->rd];
-    TCGv port = tcg_const_i32(a->imm);
+    TCGv port = tcg_constant_i32(a->imm);
 
     gen_helper_outb(cpu_env, port, Rd);
     return true;
@@ -2405,7 +2405,7 @@ static bool trans_SWAP(DisasContext *ctx, arg_SWAP *a)
 static bool trans_SBI(DisasContext *ctx, arg_SBI *a)
 {
     TCGv data = tcg_temp_new_i32();
-    TCGv port = tcg_const_i32(a->reg);
+    TCGv port = tcg_constant_i32(a->reg);
 
     gen_helper_inb(data, cpu_env, port);
     tcg_gen_ori_tl(data, data, 1 << a->bit);
@@ -2420,7 +2420,7 @@ static bool trans_SBI(DisasContext *ctx, arg_SBI *a)
 static bool trans_CBI(DisasContext *ctx, arg_CBI *a)
 {
     TCGv data = tcg_temp_new_i32();
-    TCGv port = tcg_const_i32(a->reg);
+    TCGv port = tcg_constant_i32(a->reg);
 
     gen_helper_inb(data, cpu_env, port);
     tcg_gen_andi_tl(data, data, ~(1 << a->bit));
-- 
2.34.1

