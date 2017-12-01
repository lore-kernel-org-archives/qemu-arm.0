Received: by 10.223.159.82 with SMTP id f18csp1519271wrg;
        Fri, 1 Dec 2017 10:44:45 -0800 (PST)
X-Google-Smtp-Source: AGs4zMb8NVH2eHU+gn6Ii1hOM3fHVEOvsAXgOkLolamgvdV55Q0wPWAlGLwWgeVM4JmwlvOjxjh4
X-Received: by 10.28.141.11 with SMTP id p11mr2063875wmd.149.1512153885228;
        Fri, 01 Dec 2017 10:44:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512153885; cv=none;
        d=google.com; s=arc-20160816;
        b=iOVs6omO4eflYRNhJbVTK1jjHzA8B0ze5nUda88NZ6GoIMO3GMyS/ilRYei/dO3op8
         HI5ql+/D8Cg8ChFgwbSIDZCYnnXXdy62M/d0UpLjgVOkFR4BmoADOoDjopozyJAHYQsf
         MDjG9puCJDzEA8M9hHar2xPEH633ewMcjiNmfp5e+vG87UNEIpOv3E3dzvU/xvfGItf7
         GWKlkYi785MdZnHkrH8tP2SpbufRZdmFmbVe2DMGm1bEX/GPfnEv4ibJB3bJ/I2wGWfa
         WHzaxY5/lNSTyYBykoaCTC7z9mSJU6cWdFzw18M3wyjgdjaI2CeHtc2YTqAGANG/cLzc
         TjSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=EJPv8C9t7A2YTQA/+Z3pmnzLWKJpI6Xbv8OV5TMZU1w=;
        b=qb/T3NhZF2m0ONafa7dkgdIAhlTf4OCvH03juMDJVFd3bfYUT+aR+UZ99YSZEEzEBq
         n5WOQ5UNCCVX63T/N8KypQf5BtlvkQfbauFHJJTeZ0JvP+Egtppfg1fzN7S4ArGnmYQW
         OoMWv83fQ/RgJpUdowsI7Rzy5fxIWFmXhvH7c7kJwovxWVC33OSN+ocSbeUFHGPEiLIO
         FmzcpsVLHeW05LbgI0l4U4eTX9MiXNxh3GbSufYdncQObYwSyRjpK08dnyxLU7zhGwwm
         1ds4/dVFAxR3ObkyFfTbf6Ls7pKVIcNb/bZN2t1PzMnymN8PgWXYaV5kYl8itrJR4v6r
         XGMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id 3si5675059wrh.281.2017.12.01.10.44.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Dec 2017 10:44:45 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eKqIj-00076p-1A; Fri, 01 Dec 2017 18:44:41 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 1/7] target/arm: Handle SPSEL and current stack being out of sync in MSP/PSP reads
Date: Fri,  1 Dec 2017 18:44:33 +0000
Message-Id: <1512153879-5291-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
References: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
X-TUID: S+9vtBqbmksy

For v8M it is possible for the CONTROL.SPSEL bit value and the
current stack to be out of sync. This means we need to update
the checks used in reads and writes of the PSP and MSP special
registers to use v7m_using_psp() rather than directly checking
the SPSEL bit in the control register.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 91a9300..88394d4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9953,11 +9953,9 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
 
     switch (reg) {
     case 8: /* MSP */
-        return (env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_SPSEL_MASK) ?
-            env->v7m.other_sp : env->regs[13];
+        return v7m_using_psp(env) ? env->v7m.other_sp : env->regs[13];
     case 9: /* PSP */
-        return (env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_SPSEL_MASK) ?
-            env->regs[13] : env->v7m.other_sp;
+        return v7m_using_psp(env) ? env->regs[13] : env->v7m.other_sp;
     case 16: /* PRIMASK */
         return env->v7m.primask[env->v7m.secure];
     case 17: /* BASEPRI */
@@ -10059,14 +10057,14 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
         }
         break;
     case 8: /* MSP */
-        if (env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_SPSEL_MASK) {
+        if (v7m_using_psp(env)) {
             env->v7m.other_sp = val;
         } else {
             env->regs[13] = val;
         }
         break;
     case 9: /* PSP */
-        if (env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_SPSEL_MASK) {
+        if (v7m_using_psp(env)) {
             env->regs[13] = val;
         } else {
             env->v7m.other_sp = val;
-- 
2.7.4
