Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1809394lfb;
        Mon, 6 Jun 2022 20:07:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFH27Td9Je2XNhKA82QWHJRWk0rxDo511/swfJWiBv76E4YM9zBrmmvGUlbo46GAhJHaDA
X-Received: by 2002:a05:620a:2402:b0:6a5:3b28:d726 with SMTP id d2-20020a05620a240200b006a53b28d726mr17892673qkn.500.1654571268482;
        Mon, 06 Jun 2022 20:07:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654571268; cv=none;
        d=google.com; s=arc-20160816;
        b=gUr3RAMRKTFUExsRAHS4yPyEmqx9Zixt2dADE4u8sxuGCvBJ0RmMRurdHEuijeNT4e
         YqeYLkEzOKFT4z0VaBpha0Aj4nD7ubkch2NwTIGaJcnM8IKJlJOQ4mKfzBViAoqhSWBy
         bCoFLxi3ep/VrHV5nKtp8o5oW4td7hWDnQc1iY51PfOIUJW4wCSMJa5uIpd4U7YzvK+s
         8/OP+Bn+PA2PD0mUpLpDKmDUHZVXacacQ4niUs6gsztxII+OzvgoFBlyQU30QVtvqwP1
         G6ru3bUPkQFmeU7Tg9os/dnRJ7fujYaeJheTbWBjOhMFeWb/EIqni637emvHWBazMsqD
         /EWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5ek6PL1aZJ6QfF3jqkeBuGSpjxRGu0Fp0N+Z+wPmIoE=;
        b=mzhUNH6j4f3FzxfTwQ5jbvC9WbrIJKR4XEN3ACZiTG5q++y5CWNvSPJMNdZt3g24q/
         29LG7uwIgjrCDgy49H4leY489Xjrak7eprdT0x4fZFA9wocsNCIQOyzSVu57mPNP4M9E
         c14X2upjOnwOWVJe5FdNL0TLdcefT6g0ELsai/QWdv10s1rSgI1utXdru81/yMDxKdcp
         Goke0URcIB9WchScozyKMrrejoU/O3lpB0p+L7dJqbutTxiXYg7qOQWQhPTJurvGeG/n
         TDaztR8EYmZQzr/+0yAI5EM0YJkTIG61APoMaAW3+RROtp6EB4xDi6teqg5mYlH2hEN+
         uB4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nmS6EnzY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dl7-20020a05620a1d0700b006a6c1692e72si2105606qkb.658.2022.06.06.20.07.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 20:07:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nmS6EnzY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyPZM-00061f-1N
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 23:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG6-0007Ai-Me
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:54 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:37856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG4-0000NH-CA
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:54 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 3-20020a17090a174300b001e426a02ac5so16380616pjm.2
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 19:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ek6PL1aZJ6QfF3jqkeBuGSpjxRGu0Fp0N+Z+wPmIoE=;
 b=nmS6EnzY7A7b2UlbQcSL3YdbbctjWmW2MQYoo8ahBHDemu28b/eVZnPz4S6AzoKWeE
 +FkGAvIbWki1DzdScYp3H7S60UlOLFO77igZsha9ewT3EQC2FipBqjE10U1fb/+EB7BM
 S2MCTzZNIaJg9ZYauYn5aS6Ou0KfGK+Q0D0eJKCkUAJp7DyM869h0TEzOt66vFkrNDr8
 5sCDDP0elmBYtyf75P1GUYNDi3LQNMyZQPGa2vyxygnOr3ImhMKKJHVbWlEk3PCLoGBU
 ZH9EC75jHyBQP4SEVyo7lqR2uCMxPTDdMS3RCpHkdCgzlv+k0t1wZ5x7Q3OViwH6MbN7
 Vfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ek6PL1aZJ6QfF3jqkeBuGSpjxRGu0Fp0N+Z+wPmIoE=;
 b=d9HhWvr6mo6ytgJpz+SPLXSO+okHblvInrUWhOuQ6aiPb5eEgbMB1ETavJeqTlqArC
 E6qasb4EH2gbrOuDyZjVHpdu3irvzNC94x1hcpB/zt4PZCNBVTvPPutzd4Sd0s+av9Uu
 D/HSvlNwpn5pwkWsU6jpAZkfmL+X1hC4xpMj59QjyMaimCgmmCFuP8bJBrQxPcKJGUhJ
 cID+rEtZmCeFEDZE7ag7HjFoB/phKlgmr+y0oVyKnA3euHlyLQpzFDz5SBYaDK/+IgCn
 /n+8gpV9MUEbnmDGvFAkaRWaGV82uxxYHN4WhvT9COSfJyXYrVA18XLozJDnxygPi9ey
 L9ag==
X-Gm-Message-State: AOAM5318vIGOEBZ5ZydoPpOs05IVbi1xWGjz/HykPPeE2LFV0i2oLEXk
 ioWplEwNLCMI/DR2IdOhn8shejd4Icplbw==
X-Received: by 2002:a17:90b:1d08:b0:1e3:2a4f:6935 with SMTP id
 on8-20020a17090b1d0800b001e32a4f6935mr42556887pjb.174.1654570071071; 
 Mon, 06 Jun 2022 19:47:51 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 18/25] target/arm: Introduce gen_exception
Date: Mon,  6 Jun 2022 19:47:27 -0700
Message-Id: <20220607024734.541321-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-TUID: bppltijXknLX

Create a new wrapper function that passes the default
exception target to gen_exception_el.

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

