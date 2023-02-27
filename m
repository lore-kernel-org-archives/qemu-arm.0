Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4290364ejc;
        Sun, 26 Feb 2023 21:31:06 -0800 (PST)
X-Google-Smtp-Source: AK7set/zVZx8QxvYYUEru4XuHGssczNVlHYnIs71QvitauImSiAIKCFMOhwJDo8CSZ27P4I0WJJI
X-Received: by 2002:a05:6214:c69:b0:56e:c04e:c486 with SMTP id t9-20020a0562140c6900b0056ec04ec486mr45515270qvj.37.1677475866168;
        Sun, 26 Feb 2023 21:31:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677475866; cv=none;
        d=google.com; s=arc-20160816;
        b=m09F0/k8XVbw9IWgQQqWtXN3OjaTS/fe4xRrmb/f5M7ZIX/GMyWnc2LFR6uY1nK6Gu
         Pn9ytUc+DIwF0Q62gF7amXqLqPLdCXz3rf7WwJrs9j/TtitOqc68BGQIy6u/3ckTwweb
         1rQQT2e6O8GtvkMBpnua3DiEMaBuQBM2bSLiVmpgT1jla9IUxBJiN+/xDxPO5nHBfNlx
         TKcaya55eiX24kPoGghIoTMKthtFiwqTqn0uFTHyTyHKdLhyGVdGvoR+ysSBMy3hzBZO
         126YN/hjSvafxQTXkDDt/3DNnSI5oMizV6soZCcqrNkWVmCSs0SiYA0iNhs188Euvddt
         CuOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TToqxygHAy4B0miglawoSDtyexliIjv3wj5R/FRq4Q4=;
        b=ecKh99QCqyi6XDGUhXLKZIvAGZaRZBLVfF7/GVthXqWcd0vi2uGihwI1f4tVFeFBwy
         BeukeMYBPmuWBbvlFxIRS5GF9RueLmHk0xDklx47rKhnW2tcI9ftiL5j1ROd+vk61sH/
         Y+BgUhk65hb7bTHatvGHtXqe44cyjGPArjb3WmbOEVLmiscc2cY8Np8SquZeiuDaQie8
         lN19kIKKdEZEliow6K0estsj7q6begCpOWf9jz8QzIyKKYZY6fb99/fkhY/4u0wZZs3q
         7Gp9LP6/eA35MP+Y5ap8JvExaUWJvHGMBkzH7qhlhLe0kf6cCFnd7mk1O8a27b5Huw+Q
         T0eQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vLpTW+Z3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j10-20020a0c9cca000000b0056f079ac110si5597934qvf.124.2023.02.26.21.31.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:31:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vLpTW+Z3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWW1r-00086n-5V; Mon, 27 Feb 2023 00:26:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1b-0007RI-W4
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:26:13 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1Z-00079Z-34
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:26:10 -0500
Received: by mail-pl1-x62f.google.com with SMTP id i5so3837618pla.2
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TToqxygHAy4B0miglawoSDtyexliIjv3wj5R/FRq4Q4=;
 b=vLpTW+Z3xIg9Y8wuea4FJMzYg3oHr8RhFVobl3FUCuao6MdWt9CvXZL35xGbZXfRtG
 XyCRu2XoDYHp6rJveu9zlvRMfRwwZrBGOa6wLHChUDwgAxbsQTBN8nK1yKNnZDU/EUWS
 uYl6k3B62XQHYc5S/UHiAyc2cvKmOX9R+q6TI1EZmPcrMnE0oRY80QoYGvmSJa/dE7EG
 U7HaNBblbcPEBK1OxW/Toseu7IKQv7lMFAvbmj4QbxFOVzrMnz2rC3+cOCGL7eJOhHri
 9IYRLWibibBZ92i1HOG1fPb6TwL03kjSi+HqLEtlypFBSf+j31PEjHJZ067zYmYPke8k
 O7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TToqxygHAy4B0miglawoSDtyexliIjv3wj5R/FRq4Q4=;
 b=WZJH+JGU5Tu+JFxtS6wYICc7Ia9rutRLHtVUGbv4xUzCTv7Ta0FBpSUIPWC8nt/QiN
 4lDOmMyHMc+pZBwFs+WYZns65pjK5/fPZ4d6yHiVKvgXUZtr4KIlfoAnM9P2afdUmYEg
 UBjmW1XAAMMFmYcXAKCf0NDn0mp790SV8ZBNmZ8aM0fPXVYs9mGOSt9QEnQJ2DtHoDGk
 jk49VnNMb8L2MUXoQX982tl311qusBKDHsbOafsILMV34V8Z8a++2T907GmIo7s3bMU6
 +ueYO78YHaXVgxEP+kx+i+d/YffKy1IQRSU8kZdxP6UBY4eYTEiNULH64pCGVCzgyK5U
 fr2w==
X-Gm-Message-State: AO0yUKU1Ay+sgbb7KBut1bkFyobXks2xaiavrbbLxgPL0Pvg18YCXHnH
 2pB77/MRYMwiTtnriWUJybYa/Q==
X-Received: by 2002:a17:902:ec8f:b0:19c:171a:d346 with SMTP id
 x15-20020a170902ec8f00b0019c171ad346mr27849452plg.44.1677475568208; 
 Sun, 26 Feb 2023 21:26:08 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:26:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 21/76] target/cris: Drop cris_alu_free_temps
Date: Sun, 26 Feb 2023 19:24:10 -1000
Message-Id: <20230227052505.352889-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
X-TUID: 0bjbIo+yAFj/

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index a959b27373..76db745fe2 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -1467,14 +1467,6 @@ static inline void cris_alu_alloc_temps(DisasContext *dc, int size, TCGv *t)
     }
 }
 
-static inline void cris_alu_free_temps(DisasContext *dc, int size, TCGv *t)
-{
-    if (size != 4) {
-        tcg_temp_free(t[0]);
-        tcg_temp_free(t[1]);
-    }
-}
-
 static int dec_and_r(CPUCRISState *env, DisasContext *dc)
 {
     TCGv t[2];
@@ -1488,7 +1480,6 @@ static int dec_and_r(CPUCRISState *env, DisasContext *dc)
     cris_alu_alloc_temps(dc, size, t);
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
     cris_alu(dc, CC_OP_AND, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1518,7 +1509,6 @@ static int dec_lsl_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
     tcg_gen_andi_tl(t[1], t[1], 63);
     cris_alu(dc, CC_OP_LSL, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1535,7 +1525,6 @@ static int dec_lsr_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
     tcg_gen_andi_tl(t[1], t[1], 63);
     cris_alu(dc, CC_OP_LSR, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1552,7 +1541,6 @@ static int dec_asr_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 1, t[0], t[1]);
     tcg_gen_andi_tl(t[1], t[1], 63);
     cris_alu(dc, CC_OP_ASR, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1568,7 +1556,6 @@ static int dec_muls_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 1, t[0], t[1]);
 
     cris_alu(dc, CC_OP_MULS, cpu_R[dc->op2], t[0], t[1], 4);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1584,7 +1571,6 @@ static int dec_mulu_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
 
     cris_alu(dc, CC_OP_MULU, cpu_R[dc->op2], t[0], t[1], 4);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1610,7 +1596,6 @@ static int dec_xor_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
 
     cris_alu(dc, CC_OP_XOR, cpu_R[dc->op2], t[0], t[1], 4);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1639,7 +1624,6 @@ static int dec_cmp_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
 
     cris_alu(dc, CC_OP_CMP, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1666,7 +1650,6 @@ static int dec_add_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
 
     cris_alu(dc, CC_OP_ADD, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1755,7 +1738,6 @@ static int dec_or_r(CPUCRISState *env, DisasContext *dc)
     cris_alu_alloc_temps(dc, size, t);
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
     cris_alu(dc, CC_OP_OR, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1796,7 +1778,6 @@ static int dec_neg_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
 
     cris_alu(dc, CC_OP_NEG, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1825,7 +1806,6 @@ static int dec_sub_r(CPUCRISState *env, DisasContext *dc)
     cris_alu_alloc_temps(dc, size, t);
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
     cris_alu(dc, CC_OP_SUB, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
-- 
2.34.1

