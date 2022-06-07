Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1805899lfb;
        Mon, 6 Jun 2022 19:58:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7XhY3PoWhifSrUgOFip6EkZ42phin0GupM/CJhvBpkPjSD0KkYhkOZ+wqc5xtVhIfUmYd
X-Received: by 2002:a05:6214:3016:b0:466:426a:5fbe with SMTP id ke22-20020a056214301600b00466426a5fbemr21151420qvb.90.1654570712493;
        Mon, 06 Jun 2022 19:58:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654570712; cv=none;
        d=google.com; s=arc-20160816;
        b=uZTy9n+jxUg9ibQI+GEuudnrjmjtTS7kuOgIiTzbvFuzNYv/2Mi1Y4v1jHazNn5ASZ
         r/oXh5ZT4bikwqVcgJrPGrOWWVQxQ3VtDxUhzGWgThK71vDV+Y9402e9irtEvMfeB4us
         oCbf34+Fd+HqaK/btmv5l/pKcsz4Hcv97DR6V+Ia0SVS5CDoD2/pBV8VON04+zYS3QSL
         NoVOT+I6d4CeyPY981LDOiixVAz1YRlkyotudmxRn3XMv1cEgxZNRI5vzs1p9H67G1Dn
         9yEeZ3LRFX/bOzc4+qbEhx0gxcXne0vLhF/xDSc5VunaRN5RAtvAzcnKIPDyMIXPhueC
         ZNNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hm5AJJ9rtEtZQmXdNnCESF6lpmFEuqmd0isJFAw5U8U=;
        b=fB+PESnYgnjIOKhfATju1t0TF+qaN9ClXgrI01mwXBA9KngLGTjWcJwfgtKGnve66P
         XEjiy3AXfzPeesFYUik0SEIRyT2ncPYzYUsf7U6ksDcSQjCcungXOIAdWEQw6Op1hRNG
         6SEitAzii5R55PXg87NotoK4VKIelfYVzJjtbTvnooRH7iuA8yUYGkpo9KR/dxZtUiUV
         QG+vnC0EyUF+jH8y2TTgzGCQrHhS3hLPVrcVHOg70Y/hdbe3X+z/vKNmzc4sJ6kFefl5
         afaqhTyJbssLzGwTAeyEQzeSVB2NQI4r6zGuUQCBJKSyYLKCGOlo4hww0BeU66KgbrhA
         pjiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MVRno+eq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020a0562140cc800b004634f3f9f8csi10417460qvx.253.2022.06.06.19.58.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 19:58:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MVRno+eq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyPQN-0002F9-WC
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 22:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG6-0007Ak-NW
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:54 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:33329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG3-0000Mx-PF
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:54 -0400
Received: by mail-pg1-x531.google.com with SMTP id r71so14586241pgr.0
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 19:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hm5AJJ9rtEtZQmXdNnCESF6lpmFEuqmd0isJFAw5U8U=;
 b=MVRno+eqO4SRy4l0C6F0k4YFvNPNBKAM+OKGYSC5g6gg5W1m4DVSXTxX9AvUQFpxoS
 eVjCLEMQk28m/Z5xgFkjeFeLEbrh87ZT+PbM0f9Yq84GOdEduveCfRK591kUGJJu5vU8
 VyNvReASNbxpB4PTEdKTbxhb1iG1k3KBco/itnzySI4zNpjylODZHTKaOc6JWOgRVW5r
 Ii6qQ1+sIxo1S+vjZRv9hl3kdiogg/AMBB6bv/rvWWYInJyGt1cjL6+LL6x5FGBUrr8c
 xykpdQXwvnprbTPsLxiBpoZ522Me7QMbWKd28Wtki2Y2gBXfq3hEmDUmPVcb4K1dZk2M
 WFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hm5AJJ9rtEtZQmXdNnCESF6lpmFEuqmd0isJFAw5U8U=;
 b=6fiCoVzew/J7H5r1d4+pNijI6DlepfMJxIavdkTThLkWhpqwGcjvhJrD+Ocv0GQYDg
 9oDhjJ3UnnNXV+hsXsKSoD6PXdSry4fDoJqS3EZv79M/PzOoUh64k7UKOMn7bmGM6xUx
 LTtCdE9pS/cBsJlmpNwI+IvVDCV9PdZm6lnw7z8SCQoFKjzkcfCyChns/QW/tVG/EUT5
 lfDtPzhhpiNABPP5W5Gx7+HOU10bQ58+JN81dn5MXN4zv7/zh6XxUsdqzdkpkOLyx9pk
 2qNH5vsrV+fnsdjWaTNRW7CZLBEmizlfckyuBSAKSfs/gJpxVsqLwEOx37PFFGWKZh9B
 pyhg==
X-Gm-Message-State: AOAM533ElNdMIraO/BNWrDbXROE1AVPW1oCXm4gjztgyYCDrNFtfgA5M
 HBsYm3a5FmlHTRIciCvdaCR1fg==
X-Received: by 2002:a05:6a00:88f:b0:510:7a49:b72f with SMTP id
 q15-20020a056a00088f00b005107a49b72fmr27102115pfj.21.1654570070368; 
 Mon, 06 Jun 2022 19:47:50 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 17/25] target/arm: Rename gen_exception to gen_exception_el
Date: Mon,  6 Jun 2022 19:47:26 -0700
Message-Id: <20220607024734.541321-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
X-TUID: x8VgG25okGoG

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

