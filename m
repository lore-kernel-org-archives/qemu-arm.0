Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2179890njj;
        Sun, 4 May 2025 18:56:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWuZKcPi0GTEH9a3dXIxmhne4ng2Q+G4nsObDD27+yO3lPVwmd7tqPs7ksE++eBBennjhGgUBUR3bsb0g==@linaro.org
X-Received: by 2002:a17:90b:520f:b0:2fe:9e6c:add9 with SMTP id 98e67ed59e1d1-30a4e5c5d2dmr18671595a91.18.1746410189759;
        Sun, 04 May 2025 18:56:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746410189; cv=none;
        d=google.com; s=arc-20240605;
        b=TI4cIQYiWpPRKWyd+JKCIcsuvi+DU/5ttJCnwTOP2p/8e5j06ZYg4NpIaaUrm4YMw+
         q1xMDwedoasnw0MlmqPsKg61z4Xu5RavlN5WNVX5yeFfs/+/J5P999rLBDbdpUdUDjxW
         S0pN1CEQ1PoDz/4okWGykEjt5DgsKCrFOJ+MSP6NK9/Q1oQpKvsgSaOxsYhPcfbKVIlp
         /ci/i/v/VgGec9DLSE0UjD0CeIeYPqpZ7dGdYV7lGgWWYRcQfGOHm7aQFN9bC6OTzY6X
         JwaFUBXyYb51qM4WZ8SbyLzalTBt0oZV+s71bkLosRwGHkIap0Y2EWiZlGDjIhBfI7uW
         fnwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KAOgrGi4ghC8+gWPIlyM/nbU9ofyXXxCXlHL7nptXa0=;
        fh=BQsgxG4s7ytN1pUA/wkNgHYo81MPcmVLdYGRa87+pGw=;
        b=FQ/kV2Ir8WtJ2N1EWNrHy/hRXwArWnKWXWw9EBlvy+FGEqWMMuwsyK6ih6YZ5ZLm04
         2nmeKwiEq4cayxHDoE5cVpIzk6nuCLLD8IdSLFRM9EO0xAB/nPEMVDQTklxY3PvuagVU
         8DuLb/yMrIBmDCW4nTCgtiKc3sfkEQmPBy/12XAbKJyLHx/lISF0DUAYoHAv/p0IlA6r
         ct5CcQxiLQ0/w3OLpaYES4uh/4eebwZKskyWmakr0pA28w32Y4aMaWXKY4J9r4LkjITU
         Pm97ZUdflZ2IPXSFRERbklE9Xlb8eeuk6mqkeaDeUHyq7Nm69uQQqgA/F5aSQ5WbRRgM
         xw6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eEbDjh6C;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30a476338efsor4300357a91.8.2025.05.04.18.56.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:56:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eEbDjh6C;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746410189; x=1747014989; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAOgrGi4ghC8+gWPIlyM/nbU9ofyXXxCXlHL7nptXa0=;
        b=eEbDjh6CH62Y6u5I4Qmj7XEGEChXL4Wrw+MpC9WrhvUPH0ohOWjy3P3BAykJdtnDK4
         RTWM510mmm0+GbIFsBHaDuTvNR63ifx8HwxebZndVOkMpozzhwckPyJNuMdVp8i3kscF
         FYtP2RsMeh/dPF1Km8KJpb77t9ZrqY0pjLAUbiDkXIOU7oXJrl48JdZQVCfKilfGlNAZ
         ShSucwi8YbXNfacTn4Ze1tHuixqhYLQIQdTHRu1XeD1pTj/+TBo8mqJ9wFe7jUvermzM
         74Wx7dp9lQKXPJdVrQCAeXrQ2PivAgM08N/isQwUIWiNFVPCZhvhrsCoSzkijWY4keCM
         HtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746410189; x=1747014989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KAOgrGi4ghC8+gWPIlyM/nbU9ofyXXxCXlHL7nptXa0=;
        b=eVyEQ2Fel2ASHZgP4nq4OVHy5o3U/9HrQ4Zt5WMMl0bz5Lt3KrULMMvN0K3Yy7M+iJ
         tqCVDWLkYdFjGkwMAw96DBcFaGU+QM/p8b0JgvMNk8Sf8Bslsg/AVvh2GgBfL7YIftnx
         uqQ5LdBEvBy3X9fx3b6UrV/Idr7Yz3jmGsNazZu8daXxBVFZ+w+42unMS7zykhJWIouN
         PFd9pbp961TDygyhPaHh865ux0ZsZMKYPVH4mI9iBrC02yQxKnq2hsjuPOXjtUXnsTsX
         q6D+RzEPhYVx0AKWD0a/JQAhWgzXGQEBeR0kpo5VR6E68EZYHl5RDSeiH2Fppg4w9OtO
         TWSA==
X-Forwarded-Encrypted: i=1; AJvYcCUm37wUkVNcaSxZ63xr8PKDi17srAiEbrwaiZq5vBE64urAN2BSvy+c+VIx59+b4jDTvK4BPUnHfjmOpA==@linaro.org
X-Gm-Message-State: AOJu0YwU0Bq8bPGAFaY44qCkmIhV7YhfBjh6qqjKqzY6qnwWXhdH6jvU
	ZY8frN79h9BjdUa0BF+GXwO5bxKnlCkTUv4tI68pKp1cCosY0odaxAKEYQJgcJtigQ==
X-Gm-Gg: ASbGnctF0J58zbPCKFMGxTDJZlYvLrEJWoisQHY+FELKmy48oO6D048Ek1d66NUdfQd
	BxiSLBYETqJr2gP138UNekVX+hbrqcsOR7Rj6/CnXfEX/UkwKkMaDRVofyZadg6GNx6ipGYbqAk
	2WCxNaxoJ2xsWslrKf22lLwRcR+t7B0Lbj2pgo9leb6muS9VhEyif9QyShv+91sClpisibbP9Wn
	8DXg2wi2hou97qgyA9H3XxmihB+cLA9oZtWMUOM4I1tB3rirIzhyTML0g8e30TiZ89kfpKo91DH
	XSEc20GPDwGopAEwy2P7FBEOir6nKcuItMgB4P8+
X-Google-Smtp-Source: AGHT+IHyZNLrInoF0UGi8/gWlcgqZ15bxABMny7v/Brhs4Ifj0FpxPAHa/DSU+TaHYiyNKfZ9pvvmQ==
X-Received: by 2002:a17:90b:4c12:b0:305:2d68:8d91 with SMTP id 98e67ed59e1d1-30a4e622226mr16542763a91.28.1746410189330;
        Sun, 04 May 2025 18:56:29 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a47640279sm7516495a91.44.2025.05.04.18.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:56:28 -0700 (PDT)
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
Subject: [PATCH v5 46/48] target/arm/tcg/tlb-insns: compile file twice (system, user)
Date: Sun,  4 May 2025 18:52:21 -0700
Message-ID: <20250505015223.3895275-47-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 1NxqY3+TNwm6

aarch64 specific code is guarded by cpu_isar_feature(aa64*), so it's
safe to expose it.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/tlb-insns.c | 7 -------
 target/arm/tcg/meson.build | 3 ++-
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/tlb-insns.c b/target/arm/tcg/tlb-insns.c
index 0407ad5542d..95c26c6d463 100644
--- a/target/arm/tcg/tlb-insns.c
+++ b/target/arm/tcg/tlb-insns.c
@@ -35,7 +35,6 @@ static CPAccessResult access_ttlbis(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
-#ifdef TARGET_AARCH64
 /* Check for traps from EL1 due to HCR_EL2.TTLB or TTLBOS. */
 static CPAccessResult access_ttlbos(CPUARMState *env, const ARMCPRegInfo *ri,
                                     bool isread)
@@ -46,7 +45,6 @@ static CPAccessResult access_ttlbos(CPUARMState *env, const ARMCPRegInfo *ri,
     }
     return CP_ACCESS_OK;
 }
-#endif
 
 /* IS variants of TLB operations must affect all cores */
 static void tlbiall_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -802,7 +800,6 @@ static const ARMCPRegInfo tlbi_el3_cp_reginfo[] = {
       .writefn = tlbi_aa64_vae3_write },
 };
 
-#ifdef TARGET_AARCH64
 typedef struct {
     uint64_t base;
     uint64_t length;
@@ -1270,8 +1267,6 @@ static const ARMCPRegInfo tlbi_rme_reginfo[] = {
       .writefn = tlbi_aa64_paallos_write },
 };
 
-#endif
-
 void define_tlb_insn_regs(ARMCPU *cpu)
 {
     CPUARMState *env = &cpu->env;
@@ -1299,7 +1294,6 @@ void define_tlb_insn_regs(ARMCPU *cpu)
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         define_arm_cp_regs(cpu, tlbi_el3_cp_reginfo);
     }
-#ifdef TARGET_AARCH64
     if (cpu_isar_feature(aa64_tlbirange, cpu)) {
         define_arm_cp_regs(cpu, tlbirange_reginfo);
     }
@@ -1309,5 +1303,4 @@ void define_tlb_insn_regs(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_rme, cpu)) {
         define_arm_cp_regs(cpu, tlbi_rme_reginfo);
     }
-#endif
 }
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 9669eab89e3..a5fcf0e7b88 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -34,7 +34,6 @@ arm_ss.add(files(
   'mve_helper.c',
   'op_helper.c',
   'vec_helper.c',
-  'tlb-insns.c',
   'arith_helper.c',
   'vfp_helper.c',
 ))
@@ -65,6 +64,7 @@ arm_common_system_ss.add(files(
   'iwmmxt_helper.c',
   'neon_helper.c',
   'tlb_helper.c',
+  'tlb-insns.c',
 ))
 arm_user_ss.add(files(
   'crypto_helper.c',
@@ -72,4 +72,5 @@ arm_user_ss.add(files(
   'iwmmxt_helper.c',
   'neon_helper.c',
   'tlb_helper.c',
+  'tlb-insns.c',
 ))
-- 
2.47.2
