Received: by 10.25.27.66 with SMTP id b63csp2226358lfb;
        Tue, 31 May 2016 11:41:09 -0700 (PDT)
X-Received: by 10.129.98.138 with SMTP id w132mr18904579ywb.191.1464720039847;
        Tue, 31 May 2016 11:40:39 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com. [2607:f8b0:4002:c05::241])
        by mx.google.com with ESMTPS id j62si10578158ybj.242.2016.05.31.11.40.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 May 2016 11:40:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4002:c05::241 as permitted sender) client-ip=2607:f8b0:4002:c05::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4002:c05::241 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-yw0-x241.google.com with SMTP id n16so20123382ywd.2;
        Tue, 31 May 2016 11:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=h8VXdB3wdqJ7PGEFtlTztqnyc6qs2clD/TVF4jvmzxU=;
        b=ztzkocJdpqaRbmYENFTUm/HvG2zzF8ZbFnKbTXIIBqkFa9Q+do3Bx9Rn19YnNVgH9O
         IFtCHw1AY9OcfzIExfEDdROZZSULpX/QTKIYts+qaQLK2783wg5f3xwEIIpotZ6Qpv9n
         9cqqyEywZ3q2FcC49KxM5H5uJdUs8HRGLPS4HHZhS9TnbLeKmIAvD6a2zVgilcVoxsyi
         zXTXWelVEDr9ICs0ErE4HlSvez9ICepr/E3Myn49V4Au63oG372LYzU7wSJNJUVeOssR
         CZ3QwarDxOFrN2/42jDLEGSJsuIHQav92R9jY06O/e5mwPviB5eFTL/eE9djN9+FOEWf
         rkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=h8VXdB3wdqJ7PGEFtlTztqnyc6qs2clD/TVF4jvmzxU=;
        b=QiULmZE26a61H2ZkrdrfA9VVwU8qCU1kjm2UWa7IqRXBnzw7A9PYS9FMKUQD1ZG/sU
         cvzlKqOLbkacqQ819Qnp3TX+r2JdLPvkM8TRQWuRHCjnMvGvThZF0LibPXa1d4H/8UFx
         aKQ7yISZgMjZ5/zXRu9dW1zq9HhCU3iBX9cCVbDYJ5x7TToce0aNp/FpTwfqcXBNKK8A
         qhv3Y6dSQsmYI8Wx7CutlLtGXzL6mJr+J8lJ52kntY5GehDG+1y1jDhTf87LJIowBkzg
         t4KBftD3X/xnKHtQ8hJlp05LWqsF9c7TnT1jjk33pU5BatJJBqND6hePhQ4iXZITKnKo
         L8MQ==
X-Gm-Message-State: ALyK8tLaqFBAdEvpxkdKctDmnlDBMzyag6e4uHp+FKNmQAdO+9HaUfsUpCCpNTngGNqRtA==
X-Received: by 10.37.115.75 with SMTP id o72mr10790837ybc.132.1464720039424;
        Tue, 31 May 2016 11:40:39 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from evgadesktop.attlocal.net (108-232-152-155.lightspeed.tukrga.sbcglobal.net. [108.232.152.155])
        by smtp.gmail.com with ESMTPSA id c62sm17150085ywf.12.2016.05.31.11.40.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 31 May 2016 11:40:38 -0700 (PDT)
From: Pranith Kumar <bobby.prani@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM),
	qemu-devel@nongnu.org (open list:All patches CC here)
Cc: alex.bennee@linaro.org,
	serge.fdrv@linaro.org,
	rth@twiddle.net,
	qemu-devel@nongnu.org
Subject: [RFC v2 PATCH 11/13] target-arm: Generate fences in ARMv7 frontend
Date: Tue, 31 May 2016 14:39:26 -0400
Message-Id: <20160531183928.29406-12-bobby.prani@gmail.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160531183928.29406-1-bobby.prani@gmail.com>
References: <20160531183928.29406-1-bobby.prani@gmail.com>
X-TUID: 2BFVrYsK2h/G

Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 target-arm/translate.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target-arm/translate.c b/target-arm/translate.c
index c946c0e..e1b16c0 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -7980,9 +7980,11 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                 gen_clrex(s);
                 return;
             case 4: /* dsb */
+                ARCH(7);
+                return;
             case 5: /* dmb */
                 ARCH(7);
-                /* We don't emulate caches so these are a no-op.  */
+                tcg_gen_mb(TCG_MB_FULL);
                 return;
             case 6: /* isb */
                 /* We need to break the TB after this insn to execute
@@ -10330,8 +10332,9 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
                             gen_clrex(s);
                             break;
                         case 4: /* dsb */
+                            break;
                         case 5: /* dmb */
-                            /* These execute as NOPs.  */
+                            tcg_gen_mb(TCG_MB_FULL);
                             break;
                         case 6: /* isb */
                             /* We need to break the TB after this insn
-- 
2.8.3
