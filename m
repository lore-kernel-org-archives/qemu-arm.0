Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1877442ejb;
        Mon, 7 Aug 2023 20:14:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuKx3LDOPrnqIJ0uclzNUyRUu/iHbvaf2ogXIKvKWer0FVMm4egq9xJeyH4ZgCBqbEjXIO
X-Received: by 2002:a05:620a:4456:b0:76c:e661:448d with SMTP id w22-20020a05620a445600b0076ce661448dmr15992240qkp.48.1691464465483;
        Mon, 07 Aug 2023 20:14:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691464465; cv=none;
        d=google.com; s=arc-20160816;
        b=DqsYOYpnLqN39gLRjLhsoljye3KZdxafFoia9ZMEEn8XBfA+dNqaEdVsrxNXWzNdob
         qcQzFw4PBcbLK4ednKGKxHHkOKiTd/VsfXQ/n/x82pPMfk6ghwEMtuRiARm2osJPm/hj
         g2eedILZQv1OKTZdcBxN4xaYctYrmpeGoy+Cmh0Pyp/mSIN5hUNXkGIp6HTyhYunUL3x
         7ZvFKtVxSFdV62KdAVrZWQ8I549LWN7cTQhX0L8f4o26GlMjw6mrCjw+daqq7okIDiW8
         Q0I+gbwhV8kDcvVaLP1mLYA80nsUMg6e1F5WrEhord4FkCQtz3V1+n621gpLebBvX9Vf
         ZOXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iebNd9NWSI/oGO+XQT1osPqubnSl7SPT7dJSjDKV1XY=;
        fh=hqs26moy805PsHbwd88lUczy2QdlfF59ojSMxj/DeWg=;
        b=N4Qfmo2EH+tQw8eqj5X5W36/83AzhkxiN0GtbV+i97+aQoSEfBpJSoGBa9KuBWlegv
         4KVTm9dQieMWvFmTagV2M2RekksN1nic3Q1yqiiAnOsIaz9bJ0qLXB16FhMBqrxwsNhZ
         EM+iBz03jeg0OO/r03D98zwUal8SIZQ+VCqBmPBIeLyfruDtXrxuVFwNf2/XNsd/xGOm
         Q4N/58xheVd3h6K8+CvjbTw4jwo3t1/Po3hqSMHidEIl03jQmuu4IJrM42ybynAUGsQY
         tFk6ro3aqv6dSup9HaarlJyyxDQqIwlqv1KqrN3jEzpbqDUncVYSgod69oGkf8bFC/Ll
         0Exw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZqW6SJLS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl4-20020a05620a1a8400b00767ee543571si5730056qkb.403.2023.08.07.20.14.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 20:14:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZqW6SJLS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qTD8h-0000rN-8L; Mon, 07 Aug 2023 23:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8e-0000Vj-J4
 for qemu-devel@nongnu.org; Mon, 07 Aug 2023 23:12:04 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8U-0000Cq-Bz
 for qemu-devel@nongnu.org; Mon, 07 Aug 2023 23:12:04 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6bc9de53ee2so4123176a34.2
 for <qemu-devel@nongnu.org>; Mon, 07 Aug 2023 20:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464313; x=1692069113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iebNd9NWSI/oGO+XQT1osPqubnSl7SPT7dJSjDKV1XY=;
 b=ZqW6SJLSkEAdiBvFrFcmzlg3z96e/GXhcNjv3WMtLnnw1cq3OPiNfEHVhoFzmhISYI
 iPXNcdi/ODyQ+OaetfQ+4xVrf0n9eymAlZ5bhojEEwLTyABkkIgQ7dFwQVZIgx1nZOTF
 H9LUC8uLnw3D1gTP9TN4EUw++ramt+EVyNVbkE9bVJLOm9hbUsWxEhipcrgMlZM7DpaN
 PNvNfvr/idVJFKq650FCR6gsTYtBG1XpRrBFE4OKHkWyuchjYVBn2Oli62jrNyt7hNoN
 oBHBCuvOSTb4AO1PI1iVlOE9Jh0t3r02KkLT9O1+758LIHQwy1kgNmGYkSNVTRlET5p9
 OP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464313; x=1692069113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iebNd9NWSI/oGO+XQT1osPqubnSl7SPT7dJSjDKV1XY=;
 b=MPlVpz6vpMmt678ZXtnJJvzDZeIe+H8bQxDksKCpdoyIuZzC5gTLI2O93kE7rHxeL5
 lILYRTFmeHVE1C/aaopFnHBGUjqm8s3o17jLj58b1Umw2QD+vMz0M2KJz+EJ6uqNmEb0
 P+L0lKZnK/i+7ObzAuJ/BKykoZfKtTAvBf9W+3AWfnzaFDHUEtavnjsOUsfjB91uGGDR
 uGALcsgAhx/NngU7FkoTpfNW0ule3qvKJUcCmid/dNfb90yuEplxNjuwC4oXFmUppCiv
 jM2zIqOitOxeY4FhB4pSl281QSEfG4MP/6TjM/3ffvaxLMY0dL4uBiE6T3sWJ0nSDC5w
 RRDQ==
X-Gm-Message-State: AOJu0Yx+znWtQVMhpN3fseV5GcQGE2E30zin0FdvjPtpFz8sEdNz7mKM
 nUeJXNqAXXBZbMpMgric3M5lRnjgx1DfudXJZC0=
X-Received: by 2002:a05:6358:9322:b0:12f:22c1:66aa with SMTP id
 x34-20020a056358932200b0012f22c166aamr8858591rwa.3.1691464312730; 
 Mon, 07 Aug 2023 20:11:52 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:11:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 09/24] target/tricore: Replace gen_cond_w with
 tcg_gen_negsetcond_tl
Date: Mon,  7 Aug 2023 20:11:28 -0700
Message-Id: <20230808031143.50925-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: J4i2sHsg498T

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/translate.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 1947733870..6ae5ccbf72 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -2680,13 +2680,6 @@ gen_accumulating_condi(int cond, TCGv ret, TCGv r1, int32_t con,
     gen_accumulating_cond(cond, ret, r1, temp, op);
 }
 
-/* ret = (r1 cond r2) ? 0xFFFFFFFF ? 0x00000000;*/
-static inline void gen_cond_w(TCGCond cond, TCGv ret, TCGv r1, TCGv r2)
-{
-    tcg_gen_setcond_tl(cond, ret, r1, r2);
-    tcg_gen_neg_tl(ret, ret);
-}
-
 static inline void gen_eqany_bi(TCGv ret, TCGv r1, int32_t con)
 {
     TCGv b0 = tcg_temp_new();
@@ -5692,7 +5685,8 @@ static void decode_rr_accumulator(DisasContext *ctx)
         gen_helper_eq_h(cpu_gpr_d[r3], cpu_gpr_d[r1], cpu_gpr_d[r2]);
         break;
     case OPC2_32_RR_EQ_W:
-        gen_cond_w(TCG_COND_EQ, cpu_gpr_d[r3], cpu_gpr_d[r1], cpu_gpr_d[r2]);
+        tcg_gen_negsetcond_tl(TCG_COND_EQ, cpu_gpr_d[r3],
+                              cpu_gpr_d[r1], cpu_gpr_d[r2]);
         break;
     case OPC2_32_RR_EQANY_B:
         gen_helper_eqany_b(cpu_gpr_d[r3], cpu_gpr_d[r1], cpu_gpr_d[r2]);
@@ -5729,10 +5723,12 @@ static void decode_rr_accumulator(DisasContext *ctx)
         gen_helper_lt_hu(cpu_gpr_d[r3], cpu_gpr_d[r1], cpu_gpr_d[r2]);
         break;
     case OPC2_32_RR_LT_W:
-        gen_cond_w(TCG_COND_LT, cpu_gpr_d[r3], cpu_gpr_d[r1], cpu_gpr_d[r2]);
+        tcg_gen_negsetcond_tl(TCG_COND_LT, cpu_gpr_d[r3],
+                              cpu_gpr_d[r1], cpu_gpr_d[r2]);
         break;
     case OPC2_32_RR_LT_WU:
-        gen_cond_w(TCG_COND_LTU, cpu_gpr_d[r3], cpu_gpr_d[r1], cpu_gpr_d[r2]);
+        tcg_gen_negsetcond_tl(TCG_COND_LTU, cpu_gpr_d[r3],
+                              cpu_gpr_d[r1], cpu_gpr_d[r2]);
         break;
     case OPC2_32_RR_MAX:
         tcg_gen_movcond_tl(TCG_COND_GT, cpu_gpr_d[r3], cpu_gpr_d[r1],
-- 
2.34.1

