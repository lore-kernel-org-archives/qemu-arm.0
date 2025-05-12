Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42643njb;
        Mon, 12 May 2025 11:05:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXAS8d1D9IwaWulk0WnhXTRTvxbJussEl1X3tx6d3tRkUt6C8cuATL9GdcdJsQdXA/p5I0hiAy285VJ6w==@linaro.org
X-Received: by 2002:a17:902:e804:b0:21f:6fb9:9299 with SMTP id d9443c01a7336-22fc8b591aamr192904105ad.27.1747073124139;
        Mon, 12 May 2025 11:05:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073124; cv=none;
        d=google.com; s=arc-20240605;
        b=der1P6iJssnUzmGUK4xfd+2vqqtiPpv+3gT6J/6cT4OrjaLQwITyTeW19W+bijny6q
         wBq5pQ/qJBdeb0Xpho+em+XJ0qAZgW5iN3ldsXEqoQXnLPPD9updxkw+LOXZKXb+5ozM
         3hm+GlyIcRgeN8eJ2OlpryEFjnxP3a3hPYyJhkzCll39NvxcSpFEKt1obw0zxtzUjp1U
         qJ38AkpbUuuDZbOhO3JuaEbCKtiRctWzh0mpZ0BubT97a5DDJn/KLLozdIJGipQvKoZ9
         /eTV8U+HSMxzkwuFaYyCSrBJ6Y6SBAbbBbxMrAyScdnwE6fsHZXbrYtR3NhGteqRodep
         CW6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hulB2UBYIXOqzJFKVn1ypmpXSnKnDaK1c4I5WrAN9H8=;
        fh=DORKOF1nGzUCJIuNnts7yDD/fq9jxBS0BM97StPzAGk=;
        b=V5iOEzGm0/tzqtPayosOQgaqs8Dl8Kngh+jiidzKJxR3Eiib/CdVom3btBlGeSCw1+
         x088x8O7amwEAZTcR3jl9OTIHZIbZmD6Dj7u/+JbfbtyEnBzzJ5nE7k1N9/Y1fxgCYld
         Yf6+jpkrOzEHT5xcWY0usfSAG7RsbtV+KshIvdkFx1/RTHT5OLJUk8J6k7n5KhPdbkDV
         +OzJS5T/wxWmcJ8gv1AsX5mxi6/GZfH/wqhM/BNcz5LRxWRkY+6ehVag7IKeWial7J9m
         5lkp9M5usGthHqIs8wFXt7ODHcqh7EykMFChL9IiHrzx19AVxQeoalKNq5vyZaOfv9Ck
         FjVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HfXxZLXY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc6f135dcsor52798475ad.12.2025.05.12.11.05.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HfXxZLXY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073124; x=1747677924; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hulB2UBYIXOqzJFKVn1ypmpXSnKnDaK1c4I5WrAN9H8=;
        b=HfXxZLXY92lk6cqq+OnspiAFURBw55j3wCNZUWgzcigjRdUm/RhmzAq9tQftzJF45s
         VybbrVzXK022algitXdXfx85fbjlWKLGiloKXuplYcXPWtNCFR2+txE34UF3BzJUZl4z
         Z/QmaBnQtV4hm8Lhhhi1UXWRmeBrqahdN9BlKJcN2I75fkZ0ICRPY9jMwOAjWmUWNCaa
         w/SgP65fq73OJ57erFNGLMlPXYHC+b0kEa7BOoaML00cRxjBbtW8X85HbvWh3XGsyW5C
         Z7vn9Uhm7ZFYQUoEhsRpOzDxoWuXCxBz0OTW38GhkkDEiSLq9/Zr8Tv2Ycozcn+o5GtP
         Hnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073124; x=1747677924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hulB2UBYIXOqzJFKVn1ypmpXSnKnDaK1c4I5WrAN9H8=;
        b=IhdhWm8IQv4Ad5wT2V41JffK1gdFseS3hmxt2PijyJTRDf3Sojaa15z5MZiF720rxX
         biJqu+hmE/stk2dw1KSZI+AGL/WKBsYgFMealh1eDQ20LQeyKk9+t3oGoCW9aSqzlV7P
         fjrrHqvxibMwUhFZJfllafEGNRcGLB0OWwUIseGTDLI6hHHOmr6YxdsgrrSCWp8SkryU
         noXnEHwBzYC9pUctL3l+A1tu+9s+LpKHZ//yF2kSLlgW0PqYyqYph/zGCTlUVbjilG2M
         8qLxcQpFLVb5f17LV517DW0SbsJ12nhczffGSpMrbnFBIHaqA2qtKBq0Dkl65npNiBH9
         06pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYUR15kitYnRa/r3mP4uchAmYtD9BiTXCc2KK0D7wYNYUFxh6HBw24PZvvaaEE2IVojNPUbjYFZ+YvzA==@linaro.org
X-Gm-Message-State: AOJu0Yy5uM9zdHQ2CSgempFWeOKACHn0HZYhqVxNoGXADb8tkB0BpDPR
	2L9N0fOj1LbOZOCJ8Ra120ThNFH7wrVRiW+TERk73U5nGv9mZ9hzWQ5nIjF2jmkhCQ==
X-Gm-Gg: ASbGncvLQAtRLfkR6ATUn3wsw2h+l/1kRgDhhBrJIgl8eONDGviJvEzh2le1opvYZdM
	VQ4vj89wO+fBRQIfsBnC5AjOvV72xOk3MUCfO2i2qWlhmGkoqOg4i4vAUoeiZAtco30PXoFwpNB
	as6BL20codVsQ0QGIQiwDz7Z6Rkp91NXWJpBOXndImIIQV76rRDk48+NdjxUn6ALIsM4G7+/YyC
	liy58VNCjH2X4sdeChYQEMcUELeW65b6VnpVE5c5rjgyaCXf8fn3QFBreg5AxsOFEwJzpgn7/WX
	YQ6F+rso7h3lPz9eSydcK7df8IzVMLIsGX2h1x5TK1S+n24KNGw=
X-Google-Smtp-Source: AGHT+IGwq1tKRijfOMpNf6jcDnCb5CsbqOkXM1HmtY5XbufEcxIBy7HmQc4p5cmL1ZbzIfEVQPoTSg==
X-Received: by 2002:a17:903:3ba3:b0:220:ca08:8986 with SMTP id d9443c01a7336-22fc8b3e338mr213945315ad.22.1747073123534;
        Mon, 12 May 2025 11:05:23 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:23 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	anjo@rev.ng,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v8 13/48] target/arm/helper: use vaddr instead of target_ulong for exception_pc_alignment
Date: Mon, 12 May 2025 11:04:27 -0700
Message-ID: <20250512180502.2395029-14-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: VtUm/x6O6MX5

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
