Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4067858wrp;
        Mon, 16 Sep 2019 07:15:54 -0700 (PDT)
X-Received: by 2002:a5d:5111:: with SMTP id s17mr4507wrt.59.1568643354562;
        Mon, 16 Sep 2019 07:15:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568643354; cv=none;
        d=google.com; s=arc-20160816;
        b=R0/61ORpoBKD4ctcgohW8hnX5DBveEsmxV9XSrZ8T8kbNGcJIVtuAbw2CJiQRHkxIy
         woxGoTGzpczaRKGc8UzUl0X5mZxGN5kHlihGZzXa4PTpgBYmbvrlDYms/iRSdE3roDrd
         OXjfhyYpiYpwuk+fDc50DB8bk0m7tZBW4fHbRWwON21VXWADrXQ6UFyI4sn0XXDXP/k/
         vePndl3vfOIXPoCL3LkpkKHkZjbTV9Z/xra8w+GG8yix0Om4DU/mjcdbRqnoUAECMPd3
         xyrUY4XwM354V3JE0ajViKYZbhFnsDJdBQR85UoQ6xdXkRmqv1kuZNmyeHo/N6jY8lOq
         Lagg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0pnYN3RXjA7UBIBYIotlAccmHjY/D9vmktQW67WnPW8=;
        b=O8iq/hJyMFfvJZ1gHPM1pOJZA5+NfnRqriry/igQ5uKuMKVgKd8ol0V0Mj50DDjO4+
         IOM9cfGmpZSHO4aXb+7DqwVTwohGdL/3MsTvFtYbRjx5fyToG5FosQ9gDBrVNxSV/Tyg
         smqVSrEx/dx+0/NkDCkUcwq64at6iTpzQpnzkww/NOtcTYPyfKkqKXRSEP1pOehUgglG
         NlEm84GLEW4KwsmmC3QVFzQU3awUBrRPaP17JYJJTvY/SpxxudlL4COsocOFFDc0K1rL
         +wR7IS1n5ltMiP1Tg7g32ixlgojzxNTBQnAV+JvQchhtf5qP8hhDTh7APb18bMea6Ak2
         JGMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vFnuQT0g;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s79sor140516wme.0.2019.09.16.07.15.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Sep 2019 07:15:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vFnuQT0g;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0pnYN3RXjA7UBIBYIotlAccmHjY/D9vmktQW67WnPW8=;
        b=vFnuQT0g/Orap8IjExRqmdI34nHdbzHGbhHrdxgnPl8mUNzUHemHSufsbFpNGyVBzZ
         p+VhiaMzzb0db9sssSs/mNIk0OMZDaCQAdFn/5GDQfOW9LfUI4G75o6WFQVAw5jf+7sG
         c5tXEo7p2xCAi2h01z6IK9u5ofhDIaT/HeySZRe5ZAsP1oBAkRkt3HDEoWdEsggu1Z2z
         1norD/19SkaKw52p58sMonFoZ7JzK0dS0Snu/hLQeq5ZKnzy7syHW6HlfL39SjiEzN6k
         PFtA6uHr9Vwyd4Dibe1OpF1712mXE0nHe84BSjfLqINpgFKx9CGN9c1MUEinnXv9NYy4
         /eNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0pnYN3RXjA7UBIBYIotlAccmHjY/D9vmktQW67WnPW8=;
        b=QQLuZvrUXufw4VPTF5w2unwjjhlf575UhAHK2zvMFoHfw5hb0bj9sGZ/Xzrkc87GqQ
         fRRODZOLgxYp2IGPaw74Qb1Pdia8SKPMNblEeB+sUSDkaCIrn3gg6jSuHt2MByScAMS1
         ZB0+VOj9vQmNCZ6f5ZsbSwxzGueiJQeI6LwIYaL3uQtJGVllvI+ek4MucUX5ogG2NswA
         xSJabGGs/3V99dH9gpS4kbZfY/uTIzJullVjj68/UhT73pMve+wo50wIjVZ+RDabgUeY
         typEf69B2NcwzIEKLB3U0T+aByTgbY52vz0SIt4+tX0PYEMcus+Hwa2iBR1mc9DhPeku
         ae5g==
X-Gm-Message-State: APjAAAWImjL3WbTwyQoE2iT1ryawJKQWYv917BK3+K2b17dvQXjSZWRC
	Ij0QR+SFOFy4QYD7apvjmCzthvai
X-Google-Smtp-Source: APXvYqwmvGsfZ7KdIUo76pgt70Vxt3/hitTHVvURlDbfnmtf9AyvQrpzaITmB2t4hiTzoCZLsiz5dg==
X-Received: by 2002:a1c:a546:: with SMTP id o67mr14871998wme.55.1568643354347;
        Mon, 16 Sep 2019 07:15:54 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id s9sm15185884wme.36.2019.09.16.07.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 07:15:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 06/15] target/arm/arm-semi: Use set_swi_errno() in gdbstub callback functions
Date: Mon, 16 Sep 2019 15:15:35 +0100
Message-Id: <20190916141544.17540-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190916141544.17540-1-peter.maydell@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: dyCO8FX3mZ+1

When we are routing semihosting operations through the gdbstub, the
work of sorting out the return value and setting errno if necessary
is done by callback functions which are invoked by the gdbstub code.
Clean up some ifdeffery in those functions by having them call
set_swi_errno() to set the semihosting errno.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/arm-semi.c | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 2618588076f..02cd673d47d 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -259,17 +259,11 @@ static void arm_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-#ifdef CONFIG_USER_ONLY
-    TaskState *ts = cs->opaque;
-#endif
     target_ulong reg0 = is_a64(env) ? env->xregs[0] : env->regs[0];
 
     if (ret == (target_ulong)-1) {
-#ifdef CONFIG_USER_ONLY
-        ts->swi_errno = err;
-#else
-        syscall_err = err;
-#endif
+        errno = err;
+        set_swi_errno(env, -1);
         reg0 = ret;
     } else {
         /* Fixup syscalls that use nonstardard return conventions.  */
@@ -326,11 +320,8 @@ static void arm_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
     } else {
         env->regs[0] = size;
     }
-#ifdef CONFIG_USER_ONLY
-    ((TaskState *)cs->opaque)->swi_errno = err;
-#else
-    syscall_err = err;
-#endif
+    errno = err;
+    set_swi_errno(env, -1);
 }
 
 static int arm_semi_open_guestfd;
@@ -339,15 +330,9 @@ static void arm_semi_open_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-#ifdef CONFIG_USER_ONLY
-    TaskState *ts = cs->opaque;
-#endif
     if (ret == (target_ulong)-1) {
-#ifdef CONFIG_USER_ONLY
-        ts->swi_errno = err;
-#else
-        syscall_err = err;
-#endif
+        errno = err;
+        set_swi_errno(env, -1);
         dealloc_guestfd(arm_semi_open_guestfd);
     } else {
         associate_guestfd(arm_semi_open_guestfd, ret);
-- 
2.20.1
