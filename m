Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp979458ejc;
        Mon, 22 Aug 2022 08:27:52 -0700 (PDT)
X-Received: by 2002:a17:90b:4d12:b0:1f5:59e1:994f with SMTP id mw18-20020a17090b4d1200b001f559e1994fmr23306642pjb.217.1661182072011;
        Mon, 22 Aug 2022 08:27:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661182072; cv=none;
        d=google.com; s=arc-20160816;
        b=eN2lsRyUGcyeML0qnIkDQIRhK9YnSGNu6Emsdv9Gmu6fk9hkX4EMhaJGuqNzk2XiLf
         w4oNMh8I4hvh3duWH0JX8uHd2RRWtmL0z51+iZO8vZMKj1Cje7V4fsJJa1tJPSF2/3gK
         cVC/FZ5g/Qtr5UhaGksJiuaJA1ceyj5oT2fUDnalaMfbnEfbHFJbog5Lo176f3iQKzrR
         W+fgyGqv+yiFB0DYX0U4ZUYDT0+fuYwLbRs3M6efPMHkCRAYs213mz1396goyz1th/NB
         tOdqHwaZ5SbcjI/6UmTLPqx3oc2GMknuHF8DlRBDOyyywaXhYFV+Nd5GnpTkEpced55U
         PlbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BWRDtrDD+OIowc2u5C+0Bs/iEHTC4XxgclrlkjL6OHk=;
        b=owm6RCzZ1zwrlm/S2cwAONnKsfHTtudqpi9itpJDMt6nemzKE7Ds2o1xoq6YxmV0te
         FI05IR8SAZe9Oc7k5jsbiZ6XDKlNyYLGRLY48VXKEWe76GTggr4MW7beDMvbIrCJOeiE
         GiyaYiQN8qGvLdBToBLs16ywG9CIaObe9M4GhJmGcuvfMk3xJlu8HXbTaOykbKIUiCGD
         7dcCW3LBiXG92yKyiuqZT5hjk2dN148+uwdcTlM7qTOcBKXWVzjk4LU485kUGNedWXqs
         enNFQzFSBYbGpdW27atg5RMASGDHN866U+2yZKzyx7JrOfQDN4cwBbRJrEMJ5LwwpJI/
         9wlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jF9Ny+Dv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e3-20020a62ee03000000b0052e2f85e029sor6203535pfi.13.2022.08.22.08.27.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Aug 2022 08:27:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jF9Ny+Dv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=BWRDtrDD+OIowc2u5C+0Bs/iEHTC4XxgclrlkjL6OHk=;
        b=jF9Ny+Dv2/w2nmx73YWnpF9y56k4nLUDp2Uk4qUriUvfuCBwIoM4Kd/42lz9L9lD+h
         3LBcLwHAkjpMIvwtr6wKWD0HhLs3/euYYzGLsrFoSDAwLOxTAf6yqcQqmG1ybap+QjZV
         1xgcHyKmb6lVWA8kdanMJtOL167Vmj527HZHdHcyeHV5seXYwj2Y9zMBNleoEaTm6/2s
         Z5l2H6bKDL0xUw1Ke3Cohop9YEzV7MM/iY5j/szKE0uydgx+EP06rib+D6PQpLq34P7z
         Vx0qP0M8Nno0NkICr199m4WHv0R6uFW+yBcLzw/pi72t4cJJWAfK57pM9I/0o1Rlbthr
         Q2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=BWRDtrDD+OIowc2u5C+0Bs/iEHTC4XxgclrlkjL6OHk=;
        b=x93kNW2RREaUBbvyfRfp78BwOeULUTK7J93etk6idBRK5W1icR4aREzDTzzRHg8OLZ
         inSEyvj/isG3ZY1UXrHZ2sAL7P5is3zuIPq7Hgy6Hej+/LvBy+lXVqeKkaFee4xoQ8Mw
         oXVXfro2Jk79D3zTAsSdb1E1KElaoV0lleglB8m9iCv+zNvLj83ZYh8yObo4bnMQUfYw
         YVs3WwKWOpO1IBwYn5m9N9udnrlnzfsCBfeBfAllfSUSC3aE8UFjPIRwyr8d9r7WDvl9
         5mHXLZUVR9uleDOyEJfzYy/+9H5ne2z/T1rJsIu5G+5o0TmY+Z+T6qLeAvA4WDOlenFZ
         v5ZA==
X-Gm-Message-State: ACgBeo3i+WaK+ev3Mttb7v5xBfAtYNGEr3aDr33eK9GcOQ2O037kOmiv
	D3Uj+j23uSGEJXQKapcFlGm0wlRM
X-Google-Smtp-Source: AA6agR7cgq5AMCgaWo46LQbmWgkt9XFNMFkSvZQ4qmBDp7VMc1pu0DlKpP+ujAeqgr/idEK56gh4jQ==
X-Received: by 2002:a05:6a00:98a:b0:536:4469:12e6 with SMTP id u10-20020a056a00098a00b00536446912e6mr12705545pfg.9.1661182071497;
        Mon, 22 Aug 2022 08:27:51 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([71.212.157.236])
        by smtp.gmail.com with ESMTPSA id q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 08:27:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 11/66] target/arm: Add is_secure parameter to v8m_security_lookup
Date: Mon, 22 Aug 2022 08:26:46 -0700
Message-Id: <20220822152741.1617527-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Wl4gbX2/b1ef

Remove the use of regime_is_secure from v8m_security_lookup,
passing the new parameter to the lookup instead.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 2 +-
 target/arm/m_helper.c  | 9 ++++++---
 target/arm/ptw.c       | 9 +++++----
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index fa8553a17e..7f3b5bb406 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1123,7 +1123,7 @@ typedef struct V8M_SAttributes {
 
 void v8m_security_lookup(CPUARMState *env, uint32_t address,
                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                         V8M_SAttributes *sattrs);
+                         bool secure, V8M_SAttributes *sattrs);
 
 /* Cacheability and shareability attributes for a memory access */
 typedef struct ARMCacheAttrs {
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 01263990dc..45fbf19559 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -689,7 +689,8 @@ static bool arm_v7m_load_vector(ARMCPU *cpu, int exc, bool targets_secure,
     if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
         V8M_SAttributes sattrs = {};
 
-        v8m_security_lookup(env, addr, MMU_DATA_LOAD, mmu_idx, &sattrs);
+        v8m_security_lookup(env, addr, MMU_DATA_LOAD, mmu_idx,
+                            targets_secure, &sattrs);
         if (sattrs.ns) {
             attrs.secure = false;
         } else if (!targets_secure) {
@@ -2002,7 +2003,8 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx,
     ARMMMUFaultInfo fi = {};
     MemTxResult txres;
 
-    v8m_security_lookup(env, addr, MMU_INST_FETCH, mmu_idx, &sattrs);
+    v8m_security_lookup(env, addr, MMU_INST_FETCH, mmu_idx,
+                        regime_is_secure(env, mmu_idx), &sattrs);
     if (!sattrs.nsc || sattrs.ns) {
         /*
          * This must be the second half of the insn, and it straddles a
@@ -2826,7 +2828,8 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
     }
 
     if (env->v7m.secure) {
-        v8m_security_lookup(env, addr, MMU_DATA_LOAD, mmu_idx, &sattrs);
+        v8m_security_lookup(env, addr, MMU_DATA_LOAD, mmu_idx,
+                            targetsec, &sattrs);
         nsr = sattrs.ns && r;
         nsrw = sattrs.ns && rw;
     } else {
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index ec66ba6777..bbfb80f4dd 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1856,8 +1856,8 @@ static bool v8m_is_sau_exempt(CPUARMState *env,
 }
 
 void v8m_security_lookup(CPUARMState *env, uint32_t address,
-                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                V8M_SAttributes *sattrs)
+                         MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                         bool is_secure, V8M_SAttributes *sattrs)
 {
     /*
      * Look up the security attributes for this address. Compare the
@@ -1885,7 +1885,7 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
     }
 
     if (idau_exempt || v8m_is_sau_exempt(env, address, access_type)) {
-        sattrs->ns = !regime_is_secure(env, mmu_idx);
+        sattrs->ns = !is_secure;
         return;
     }
 
@@ -1974,7 +1974,8 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
     bool ret;
 
     if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
-        v8m_security_lookup(env, address, access_type, mmu_idx, &sattrs);
+        v8m_security_lookup(env, address, access_type, mmu_idx,
+                            secure, &sattrs);
         if (access_type == MMU_INST_FETCH) {
             /*
              * Instruction fetches always use the MMU bank and the
-- 
2.34.1
