Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756129njj;
        Sat, 3 May 2025 22:29:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXOpymrxCVLn0e2ZoyXWr+W/hUsunOl63EAjvGVzBQU6dtPBEHSxwS5P+AryP9O1OhBKjKbKex/RQu3Qg==@linaro.org
X-Received: by 2002:a17:902:f70a:b0:21b:d2b6:ca7f with SMTP id d9443c01a7336-22e1eae4106mr45292705ad.32.1746336573936;
        Sat, 03 May 2025 22:29:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336573; cv=none;
        d=google.com; s=arc-20240605;
        b=Canx4ouHjX4TO8GB27SZrU9ISZ2eCYTDLS8QKh8rZMURIE5Bm2C2pvOnUvSDXZ/3je
         9GB5sfOODmSLO3Sp3KHUQv9KPZEwr2iUR0ZFvGaH3ZfsqrhQkR9Uqx4MBRHfB834nhXP
         7ryGpHxzHpxL/MEMHw9ImaBB7cxnKixbuQjZIBMHWMy+ch9UsZAKHvca51orjQdnsjbG
         yB7fEd61vyaIm+JH4fY7UaCfFnL9n4Fu01LnsIBfSpix7LAZhmcYxvYlg2HTh317/O2R
         9aALl20RvplwvhcvrAlXLjtPLuLotLbLFNtm7lomZkyS6C3jDB4ZTl79BKGUuZOvwLih
         OhDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WzMy66shbPXXlyjnEns4rH7PvNwF6buM8qH1Xg0FZ+4=;
        fh=4QfdGxfBo+DinGaweBdkE5TLjCtRe8+4ke2Y9wCH10Q=;
        b=lx/V3+40BD5a3zffVuyFsmYPE1eN4SyaixtIYARjRcMEPD45YwXKHlSCRElHDIhykM
         DL26D6GG2gK1SyLt5SJ1P7xaZwp0ox7MnM+LZYTHcQ2bwJmwHXDrxjzwGnOT89KL7fvZ
         DqB8QrEQCB+m66I+Gf+9ZcGktDmo10ctIc02lG2slSN54DYfqJ1o1IrIq4mWSRWUusMC
         Z7RH81/910+bO+f7c8sO5W2oHML/gPBQs3E1yyEQ6PFn1cJ9Ayyjm8aS+2bkE+hAjpgV
         rlKNWRMzgopD72Arwh7SVLHcSOWlWEVoHVVsSVZ90NCBf2mtbzllu2QNvyyv28s4FXC2
         ecng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Am8XPSa2;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404e5a32e7sor2655940b3a.0.2025.05.03.22.29.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Am8XPSa2;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336573; x=1746941373; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzMy66shbPXXlyjnEns4rH7PvNwF6buM8qH1Xg0FZ+4=;
        b=Am8XPSa2LARpe+txrKregEfJLttCiLXoztHmKgZ40rFKnPJMpbBpgWxl8yg8osGjWg
         G/iWKsrpYJZ4kS9uaJAJhdcQC8XgCRpNj94J6kl1et2JJuH/0EenzBrn0/nM/hiUb+P2
         Bn2zuFVlTUHRyybxckQmbV18WfORaGWFrSNeD9PBkDpR/aQw44VVZPHXh4IdqQIhrOKK
         UQqYvikymG/K7gzFd45j5dZbEPwsylx4Q5x3goigr69vn6uu8sYByDWLS/DgwHA52N8C
         UNMLgbMsCy1yzeIreqZUynBb7YeRL6FrESaAomC+GmMMwGcd0yN1WVUst4AbMWpSy2q5
         /YrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336573; x=1746941373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WzMy66shbPXXlyjnEns4rH7PvNwF6buM8qH1Xg0FZ+4=;
        b=ZwqO4g/6uofxJFpjiEZHrGyQZr+ikvXLteTVFjrEuyrCNfQoMEXvcpYe2yo8dChiiA
         RDpo71QqJq1SxiuO22vN0PcjXTYrzlUYbwTb5HpKl8fqpMv3xSau173Y1u3XWlA4qk/W
         uiLqyMwUUEfyc9vNbPRrkLYegy0qabMWoiw4WZ6YLvvte6rgy2c8smCu3PLLc08aNlqG
         lSY5Qv+bMOLvEu+jBZp5IUkPV3paFmVzFdjVN/9TKNJzEITgTcPtzchdOTAJAEHRRmyr
         fJogfElT3MasKnYo+1YP8YoDtPE1OtxQ8AognL5oJVPB/Zs5LVAgyMzUk36GntCJndym
         o0Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVTnSUdaVplS/44yfX+pw6XxQv7AwCtLXqnEp6v/BI2li7lWTFffHUFhnzXN9bo19SASvn9I1o2Us0glw==@linaro.org
X-Gm-Message-State: AOJu0Ywbn6xJB7JFBPFO8I1A4VNz3tV05WGWq1tOUBrDnq13nk4WkYSN
	EA30Q+TdmzMuNMzTVDcoaBZIsRicFuilnrxFLSbP9B3VasXvjim2w76W02z+EcGxHA==
X-Gm-Gg: ASbGncvYlz4Jtu377rOl8upnK14fg2U95X6xCP6FGkM0F0aKilvNB0F1WfYhx9TuTYL
	CUL3rrUbIZU+VmbBI0j2+VsRHtOKCzpOGSeaJqX0fSHn5PDhTNwC/dDo55Rp1R9RhXKZkSjmf48
	8d60uI0FApv+uqlH6TraHbcqV6zP1StAqWBIKaqlWkTUpoQj3tBQrhCamjEEwQhjaiN/FUZ3CDJ
	DHBu6eZfxpkixtoQB5sicIhrPyOvD5ugijwVenyGkspwe0KXt2Jcq8IUjbyy0HsvtXMwBA0P87z
	qPRR6vRN2vbKIy3GT84nqPNKBMMm3n2BiucBezLS
X-Google-Smtp-Source: AGHT+IF3MsqDxnvukykvE/6O00kSUuX24CTMca9uQ13CHCSwtTjTadd/FH15AOifa1kLNKXwqjQ+ZQ==
X-Received: by 2002:aa7:9314:0:b0:73e:30dd:d14b with SMTP id d2e1a72fcca58-7406f1769e2mr4015705b3a.15.1746336573425;
        Sat, 03 May 2025 22:29:33 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:33 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	kvm@vger.kernel.org,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 15/40] target/arm/helper: use vaddr instead of target_ulong for exception_pc_alignment
Date: Sat,  3 May 2025 22:28:49 -0700
Message-ID: <20250504052914.3525365-16-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: OOgPttDJlcSH

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
