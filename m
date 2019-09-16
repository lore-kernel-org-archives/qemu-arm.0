Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4068004wrp;
        Mon, 16 Sep 2019 07:16:01 -0700 (PDT)
X-Received: by 2002:a1c:be11:: with SMTP id o17mr14702643wmf.93.1568643361909;
        Mon, 16 Sep 2019 07:16:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568643361; cv=none;
        d=google.com; s=arc-20160816;
        b=Qab6nilBDlipDmudwx9nPVTq7kmQw2YGPB0iKR4EhlR5ec4XY3jVJvrkYfNQRCWwCn
         DiIMFWD1FcrrKHi+Pv007V1KxNIxJKVKOdt31xC1nZYkc5+gVfYzXc1QgKdzUAB0IMNn
         Tfi9elpWRYKKl6kV6HKGjquK9IrdBxVU1WjaLaXb1D1Q1cMZ9001z67iXF19j6QuSjYk
         5zJjeD1oU/sqS9mYk2dDz7EIi11mfsiU/wslfhG/bx/CcNK3I6dexRdGBQv2JaosdESm
         8X5Z5xylCTP8Q6naOJL1aBJOnuThL6qloQzTI/Q0rAyuC+H0OOiAyvjNL+d1/AFJ5kuV
         irGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PhdxBnvi4pU80xrRijWpk4YE0MSvzzAfF5L37d1esIU=;
        b=VpW9IEm1hKotm9g5FRjeoZNx/Nbbk4nxzXIfQpRerjtnZazdqkNHMbUhv3gVKLWDZG
         Z2WSSytRwLAiIlomvu84CHmypqooYrD5lLZ0JNIJGkpty55km1zIKOLLoRzOBZZI4KhI
         M/DGbbCIKbfD8qVs2qnjGhGqje1aFltbmAyrGbHHWuHDAjysSPKSJpKbaIKNkjdYidQp
         EWoiRNvIT3GzDpU3NRDTjvjmyCPqOjFunZp454qrS3UwaBy8I8CxqqxDSwGZZHbG4ZhV
         jREqLAG6JKDMEhloAIRyqL+Vlc9A/vlRDDH0MizqsT9cteatSD8rJ0Q0Ev4HAkWaysRC
         5gUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZYBVWT0o;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g11sor28815640wrs.13.2019.09.16.07.16.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Sep 2019 07:16:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZYBVWT0o;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PhdxBnvi4pU80xrRijWpk4YE0MSvzzAfF5L37d1esIU=;
        b=ZYBVWT0oCbR554Mraq3xgsjVLom0X451QtcoUP0V55L8vYofSszxGYuG4cN6IjvMyY
         vjaXDVWCNcNOPwtvDFkRikje0q4JzvmbTlgbB7+XDo1XT6ZfzvMWnmJ0BJ5wGMMR9OsV
         gfvf6Ver1OKOTntV186Mo8XeRm1eGP4VTjcKXxywbAiETEXS5RsE0pN4lz72yfNgij3/
         jrE2GKbZuUPujd6CIxyuQduog1ABVhMOop8n2kyAMx2ylQW73fmzMod25q60wGi97PtI
         iFz4abOaTUr4+WbtJYyF+0v6G8ggwSEPC+2Wg5a4btvSTjXUWmcKl40lHRL3pJqeEeKz
         GD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PhdxBnvi4pU80xrRijWpk4YE0MSvzzAfF5L37d1esIU=;
        b=JbkTQP9p4B36+/HDbkZ8CNWh0HGeIYXOy7d2RSxp+neg+rIsCKHkjOmahfWnnaYF0U
         VtxvPir2qINXQcBsN3XKDBI67y7AKNI4xdAKpBubS5k1Ub64xXaNUeoejxJfZK/roRZH
         L17T49C0zwS/D0Tn8h8kAv/9M2W4VRDFw8cRJcSNaSJk10PNSyQ342LFDXUPzd2SCcgT
         CveRoJwtve181Otvbj7KzzogSmMjrrcnmbpbGLElfcTEtGICW2ddjUL/lLipKM/JaM2b
         ygwcs1pL6J0ofIAUBswB9AShJhJIK57EneWFFx2UwPSGercgaa0/QiapAs+P3a0LFxrV
         abxw==
X-Gm-Message-State: APjAAAXBGx5zrX/VHdCkITV1cCzEaKrWRQPgrw4qqWFvhKnUOR7eL4k+
	wpgFCuCFYD5+0LHdziYvn4uStaCT
X-Google-Smtp-Source: APXvYqxfpfRFab2EHZqCExuA9zAr3DA1LIcKc07IjxrItyWn7ekDJEY4dFVB/YCycqtFLUgcJjbzAQ==
X-Received: by 2002:adf:ed88:: with SMTP id c8mr7303871wro.329.1568643361657;
        Mon, 16 Sep 2019 07:16:01 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id s9sm15185884wme.36.2019.09.16.07.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 07:16:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 12/15] target/arm/arm-semi: Factor out implementation of SYS_FLEN
Date: Mon, 16 Sep 2019 15:15:41 +0100
Message-Id: <20190916141544.17540-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190916141544.17540-1-peter.maydell@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: GqAgLUKXMEeW

Factor out the implementation of SYS_FLEN via the new
function tables.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/arm-semi.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index b5e1d73eb80..87c911f0187 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -391,6 +391,7 @@ typedef uint32_t sys_readfn(ARMCPU *cpu, GuestFD *gf,
 typedef uint32_t sys_isattyfn(ARMCPU *cpu, GuestFD *gf);
 typedef uint32_t sys_seekfn(ARMCPU *cpu, GuestFD *gf,
                             target_ulong offset);
+typedef uint32_t sys_flenfn(ARMCPU *cpu, GuestFD *gf);
 
 static uint32_t host_closefn(ARMCPU *cpu, GuestFD *gf)
 {
@@ -454,6 +455,17 @@ static uint32_t host_seekfn(ARMCPU *cpu, GuestFD *gf, target_ulong offset)
     return 0;
 }
 
+static uint32_t host_flenfn(ARMCPU *cpu, GuestFD *gf)
+{
+    CPUARMState *env = &cpu->env;
+    struct stat buf;
+    uint32_t ret = set_swi_errno(env, fstat(gf->hostfd, &buf));
+    if (ret == (uint32_t)-1) {
+        return -1;
+    }
+    return buf.st_size;
+}
+
 static uint32_t gdb_closefn(ARMCPU *cpu, GuestFD *gf)
 {
     return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
@@ -486,12 +498,19 @@ static uint32_t gdb_seekfn(ARMCPU *cpu, GuestFD *gf, target_ulong offset)
                            gf->hostfd, offset);
 }
 
+static uint32_t gdb_flenfn(ARMCPU *cpu, GuestFD *gf)
+{
+    return arm_gdb_syscall(cpu, arm_semi_flen_cb, "fstat,%x,%x",
+                           gf->hostfd, arm_flen_buf(cpu));
+}
+
 typedef struct GuestFDFunctions {
     sys_closefn *closefn;
     sys_writefn *writefn;
     sys_readfn *readfn;
     sys_isattyfn *isattyfn;
     sys_seekfn *seekfn;
+    sys_flenfn *flenfn;
 } GuestFDFunctions;
 
 static const GuestFDFunctions guestfd_fns[] = {
@@ -501,6 +520,7 @@ static const GuestFDFunctions guestfd_fns[] = {
         .readfn = host_readfn,
         .isattyfn = host_isattyfn,
         .seekfn = host_seekfn,
+        .flenfn = host_flenfn,
     },
     [GuestFDGDB] = {
         .closefn = gdb_closefn,
@@ -508,6 +528,7 @@ static const GuestFDFunctions guestfd_fns[] = {
         .readfn = gdb_readfn,
         .isattyfn = gdb_isattyfn,
         .seekfn = gdb_seekfn,
+        .flenfn = gdb_flenfn,
     },
 };
 
@@ -687,16 +708,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             return set_swi_errno(env, -1);
         }
 
-        if (use_gdb_syscalls()) {
-            return arm_gdb_syscall(cpu, arm_semi_flen_cb, "fstat,%x,%x",
-                                   gf->hostfd, arm_flen_buf(cpu));
-        } else {
-            struct stat buf;
-            ret = set_swi_errno(env, fstat(gf->hostfd, &buf));
-            if (ret == (uint32_t)-1)
-                return -1;
-            return buf.st_size;
-        }
+        return guestfd_fns[gf->type].flenfn(cpu, gf);
     case TARGET_SYS_TMPNAM:
         qemu_log_mask(LOG_UNIMP, "%s: SYS_TMPNAM not implemented", __func__);
         return -1;
-- 
2.20.1
