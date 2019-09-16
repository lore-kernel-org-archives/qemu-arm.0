Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4067785wrp;
        Mon, 16 Sep 2019 07:15:50 -0700 (PDT)
X-Received: by 2002:adf:ce04:: with SMTP id p4mr35634wrn.130.1568643350925;
        Mon, 16 Sep 2019 07:15:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568643350; cv=none;
        d=google.com; s=arc-20160816;
        b=CkrD6wA2Ti5i+V8aAPLiHOrW3zma8uqhpBqhJymYUcgIIliEh1dk5G2QgIicNqbhEc
         KVE2dSJ2vepjxPY95d4uky2P0GNP98Z67bl09pKUssj3jD6hQ/d2MC7hsFZgu+pQUgv4
         UIlBhwFynFD2kZVfk/vP5uBwsAjlEUmTNxrZRc9dqlqWFUlE+A19Kkpi7iQQodTNvhvH
         toChVjI4KDpKO+j9acnU6ydsxF9+LSPxv8d2wlP0jF4wGV0O5ZuQUgogUQ80KkZkfW5W
         9rl6maAje7wxbKOaV2/UKUidselWaeMvBaFlY4yD+3OCtIrQKZpQWk/kuBMtL6EV5iS+
         BppA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QMiXNxopmp/Lfafa2rBITuXAv6CIJtSHxYMTRHI7jeA=;
        b=RCIFkB/DljWB4RM5UCw0tBLmoO9gsYFCEKoD5cHyjWkIM1XJsxsVaAtZmILaUR9b8T
         2Yol5y4gYNOrX9a7uLoV23jUiZzKNp7YPo0hLMzDOUiQdUMldUW++uAuM3jEGK+60E9Q
         BjtVvJ4Te2/Vc6rNxqApnDIzr2F+dc2Enkdm49zfpmLKF4em3qlWkJ/BNhSiF6El2TGQ
         dbL4UMW9rs0en7SgjgYB1M6dQfO5Mb7jlH9sgnzSkucrrnIt/ryISSstxpFdD4EJBEfg
         Y/i//uHxQ4zxVhbMGrL0zn4duY16Q1GJg1BWeULqOugxjIPJcRZYiww92yFADcSyEY6I
         4AkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sbvTCq9x;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o10sor28902730wrg.1.2019.09.16.07.15.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Sep 2019 07:15:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sbvTCq9x;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QMiXNxopmp/Lfafa2rBITuXAv6CIJtSHxYMTRHI7jeA=;
        b=sbvTCq9xJLnYTTXmU+ghUk3Ze9TNp67+MuZaKRNtNc/py54VOl3kf2F0CqwOxPR3ec
         Nnn2nGdzip3bWKK/bzCyryi8VsVMCTfN5ceBagb2V+R5HKM8D21fFXjIpXjGML4mQXYH
         z1tWHQL+TeHfJLnvQsf+1LxcpeTD2yNtilMN6Lc0oun+FJuQiVO4xOQCoF/kGmIXAOyM
         NZ7XZfLko24omWFK3sDArecVfXyVT8iDDsCnsKn0U6sH7P/3+6DhdYV4CrZJCETWCRcT
         XwrRyNyLSHYZKxIDY/WLMueSl41J4TFOSEFQaVafzZohsc6Wg/6trvZQDabxs0LbCLSH
         /9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QMiXNxopmp/Lfafa2rBITuXAv6CIJtSHxYMTRHI7jeA=;
        b=uRmMzUGhfe7LBYmqOFknPVjGb7I5jCplsSCTEBZN/9G2rCDLQ1PpHuwJm+sHi0neCO
         6cT9mzdHK9vy82mdRIZ2qtRuo8VnGrMMChRKw/yAGODIVFsO5q8tTUuh6hyE1WCH+MSx
         5PPZOOt7pW5dTgJTKby7S6QiYnRvO/NgBoz3pq7Ds+H6HwIJe/U6Xzo9Hbuwu3MYuWYA
         8SVFi6GuyNJKjUvFHu6vZ7Az/Mn16CckMrtctaH/Mi6M/z/6UfLGA1ftppbswGEMIwos
         BVelIelruFh6vNlZOT7OZxIpPt7vBID++tR/D2sVyHXy6nYk619H1beTwBIi3GiIGydb
         2+1Q==
X-Gm-Message-State: APjAAAVccytXkpWbNbnbFBszL3t/HiNn+5zf4mmNSLKtFFtf489Gztn2
	IOMZppV8pPHTN1IcBKigdZsQ6ToIUMcpTU57
X-Google-Smtp-Source: APXvYqyy04H7vlHdZW+qF+FUwmMKFWOPSrvWPU9/z0qU957EL/RiQ9xSxPjBdja+YcnAqursU5QUUA==
X-Received: by 2002:a5d:4a84:: with SMTP id o4mr294643wrq.165.1568643350660;
        Mon, 16 Sep 2019 07:15:50 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id s9sm15185884wme.36.2019.09.16.07.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 07:15:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 03/15] target/arm/arm-semi: Correct comment about gdb syscall races
Date: Mon, 16 Sep 2019 15:15:32 +0100
Message-Id: <20190916141544.17540-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190916141544.17540-1-peter.maydell@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: yeQUzfW7q9Lf

In arm_gdb_syscall() we have a comment suggesting a race
because the syscall completion callback might not happen
before the gdb_do_syscallv() call returns. The comment is
correct that the callback may not happen but incorrect about
the effects. Correct it and note the important caveat that
callers must never do any work of any kind after return from
arm_gdb_syscall() that depends on its return value.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I'll come back to do the cleanup later, but I preferred
not to tangle it up with the rest of the refactoring in
this series; I also think it's probably easier done
afterwards rather than before.
---
 target/arm/arm-semi.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 51b55816faf..302529f2278 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -217,10 +217,21 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb_syscall_complete_cb cb,
     gdb_do_syscallv(cb, fmt, va);
     va_end(va);
 
-    /* FIXME: we are implicitly relying on the syscall completing
-     * before this point, which is not guaranteed. We should
-     * put in an explicit synchronization between this and
-     * the callback function.
+    /*
+     * FIXME: in softmmu mode, the gdbstub will schedule our callback
+     * to occur, but will not actually call it to complete the syscall
+     * until after this function has returned and we are back in the
+     * CPU main loop. Therefore callers to this function must not
+     * do anything with its return value, because it is not necessarily
+     * the result of the syscall, but could just be the old value of X0.
+     * The only thing safe to do with this is that the callers of
+     * do_arm_semihosting() will write it straight back into X0.
+     * (In linux-user mode, the callback will have happened before
+     * gdb_do_syscallv() returns.)
+     *
+     * We should tidy this up so neither this function nor
+     * do_arm_semihosting() return a value, so the mistake of
+     * doing something with the return value is not possible to make.
      */
 
     return is_a64(env) ? env->xregs[0] : env->regs[0];
-- 
2.20.1
