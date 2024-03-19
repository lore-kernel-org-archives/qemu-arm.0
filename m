Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1384360ejb;
        Tue, 19 Mar 2024 08:47:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVeycs9QrJsygXbx0tSp7VsAhSX0OGB6Jqh8+VmV7w3s7fAZrRnj5w8EtJk6R5jlXC9EVKH5j5XGJNXOrZ+S3hTYoWvDUSF
X-Google-Smtp-Source: AGHT+IF3sUCD/oPa08RD2UnonrRDop94TTBRNz14uewIjcItCFLuSuoo/wBieF6UpNd9UtrULLQ5
X-Received: by 2002:a05:6214:80a:b0:690:a800:8ffa with SMTP id df10-20020a056214080a00b00690a8008ffamr17793971qvb.31.1710863255250;
        Tue, 19 Mar 2024 08:47:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710863255; cv=none;
        d=google.com; s=arc-20160816;
        b=qmQRN65bujSsSFu/HB0K5xzFHs5xdmvriWGudOnnNh/y4EPbIZe/DFX+QF9GT4hY8/
         nkw1ks63oVsyuOSIA8XQpyz377SMcrxNMQJN1FYMUFZoZqAwHetDua5nfeKHZzkGH5rf
         oT/6uIZqQDTrVmJVIh7tgguVMNRjep1nedSaNOY0kuFEcxiFWNFFl6Z52G2r4CTdknjj
         OHfosOj+vF6l/CpUTyOItMKzEsDqtKtYqP6AnNCkjTqPE/z8fGQwDkoCO0uRUdDt9eAn
         Mz5hLTP+MgC8CTgYPZBsqMUVcMMLzxsu4ALr4EABbBJGZuRZ/Lo3xIu6x3uCnkZT41U9
         XsBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UywTiyuwpzYSJP7ec90xP7SAWTKz8NCufjjlUtL7sy8=;
        fh=/EhtSR7CrH/TqR727HIMrsQ8zWknelhVPwdOX1fbQ44=;
        b=QM/1ToHGVIiWasBu9vwwuZMxKho9DBnK8cNI4MDAc2n04nH9NyQt8N8ywrhaW2Diz7
         3HnCM1y7i+xdv8udHuZdnNq1BK9Ivxi7v3ZXA/w+2XyyNczDFnkqfkJQgWvm8/SK3UzG
         t1AY0+7RG04aJXhRkxrvowGN7UE5/0rzeLwFN8vzprFzaAn4JqKDajnZ+k8Svrao/D4y
         xvSUEm+cQuMZ5jBwS4ISEabK+alyrLKZWZtW5p09hoI/LKC6KGfNnLhAQKv5HAGGg2Pm
         hzCKeflkgf8MfDf6O1cXUMnjorDqx8e0Wob+XEK6/G+z14YmpWyWCOJQIOgAn7WRMUo2
         vovw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VhvMKZ00;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hf2-20020a0562140e8200b0068cc0945defsi11060971qvb.318.2024.03.19.08.47.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 08:47:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VhvMKZ00;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmbee-0001n6-VV; Tue, 19 Mar 2024 11:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbeQ-0001Js-Bp
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:45:19 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbeN-0005gT-0x
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:45:18 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33e1d327595so3706831f8f.2
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 08:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863113; x=1711467913; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UywTiyuwpzYSJP7ec90xP7SAWTKz8NCufjjlUtL7sy8=;
 b=VhvMKZ00oWQCsZlXDW+CDjJhc+7HBvAAuL6u++pQTXOZS25GtXqAHUNqbv3W2yGeaH
 8a5299KXs/HOHHuCh9xkuffcmnIP+jTfFQm2SxygBezDnvohumbyBbASnRzIa4dZ6GRv
 23zDdDyRAurinokrGNwRTY+mqimy2BLhn2x2Sf5XAzUsO/r9PyTGyKBQb+iIPIxcORx7
 iqBS1icQtaL3gA3AH2j/0+lyyFtqBOzNfs5SEHM9IgkUBgL+EEdgGg9ygcMkQzcqKOy3
 YHA8T8JC5Es5TdjBI9FVYbpKwyiVAzYCR8DVk53ZwhqWKLr08HHrBWOOLYb48aRGbrtZ
 DqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863113; x=1711467913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UywTiyuwpzYSJP7ec90xP7SAWTKz8NCufjjlUtL7sy8=;
 b=JeVRc/ROJvIVtsD4BZODnx6Xp4hpI6yXGOWzHTk2tvEflkK/6EJp7g3ZVT1b23+7B5
 Boq5CRb7GlQdbbE/Jlb7o5Pf9SoFx3MUyTTM7I9J4iMzQff2rnjS0wsC8m/Zvyjep7aL
 zm3wcgaDDR3T4uZhLS/LnfQNJGCCb6Agbp7gDV4+kPuC2cZyv9KunhsSUS5KsSjiG640
 X61nXufFUS8NZ1bn5UCw+oyCl32o/l2MAXRB/1Dql655SkWDmtvrEiZVIEo8wuTrVBdT
 KekFgr8VEZRlWqAcVmkBjXH5/QHOxPAZ79PZVdpf51SjCjr4O6FikxcqjF58ENkRxzzW
 H/Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0UBx2rVBKkXCrTnkiZk3HS21/KZZ5eg2WEB0qT+Hx6/MEtmYLE6KN76SsfHOd1DibQK8MCIsoMhyI54uRTVUw2g5d
X-Gm-Message-State: AOJu0YzGTOnkoZq8FKsYQDa9O76vmy8cDJApymzquOLAL0ZPGDkCa/ot
 xAhxQXsmUeEsE6dTqVDWsp6sFXuhWwqHt9gRnjABUR75K6SFWBfyu8J87Y1ajtI=
X-Received: by 2002:adf:f3c2:0:b0:33e:bb67:9596 with SMTP id
 g2-20020adff3c2000000b0033ebb679596mr11018901wrp.64.1710863113462; 
 Tue, 19 Mar 2024 08:45:13 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 o9-20020adfe809000000b0033ec6ebf878sm12573736wrm.93.2024.03.19.08.45.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:45:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH-for-9.1 23/27] target/sh4: Convert to
 TCGCPUOps::get_cpu_state()
Date: Tue, 19 Mar 2024 16:42:52 +0100
Message-ID: <20240319154258.71206-24-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: hMAxjLkzBZpw

Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/sh4/cpu.h | 15 ---------------
 target/sh4/cpu.c | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 9211da6bde..36aff035cf 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -370,19 +370,4 @@ static inline void cpu_write_sr(CPUSH4State *env, target_ulong sr)
     env->sr = sr & ~((1u << SR_M) | (1u << SR_Q) | (1u << SR_T));
 }
 
-static inline void cpu_get_tb_cpu_state(CPUSH4State *env, vaddr *pc,
-                                        uint64_t *cs_base, uint32_t *flags)
-{
-    *pc = env->pc;
-    /* For a gUSA region, notice the end of the region.  */
-    *cs_base = env->flags & TB_FLAG_GUSA_MASK ? env->gregs[0] : 0;
-    *flags = env->flags
-            | (env->fpscr & TB_FLAG_FPSCR_MASK)
-            | (env->sr & TB_FLAG_SR_MASK)
-            | (env->movcal_backup ? TB_FLAG_PENDING_MOVCA : 0); /* Bit 3 */
-#ifdef CONFIG_USER_ONLY
-    *flags |= TB_FLAG_UNALIGN * !env_cpu(env)->prctl_unalign_sigbus;
-#endif
-}
-
 #endif /* SH4_CPU_H */
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 4f5a4a3d98..9b2b377e29 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -67,6 +67,21 @@ static void superh_restore_state_to_opc(CPUState *cs,
      */
 }
 
+static void sh4_get_cpu_state(CPUSH4State *env, vaddr *pc,
+                              uint64_t *cs_base, uint32_t *flags)
+{
+    *pc = env->pc;
+    /* For a gUSA region, notice the end of the region.  */
+    *cs_base = env->flags & TB_FLAG_GUSA_MASK ? env->gregs[0] : 0;
+    *flags = env->flags
+             | (env->fpscr & TB_FLAG_FPSCR_MASK)
+             | (env->sr & TB_FLAG_SR_MASK)
+             | (env->movcal_backup ? TB_FLAG_PENDING_MOVCA : 0); /* Bit 3 */
+#ifdef CONFIG_USER_ONLY
+    *flags |= TB_FLAG_UNALIGN * !env_cpu(env)->prctl_unalign_sigbus;
+#endif
+}
+
 #ifndef CONFIG_USER_ONLY
 static bool superh_io_recompile_replay_branch(CPUState *cs,
                                               const TranslationBlock *tb)
@@ -250,6 +265,7 @@ static const TCGCPUOps superh_tcg_ops = {
     .initialize = sh4_translate_init,
     .synchronize_from_tb = superh_cpu_synchronize_from_tb,
     .restore_state_to_opc = superh_restore_state_to_opc,
+    .get_cpu_state = sh4_get_cpu_state,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = superh_cpu_tlb_fill,
-- 
2.41.0

