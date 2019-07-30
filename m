Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4385876wrv;
        Tue, 30 Jul 2019 06:25:25 -0700 (PDT)
X-Received: by 2002:a1c:9e90:: with SMTP id h138mr109112220wme.67.1564493125145;
        Tue, 30 Jul 2019 06:25:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564493125; cv=none;
        d=google.com; s=arc-20160816;
        b=zowY0ut87Bd2fH4oe6klJpzhYoPmFW6yw/tPczjFyCa3UYj9LOHtbiA4KD1WNQd3Fq
         YCe7VBj2+9meQrqWJDrNvLAMC5RP+dPZoyk7YdY2Cbg2/BMhAO6zK441YcQ7N7VqgBsL
         bkMU6+ASe3BS+v4EPW98ORnyjFr6bhABGEcnmOSauIwzN5V2eWhyhVvTtfca7wtQgGzM
         zKavNGTlbt8XJKjbwYpo66Yqp6AmA0LGm9pfWOmFESo/9L8uI/Nuf3gXm0z9OHSESbI4
         gX/IQ/rWABfFjtqEReQOBuFcZZYnCfA6ZP8L2BC6e+BBX0rWFkgjAiH6sV1RqyLEUWOs
         XqSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=k60h7N7EIxaxf66BX3JejTtIWy6wazpW1QrSO9+z374=;
        b=WTXe4QXw97z3XZbJGeKw6HScZcNLfR06hOA9EncD+puVMcM+TUlVL7npHZZQPWUdop
         kk4tr/vWxdT99lnI3o0zEhO0wo4hVJkhUIyHUYuEzS9ZjaSzX3GGOLgZKTMVk5mJ3qjP
         dp44eeglE92Ad6dENYZUFOG/hSsmEUJoZn8hPxa8IF187aTBBOs5Dq1KydyCk3DtwxcQ
         2R5MxDqZJ/bXsfRKvH7Qg0b7LGNoHL+qAaxpKqcgjJBbwEnJ5VlkZb96fk+EnxlOTEzG
         ep4pFpQi6Pwnvak1rJPL1XzijPaJj9uILCxPFJHmTZ2GqIPHTcwc+ZZG/pEnR3A3KPEH
         bcBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SqQsgaYn;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 131sor35890064wmd.1.2019.07.30.06.25.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 30 Jul 2019 06:25:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SqQsgaYn;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k60h7N7EIxaxf66BX3JejTtIWy6wazpW1QrSO9+z374=;
        b=SqQsgaYn4x7sPE1mhDmtKxdm3DwOJylh7+/jy+3XPBr2Gd1ivE9/I2YWQpej8mLirR
         SdBnu9+SbHWq61lOdbFQDyh3XlqVtJMuVn7m0pZmUlrIyJTdmjLAtCaAIbQnU5ZjXNB5
         C6QIw5OvyTIutOlN+pfvq/JNibzCBFdCmLkuH2Lto3VCqTIrbo8UeclYBN/oQA7XjuZA
         qAmrYFMi6qlfvuHyrIaXnzoFbNImm62lqvy0ZeXE63+OBr3uFlvI7pnY1Rou8T/05rZN
         LdMKwf8tVowaPordwBMPLdAdOQn+UjxzrRyA76EJOET6yvRzfyS6sVenSjK3mTy1FfKB
         EZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k60h7N7EIxaxf66BX3JejTtIWy6wazpW1QrSO9+z374=;
        b=FiTGH0UjpUF5ehV7/Q/eZ/LkkTaQF6CTCsao0v5dmGC1aP6iFN6pQKDGu3DWmbfshq
         c20rprEytG9wQeDnnao2ZGhBWMBuZU5b+XeQgZ5mwPKCF4mrtG82Hx3bPd9buN6snEf5
         e0wRo+vWE7itVf31/gYBYOOP77OL+rur6vhYUoUYI/g7qBG7EADB7X+YFGDO3pe3RuWx
         QAZgWRpRLUMQW7nens9hGPQYwH3xiYnDwV8S2VVfIfGO8e95YN2ezbI/W5lFd6z8cH1c
         gcnF3zOfsZVirwiannXyYxovEXraM6SKRdOndfg4sj+6liOJHfKyOqjalMGZ0R6T216g
         4F4A==
X-Gm-Message-State: APjAAAWTRUereJRZ9sgrwRDpvn40CpsRK0Tu2hgs2NBB6HNGQHcjp0jJ
	II/zE3O/zhhqEHmlDoL76khoBAWQ
X-Google-Smtp-Source: APXvYqzYshGyq5SwwStPFWF3ni4qtOvANH3e9PhZZLi5q2xpbc0RegCMuSsFffg39y+/Fb+lcjxF3Q==
X-Received: by 2002:a1c:b457:: with SMTP id d84mr111200322wmf.153.1564493124885;
        Tue, 30 Jul 2019 06:25:24 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id f1sm44391896wml.28.2019.07.30.06.25.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Jul 2019 06:25:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for-4.1?] target/arm: Deliver BKPT/BRK exceptions to correct exception level
Date: Tue, 30 Jul 2019 14:25:22 +0100
Message-Id: <20190730132522.27086-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /e2SmqEBnpa3

Most Arm architectural debug exceptions (eg watchpoints) are ignored
if the configured "debug exception level" is below the current
exception level (so for example EL1 can't arrange to get debug exceptions
for EL2 execution). Exceptions generated by the BRK or BPKT instructions
are a special case -- they must always cause an exception, so if
we're executing above the debug exception level then we
must take them to the current exception level.

This fixes a bug where executing BRK at EL2 could result in an
exception being taken at EL1 (which is strictly forbidden by the
architecture).

Fixes: https://bugs.launchpad.net/qemu/+bug/1838277
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
At this point in the release cycle I'm not sure we should put this
into 4.1 -- it is definitely a bug but it's not a regression as
we've been wrong like this for multiple releases, pretty much
since we put in the debug handling code I suspect.

 target/arm/op_helper.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 1ab91f915e4..5e1625a1c8a 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -370,6 +370,9 @@ void HELPER(exception_with_syndrome)(CPUARMState *env, uint32_t excp,
  */
 void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
 {
+    int debug_el = arm_debug_target_el(env);
+    int cur_el = arm_current_el(env);
+
     /* FSR will only be used if the debug target EL is AArch32. */
     env->exception.fsr = arm_debug_exception_fsr(env);
     /* FAR is UNKNOWN: clear vaddress to avoid potentially exposing
@@ -377,7 +380,18 @@ void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
      * exception/security level.
      */
     env->exception.vaddress = 0;
-    raise_exception(env, EXCP_BKPT, syndrome, arm_debug_target_el(env));
+    /*
+     * Other kinds of architectural debug exception are ignored if
+     * they target an exception level below the current one (in QEMU
+     * this is checked by arm_generate_debug_exceptions()). Breakpoint
+     * instructions are special because they always generate an exception
+     * to somewhere: if they can't go to the configured debug exception
+     * level they are taken to the current exception level.
+     */
+    if (debug_el < cur_el) {
+        debug_el = cur_el;
+    }
+    raise_exception(env, EXCP_BKPT, syndrome, debug_el);
 }
 
 uint32_t HELPER(cpsr_read)(CPUARMState *env)
-- 
2.20.1
