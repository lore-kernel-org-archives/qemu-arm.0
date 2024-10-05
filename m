Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1147637njb;
        Sat, 5 Oct 2024 13:06:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWfiOcayddYsmE0sImBJuLyIs89vrs40PLxb2LtZKs00kxK0BynIcHTFbK9GAGQ5vMjYrSoXxSMqxEL8w==@linaro.org
X-Received: by 2002:a17:902:e751:b0:20b:5e34:1842 with SMTP id d9443c01a7336-20bff5517a5mr108488905ad.25.1728158769537;
        Sat, 05 Oct 2024 13:06:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728158769; cv=none;
        d=google.com; s=arc-20240605;
        b=U/7SR39sv4d0woLYTZShoQ2uTNCCH2rsNE69eci+Ru1H1LbO8df0hTgDsRhaQ1xaIO
         aZQYTjFJUsJKxZd2YFRHegptnOjxvnQejCK16U8mOqLEqX/BnoxpJbsbho1lqwQ/vc30
         a3/We4HxVmVmqg79HUy7Lom5X+NE6mLVPwBCiKxcDX7YfFTXwu6nA+O/AVuPSS9WjfBy
         LNPiIqwi3ueVpDr0Zgb/haAz471+27XrPXNZk2JzLzgeXpiUsZ6HeOEckiuky1mFBNDZ
         qXJh5rUMmsz8SmyVi+HhNrSXoDILoZnF7CTLnNAR46PQqBQpkgdzgs7QDEBSntIfBT4j
         Kwqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MP+WvwE/XecW9wPOVCpjk+gA5jxWiH/v3HQ4ejXK7hQ=;
        fh=4G4BdWKN9KMaLkicMFUM3+6yLJrsZIYrmxHWtVXkK4s=;
        b=Jwg24BKwuCmFFZNWwZAt4W5FUCgkFe8Fi2Cyh4mn+0hVaDc66c30Fwsov1nABPMRBK
         pNyaKFKwsnmkpgcyQJ55D/GhIb/gntPmcBWyjfyDj8GsRtiD1YXgY30v7YOSTB+4e4fL
         0fBXUy/Y7VmTneiD8C1s99hetJ/4U1v+vBVmk+6/0CthXBhGUPgWQEGQ7AKioTWSd9nK
         IFV7VM3xzHQXH9cTxAN+hgnCJC6DBscSZJx833YKtWTUKeyE0/1qAHhHi5o/FfdtTzJ9
         ia6wicqO2qNrkNVDwUx1W4XmYpw55mteKtOCxbtbrHlBwL8GfNJ/wkXlJ+DhIyMyDA8h
         WUFw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VUdA1CnK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c13725650sor11175475ad.9.2024.10.05.13.06.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 13:06:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VUdA1CnK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158769; x=1728763569; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MP+WvwE/XecW9wPOVCpjk+gA5jxWiH/v3HQ4ejXK7hQ=;
        b=VUdA1CnKNwJQ0s5H4EjZkV1nUUTXBrF1Y+nuz/CN7Jt4mPA8cecrNooDzHd7DuxcYR
         pLRWJGlyr6G2aT4JFo9QFMizXZaIhiq4q7cPPUlnsRb/WlXXY7ff3t8Nn3nQfc1/MqM8
         mHjjR2m4mViw1Qt8J4iknr6FGTGm1OBNLZ5j1fkEBaYhbKs88lJRxKAoH6g3wlDKDAGt
         NoC5htINVxyVEEIxHBuTcNBdFYYIPP9TCmxtESHnWnv1eln17OlqEYaH8JtLmgyPsCBv
         KKk2BCKTcg7pA8HhO5QRx5BttKRwvsRxJoYq1hwLkdcX7B1CzzafosLyzQmKz/7X3PFU
         OU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158769; x=1728763569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MP+WvwE/XecW9wPOVCpjk+gA5jxWiH/v3HQ4ejXK7hQ=;
        b=xVCvpOI7l3FRviJRjpVkaZrXu+13wtykh7waG7K3NbXo5rNha43uC75q7OzO5Vfwvl
         MU8FTfmzuaqJueX4rl1FAWGG/whIvtoW9AZkA8iHD5rc/mDZxnb85opYfoNxsaVHNXw3
         a2WVPFAgDTOJCAkbTpVMpA6qrXnyOIXXPypFkXt+EJO48YEg/n4zO9tV6D98YZY7qAh9
         3SnX+NVHZDH4Zn3dV3019nB2yMx20QUAqzGY9sfdyoOSffRMEqqA6M8Ti6/faQRwjeMJ
         fuawyezK7uNeY2yzwhJ9ykEubDzl+Ye6I1CN6OYcVwHL/UC3UgIkNIzOdn7qosRPBbss
         8VPg==
X-Forwarded-Encrypted: i=1; AJvYcCV9lFl3XdnRHStnb1rgNhB2Rtw7LLw4kPLmwsv7rcg19dBkVxC25JKGtem4iqsjDkD4wP54sxiKNf7/6g==@linaro.org
X-Gm-Message-State: AOJu0Yz4Hn0TDWujKdq69E+7PnePunE8WctVTcgyr605vydOIxHNwcgN
	WWQanHvq9ZnBHUbSVO7U3odYmVhziqmIJece8J9DaHmIINC+OlUWseMgPSqsnUxVKQ==
X-Google-Smtp-Source: AGHT+IG4o7j/ZFzlHdwrYk17l+PK6a847Ql8/KK14Pm1cpqL+sGkT/q0+Vhje7Ma/G1N+w5P6iDU7A==
X-Received: by 2002:a17:902:d2cc:b0:20b:7902:3456 with SMTP id d9443c01a7336-20bff37ac46mr105992105ad.1.1728158769036;
        Sat, 05 Oct 2024 13:06:09 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 08/21] target/hppa: Add MemOp argument to hppa_get_physical_address
Date: Sat,  5 Oct 2024 13:05:47 -0700
Message-ID: <20241005200600.493604-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005200600.493604-1-richard.henderson@linaro.org>
References: <20241005200600.493604-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: GuSoLV2t5Yo6

Just add the argument, unused at this point.
Zero is the safe do-nothing value for all callers.

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
