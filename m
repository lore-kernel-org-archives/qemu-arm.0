Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178773njj;
        Sun, 4 May 2025 18:52:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV+xvqtHpDJWDHvXhwxiesUT5va59LUo4Z2NZ72/EPdE7wg4oP5y2MCsHa/8Luu3aA4KTF8oCeWQLDMVg==@linaro.org
X-Received: by 2002:a17:902:e88a:b0:21f:85ee:f2df with SMTP id d9443c01a7336-22e1e8e2041mr85663205ad.15.1746409962087;
        Sun, 04 May 2025 18:52:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409962; cv=none;
        d=google.com; s=arc-20240605;
        b=d1BnG/nAEI+cggbOxRj1pqD/40SQvbcoUr2txTSiGbcqbz1aEkMNqWFd/n8gH+uL2W
         T4+iCckvseFcNuZ8vTlngK9UsUMy3SnYpVCrWXBN8fVY2rjctYVw+AxtxLxwU6Vs6Bqr
         jP+udNIMu1PQYPBWmVGomepe0nwt1M+IDxH+hKbNGsUwOs93TRB7mpvTgIfPV1VQOvi4
         ByrKl03L/xNN3ofrnFpGDcYY95MzLv6LjDEiTjz92EB85H01HwiNndzIZ5WkRSMCEHFl
         HiTtLmrnDZl77h1Lk/kEEexkyXb1FtL0z35vTyDiSGXvuS9Mcz2KEIZ/Jb7IWZl8twLP
         B4PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4MSVLYsQ1aHRPUMsqKWeWNfiw/1OBObe6XUOYFWrKME=;
        fh=6Z6Nxk0zZ9qc816lD3xO9JBamvAGBgrfSfTDkH2Pbrg=;
        b=bPaSErDHecVNc07Ss+iLAWAhitwvqZ3iirLgcpcwdHgNl80nOnK2CvP5b4hJWXU3Qi
         CLs8CIZTsBIykRkiQ6VBPmKOJKuex8+roKXOikzRFQHoPzAshPcI/jI1cIw2t+YhUDsg
         vrOlwplSdHC8Y1ycFvjv1NCJst4A+Kis2js/vQfM7AlMHnzetA1EJ68U6oR7dCJV6jl5
         kFBddNEFxUGYxGsvnJRA0aEewhQiM/xI7PHHOrQFtoNmaq7HnSj3KXP2qT126mM0BWZN
         Rkk56MUMIYEIQRc76vHnGdd83Hilz38LfoW5klmJTlTa26wupQbQZtANKR2DayDgImqK
         ngrA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ehWwwodU;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb42d21sor58067475ad.10.2025.05.04.18.52.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ehWwwodU;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409961; x=1747014761; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MSVLYsQ1aHRPUMsqKWeWNfiw/1OBObe6XUOYFWrKME=;
        b=ehWwwodUTFBp2umDQ9sX8TPRBLJbI5dLuev14v4dSj77IDgQ5LbrGf+DqMTAC35TUF
         McG5TVIiW8juxUqDT5ZviiuCGSZn+IqUeeFgEhy1WzTrjOOAcJkZGnAovCTSgYa+CAMp
         qjm6HdbAY+FnG8y/7q/5LdkHJjxJpNwj46jWVRUdcycHDu9mlPanUKVn23RvTd7hVmN1
         wgSMVG/LHMGCTqYspmQ3e+0Ol1oHY+QHhyNj2zIQ87QYKy/2Q8zUI4DfWDjjSQ68H+2T
         x4qyMZokZwXzqM8/6HLV0wflJ4pKG0U//U9C+zTuQvzkuQfMz8E+gEitNvB1R+TN0DeH
         BUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409961; x=1747014761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MSVLYsQ1aHRPUMsqKWeWNfiw/1OBObe6XUOYFWrKME=;
        b=h+SrJgztdv+/UZdq6Oi0APn/PqGhH6O+3Izz/r033f5UpUxa8JHA7fXiccesB4mjVS
         u3TiiU/bpZdGc+QIwEvLlAdiII9q1fztKiSjZQWi8R8ebtA0o/DSrNkH6gxGm0i9bzOs
         MOQCYwehWsrehRBfkcFlUqKhQDnu6xaD8v4O5emGjIsn8XbdVknHn4Wao7hUQsmzU4VP
         3uVuI4q4NQk8v2okRrGYk4T6eeLygJVleuimOgh4sdA7/7DKvjl5FlFCrltdnHcq+tyk
         H7X5sZLwcFqQYlwTESq4gueCDa2uo4iumglDdIbcdoVZy+/6wMlKMkR+uqdJdexxaplU
         qbDA==
X-Forwarded-Encrypted: i=1; AJvYcCU/83YMrpfyuQIRuWskV9PBW+Zx4qLEXLcsjJZ/drf4cS+IqtxP9enz91+wRDhMHEjetQR8aeOU45ldug==@linaro.org
X-Gm-Message-State: AOJu0Yy49WUL+3oTtkGwPtXp5QXqzA3vukwcaJqruHMTW22x7+uHVoR/
	F4a2r89H3OvQbhVPw/jyGsKjMvBpZVOsMSJ9iVSrhhKwkd30D+VSD8nHhO4Y9L57zw==
X-Gm-Gg: ASbGnctombnfp+oDEZreNlZhvOgXDGApqYhDKloymsXde68ZCsDnvAug1QuLu/rNj/S
	aakINNd/qRbnhRSWtdKoEKq0fe93uvsuIeasjubTS2GncghP7trQbKqt0aOpsXNKdNN0BPSpK2y
	wykYHPpozw8OYxzsvMnOO6NhmofcLCf+lmOXfyn2rtiQCb4ny+YJEjJm4v21HI7XvcTJiJOl/rA
	AZ88nknMDoxUAqJbR5esCELyjgJ5adZ4d//H9v29NqKhiJD021+1pwV/tLxHxJMR1Bqft7Y5nfl
	rUhU91UHpRRz7wKVlrnb+YprNU1K8pW+7fA8oFiu
X-Google-Smtp-Source: AGHT+IFStReL3d3Chdl6PrC5O/ZzbLYNJcWT7xOxwxpCTNKHN0EosJJL26gYeCAolZHGa5+8q0WjYw==
X-Received: by 2002:a17:903:1aa8:b0:224:1781:a947 with SMTP id d9443c01a7336-22e1e905660mr87815615ad.21.1746409961673;
        Sun, 04 May 2025 18:52:41 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:41 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 15/48] target/arm/helper: use vaddr instead of target_ulong for exception_pc_alignment
Date: Sun,  4 May 2025 18:51:50 -0700
Message-ID: <20250505015223.3895275-16-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: GHk+ORlDFm8z

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
