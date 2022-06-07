Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1809566lfb;
        Mon, 6 Jun 2022 20:08:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIl9Mg5jiOiE9rs7ikSPZv6SK9rOusNczjAeVZpy+vdxqATXSRXUEEZwtyZDWPGIvmFJPl
X-Received: by 2002:ac8:7fc2:0:b0:304:f234:4597 with SMTP id b2-20020ac87fc2000000b00304f2344597mr3918920qtk.673.1654571302764;
        Mon, 06 Jun 2022 20:08:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654571302; cv=none;
        d=google.com; s=arc-20160816;
        b=dmeE6wzdLkOk0oyoUTS14OkIt6psROQsr5k7ka6ZmIQjrqBglmzdFvp9n9oSFFGHyQ
         20umTMqH8L+iENWEjAoqmF21NCFUxd+f8M6FRNHqxtSxLp5AGjlC227X5sV/hhfelt+w
         tEeSI0f9IHCXZjXi1Jl80tsrFYCNwEfBFcurXpDpdxlZaAqy9gFcWv7IOblxsW6dSzj2
         5iIp95/VN5zVkpY4WlcurMUB9WAevcKkN8cNpVHobv2Fv2ipghgRoNfnWwJAmoQBS6Zu
         D0gFa7tiL+JHt05TvcJKGh+zLx8AvAQVikCZg7aCTZkEcFeITZC1wDIdfOhbmZi/4575
         zElQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sDCwZBt9IIzx83ZkNxq+1Z/y6VvrCzl9tcBCjhjfsAo=;
        b=UGqueLXUwhPTBWxoJ1qoCy2SzneR4DxG01OxRwstZtDLJApgniN7CsKk0qOc6RH5ek
         0C003TU7EWi3locFAi2Mk13hHRaIMPjHil1J7qT9z6oKD1Z8x+/vwfU9CjFrFrEnANVT
         BwllnlRgOuq0yiNODc1qnaQo1wPpnRL7bIrAwOUBY7l7ONHU3FILI1VKSdUDIlxZVi/a
         IAXm0zBeEcOHM9jhkwa2j0KFWh7DMOOAY0UuNLZn7zsh8c/UjmV+ZUQx+MFS98c6vnbN
         UA6q4taWHR+Ys+347yPZuRWAd4Pe47JS6wLohPWiHpydOctL2PKXDymyXrHslOnL4IqB
         /utA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WRptN6pd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a22-20020ac85b96000000b00304ec529e87si2826090qta.363.2022.06.06.20.08.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 20:08:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WRptN6pd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyPZu-0006cm-9r
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 23:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG7-0007Fp-T3
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:55 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:34517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG4-0000HP-TN
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:55 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 mh16-20020a17090b4ad000b001e8313301f1so6821424pjb.1
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 19:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sDCwZBt9IIzx83ZkNxq+1Z/y6VvrCzl9tcBCjhjfsAo=;
 b=WRptN6pdTcIqEG69kgAFDqkXvMIbJZ33WHWHTPNUw9pIffdD478XoYTdH5J9idTIkK
 cXNDs1VrN1Az3s4ygsP5DGtcBWGkA4yfxr+8tymw/HLxJoxyz//T6j2b2p5jfMGHGaP7
 6iGBazHKelbZ8JngzmdhfempcJoWc5BC4zyyArIncurSW6xHHNgGdrc9rMSSMZ/6T1Z/
 vsrdi2joPC6WVJM3YVEY2sMiOtQzpMmGi2+ZgrndG7BoDhetcwUv/2iHi1mUjZse0rEI
 7Gi6muKPLgKIQSuEd7ucL1Oe3vuWy+Rl2bGjIuWWGE4mFm2DFllY8gbJCHOyNme80Bw9
 ObZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sDCwZBt9IIzx83ZkNxq+1Z/y6VvrCzl9tcBCjhjfsAo=;
 b=1ETyj4MqurgzcM534Wp9mi5dsFHphRUZqNabOyGYwZ2vUEncontqWgoI1jt3M8VOEB
 K8boJCHeWIt6mbvVNdTxksyY5xjEjDT66QC7sC6jLz4kDLSIcd0tU7f3o85B6FXwBySe
 3MISrbouYw0fG8TpC5BqhaN477/q4LiT73AtgmSlAagq3TgkSp0rvHOnEy8KWy7CHwrw
 FOkhRiChm8zWKDYQ/WmKBA6MQAKG0FYVY46bUI/uKU/F4j6d6zeUsN1EAo49YQm071Tf
 poc/veXBGhhFzFdHdGoC0nQwMO7KRZmr0+JxZHUcYXTkWPq0Ch8Pw6HldDCfGILmPVUV
 8Skg==
X-Gm-Message-State: AOAM530XcQHk9qA+RtHmtCeYK6t+FuL2QnQCjaIUriwcIwF1RpLni75N
 KA13WT3ZbyaPC3caCy+6wgkVag==
X-Received: by 2002:a17:90b:1c92:b0:1dd:10ff:8f13 with SMTP id
 oo18-20020a17090b1c9200b001dd10ff8f13mr63985762pjb.54.1654570072102; 
 Mon, 06 Jun 2022 19:47:52 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 19/25] target/arm: Introduce gen_exception_el_v
Date: Mon,  6 Jun 2022 19:47:28 -0700
Message-Id: <20220607024734.541321-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KYwNcC5oRrWB

Split out a common helper function for gen_exception_el
and gen_exception_insn_el_v.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5a48937ede..fcb6ee648b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1086,11 +1086,15 @@ static void gen_exception_internal_insn(DisasContext *s, uint32_t pc, int excp)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_exception_el(int excp, uint32_t syndrome, uint32_t target_el)
+static void gen_exception_el_v(int excp, uint32_t syndrome, TCGv_i32 tcg_el)
 {
     gen_helper_exception_with_syndrome_el(cpu_env, tcg_constant_i32(excp),
-                                          tcg_constant_i32(syndrome),
-                                          tcg_constant_i32(target_el));
+                                          tcg_constant_i32(syndrome), tcg_el);
+}
+
+static void gen_exception_el(int excp, uint32_t syndrome, uint32_t target_el)
+{
+    gen_exception_el_v(excp, syndrome, tcg_constant_i32(target_el));
 }
 
 static void gen_exception(DisasContext *s, int excp, uint32_t syndrome)
@@ -1107,8 +1111,7 @@ static void gen_exception_insn_el_v(DisasContext *s, uint64_t pc, int excp,
         gen_set_condexec(s);
         gen_set_pc_im(s, pc);
     }
-    gen_helper_exception_with_syndrome_el(cpu_env, tcg_constant_i32(excp),
-                                          tcg_constant_i32(syn), tcg_el);
+    gen_exception_el_v(excp, syn, tcg_el);
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-- 
2.34.1

