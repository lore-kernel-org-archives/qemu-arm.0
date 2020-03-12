Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087070lfc;
        Thu, 12 Mar 2020 12:42:24 -0700 (PDT)
X-Received: by 2002:a63:798a:: with SMTP id u132mr9730420pgc.203.1584042144366;
        Thu, 12 Mar 2020 12:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042144; cv=none;
        d=google.com; s=arc-20160816;
        b=ot1NLzw3uxT1zknz/pX3beFRKuJBmYN5qF4vIE235MYM6GLMJ1NY3dUNMcxXqiOsiJ
         rAk9IhTYeYMdRL9T8iMM3bmWdiTu10k6Mc0hpDjOgOoSH+JyLLa4VOHO0B8vMkVdqsPk
         XyOVGkrrngzcjgy2bU915tD3/o/mUrf2rKzgQYDIacUF29dAr06xHNcbNdtC8eYX/aJ0
         4CwRpjtvkRD0pPaKuJUYv9IAzbMZ4Cbak2cuAGxMiqp1cjstItW19blZiXQvdx99qQO4
         f2P3V2nL1oM/P9fVo8MOrfCA6VIe6XIrISk4KF3LoSEkvAL7YGNDqfinWAP+jVeltsHD
         jykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rGpxLm79CCdrNbLq46EhVbUpI55c0cfdmX2p0AxkOgU=;
        b=Ojb7cv85gh2g0BA8tEr0koBlj08SVBy+Pr/83RQQe9UlRdNfJ2t9I1e5CH0Kd6Vrln
         FlpwuuF19owkKnomP2lZUzMgv/CinqAJCVoJNAZX6Ty2pmZonA9JG+LC0GyKE0I6BQui
         K6P7GyQBkpsC0yIrjaAwp9UPesrY9Ilt4+KwBjdaVTTMiaW1XOvKuxII3g2QPfPIT+zE
         2qRDdixIefV08BvWmODr5xIQbK2VPMDjH+hH9zC9+e5pz9U3EwG0xscMhfHVNpC2Iq4z
         5BW1ymxYzswRsq2cTVDMBXJ8VhqTisitubYeFHwCs6lfjevSk/oDdHx6Yj9oPTkXwBen
         78kQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=maOYaX3+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z22sor6848650pjr.35.2020.03.12.12.42.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=maOYaX3+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rGpxLm79CCdrNbLq46EhVbUpI55c0cfdmX2p0AxkOgU=;
        b=maOYaX3+B9tNyub/KhSP8AclpZeniqojXcZkHxnY3XmvWUR23nXZm2ZY/UCMhSfyUo
         uZt1om1FYgtxoaOtBizkswF2S4u2Vb644HxciOjxh/3JPTO0blJjUmcJG77w9fCU9+I9
         pKp6cumbkSGkWqLHzSZRrxLmP10BUGbeY4AN4dHD/Pqldk/EJiXw81+5Yk/0bQcXnTJ8
         n3VdHtAXuddMi9bZHWePe0vW7pyIiqG6YOUJjJSRJZhEZhh/mNhbyQpLJIbu4jTlMG4B
         bLO1/FBHGwJMw27+7L84PufVWfCblzOpm5wcNdyblBFM4gNSyq+tkYaI0pZtv6wegVDm
         6Ssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rGpxLm79CCdrNbLq46EhVbUpI55c0cfdmX2p0AxkOgU=;
        b=NcYV+dghtEOCW2VCLTY/GWerWUsr3nlxiJfZVciS8rWhxJQd5jthbtDZIT+OlRm2yK
         PPQ2sHva2Y7Ta6oaKBTfWuWOwWZo5BSdwhAnWyos5qBAD91fnqPWszZ9DWJTWeWT9j4S
         Fss8a1KqsyjXiV5FYVrEwlpUhZylcuL3CF4tn4+A4vAPSpSa/XDBHB+fXcxQ/++lhmuR
         F/MoehsjB9KTEHorEb+aYCPJNbW2dZ6EY1jaJUbx0JJXhzSMILwMG0sutZnNPfjUpgUX
         Ttd2TJ9/MYNLFyj8EJxVsuANlHtxr0OnUdbR1PlHNZ8kri5fHSjlzk5AQmINjdSJY/NT
         hoKQ==
X-Gm-Message-State: ANhLgQ0JYEcmg/RmkbGVDBjIiUOjRG9E5jXwOGltG+r4m6j8ExD+45EY
	yENMu+fOj9KZR+ON3+ipSQDMgmsK
X-Google-Smtp-Source: ADFU+vubA8FNHNaedG9rokcg0Goayg7BEHMdZicUkQpwfspkEmMMVuNj2hbwlC1y88XIE3eraDmmiQ==
X-Received: by 2002:a17:90a:6545:: with SMTP id f5mr5984646pjs.42.1584042143854;
        Thu, 12 Mar 2020 12:42:23 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 02/42] target/arm: Improve masking of SCR RES0 bits
Date: Thu, 12 Mar 2020 12:41:39 -0700
Message-Id: <20200312194219.24406-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: pQY6QdEbOlgJ

Protect reads of aa64 id registers with ARM_CP_STATE_AA64.
Use this as a simpler test than arm_el_is_aa64, since EL3
cannot change mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8f81ca4f54..d04fc0a140 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1966,9 +1966,16 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     uint32_t valid_mask = 0x3fff;
     ARMCPU *cpu = env_archcpu(env);
 
-    if (arm_el_is_aa64(env, 3)) {
+    if (ri->state == ARM_CP_STATE_AA64) {
         value |= SCR_FW | SCR_AW;   /* these two bits are RES1.  */
         valid_mask &= ~SCR_NET;
+
+        if (cpu_isar_feature(aa64_lor, cpu)) {
+            valid_mask |= SCR_TLOR;
+        }
+        if (cpu_isar_feature(aa64_pauth, cpu)) {
+            valid_mask |= SCR_API | SCR_APK;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
     }
@@ -1987,12 +1994,6 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
             valid_mask &= ~SCR_SMD;
         }
     }
-    if (cpu_isar_feature(aa64_lor, cpu)) {
-        valid_mask |= SCR_TLOR;
-    }
-    if (cpu_isar_feature(aa64_pauth, cpu)) {
-        valid_mask |= SCR_API | SCR_APK;
-    }
 
     /* Clear all-context RES0 bits.  */
     value &= valid_mask;
-- 
2.20.1
