Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4067956wrp;
        Mon, 16 Sep 2019 07:15:59 -0700 (PDT)
X-Received: by 2002:a7b:cb0e:: with SMTP id u14mr10564912wmj.115.1568643359436;
        Mon, 16 Sep 2019 07:15:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568643359; cv=none;
        d=google.com; s=arc-20160816;
        b=ZnwWOD/Y6DjmYnCwr0OEMB5SX4ChhWaa9cu50Z0y1+hmFGWkOK8qWElixecOVK4ogp
         2WkLtmXFw3S4pQ1uxxOqb+HBP3LGNBytnNZXqV1ZeLBirMqArNLjahWXsEsibJF7deak
         QdZ4/9r302lyas1dAykw0sgTZ9dmm3ZX57rXDDEb8DOTSvMB3WAAV3oq6m4hqn4pbIN/
         yASJfbTpRkxOKwnvIydlww/i361RRe6CJ+U7rLxSrJQcpsVqf0DeWx8FAwTnLwYN5G7i
         /4RHQ6AQATkgZhwCB4cqkUjl+vZhdrQJoYTt6NU8ZG1WuqHlkWtmFGKg0PLYWvdts1Tn
         OB7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Hdx0vcwYVj6aCkAtZySo243cmoqBWwiTTxoZ3UM3eNY=;
        b=EQF7EY4tg5i7tFPTHbT2cJMiQ+0y+r1porNW1j8NuKHurhwIaYOlRKCFuw/pzqewhc
         fAB3VCD272boSkcN8HmCK+nn97Z02SO6S6NPWADFuTaLzvgDsFdabhit+m3pxAnq0IHF
         /5MXp8fGB5c/o3TKUEDz32uVqtNbpOjNh5MwgxMW7/WyX/fj+2Kb1wmFTqyuP7AuERIa
         BPAJLTqlV2B35/qt6byXW7bazhMsbTYShd7TBsTzVKTN8m9Cizb5BjVlXhdD7GKBzhRA
         7q+cBBkbmA0e4Ck9PaSCjJrbUeMUWxBui3RZyR6HKUUU0B9tzZX/DD22APwrmp/BFhph
         ZVjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="m/arva38";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n14sor4184742wrv.47.2019.09.16.07.15.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Sep 2019 07:15:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="m/arva38";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hdx0vcwYVj6aCkAtZySo243cmoqBWwiTTxoZ3UM3eNY=;
        b=m/arva38FITJPOTEd1+Ic3jYq1nQfefJevnvJ7dNKScoegz3YqC+yK6HDG3Hb7Rkzd
         /p0wze2EK1k6elFu/ew9w0GXAaBEA+YdTzTXg05U0wTsydna2EOyPz6VMJ2vFAmF5MFH
         jhyn7IWbxdx612/OOsBZCANrqJap4LuWC9kToVh6pCE8VNRteVhltskRmVtg3C2+v4Ew
         FUQTbX1qU9LfbJ3y3GlKDMdJwf94PSlnWR3ZhknCNYEQ5XgdhivG3DyKCJgK1lvCzn1q
         np5RSAiaHKJQB1soTq2KiziL+tw1r7I9porHGbACM2o3aRIDcd4aobe6BeCWY3LL3XsA
         hoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hdx0vcwYVj6aCkAtZySo243cmoqBWwiTTxoZ3UM3eNY=;
        b=tXN1TwM4h+OBfRmXm3/xFZKALD2aG3+ydRiZbxFQSzMkFJHLXFZrsAYlVp6jh5l+2n
         qs0GFlEo8v1JfwNuD95jlaPIUNxdCDrYNJ1aiCC1oDCa2vpHtTDlwlluVlAWPcL7w4Vs
         0YGtCdUD24C+Kf6VsIa+gDdeo40na7axNGBHmWz5BD0OlJmd5SifbhZjRzDU9Nu1VT6O
         CZInhNWE5m8deAvlvXMWb0nOi7mJGH/BZwnRScPzSaa/C0KoZGRFIfLJa67MiYAVF/1/
         +pBFzuWRcRS5uOXR2sF9OSgq0TYZrFpsHG0AaD0MIIYQ/Jban0BqbcnrdrSVAF5KWa3A
         +JIw==
X-Gm-Message-State: APjAAAUlx/5n+gt77apL2zar496uVeOsL7eh8jdf3v0tBO1I1kNICFoO
	4jRYY+ePkY4iWAMOsgAgdgXfug1N
X-Google-Smtp-Source: APXvYqw0kAdbnSQ+zqyxmG6qprWn237V2XIS7sgBpQvKszHmllWC7b/8Ye3aMUYQ7a3zo8Lmx+g0xA==
X-Received: by 2002:a5d:548d:: with SMTP id h13mr12544924wrv.215.1568643359201;
        Mon, 16 Sep 2019 07:15:59 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id s9sm15185884wme.36.2019.09.16.07.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 07:15:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 10/15] target/arm/arm-semi: Factor out implementation of SYS_ISTTY
Date: Mon, 16 Sep 2019 15:15:39 +0100
Message-Id: <20190916141544.17540-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190916141544.17540-1-peter.maydell@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: qLJULVoEkjhe

Factor out the implementation of SYS_ISTTY via the new function
tables.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/arm-semi.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 958083a105c..ecd51338fd3 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -388,6 +388,7 @@ typedef uint32_t sys_writefn(ARMCPU *cpu, GuestFD *gf,
                              target_ulong buf, uint32_t len);
 typedef uint32_t sys_readfn(ARMCPU *cpu, GuestFD *gf,
                             target_ulong buf, uint32_t len);
+typedef uint32_t sys_isattyfn(ARMCPU *cpu, GuestFD *gf);
 
 static uint32_t host_closefn(ARMCPU *cpu, GuestFD *gf)
 {
@@ -436,6 +437,11 @@ static uint32_t host_readfn(ARMCPU *cpu, GuestFD *gf,
     return len - ret;
 }
 
+static uint32_t host_isattyfn(ARMCPU *cpu, GuestFD *gf)
+{
+    return isatty(gf->hostfd);
+}
+
 static uint32_t gdb_closefn(ARMCPU *cpu, GuestFD *gf)
 {
     return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
@@ -457,10 +463,16 @@ static uint32_t gdb_readfn(ARMCPU *cpu, GuestFD *gf,
                            gf->hostfd, buf, len);
 }
 
+static uint32_t gdb_isattyfn(ARMCPU *cpu, GuestFD *gf)
+{
+    return arm_gdb_syscall(cpu, arm_semi_cb, "isatty,%x", gf->hostfd);
+}
+
 typedef struct GuestFDFunctions {
     sys_closefn *closefn;
     sys_writefn *writefn;
     sys_readfn *readfn;
+    sys_isattyfn *isattyfn;
 } GuestFDFunctions;
 
 static const GuestFDFunctions guestfd_fns[] = {
@@ -468,11 +480,13 @@ static const GuestFDFunctions guestfd_fns[] = {
         .closefn = host_closefn,
         .writefn = host_writefn,
         .readfn = host_readfn,
+        .isattyfn = host_isattyfn,
     },
     [GuestFDGDB] = {
         .closefn = gdb_closefn,
         .writefn = gdb_writefn,
         .readfn = gdb_readfn,
+        .isattyfn = gdb_isattyfn,
     },
 };
 
@@ -631,11 +645,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             return set_swi_errno(env, -1);
         }
 
-        if (use_gdb_syscalls()) {
-            return arm_gdb_syscall(cpu, arm_semi_cb, "isatty,%x", gf->hostfd);
-        } else {
-            return isatty(gf->hostfd);
-        }
+        return guestfd_fns[gf->type].isattyfn(cpu, gf);
     case TARGET_SYS_SEEK:
         GET_ARG(0);
         GET_ARG(1);
-- 
2.20.1
