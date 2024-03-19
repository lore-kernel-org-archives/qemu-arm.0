Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1382951ejb;
        Tue, 19 Mar 2024 08:45:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWVLDlVwnc9H4UdKOTUCmBfdGLyjhl00crLbqr11qbIDNupw+xkk6OZOTsGLCVvXa3e6jBzYDKVMdnwXKg9glHqLYCaWFuB
X-Google-Smtp-Source: AGHT+IENib7BTSob9WxObcrrh+1Rog2lEQnNBKNLdx/tOiTguYzA5C8hG9Bu86zGdWGT7ZThqaKz
X-Received: by 2002:a05:620a:88e:b0:78a:51c:8db9 with SMTP id b14-20020a05620a088e00b0078a051c8db9mr3858937qka.10.1710863112305;
        Tue, 19 Mar 2024 08:45:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710863112; cv=none;
        d=google.com; s=arc-20160816;
        b=zoypouPGmKqXyQ+nAJwXjKb5aSNoIRr7C5ZhAZnnbInj61ErdBxTA/W9pcshz7Cn+B
         9KZGO4yyChvGSKSRrsGUFTCX1sozUdj7oTz2uVN582NVJpnnhC65gGOf5HPuJneJUIuH
         Wa6vx3ZOwMqymq7scuk8tUsrn60KKHlnkLf38E3QCAbyc4M229mlVMX9sXpD9Rxye0R4
         BMHa5CiZkd0g3gJLWl57pfOpmheDZhf4VsDOXo0OlKg2VhXeZUTzKfuN0NjaMrxD4BLK
         xj+IbR60BAL6vAW0uAD4gAM4t0bs2ZXHbLWPB/i9lWtSPBjBuNZfU029isboDlU6vUEL
         c4Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dfAUn7JpYvclLzB4k+47U+LtLO2gvCUyK6vzKcLd+98=;
        fh=0DJdXHt4lRndX4TB24vsfDywtXgLQPQ7DTwK7K8n6x4=;
        b=Mm6+K4o5v3HmCs9WeU+9i+t7GDtNwISQ4XYp3dz+Ztr+9+oMvVnXS96y6L8Kpfz3rU
         njJ3fF+OSenAn0lmo5SBX0xAuUMhkyKTBLQ9I00P15NF50bUW5/JlIAwTVfI/HwOyoBo
         VgBkDXjozAL7d5EykTfpK1RwEm00ZB4lR/Qwp8UkqbxTZfZjlWQR33tNIrh0fFUJFfWT
         BDJvAR8ST+X5eeHt7d7qFsUfhSGn3/06pQmkM6ikGok7XdNggQHWkCCcHMw24tspYW8v
         FvII4qr+kUoIVb8hBL9TpUXpZt89oZvYAeK2TnRBbLFOO1G1Ef0MrGUZn2VHYy+gzPWa
         90CA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JBEbn6mw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j19-20020a05620a147300b00789f691a17bsi5754862qkl.12.2024.03.19.08.45.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 08:45:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JBEbn6mw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmbdl-00079j-0K; Tue, 19 Mar 2024 11:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbdY-00069j-NL
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:44:26 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbdO-00058W-64
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:44:17 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d2509c66daso77796971fa.3
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 08:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863051; x=1711467851; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dfAUn7JpYvclLzB4k+47U+LtLO2gvCUyK6vzKcLd+98=;
 b=JBEbn6mw/a0KI8BBAso4Oe4WjWydFjcRSGsMmIIE0Oyi7y4u2uTjo2V6o4Corg3kPe
 tTYWLKKnRrqCLAl58QNzd5qbOznF2MtPqqmbdawEOweTC4pOhLFoXF8hMrDkkn2RZoic
 qz80K6WtFcknrtFBPsaBhqc5xTKUKNBO7r2NNyzO2e07sP6dwOBStjOIsmxceOVvABXE
 ph/HJm0sVTKu7alP2AxvAnGG9nb4cOKCKiCAw5U8hUn0t872w1xiknHsCjkDQnpjipgq
 qhDW7O0YEU1NPtKUFsgjGfZPal8oROV/Q62jnveMIr/E7v5bdWNyaG3h/QYKVO0JLOYL
 aAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863051; x=1711467851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dfAUn7JpYvclLzB4k+47U+LtLO2gvCUyK6vzKcLd+98=;
 b=v/LB7xXy+latsfhduah68lxs5D6HNmPX70faIH1O0tfoJTMFiKDUXxz0fOza6Uw6eX
 EmrUMKzeYpk1ltPswGtvFyU4tWw05uxTs5eRitO1NJzcCZkpSQhsVc+pxCJIXVK2vYNv
 XTglkZlKUIsm/3xB6gNTkbGDg91e2bBUp2tTk1hobjifEvr37dlqHVrk2xbSZa6ia4Qg
 7eP4ABBWyOtIMboOndQ/rJE6AsfXuS4t2yEv8W6QdogIZsLrSDIdRFjDISeCa8vf1n6J
 YjXA92xbSRI25MFTpIACXKmHqRCehwu5JvdRZkZ4ArGe/eBzigGnGjRg9ht+IwOcsM7r
 SKFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm94K+/YxTIvwxd6m9DzGCXX0k740kf0KANQHx3PMTMNQXJ2W3oBfNAV2o62mZ4NVpR0C94phP6XOUGBZHUAjaadtJ
X-Gm-Message-State: AOJu0YyaerTGHZt5oh6VcDxtYqc31qyuQqmj/Kmq7j4Epfw1B9sMwT2Y
 RTocIJZHS54SW7/0KyYDiklNK0s3IcW+QzSj0/xwYXj2PbvptzQkcBswJGnilds=
X-Received: by 2002:a2e:8645:0:b0:2d4:51f4:dbee with SMTP id
 i5-20020a2e8645000000b002d451f4dbeemr9931008ljj.53.1710863050839; 
 Tue, 19 Mar 2024 08:44:10 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c4ec600b004140726eac3sm11900174wmq.6.2024.03.19.08.44.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:44:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH-for-9.1 12/27] target/m68k: Convert to
 TCGCPUOps::get_cpu_state()
Date: Tue, 19 Mar 2024 16:42:41 +0100
Message-ID: <20240319154258.71206-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x229.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6J4gfwev3S63

Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/m68k/cpu.h | 18 ------------------
 target/m68k/cpu.c | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 2790d61115..2f5f973bd4 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -604,24 +604,6 @@ void m68k_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
 #define TB_FLAGS_TRACE          16
 #define TB_FLAGS_TRACE_BIT      (1 << TB_FLAGS_TRACE)
 
-#define TARGET_HAS_CPU_GET_TB_CPU_STATE
-
-static inline void cpu_get_tb_cpu_state(CPUM68KState *env, vaddr *pc,
-                                        uint64_t *cs_base, uint32_t *flags)
-{
-    *pc = env->pc;
-    *cs_base = 0;
-    *flags = (env->macsr >> 4) & TB_FLAGS_MACSR;
-    if (env->sr & SR_S) {
-        *flags |= TB_FLAGS_MSR_S;
-        *flags |= (env->sfc << (TB_FLAGS_SFC_S_BIT - 2)) & TB_FLAGS_SFC_S;
-        *flags |= (env->dfc << (TB_FLAGS_DFC_S_BIT - 2)) & TB_FLAGS_DFC_S;
-    }
-    if (M68K_SR_TRACE(env->sr) == M68K_SR_TRACE_ANY_INS) {
-        *flags |= TB_FLAGS_TRACE;
-    }
-}
-
 void dump_mmu(CPUM68KState *env);
 
 #endif
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 7c8efbb42c..3bb9f58651 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -51,6 +51,22 @@ static void m68k_restore_state_to_opc(CPUState *cs,
     }
 }
 
+static void m68k_get_cpu_state(CPUM68KState *env, vaddr *pc,
+                               uint64_t *cs_base, uint32_t *flags)
+{
+    *pc = env->pc;
+    *cs_base = 0;
+    *flags = (env->macsr >> 4) & TB_FLAGS_MACSR;
+    if (env->sr & SR_S) {
+        *flags |= TB_FLAGS_MSR_S;
+        *flags |= (env->sfc << (TB_FLAGS_SFC_S_BIT - 2)) & TB_FLAGS_SFC_S;
+        *flags |= (env->dfc << (TB_FLAGS_DFC_S_BIT - 2)) & TB_FLAGS_DFC_S;
+    }
+    if (M68K_SR_TRACE(env->sr) == M68K_SR_TRACE_ANY_INS) {
+        *flags |= TB_FLAGS_TRACE;
+    }
+}
+
 static bool m68k_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
@@ -524,6 +540,7 @@ static const struct SysemuCPUOps m68k_sysemu_ops = {
 static const TCGCPUOps m68k_tcg_ops = {
     .initialize = m68k_tcg_init,
     .restore_state_to_opc = m68k_restore_state_to_opc,
+    .get_cpu_state = m68k_get_cpu_state,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = m68k_cpu_tlb_fill,
-- 
2.41.0

