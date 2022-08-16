Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2009022ejf;
        Tue, 16 Aug 2022 13:34:38 -0700 (PDT)
X-Received: by 2002:a05:6870:d6a3:b0:10b:df7d:8243 with SMTP id z35-20020a056870d6a300b0010bdf7d8243mr171274oap.68.1660682078213;
        Tue, 16 Aug 2022 13:34:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682078; cv=none;
        d=google.com; s=arc-20160816;
        b=ppx/JgPL/wMdVzzAiLxwIu1OPQZk3WySmwPGZSVHQpAzJyjpK4Uhq2k7DhnuEPeadB
         vPxTrLEAeEfMc2nd7t1KofOD6YwxUm1XMZoOStUKxQGST35E4fhgilZiMPCXv/bzwhu1
         UigBE8s6I6vmWBXN+ticbsQPYlam1F/JlyDgI01bouoQ89u/mQ64cSL6KQXtnW3PAR8r
         1E/AnTwKRvbwLylTPq4FWIsIVMb6OahZ7fKESjR+4bBbWZOSg2DB8Uz/SkPEN2blacVx
         32Q2SUf+wsHKkvUJkDfeeobMu8+seigRj0ZiE2j6xn1U6rKqOXsxib3zUilg0EF3QHc9
         QkPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=02+0PqV78M/uqtw50M+3MleQPnTNyfkwEaJtFvLiO+Q=;
        b=mujTsinfVDfH06JzM/2C+BfxksHWvCnbJ29wguiD6pJUOTzN+WD8yK0zOsDy3Fwhhp
         k/QTuuEj/hvVep5+7eeT3i/QPSwTAEk4Pm5VO7f6vC2Bpbmh9iWLBSKNcU2Maoaa2i+h
         BBgpfH3f/V36nSG/IOEKR0yFcAuRzj7Zy7WHlSLzm9DK2VUpzseDsQm0uMDrYLE6vzUZ
         YpD6MdeuPnD2FBI98RrQ1pMuW5bWHKraAseaFhtBqKWhyg7Q5TgYV4Pg1FNhaXAdgkny
         q2rUzn2UkE65FjmzrCtqxGvbGDTGA5uYNbD0GtP59+edYMS/GW0TYqN1umnqSJBXFnZo
         +nWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M3vLF9Hg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z22-20020a056808049600b0033ae05cd3c1sor2712410oid.173.2022.08.16.13.34.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:34:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M3vLF9Hg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=02+0PqV78M/uqtw50M+3MleQPnTNyfkwEaJtFvLiO+Q=;
        b=M3vLF9HgNXhc/1766Egl1iCWJS9pBruT371vggXZsr7+1LxNvOBFaMOURr6r9pzH+q
         4DvWZm1Q+mCvwP4QIsQM1u6xEeTWkkcY49XR6/YJo2Ny+ShjBQAcAdgiEMTxRvD9XIpq
         M0vwo8JT/U6p1jy3wbXy5fuWERXTjh4oxcIqz8neBPuktnYZz27wEsfZ761iUs2+So/w
         7f20AlTumkYTZvAYs7RUDWrU5/W3HTpgPAqzHo+M1DWFODSRSLmp91SI3ingma+3Ns6S
         TFp4foK8WO1DkAjt8pDEWcfdR5pPdTz+PR1KWNUJe9pzDSyLa5phFCxmCF63/35ON7Nw
         kD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=02+0PqV78M/uqtw50M+3MleQPnTNyfkwEaJtFvLiO+Q=;
        b=6pHkHhH7Xp9uqKLa6djAZUtIcnE7DbH1Lz1dpKUOyYWjK2pSYAiAxfC8ymB4tG42Ko
         o3e1QO0H6w77luZaYEp0RQzGsAp106iSQqA23b9tfuFBLbvWMmSVdLbix3L9k1pui852
         PHG1sV7MzEgbkj0NFd/xjTZ4u1h1WnL2Ho6Hlv6cJP+qGJnvO0+CyOTImNr8bjWFoyV7
         UEYCKo5ct4TbKGb0CBdjoeBS2zXyAcm9kTrZwG1HAQwYVYPF+fd6ByLXYfihU+nsN3RH
         rzSnsKASiBr5FcfrWQfdEwvoAumqSax+Mbs23PxprA0VC3XOeqxyT+ZeuUDddYI+rnut
         Zj0A==
X-Gm-Message-State: ACgBeo2YtgkDyj0DpKGZrKAFYB6gWXKYoKLr6LgJv2CJ5FMnTSPw8yWe
	i29BpUECx1vOqVSRlUzzrEu12VP2
X-Google-Smtp-Source: AA6agR5+aB1DKznv1HwcuQIR7e0IiOEw/NSWXQyIWF7lOUYROQ/dgGtzRjVHJvP4KrWnH8chDcKS3A==
X-Received: by 2002:a05:6808:3081:b0:343:56a3:cc23 with SMTP id bl1-20020a056808308100b0034356a3cc23mr153655oib.58.1660682077867;
        Tue, 16 Aug 2022 13:34:37 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:34:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 14/33] accel/tcg: Raise PROT_EXEC exception early
Date: Tue, 16 Aug 2022 15:33:41 -0500
Message-Id: <20220816203400.161187-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: CxLmR+d0YPOx

We currently ignore PROT_EXEC on the initial lookup, and
defer raising the exception until cpu_ld*_code().
It makes more sense to raise the exception early.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c      | 2 +-
 accel/tcg/translate-all.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 7887af6f45..7b8977a0a4 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -222,7 +222,7 @@ static TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
     desc.cflags = cflags;
     desc.trace_vcpu_dstate = *cpu->trace_dstate;
     desc.pc = pc;
-    phys_pc = get_page_addr_code(desc.env, pc);
+    phys_pc = get_page_addr_code_hostp(desc.env, pc, false, NULL);
     if (phys_pc == -1) {
         return NULL;
     }
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 596029b26d..a5ca424f13 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1343,7 +1343,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     assert_memory_lock();
     qemu_thread_jit_write();
 
-    phys_pc = get_page_addr_code(env, pc);
+    phys_pc = get_page_addr_code_hostp(env, pc, false, NULL);
 
     if (phys_pc == -1) {
         /* Generate a one-shot TB with 1 insn in it */
-- 
2.34.1
