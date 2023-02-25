Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2639254ejc;
        Sat, 25 Feb 2023 01:23:31 -0800 (PST)
X-Google-Smtp-Source: AK7set+9ChgDkQKXP4Z24U3CwB+QGJXSS5ark+0ZhnWPerk2TqfyI5pCEzFX9yKBnEc8epUBrtns
X-Received: by 2002:ac8:5f4d:0:b0:3bf:c431:ea6e with SMTP id y13-20020ac85f4d000000b003bfc431ea6emr4208647qta.3.1677317011447;
        Sat, 25 Feb 2023 01:23:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677317011; cv=none;
        d=google.com; s=arc-20160816;
        b=zsVMwQMrQ5VUP5A4NQxWsYd9O7pl1ewV3bUao2LK2752f2QkQbR2esQUCjrkLfufSg
         UI6XnoMZLC6zfekCjFBJJsUaCH+D99uF7cQRp6v8CsYJXz3ZBLXnUE/7qG6yY7w0mn5Q
         7YmAhS4Bumkunjh8oIMvA0alis+73j63fceIhd3pyDFRpytqVPgcFaQVOWR9MT2Bd5M0
         thjGy9UBInF8PqdCgVc1yu4dbJ8TtczB8Wmpgbd/CaG1HjJ6sNLT//dBuZAkq8jAbuJy
         lnJuEYPpfLloEPFqDSdy+tjJkYOAbTTASD8OcLkmCFRMFlMSh7QYxaGV09oHZ1UqPWxa
         cLYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ynjwWGgj/GWnEPQQaPLH0AnCGUIHagoL6cGCq3NhAGI=;
        b=xeSDHLWdwALIRoAAalsoL9XTli/dYAavCzWgeJFS/HeZ+UvliPjES0aHcclhOtFP8O
         wdn31z++PzdcpFCdRCQHsfhHDugxq2XVfECql2Zc1l4raLNBsIncDRJMzDDMb7Jjmoo+
         vHS/qhVrwKW/nZ4U+nf+DBnnSYVHZfULh373kl/REualjEy0yjZBk8n8LDeFH764T3Iu
         lFDBcyAii0pSsIj99NiwbywF4811Ay0SGRty2jTub7Ntvo+9TsE1ctNdwOFfwoQXrJTJ
         deqygDSQmaQ2DYGxjWGLtZM4535SX0+VfFdrFvMStUPdPo+Th8SYVmhnG5LpvXrfk+G5
         vr3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KrDXayeb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2-20020a05620a288200b0073baae1b370si1344150qkp.579.2023.02.25.01.23.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:23:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KrDXayeb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVqjz-0000kZ-6u; Sat, 25 Feb 2023 04:21:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjU-0006zz-Vt
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:20:45 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjQ-0003Yb-Rk
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:20:44 -0500
Received: by mail-pg1-x536.google.com with SMTP id y19so927729pgk.5
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 01:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ynjwWGgj/GWnEPQQaPLH0AnCGUIHagoL6cGCq3NhAGI=;
 b=KrDXayeb9vas0zc5uqAJyddUpBGhrFYNxF5dprxpTAOZaJ4Vm7hvlIoqESaneeEFq7
 sD9k+zvhj2Ls4vrqCKYimKAdCC4QI2YNljYZ4z+ye1dRaSE9ayMXIk9Ll2DQzPVY/rDU
 AcNiUpzAA+9cV3ffVrTxh9eyaTBewNYz7CF2w1OlY686lFaeKqnq0GXLU3rucQTuKepJ
 lS+pMZTWbcjcfrwXKr7Lpsp1tzb7xfYK8fcWru8YkX0KPhYTvQ23cMmQ01k9MbzBpCa7
 711equ4A1C5mr6t7zI6JY6CwFGXyyxduFREpsYAr1mASqE2ZJjGRu68z/B2z80uC8iND
 7rTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ynjwWGgj/GWnEPQQaPLH0AnCGUIHagoL6cGCq3NhAGI=;
 b=AaUzExQ/6TzelxRQCuFe7t5SbgUYy3ppbczqFC28Sk6vh8qiL0OV3chik5lXFkukMT
 fVRSeTq89NB6N0m+POFBqzON/G6ISNe+Y2YPRPdp4fuecDaJvwTxwESO/2uylx0xC8eA
 4LqqRx9K8lw51nKUfFumgK2DgnlcB2S6ZvmoUva9pmATFZrTJfuGeLHodq8xHYw2Q4k1
 Kt3tti8osCKJNWrO++UFgGkKS7RN9mK377mMHC2UKj7b/CBKT2KeFokiXPaQlO5tx6sW
 UEejlev5blVhIT0j2SUMYTA7LeN2n6LbtRpy3K0P11LMdYvmn1Pu4BAbaUcDP+NCKtjU
 P74g==
X-Gm-Message-State: AO0yUKV2fRYykSJ4uVTVSL7ZdvK4U0ThjUTZ3B8r7jaztS2ggVZ8ymxp
 9Y4JDO9+ZEWV65u3I0eV2FLDhQ==
X-Received: by 2002:a62:6454:0:b0:5a9:c2b0:428f with SMTP id
 y81-20020a626454000000b005a9c2b0428fmr17724854pfb.31.1677316837811; 
 Sat, 25 Feb 2023 01:20:37 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:20:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 71/76] target/sparc: Drop reset_sar_tracker
Date: Fri, 24 Feb 2023 23:14:22 -1000
Message-Id: <20230225091427.1817156-72-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
X-TUID: KIk4fT68AA87

Translators are no longer required to free tcg temporaries.
Remove sar_m32_allocated, as sar_m32 non-null is equivalent.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 4af0650deb..910350dec6 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -57,7 +57,6 @@ struct DisasContext {
 
     bool sar_5bit;
     bool sar_m32_5bit;
-    bool sar_m32_allocated;
     TCGv_i32 sar_m32;
 
     unsigned window;
@@ -284,14 +283,7 @@ static void init_sar_tracker(DisasContext *dc)
 {
     dc->sar_5bit = false;
     dc->sar_m32_5bit = false;
-    dc->sar_m32_allocated = false;
-}
-
-static void reset_sar_tracker(DisasContext *dc)
-{
-    if (dc->sar_m32_allocated) {
-        tcg_temp_free(dc->sar_m32);
-    }
+    dc->sar_m32 = NULL;
 }
 
 static void gen_right_shift_sar(DisasContext *dc, TCGv_i32 sa)
@@ -306,9 +298,8 @@ static void gen_right_shift_sar(DisasContext *dc, TCGv_i32 sa)
 
 static void gen_left_shift_sar(DisasContext *dc, TCGv_i32 sa)
 {
-    if (!dc->sar_m32_allocated) {
+    if (!dc->sar_m32) {
         dc->sar_m32 = tcg_temp_new_i32();
-        dc->sar_m32_allocated = true;
     }
     tcg_gen_andi_i32(dc->sar_m32, sa, 0x1f);
     tcg_gen_sub_i32(cpu_SR[SAR], tcg_constant_i32(32), dc->sar_m32);
@@ -1247,7 +1238,6 @@ static void xtensa_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    reset_sar_tracker(dc);
     if (dc->icount) {
         tcg_temp_free(dc->next_icount);
     }
-- 
2.34.1

