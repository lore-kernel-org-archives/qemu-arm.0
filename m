Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1384125ejb;
        Tue, 19 Mar 2024 08:47:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQCgnTA0Np9nbECx6E01hwr483DLGYZvmmWgoaN58HwGknXG0iAI4WMYuusKfgc/jAhQ0K6moi9Ss9HPuCYBm1cLo4N62Q
X-Google-Smtp-Source: AGHT+IFzaqY9H+VzGPkaVffzLOod21vkSkTtLFQPosg8d+bw2ScNwmWgjfLutu+XNeWnhZ9ATkUn
X-Received: by 2002:a05:622a:18c:b0:430:e26e:e7f with SMTP id s12-20020a05622a018c00b00430e26e0e7fmr3875068qtw.8.1710863228880;
        Tue, 19 Mar 2024 08:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710863228; cv=none;
        d=google.com; s=arc-20160816;
        b=A8ySYdcZPrsT+zIFpAYlPajMJrgLyeHx+7NhX/e7QmC+xq+Ee/AejhgKJGF/70CYp1
         2J4/mhZh1NuecXeCG9wMDfSNiH56xmPCkbcz7Iqm+5VRS2eezvEYeAGKfIFcAcq6JjY/
         p4lZZC+4Nl4eDdDHQgduaRKYMpDnPLAmlEUqAra1eFqilvzb8pefhupbuW2ws9+zZ4FN
         DtnW9KII+38lDmUOD9JrtUtJnZufUYKE43OSC/g4EUh8PtRNNfMn2UajVwxb10+wlP6N
         JoCKOV11L/a+AtezhSBRq5VPDLI0rK4D/z2r4Pp0v5JbMNMUIK3cDPlnMOOmwy2cw8Ee
         T5iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NFX4++ImuD2EMXqBk24v8xDkpJQsfeFGsz4R2q2Dmzg=;
        fh=FFFptcXE0Qwc5si/YmUZox9/LHNokziDsOm7UZACrj8=;
        b=KVxXAiY85bdNtN4mnSQu9xuUtGUZ2yxtmFXSOlcpI9x4ibxEqHyCyWPZeIjfIWNXnd
         iEFBbqjVZPntfb0WZC7Fz2cpOKh5kUO1ZKF6a19XD+YwXsMDefGDvBzx14zq/2EYDEif
         +I2htytnWIcc4LFM+i2rJO/9IHHFU+4nEgsFxtUUuBxgJY/kaJ3hULO+WnRgIN8FQjlZ
         OSkapos/NMcX70mnEQmYBROyocvGTuTSE4T3wuVAPvgMER1ruR6nQ2j7v0/U0UOy5hCL
         bID8yhaEZJ2B7UAFv4eWJ4TKriQ8oG0R5+UiAjo/IV7bIlb1UQWcoE5SdERUd1Aj9uFZ
         zxYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v7Nl1bsE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs15-20020ac86f0f000000b00430e20b5f42si3013067qtb.507.2024.03.19.08.47.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 08:47:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v7Nl1bsE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmbeM-00010M-28; Tue, 19 Mar 2024 11:45:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbeC-0000Fb-4L
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:45:05 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbdu-0005Mt-QY
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:45:02 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-414617882b3so10530215e9.3
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 08:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863085; x=1711467885; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NFX4++ImuD2EMXqBk24v8xDkpJQsfeFGsz4R2q2Dmzg=;
 b=v7Nl1bsEgu2N1g2/sg8QQa9gd/k9/esWP9SUTdz0DuVGtHzCGqe4yKZkSKfQjF0CUp
 b3p8YZADPWidLpE+Ck6dWeEg+Ra5gstFKgZd72IHLi7R/s2CA1PgNUqwsfdswFkr9WS5
 EXFkzqfXotXmWfsR79J8rrOPUWozUb4SKt2gVjiSRyc5Hiz/D9JjcTIseQtaqubSG5r5
 dOSd+9uVeyw8RXB9C2Ih/EPX4xEueMGLC1MU9kLsj+PC8m5v8wYqQfVKtcXutDbYPwT0
 MXNOdkFi9rjoFJoXkqFOik2PEzBV5PhGNnWB//irbNqSTnVYnYEzxMxyeav+Nm9I9BvJ
 7YlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863085; x=1711467885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NFX4++ImuD2EMXqBk24v8xDkpJQsfeFGsz4R2q2Dmzg=;
 b=vZJswa0GNpIhIz72wHYq//QmbKp5NuMq+DFFdMSogK77rbPDCWQ9jinjTTennnmVTb
 U94N89kHGBwZxx3u9LyTCiWOhS+LUoNd4ZqXymFeb/BxLBChFSpitHkrwJfZbiLs38sp
 kfuFwYMoh2HTljjBGJapQ4DKTANzNWfPHI0cZ09fgHUZD7t3Y9olUqaWXc9oyzQ1nDSA
 pXWX4PsOjxyOh/aU4i//T4euLexiqTmTnj7B+0EtfuTZuGgQsDhoxeZh47/ZRYX8DJYn
 TpGkeVhJXBwdcaJyVsoiVYhThccwcEyU7kH4YcGi+qQNpKwWli2Zt8wxCOVatr5mMDpY
 A/AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtbA03O87KufzzwxfVqHEGYNYMp018ut65hkdaWbc0SZwIimhWBmhus+edeB4G0jYvJLp52G3X18F4Zmz19PedVR4C
X-Gm-Message-State: AOJu0YzrSuDO0Mrtz1aSx7bSbtlHBAh0yN9l1Upp3yZdiInhEdPfcIMD
 KEm9ZMn+XQplZ3CtaOSVa3ndqI2JnfPRq2wPLacuYBrdn0YFeJxfKuYZc4lzCgA=
X-Received: by 2002:a05:600c:1c15:b0:414:c64:f3d0 with SMTP id
 j21-20020a05600c1c1500b004140c64f3d0mr5088397wms.27.1710863084853; 
 Tue, 19 Mar 2024 08:44:44 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a05600c4f9400b00414610d9223sm4091610wmq.14.2024.03.19.08.44.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:44:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH-for-9.1 18/27] target/ppc: Convert to
 TCGCPUOps::get_cpu_state()
Date: Tue, 19 Mar 2024 16:42:47 +0100
Message-ID: <20240319154258.71206-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: GIxtXs+d8U+i

Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state(),
unifying with the method declared in target/ppc/helper_regs.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/cpu.h         | 16 +++-------------
 target/ppc/cpu_init.c    |  1 +
 target/ppc/helper_regs.c | 13 +++++++------
 3 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index ced4e53024..6aa18db335 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2716,19 +2716,9 @@ void cpu_write_xer(CPUPPCState *env, target_ulong xer);
  */
 #define is_book3s_arch2x(ctx) (!!((ctx)->insns_flags & PPC_SEGMENT_64B))
 
-#define TARGET_HAS_CPU_GET_TB_CPU_STATE
-
-#ifdef CONFIG_DEBUG_TCG
-void cpu_get_tb_cpu_state(CPUPPCState *env, vaddr *pc,
-                          uint64_t *cs_base, uint32_t *flags);
-#else
-static inline void cpu_get_tb_cpu_state(CPUPPCState *env, vaddr *pc,
-                                        uint64_t *cs_base, uint32_t *flags)
-{
-    *pc = env->nip;
-    *cs_base = 0;
-    *flags = env->hflags;
-}
+#ifdef CONFIG_TCG
+void ppc_get_cpu_state(CPUPPCState *env, vaddr *pc,
+                       uint64_t *cs_base, uint32_t *flags);
 #endif
 
 G_NORETURN void raise_exception(CPUPPCState *env, uint32_t exception);
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 464e91faa2..673559b444 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7362,6 +7362,7 @@ static const struct SysemuCPUOps ppc_sysemu_ops = {
 static const TCGCPUOps ppc_tcg_ops = {
     .initialize = ppc_translate_init,
     .restore_state_to_opc = ppc_restore_state_to_opc,
+    .get_cpu_state = ppc_get_cpu_state,
 
 #ifdef CONFIG_USER_ONLY
     .record_sigsegv = ppc_cpu_record_sigsegv,
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 25258986e3..e62591067c 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -217,25 +217,26 @@ void hreg_update_pmu_hflags(CPUPPCState *env)
     env->hflags |= hreg_compute_pmu_hflags_value(env);
 }
 
-#ifdef CONFIG_DEBUG_TCG
-void cpu_get_tb_cpu_state(CPUPPCState *env, vaddr *pc,
-                          uint64_t *cs_base, uint32_t *flags)
+#ifdef CONFIG_TCG
+void ppc_get_cpu_state(CPUPPCState *env, vaddr *pc,
+                       uint64_t *cs_base, uint32_t *flags)
 {
     uint32_t hflags_current = env->hflags;
-    uint32_t hflags_rebuilt;
 
     *pc = env->nip;
     *cs_base = 0;
     *flags = hflags_current;
 
-    hflags_rebuilt = hreg_compute_hflags_value(env);
+#ifdef CONFIG_DEBUG_TCG
+    uint32_t hflags_rebuilt = hreg_compute_hflags_value(env);
     if (unlikely(hflags_current != hflags_rebuilt)) {
         cpu_abort(env_cpu(env),
                   "TCG hflags mismatch (current:0x%08x rebuilt:0x%08x)\n",
                   hflags_current, hflags_rebuilt);
     }
-}
 #endif
+}
+#endif /* CONFIG_TCG */
 
 void cpu_interrupt_exittb(CPUState *cs)
 {
-- 
2.41.0

