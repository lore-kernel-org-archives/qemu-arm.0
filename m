Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp458915ocs;
        Sat, 1 Oct 2022 09:23:28 -0700 (PDT)
X-Received: by 2002:a05:620a:2989:b0:6ce:1913:83ce with SMTP id r9-20020a05620a298900b006ce191383cemr9652124qkp.49.1664641408718;
        Sat, 01 Oct 2022 09:23:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664641408; cv=none;
        d=google.com; s=arc-20160816;
        b=bP5FaFLCblEyzW0IG6oP9Wc9ZNdKF0BFf8Fcb0JWzT9sgye/nulUxmZ42/1CLlwihg
         7ExYg4/aClBvH9s7KBgaswm0RRUHrkRE9n/RmkEswzKE6+MF9uKVMlvz+4pzsetafMSP
         1MeteziFndcXyCqxP75fLEaieOlfoWkm30k7PreF5X646oGQdxB4I0FeSAsNGjkbQM31
         6TAXbPqnTwZrtAX33alX4UwS00Rov6lYvwTriHNKGFKPA9QdUhMdO1DihtFk6i0yCXHl
         ir7k8ZUZ60FksM8tLwc1qvds7Bby5o8KoFCrfzDqtfwfntYxiMws2ZAWS91g7Y3z/4a6
         Yodg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=t773ZS2LkVFwCoSMRlKqTFzA/pnkk1Ts0faFvUW3ikE=;
        b=n+6X4LO8NmXaDD2ZfvM3w3mq0Gw9rqlekvWdtewYYI06SgYIu9YWNds+7h9vxMis0+
         us3mI9c1qAyJclG5hqlEULQGaj4xIYrlkHFQGX8/ZjBhuMdyIVIx7qS8oIB53TUD3YdW
         JYmGrfHPXQhhmjIkd/QVwkc12LkGvtoAV976AZiUOkomWK7WxN20w8EbTWAchy6nP/gT
         FHfBwZVidZedUtYDCc6EGCSk2JaLqbFV4lkCUwA5m94cE36ZtaBRFzPSXWIhJgTSTma4
         7LA0oPw3CQu8B/T5h1xn5r9A0+uL0BRN/LaX+t6JBa38+KHqeNRnBNZm1/F3sqg/4Ccb
         WsQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fIcAYeOm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bb11-20020a05622a1b0b00b0031f07e6e9ebsor2751608qtb.34.2022.10.01.09.23.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 01 Oct 2022 09:23:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fIcAYeOm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=t773ZS2LkVFwCoSMRlKqTFzA/pnkk1Ts0faFvUW3ikE=;
        b=fIcAYeOm9YcTeJK2gY64bWOaHy2X6wPoM0G/auDpVHgwHzrxfWiKO3WQ5cEpR41pDY
         VdBbzyCXqZLMxpPwhYJ1vf0y8dnwqOjBGgIxGJX2l71ciMRnaCyqo68Ru5EhwCg90u3P
         mO0eNEYs/7xYobvwDohnYjTUcE82i3tn6BtRT/rMdrqfktXHyfq6DiV/Ntpz8XCAIxtx
         2KOOEXZ+Yh7p6Y3hO/8XT0JYBxSrQQ814nkl0dqDwRjhd9FKrRgMr1L7zN0O6GZyV5At
         jzBoct6crLtJ/HTjjWMaElcjuk+OfSfohYmD/94vyDoUmp2BfqSXcakijraOx7pq5VKI
         bPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=t773ZS2LkVFwCoSMRlKqTFzA/pnkk1Ts0faFvUW3ikE=;
        b=nRYZDOKL/mmQpVFK0SQBZCJAH8BmLKTwQq0sFQ6v6vRPCQNe+Aomt0qelsXOu7zAsv
         +sgH4YOnJtbbEMETtMzjP/IT0sQvEsriKhPfyTpc2xEGL2aLru8PSBOQNAsm24drZT1G
         Ale5GDQ6NmqQw7QZH7+jEkNW35lbLOuUFmJB3PkSapGhl7K7UrIqvJerkM1lRRab8OAM
         rHgz2/KtfzrqzgBmjw8/WCDkHjrd1XvvWGIpLjgVYAc2rRTUU7iv5r79MbNmXgmH46ZZ
         89dKK7iOCtn2khCsp7w+KzuCFAN9LzySKW69tvnGepF6Y90ftfZ2cfzcuvng8bpsBRqs
         mdrg==
X-Gm-Message-State: ACrzQf1LPi8MgR9JIUBrcQk0RXIcQW5yixiHt+rbQln4RkiX8Y0i9N1a
	bxDaIFegclXEPFbVC5nL5qF0SnlaNfy+4mpX
X-Google-Smtp-Source: AMsMyM7rkAEob9HL5X4HOg85wvfWn2u/ZfZaY2uLvL3HqJSYBOE/LBrVXuop7qRvCfPWQV+wJXEyFA==
X-Received: by 2002:ac8:5a86:0:b0:35c:d85f:915e with SMTP id c6-20020ac85a86000000b0035cd85f915emr11130479qtc.19.1664641408261;
        Sat, 01 Oct 2022 09:23:28 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
        by smtp.gmail.com with ESMTPSA id t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Oct 2022 09:23:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 02/42] target/arm: Add is_secure parameter to get_phys_addr_lpae
Date: Sat,  1 Oct 2022 09:22:38 -0700
Message-Id: <20221001162318.153420-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KsPGaQAD3AT9

Remove the use of regime_is_secure from get_phys_addr_lpae,
using the new parameter instead.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Update to use s2walk_secure.
---
 target/arm/ptw.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b8c494ad9f..b7c999ffce 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -16,8 +16,8 @@
 
 static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool s1_is_el0, GetPhysAddrResult *result,
-                               ARMMMUFaultInfo *fi)
+                               bool is_secure, bool s1_is_el0,
+                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
 /* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
@@ -207,8 +207,8 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         GetPhysAddrResult s2 = {};
         int ret;
 
-        ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx, false,
-                                 &s2, fi);
+        ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx,
+                                 *is_secure, false, &s2, fi);
         if (ret) {
             assert(fi->type != ARMFault_None);
             fi->s2addr = addr;
@@ -965,8 +965,8 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
  */
 static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool s1_is_el0, GetPhysAddrResult *result,
-                               ARMMMUFaultInfo *fi)
+                               bool is_secure, bool s1_is_el0,
+                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     /* Read an LPAE long-descriptor translation table. */
@@ -1183,7 +1183,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
      * remain non-secure. We implement this by just ORing in the NSTable/NS
      * bits at each step.
      */
-    tableattrs = regime_is_secure(env, mmu_idx) ? 0 : (1 << 4);
+    tableattrs = is_secure ? 0 : (1 << 4);
     for (;;) {
         uint64_t descriptor;
         bool nstable;
@@ -2337,7 +2337,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             memset(result, 0, sizeof(*result));
 
             ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
-                                     is_el0, result, fi);
+                                     s2walk_secure, is_el0, result, fi);
             fi->s2addr = ipa;
 
             /* Combine the S1 and S2 perms.  */
@@ -2505,8 +2505,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     }
 
     if (regime_using_lpae_format(env, mmu_idx)) {
-        return get_phys_addr_lpae(env, address, access_type, mmu_idx, false,
-                                  result, fi);
+        return get_phys_addr_lpae(env, address, access_type, mmu_idx,
+                                  is_secure, false, result, fi);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, address, access_type, mmu_idx,
                                 is_secure, result, fi);
-- 
2.34.1
