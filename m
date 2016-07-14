Received: by 10.25.21.156 with SMTP id 28csp272777lfv;
        Thu, 14 Jul 2016 13:21:28 -0700 (PDT)
X-Received: by 10.37.77.85 with SMTP id a82mr3456420ybb.155.1468527658995;
        Thu, 14 Jul 2016 13:20:58 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com. [2607:f8b0:4002:c05::241])
        by mx.google.com with ESMTPS id s6si1686107ybf.216.2016.07.14.13.20.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jul 2016 13:20:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4002:c05::241 as permitted sender) client-ip=2607:f8b0:4002:c05::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4002:c05::241 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-yw0-x241.google.com with SMTP id y188so5582839ywf.3;
        Thu, 14 Jul 2016 13:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MBq+AsdNjrmy9HJlSEq3KgJj1kUjeGxzK6ICXpx5d4A=;
        b=krUURf0JGgKA++kdLXhyv5hpGd2Y2oWMfi03VOYJ66AQyLDuRbU0qb9fpnRVY/WYf+
         ZMcMWSHkTxF2Zw3+tDcvnY+AfRUi85awIXq0XnHRYmXDe7YSOop97Mo8fH29xySihPQp
         7zYMdAqBY9SQ25pIz4CvD/38OM6E8zyY/KcYp42ajq4yipWIvJOrg/4FM2YGtJSvrsdv
         yh2K8t/R9eiGgVYZQKM/ElftuRyuzj3+n1I/MS56IkK+r9N+ZrQx6yV9X4q14kLAFrFr
         6bmvGQNjxg+nLzr8NE0jt+tdnTqhIlgN//9UoWqdZ4mqQemHxri6+41Wux5qyt6Y6UaD
         8tqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MBq+AsdNjrmy9HJlSEq3KgJj1kUjeGxzK6ICXpx5d4A=;
        b=MaNvlQklDIDO7GRjaHW6OZpP5gNQ8wGKsi94BYbWtMhp+XkZnBfwkzOap6wnyXtl23
         dUhGo0G1qF9Tq919miOIhTFtGlffx4KSkgGph55jcJPsL7FsLKKmPJYYLn/BMHCZ2aza
         cdtg6XsnZxDdKFM5MmXfNOww+ODJXnS5x1oXRA9obgllvrN95lJk2CaOtdcCB++mA9ur
         iHQ0/xtFeKDet9Q6D3jGUcX8dDqVCehQqDnd5bLpjHKt7Tej8McnOwAu57um43vZnvIt
         ZHdH/PIbQVVmMKDHVzAMuxDM9vqjyQSKh4z2mrzl2TnX7DWJO5GPjMut3WtwhqKWRQEU
         +fWQ==
X-Gm-Message-State: ALyK8tJo4i0ku6KLCOmBU7EdrbZV+IpjcMg2IF2xsxjsqbDQhE6MxNxaMalGklhdBIOHMg==
X-Received: by 10.129.101.137 with SMTP id z131mr12931301ywb.88.1468527658673;
        Thu, 14 Jul 2016 13:20:58 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from evgadesktop.attlocal.net (108-232-152-155.lightspeed.tukrga.sbcglobal.net. [108.232.152.155])
        by smtp.gmail.com with ESMTPSA id v68sm1634604ywg.31.2016.07.14.13.20.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 14 Jul 2016 13:20:58 -0700 (PDT)
From: Pranith Kumar <bobby.prani@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM),
	qemu-devel@nongnu.org (open list:All patches CC here)
Cc: qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	pbonzini@redhat.com
Subject: [PATCH v4 11/14] target-arm: Generate fences in ARMv7 frontend
Date: Thu, 14 Jul 2016 16:20:23 -0400
Message-Id: <20160714202026.9727-12-bobby.prani@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160714202026.9727-1-bobby.prani@gmail.com>
References: <20160714202026.9727-1-bobby.prani@gmail.com>
X-TUID: kvoL56NXXEuV

Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
---
 target-arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target-arm/translate.c b/target-arm/translate.c
index bd5d5cb..693d4bc 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -8083,7 +8083,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             case 4: /* dsb */
             case 5: /* dmb */
                 ARCH(7);
-                /* We don't emulate caches so these are a no-op.  */
+                tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
                 return;
             case 6: /* isb */
                 /* We need to break the TB after this insn to execute
@@ -10432,7 +10432,7 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
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
