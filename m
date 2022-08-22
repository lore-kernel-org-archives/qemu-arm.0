Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp979451ejc;
        Mon, 22 Aug 2022 08:27:51 -0700 (PDT)
X-Received: by 2002:a63:9042:0:b0:41c:cdd4:ae66 with SMTP id a63-20020a639042000000b0041ccdd4ae66mr17207220pge.47.1661182070662;
        Mon, 22 Aug 2022 08:27:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661182070; cv=none;
        d=google.com; s=arc-20160816;
        b=poh0opGux4Um6UGq8WQ6C5eO8OboRMaUT3kHiSztg1sS65g7FzHvqv4BatbZBjNRJz
         rRmrDAIw1eVnVNgKLJd6jUxdY95eVwPekE+qd8NjwqTRHe0DLkLh1iTMzaTq+sFCMPwO
         Y9qSsunflduxWQ/jo04+Slp0lOaFhUt5kAyPULNfQWJUOlAGYcbZsoHQ9MUgRYqY22AJ
         YPIjjc7sARBqoTLOk+ocF4XPYhJEE/TCV2lySq9YO0BZWEl+3mL/QbnuvbXqWinrS+MK
         nEWQdR2Gx5lGbl2658IVOI2aygtwBTvoAXtn9AXQJF5smBLD6ujWcpKqYlS4dYQpY5wX
         joAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5p0MI+QCkoFG04riom6naP42FW0W2gy0tzxTYjzHV/c=;
        b=eFhV64AI4a6F72ZqkffyeDiv8ToUc7Telak+licAobyj9EO7Z3LyxoCwXMyGjH1WSp
         gwxTQzFMyj5un4yhTVkjRrgThHya44JCJozOJYE/ShIdQrYyQ0MVRoleAI7i/fsmyO7d
         poyXo54zM6SsqokoT126nr0p1iOvP4Nbaw1WQvbjEPNLB6QMCr22bVra4jSbLzA+6ym+
         temld07CNfj1oOH4EQVCUT1M+j2bGZ5BqweOWG/kQZJeNbPTsnY8eHyMC1VmJpWYi/jO
         JJtxTPb/2MVINGM7qusWeFZLevO+SYgH67NZRSVx9Tb860KmhbT6/eqc4lEFk6C7wPyW
         fv7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r5edGVQj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q5-20020a056a00088500b00535c5d51cacsor6142095pfj.100.2022.08.22.08.27.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Aug 2022 08:27:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r5edGVQj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=5p0MI+QCkoFG04riom6naP42FW0W2gy0tzxTYjzHV/c=;
        b=r5edGVQjY40NoJaDLT8Yc07Zu9ctQ9tvVRzx8/i6vgECJPWwm7hqG5890on8mIzK43
         A6VdOE6NDTA9SYhQBJn8s4H2//9mkHstOqqgHPwhgGQ+ybiO5zkBsyN5UddACS2VFHV6
         zmhryJdlLxNP7wq2yHzZMlDiDYXuJCELQ1fg9iLNf8uY7XlSCHpBWc7gX6inTH6sAXOs
         W2WTnRhOecCSdGsSSHFNEL/V1792RZotAzYQw7gPrCSuUx+xo1GdKZjwpGroa8d9WTtI
         0uPDQHGHVf4gxMjX0u7/ZQ1N0pbr9o/Bws96GtsFwL52dCYibel/NM5AlYp02FoEAZeB
         ZHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=5p0MI+QCkoFG04riom6naP42FW0W2gy0tzxTYjzHV/c=;
        b=7B/uk5QBHTKUrYW7Lj7a30ipxTQad1Om4HeWCkQcnz1kTcUI0iG0eWp+N5iwmV39u4
         GZXUeB4TDxT7nb/0tdo5+XZqN5jAZnzzkA+VM7WGH83A3Gb++Ov4om08nGWh2dPj22CC
         GM3+AsbbTcyd8e5a9FYQOqsRbTXB1y9sAQ0/QtTWcWla5CjsxrgeUK1HasrL89GN/J7d
         verns9YjGI9Or6ODAxdG+ghBV6ttt98Ip3vJefsL6B7E8XJDds7bz2IKNN4umloZqeT4
         6GRqmlz6WTUMahJizQyubpJFAAC7nIb9fMHmObq5V2MyTd4TgtTxZv37oKX98mr3tJGl
         lpdQ==
X-Gm-Message-State: ACgBeo2MdBA5jotH+z4msZtwbS64Y29O0g5Jtp+/gDwPauYEHalr8VLF
	CaHwGkhPgw8F711j3yXCEYkWq0Nq
X-Google-Smtp-Source: AA6agR7r/umPuuqRNtV6z4OLIlcmY8NGIjxdOXccHiiajIAuPDQXQEmO0JrlRguqQcpUbOFBSBavvQ==
X-Received: by 2002:a05:6a00:24c2:b0:52e:7181:a8a0 with SMTP id d2-20020a056a0024c200b0052e7181a8a0mr21310747pfv.57.1661182070170;
        Mon, 22 Aug 2022 08:27:50 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([71.212.157.236])
        by smtp.gmail.com with ESMTPSA id q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 08:27:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 09/66] target/arm: Use GetPhysAddrResult in pmsav8_mpu_lookup
Date: Mon, 22 Aug 2022 08:26:44 -0700
Message-Id: <20220822152741.1617527-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3wtnN26f11XV

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 11 +++++------
 target/arm/m_helper.c  | 16 +++++++---------
 target/arm/ptw.c       | 20 +++++++++-----------
 3 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 293e27b996..6786e08a78 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1125,12 +1125,6 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
                          V8M_SAttributes *sattrs);
 
-bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
-                       MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                       hwaddr *phys_ptr, MemTxAttrs *txattrs,
-                       int *prot, bool *is_subpage,
-                       ARMMMUFaultInfo *fi, uint32_t *mregion);
-
 /* Cacheability and shareability attributes for a memory access */
 typedef struct ARMCacheAttrs {
     /*
@@ -1156,6 +1150,11 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
+bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
+                       MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                       GetPhysAddrResult *result, bool *is_subpage,
+                       ARMMMUFaultInfo *fi, uint32_t *mregion);
+
 void arm_log_exception(CPUState *cs);
 
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 84c6796b8d..69d4a63fa6 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2770,15 +2770,10 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
     V8M_SAttributes sattrs = {};
     uint32_t tt_resp;
     bool r, rw, nsr, nsrw, mrvalid;
-    int prot;
-    ARMMMUFaultInfo fi = {};
-    MemTxAttrs attrs = {};
-    hwaddr phys_addr;
     ARMMMUIdx mmu_idx;
     uint32_t mregion;
     bool targetpriv;
     bool targetsec = env->v7m.secure;
-    bool is_subpage;
 
     /*
      * Work out what the security state and privilege level we're
@@ -2809,18 +2804,21 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
      * inspecting the other MPU state.
      */
     if (arm_current_el(env) != 0 || alt) {
+        GetPhysAddrResult res = {};
+        ARMMMUFaultInfo fi = {};
+        bool is_subpage;
+
         /* We can ignore the return value as prot is always set */
         pmsav8_mpu_lookup(env, addr, MMU_DATA_LOAD, mmu_idx,
-                          &phys_addr, &attrs, &prot, &is_subpage,
-                          &fi, &mregion);
+                          &res, &is_subpage, &fi, &mregion);
         if (mregion == -1) {
             mrvalid = false;
             mregion = 0;
         } else {
             mrvalid = true;
         }
-        r = prot & PAGE_READ;
-        rw = prot & PAGE_WRITE;
+        r = res.prot & PAGE_READ;
+        rw = res.prot & PAGE_WRITE;
     } else {
         r = false;
         rw = false;
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 225405de3b..48c9363159 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1701,8 +1701,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                       hwaddr *phys_ptr, MemTxAttrs *txattrs,
-                       int *prot, bool *is_subpage,
+                       GetPhysAddrResult *result, bool *is_subpage,
                        ARMMMUFaultInfo *fi, uint32_t *mregion)
 {
     /*
@@ -1724,8 +1723,8 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     uint32_t addr_page_limit = addr_page_base + (TARGET_PAGE_SIZE - 1);
 
     *is_subpage = false;
-    *phys_ptr = address;
-    *prot = 0;
+    result->phys = address;
+    result->prot = 0;
     if (mregion) {
         *mregion = -1;
     }
@@ -1807,7 +1806,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
 
     if (matchregion == -1) {
         /* hit using the background region */
-        get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
+        get_phys_addr_pmsav7_default(env, mmu_idx, address, &result->prot);
     } else {
         uint32_t ap = extract32(env->pmsav8.rbar[secure][matchregion], 1, 2);
         uint32_t xn = extract32(env->pmsav8.rbar[secure][matchregion], 0, 1);
@@ -1822,9 +1821,9 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
             xn = 1;
         }
 
-        *prot = simple_ap_to_rw_prot(env, mmu_idx, ap);
-        if (*prot && !xn && !(pxn && !is_user)) {
-            *prot |= PAGE_EXEC;
+        result->prot = simple_ap_to_rw_prot(env, mmu_idx, ap);
+        if (result->prot && !xn && !(pxn && !is_user)) {
+            result->prot |= PAGE_EXEC;
         }
         /*
          * We don't need to look the attribute up in the MAIR0/MAIR1
@@ -1837,7 +1836,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
 
     fi->type = ARMFault_Permission;
     fi->level = 1;
-    return !(*prot & (1 << access_type));
+    return !(result->prot & (1 << access_type));
 }
 
 static bool v8m_is_sau_exempt(CPUARMState *env,
@@ -2036,8 +2035,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
     }
 
     ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx,
-                            &result->phys, &result->attrs, &result->prot,
-                            &mpu_is_subpage, fi, NULL);
+                            result, &mpu_is_subpage, fi, NULL);
     result->page_size =
         sattrs.subpage || mpu_is_subpage ? 1 : TARGET_PAGE_SIZE;
     return ret;
-- 
2.34.1
