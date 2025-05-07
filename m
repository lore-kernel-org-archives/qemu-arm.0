Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94307njb;
        Wed, 7 May 2025 16:42:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVeN0WMSftfUsYAY/gDIyp+TxJTA8y7cVRFWLgP7b6tMie1yzwIBU9XTaGGRTrP7p9dZaiEoOs+Rgbljg==@linaro.org
X-Received: by 2002:a17:903:2381:b0:224:191d:8a79 with SMTP id d9443c01a7336-22e798bde41mr39366785ad.27.1746661376027;
        Wed, 07 May 2025 16:42:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661376; cv=none;
        d=google.com; s=arc-20240605;
        b=To1sFGoeP4eIWJ9gYMsA/NOH1SmOgr3oYT50eMGKPRO5KIvljR0HdkJoF5uAk15vLp
         JSL5Ay9dwrD9vH3V6OJxBFEkjSVUs0ibabk1dXUdmg7oOuEYMB1lxrdDYjDeJVjdm8cq
         SCaB52UAqpLJewhzgXiEIo5sOPjUy3RudMxiWyyRV6IWG8GCQLEoF0L6UyIKEZSHHddf
         ZJkXP6nf+zGCpCt3MRu3E3f5+mAhpNMbC9GzLh+iocxxo4OAeIZz9QhbO09eL8x4eb73
         UnQbOcGjH8L2KSNnDo+9FaTbH/mw00laYbOOJhTPEEJpksvrj0sCrUUl9HyhcdISFg2H
         tWlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hulB2UBYIXOqzJFKVn1ypmpXSnKnDaK1c4I5WrAN9H8=;
        fh=frgIthJdlqrLY2NgzZxQNlmefgTW5VVAWRQixpghaIw=;
        b=LNrOBPJr1eZ/3BuOM0O44LGgQba/qQEKu77qP7g23CRYWZeFziEixYKa6X9oICDI1k
         39SsERwXnMTPSeDQ2EMGSTITeQ5SazPKPT1URPePf+sz+B6MwP/0YANB/Z6pjmbWC+m7
         utlGNkczlyrmJOS/uLaMn0nrwDHZId1656rf3LX3SOAeblmRlOp3ykWTYgVq6P2Re7FC
         +P4VYoJ6OzZ3K1h+1vdCPyU0RhKZH5HLza1gqrAkiFsO0rlZ28B9oGGxOYH75rZ3nHxi
         Ttv+EHREzQr5ShElxTfq0x6XUoolIqBNxVbyTIUOWJ5wMD7HCNPzqYxhZqNIuw9oyP2/
         bklA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ckkE1+/O";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb42d22sor45995445ad.10.2025.05.07.16.42.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:42:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ckkE1+/O";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661375; x=1747266175; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hulB2UBYIXOqzJFKVn1ypmpXSnKnDaK1c4I5WrAN9H8=;
        b=ckkE1+/Ok/TBVVCYTEw53WLZS6Pf6aPLvLQge1WhjkaK4bL9GpOKHbXCOMYPxre5aW
         QUFdatAPqbuB8ryM/GTUXGkGejZXtwGCjKz9h9HnyIw/3NZnWQpAHur4mV95r7OHH0qo
         fm5MeM9cnpEo+EsnXsZv4OngEeglat0UOG1hqbNJ5M8QJdPr1QG26KBPUjgXdE8GyBE3
         356XxGDDMkWPggXwcWXjvSJu/fQNG+tgjJi7q3u9gwmKDab577CMIeXKMYwNFdrKzLgD
         EzcXNM219CiRiFE24q/JBytf4uImTNSOldo8+sK23+H9DtwI9FXW6HXA1EuPLcKS5X97
         rYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661375; x=1747266175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hulB2UBYIXOqzJFKVn1ypmpXSnKnDaK1c4I5WrAN9H8=;
        b=pTrx6AAQvWxj3eBgXYTfJkDnOt4p6dFi2XaCdEckhv5WlxKXyhU5bC0qIKSHpEzubh
         KQgflPC3b3zvloUK5onXv7aDukEDPPrB2S3JpEDgc/RZT35EmEaC7y2E3uwuPuVIKI0m
         pBmrMCTwU4SlrbSm0xQ+3x8A9Sqo92xYCBPNe+ecpmtHwHTHUZi45rAxovE4BZ/NHgyo
         Alv3v+2+zpPR38ovh+Iurb7ASGgIbGwHXZW9AP3dVyQuBk55pTA1az4jIhWyre73+Czw
         v3vYAXCRfJ54YOalJUrql4UtaFp9dyM3xCesN9vL1LSjFL2VdHrhN+YSShdEAWgxwREJ
         OiWg==
X-Forwarded-Encrypted: i=1; AJvYcCUay80syA+qAzUT5WJqqvYrzLGoUCgmJkM1+jgB7WmMDyiuKiahIriB6GwbgZDeh+9dpcEvcC1m0xbwbA==@linaro.org
X-Gm-Message-State: AOJu0Yw4eE5jTEvdiai3yV06bxN00sd1fujIQBmZ5TdLujprreJbI8ur
	fV1C3K8PjOIEW3DM1RuqNxPli3H0/socKmZr/yx0724+pQNkmL0A57zWc1SsEShVfA==
X-Gm-Gg: ASbGnctyITz/CX6IMCQ0qJD1eEOhtfZ8bHAUbuQntovnCqPASMGsn2zval4o4cOPc5K
	rqoN2QqorKQCH9V+O7KzAtbWJzGI6JsPQvJSIpcDqKNlfHWlzs9crbDP+hYVWHIaYUO2blZTXx7
	KflBUklbAMkaD81R/JxPTdFmKcP7Hum2YOpa5Kmo31nefn83jcFgpN1wjBJzHXfhaZ9WqJG3LQk
	UClSZkNt+HBASJtHcn5u6EEoaPEUrjx6XSYKrOTjQAEXOa7/DTPcOxI6nLN5x/Hh7+SSJWkxtZx
	eEFw2lv7scVrUV122DPhpVBIKKDkuOWsLrp4jFar
X-Google-Smtp-Source: AGHT+IG0668HnujjOop4MRhdufku9w1ExNwRIuz4QjwGB7uvWhg2Mg9/z3MDPW/4Cc15wrPc+nQsvg==
X-Received: by 2002:a17:902:daca:b0:223:5379:5e4e with SMTP id d9443c01a7336-22e5ea70aedmr96307875ad.10.1746661375655;
        Wed, 07 May 2025 16:42:55 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:42:55 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 14/49] target/arm/helper: use vaddr instead of target_ulong for exception_pc_alignment
Date: Wed,  7 May 2025 16:42:05 -0700
Message-ID: <20250507234241.957746-15-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 7nxasICoZFx/

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
index 5ea4d6590f2..d9e6c827d43 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -276,7 +276,7 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     arm_deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
 }
 
-void helper_exception_pc_alignment(CPUARMState *env, target_ulong pc)
+void helper_exception_pc_alignment(CPUARMState *env, vaddr pc)
 {
     ARMMMUFaultInfo fi = { .type = ARMFault_Alignment };
     int target_el = exception_target_el(env);
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 52cf47e775f..ac80f572a2d 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10242,7 +10242,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          * start of the TB.
          */
         assert(s->base.num_insns == 1);
-        gen_helper_exception_pc_alignment(tcg_env, tcg_constant_tl(pc));
+        gen_helper_exception_pc_alignment(tcg_env, tcg_constant_vaddr(pc));
         s->base.is_jmp = DISAS_NORETURN;
         s->base.pc_next = QEMU_ALIGN_UP(pc, 4);
         return;
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index e773ab72685..9962f43b1d0 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -7791,7 +7791,7 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
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
