Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1384402ejb;
        Tue, 19 Mar 2024 08:47:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW0Jy5NyRxxO5cz+efrcCZKf84s3Vk3ouNGzQnxer5KQc/W5mVR7x43TLHKlZK6ZY+ZMy051YnKoZJuDk5PQ9v+F46ScVBa
X-Google-Smtp-Source: AGHT+IH5gPLVqWLcLc8PuY5YViNmPjJSEHkve2QrPyMIPv+bq3879tbBcFLnlNRDKB3w+iGS0jcf
X-Received: by 2002:a05:622a:15d5:b0:42e:b384:2628 with SMTP id d21-20020a05622a15d500b0042eb3842628mr19628888qty.26.1710863260021;
        Tue, 19 Mar 2024 08:47:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710863259; cv=none;
        d=google.com; s=arc-20160816;
        b=EilGbyc56W6F9vJiPS1v8Z0hWlzEwLJZRESClU6S6UWQkMdUUIjIvP1XSk3gKmqHJ9
         4STxPSRwLmm5VfqtnoxSwE4tDTP3/v8fXEus2kimSEHw0U6AETjFVzflCDP6Pacfe+EP
         wQ2MraFhaZpCIbT7871w+N2ACbd0LWAe/RFDC7WjG8jrD16txMH8JHSjlc68MvRG+gjY
         gDzBsPwGkcNSFGWkYvv0crLtZmMneZzJv3pedRCTA39mgQMz+WSNJ4ATVdEUh96R5sfa
         cf8sBNbAF3euIrivEO2gJ+4bbv1Mu8/l7UBFsXkyqg7VLJ3rpu0akDHiA1yDmuvk6Y+m
         GGpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3lvebIFUNGxL/tpQGaVwXk03NyH8W0xBvPYOuRzOi+E=;
        fh=zWh4Pnyr6rsPOkqMhBhsN5O5KpRLGbtVZlJ2dfKnRDo=;
        b=QtnIqxH8XxQYy/0aBlTCG870vZ9GavjBeflI42hfI3e5XQ6trcxu9vu5tbatI5cQ+d
         LGrxzoFG4sEeeqvzeEgsyOzjBe9Obc/PoKwSoKh21xqI+RS8vsY7cWY/BJMma1CQ1CGi
         2vhJIb10zMP3X2jrYkdmnyiRPsbUL3NLhKMANCdyXuSbZqj6vvw3WOknuNauE78L7wKY
         S3nvSihFJ6TL1fESOiSYqRfK27puwdNTW13advTEvaajh/NwRXZCrMyiqm5PvGIAolY2
         l/BTkUjeMGdofJKRBLKE2j8sZkTE+BqGCvws2j7tAXe0DA7VNHaed8K2V5Og7EuTHFto
         8CxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JLVbFVuQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n8-20020a05622a040800b00430d31a5767si4430178qtx.326.2024.03.19.08.47.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 08:47:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JLVbFVuQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmbe1-0007z2-N2; Tue, 19 Mar 2024 11:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbdq-0007jo-Vl
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:44:44 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbdj-0005Fk-6z
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:44:42 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d4886a1cb4so66819301fa.0
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 08:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863073; x=1711467873; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3lvebIFUNGxL/tpQGaVwXk03NyH8W0xBvPYOuRzOi+E=;
 b=JLVbFVuQvyTWpqOjNGhS1mdR4Eb7u9ILbUVxcONSzcRy7xc0qnQm4knfbPtXCXn1lX
 nIyo5ABEDCuZQFfQsMkDWSKZrKeYx66KZvrjnwGcVGb0RHP47BL2NEcE1HsYtz81NmuB
 LrIZAwjX/U9GQ9pUuj1UF/CKrpeEvlpEJ8KpaQR0R4w3q9eJNZm7PFQp7uqokzv5XnG3
 bKVUO4pn7y+IuL8zff2s0RWyrFvecoIaN3tCpPciHWtTtwQKdxFrSEsE4IBVBrW7gZBj
 nUGAtg6YaYtQW+C8d+8RW84Okdqsxf7vxtqvnaogGSidp23DZK9tq6ma4Q12TJIZmw3c
 doYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863073; x=1711467873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3lvebIFUNGxL/tpQGaVwXk03NyH8W0xBvPYOuRzOi+E=;
 b=KuEYsKamJK/PytOkawzNcIXpzy/kWcmS2l+RyEBTSEs1Gfz4t4xqYXWQaSX9XOv2i0
 h/vEgBtqriDD11G+4JxnOTheOlxrvzoTdjx3TlYUk9ncEsAUuQIpBTs3dyN5xdRxHDO8
 HzAr/n1pR4eLU/dPJ7klnrqIr5MxcZX79MoJbQZbh8KPzczYKqig3MiKbc6y3OzTeDvP
 fxefBlGOIu2ifto5BOEPUCIEhffsitwlvWtFlsi1zHWvulcHMjdFYkcl1+3kmNkIPkr0
 1X1zQFCuIYIzZbs2l0SSpkc6dNknkAUZr+rtzrV9U5xbWn+JFYiCJeGhR2LGoyOuixpc
 OZRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsgg7qrlf7H1QTgXwpRydkUrEiVVE23G/geqsD16nN7mO1lcT2NqsqnQIEsMtplnPhUVdLrkLpXnRhnJILlC5nj0R7
X-Gm-Message-State: AOJu0Yxi89+inieicv/+EAz5Wc3obm6/iMXMunMdN+4J0e8EvmAShtu1
 Z8pLlpfxLYz4zBglhlhU9WqzJsy0k75RV43uPIi6WfKzT8a1w9HqlKA36/o3hNo=
X-Received: by 2002:a2e:88cf:0:b0:2d4:b153:57ab with SMTP id
 a15-20020a2e88cf000000b002d4b15357abmr1777709ljk.47.1710863073392; 
 Tue, 19 Mar 2024 08:44:33 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a05600c354d00b00414612a43a9sm4000401wmq.28.2024.03.19.08.44.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:44:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH-for-9.1 16/27] target/openrisc: Convert to
 TCGCPUOps::get_cpu_state()
Date: Tue, 19 Mar 2024 16:42:45 +0100
Message-ID: <20240319154258.71206-17-philmd@linaro.org>
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 95DWwL6pxnYK

Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/openrisc/cpu.h | 12 ------------
 target/openrisc/cpu.c | 11 +++++++++++
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index d42800242f..6997c7534e 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -351,18 +351,6 @@ static inline void cpu_set_gpr(CPUOpenRISCState *env, int i, uint32_t val)
     env->shadow_gpr[0][i] = val;
 }
 
-#define TARGET_HAS_CPU_GET_TB_CPU_STATE
-
-static inline void cpu_get_tb_cpu_state(CPUOpenRISCState *env, vaddr *pc,
-                                        uint64_t *cs_base, uint32_t *flags)
-{
-    *pc = env->pc;
-    *cs_base = 0;
-    *flags = (env->dflag ? TB_FLAGS_DFLAG : 0)
-           | (cpu_get_gpr(env, 0) ? 0 : TB_FLAGS_R0_0)
-           | (env->sr & (SR_SM | SR_DME | SR_IME | SR_OVE));
-}
-
 static inline uint32_t cpu_get_sr(const CPUOpenRISCState *env)
 {
     return (env->sr
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 33c45dbf04..ce44ac0316 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -62,6 +62,16 @@ static void openrisc_restore_state_to_opc(CPUState *cs,
     }
 }
 
+static void openrisc_get_cpu_state(CPUOpenRISCState *env, vaddr *pc,
+                                   uint64_t *cs_base, uint32_t *flags)
+{
+    *pc = env->pc;
+    *cs_base = 0;
+    *flags = (env->dflag ? TB_FLAGS_DFLAG : 0)
+             | (cpu_get_gpr(env, 0) ? 0 : TB_FLAGS_R0_0)
+             | (env->sr & (SR_SM | SR_DME | SR_IME | SR_OVE));
+}
+
 static bool openrisc_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD |
@@ -229,6 +239,7 @@ static const TCGCPUOps openrisc_tcg_ops = {
     .initialize = openrisc_translate_init,
     .synchronize_from_tb = openrisc_cpu_synchronize_from_tb,
     .restore_state_to_opc = openrisc_restore_state_to_opc,
+    .get_cpu_state = openrisc_get_cpu_state,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = openrisc_cpu_tlb_fill,
-- 
2.41.0

