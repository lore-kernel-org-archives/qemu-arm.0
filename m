Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19575njj;
        Wed, 30 Apr 2025 23:24:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXi5KiuSlK2tX9sRCek3OyepkdCTuI/7oILsQqSIQsKcBcUg2mMx9qZaFykw7/eUAYx/khIjRwZfKmnuQ==@linaro.org
X-Received: by 2002:a05:6a00:1909:b0:730:9502:d564 with SMTP id d2e1a72fcca58-740477aa3d0mr2581934b3a.14.1746080643504;
        Wed, 30 Apr 2025 23:24:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080643; cv=none;
        d=google.com; s=arc-20240605;
        b=EjHPyEI4crJBtTge9YG1oobkN3vrSDTxXBEMxekYQGrfhNUL4aGKf8mHSefyV86ULv
         4aN2B/fB9QFeghBsnfsoLZO5mekf2EsUgxP+YmglhZTCgNcOEXWUY94Lfz+vfHhJz56q
         DgMrcKkjSefMHW7ReQugy5Clh4uoVwJ+j6FaZy/IT1ojer2OJRvBMglnw3UwjrloXWnf
         2YEE7AinRKtubNCA2k+PyLSUv51V74uiVDcKLedNHo0NDXEN42V7evaSQXJwrXw1sM4F
         DJwL4Ng/mYOxqzY6ElAjE2oQ91pcvnpyPQPark3tHKQ4IijvcmYrhdXgfjKCnWo+ROOA
         duWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=eC/HRV8/2d4cTcu2Y+L56bEld1xnVZxGu+at/3yGTOk=;
        fh=wCv3e+IY4wax7BON/rhjebbkRzJY2JbaWmenVvp72sg=;
        b=jrflSDKqBslUHP9+s/KkRYBEseKtoIehIOjdIsw4ypu7iYijTZWq47muyS7cX/Wv4C
         uKV53HLGSXXHCyIfAPlGbvztwyNVizQDiPtaUbdDP4lPhzDYaSCcs6niD5sjt+9l0im2
         uVZlIhPRExkbHDTylNEOAVlxDQuMkwTmXChAZ5LLaXMrjO6ooNo53nZ5INpicEi7xdrV
         /3Dm6GMur1N6AWHWzyU2V30lfkSjvZx86sLvrHVZDh1PewM9tDYgFowV60TYuoCrsyJa
         UUajyOhCVscNAj1rvzp1s4QQ8K7nYfwln6s1C+6fuMp4mZh/zi58uOIh2rOCxi2LWuOw
         rrvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JRb6WUIK;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404eea58d3sor64869b3a.1.2025.04.30.23.24.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:24:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JRb6WUIK;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080643; x=1746685443; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eC/HRV8/2d4cTcu2Y+L56bEld1xnVZxGu+at/3yGTOk=;
        b=JRb6WUIK+sGGNCU8Qbjnj9l/rkcVK0pmSAcLS9VUyrhB4DI6Y271gH0JmtHaJbDPid
         8c0zAX7ORyWbZRagQ2SGxsBXzB5TBtj/lwu9I/d461bPVfwIOdFsp54Tyv6NnQ7sNlYb
         y/lJdoNTiqTb6XvCcomJWSPb7hOhS6mGNcR6gHYbdVvPYMDYn5THyImT0v5T1dFyfr2s
         IFr2BO/oe3BKIT9m41Fps9Cde+Sgb3uGsdMdnZUDv5ZY7FMWAJwCBQCa/OzuJRSCMbLK
         BmtqXv5duK1IesSeBadTtr43GDJ7ZXFoeLaTB5nuV094Zge2w017CGSRiDY1N/5aiK1E
         /IPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080643; x=1746685443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eC/HRV8/2d4cTcu2Y+L56bEld1xnVZxGu+at/3yGTOk=;
        b=Anlb2fldjaOjTSRnOZPfjjSl30IgWW+4ecAp2O/iAor+j3g7GmfnfBZ9w010YkdzMG
         GtARsxWD82YnZ4xZzK6lc1qkMLWBfHRfk9yhZyw4i8G4XapuNqLUBWVWtkrL/Dw6VtTY
         aRihHth4gBnCM5NmdUki4s+b0HIih/HteNkLlnLj+jp72rcuBdZ1aJN6FaD3FcllF9Ug
         S90/G8jKPSCDwB3uKyhmnfOSyubFnmZA36Oo+JgXUQ75U4lRwGDYIwH3yu+SQGYJcFhG
         X2WQRjvASXQJFk6P+/tCFYjvFMhlF0o00SKZZMMzYjEFOr5I8GkkJvri8rBcptd9TwrY
         KcHA==
X-Forwarded-Encrypted: i=1; AJvYcCVcWMM7ebgi0HFJzurpTbEmcBMC7rDklGub6iuKJwmOcFs/f2Wyy51BUIdESlKm6KiFNpWAb/K7fqBpkg==@linaro.org
X-Gm-Message-State: AOJu0YzEWHdSaJLV5eBEv1O8FzvHyHItabDDoubmtEYdZ4tOPmiD20/R
	dy25serFoY9xw3O/YMGJtpoAWXlJFBC7WipVmjWOTJjIkFoYkuHRFLLJ44ubCJZ6+Q==
X-Gm-Gg: ASbGncuxy56vCbJ/FlgXSvl7DOrTbgaDZpmY8EuJLurtpFCgE1GSyfHk8MUDmvIDAt4
	Y7Uvp0JjVo+oQjlIz1jq7ib3RfrJ3Mrv/xplD7nZ6jf4TpM6FC0+4mFsRX4VSOQUn5fhBoJFRwv
	xaIvs1w7eMDcLYx8h2JhQe1yQ2mUDEWKSXcj2Ux44vQHCPOz95nDNOwUNogwHzQEDm1kD0lx5ZY
	dFvLEpDagsPjvkC4a1i+4PwHdE9OU4w1sasoNqU4agR642jHlN0moEY3eIM6v8GRrmrSQ1IcVBP
	6zm9cdhib2N9XvsxW9KN/OD19n8EBDf+FODa+y99
X-Google-Smtp-Source: AGHT+IHB80u1428PHxy6JDVfoTMR3OZQ1FT85u62QQ1lo3XoiXyKZwox+P7tK2iUDXZ/GGwXnMlKuw==
X-Received: by 2002:a05:6a21:600c:b0:1f5:8f65:a6f5 with SMTP id adf61e73a8af0-20ba8789a2dmr2995051637.30.1746080643013;
        Wed, 30 Apr 2025 23:24:03 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:24:02 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 13/33] target/arm/helper: use i64 for exception_pc_alignment
Date: Wed, 30 Apr 2025 23:23:24 -0700
Message-ID: <20250501062344.2526061-14-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: NTrfCZRn8i3B

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper.h            | 2 +-
 target/arm/tcg/tlb_helper.c    | 2 +-
 target/arm/tcg/translate-a64.c | 2 +-
 target/arm/tcg/translate.c     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 09075058391..450c9d841bf 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -49,7 +49,7 @@ DEF_HELPER_3(exception_with_syndrome, noreturn, env, i32, i32)
 DEF_HELPER_4(exception_with_syndrome_el, noreturn, env, i32, i32, i32)
 DEF_HELPER_2(exception_bkpt_insn, noreturn, env, i32)
 DEF_HELPER_2(exception_swstep, noreturn, env, i32)
-DEF_HELPER_2(exception_pc_alignment, noreturn, env, tl)
+DEF_HELPER_2(exception_pc_alignment, noreturn, env, i64)
 DEF_HELPER_1(setend, void, env)
 DEF_HELPER_2(wfi, void, env, i32)
 DEF_HELPER_1(wfe, void, env)
diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index 8841f039bc6..943b8438fc7 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -277,7 +277,7 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     arm_deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
 }
 
-void helper_exception_pc_alignment(CPUARMState *env, target_ulong pc)
+void helper_exception_pc_alignment(CPUARMState *env, uint64_t pc)
 {
     ARMMMUFaultInfo fi = { .type = ARMFault_Alignment };
     int target_el = exception_target_el(env);
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 43408c71bbd..2fe8ada803a 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10247,7 +10247,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          * start of the TB.
          */
         assert(s->base.num_insns == 1);
-        gen_helper_exception_pc_alignment(tcg_env, tcg_constant_tl(pc));
+        gen_helper_exception_pc_alignment(tcg_env, tcg_constant_i64(pc));
         s->base.is_jmp = DISAS_NORETURN;
         s->base.pc_next = QEMU_ALIGN_UP(pc, 4);
         return;
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 273b860d572..1577ef697b2 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -7801,7 +7801,7 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          * be possible after an indirect branch, at the start of the TB.
          */
         assert(dc->base.num_insns == 1);
-        gen_helper_exception_pc_alignment(tcg_env, tcg_constant_tl(pc));
+        gen_helper_exception_pc_alignment(tcg_env, tcg_constant_i64(pc));
         dc->base.is_jmp = DISAS_NORETURN;
         dc->base.pc_next = QEMU_ALIGN_UP(pc, 4);
         return;
-- 
2.47.2
