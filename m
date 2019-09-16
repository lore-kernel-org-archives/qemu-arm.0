Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4067933wrp;
        Mon, 16 Sep 2019 07:15:58 -0700 (PDT)
X-Received: by 2002:a5d:49c3:: with SMTP id t3mr1017138wrs.151.1568643358402;
        Mon, 16 Sep 2019 07:15:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568643358; cv=none;
        d=google.com; s=arc-20160816;
        b=VFKf/WkWTIrFP6N/5RZC28USuu0GcZ/N0230QONNgA7N+YkZnS5ViyVGrW/DpQTr4L
         3bk5JZLaZdwQSclPpOkUOiUHpLL4t2YQ0759OFoAnIdKt2+ClMKjKKvnG5/h/AKigish
         ubRn96KDnC+SS4ZeCjNjaLRaKJPay12ig15m2WEejN3wgaK2gNtOqsDs5QdmiHY6irG8
         wMIPICgCHv6uQJfhahNwDzIFjHc+10PJEF8B72/7rvcg2GrHyNA63+sT21YjasirS1nT
         GYr+YZ4VwgaTIMgQBq2w1Qxdp6dHrV1zsCjfEkwqS4QSYK18KZuUQWXA41YBMo5InQLw
         3nAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=d79b3/60OcgZi0kSBOpUac2GXUI7BcbnkzcVSckh0N8=;
        b=BXCidyEX3aQcJva+Cvb/n7RdbS2l9NP4ZgxvWfnf7r8zOJBGQMKFLCn+wCcL/O2yD2
         gJMvj253gg1EYHSKNPZkrN4r9GZlSeTUZlIFoDVC3hfHnbQKcFPNqf90jItH3hweKHh6
         VKTQxsqn9FJPd7232dE/MEERqPUG4qqZXPe1eqVyHVEcfiSWl1EJcDZCSlsuUgHEXhVL
         uJnoyvdJfsIsQWO23j3EclHKgmxm8AemT05mvGU7Sb3gxoa3yPNbEdP0Pqi/kGt/MYnA
         PnfHpX4Fjb3jfkgs/ePTHLPKo6PQ+9nzbBsvLBt3cIHxnOxML4UXLY4EZjfqdmHkPopx
         ek+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z6QiG4cz;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id k10sor28118363wrl.4.2019.09.16.07.15.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Sep 2019 07:15:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z6QiG4cz;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d79b3/60OcgZi0kSBOpUac2GXUI7BcbnkzcVSckh0N8=;
        b=z6QiG4cz5z1YPXxxfB10SFsVNe2Z7jRMcRTgkpEbQTpGvVB7zayX0K7NtcuhvWIOvN
         8oLXTUJh2aGQc+F9+9tX/xBJDbqPV6eqJvGcU5NwWu2jjOhK+QA6AYEKgyR5uh743N3N
         RaGxXUZiSj9eWhut60RDy22D18jIOqhg4Vjs0syS3wQLxndoCG879Dwaimo2cCrOOqy9
         O81eJp0zmMLNuZPDx8QYqL0j5e51lcYb9CjNkttaJC0TcwmhSG4n+RXgwlt7siJQF1Ut
         iR43qwSZNkYUTbhc+V8VWsXLMjB66cIHG5kITHVOdSMoj9hvIrnnz9/ycZ3rw4vqsosY
         G3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d79b3/60OcgZi0kSBOpUac2GXUI7BcbnkzcVSckh0N8=;
        b=BV30Hhna3jVTFNIDZrYeneptNuFymt12sYUvNvVey6I7V3H9d+/mHH9G+qD2ako7H3
         wdfeO2RIK4pBH/Je87FQAO5NkPNRlV+2PuvZFjRkwmlLnbxdBbmPVxHUVOqHVfO8zhMl
         rSt5Mdx7ru4DyhsIZVfw3G8EM8woJmx1iQ/UXLWDflIwdW2jaaa0WvYSTE7XLvZ7eluX
         BabSmOIjyxSdRQYmtXUd1ELA8TCw4s0S5DNuoRNJYBMxSg7Lu5rnw9xsKRWcA0HtI2kG
         o5iVYiR2JS1wHLbRf6FhCm0y1vzxD9maYoIShPPGgrLu2ECUHTlARsUX2AGn8OxJ2L98
         OLHg==
X-Gm-Message-State: APjAAAVbBOObbgv/A7lgTVq9o9XLq95seS4o2gUQBzR1pJKTWPFkETVT
	l/+LPIWK9FOu5PTfJamPD5f0U/pXyhdajZfR
X-Google-Smtp-Source: APXvYqwtqQC2+RA5oqHQfLvTqxMY9Dozm/yeQNdACN+Z+mpU10ZGibo9mI3z1iVXRghRKplQJL4dEw==
X-Received: by 2002:a5d:6ac8:: with SMTP id u8mr33141wrw.104.1568643358160;
        Mon, 16 Sep 2019 07:15:58 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id s9sm15185884wme.36.2019.09.16.07.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 07:15:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 09/15] target/arm/arm-semi: Factor out implementation of SYS_READ
Date: Mon, 16 Sep 2019 15:15:38 +0100
Message-Id: <20190916141544.17540-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190916141544.17540-1-peter.maydell@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 53t3jCe6xSXb

Factor out the implementation of SYS_READ via the
new function tables.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/arm-semi.c | 55 +++++++++++++++++++++++++++----------------
 1 file changed, 35 insertions(+), 20 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index c21cbb97bc1..958083a105c 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -386,6 +386,8 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb_syscall_complete_cb cb,
 typedef uint32_t sys_closefn(ARMCPU *cpu, GuestFD *gf);
 typedef uint32_t sys_writefn(ARMCPU *cpu, GuestFD *gf,
                              target_ulong buf, uint32_t len);
+typedef uint32_t sys_readfn(ARMCPU *cpu, GuestFD *gf,
+                            target_ulong buf, uint32_t len);
 
 static uint32_t host_closefn(ARMCPU *cpu, GuestFD *gf)
 {
@@ -413,6 +415,27 @@ static uint32_t host_writefn(ARMCPU *cpu, GuestFD *gf,
     return len - ret;
 }
 
+static uint32_t host_readfn(ARMCPU *cpu, GuestFD *gf,
+                            target_ulong buf, uint32_t len)
+{
+    uint32_t ret;
+    CPUARMState *env = &cpu->env;
+    char *s = lock_user(VERIFY_WRITE, buf, len, 0);
+    if (!s) {
+        /* return bytes not read */
+        return len;
+    }
+    do {
+        ret = set_swi_errno(env, read(gf->hostfd, s, len));
+    } while (ret == -1 && errno == EINTR);
+    unlock_user(s, buf, len);
+    if (ret == (uint32_t)-1) {
+        ret = 0;
+    }
+    /* Return bytes not read */
+    return len - ret;
+}
+
 static uint32_t gdb_closefn(ARMCPU *cpu, GuestFD *gf)
 {
     return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
@@ -426,19 +449,30 @@ static uint32_t gdb_writefn(ARMCPU *cpu, GuestFD *gf,
                            gf->hostfd, buf, len);
 }
 
+static uint32_t gdb_readfn(ARMCPU *cpu, GuestFD *gf,
+                           target_ulong buf, uint32_t len)
+{
+    arm_semi_syscall_len = len;
+    return arm_gdb_syscall(cpu, arm_semi_cb, "read,%x,%x,%x",
+                           gf->hostfd, buf, len);
+}
+
 typedef struct GuestFDFunctions {
     sys_closefn *closefn;
     sys_writefn *writefn;
+    sys_readfn *readfn;
 } GuestFDFunctions;
 
 static const GuestFDFunctions guestfd_fns[] = {
     [GuestFDHost] = {
         .closefn = host_closefn,
         .writefn = host_writefn,
+        .readfn = host_readfn,
     },
     [GuestFDGDB] = {
         .closefn = gdb_closefn,
         .writefn = gdb_writefn,
+        .readfn = gdb_readfn,
     },
 };
 
@@ -584,26 +618,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             return set_swi_errno(env, -1);
         }
 
-        if (use_gdb_syscalls()) {
-            arm_semi_syscall_len = len;
-            return arm_gdb_syscall(cpu, arm_semi_cb, "read,%x,%x,%x",
-                                   gf->hostfd, arg1, len);
-        } else {
-            s = lock_user(VERIFY_WRITE, arg1, len, 0);
-            if (!s) {
-                /* return bytes not read */
-                return len;
-            }
-            do {
-                ret = set_swi_errno(env, read(gf->hostfd, s, len));
-            } while (ret == -1 && errno == EINTR);
-            unlock_user(s, arg1, len);
-            if (ret == (uint32_t)-1) {
-                ret = 0;
-            }
-            /* Return bytes not read */
-            return len - ret;
-        }
+        return guestfd_fns[gf->type].readfn(cpu, gf, arg1, len);
     case TARGET_SYS_READC:
         qemu_log_mask(LOG_UNIMP, "%s: SYS_READC not implemented", __func__);
         return 0;
-- 
2.20.1
