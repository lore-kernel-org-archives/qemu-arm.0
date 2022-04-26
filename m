Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp356748lfu;
        Tue, 26 Apr 2022 09:32:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZAegbqaALvWJkpCuSsflyEJPUJFLGJwTS5k3NBbLwzhD3IWHWbVGzShxCjewjd4Fm2C4X
X-Received: by 2002:a25:42cd:0:b0:645:d805:4fcb with SMTP id p196-20020a2542cd000000b00645d8054fcbmr18336110yba.182.1650990752888;
        Tue, 26 Apr 2022 09:32:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650990752; cv=none;
        d=google.com; s=arc-20160816;
        b=eS9hyH5De04D/vcIY6Svb1WioI0pN1l8cRvDEaUxDvkRwey3KcGV2qfMQCw7Ag8icf
         EcS2Ls6hSVlspzN2e+y6HsYDeH1whoMwxasiJOzkQI3l5mnWOA43z3CEgTJ3o8snB5J6
         I8locdk5ZaVbCJuxp4bM4bYO8ma0IbS8cVdPdMp5E4zaE0ijthMNIhBUHlg96wgj23nn
         VVMOh/lo9DdRegu+ibL5Ze5pyCCdYCkdg6ej6XsNaNyzhpNnodsexDuIdan27MjNxZTJ
         zONtr1IWtC7S2KsmEmUjnn1hHqDzAms4kVPDpm3z19oc9aDS3aaOFmpBS6jQj1CmrXHu
         ECKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2HNcB10e1b3D3OclvFOXZv0dsDEHKDzY1ubkZqlSbYM=;
        b=itgx+I2qYBHyzIKVOTG1/CPRHjc87d4mMxQHZUpJLxO4E8NOPBoNEi3cnmdfoirikN
         tKzIVRJE67XIh+J/xyixLNjC2dVjTvJScI0lEe/KffcFgLiQINyZDS0bRyc9H1e+ooKr
         kU+vv9dgE/TufxW5035lZsa1cKjx0pLfpZh+ZKPSclregTpb8HASeo/smX8cAQGqMl1n
         UBGaIOFHfeuVFrBOj7bXc/eR19Ns3xuAQhKf0Ws5k6RQl5e0SnDsVP0IASRwJom0BGE8
         fow6Cl51KDQgZZxkLLQ9RAdrMex790e94hPIQ1IZWuOcxth2EjTZRnAJgF/ZS5hz+Tud
         Y1Wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cDLCuArv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 204-20020a8108d5000000b002ed65e56f6dsi13465011ywi.139.2022.04.26.09.32.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 09:32:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cDLCuArv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njO76-0004F3-8H
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 12:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5Y-0002vl-Iu
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:30:56 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:51785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5T-0003lb-Fs
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:30:54 -0400
Received: by mail-pj1-x1036.google.com with SMTP id p6so3565741pjm.1
 for <qemu-arm@nongnu.org>; Tue, 26 Apr 2022 09:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2HNcB10e1b3D3OclvFOXZv0dsDEHKDzY1ubkZqlSbYM=;
 b=cDLCuArvWStZ5rJPsSbYWHgXpybzZhqssif+aHapW56kBUGCAod6X2ysC3MwmXg4lr
 z+2NjB2WbbMgwI5A4Vxyfnh+1OrwtWApyuIWE5UqzWKueMLKrsLdSCr5nJB+Ks8kNPlZ
 xUhdcUhfE8ptf475fMAr04EKEV9rIC1AhSG5E3wkN/NuiMiEJelerE686lhTetuiOAqy
 4OL6guy4zl7bqtuzzMCv7GbfYkL0YwlSi2ALlWLQ81+Tefq5xcId0fW35GxQXxY1rAUg
 WgVlBJ3EJs2C3vsgJq2u2HKylJzWk+zv0FAIocuUto1X+7LqkvrNtOor3kpcK1MCT92H
 DZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2HNcB10e1b3D3OclvFOXZv0dsDEHKDzY1ubkZqlSbYM=;
 b=mlnc0ejMw6E6RnwL/KDXv2hUpZwBWZqRWAo8A95j1f2CAm/ukx5SZlPOJ6YjMVS+zf
 KX/EDzq+gx5hBDjBebprX9ggp404qBaaI8JKBYPpOrs71BZANX23Bl9tRMrVTOJZEQgH
 tZBqT9vP/xDze78Xab6lMM3aoiii0HpxkyREK3RFg7+4McMsAuBmXGT2/3jDT4x+LFs9
 dHpy8ziy3RAemsYDQVDMR3tcEBPEmZZh8N77z1XsQstVSXKlO+Pji4DvJjc2Ex9TpaID
 rEsDeIjzu/rhHAuPyXn5Tq/4w+BAfXFuc0wmdWKOkANsl4pi2yTJpcqCmZRMpvyTt0Kg
 09ig==
X-Gm-Message-State: AOAM5307IRZkGaeezlhb9MVTiKLnKwD6M9Zl0q1u1EKkCVgMob9DVUTB
 7976ltZYd8wtlEAHQMlOnLbfKQ==
X-Received: by 2002:a17:902:8644:b0:153:9f01:2090 with SMTP id
 y4-20020a170902864400b001539f012090mr23561369plt.101.1650990647987; 
 Tue, 26 Apr 2022 09:30:47 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:30:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/47] target/arm: Use tcg_constant in gen_exception*
Date: Tue, 26 Apr 2022 09:29:59 -0700
Message-Id: <20220426163043.100432-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x9SX0YjSuBA+

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 7b5bfb0889..b0b5e8b26d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -338,11 +338,8 @@ static void gen_rebuild_hflags(DisasContext *s)
 
 static void gen_exception_internal(int excp)
 {
-    TCGv_i32 tcg_excp = tcg_const_i32(excp);
-
     assert(excp_is_internal(excp));
-    gen_helper_exception_internal(cpu_env, tcg_excp);
-    tcg_temp_free_i32(tcg_excp);
+    gen_helper_exception_internal(cpu_env, tcg_constant_i32(excp));
 }
 
 static void gen_exception_internal_insn(DisasContext *s, uint64_t pc, int excp)
@@ -354,12 +351,8 @@ static void gen_exception_internal_insn(DisasContext *s, uint64_t pc, int excp)
 
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syndrome)
 {
-    TCGv_i32 tcg_syn;
-
     gen_a64_set_pc_im(s->pc_curr);
-    tcg_syn = tcg_const_i32(syndrome);
-    gen_helper_exception_bkpt_insn(cpu_env, tcg_syn);
-    tcg_temp_free_i32(tcg_syn);
+    gen_helper_exception_bkpt_insn(cpu_env, tcg_constant_i32(syndrome));
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-- 
2.34.1

