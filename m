Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1780934lfa;
        Fri, 16 Oct 2020 11:42:12 -0700 (PDT)
X-Received: by 2002:a62:cfc2:0:b029:151:d47e:119b with SMTP id b185-20020a62cfc20000b0290151d47e119bmr4963194pfg.46.1602873732656;
        Fri, 16 Oct 2020 11:42:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602873732; cv=none;
        d=google.com; s=arc-20160816;
        b=bLkO4zZSdldIn/O0Hyp2XwnE2uOd3zYxano0W7OaGCVyLsJG9tye7MXUfrO1GTx33s
         JopWMTaS7ACV1PIvURVGggoSemMb6LtvEoSXDqeys9Er6/5Cy0aSa+DgfBxThUqAuyvo
         EvE4mbrZHkP8WyDNxDqTNrekZQn3ifDpNRCSCPyW6QmTQT7o5PLAlQXxPj7AZHQYPJhj
         o6DjgYQTCiu4RPNIx5TjNOr6zpub7guQZsM3mLA0w+rmXhljD4XCEjQxLeR+7qBgynTD
         E5q9VmWGOFpxfCz/vTIhMhTNrTKtVmDsNrtMmOALIU813nQ0UTJNZD5Y7xZVG08piV3S
         bKRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zVLgn+OX/nTD/oUAFauTpXTtA86xiUG6+rSs26rONZM=;
        b=Kh7nVVLCHpihJK6QeAriK+XINb5+mIpyF5H8RYAeEtQ5I/7Q9FqLmyUW2JJ6NUTmRX
         toUKe9oBEm8tPht1xtddWShxdfR9pRp0wWwBFI3e9Wdqn6nx7wLeyRQw4D5+OPi1IcR5
         thf0W03pCjZZQjAfQqqYd7GM/hDJGqNyO9mGN5AaFBVjB6ipzXC9XCCyGzWJkvOWp3hf
         0qAohjunhFw0/ySShadI6eNdUnDkxIRI0WOHmG5/sbEe6dZe6Fx9ZdBU9F+4deStrDJY
         QeTT+7bvMQofwP/pVx1ZimEcfwBCst5aEHS05u5KBphcItRZLq89xixGfu/nh2MUffjm
         6Rhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X3da8qp9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v128sor1678750pfc.4.2020.10.16.11.42.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Oct 2020 11:42:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X3da8qp9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zVLgn+OX/nTD/oUAFauTpXTtA86xiUG6+rSs26rONZM=;
        b=X3da8qp97zHh18bfs//PjWRI7eoJKP8qXb0hu58E3tvMElVxzcK3VZXcftBvUJWUZT
         Zai2wqepNHmk1CYOF5UTMOKYyz4PA4wSzIWCo730xtyFo0jlab8MxR+hEHylDunD8T+/
         8a9sE6vx+TRM2aE/piEXv8PGGaGtqFSOSajShCv9vLqHwga2QjVNwYLQl37WVDi/AlEs
         2E25smK9Gelcbp0eKbc/yebt6xzGMSAFXKFHDa6JkKaXelqKYxbtckbQDC9VObKscCkt
         3M8sa0V2vmrsbIpvz+FD8HbVeCxO3dT6aHFWZrcaCdUoPwMGwyVekz6qPevPYNGK/rbr
         sTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zVLgn+OX/nTD/oUAFauTpXTtA86xiUG6+rSs26rONZM=;
        b=UZv/2jj24srogGENMzQf013SNaK24KLMUT3tUbfp7A2gMqMTuWrVJb+lexELb7M/EI
         UmGZ0VJyoo0StAnNRbA+mxzICgkezo0dPJdiIhpLEpJrNmyvV75lq4UezIKKjPIV1/sM
         pUo12mbDZ2OYVPoRj9Nup0kNgSl9K06ZvvY+bdGyMSdGLe5dVq6t17JZi7yKHAfk4JL2
         kwsKNv3HOTU7PG07eX5DjiCD8gDYYwTP4nYWcOPMdcgsFyobJ2TSapE0tWj/jCVzEajQ
         fzDXclwgqrdXsUL8Xx4JLB9YyLpIt1k9P8aFkklDD980LyvDaeZxkRBn8KJ+OSHTXEGD
         S8aA==
X-Gm-Message-State: AOAM532wtCByqSwP/TrYFK1eACY9Au0zHY7OIfzN6mXfuno66Ek29/0E
	0oqeq2qiSqJdFENyhf7jZCrXmveA
X-Google-Smtp-Source: ABdhPJyNq7fQaW86kRVsgO2N4V68S3cs6eqwd5iqB4LY7We4DRd3XSUVc72nxVezT5wMoWiFIC74Og==
X-Received: by 2002:a62:5b81:0:b029:156:2dce:5aa with SMTP id p123-20020a625b810000b02901562dce05aamr4938299pfb.15.1602873732189;
        Fri, 16 Oct 2020 11:42:12 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([71.212.141.89])
        by smtp.gmail.com with ESMTPSA id c15sm3426011pgg.77.2020.10.16.11.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:42:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	laurent@vivier.eu
Subject: [PATCH v11 01/12] linux-user/aarch64: Reset btype for signals
Date: Fri, 16 Oct 2020 11:41:56 -0700
Message-Id: <20201016184207.786698-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016184207.786698-1-richard.henderson@linaro.org>
References: <20201016184207.786698-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 1Lm3Bcbzvydo

The kernel sets btype for the signal handler as if for a call.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index d50c1ae583..b591790c22 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -506,10 +506,16 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
             + offsetof(struct target_rt_frame_record, tramp);
     }
     env->xregs[0] = usig;
-    env->xregs[31] = frame_addr;
     env->xregs[29] = frame_addr + fr_ofs;
-    env->pc = ka->_sa_handler;
     env->xregs[30] = return_addr;
+    env->xregs[31] = frame_addr;
+    env->pc = ka->_sa_handler;
+
+    /* Invoke the signal handler as if by indirect call.  */
+    if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
+        env->btype = 2;
+    }
+
     if (info) {
         tswap_siginfo(&frame->info, info);
         env->xregs[1] = frame_addr + offsetof(struct target_rt_sigframe, info);
-- 
2.25.1
