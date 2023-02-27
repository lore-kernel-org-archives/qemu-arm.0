Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4299791ejc;
        Sun, 26 Feb 2023 21:48:06 -0800 (PST)
X-Google-Smtp-Source: AK7set/ritKiAXnbTzUN5bIuY9l6fycGdfvvR4kfEaRJo2nligHIxUDzZ35wgPqdTPExHntE1TSU
X-Received: by 2002:a05:6214:5189:b0:56f:154:2508 with SMTP id kl9-20020a056214518900b0056f01542508mr38835249qvb.1.1677476886707;
        Sun, 26 Feb 2023 21:48:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476886; cv=none;
        d=google.com; s=arc-20160816;
        b=GK2XbYTIfRkaCUz1/SGXQu1Suc9ugxvoROh+9/ZfDC36AQ9n6SI9AoolOpiGEnDmpX
         dmoLm3VheLjQVx9DfTXiN/Y0GqPfx0r7ZwPz6iG4Gq83gN1bDOtfY1w2DADvV5QrKfux
         6cI4M3dOD4j4CK+2hpdpCalEGcOhx7H+5koQo5ClAxe0zlDQoNKnd4AlD6HoOn3Qi68F
         qlGNCSK50NGTC1cdM575dyu6BS8gK2waWVe1hrXXThK9Ko9z7nyBtbYC+sSf7UwLswsp
         2GY3BjNr+aPRb3KvSiz5pFlEGtblKZLQ9cv2UEEOEVqGNm4qBaGssgDNM7J9JdqUvqDx
         d4yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=18JmFlWEdnV+s8Kjewsq0ZcZnDUj7UiObvsTbLqqvwo=;
        b=O2q0paziS72s9NK/eTPYGI6F+8SER6CJBW+NJUaHuzumgWZPtzShEXfvpvR5fDPJwp
         Y9UEacrluHVDoB9+L6EoSWwSwKMiSu5L5uipIscolmwuXSt5CDbk/g8UM75IDQVy9Ffq
         WPeBP6dUAtxjXTW9LyurDkRkDbI8GIc8vhMJ7Xk4zGAeJIhrWHGng30wiTnXMjUxZ/Q9
         qxHCz5PrFf6l83iJod1nNcdynoBkWQ4sU9EvzkwIYVv18tIjyaV0ub7l4ux44grSZcwd
         PDnAs3Yi5o2nJ3GSdk0wUzzaaBgDZtYla5O2vCLj1RIGe4BFmPUy1mGnO/tWo79xTGbr
         NL8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nKhf73df;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s26-20020a0cb31a000000b005346e124cf5si6765878qve.20.2023.02.26.21.48.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:48:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nKhf73df;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWEs-0002tP-3O; Mon, 27 Feb 2023 00:39:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDS-0003og-Av
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:38:28 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDN-00036M-9q
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:38:25 -0500
Received: by mail-pg1-x52e.google.com with SMTP id bn17so2828817pgb.10
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=18JmFlWEdnV+s8Kjewsq0ZcZnDUj7UiObvsTbLqqvwo=;
 b=nKhf73df0jSurL3IRj8qoqKAuIjblaKOEdGfsr97j679eUg38Gef6+xIHPUFFjVAik
 J67oZM4Hhii5vR1AUGM6Uon6Qnzbach33jYxa3k0wv6VIxKtPUi/Q1fUlADYkfdVLLOU
 68uqqTuCIGnGhfMD+d9CloS1VeRkHByuNfvOAGw+spv0b/5hwM/nTlS/qJ/RBCH02K+W
 leKue1HgxG9ndePCmsyU13P7+X+xLEBXZtnBSJhVulXQu/APSrVGqeIiYzGWCY27nTUr
 R7TtypmYD6ilFCMX3cjFZZ1L1fZfdoeU3E0yuhF+ciAUii/BAH5pi1vUsKZXaWiAyg27
 dKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=18JmFlWEdnV+s8Kjewsq0ZcZnDUj7UiObvsTbLqqvwo=;
 b=qR8sQk6gepHQLESZzdGPbb92eWp0g8HkfllLj3euAkKmZ05Y2ctaMAIMit06hLFhK7
 rlRZVgaGtsxpsJB+VOoLRsGqVRmEz7JysanWle1cqiOxfUKa4HuNSaSjFk+RJRsmwPOi
 AeVNnPBx0OxFsdZe71413/g4Bv5FxtfGChiP/D8Ke9U6QRa5pWW/0A93ctUSktM55O9g
 B+drXoMAIWrmy6aIL7wwurUV4mlZDc4hw1vD5REHJTHfk8TvdVquE6E0oNNVj6TeKiNK
 484Tl0ksPQKu26vkoXKm+P6FmtxLGvJ3jcYhBQ2cSf607/uKdxBrDLW4pRsP0N2d2b99
 gVsQ==
X-Gm-Message-State: AO0yUKX56xUAh0jp2bOMNYIXefAj+1Bj50QP2JphulT/CajQl/udTr1n
 rQmDa3wFiZteWQd9ZKAfxZMDiA==
X-Received: by 2002:a62:3841:0:b0:5a9:c55b:2cae with SMTP id
 f62-20020a623841000000b005a9c55b2caemr20329570pfa.31.1677476299373; 
 Sun, 26 Feb 2023 21:38:19 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:38:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 27/31] target/ppc: Don't use tcg_temp_local_new
Date: Sun, 26 Feb 2023 19:36:57 -1000
Message-Id: <20230227053701.368744-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
X-TUID: WlrTrlQH4iC1

Since tcg_temp_new is now identical, use that.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c              | 6 +++---
 target/ppc/translate/spe-impl.c.inc | 8 ++++----
 target/ppc/translate/vmx-impl.c.inc | 4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 5fe6aa641e..2956021e89 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4415,7 +4415,7 @@ static void gen_bcond(DisasContext *ctx, int type)
     TCGv target;
 
     if (type == BCOND_LR || type == BCOND_CTR || type == BCOND_TAR) {
-        target = tcg_temp_local_new();
+        target = tcg_temp_new();
         if (type == BCOND_CTR) {
             tcg_gen_mov_tl(target, cpu_ctr);
         } else if (type == BCOND_TAR) {
@@ -5594,8 +5594,8 @@ static inline void gen_405_mulladd_insn(DisasContext *ctx, int opc2, int opc3,
 {
     TCGv t0, t1;
 
-    t0 = tcg_temp_local_new();
-    t1 = tcg_temp_local_new();
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
 
     switch (opc3 & 0x0D) {
     case 0x05:
diff --git a/target/ppc/translate/spe-impl.c.inc b/target/ppc/translate/spe-impl.c.inc
index 2e6e799a25..bd8963db2b 100644
--- a/target/ppc/translate/spe-impl.c.inc
+++ b/target/ppc/translate/spe-impl.c.inc
@@ -168,7 +168,7 @@ static inline void gen_op_evsrwu(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
 {
     TCGLabel *l1 = gen_new_label();
     TCGLabel *l2 = gen_new_label();
-    TCGv_i32 t0 = tcg_temp_local_new_i32();
+    TCGv_i32 t0 = tcg_temp_new_i32();
 
     /* No error here: 6 bits are used */
     tcg_gen_andi_i32(t0, arg2, 0x3F);
@@ -185,7 +185,7 @@ static inline void gen_op_evsrws(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
 {
     TCGLabel *l1 = gen_new_label();
     TCGLabel *l2 = gen_new_label();
-    TCGv_i32 t0 = tcg_temp_local_new_i32();
+    TCGv_i32 t0 = tcg_temp_new_i32();
 
     /* No error here: 6 bits are used */
     tcg_gen_andi_i32(t0, arg2, 0x3F);
@@ -202,7 +202,7 @@ static inline void gen_op_evslw(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
 {
     TCGLabel *l1 = gen_new_label();
     TCGLabel *l2 = gen_new_label();
-    TCGv_i32 t0 = tcg_temp_local_new_i32();
+    TCGv_i32 t0 = tcg_temp_new_i32();
 
     /* No error here: 6 bits are used */
     tcg_gen_andi_i32(t0, arg2, 0x3F);
@@ -378,7 +378,7 @@ static inline void gen_evsel(DisasContext *ctx)
     TCGLabel *l2 = gen_new_label();
     TCGLabel *l3 = gen_new_label();
     TCGLabel *l4 = gen_new_label();
-    TCGv_i32 t0 = tcg_temp_local_new_i32();
+    TCGv_i32 t0 = tcg_temp_new_i32();
 
     tcg_gen_andi_i32(t0, cpu_crf[ctx->opcode & 0x07], 1 << 3);
     tcg_gen_brcondi_i32(TCG_COND_EQ, t0, 0, l1);
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 7741f2eb49..2dd17ab106 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1508,8 +1508,8 @@ static bool do_vcmpq(DisasContext *ctx, arg_VX_bf *a, bool sign)
     REQUIRE_INSNS_FLAGS2(ctx, ISA310);
     REQUIRE_VECTOR(ctx);
 
-    vra = tcg_temp_local_new_i64();
-    vrb = tcg_temp_local_new_i64();
+    vra = tcg_temp_new_i64();
+    vrb = tcg_temp_new_i64();
     gt = gen_new_label();
     lt = gen_new_label();
     done = gen_new_label();
-- 
2.34.1

