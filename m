Received: by 2002:a0c:df87:0:0:0:0:0 with SMTP id w7csp1732361qvl;
        Sat, 22 Jan 2022 10:24:47 -0800 (PST)
X-Received: by 2002:a05:6000:1d91:: with SMTP id bk17mr8072544wrb.684.1642875887261;
        Sat, 22 Jan 2022 10:24:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642875887; cv=none;
        d=google.com; s=arc-20160816;
        b=d+zZNCMwbF6kWLdM03Ckc0W8TkyZsuekPZLnT2ZhAdtl2fDeH/y2NQI1pnerDn486c
         UzYw9lPCUQrPFZ125S7VUSbQFUl3GOXwUpgkKNJdKKMabM5HNnGtKVV2MJbn96G5MRn0
         u71HDBhpnugBblPtX1ED55bItkITbUm24yDfnTaBN7io6atNbjpiO1UQ9kBXnD5AK00H
         +eRKNF0wkEqZJ4P9ZM3cXmrVk3LKYpSzVOo7LUdgUQBxUZKC5izN66udMVmZ7csjq9kr
         AByyTHQqQDrfY6FXXOf0toI7TGrLDpibdG5LajJZst9ZKim6ZM9yY94vs5u+BVBWH4se
         9ZfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=SCrj7rNy2XEjALr0o1+JBZ5xuS0aEYwNUaRqVuv6c+Y=;
        b=OyQJIbTmkcGgz8HzxiykCFYUL5ltoLxRabkx+q5RCTQPfauGns41E0eV0P7ypaNzlj
         HtLOmuu9sPNv80Y/PxVWvNB+LFAbA8UTgomh88LBM3Yl0kpPl8sTnz9Jt4h8o2crhkEk
         0L2OYds9O5Rbsyh1OrOGF7sOr/O/ODN5zC9XSfHiz9sB8s1DMZujo0UMzXDJAAAA1Fao
         2YpNFNgdhynJJPVnfaOuD9pUAHzb4QmlWYfB7XHhUYRNb0bMd17FEwBLmBwicSw1u+Tv
         9lnQnonv8GEEz0wVXDV8jDLMu0qzFwrnKwjnoxrst1rgyNpLt2w/WEQEri5BIB9c00T3
         Z1UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="p90Z/PKg";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o14sor5675677wrc.6.2022.01.22.10.24.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 22 Jan 2022 10:24:47 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="p90Z/PKg";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SCrj7rNy2XEjALr0o1+JBZ5xuS0aEYwNUaRqVuv6c+Y=;
        b=p90Z/PKgAG2Ho6gU2HaBmCXKaLi2mbclp3rXSdOtHjljyoODr7eJGSLqMZmab3pYGQ
         Oy1SC9AYR/GBiNucTdm0/QVW4DJWM5ufT3Zy8BPw1f4/XkTkq6otLx9P47ftLg3SlC8Y
         4mJSOdoxB/ayWpSABFPRsIhtBM5zqKvuF+g+vZVTE8OYvDUk8Ka3SQZAfAfXcUy73PoL
         +E92GJn6kBTcHzBwHnzb1S8mvUx+MvwQ+bU1YMPkkd+utTBWeKBTZscFkZG22kL8e+Ad
         88wbcfEOiG/HyphbTlLZEYwZJi07W+BAPGMxErD8X6yBgz0AeiAtszXls3wTRHYuJ5rr
         0p4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SCrj7rNy2XEjALr0o1+JBZ5xuS0aEYwNUaRqVuv6c+Y=;
        b=FD6n1751qPSiqYca29U62uf1p5/DDphTadv5ytD7buk47ZWobQYZ9FuQA1er09POUs
         wl9WyNf4nr1fRpARBUfKynAOQCEMCGvHhdkszfQS4GOwRpA7F9FPZ4r1WKwCiO7zQJ5v
         Gazp2fUb9tQFQ9wECdIYupE2FKwkV8IiLvFeymdT07KbYW8MGCv+kyzuGe3sfML8RMgm
         4xAiZyiSIwqV7WuNjjWyFN2lu0tkvaaTs7/3jzilG8j8qwRtJfLAxpqY1E5SpCyHyYb4
         YSxqqOEQy9PVW+VgGO4f9ag7OrasPGrtgg8A32gDOFyVJOSSNUFP82VZYW45gHPvvxM8
         VrQQ==
X-Gm-Message-State: AOAM5321XGzoGG/aqivLdo/+B4rS8xZuNtfTzCEUhFpi4W8grAHxTaeA
	vzAzPfPlZ4wGQCvE7HOIFJOWjUozk6qrM1FN
X-Google-Smtp-Source: ABdhPJwQtm0NeE3oYJPBCWBy5upvnbKIwYNs4lZpMwn1Bg1KjHGiJ3U4i/uyZ/zJVco7n0yPCCDpSQ==
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr8613731wrv.521.1642875886981;
        Sat, 22 Jan 2022 10:24:46 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 21sm8870774wmk.45.2022.01.22.10.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 10:24:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 01/14] target/arm: Log CPU index in 'Taking exception' log
Date: Sat, 22 Jan 2022 18:24:31 +0000
Message-Id: <20220122182444.724087-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122182444.724087-1-peter.maydell@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: UXHwl1qfLdvS

In an SMP system it can be unclear which CPU is taking an exception;
add the CPU index (which is the same value used in the TCG 'Trace
%d:' logging) to the "Taking exception" log line to clarify it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 2 +-
 target/arm/helper.c    | 9 ++++++---
 target/arm/m_helper.c  | 2 +-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 89f7610ebc5..3f05748ea47 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1130,7 +1130,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                    ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
     __attribute__((nonnull));
 
-void arm_log_exception(int idx);
+void arm_log_exception(CPUState *cs);
 
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index cfca0f5ba6d..4df12394021 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9317,8 +9317,10 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
     return target_el;
 }
 
-void arm_log_exception(int idx)
+void arm_log_exception(CPUState *cs)
 {
+    int idx = cs->exception_index;
+
     if (qemu_loglevel_mask(CPU_LOG_INT)) {
         const char *exc = NULL;
         static const char * const excnames[] = {
@@ -9352,7 +9354,8 @@ void arm_log_exception(int idx)
         if (!exc) {
             exc = "unknown";
         }
-        qemu_log_mask(CPU_LOG_INT, "Taking exception %d [%s]\n", idx, exc);
+        qemu_log_mask(CPU_LOG_INT, "Taking exception %d [%s] on CPU %d\n",
+                      idx, exc, cs->cpu_index);
     }
 }
 
@@ -10185,7 +10188,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
 
     assert(!arm_feature(env, ARM_FEATURE_M));
 
-    arm_log_exception(cs->exception_index);
+    arm_log_exception(cs);
     qemu_log_mask(CPU_LOG_INT, "...from EL%d to EL%d\n", arm_current_el(env),
                   new_el);
     if (qemu_loglevel_mask(CPU_LOG_INT)
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 2c9922dc292..b11e927df1d 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2206,7 +2206,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
     uint32_t lr;
     bool ignore_stackfaults;
 
-    arm_log_exception(cs->exception_index);
+    arm_log_exception(cs);
 
     /*
      * For exceptions we just mark as pending on the NVIC, and let that
-- 
2.25.1
