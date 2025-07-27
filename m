Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2A7C87FCE
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:04:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwLo-0005EK-8J; Sun, 27 Jul 2025 04:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLY-0004mX-MJ
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:04 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLV-0003zt-RY
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:04 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-234c5b57557so28978575ad.3
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603380; x=1754208180; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=usHSMIsiz9y48acSDTuSuakYJz8ebYKYrU7jsQN2xLc=;
 b=b0DlaMGaQYnBjS6gKu44Zc6gHeA2KZROiOupr8qGHqHR5OJ9lQaZDngQd8GS6S2jyB
 hhpHUWqQaiOEj9RKctpoDekLLaMrzpmPl8aEiwCLh2lIhYTqXPximfzin1C7opJC1U58
 YlefQQXFrsmVxAQh6nYZN3x39vXq5pCz3bNofvO+U8MYG6cWlrsKU0fA/zbA0pBCZCiH
 zkvh+7CrVvhZjLGHQOV71YqbEXewm26Tiy4+e3h9SMyRgVyZ0HehPufjA7BJyDALrMSg
 WHGD/PNThUejimBn9mm65kauP/ub4+yhreuNHsoRLQFGRl3AKgrRYqwIUloA3541dus4
 WODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603380; x=1754208180;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=usHSMIsiz9y48acSDTuSuakYJz8ebYKYrU7jsQN2xLc=;
 b=Hf6sYyYE1uzu42zoYhRm5lWLPv2brfOl0wLXk92v4zFXnHuzZSwttP04m7I0S/RRkH
 ZB1Hx2y4mGy+g/lhqy05rhv81nyxmOFF7K0O97LaQ6KeAhOceclPvFMfpX/02uN7RP6v
 YpBXEf5cA0A69LOXVKE4KjZvRanhm/mfF2NM2I7B+hI5Q7fn1fcpWUhxKCz4JdXS0uWd
 bnepLJFH7engwfRUjrWPHVGTyd1j1wetVmO7/MK4ScOqNjRDfDngdHQCzLY2VKlEHR6x
 Y8GEJSh2aiveY2Vaiw6RF8nWFyGnKZGrdNQEVP/60fl1XTvjyIv+rd1A3n5yimDbwTBr
 Ofhw==
X-Gm-Message-State: AOJu0Yx4exldTWq040WlEaDFDdlOY96vkUYwkEWSqy0P5celRTssBwXD
 gCx7++5El0/LTUJevCsxGXgE1TZAQL15lZQFMDOSkseB8wMLFNEKRK4M9EU1Rvwxay3NjTz3NBX
 Zzcfd
X-Gm-Gg: ASbGncvR08VaP7JuTGUsuHRimo0dr3iARnKCx2GZUa+scjAhPzi9C3coq88zblqBgGw
 YBjKg8KxSYSct1ILyskGdBfXIm7XV8LkFqJRCL0qWXlETbM79Z/73pdm7PC7COeI4sregCo2oHC
 DOPv4A6VlSPPfH5tPHN0VB41XNrXBuMXc8p4xz8RPUtFYQVw1LgJGB3YoAvDNqGu0QgZFxkAivK
 39TOEfG6ZOY6SIREfed4LIn/R2VnEr8nDRi6dRS/u9sAlydIu3bphD+zlFXuNfkBOWd7sXPxNnG
 nDvfaDg8vhFW2XrH1KXN77E/rVzIA3Dl22FFQ5WkjpGnrD0fn7QIU/bzSmDrN5tneS2RQWHY8vn
 0GGdz99AuVhQyifdFPp6Dw3ZLf/g0wXXoFnmnUBuympHpZN+rHoqY/jfEgIM38/OgcHDTkLLcTs
 VsbInZ/clSdyvxE44pjk+j
X-Google-Smtp-Source: AGHT+IFJzDtcQ+pettaj7X1WjMGuF+CataC0LXZ3wWyG3zpvbK0AJMBtTAFmX9i2NgegI8Y49mFnWA==
X-Received: by 2002:a17:902:e891:b0:237:d25b:8f07 with SMTP id
 d9443c01a7336-23fb30f3711mr115297705ad.44.1753603379095; 
 Sun, 27 Jul 2025 01:02:59 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe333efesm30016415ad.65.2025.07.27.01.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:02:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 01/82] target/arm: Add prot_check parameter to
 pmsav8_mpu_lookup
Date: Sat, 26 Jul 2025 22:01:33 -1000
Message-ID: <20250727080254.83840-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Separate the access_type from the protection check.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h    |  5 +++--
 target/arm/ptw.c          | 11 ++++++-----
 target/arm/tcg/m_helper.c |  4 ++--
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 118659815f..326b5a73cf 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1626,8 +1626,9 @@ bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
     __attribute__((nonnull));
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
-                       MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                       bool is_secure, GetPhysAddrResult *result,
+                       MMUAccessType access_type, unsigned prot_check,
+                       ARMMMUIdx mmu_idx, bool is_secure,
+                       GetPhysAddrResult *result,
                        ARMMMUFaultInfo *fi, uint32_t *mregion);
 
 void arm_log_exception(CPUState *cs);
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 561bf2678e..a914e7e23c 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2561,8 +2561,9 @@ static uint32_t *regime_rlar(CPUARMState *env, ARMMMUIdx mmu_idx,
 }
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
-                       MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                       bool secure, GetPhysAddrResult *result,
+                       MMUAccessType access_type, unsigned prot_check,
+                       ARMMMUIdx mmu_idx, bool secure,
+                       GetPhysAddrResult *result,
                        ARMMMUFaultInfo *fi, uint32_t *mregion)
 {
     /*
@@ -2750,7 +2751,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     if (arm_feature(env, ARM_FEATURE_M)) {
         fi->level = 1;
     }
-    return !(result->f.prot & (1 << access_type));
+    return (prot_check & ~result->f.prot) != 0;
 }
 
 static bool v8m_is_sau_exempt(CPUARMState *env,
@@ -2952,8 +2953,8 @@ static bool get_phys_addr_pmsav8(CPUARMState *env,
         }
     }
 
-    ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx, secure,
-                            result, fi, NULL);
+    ret = pmsav8_mpu_lookup(env, address, access_type, 1 << access_type,
+                            mmu_idx, secure, result, fi, NULL);
     if (sattrs.subpage) {
         result->f.lg_page_size = 0;
     }
diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index 28307b5615..d856e3bc8e 100644
--- a/target/arm/tcg/m_helper.c
+++ b/target/arm/tcg/m_helper.c
@@ -2829,8 +2829,8 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
         ARMMMUFaultInfo fi = {};
 
         /* We can ignore the return value as prot is always set */
-        pmsav8_mpu_lookup(env, addr, MMU_DATA_LOAD, mmu_idx, targetsec,
-                          &res, &fi, &mregion);
+        pmsav8_mpu_lookup(env, addr, MMU_DATA_LOAD, PAGE_READ, mmu_idx,
+                          targetsec, &res, &fi, &mregion);
         if (mregion == -1) {
             mrvalid = false;
             mregion = 0;
-- 
2.43.0


