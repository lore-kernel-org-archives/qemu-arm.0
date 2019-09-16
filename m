Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4068073wrp;
        Mon, 16 Sep 2019 07:16:05 -0700 (PDT)
X-Received: by 2002:a1c:a616:: with SMTP id p22mr13972059wme.3.1568643365314;
        Mon, 16 Sep 2019 07:16:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568643365; cv=none;
        d=google.com; s=arc-20160816;
        b=gk8jeJz5Cq79Rn5erYLutiq1COkaLyI/KeeKGb/vj3/3jcs80vak9SLQm5+wRgjJ4S
         RMKyVQvBOy+7+n9G6eSJnpm4uRb6Tgz5hRFQecHlcjp3duPPoYmJpgD3rO72f/aRGFn6
         yulX4cclrSicoxtQ0JG082z8VcgxqcdPRRDSkEJCSKQsllywmusElDrqyKLx+l4QJJVa
         PGaK9zVXTNCXyLUlqWJLNdIb/W99NoE/dNQnST0oEZWtGgTy4bvNjRGOBpuEUhRaq4yT
         zDEZ9USvmhpNlL+NQshiiE7DEitIwrcYxT3WG0sV7vYQ5waxnwz/Ddp47pV01ZtyZkjw
         Wimg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=SXBAqhquP2Lg4Ybq8pMEcyecszVWdFjmxwIvTxGKiO0=;
        b=gJCupH/4snmDV/zw4tFGRD8Bl2BoTX7xDy097l/tn8Rna7VHyFo2qwG1T2kTP+D5gP
         KBlNwMUY46ScAQQdCxYq0LNdDsfLsRogXWtGJ57D4He6PP8GPY5YceS0hWtnMrDaS0Ni
         wUf+5xZiE5CVcHuuJjA/M7GrYOjIjYyRlfNLQotku9wsjRL0l+UNjv5CM/DgHK/2XEUO
         QVnhDbAk8csh5ZmJESJT4nObNxe3bbjcCF1/qjRJAAtHco/KjeyHu99a1GnkRJ6G/DmD
         aCQSmSmIVeUfhozFSt/33+UFXesQIrNzGqm/NQFXJmQmNvxVO1qPFsV2wqgm0kj0QixO
         n1ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WvqY0DFd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m15sor28948546wrj.45.2019.09.16.07.16.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Sep 2019 07:16:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WvqY0DFd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SXBAqhquP2Lg4Ybq8pMEcyecszVWdFjmxwIvTxGKiO0=;
        b=WvqY0DFd3ahqD6PJc4Eokd0KPmTwnsPDUrgGli1ZJcCrndiQ/uMwDHtK0sdf3eGS5C
         nYTbZaAdtBA3hgjGz4Nh5apol5XdJuqIw8Nh1UqDZdZz9osomXyL8A/vCgshougEdl1G
         M/DrmVa6Ch6xN2ldAa1AY7OL0XBUcra2+1pVjbCIbmBE/sX000qN7tUJVBxFxJzwRXMl
         WpiEY1M8oDhUgu4howcH4ZfEQ9qK5JCMspsYPgL/deMaWoUSMdgSI0/zOMa0KXlE7Sgs
         XO7PET144AhppOFjte9qO/UGSk8Nvpmzf1uSxvJF60Gb6OOsuSuFBGCOIxOfYbAgEXLt
         ciyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SXBAqhquP2Lg4Ybq8pMEcyecszVWdFjmxwIvTxGKiO0=;
        b=tV+NrmUR/tyEdO+fzmSu3ScMoNFAicApRfuZJScSQ4wjxIZ2SyibVgUL79jHU2Zqqg
         XSCjgVCRSr+CdV+cNLZSBWw7VjfH/mGXoG+dEd/PDijKaiNHrq+jFuef37hGmBA6TSDP
         PQbwZW4bvcbImgzTKOqQQsF48/Y0Co+0wvwdtgKAlo4r4tKkh8xJEmwUuvimuYaKcICW
         pGy7ama4ijRnerdEIRqubmCwXu/f+2AYOww+6TI0K9bpFux+1bwTMMEI9TnvBtaT3bks
         NLCVmt8ebso3rpxGt/fwDeXJFH+u4spJG+5ox3g8eCFzjQpK2QJzB9a9EG4lk1CJ5KcV
         GH7g==
X-Gm-Message-State: APjAAAXFEpr4SGbsBHnSibv+vxilWbDyZfc+DUWP5A9c/JRr8Ppe43GO
	IdbXqKhxhyUbQoYNpTBZEnLhvLxZ
X-Google-Smtp-Source: APXvYqw/2Y0ATN8S7+P+F/py2zDH5OqUBFFPXksWf9VBp2G0HIhK/dvtiULlxkR/pr7zM+q/w/fvNQ==
X-Received: by 2002:adf:de03:: with SMTP id b3mr40938wrm.14.1568643365067;
        Mon, 16 Sep 2019 07:16:05 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id s9sm15185884wme.36.2019.09.16.07.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 07:16:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 15/15] target/arm/arm-semi: Implement SH_EXT_STDOUT_STDERR extension
Date: Mon, 16 Sep 2019 15:15:44 +0100
Message-Id: <20190916141544.17540-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190916141544.17540-1-peter.maydell@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6aZHBiR5MyTO

SH_EXT_STDOUT_STDERR is a v2.0 semihosting extension: the guest
can open ":tt" with a file mode requesting append access in
order to open stderr, in addition to the existing "open for
read for stdin or write for stdout". Implement this and
report it via the :semihosting-features data.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/arm-semi.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index f65d8c907e8..6f7b6d801bf 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -516,13 +516,14 @@ static uint32_t gdb_flenfn(ARMCPU *cpu, GuestFD *gf)
 
 /* Feature bits reportable in feature byte 0 */
 #define SH_EXT_EXIT_EXTENDED (1 << 0)
+#define SH_EXT_STDOUT_STDERR (1 << 1)
 
 static const uint8_t featurefile_data[] = {
     SHFB_MAGIC_0,
     SHFB_MAGIC_1,
     SHFB_MAGIC_2,
     SHFB_MAGIC_3,
-    SH_EXT_EXIT_EXTENDED, /* Feature byte 0 */
+    SH_EXT_EXIT_EXTENDED | SH_EXT_STDOUT_STDERR, /* Feature byte 0 */
 };
 
 static void init_featurefile_guestfd(int guestfd)
@@ -710,7 +711,21 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         }
 
         if (strcmp(s, ":tt") == 0) {
-            int result_fileno = arg1 < 4 ? STDIN_FILENO : STDOUT_FILENO;
+            int result_fileno;
+
+            /*
+             * We implement SH_EXT_STDOUT_STDERR, so:
+             *  open for read == stdin
+             *  open for write == stdout
+             *  open for append == stderr
+             */
+            if (arg1 < 4) {
+                result_fileno = STDIN_FILENO;
+            } else if (arg1 < 8) {
+                result_fileno = STDOUT_FILENO;
+            } else {
+                result_fileno = STDERR_FILENO;
+            }
             associate_guestfd(guestfd, result_fileno);
             unlock_user(s, arg0, 0);
             return guestfd;
-- 
2.20.1
