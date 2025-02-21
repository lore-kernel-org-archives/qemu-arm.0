Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp504102njc;
        Fri, 21 Feb 2025 11:10:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXpLl7XTiq63ZrPoB+F3WUZwLKMAXXX+W67iLMd+YR4XTkplFhAkB8C873dWtD1yAPgfjyaTyI+eYJLEA==@linaro.org
X-Google-Smtp-Source: AGHT+IFijOz8TfEl3GwwoPwdTRMKGrgWp9q2AzsDsCaHlBVtDwczCsbxePVgAZUmR1bRGlV4KQ5D
X-Received: by 2002:a05:620a:1918:b0:7c0:896a:9529 with SMTP id af79cd13be357-7c0ceeeb7c1mr585047885a.11.1740165015956;
        Fri, 21 Feb 2025 11:10:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740165015; cv=none;
        d=google.com; s=arc-20240605;
        b=htFKY3urrInTlysqSszlPKn2+02qdsNZP/U4GwXom4M+l5QnkKfPf5sZGIm1qZTWyM
         nZ6dRc2N4TszsVw4HqHaZOHlWtcUMAXGUe3Nonxh7jGmpk5p7MLlz8m7o7Y/Fjh/fFIQ
         oLtl450L8pFEtPS/VXUmzhE9q82usKfsNbF/GnAj5hcLF6FaDFUuIv0levCyN4ZfmFxm
         7pMLAJA87QxPEnuXW25U0Gs9rNJD9pp4e1ubDYyvoxMGk+1TT5nYcq0qzXGTB9a6kceV
         /XmndLeQ82fE7HA3gxdL/gF0h0LCSkdPoFHnh7XXVd0+GR1240HRjoVyK+pgcPIJcas5
         npug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=psLz427g16MJMWGLUupBo7uTcJrzhpucl+zyFztvGko=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=jBWeLWwqrdi0xB+nKd1sswsGXmmGOvHZXgKXfGCbwLwC2j5DG2FAxEjrf86sdb+aBd
         tmlida185IRGhLi8pKCfG+6eQfPwz3gcpZY2fbwgIZPdYYK0JdM75F96MCxuGMmO2Zx3
         jTStAx4+GrcMJIGe/vPRFzUCJnuXcDIc2OYOsC88HfDuAa07jWgWE+uIsssRiAvNJUJv
         3kfCiGguvW+Wi1Cg0tcMVgVMTNwBkE74kGT23NKRsT3I5j0JM9QPDm6yoyQ6kIG9Hg9S
         NSi9e81Ufzhs1m2CF0TVAHTlXfj4LVeerARGY5EzY+06rTqqr/v65QEcPxP4MPW0PT2w
         fHAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=evOd6ryp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c0a3d34f9asi920475685a.574.2025.02.21.11.10.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2025 11:10:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=evOd6ryp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tlYPY-0006KX-4z; Fri, 21 Feb 2025 14:10:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tlYPW-0006IQ-29
 for qemu-arm@nongnu.org; Fri, 21 Feb 2025 14:10:06 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tlYPU-00046C-2Y
 for qemu-arm@nongnu.org; Fri, 21 Feb 2025 14:10:05 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4398738217aso21426865e9.3
 for <qemu-arm@nongnu.org>; Fri, 21 Feb 2025 11:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740165002; x=1740769802; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=psLz427g16MJMWGLUupBo7uTcJrzhpucl+zyFztvGko=;
 b=evOd6rypVOoh/RUOIn9UrTHnoAzmIIPft/1d2PLkgQ2jc4RtCHyOog87Q7q2JxKO6u
 fbdfrlc/fnyT1p34vjPWRNPw8qIB5RDHjcuV5czzCmKRBKnedniRf6G4iUX1rMWIki3O
 zQ/IrDc9rLj+Cyqq6h74wZ+l58kU72BNXAzZ3mj7ETQoWnA44EKMlw+QY9PX1+CnyjS4
 N8gjvc+o9PLWM7GQmvSnd3vN3XUNUuF37APco18neSFrCxvZKwl55rrWZX2ULNfmXPuO
 UYZnp7/7EkSogDZPrrsYvtGug20/JybisKHgFMdVFY2Dm2wDqF1ESDWdDcXUpkAKVu+D
 Qh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740165002; x=1740769802;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=psLz427g16MJMWGLUupBo7uTcJrzhpucl+zyFztvGko=;
 b=H0HXTWcckGJBU22resFwzhdxkpZ2UztoqKqkcAS/B5LUHU9FSVkZtnoMd2FSH/h7ap
 zFLr6XJqRK4WWomwRGffDhh0lRzWSVLezvkTFKVlfMfkpPLjzVR9dJLd4IpSnH914KY1
 7LEo1tPSsIaIMjUN/vGk4xRQ119iCr6vpgUuTvoNXFXkinIO8Yu2kqZFFv8K+7rcd2Sq
 0ZEUc2wWTzbPbyo9aca/gUn3Fitry1GndAlqjfVKgvM/CRhcvLv3JxB3HMPbayG4Po59
 nGEuzacI/c9/psRzqE0qb7XvTAlg/OEzM1+GJnJmYlN1275JL9/c3oMDmhfHwhIEwHrc
 BCDA==
X-Gm-Message-State: AOJu0YzqWyURckWu5BwNhugXgpKFY4j/j7CLuAYqRAYbL4hZcG+qm58H
 4lez79iRxTNrBLUCbru2jWc0HtUL4Lsfl8b3uDfqgZfldA2CBre6loErSP0ze/LW3qtoyq+RuwB
 u
X-Gm-Gg: ASbGncuY6VbUmsA1YbisawnG/dJ9NmAhso9YRmY/xqlzlJZdqu0E5Z6YrXtbKnETgFe
 2PxNDMtZh44JflU73OR+M61YwRseD/3pdKUirA2EpSPFr50kE/AMVHcMlWC4MnEMO1QF49Zru4v
 ISuD9Zc9IGkI71AenMOHuVci5g5pv5s0eGeoLFguT/jLFJtKbXtyyTRqHfqH7XBy4rsv422ZNnv
 3eyU0uqOYwl2CnNx3lo273V8MPjHYwFNXyNQFor+jVxXyw66ktBavO5wKRA94NoH5xLjlol2BbL
 OTtIzL4HqlWaQcNELx8VL0t7+A8KgEdV
X-Received: by 2002:a05:6000:1867:b0:38f:4fa6:68df with SMTP id
 ffacd0b85a97d-38f6f0d1fa2mr4328488f8f.51.1740165001845; 
 Fri, 21 Feb 2025 11:10:01 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbe0sm24392478f8f.39.2025.02.21.11.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 11:10:00 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/4] target/arm: Move FPSCR get/set helpers to tcg/vfp_helper.c
Date: Fri, 21 Feb 2025 19:09:54 +0000
Message-ID: <20250221190957.811948-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250221190957.811948-1-peter.maydell@linaro.org>
References: <20250221190957.811948-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AxTdMKWMs4Cc

Currently the helper_vfp_get_fpscr() and helper_vfp_set_fpscr()
functions do the actual work of updating the FPSCR, and we have
wrappers vfp_get_fpscr() and vfp_set_fpscr() which we use for calls
from other QEMU C code.

Flip these around so that it is vfp_get_fpscr() and vfp_set_fpscr()
which do the actual work, and helper_vfp_get_fpscr() and
helper_vfp_set_fpscr() which are the wrappers; this allows us to move
them to tcg/vfp_helper.c.

Since this is the last HELPER() we had in arm/vfp_helper.c, we can
drop the include of helper-proto.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/vfp_helper.c | 10 ++++++++++
 target/arm/vfp_helper.c     | 15 ++-------------
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/target/arm/tcg/vfp_helper.c b/target/arm/tcg/vfp_helper.c
index aa580ff64c7..cd6e0d0edab 100644
--- a/target/arm/tcg/vfp_helper.c
+++ b/target/arm/tcg/vfp_helper.c
@@ -1128,3 +1128,13 @@ void HELPER(check_hcr_el2_trap)(CPUARMState *env, uint32_t rt, uint32_t reg)
 
     raise_exception(env, EXCP_HYP_TRAP, syndrome, 2);
 }
+
+uint32_t HELPER(vfp_get_fpscr)(CPUARMState *env)
+{
+    return vfp_get_fpscr(env);
+}
+
+void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
+{
+    vfp_set_fpscr(env, val);
+}
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 0e849d8d4dc..0919acb7b89 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -19,7 +19,6 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/helper-proto.h"
 #include "internals.h"
 #include "cpu-features.h"
 #include "fpu/softfloat.h"
@@ -298,17 +297,12 @@ uint32_t vfp_get_fpsr(CPUARMState *env)
     return fpsr;
 }
 
-uint32_t HELPER(vfp_get_fpscr)(CPUARMState *env)
+uint32_t vfp_get_fpscr(CPUARMState *env)
 {
     return (vfp_get_fpcr(env) & FPSCR_FPCR_MASK) |
         (vfp_get_fpsr(env) & FPSCR_FPSR_MASK);
 }
 
-uint32_t vfp_get_fpscr(CPUARMState *env)
-{
-    return HELPER(vfp_get_fpscr)(env);
-}
-
 void vfp_set_fpsr(CPUARMState *env, uint32_t val)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -402,13 +396,8 @@ void vfp_set_fpcr(CPUARMState *env, uint32_t val)
     vfp_set_fpcr_masked(env, val, MAKE_64BIT_MASK(0, 32));
 }
 
-void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
+void vfp_set_fpscr(CPUARMState *env, uint32_t val)
 {
     vfp_set_fpcr_masked(env, val, FPSCR_FPCR_MASK);
     vfp_set_fpsr(env, val & FPSCR_FPSR_MASK);
 }
-
-void vfp_set_fpscr(CPUARMState *env, uint32_t val)
-{
-    HELPER(vfp_set_fpscr)(env, val);
-}
-- 
2.43.0

