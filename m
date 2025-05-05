Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778233njj;
        Mon, 5 May 2025 16:20:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVT2cNIrJ9q4dpkkHLagjen+OPyKtOGsI8JcLfQi2F/nA0Qre5/qR8ke/4D06VxcAz0vWECqi0dc8oDwQ==@linaro.org
X-Received: by 2002:a17:903:1106:b0:21f:1348:10e6 with SMTP id d9443c01a7336-22e32799b94mr18536275ad.13.1746487234413;
        Mon, 05 May 2025 16:20:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487234; cv=none;
        d=google.com; s=arc-20240605;
        b=bhxwVcXFKX8cka62XJ8cR4sOmszKw49beZoIQ8ynPZ0luj4LeDiQRRO8C0jW9lY4SL
         Ckv2taSo6ytS+IdnxEA3zEV1gqrKxZmdAAAM6vuyYcMfXIjqmSRNLMu088YWD37hIfgD
         uYg+e29Y/h1gXhxn/LlgKSRFJk+IFr4fBU+djGmG42D9eNA4RLC8njWsYWKg9LwKLqme
         GpEGjwGCGRjdM/p8070Xp3UzOowFO0MEXReJGHysBVWGxzx+THGmY4vTxLsjL2QWArMp
         Bhx+aoAiEzvdrTaObaRcc049v16wUqis48Gtd1tGR6H4uFvVUFYsP7oeoIDSAG3oPClT
         9Ong==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4MSVLYsQ1aHRPUMsqKWeWNfiw/1OBObe6XUOYFWrKME=;
        fh=SIPJiiZYa2Ty6WVpPanN4/SMYjE+BGLEnoH3VPxlu9I=;
        b=DASMHYY8vXcC1VIQ01KwOFk46bgRIla840Gu1e8anVm2JjUr0I1aDyNgYbsrPQC459
         9sYir0Y/d83pUco8wIy1g/9PDod/xUmUcP2JIcvcxreAcf6gm+bbVMcmVmMd0etk2tzw
         aqIzYT1B/14dgmoZzHH5wFMTC6dF6vKE9KPNAks/q9c/YHen7qRyDDGcXc7G2qWz9NXX
         mEmpCjFoJdBDgCLw7xISEnpEyosSgQJeLd/s+Mf4nQ2q+ks36fsumFDWrcuclojtsQCj
         nf/5uedGJeNBK7n/9zf7X6SvkvsdS6Y5FhIXu0LA4yCXpgh3Si8ZORO2T1/DgsQBiqA6
         6B8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sFI71yqZ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb6c100sor47662135ad.5.2025.05.05.16.20.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sFI71yqZ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487234; x=1747092034; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MSVLYsQ1aHRPUMsqKWeWNfiw/1OBObe6XUOYFWrKME=;
        b=sFI71yqZxRRBrHFIkgNU74pwekyOzejOB1fW3iwRb6pGrtL3CppH9KDJ/zt7wHjl8S
         kpO5BbK08d31Re+sS3oc6ok295ZAU9pqOMQ4zFvs9x3uFs+pyjNecC33pHa4eCosKb0k
         LvWIF1SmHpoZQfaXN6WBoKU2eXxDn3ErDhXQL+wd7Sjb0dAe2zzDbPINMAzZABLhOEPa
         j2BRPUse6FL/0sJVKQuj8TSgOlbGX8ak3u241azKblVZOeAN2l4VXWRzCQRUJwX7prgu
         ZEOMHrXW35MbhFeo6kIJE/trNqNgCgl2nwR8W6whP9DOMo4Ayelnaybsw8JfnHq2Vda7
         LFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487234; x=1747092034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MSVLYsQ1aHRPUMsqKWeWNfiw/1OBObe6XUOYFWrKME=;
        b=QWO+EP460rEeFF0IJRiC5GxA8tK27Hu0zhkqKZixvaIfimEoMIggmJs5VzWBd6pf0l
         sigGxaBmhfm9XPUUEVBLT6+2w8oQQOvU1DKBmeRcsXZDbZpIsdmSs7fpia3GPQf/qP3m
         WGlYYyHkynf+gYKy1z0Lh2HBJdP+agaYrhttnu1b2rJzSuIkKalKWRYD4Xozge4yY3nO
         d34pq9y6EQb+Pm8grcOgVS3ymztZu4dXIIHEuJ8lsBW7XZQUu3ndn0VXd4snEqFRNvXk
         wj8nlW5ob9eFeugowzZ4HGI0xTsJY8IhHGDYdmHZpFDCmlzRsmsq2mrwKCFs7UTiciFu
         VaIA==
X-Forwarded-Encrypted: i=1; AJvYcCWKX5K2GU/ufXZHYUDoZnnYyETBMEewILZ6wR9BmL76esU0knTXDG4+M/im65Z5QGDwZAI2fU2g8lb+gQ==@linaro.org
X-Gm-Message-State: AOJu0YzF4y6RfeoIA7f9huFbzjUMZC3259QkR0LBRtLJeFhkqjTAw6G/
	Z6/7ioSGVbDw4ocpFBzFKkydPXs12GYK6G7bHEPeMa+GGG7fnBPLpZc7Wmqz5nkSaQ==
X-Gm-Gg: ASbGnctExndeOeLFNCDl36yqx0ElyPJVMANLlkV8esWB6VyA27tfMQJ80thl2RKROsc
	PhvMIUmbXLYrEni7jesAuXPtkljc7IUVTZUvZvdsXGRmdq6NZkwwSZ46i5etpNPu+AT9HmUIQGY
	nBX109ry/DRehLsatVVdm4W2dtcOzUqcfNX+SYiAE/ynj6nmjMj5ivbB9OZEAlsjYjIo1d1hzOE
	blZaJ15KJE5A20iIymiGwMfvDgNfe2+HZFpVgvY+CXbKpxJhHkMPX/7OT200ylfxcXRCOFlWk3a
	Lucm8e6VhjGm6kXWeouXS0rxEqCZ7GMWZD/owDQw
X-Google-Smtp-Source: AGHT+IHTINwaey7ySLvXtg1QPxU98WusV/OE2FldyD8VBKMIteaxM9KIYsWwhG915qemWBZmFL73qA==
X-Received: by 2002:a17:903:906:b0:215:a303:24e9 with SMTP id d9443c01a7336-22e31f7e424mr17270675ad.3.1746487233916;
        Mon, 05 May 2025 16:20:33 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:33 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 15/50] target/arm/helper: use vaddr instead of target_ulong for exception_pc_alignment
Date: Mon,  5 May 2025 16:19:40 -0700
Message-ID: <20250505232015.130990-16-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 7+eP6KtYhYWQ

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper.h            | 2 +-
 target/arm/tcg/tlb_helper.c    | 2 +-
 target/arm/tcg/translate-a64.c | 2 +-
 target/arm/tcg/translate.c     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 09075058391..95b9211c6f4 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -49,7 +49,7 @@ DEF_HELPER_3(exception_with_syndrome, noreturn, env, i32, i32)
 DEF_HELPER_4(exception_with_syndrome_el, noreturn, env, i32, i32, i32)
 DEF_HELPER_2(exception_bkpt_insn, noreturn, env, i32)
 DEF_HELPER_2(exception_swstep, noreturn, env, i32)
-DEF_HELPER_2(exception_pc_alignment, noreturn, env, tl)
+DEF_HELPER_2(exception_pc_alignment, noreturn, env, vaddr)
 DEF_HELPER_1(setend, void, env)
 DEF_HELPER_2(wfi, void, env, i32)
 DEF_HELPER_1(wfe, void, env)
diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index 8841f039bc6..4e3e96a2af0 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -277,7 +277,7 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     arm_deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
 }
 
-void helper_exception_pc_alignment(CPUARMState *env, target_ulong pc)
+void helper_exception_pc_alignment(CPUARMState *env, vaddr pc)
 {
     ARMMMUFaultInfo fi = { .type = ARMFault_Alignment };
     int target_el = exception_target_el(env);
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index d9305f9d269..4f94fe179b0 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10243,7 +10243,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          * start of the TB.
          */
         assert(s->base.num_insns == 1);
-        gen_helper_exception_pc_alignment(tcg_env, tcg_constant_tl(pc));
+        gen_helper_exception_pc_alignment(tcg_env, tcg_constant_vaddr(pc));
         s->base.is_jmp = DISAS_NORETURN;
         s->base.pc_next = QEMU_ALIGN_UP(pc, 4);
         return;
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 88df9c482ab..99f07047fe5 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -7790,7 +7790,7 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          * be possible after an indirect branch, at the start of the TB.
          */
         assert(dc->base.num_insns == 1);
-        gen_helper_exception_pc_alignment(tcg_env, tcg_constant_tl(pc));
+        gen_helper_exception_pc_alignment(tcg_env, tcg_constant_vaddr(pc));
         dc->base.is_jmp = DISAS_NORETURN;
         dc->base.pc_next = QEMU_ALIGN_UP(pc, 4);
         return;
-- 
2.47.2
