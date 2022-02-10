Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp1287738lfk;
        Wed, 9 Feb 2022 20:04:50 -0800 (PST)
X-Received: by 2002:a17:90a:1a4c:: with SMTP id 12mr765360pjl.82.1644465890182;
        Wed, 09 Feb 2022 20:04:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644465890; cv=none;
        d=google.com; s=arc-20160816;
        b=Gq21+v8vKeTRbMt6/pe3KUZus9sEwOpQ8Ngps9NweDWuevZVznV3Qbk3sBTVMAjPAs
         Ix/oYgwI6V/Nk0OJfXoExjBRf0PTbYACzS/6ekf/frBOG2UJObKtn5LYtyo/yLC2AEte
         YMuNkcy1SDTJb5yWJi8BWfGp4v1NM5lE+50fvEmxKhVvJ/UFroUeS+LUBFADF1kf3iMM
         ddLtZSrvAapv7baiCNqHUflC4KjbVq3K8oNbiQs0kEkPEfqsxlv7J4QpYaq30ronpCZd
         fxBmceU+XWOktsd/ZaQlR8iyd2GCmsKmRgrOf+udYLdPK1Om8pu4ufRm4SXdFYduuyJ8
         alAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=A0BDFAPkSF6UtdIiOcrkoG8O0FSVru9MSa+YtK3MJG4=;
        b=DOuMaDwEar0Br2bXZevQvT0L/BmTe0CP860toQgmFPD/waZAkxveK+Oid8eV5VZe9b
         5oVBTld0m8omB+Swk5ihzbRtizRLe75K0iX5iHtvjApreh33bALHiwjNvxFPyNQiSuFA
         UODz6lmz3prhb/k6smXu0sKH22zxTqL2K4YQqGbtaj5ULJRlpaEMRkkGhukO6+zcPUZi
         9ymEwgFqoe0QypvFDYEydpXmq7bJWXKn/S5pNvDNzFL71qJto3D06D7eFVXd8v6Zjrxn
         bPuS4JVEBZ3+04kXEIuDDRTOpvF+PspZZwrn+jh17yCbAS03NHJsrbzRWJd+ald2cij2
         OcWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VfVSvp1X;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k130sor7295264pfd.23.2022.02.09.20.04.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Feb 2022 20:04:50 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VfVSvp1X;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A0BDFAPkSF6UtdIiOcrkoG8O0FSVru9MSa+YtK3MJG4=;
        b=VfVSvp1XHZhiM2vUDzkt3W1s8VjmnrZSjQVXCAsUprBedlGa1jLQnBI3S10ed6eTkF
         l5ayso7ftaaj0A36mQE3C0R/k8bFhU6V6PhhHVIKEVZMwVr9ctdk7jesG9KeWkDdI/8V
         o/knUIJNEyznA6uRWUkKqEXxmkKe/g2era05Xk07g1wgRx8xLobvkFUXI0WvhCNSB4Np
         wD+b7eczMzEQ/HEU7cBFQmzXSkvjH3uX+JDDJFe7y/wXtiGrkD4zBk2ghs8+A+7Goj1c
         8U+Ee0vEysRJ6y6JLQcRRNiwKo9d3RNTKLhJzc/vF5ONgPMB2ykRsLj1YzuG8PI/wU0r
         RMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A0BDFAPkSF6UtdIiOcrkoG8O0FSVru9MSa+YtK3MJG4=;
        b=NL90NbBq5iGxB8mjhqnByyswR9TRKCJQ8rdxztq38CEiP0os8txYZoAIy6oxEHKyRx
         rzFlZKWoMWHOB5ab4eVx5vlsDs9XjdEOibG50f9AFktD6kzEt1NthRaMhmk2QjDGWEA9
         honv56A7zDPqCijzpQX2DbAbfpdyGfVW66m+gb1AgVo3iHDsSGna3Cy1iYaWA2nt6APo
         aPeAKNblz0sMxCgaB3U4kCxZ2g4RlzjLIvpWZHDO35uEaMcCZrAOA2DncNifO+lfoAjH
         yoazcrzpyCn7eZp6vylSvyIwZ8IyrXfyRwVCaMuWZpeIyQdWNgvaK+2YHkqkXf1sEi2e
         YVug==
X-Gm-Message-State: AOAM532sFxOzTc5xJqg+JY8rIBvuri9TVffaokajqww7kB7QNJaMnRMV
	JrNUlk6XeOZ5gqfhxxWvl3xAJ2p8
X-Google-Smtp-Source: ABdhPJwuZMsepO9q9/j09tINpIeynsZrU3+PTyL0HJCWT7jZ611no/AYpjpImPucm2E2oBFeJkptXw==
X-Received: by 2002:a63:690a:: with SMTP id e10mr4589146pgc.599.1644465889715;
        Wed, 09 Feb 2022 20:04:49 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([124.189.222.164])
        by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 20:04:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 06/15] target/arm: Use MAKE_64BIT_MASK to compute indexmask
Date: Thu, 10 Feb 2022 15:04:14 +1100
Message-Id: <20220210040423.95120-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: LdKa82UqCnsj

The macro is a bit more readable than the inlined computation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index cf38ebd816..94304804cb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11516,8 +11516,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         level = startlevel;
     }
 
-    indexmask_grainsize = (1ULL << (stride + 3)) - 1;
-    indexmask = (1ULL << (inputsize - (stride * (4 - level)))) - 1;
+    indexmask_grainsize = MAKE_64BIT_MASK(0, stride + 3);
+    indexmask = MAKE_64BIT_MASK(0, inputsize - (stride * (4 - level)));
 
     /* Now we can extract the actual base address from the TTBR */
     descaddr = extract64(ttbr, 0, 48);
-- 
2.25.1
