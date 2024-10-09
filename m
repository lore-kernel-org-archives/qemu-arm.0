Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp532008njl;
        Tue, 8 Oct 2024 17:05:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUMLs6li+KEdj5pi9rcwsbx8Z1UXRJCQGDq5T+FUvn36/m0A/YozW5t9KjpuwNc8gtsnIMXivRuAeQ7aA==@linaro.org
X-Received: by 2002:a17:902:db10:b0:20b:b39d:9735 with SMTP id d9443c01a7336-20c6379016fmr11478615ad.54.1728432302898;
        Tue, 08 Oct 2024 17:05:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728432302; cv=none;
        d=google.com; s=arc-20240605;
        b=ec3xUfN8gTWK8528sB1KIH+LkNbKDOyzSVFfdB/R3xv+l3YuI5CJOLnmjLb+rZfQwb
         sAY0pcQq7y062kaFmJjps4Enli9eNC8lXaZ1IWJdXybDn5EN96F5/iHcSDUix0XOl2aQ
         rzLKqh0AI0IXPxWJV+czBw1dI+0+5STwH8j63vdQZlKNYfbdzo9E1tkpagsdwZd50sRi
         bJJ+ERdW5W7WJ/mhtwUGn5czEsPdyWYI9erNMyDAvGFftGXpivs1d7OW4g4cfiVS8kW6
         6T5jSSehITJkSRTAU9NTqD4J1/CFTtyUGfbAPtLWEQ15nSDyWYSsKX7RC6q0aEo7bxgk
         PvKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZMaSkZRoz5YPXdGi4Fagk1yb2WqLYDqE0+TVeXDEoMY=;
        fh=lMDWOfxjrxjJ3TkeY0+ihTKwv3fqo0+Af0gIV5B4vfQ=;
        b=RSXcFLWiUIcv1BMhQfAB0cwlZs60mjk7nPZPiNLZSTcK8W6HhQqFJA61nKIjza3p4m
         FYwYelWrr3xZ7D9Bue2WNXWuzgVuW5hsltpfI+k6/bObe+fA/NVYdR1TMeSGQLNEsxrb
         CtPcEkfPqdv2exJx54N/tsLK6TEu0EEuqQPMNTc0vgjZa/7cVfXsVHCsjLybZWLqyvdv
         pOU8qZVsVqGbYTyogfOtadoXOlidiNSgiiEf9brqs+zgnhh2NuH4TxsfcuEUiHnc4O7l
         P2K9IG/7OCYJCEnNtm8UEQJPxCLJRZyhSmKJ2ANzeYNYGqiCJwmopKu6CCJ4zVqznGY/
         leRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ta+2Mg22;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138fd17esor48332365ad.11.2024.10.08.17.05.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 17:05:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ta+2Mg22;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432302; x=1729037102; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMaSkZRoz5YPXdGi4Fagk1yb2WqLYDqE0+TVeXDEoMY=;
        b=Ta+2Mg22QdiOVRUgCvTHJGXcQJQ49hPydEj6B7M6FtEZNzagHaXhsIq3r+NlIWJca2
         y9vlF5FQ8BSkaELjn7q2zTx4TcoFcOr3uLtCYzXRA5HAOSWVSMUkaN+82QjjDC+4Hd6q
         lhTpSN46ZtBzw0tjm2jjwkSnQvR8CvqupMjY/0AABR/huh+QtQ0gMG3WkW6l+83/8awH
         bnpCq1nQAbjIEJ2TJkDGC6iat5VG+qxw6+H4x/6R5K3WyVf57NZO0CXLM/LDg9VrJpQX
         wTOoEXOucxheHq/dwYb1qiKGSdSGHW/HixfRl9F3nBK5eLfIhkvEPB4rn5StOMFpx7+O
         8F5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432302; x=1729037102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMaSkZRoz5YPXdGi4Fagk1yb2WqLYDqE0+TVeXDEoMY=;
        b=NdgfZoomNxCCyE50LC9Onbz1vO1VEcwjuDpnQ2+vSBaKeNAqXWDELEm5huDwX90gdy
         +bgTfbIvtolTYtCf+lNX4o80CJjEadO3X2cH1wHsng9J7hCc9K/lIHiqzuxoqArzegML
         unwYhc28MudoAI2te+fONec312swPzdYMNHvRvJm2YemQZxrgkpktYxt+thfOFyPqPZb
         H1dz3u54wNlPoKqyIrXYoHWxJWFzT4Fp6NwXirErh9K357G2g7UW4LKcy4BH8dX5NUa3
         fhu24F0OlpVPQEMab92daB+HvDioVGL/3rh5vn05Xmbu8PdWNXT9YmmpSXpTSvYUQ02x
         t/gw==
X-Forwarded-Encrypted: i=1; AJvYcCUnWQxcut1RXnlKzTtYElFPlMGLhl6zT2kzNX07hr2JNzQR7ItX1svbtyO/sLTdvw7d4yCqjkBa8/2GyA==@linaro.org
X-Gm-Message-State: AOJu0YyZmp6N1mV+SA+Nd+nvv9sz/fTh0cm7u8QPTES8jglZ+ArPwomC
	WzJmJmhG1QnrNW5MusYayIth0XGGnMtWnNMiiDkwuxvjlfqPRviTkkOSMt6VZj91uQ==
X-Google-Smtp-Source: AGHT+IH7ittC4fNcWZZnvUvR2MzaRIxXqIaW0oGTZ44MyvMuTJp+JuwMH0O7T03auchaNuRqnZyQ0w==
X-Received: by 2002:a17:902:f54c:b0:20b:79cb:492f with SMTP id d9443c01a7336-20c63780152mr9718395ad.43.1728432302402;
        Tue, 08 Oct 2024 17:05:02 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 07/20] target/hppa: Add MemOp argument to hppa_get_physical_address
Date: Tue,  8 Oct 2024 17:04:40 -0700
Message-ID: <20241009000453.315652-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009000453.315652-1-richard.henderson@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: L8p69fS8QPm4

Just add the argument, unused at this point.
Zero is the safe do-nothing value for all callers.

Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/cpu.h        | 2 +-
 target/hppa/int_helper.c | 2 +-
 target/hppa/mem_helper.c | 9 +++++----
 target/hppa/op_helper.c  | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index f4e051f176..526855f982 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -369,7 +369,7 @@ bool hppa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 void hppa_cpu_do_interrupt(CPUState *cpu);
 bool hppa_cpu_exec_interrupt(CPUState *cpu, int int_req);
 int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
-                              int type, hwaddr *pphys, int *pprot);
+                              int type, MemOp mop, hwaddr *pphys, int *pprot);
 void hppa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                      vaddr addr, unsigned size,
                                      MMUAccessType access_type,
diff --git a/target/hppa/int_helper.c b/target/hppa/int_helper.c
index 391f32f27d..58695def82 100644
--- a/target/hppa/int_helper.c
+++ b/target/hppa/int_helper.c
@@ -167,7 +167,7 @@ void hppa_cpu_do_interrupt(CPUState *cs)
 
                     vaddr = hppa_form_gva_psw(old_psw, env->iasq_f, vaddr);
                     t = hppa_get_physical_address(env, vaddr, MMU_KERNEL_IDX,
-                                                  0, &paddr, &prot);
+                                                  0, 0, &paddr, &prot);
                     if (t >= 0) {
                         /* We can't re-load the instruction.  */
                         env->cr[CR_IIR] = 0;
diff --git a/target/hppa/mem_helper.c b/target/hppa/mem_helper.c
index b984f730aa..a386c80fa4 100644
--- a/target/hppa/mem_helper.c
+++ b/target/hppa/mem_helper.c
@@ -197,7 +197,7 @@ static int match_prot_id64(CPUHPPAState *env, uint32_t access_id)
 }
 
 int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
-                              int type, hwaddr *pphys, int *pprot)
+                              int type, MemOp mop, hwaddr *pphys, int *pprot)
 {
     hwaddr phys;
     int prot, r_prot, w_prot, x_prot, priv;
@@ -340,7 +340,7 @@ hwaddr hppa_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     mmu_idx = (cpu->env.psw & PSW_D ? MMU_KERNEL_IDX :
                cpu->env.psw & PSW_W ? MMU_ABS_W_IDX : MMU_ABS_IDX);
 
-    excp = hppa_get_physical_address(&cpu->env, addr, mmu_idx, 0,
+    excp = hppa_get_physical_address(&cpu->env, addr, mmu_idx, 0, 0,
                                      &phys, &prot);
 
     /* Since we're translating for debugging, the only error that is a
@@ -438,7 +438,8 @@ bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
         break;
     }
 
-    excp = hppa_get_physical_address(env, addr, mmu_idx, a_prot, &phys, &prot);
+    excp = hppa_get_physical_address(env, addr, mmu_idx, a_prot, 0,
+                                     &phys, &prot);
     if (unlikely(excp >= 0)) {
         if (probe) {
             return false;
@@ -678,7 +679,7 @@ target_ulong HELPER(lpa)(CPUHPPAState *env, target_ulong addr)
     hwaddr phys;
     int prot, excp;
 
-    excp = hppa_get_physical_address(env, addr, MMU_KERNEL_IDX, 0,
+    excp = hppa_get_physical_address(env, addr, MMU_KERNEL_IDX, 0, 0,
                                      &phys, &prot);
     if (excp >= 0) {
         if (excp == EXCP_DTLB_MISS) {
diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c
index 7f79196fff..744325969f 100644
--- a/target/hppa/op_helper.c
+++ b/target/hppa/op_helper.c
@@ -334,7 +334,7 @@ target_ulong HELPER(probe)(CPUHPPAState *env, target_ulong addr,
     }
 
     mmu_idx = PRIV_P_TO_MMU_IDX(level, env->psw & PSW_P);
-    excp = hppa_get_physical_address(env, addr, mmu_idx, 0, &phys, &prot);
+    excp = hppa_get_physical_address(env, addr, mmu_idx, 0, 0, &phys, &prot);
     if (excp >= 0) {
         cpu_restore_state(env_cpu(env), GETPC());
         hppa_set_ior_and_isr(env, addr, MMU_IDX_MMU_DISABLED(mmu_idx));
-- 
2.43.0
