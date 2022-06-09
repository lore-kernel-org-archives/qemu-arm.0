Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp694072lfb;
        Thu, 9 Jun 2022 13:59:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRIFfMQRGIw4q/af4byUBj8XkY8GBVvvHZexYoYh0XWBIsGJ92UTuEj/OHe0zcfaIhDqd/
X-Received: by 2002:a0c:cc86:0:b0:464:6bf5:4719 with SMTP id f6-20020a0ccc86000000b004646bf54719mr31579667qvl.121.1654808380620;
        Thu, 09 Jun 2022 13:59:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654808380; cv=none;
        d=google.com; s=arc-20160816;
        b=ynMwpJxcglMpt+hPTVnt49MTsWk/K4aeqnRntZJwBaD4/Wa4s84z8KWbNrM+U9H2dR
         mn4HaxwKQ/tLk2fFmNhIrbJkE2XV0EFkbwdhgnEJJhWgN91226C5PdaFPxxPtdthXLny
         6nms6AWd7S1mvmFg6GDxisqrDUVPdarJ8J9Pxp8hU9EXKkNCy+W6Cdfa9nSpqF/HypGN
         vIQ34jPEBx7OKjRZpn2Qd8oKYHwok3yy0u2U5LjS93x83WffjPHBofiNscfdhaI1OUZb
         Kigj3OTtjWXH7FA06rxbIDCtwXmecfKcduGBIbFD2kndpUd2oq/M2SNI770PHwgwvdw4
         4NBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IeebmSLreQJnSlKwobDxcpS2nsd5xpcDMdcYwPgpEJM=;
        b=PDq+/x6JIB4vjHrvM3HZ5S70YuwzI/7DcIPZ1o/QYW/SrMktTykO0qeFl5UsmSDMJC
         6zZ3qA+0Gg938GkAr2F7ejEseM4eMvM8XTMzB9f3QA3xBV0UnwxVsOMcfsfdB0tdWytU
         +iPXcsdYOge4W2In/zDwmxA4ju5xSsdA74g3h2tZXSu+2NbBdniaAvQVZijNKnWSymw5
         Am1FiCxv/pJ9Zk3rV2GhutpvCZBYETjBBGs8jO8zSuwTp0A4UjGTlEDzh4zdI2deiJIZ
         Fdj9cwV43/mMYQKJahIf5mRcf+z9DelbU1clH6eKlKvezbekF3uQoF2LiazovAt+Dj6g
         zBpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=whqkkro9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp17-20020a05620a459100b006a6f66bee6asi3967552qkb.12.2022.06.09.13.59.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 13:59:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=whqkkro9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzPFk-0003Xv-4r
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 16:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmQ-00047G-V3
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 16:29:23 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:47023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmN-0008Vv-8j
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 16:29:22 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 k5-20020a17090a404500b001e8875e6242so346824pjg.5
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 13:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IeebmSLreQJnSlKwobDxcpS2nsd5xpcDMdcYwPgpEJM=;
 b=whqkkro9cftREiAC8Mq2sut0YAw+cByAvKnVSeXwIx8imYxatRY0e3/HVk7Zz4Ypyc
 4eCgEC9rwzBDfj9cjqPRaAadq+rI+7a7CHelTgzcz7K4z8wD17/VAZIxzUjxTi4xLugq
 f+bLx1Mr0yIf+diyj61NtgYsHer8Ay/dExFFxh62+ZaVk94BCjHmFRek80oA+Sdpmbq0
 toYIgttzt1vg5J60kXwoTjLX4q9v2FUt4E6O3Nf+4fpSIITmJN60+H9W1TSlPrqN8bRe
 GgIzZfGBJ5s9OypYD0fmaWYVegTaGFVNhR4hY4upkt1OxgBNBWb1ACo+UE3yTY6kerTN
 o7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IeebmSLreQJnSlKwobDxcpS2nsd5xpcDMdcYwPgpEJM=;
 b=SBu7fdOx8JaVTDdUFn0+IvZlkvmG54Y2vK0Ap7+pNuU2ZGQ3EqdrRBLjmNh/wb2Nf9
 qj/zB7PJZeF4XRJvfR3g9QEISUXFN2F6sWjieR91326cotVVZN3iuQsEZstseUIX9puj
 msMutlZ9GvrpEBAYs7uhFMw3L9dI12Tr89dgV6DyeQKZGeePBBtriliyqDYPYqVLxfJE
 ewDmVN2K7FglmOgn+NNRsZkxXheA1i5PeMDx+/FhmdDRjU3F0yT7qYmn3lgHHfvDotFc
 613IE8zHUfDLhJwyeN4wPfpy3CKXClter7R2zMma51BS/6vwdqXesJYPlLkHH4mwlXDk
 +BHg==
X-Gm-Message-State: AOAM53347AFpFSw40S2yW3uEVp/TrFO4YpDTMuYBxWeNZuezk24ExGle
 oTWBjRtQb5/cnP74OO70YBRc1DMFda3peQ==
X-Received: by 2002:a17:902:dac3:b0:164:13b2:4914 with SMTP id
 q3-20020a170902dac300b0016413b24914mr41271421plx.135.1654806557881; 
 Thu, 09 Jun 2022 13:29:17 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 17/23] target/arm: Introduce gen_exception
Date: Thu,  9 Jun 2022 13:28:55 -0700
Message-Id: <20220609202901.1177572-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ifanvHAfRhOR

Create a new wrapper function that passes the default
exception target to gen_exception_el.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index edb7d3f394..5a48937ede 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1093,6 +1093,11 @@ static void gen_exception_el(int excp, uint32_t syndrome, uint32_t target_el)
                                           tcg_constant_i32(target_el));
 }
 
+static void gen_exception(DisasContext *s, int excp, uint32_t syndrome)
+{
+    gen_exception_el(excp, syndrome, default_exception_el(s));
+}
+
 static void gen_exception_insn_el_v(DisasContext *s, uint64_t pc, int excp,
                                     uint32_t syn, TCGv_i32 tcg_el)
 {
@@ -9758,8 +9763,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         switch (dc->base.is_jmp) {
         case DISAS_SWI:
             gen_ss_advance(dc);
-            gen_exception_el(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb),
-                             default_exception_el(dc));
+            gen_exception(dc, EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
             break;
         case DISAS_HVC:
             gen_ss_advance(dc);
@@ -9828,8 +9832,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_helper_yield(cpu_env);
             break;
         case DISAS_SWI:
-            gen_exception_el(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb),
-                             default_exception_el(dc));
+            gen_exception(dc, EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
             break;
         case DISAS_HVC:
             gen_exception_el(EXCP_HVC, syn_aa32_hvc(dc->svc_imm), 2);
-- 
2.34.1

