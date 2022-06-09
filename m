Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp695447lfb;
        Thu, 9 Jun 2022 14:02:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxOOazYutvWT08jBVVDxyMXcSSdEasoCj65zZf4digPDlMOzGLA7POFCqZ5VYqSXH8jGhT
X-Received: by 2002:a05:620a:d94:b0:6a6:6c9c:c7ec with SMTP id q20-20020a05620a0d9400b006a66c9cc7ecmr28488678qkl.221.1654808522553;
        Thu, 09 Jun 2022 14:02:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654808522; cv=none;
        d=google.com; s=arc-20160816;
        b=OPyijxmgv/fqhVjwFku6ExQsyQcYEB8xxqJoRFUzq9glWGMhPcfsV0LtUMy6Zk5UJO
         0i5+ikk8HqaclByvo4bhK+ulkBOMZ+J/d6lfmQGDMltsN0kFz+ZOlYSDIiy5oqKIcJnn
         X/jmG52L0G86njs1Je9Tprt0AaJZXUl03WyPbnXovLKL+gwiMilpJlQPU0rSkmPUSwUB
         xkBCcO3EoAOS4wwn2WLdmtahR1rqQN3sBjuB3K8GOjrEvHrCiA8R8cL6rZdFhBvrl4m/
         tlArOvF1n8jfEnDGAL27y0JyDC0siqpZG5zIVDjTHP6hZEDL7suJ4MmzzvVs8/ZBQ67c
         xE/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tkItDlBc/fej8rt3xUV6vGEsNdVvZUjvDsXBkPPMGQA=;
        b=M0I4ufmPU8UmENQPalrA3vGweUeUg5YAI7AWdlalKbT9LAvYcHeQj4Kns+HAq5fH2P
         wyofR0mQQ9SmAB32FHTzcjuf9rLNKTTEXjgMCnxbSDAjBTWw1/03HRj1wvx+8ruY2PNZ
         7/nxTWdOyyPlsec0Pjmp4gV9Zp3OFcSnnl+rQuGtXhbaESqFrXDr/IEZ5+mdVFw/MlfD
         +Ih+DOUBA16lzZuiIZdjPfNtGbZuMxjfNCuSl2dDt40LGr3AG8r2XgGyqMpnQ6NVoErg
         VqwQ2i4fOEGTv46a7FJlUicX3Ak1EJ1UkbSgtBvIch+oI3y4z85DeE7pAhCBNRs7cuPh
         oKuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I0CR6nhE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gs15-20020a056214226f00b0046427d2c730si13236840qvb.222.2022.06.09.14.02.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 14:02:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I0CR6nhE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzPI1-0004sj-N4
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 17:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmR-00047i-6d
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 16:29:23 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmN-0008Vf-Ct
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 16:29:22 -0400
Received: by mail-pl1-x630.google.com with SMTP id n18so21145561plg.5
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 13:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tkItDlBc/fej8rt3xUV6vGEsNdVvZUjvDsXBkPPMGQA=;
 b=I0CR6nhE9R69/brG+6Gi5BohVhQ2ktVzlSNVwXIaVoJv7jzCblref1KjLvAnsmXumH
 N7qljwrI06ykm2Y5eVIna4jOUWYg1d3cpwi3138hg35lC1O+hPIt6qjKVMMLjcD4lonh
 f120JpGSHJQkCCvATM0ZQkf59CG3nI9Z804BA01jG9BFNZutAvO/4af3D+xfTveHqXbH
 FzjCNMmKjgKBF0/LQyQvD1fuHPdC3aensF4LxNyqRVM+2JeczKId2YJpLLEBGMFOqhaf
 Ywp0uVbSGobSz/IotNJTgzyWqCoHQGyNA6ElwzXZAd6nfeHxaeSpgs/MFNTWxQh7sDn4
 p37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tkItDlBc/fej8rt3xUV6vGEsNdVvZUjvDsXBkPPMGQA=;
 b=5HxQ8DDdZsZ/7p+/IXzoRwf8hp0cuYeM02xg5qxuyJPYFjQ5YvfNRDNd37IQ/1v6/E
 TmWGypoWUixNdUuZIvrPMpajWmqK/F0ftb+0aZqF8LcefMolHVMIn9LxwlAux51FBKDE
 kiVD0YqbeUnymXiagUNE33iQ+aH8O0Qll1tqr6Eh/AFDj4083CwuAadJ5Gv7LdXnOSiC
 GGHAUxLk7jR35SY4LTDswOff7WUDgms/dpRyY2CkFjjKaX+RVgfbgKYeDUWPVbHVtf9h
 xlVLjVMOip+3Jb5fejf4EClXCm3bECRX4nMnPrCIQ/Ty6i7dxVM4U2mcHlYj5EayL5ky
 9SXQ==
X-Gm-Message-State: AOAM530p+gq5gtZ/DbIDdhDAxu1q0bJ8yjq7ufB5B+BWFg9drbaQQeHn
 x3C1qlDzTGnJH1c3tTIy+NyzT0yNdhxmhQ==
X-Received: by 2002:a17:902:d509:b0:167:6ed8:af9e with SMTP id
 b9-20020a170902d50900b001676ed8af9emr25901469plg.140.1654806556998; 
 Thu, 09 Jun 2022 13:29:16 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 16/23] target/arm: Rename gen_exception to gen_exception_el
Date: Thu,  9 Jun 2022 13:28:54 -0700
Message-Id: <20220609202901.1177572-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
X-TUID: qZX2KO6MoofK

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index fc5eafaeeb..edb7d3f394 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1086,7 +1086,7 @@ static void gen_exception_internal_insn(DisasContext *s, uint32_t pc, int excp)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_exception(int excp, uint32_t syndrome, uint32_t target_el)
+static void gen_exception_el(int excp, uint32_t syndrome, uint32_t target_el)
 {
     gen_helper_exception_with_syndrome_el(cpu_env, tcg_constant_i32(excp),
                                           tcg_constant_i32(syndrome),
@@ -9758,16 +9758,16 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         switch (dc->base.is_jmp) {
         case DISAS_SWI:
             gen_ss_advance(dc);
-            gen_exception(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb),
-                          default_exception_el(dc));
+            gen_exception_el(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb),
+                             default_exception_el(dc));
             break;
         case DISAS_HVC:
             gen_ss_advance(dc);
-            gen_exception(EXCP_HVC, syn_aa32_hvc(dc->svc_imm), 2);
+            gen_exception_el(EXCP_HVC, syn_aa32_hvc(dc->svc_imm), 2);
             break;
         case DISAS_SMC:
             gen_ss_advance(dc);
-            gen_exception(EXCP_SMC, syn_aa32_smc(), 3);
+            gen_exception_el(EXCP_SMC, syn_aa32_smc(), 3);
             break;
         case DISAS_NEXT:
         case DISAS_TOO_MANY:
@@ -9828,14 +9828,14 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_helper_yield(cpu_env);
             break;
         case DISAS_SWI:
-            gen_exception(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb),
-                          default_exception_el(dc));
+            gen_exception_el(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb),
+                             default_exception_el(dc));
             break;
         case DISAS_HVC:
-            gen_exception(EXCP_HVC, syn_aa32_hvc(dc->svc_imm), 2);
+            gen_exception_el(EXCP_HVC, syn_aa32_hvc(dc->svc_imm), 2);
             break;
         case DISAS_SMC:
-            gen_exception(EXCP_SMC, syn_aa32_smc(), 3);
+            gen_exception_el(EXCP_SMC, syn_aa32_smc(), 3);
             break;
         }
     }
-- 
2.34.1

