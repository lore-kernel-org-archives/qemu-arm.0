Received: by 10.25.21.96 with SMTP id l93csp539265lfi;
        Fri, 17 Jun 2016 21:05:57 -0700 (PDT)
X-Received: by 10.13.213.143 with SMTP id x137mr3011477ywd.253.1466222731300;
        Fri, 17 Jun 2016 21:05:31 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com. [2607:f8b0:4002:c05::243])
        by mx.google.com with ESMTPS id m187si14475343ywe.288.2016.06.17.21.05.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Jun 2016 21:05:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4002:c05::243 as permitted sender) client-ip=2607:f8b0:4002:c05::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4002:c05::243 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-yw0-x243.google.com with SMTP id d137so4907698ywe.0;
        Fri, 17 Jun 2016 21:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jRw0/tdOwzf4VLhyUtyIBR6vCyKVTp6WZxUupV/tJuA=;
        b=kZVq8wLeDXFPxWjaUu0E5vVeCFyuvP+WoBGNp3Wph376bJIIbYaMTVauiAORaasA1h
         T687pXI7Mz+LrPsqIN9rgZxDL7OWkCPS2guUS4mNrBYBLvRyVNTxoKo6J8jGXvvhzLz2
         K6Ny/l6PJW6PleEiLptmt8p4YLDxCeoBnUat/W4oGau1Bhl1qw6KocMTvCVAWwAkcKGg
         O1QlxukJiHZOMrgpEdEtXu5kGFyDmMuj1hcbMPlM2Dhz+ZzCocVdKQ13ooIuQFZTMlyz
         JMYiKqp7aadqQrp8ErGa1n3Ji9LFxZ0WmdRKbaqIJSDdFiRWR6ILzE6lATvp2KQ0Or8q
         0LiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jRw0/tdOwzf4VLhyUtyIBR6vCyKVTp6WZxUupV/tJuA=;
        b=eHMTdW0Yd5Cu9h6prZIoeNJ7fzca8+4xspMr+cLfnFfIQLVZLMmlJKb6fBW3mCQpVr
         CAnwPI0ZZcUUkhcVSOznMbpiGYkmLuWBkDok6KXm7js65KXOJP+vPlltHVwyZt8QNi85
         IXlrpDqyPGao3AUPJDqzaT1mLcWDLGiMPegnsKO51wEc04gE+/SaGNw1i/kWzQfGZ1Rr
         FXz6+YXq79ShwmtHoBP3hHHaO0jfqVqFbUSFSMWuTihLwHU9pBZMDZIC6hhji4LZvGTI
         PoIt/tL33KSEyJslEHTg/KZ1TV/g9wla+4ePfAYVaR3UpXK+v4Z9vkLiwLGtSDe5J6gl
         n7JQ==
X-Gm-Message-State: ALyK8tIn2R/v/QGcHT+is3ker9NawaaD2zyRSWHVm4dLu02Rd/XZqXLVeB5turl1+P31mA==
X-Received: by 10.129.81.144 with SMTP id f138mr2991110ywb.154.1466222731002;
        Fri, 17 Jun 2016 21:05:31 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from evgadesktop.attlocal.net (108-232-152-155.lightspeed.tukrga.sbcglobal.net. [108.232.152.155])
        by smtp.gmail.com with ESMTPSA id q7sm19517992ywg.16.2016.06.17.21.05.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 21:05:30 -0700 (PDT)
From: Pranith Kumar <bobby.prani@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM),
	qemu-devel@nongnu.org (open list:All patches CC here)
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net
Subject: [RFC v3 PATCH 11/14] target-arm: Generate fences in ARMv7 frontend
Date: Sat, 18 Jun 2016 00:03:40 -0400
Message-Id: <20160618040343.19517-12-bobby.prani@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160618040343.19517-1-bobby.prani@gmail.com>
References: <20160618040343.19517-1-bobby.prani@gmail.com>
X-TUID: pUj9C8YP+y32

Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 target-arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target-arm/translate.c b/target-arm/translate.c
index e525f1e..012e450 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -8054,7 +8054,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             case 4: /* dsb */
             case 5: /* dmb */
                 ARCH(7);
-                /* We don't emulate caches so these are a no-op.  */
+                tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
                 return;
             case 6: /* isb */
                 /* We need to break the TB after this insn to execute
@@ -10403,7 +10403,7 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
                             break;
                         case 4: /* dsb */
                         case 5: /* dmb */
-                            /* These execute as NOPs.  */
+                            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
                             break;
                         case 6: /* isb */
                             /* We need to break the TB after this insn
-- 
2.9.0
