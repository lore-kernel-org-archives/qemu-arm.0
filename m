Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4067989wrp;
        Mon, 16 Sep 2019 07:16:00 -0700 (PDT)
X-Received: by 2002:a7b:cf30:: with SMTP id m16mr7822591wmg.165.1568643360829;
        Mon, 16 Sep 2019 07:16:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568643360; cv=none;
        d=google.com; s=arc-20160816;
        b=HuKLYFf6ZxYdqwdMsE5NVqNrBTjokwOXDJxPe3bFLr2O2GbMekoMCm3GUVlojJ+JYe
         RCNXW7D18nwLGWgzPi/KJzQB7xrwDH8jOAgcu+bUcdI0yRw6IcHlZzzuwpUYeR12nNrN
         i8DelccTkTar74adnNVb2jfrr8aZMX6bT5bRrETDynRFuWY/Te+8hfzZyTWbwHZZ8TVS
         RV8Nt08xbEpBjlTzUj6ng3GkfaMP6o8kK2DzsBAT/gaEi2iMDWXRn5ygEgWUmMkiujNv
         CpAZv6+Sc+xeZHNd/khMUF6n1pCC/WCS9ga/qIGrw0Iq6U/hZUzcgZPn6FSsJr1vHeeQ
         X/Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ip9jGRYToznbvcQb9Dd6OoDNrfiOnhYep+7awl0RM0k=;
        b=AenVTvhps8J9LFioQpWKX+vHud0IrSEsNq3fdDjBHzq1/gAlk8p7bDqKxc7thnH+ft
         v+aQIQzd0ayA1/pF7IxWGaE7FluZDCTqvvF/BjTv5gFxi7Ok8ssdDleXVtPU3b6f0669
         opqQrB1WbJc66hc/mWaOlceRxUQr/Ek4icLhIUEmrHKYYiFuTpRa6LTYTEEqTRI++6ij
         7jF+CpLCBC00vq+f7W7XrqJXYwAGkBlvgw0QxZ0PHkcJzc3ZdYbpAf4OiKA9XEXslz5z
         4tqYEbznpCzJreB4+llOURE+BcsIKKvBl7L6+U6L+620WFNBSAeZPlmv0TjvATV8Twtb
         B5TA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kf9+AQja;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w12sor10268040wrp.20.2019.09.16.07.16.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Sep 2019 07:16:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kf9+AQja;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ip9jGRYToznbvcQb9Dd6OoDNrfiOnhYep+7awl0RM0k=;
        b=kf9+AQjapHnLSJepUg9Ij8zh9vnVRKvM+sVCbvC3rij9e9PyS/mvVwWyLLTMoHQnoD
         MhGphVE9I7gngIBYakS/MAND+GSUnNwu4H41iAL8nl/hQwuyz4V3WhLQPInnZ8bK8cXg
         fnhd26wgV46VSSGaTi3LyEG5O3oteFCwUoK442xbHa6YsVtlP3+Id0k0yXHjTLpKWzwt
         +hl4w5y7l4p0pmKs7iWFLp6FlM1WhxXrHKNekb2ISsuJuDoGwPahs98cQZEf5Lkj8xOx
         q7Gr0py8XkmvRUIgalhet7ZTgDHroyoqc3PT8y/nuWhBGMg7CUvTrw8yEjt9pYrKSy/l
         3U0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ip9jGRYToznbvcQb9Dd6OoDNrfiOnhYep+7awl0RM0k=;
        b=hdHRcuXd8zo/fCT8nJCVwKuPLwPqW8KO+ElTvbxFuujcMUcCrIx4ffwoMZmMYatTIc
         sXj2AxbTcksh6NSzqehMYtpmUWy9D3lCQTAxQn0NqNqqRi2qk095A7YGam9AY3Cezfms
         FQQHdPnpcwQexMjiobLtHL2pbnrJP5z7IVumzcXi55HAF7DTxJqlXTk3DRnAaC9+xy5f
         deJOug4DvoShjXo0Yb0tXZrgjcCGbsZjsykFexl3Vc3t8sqk6PS2pdbB9q3X22l+MGGX
         /9THEkvsIb01A2jARGFIbeG68LX58QIPA2+eU0aXt9EhptbjhRsgC+bIKKZcZl0bznVp
         dgLw==
X-Gm-Message-State: APjAAAVm3PXPuvBbRsw3/ZmWqZN+LS0EwqObU+SmU/G9cHdD0kREInGi
	i+qYwMImVJoQQ+0lJ66d9uu5CcfW
X-Google-Smtp-Source: APXvYqxnWFi+SskkTJ5YyQzWzOg98RX3GJdvbf742QnBOCKKoFe4vrKpdZf5eSIPWUBXItKcJDnbHw==
X-Received: by 2002:adf:f5ca:: with SMTP id k10mr22034wrp.236.1568643360563;
        Mon, 16 Sep 2019 07:16:00 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id s9sm15185884wme.36.2019.09.16.07.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 07:16:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 11/15] target/arm/arm-semi: Factor out implementation of SYS_SEEK
Date: Mon, 16 Sep 2019 15:15:40 +0100
Message-Id: <20190916141544.17540-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190916141544.17540-1-peter.maydell@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: +Ed1WzvktGsm

Factor out the implementation of SYS_SEEK via the new function
tables.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/arm-semi.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index ecd51338fd3..b5e1d73eb80 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -389,6 +389,8 @@ typedef uint32_t sys_writefn(ARMCPU *cpu, GuestFD *gf,
 typedef uint32_t sys_readfn(ARMCPU *cpu, GuestFD *gf,
                             target_ulong buf, uint32_t len);
 typedef uint32_t sys_isattyfn(ARMCPU *cpu, GuestFD *gf);
+typedef uint32_t sys_seekfn(ARMCPU *cpu, GuestFD *gf,
+                            target_ulong offset);
 
 static uint32_t host_closefn(ARMCPU *cpu, GuestFD *gf)
 {
@@ -442,6 +444,16 @@ static uint32_t host_isattyfn(ARMCPU *cpu, GuestFD *gf)
     return isatty(gf->hostfd);
 }
 
+static uint32_t host_seekfn(ARMCPU *cpu, GuestFD *gf, target_ulong offset)
+{
+    CPUARMState *env = &cpu->env;
+    uint32_t ret = set_swi_errno(env, lseek(gf->hostfd, offset, SEEK_SET));
+    if (ret == (uint32_t)-1) {
+        return -1;
+    }
+    return 0;
+}
+
 static uint32_t gdb_closefn(ARMCPU *cpu, GuestFD *gf)
 {
     return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
@@ -468,11 +480,18 @@ static uint32_t gdb_isattyfn(ARMCPU *cpu, GuestFD *gf)
     return arm_gdb_syscall(cpu, arm_semi_cb, "isatty,%x", gf->hostfd);
 }
 
+static uint32_t gdb_seekfn(ARMCPU *cpu, GuestFD *gf, target_ulong offset)
+{
+    return arm_gdb_syscall(cpu, arm_semi_cb, "lseek,%x,%x,0",
+                           gf->hostfd, offset);
+}
+
 typedef struct GuestFDFunctions {
     sys_closefn *closefn;
     sys_writefn *writefn;
     sys_readfn *readfn;
     sys_isattyfn *isattyfn;
+    sys_seekfn *seekfn;
 } GuestFDFunctions;
 
 static const GuestFDFunctions guestfd_fns[] = {
@@ -481,12 +500,14 @@ static const GuestFDFunctions guestfd_fns[] = {
         .writefn = host_writefn,
         .readfn = host_readfn,
         .isattyfn = host_isattyfn,
+        .seekfn = host_seekfn,
     },
     [GuestFDGDB] = {
         .closefn = gdb_closefn,
         .writefn = gdb_writefn,
         .readfn = gdb_readfn,
         .isattyfn = gdb_isattyfn,
+        .seekfn = gdb_seekfn,
     },
 };
 
@@ -656,15 +677,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             return set_swi_errno(env, -1);
         }
 
-        if (use_gdb_syscalls()) {
-            return arm_gdb_syscall(cpu, arm_semi_cb, "lseek,%x,%x,0",
-                                   gf->hostfd, arg1);
-        } else {
-            ret = set_swi_errno(env, lseek(gf->hostfd, arg1, SEEK_SET));
-            if (ret == (uint32_t)-1)
-              return -1;
-            return 0;
-        }
+        return guestfd_fns[gf->type].seekfn(cpu, gf, arg1);
     case TARGET_SYS_FLEN:
         GET_ARG(0);
 
-- 
2.20.1
