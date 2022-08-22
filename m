Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp979468ejc;
        Mon, 22 Aug 2022 08:27:52 -0700 (PDT)
X-Received: by 2002:a17:90b:164b:b0:1f5:15ae:3206 with SMTP id il11-20020a17090b164b00b001f515ae3206mr23325455pjb.140.1661182072720;
        Mon, 22 Aug 2022 08:27:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661182072; cv=none;
        d=google.com; s=arc-20160816;
        b=vHggnt7yDw3MU6iS8PIlMB+rslXLx8wn3w1nMAL0K8ftBcFdkiqXoHMO8LXQelr8d/
         rap8wvAZPI2U8zaJYhgcyoOH828PeM7kSHfEpukEd/sa2OGvlHr5o8p07yBUPTjc7fZa
         OeV9cc0O598mApo8r0EJTgs6DVdpNDvOlG077h8152LQhzTtsys4XXfV7BTyab4GzIhL
         XE7cewxAGvl5csre/HBdYdSJtpvHOR+FJnncltaIVYjMibR7yh5TIAHBAqS1pEEi5OZL
         jlx5hpHPSgOj4PCIcJ98dWP1fHUvA9kTBIj9yMpz1tW7q+EgLzfvPJ8KF2/qTiURRGL7
         zFHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6BDOSEGT0y+2WOd0fksOzxPg5dHDpE5xNyJzQhM+fiE=;
        b=rkB6YhjkAC4jp38MaqVIpMV0H6XuiALs84zJ5MQ18o053rb+uR7SOTBfsn51+Pirml
         n97s12sDyORcPNrEEB+KwtR+2ZG2b0Y3yIfRmp2ndFczVhMz7B9NzXllSbW+ZGy9ZN3a
         dx2RGXDu9HkkugkgvcdDk++nc5cep+toY1eModtSOm6J1v/lHHIkS2MqsFki9e4Pk0tk
         5EDz+LGABKiuYlwLVFa3pYXaMQzb3LN0q4bJZoh2vlq6tkkWWQkIygEt4xBIfym/0abJ
         1BFX2JY7Q3F1LDzmsIMIeBkdkbon9GZqr7yibnnhrP7bjWVd+ai607GwystipvFdDwha
         JUPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cFycs40/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u124-20020a627982000000b005360815832fsor4855176pfc.41.2022.08.22.08.27.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Aug 2022 08:27:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cFycs40/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=6BDOSEGT0y+2WOd0fksOzxPg5dHDpE5xNyJzQhM+fiE=;
        b=cFycs40/bI4iLxYIEV+3tJl+X1dcA01yjKub0OSaS/vN4dzw0/vlwM2bd/kPps2WHP
         pbHi19bmpTWYXLNieKvGKnM1PjZoXFdgpXNUBjhPaCj9Ym12+yuJbJGrtb/Q19pE7Cj6
         ccVwsI0gDQLqrF1HSUQKxiFQ60EI0iJSNf877xbcfS+55ZFC+f9kxFSg+QyH5GwHsPF7
         00Rk3jaZ+Ke42l20XMpf5oVI3A+irqyty8EsdjXqPIlgulf6cb8/LuloualDg0koZs9f
         pCbZXjY2kUBNuyZkgHzqHeCgfmleBvBU3oU1U/G0+dT6gzFaRHdLKr2Py5adoFvpCPGm
         hJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=6BDOSEGT0y+2WOd0fksOzxPg5dHDpE5xNyJzQhM+fiE=;
        b=fLwGFq4tUWqXajzSUxSoEVPUa85K/X+IoXFEss6jTJkd/jd6VyAxKdP2MLmfG4v2AV
         Ff5PHGPPie9TPsS6F9TnwGGx59t8O0OIhAgUtIFaEevSrwgn0WaA7vMtRim5ZuIyHBfK
         NoNOvU3lydorTSI6MF2pclgtQGf0RlfFbRhfBFx5qOMuOEXh7V333vtfV5yzpAwCfExz
         We83nDFVGFai0yNKJeWaxrr4Jw9I8P8nBHiVsXQI4AE/ceTowawfMjbDIBn8GOcQpSUy
         A3bL0BZKRxwzHHDTq4zNKXOy9idRygR7oNOGrxgfkTj20Lmuu8Cf3yKdGf36iy6zPl5h
         geSQ==
X-Gm-Message-State: ACgBeo0g7/LJXlq4y9Jo8OcjpU9cOXkUfTCaQVtJpi3u9tlD+3GunMEf
	GfI6CVZc9z/EiKRHmZfKmIeaOR5lUMhTtcWL
X-Google-Smtp-Source: AA6agR4C1HJtRRno8ZIx1EG7R6feIg4X8IhkgbAvcr0jzX3kG85S9FVFM0fPYWcU2ZNeH+26UwHDMQ==
X-Received: by 2002:a05:6a00:1c69:b0:536:ccaf:c551 with SMTP id s41-20020a056a001c6900b00536ccafc551mr2766243pfw.59.1661182072289;
        Mon, 22 Aug 2022 08:27:52 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([71.212.157.236])
        by smtp.gmail.com with ESMTPSA id q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 08:27:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 12/66] target/arm: Add secure parameter to pmsav8_mpu_lookup
Date: Mon, 22 Aug 2022 08:26:47 -0700
Message-Id: <20220822152741.1617527-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: JfX+ndQEdpjQ

Remove the use of regime_is_secure from pmsav8_mpu_lookup,
passing the new parameter to the lookup instead.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 4 ++--
 target/arm/m_helper.c  | 2 +-
 target/arm/ptw.c       | 7 +++----
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 7f3b5bb406..ee40f41c12 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1152,8 +1152,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                       GetPhysAddrResult *result, ARMMMUFaultInfo *fi,
-                       uint32_t *mregion);
+                       bool is_secure, GetPhysAddrResult *result,
+                       ARMMMUFaultInfo *fi, uint32_t *mregion);
 
 void arm_log_exception(CPUState *cs);
 
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 45fbf19559..5ee4ee15b3 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2810,7 +2810,7 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
         ARMMMUFaultInfo fi = {};
 
         /* We can ignore the return value as prot is always set */
-        pmsav8_mpu_lookup(env, addr, MMU_DATA_LOAD, mmu_idx,
+        pmsav8_mpu_lookup(env, addr, MMU_DATA_LOAD, mmu_idx, targetsec,
                           &res, &fi, &mregion);
         if (mregion == -1) {
             mrvalid = false;
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index bbfb80f4dd..5628581ddc 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1701,8 +1701,8 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                       GetPhysAddrResult *result, ARMMMUFaultInfo *fi,
-                       uint32_t *mregion)
+                       bool secure, GetPhysAddrResult *result,
+                       ARMMMUFaultInfo *fi, uint32_t *mregion)
 {
     /*
      * Perform a PMSAv8 MPU lookup (without also doing the SAU check
@@ -1715,7 +1715,6 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
      */
     ARMCPU *cpu = env_archcpu(env);
     bool is_user = regime_is_user(env, mmu_idx);
-    uint32_t secure = regime_is_secure(env, mmu_idx);
     int n;
     int matchregion = -1;
     bool hit = false;
@@ -2034,7 +2033,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
         }
     }
 
-    ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx,
+    ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx, secure,
                             result, fi, NULL);
     if (sattrs.subpage) {
         result->page_size = 1;
-- 
2.34.1
