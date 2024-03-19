Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1384181ejb;
        Tue, 19 Mar 2024 08:47:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWYdW6gS189lHDobLS0ofNnyPtnr2GHCjW83NMYQrLPnXAgxdMubEPoksHQlfP07lUy2gkNIfP77P5MhA2waiNevmAfKuKj
X-Google-Smtp-Source: AGHT+IF4ilEf0ag0VZblDQr70JowXPcq6z/ghFiQ+9B0B8PnIP6OfBAstly22gxSnh96X+iOcM58
X-Received: by 2002:ac8:5895:0:b0:430:da8f:e9be with SMTP id t21-20020ac85895000000b00430da8fe9bemr4416637qta.4.1710863234884;
        Tue, 19 Mar 2024 08:47:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710863234; cv=none;
        d=google.com; s=arc-20160816;
        b=eac2Tu5Shk21jcBuNDjkGF+Tj54PMrID1ksTdWmGS/sg0TfbxdhDAGtyEEhAorakfl
         BMsXceRJBA1sd2DSQrBPwSBV8iF++XHhFvAt7Jwj/Ap430Y2uVdl5nb2OheLngGueA7e
         H0c6yKf8gMgTi21GDtyAUHFTu/baxSpx2Xpw3H7DJ4BxcjAuxEVGIIcwmC8PYqS1rVvh
         BDCIPSaKqNWRlHzNKCbBxlnjmmUTSVE/IxSFd9jwdcc9chK2kO0pxp8z0XUiyJ5v2XA9
         qLjR6JqXWSI8U1zxc0mxcKvPcBIblcerkN5Aq0UvNlxf4QywBa6Cy7lyRWvRdF+xotnD
         vrcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qQ0F9e1tiLbg+1mSpsh71oFSOMQcPQZFv/kc9q+gvBc=;
        fh=ETJafJGTWPK3wurUXbrxbKAuYFlHIsTbYjnbX2PHr2s=;
        b=B9uF6x7yLkV4UQzBb6etdX89T8xDeGuIeYv/Nmp0qSJ8G8ZPwJ+ZPhde1LSi5jjdb8
         Etuk7A5eVRB8uFiY/NkU2AQoWhVWFwM5vrkPW7Tk1js+QaplHJ7KQgvBEgoGNpZ9IdM5
         NuWFdC2jodfZeuX615Kp3/jMW0ZNC8gRdSYh3RMTUK5GeOrxTrb6Ub6OHI16PoS0/ctq
         O5VHmWizUgl5RyVgTiyISkUF9xAf57j8ysABDyBOVPBLNy/JpaRD/vChaN4BBnYK0PW8
         b4ZQK4mhfMigO+MlrUB+aXIgwYC+6ZQrzKodmMi2/cmtqpj0Rj7cOS54tVfgz1S4vMP6
         yD2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U3+Hk1+1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7-20020ac85c07000000b00430c6551c35si6458842qti.364.2024.03.19.08.47.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 08:47:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U3+Hk1+1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmbcd-0005PQ-TH; Tue, 19 Mar 2024 11:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbca-0005N2-Fw
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:43:24 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbcY-0004oo-1q
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:43:24 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33ec7e38b84so3399186f8f.1
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 08:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863000; x=1711467800; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qQ0F9e1tiLbg+1mSpsh71oFSOMQcPQZFv/kc9q+gvBc=;
 b=U3+Hk1+1IjfFgD9aUYE90eQUkdWhVW7+WQckOfPjvpH2kLWDDBY266+fl9Ic9II09V
 AQPHxh4jYUboYmFXULIrNLfvr8VA0bPwMqrO3iZwe6BXskLp8lthxNNEdGhcSByFn4cD
 R+09jq68w/x3ZYk2cX+nXKwUbbwG0tll+Fcico3pdySZyuynb1rBaGEh9qdrkzRqQxjX
 xW1cVi+KhUQEAGleQzcL47orwYrsUWQqDLqOZ6rtw8fyZv2VP3tBU+jGmXXQqNNAQ9/o
 jSEiD4ieZWNXeQ1XatVYbz0OxDvEL7TCgyb6FZVHPc1qcjJ8xkBlOZK1mKt0whmV6uKN
 nn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863000; x=1711467800;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qQ0F9e1tiLbg+1mSpsh71oFSOMQcPQZFv/kc9q+gvBc=;
 b=SL60SsGv+ZGDgcGKyeV+v7IiVgmTOQKjogV8K9dqEanECX95CCxVPdBSApKtkqLGs1
 vXbe2smpV4yZTIaLcmWpYPSLUMjQ5MH/nSQ7IB3E0/iDrY/IswQO1cZ2kQAkYdAOTuS2
 F/IZwVFtvnSyyzIqQpYhJBTG4HCn9lef1MFlqU+imwBNhPf7wAuDN4YxqMSRYIM4gtih
 EEe+1xGIPk57HuEgxAPxP8GDXEbPZhwyQ/nIiz2IIiDRkFHdGBdRtGYvzpNOOTLbNrb8
 TRI2QhnNuDa4DuGnntiVpW4VgRtowrL7kIFRzXhPD3gWOGcI9JGakL7une/pzEQa8TeL
 iTxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjPJ7qXiADyX+ZLeFK4mUPOd2csn9rbOHSg6uA/fEPBQy95Nol7D+1DAakGB+W/HBw9rxJ62tf69FmfUmbC8aI+DSn
X-Gm-Message-State: AOJu0Yx96hYp8j1Dyt3OlX8W4O1BgZJxj+XRSCXn9v+bRqsPshCc4slu
 v4jRehj06ie9N4XLctGjjzM8QP539oxG1iR+xd/kCXALbNVjeWPIleYRMaQ+hFA=
X-Received: by 2002:a05:6000:184b:b0:33f:8e6d:ab7c with SMTP id
 c11-20020a056000184b00b0033f8e6dab7cmr8021706wri.71.1710863000174; 
 Tue, 19 Mar 2024 08:43:20 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 i2-20020adff302000000b0033e9fca1e49sm12609575wro.60.2024.03.19.08.43.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:43:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.1 03/27] target/alpha: Convert to
 TCGCPUOps::get_cpu_state()
Date: Tue, 19 Mar 2024 16:42:32 +0100
Message-ID: <20240319154258.71206-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
X-TUID: xZZIaGUXqoxd

Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/alpha/cpu.h | 13 -------------
 target/alpha/cpu.c | 12 ++++++++++++
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 16b0f8a097..b7f294d08a 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -467,19 +467,6 @@ void alpha_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                      MemTxResult response, uintptr_t retaddr);
 #endif
 
-#define TARGET_HAS_CPU_GET_TB_CPU_STATE
-
-static inline void cpu_get_tb_cpu_state(CPUAlphaState *env, vaddr *pc,
-                                        uint64_t *cs_base, uint32_t *pflags)
-{
-    *pc = env->pc;
-    *cs_base = 0;
-    *pflags = env->flags & ENV_FLAG_TB_MASK;
-#ifdef CONFIG_USER_ONLY
-    *pflags |= TB_FLAG_UNALIGN * !env_cpu(env)->prctl_unalign_sigbus;
-#endif
-}
-
 #ifdef CONFIG_USER_ONLY
 /* Copied from linux ieee_swcr_to_fpcr.  */
 static inline uint64_t alpha_ieee_swcr_to_fpcr(uint64_t swcr)
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 05f9ee41e9..7efeda02dc 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -49,6 +49,17 @@ static void alpha_restore_state_to_opc(CPUState *cs,
     cpu->env.pc = data[0];
 }
 
+static void alpha_get_cpu_state(CPUAlphaState *env, vaddr *pc,
+                                uint64_t *cs_base, uint32_t *pflags)
+{
+    *pc = env->pc;
+    *cs_base = 0;
+    *pflags = env->flags & ENV_FLAG_TB_MASK;
+#ifdef CONFIG_USER_ONLY
+    *pflags |= TB_FLAG_UNALIGN * !env_cpu(env)->prctl_unalign_sigbus;
+#endif
+}
+
 static bool alpha_cpu_has_work(CPUState *cs)
 {
     /* Here we are checking to see if the CPU should wake up from HALT.
@@ -194,6 +205,7 @@ static const struct SysemuCPUOps alpha_sysemu_ops = {
 static const TCGCPUOps alpha_tcg_ops = {
     .initialize = alpha_translate_init,
     .restore_state_to_opc = alpha_restore_state_to_opc,
+    .get_cpu_state = alpha_get_cpu_state,
 
 #ifdef CONFIG_USER_ONLY
     .record_sigsegv = alpha_cpu_record_sigsegv,
-- 
2.41.0

