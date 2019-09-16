Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4067755wrp;
        Mon, 16 Sep 2019 07:15:49 -0700 (PDT)
X-Received: by 2002:a7b:c152:: with SMTP id z18mr13083316wmi.70.1568643349648;
        Mon, 16 Sep 2019 07:15:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568643349; cv=none;
        d=google.com; s=arc-20160816;
        b=WjeATTob86PTybLlHb9bu+fxoVT38OVvQ3KVXWtO4TC8hmPPShz9dhWvtfSBbfqAVt
         vCUydrVs8t+CZXBL/Wi1XNQ87s4NodG78moYfGw7Zc7idekXMsCvhgrk+idCwFZNTC5H
         TMRqK0XM69mJoRZPng8zRg4gMTpLPHD+lAJ027dstMK85D3/aCdtl7BEfByT3EnAs2jS
         mOP+pIs9mA/IGIy0i1CSZeVM29+nYCRw4bOs2N3xK/TRTOFk+1xshOd8d+2Ofh+h5ssX
         MfDU9isbI9MoAxu8lJy78aZdXHbo8CAZrMMnj9N5jQqLcmyQuRKRwKeX7kAfQhe6MDvF
         ZS0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kLpy2a0P8Zqdbd2C4YH5QEto/3xAoz89Cd5PeOJ7MUw=;
        b=vvob2mgQAWYVGGySuQnMdiQmckvqMlrPYFHpuOcx2PSFq5jLy0Kn7ogmwq5tbmCujG
         fTZ1R0MEO0281tgDvTOj8aDqYD99wDoohOSF7mI954xieZ0FUL5p2eyqdwjskSqLdv6p
         EibYks703tle16N3J/Tkm9zyGQqawafBRyrfYhiWdO8cgUECloJ+94sDmHlqzvtEnV2H
         CqPnwj30MUQpv1sXhulyVXgRa7iBrxZlSGI11Bi70L9pjBCuOPJhk5ISvFnPhvBWeH/5
         tWRmq+kfndDnKFgTh+v26OCqc2DNvFrYJ5dR+mH1Rh/zFt6bs7BILcFMuHOJBYOFSuvQ
         bPpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gy/mV77c";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j13sor4349021wrs.15.2019.09.16.07.15.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Sep 2019 07:15:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gy/mV77c";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kLpy2a0P8Zqdbd2C4YH5QEto/3xAoz89Cd5PeOJ7MUw=;
        b=gy/mV77cFtKI18U7lIj6+3EF+q87BxmoF61Tt6q04FgUblYtTcqstYGvOrcUjm0bEP
         Vbc7WZYdh1ITmxXWM+sWGtZxtWdqqi5YvdrayLHUPCNCI08yVNaslH5DYaF17qPLoKnH
         +nNXLJlT5Fk4/gbr1t2y47mu7TuUDFmx7oCBa83kIVjgKrHwlBrZfa9J1dnbXsmAuYkf
         ZXwJLEf6aNn/SGJW61Hgw9XIH44ug9tb1y/QmHGjVK1Z3+tDYOpZ9qP2qOhLp9dwrkEP
         MZ2eAMu2FPBAuVdG+qKNR3T5BzHkYjHuOdoxQQSOUwdpWjadfqoSPjUJqFIuISWBjVai
         4XEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kLpy2a0P8Zqdbd2C4YH5QEto/3xAoz89Cd5PeOJ7MUw=;
        b=AVYbkaopel5rz5kINO+zeYbyqEkqWN3fwEl0BpbP4a/NVDDsdHONs4KsKAC5xZFEQR
         Ue3ZGlfVCNgxSaCDqeBGviE7uk6m+0mQKhwCWJnbCecZDxMoXHmLyLnt8EBwlzeNASe3
         wr0dqA8JWqfEOVdzSWo/Za2kkAcA/9PqANydZm0jSIeNdSwBZjWTfB6vb4QePqXzC+E3
         46mrQmfE8QYkEzC4eF4QfilcEhyphCfhXF5YqzaQP20/Uutq22S5axKOYS4toZE6sc0e
         9B/vJr0ASmwI2fb9bU6EdEAMsYSNNUFnX5qF8CikBsud/zg93cBc8pDwrQh46i1Axmwl
         Pxjw==
X-Gm-Message-State: APjAAAVqbaW4fRvMUxooNViS9++PDltEtx7QRonS1jEDBcHAmMQiioTM
	kt44NmMTeaHAWrQHNqlQ90+ixzh2wEeTAeL4
X-Google-Smtp-Source: APXvYqz/9Dgfqv78jGus9SoTda02oHcY0xAZLe5JS2EAv0UG5eUgijT2BSe/18tVYYu7Bn9EcdKnhg==
X-Received: by 2002:a5d:55d0:: with SMTP id i16mr31852wrw.108.1568643349417;
        Mon, 16 Sep 2019 07:15:49 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id s9sm15185884wme.36.2019.09.16.07.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 07:15:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 02/15] target/arm/arm-semi: Always set some kind of errno for failed calls
Date: Mon, 16 Sep 2019 15:15:31 +0100
Message-Id: <20190916141544.17540-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190916141544.17540-1-peter.maydell@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: inM6wBOESfVb

If we fail a semihosting call we should always set the
semihosting errno to something; we were failing to do
this for some of the "check inputs for sanity" cases.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/arm-semi.c | 45 ++++++++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 03e60105c05..51b55816faf 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -232,11 +232,13 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb_syscall_complete_cb cb,
 #define GET_ARG(n) do {                                 \
     if (is_a64(env)) {                                  \
         if (get_user_u64(arg ## n, args + (n) * 8)) {   \
-            return -1;                                  \
+            errno = EFAULT;                             \
+            return set_swi_errno(ts, -1);               \
         }                                               \
     } else {                                            \
         if (get_user_u32(arg ## n, args + (n) * 4)) {   \
-            return -1;                                  \
+            errno = EFAULT;                             \
+            return set_swi_errno(ts, -1);               \
         }                                               \
     }                                                   \
 } while (0)
@@ -287,12 +289,13 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         GET_ARG(2);
         s = lock_user_string(arg0);
         if (!s) {
-            /* FIXME - should this error code be -TARGET_EFAULT ? */
-            return (uint32_t)-1;
+            errno = EFAULT;
+            return set_swi_errno(ts, -1);
         }
         if (arg1 >= 12) {
             unlock_user(s, arg0, 0);
-            return (uint32_t)-1;
+            errno = EINVAL;
+            return set_swi_errno(ts, -1);
         }
         if (strcmp(s, ":tt") == 0) {
             int result_fileno = arg1 < 4 ? STDIN_FILENO : STDOUT_FILENO;
@@ -413,8 +416,8 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         } else {
             s = lock_user_string(arg0);
             if (!s) {
-                /* FIXME - should this error code be -TARGET_EFAULT ? */
-                return (uint32_t)-1;
+                errno = EFAULT;
+                return set_swi_errno(ts, -1);
             }
             ret =  set_swi_errno(ts, remove(s));
             unlock_user(s, arg0, 0);
@@ -432,11 +435,12 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             char *s2;
             s = lock_user_string(arg0);
             s2 = lock_user_string(arg2);
-            if (!s || !s2)
-                /* FIXME - should this error code be -TARGET_EFAULT ? */
-                ret = (uint32_t)-1;
-            else
+            if (!s || !s2) {
+                errno = EFAULT;
+                ret = set_swi_errno(ts, -1);
+            } else {
                 ret = set_swi_errno(ts, rename(s, s2));
+            }
             if (s2)
                 unlock_user(s2, arg2, 0);
             if (s)
@@ -456,8 +460,8 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         } else {
             s = lock_user_string(arg0);
             if (!s) {
-                /* FIXME - should this error code be -TARGET_EFAULT ? */
-                return (uint32_t)-1;
+                errno = EFAULT;
+                return set_swi_errno(ts, -1);
             }
             ret = set_swi_errno(ts, system(s));
             unlock_user(s, arg0, 0);
@@ -517,19 +521,22 @@ target_ulong do_arm_semihosting(CPUARMState *env)
 
             if (output_size > input_size) {
                 /* Not enough space to store command-line arguments.  */
-                return -1;
+                errno = E2BIG;
+                return set_swi_errno(ts, -1);
             }
 
             /* Adjust the command-line length.  */
             if (SET_ARG(1, output_size - 1)) {
                 /* Couldn't write back to argument block */
-                return -1;
+                errno = EFAULT;
+                return set_swi_errno(ts, -1);
             }
 
             /* Lock the buffer on the ARM side.  */
             output_buffer = lock_user(VERIFY_WRITE, arg0, output_size, 0);
             if (!output_buffer) {
-                return -1;
+                errno = EFAULT;
+                return set_swi_errno(ts, -1);
             }
 
             /* Copy the command-line arguments.  */
@@ -544,7 +551,8 @@ target_ulong do_arm_semihosting(CPUARMState *env)
 
             if (copy_from_user(output_buffer, ts->info->arg_start,
                                output_size)) {
-                status = -1;
+                errno = EFAULT;
+                status = set_swi_errno(ts, -1);
                 goto out;
             }
 
@@ -614,7 +622,8 @@ target_ulong do_arm_semihosting(CPUARMState *env)
 
                 if (fail) {
                     /* Couldn't write back to argument block */
-                    return -1;
+                    errno = EFAULT;
+                    return set_swi_errno(ts, -1);
                 }
             }
             return 0;
-- 
2.20.1
