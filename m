Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1944624lfq;
        Fri, 2 Oct 2020 14:59:59 -0700 (PDT)
X-Received: by 2002:a05:6830:1506:: with SMTP id k6mr3078821otp.142.1601675999648;
        Fri, 02 Oct 2020 14:59:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601675999; cv=none;
        d=google.com; s=arc-20160816;
        b=iALIJEmpLNto3EXucRd9HC5WwVSlHCYyssimTaCL5J0TPGXe8vIKAwgKw9h8wktwh0
         q/fzIBL7mZjAHYL/syzqXjOGIc8AhtNf1Zs66gVxdazSP3bg6/Te46W/ym1x+drsE93R
         xmXghMGkf6NYMcMecJKM8NpD+tJcgSNP6bjv1L0idoFup7QJjpl5dwgoLp/NjAbCBclv
         JiLfCZDoeslIfwZ+43PIMHW5M8kLNm+vSeG1MAPBd7r0qB2ZN8oTPVJkpGEp1UuSbZrd
         QXN8TUY3UXMassjUAB/XpqbVEnyRXarIIeHKJ+CGxYHE7Hy7oOeSbQ5bVB4bH72ggn6l
         qPaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zVLgn+OX/nTD/oUAFauTpXTtA86xiUG6+rSs26rONZM=;
        b=e9PiPYARu6OYS+8lqMipy+RiUqX12dAgeL3bZx+0Jxj0liPy0a5dmfYHiWy84Q7V1Q
         OAWkuFHntyXrgLg/WGBWaFWHiOm9wo6vzEuk0zBbZvQ2y+6WjBWDx0iwq17joRAbnQac
         U5PYVqcHiZCzpR3eI/WoNszrEUtMr7tJ48FU3uCDmzT79ZBufg/lYG7hdT289wsxspdp
         oV6GmAtAyoXkNelv0czUqUi7joTrEPReaoNdKqR6j06wNY4qP2dHULby7Oq3Gr45wJzR
         wO/lcczOnLRuAgkZLSpij8kK5yvioxmvNwHJ4V75eGtgpglC9ip5iYo0L4BtDKv3k64s
         YRlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mZf3ei3K;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v129sor1352916ooc.8.2020.10.02.14.59.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 02 Oct 2020 14:59:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mZf3ei3K;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zVLgn+OX/nTD/oUAFauTpXTtA86xiUG6+rSs26rONZM=;
        b=mZf3ei3K0SiIqpW+c5uWCNbm2ueVTT5/vAmHbsu2rR/KjUJHZrOXhkwRax/5I7x3oP
         2Dl9Sq4f1iRROEp8QgfSJRu/U4uv8opg6mRo3zyQEmOhbwMDys6EQ8Ev28eQ/uxCBu0x
         mRjvNGcUgDhRh3e9Fs7J8NaS49+rPfrnWw5DKG19+vLajb+4aOX5SVOLjXLOhbJI++kJ
         V8G6AlBwsILhn3kLOe8ozGtt/3WYwcsjvtleVvnGiKiLNp3nRNcx4V9teyKyHPu/AHhO
         egLqObZdC0c1DJU+oQVQa59HqvYOisS2HkT2AvOb1zjZRHQvPliP57PLHkAF1gZTK0R8
         maZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zVLgn+OX/nTD/oUAFauTpXTtA86xiUG6+rSs26rONZM=;
        b=prXAgbE0hkoMnCVplc9+iGqe4YEd3/rf/eh5/Pqi1y/UVzh4p9scYQlxv/Ug26gfpZ
         QG8nTq8rGWhBNQa0l4Hdl6Afu8SDYZ2QsIVvcT4P9JBZ6SDYfeiZY09oeblzVuRT0JPQ
         o76jA0hpmQx/MsWj1vIb79eX+a8W4KyHomBRpxClr6QKR7Gm3hlo8hXTvsgfrgoDeOmo
         mMnhkw5CxTM7QqPXuFerBAWR8oDHppC0LCcHi83cudBZ/FzzmAhzcGkL/l3IB7YSgVKq
         k+lYHNceL2pFJj1UlrJQKn0Vklk/HxSQLW2t5DBx7MmXi0AATxLSU/83JA+6q1c8Ur45
         fE6w==
X-Gm-Message-State: AOAM533yFNG8W+7hhHk/lSqDWkuiQJgJOJevS4/NFGfCxBrO98lHWk+X
	dEqHfol57tiIuZox+DqoHuTmvA+T
X-Google-Smtp-Source: ABdhPJxJAFr0JUaS6cov/1LQ671Bk+7vDG2Ga/BMZ0JmrVqdOhTUGXlMYCYdV/jZkdtiFba6kZf34Q==
X-Received: by 2002:a4a:b40a:: with SMTP id y10mr3402836oon.71.1601675999237;
        Fri, 02 Oct 2020 14:59:59 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id k10sm684268ots.60.2020.10.02.14.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 14:59:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	laurent@vivier.eu
Subject: [PATCH v10 1/8] linux-user/aarch64: Reset btype for signals
Date: Fri,  2 Oct 2020 16:59:48 -0500
Message-Id: <20201002215955.254866-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201002215955.254866-1-richard.henderson@linaro.org>
References: <20201002215955.254866-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: iahOxQJnlejz

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
