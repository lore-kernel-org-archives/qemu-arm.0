Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4301791ejc;
        Sun, 26 Feb 2023 21:51:54 -0800 (PST)
X-Google-Smtp-Source: AK7set8vSEuQEc7ktGNWmLNhuNS3ddf+mIe4Urhd5l3sIZ5KMSjS/vMC7MLg4LQ6UTSR54zbWbiE
X-Received: by 2002:ad4:5ec6:0:b0:56b:ed8f:5df with SMTP id jm6-20020ad45ec6000000b0056bed8f05dfmr47321121qvb.30.1677477114776;
        Sun, 26 Feb 2023 21:51:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677477114; cv=none;
        d=google.com; s=arc-20160816;
        b=tM4A3NkDDy8xKFB8rhVoO/ZLm0uko7FwpgPrQv9IeSOEFYN3Nl3V1nYfiKjMPvE1lP
         gdTUZeONGjn9R74pmY19Y19JLKeTRMtEOgF/E6O5zeajM9unp1Q8DJlyilgZ5hKKphh2
         /IxXeB2jbr36u/1KGgQOEpTQLcWB6qy55yg/fMyFPgaJyEUmeRH57wW/nKU8kT+LHtLt
         2HYcCPeXHIrnIupGIb7j2JWGhpwoThho8FzaZh0sqf5NgbJVyNhHhCqnwBOW3k6DskXB
         6hkWRz6WpmvV1ITKtIzwQujbtmr2eAUn+l+KHSGI2VUFB5fpUSi66ykr7MLUIhk5ly5N
         v+Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aemW4nd0+d8gVoUBFCo/IxkPgvf30U3J+wX8+SNzXzA=;
        b=qmzTwMO0ggVsrAAfGZoDAY7ldSSUVB+qQhnKbAph8gbUJs2xaHGM/CyIqI6sLSrlGC
         xUkBrA4xN0j74ptfvlnytVyRat7bN395AOcI1ggWiSoNUhRzX0Ul6h+O1OJSPoPfDYzq
         HwGj7TEqHe0i1Hw+cJCQ3fmR+zePUeOlcIwpCCERrNYH4SQ/f9fnBDYcH8DQB3VJ4HI6
         5xDwhQYsgyqek89rhbpE5j8FZjcf0YGajxuELpw5VPEu39r7f4u00vPyUdEEbTYLDall
         SWXAQIPNL/VjQOfAKpjQL2mhGAVSPSvHTWQAWHA3wpgYN3fJF7XUsal7SzegakgNGc/A
         bwlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iBfkiXi9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18-20020a0c8f12000000b0056e98779ab7si5477638qvd.380.2023.02.26.21.51.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:51:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iBfkiXi9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWNA-0003p4-Dq; Mon, 27 Feb 2023 00:48:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMl-0001RV-Iv
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:48:03 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMi-000720-Pk
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:48:02 -0500
Received: by mail-pl1-x635.google.com with SMTP id y11so1420273plg.1
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aemW4nd0+d8gVoUBFCo/IxkPgvf30U3J+wX8+SNzXzA=;
 b=iBfkiXi9n9FO6rW8nyiU/cnJ3NlJcIcX5lbzB80r7RrqIpju1OzyrtPo8VKxrql1jQ
 oZlmWp0Dd3+86Ox955A61cRxVzwnI7i63mGl1DsnV9cQPSIQxo5ovf8gCSnrfW47z5tv
 TFYvnTHLXq5N4+eNAlkMoDcGwvqKrrbFZOMzqlijrd5DO9bqaCDjlXsoPu369zZnhQ5A
 efnl4St1zLUI1ocUSvnuttfYinoG75Dx4Cjop0PSgfYNq+DuJTSKJ/m5nIZAbCx7xu01
 076xhof5QHOEAHog+L178BT/zqEoDxkXVFWzrugjxdL0WXW3bfKFxSwHzJJpra4opaqS
 4FGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aemW4nd0+d8gVoUBFCo/IxkPgvf30U3J+wX8+SNzXzA=;
 b=3HPxZqKB53G0jNN+rTGCWrYYobfJJSjzJTOzX6rWLVrTXwpa258ZeEYVpfjtfeqhtW
 3m1nxr6Vm90397uD7TLur2iiWtAQstyaL6of7QmPQaPVxJvST4w5hGJt+6uIVCN3cjA+
 NuAxGzBgPunXdfJTyRISAtp3iDK+OLcTUTpNa37yle7GWKh+f5GbGKTlV5BGO6RIsphD
 uOIA8kLoT8y3gF6ELHu5Mlx7iQX6E39tabWTUHNVHhk23rs2Wy2uoSd+pyuISpym96nY
 ndM9q0t/OYIHjfK6Foy+U5/mWgo5P5M98gicN9a7EHTW5QCXmnLkKZhcg8boFLUn4nZt
 GwxQ==
X-Gm-Message-State: AO0yUKV65oU9+6l2G+5jXHX9wLuXXj6dKmcA6MSUe50xBJl2kyoaM54w
 rotbb9LFCRI6q2tKS5tkIwi5qQ==
X-Received: by 2002:a17:902:9a46:b0:19c:eaf0:985e with SMTP id
 x6-20020a1709029a4600b0019ceaf0985emr6134654plv.62.1677476879769; 
 Sun, 26 Feb 2023 21:47:59 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:47:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 51/70] target/s390x: Avoid tcg_const_i64
Date: Sun, 26 Feb 2023 19:42:14 -1000
Message-Id: <20230227054233.390271-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
X-TUID: YH5vK3RuZSbK

All uses are strictly read-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 7969051ce9..32d61fc40d 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -4857,13 +4857,13 @@ static DisasJumpType op_xi(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_zero(DisasContext *s, DisasOps *o)
 {
-    o->out = tcg_const_i64(0);
+    o->out = tcg_constant_i64(0);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_zero2(DisasContext *s, DisasOps *o)
 {
-    o->out = tcg_const_i64(0);
+    o->out = tcg_constant_i64(0);
     o->out2 = o->out;
     return DISAS_NEXT;
 }
@@ -5762,7 +5762,7 @@ static void in2_sh(DisasContext *s, DisasOps *o)
     int d2 = get_field(s, d2);
 
     if (b2 == 0) {
-        o->in2 = tcg_const_i64(d2 & 0x3f);
+        o->in2 = tcg_constant_i64(d2 & 0x3f);
     } else {
         o->in2 = get_address(s, 0, b2, d2);
         tcg_gen_andi_i64(o->in2, o->in2, 0x3f);
@@ -5868,46 +5868,46 @@ static void in2_mri2_64(DisasContext *s, DisasOps *o)
 
 static void in2_i2(DisasContext *s, DisasOps *o)
 {
-    o->in2 = tcg_const_i64(get_field(s, i2));
+    o->in2 = tcg_constant_i64(get_field(s, i2));
 }
 #define SPEC_in2_i2 0
 
 static void in2_i2_8u(DisasContext *s, DisasOps *o)
 {
-    o->in2 = tcg_const_i64((uint8_t)get_field(s, i2));
+    o->in2 = tcg_constant_i64((uint8_t)get_field(s, i2));
 }
 #define SPEC_in2_i2_8u 0
 
 static void in2_i2_16u(DisasContext *s, DisasOps *o)
 {
-    o->in2 = tcg_const_i64((uint16_t)get_field(s, i2));
+    o->in2 = tcg_constant_i64((uint16_t)get_field(s, i2));
 }
 #define SPEC_in2_i2_16u 0
 
 static void in2_i2_32u(DisasContext *s, DisasOps *o)
 {
-    o->in2 = tcg_const_i64((uint32_t)get_field(s, i2));
+    o->in2 = tcg_constant_i64((uint32_t)get_field(s, i2));
 }
 #define SPEC_in2_i2_32u 0
 
 static void in2_i2_16u_shl(DisasContext *s, DisasOps *o)
 {
     uint64_t i2 = (uint16_t)get_field(s, i2);
-    o->in2 = tcg_const_i64(i2 << s->insn->data);
+    o->in2 = tcg_constant_i64(i2 << s->insn->data);
 }
 #define SPEC_in2_i2_16u_shl 0
 
 static void in2_i2_32u_shl(DisasContext *s, DisasOps *o)
 {
     uint64_t i2 = (uint32_t)get_field(s, i2);
-    o->in2 = tcg_const_i64(i2 << s->insn->data);
+    o->in2 = tcg_constant_i64(i2 << s->insn->data);
 }
 #define SPEC_in2_i2_32u_shl 0
 
 #ifndef CONFIG_USER_ONLY
 static void in2_insn(DisasContext *s, DisasOps *o)
 {
-    o->in2 = tcg_const_i64(s->fields.raw_insn);
+    o->in2 = tcg_constant_i64(s->fields.raw_insn);
 }
 #define SPEC_in2_insn 0
 #endif
-- 
2.34.1

