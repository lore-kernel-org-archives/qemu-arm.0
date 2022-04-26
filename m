Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp372115lfu;
        Tue, 26 Apr 2022 09:57:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzLCRz188SA4A2B7Zs3Rn+cXeSV64Okq/16sv/iWxrK+v9MTwnogZWQvwqt0UYZqCG5uzj
X-Received: by 2002:a0d:d953:0:b0:2f7:d5ce:f204 with SMTP id b80-20020a0dd953000000b002f7d5cef204mr13354051ywe.502.1650992233782;
        Tue, 26 Apr 2022 09:57:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650992233; cv=none;
        d=google.com; s=arc-20160816;
        b=wGuHBDN9AXxKUXKEebFh16vcldOHoH8GkzSB+YZaVEkCtxP5chOEb5wQCDR2ez1Pbf
         QudsmGwOqEwhvPxrzLEqgj+GVLd5KZRKiaDIbRhhqvYwlq31Aw/ujzN87jiymOluvHIn
         UVnTmfNYyH5l17mgLEhYFlluJ4ZXtMFCn5mOBgjMwx6SDAqi0isdOrado0QD0LyxzK1A
         RWyj3sE+m6tFRwU0p38pLb5Sw2L+2J24jIc7TREBlJ4+VN/x+BqEo/xE50kYTjEP2XJp
         iLZc4RTan7sZsxAwX5CxAQpaYApX7uQWBvU40Z+2JoKDcLtSCK+A/cQWxiPENw252nWF
         bURw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YT4PcROW/lGugJoLo5kIvKRZrra7WUrqQMozbJdZCxo=;
        b=vlSyJZAWM9/F+g5obMNHA1csIwDo/MQXLltJsXrbQZdNQXTWtPoethPjRD6XLqwZD1
         cdlCq8ie6LGjjZ4RBfloAKgykfSoP7KpVrQL1WhRUHkSISGKMi/hPyV5+ldJcew+TBud
         h2e428p+ozgAXNENmpJzztKbIH784mlnIZaBDnidsvenSyYNHLEvA3NWDy5PyE9svAO/
         1NM92gYCJA0YoJxzF0hagN/1JtWrcOIa/7TB718htMhhJds+eY0Ue9B7Pzdfdf9eHS5y
         tDY65af2qfNENJoZdkzro6uVXzjI7gSiXwGAE7KCehEZeTseNhv8kYe5fOnznwyV9db6
         9r6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="uN9S/zIF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m11-20020a81260b000000b002e5e189383esi14836828ywm.27.2022.04.26.09.57.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 09:57:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="uN9S/zIF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njOUz-0003bX-5c
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 12:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5t-00035d-7C
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:21 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:35803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5m-0003sr-RL
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:13 -0400
Received: by mail-pl1-x62e.google.com with SMTP id d15so16283899plh.2
 for <qemu-arm@nongnu.org>; Tue, 26 Apr 2022 09:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YT4PcROW/lGugJoLo5kIvKRZrra7WUrqQMozbJdZCxo=;
 b=uN9S/zIFGy5h1M7JIkNZhkueY7ZTPJSEAkrzpqH4u5u1XSDoc1snhdOlp6IMURIoCb
 3htVey09e70WJ1h/0o25WY2es0EP2dQSjIVPvg5qWgtRSVbk3g/1SrNoDJvu+AiOnnk+
 8Y4IgfpTA2+zcPJT2jsq7yr0h3mDRHDLvsOeO29JH/9GU55Ou5M1kcn6pIWm4+yjMWFr
 L48f8kLz01QjXggBta7RsxUAtO83NAigJ4nfBenl2nMvdOTFDs3+zsx3O8+uRYqc2fct
 CoUqo43aI7vvaUeD704MGeR3jYWlVtvy+cXjaDoKnB45mCiceErOmh6H+suussVkl0CP
 4WhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YT4PcROW/lGugJoLo5kIvKRZrra7WUrqQMozbJdZCxo=;
 b=yxN3Ew1Mz8BSSLUWDhzD/PwYrZ/qTgSQA/GIdelT/qYb1UyqLwUSX3YNq73M/a/8QP
 a6zC4CQDnMnaZjKE8ULjGVyElG0PHZU3MsOhdiM86oKLAmnxLsDR09fLetpotmnGdUho
 NgBiAug3Ynw+43LP2Irjd5TM50YDVZpcep0xOOEekRmiizHDK7cwbnSMxK87HUq6qZc2
 GRiLrUc04HSEYUntWFjBbr6it1Z0n8TsXB0lf/BMOu6ELl+m5vmcH588BFpKHpVZ8E9H
 ZWHnZnaWl76pdmg1cpRQTyA8EXResO409X6e2XBbHUfiCQWsJR2FHjchcXZSkY54JpJq
 Z8LQ==
X-Gm-Message-State: AOAM533+Lt5Mv1fPgID6BHLPdHjWprNpl3qV5YVgwhBLFXijeCh1rnWP
 9I+OuP/b2Jtm5uniTExPvOvpBA==
X-Received: by 2002:a17:902:7613:b0:158:faeb:a48e with SMTP id
 k19-20020a170902761300b00158faeba48emr23705462pll.140.1650990667876; 
 Tue, 26 Apr 2022 09:31:07 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/47] target/arm: Use tcg_constant for gen_{msr,mrs}
Date: Tue, 26 Apr 2022 09:30:20 -0700
Message-Id: <20220426163043.100432-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: v6DiLFIZKBRx

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 501192ed55..2e4165be3d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2845,7 +2845,7 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
                 tcg_gen_sextract_i32(tcg_el, tcg_el, ctz32(SCR_EEL2), 1);
                 tcg_gen_addi_i32(tcg_el, tcg_el, 3);
             } else {
-                tcg_el = tcg_const_i32(3);
+                tcg_el = tcg_constant_i32(3);
             }
 
             gen_exception_el(s, EXCP_UDEF, syn_uncategorized(), tcg_el);
@@ -2880,7 +2880,7 @@ undef:
 
 static void gen_msr_banked(DisasContext *s, int r, int sysm, int rn)
 {
-    TCGv_i32 tcg_reg, tcg_tgtmode, tcg_regno;
+    TCGv_i32 tcg_reg;
     int tgtmode = 0, regno = 0;
 
     if (!msr_banked_access_decode(s, r, sysm, rn, &tgtmode, &regno)) {
@@ -2891,18 +2891,16 @@ static void gen_msr_banked(DisasContext *s, int r, int sysm, int rn)
     gen_set_condexec(s);
     gen_set_pc_im(s, s->pc_curr);
     tcg_reg = load_reg(s, rn);
-    tcg_tgtmode = tcg_const_i32(tgtmode);
-    tcg_regno = tcg_const_i32(regno);
-    gen_helper_msr_banked(cpu_env, tcg_reg, tcg_tgtmode, tcg_regno);
-    tcg_temp_free_i32(tcg_tgtmode);
-    tcg_temp_free_i32(tcg_regno);
+    gen_helper_msr_banked(cpu_env, tcg_reg,
+                          tcg_constant_i32(tgtmode),
+                          tcg_constant_i32(regno));
     tcg_temp_free_i32(tcg_reg);
     s->base.is_jmp = DISAS_UPDATE_EXIT;
 }
 
 static void gen_mrs_banked(DisasContext *s, int r, int sysm, int rn)
 {
-    TCGv_i32 tcg_reg, tcg_tgtmode, tcg_regno;
+    TCGv_i32 tcg_reg;
     int tgtmode = 0, regno = 0;
 
     if (!msr_banked_access_decode(s, r, sysm, rn, &tgtmode, &regno)) {
@@ -2913,11 +2911,9 @@ static void gen_mrs_banked(DisasContext *s, int r, int sysm, int rn)
     gen_set_condexec(s);
     gen_set_pc_im(s, s->pc_curr);
     tcg_reg = tcg_temp_new_i32();
-    tcg_tgtmode = tcg_const_i32(tgtmode);
-    tcg_regno = tcg_const_i32(regno);
-    gen_helper_mrs_banked(tcg_reg, cpu_env, tcg_tgtmode, tcg_regno);
-    tcg_temp_free_i32(tcg_tgtmode);
-    tcg_temp_free_i32(tcg_regno);
+    gen_helper_mrs_banked(tcg_reg, cpu_env,
+                          tcg_constant_i32(tgtmode),
+                          tcg_constant_i32(regno));
     store_reg(s, rn, tcg_reg);
     s->base.is_jmp = DISAS_UPDATE_EXIT;
 }
-- 
2.34.1

