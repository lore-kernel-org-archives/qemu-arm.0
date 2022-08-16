Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2009010ejf;
        Tue, 16 Aug 2022 13:34:36 -0700 (PDT)
X-Received: by 2002:aca:1901:0:b0:344:d4b5:9a1f with SMTP id l1-20020aca1901000000b00344d4b59a1fmr145065oii.170.1660682076268;
        Tue, 16 Aug 2022 13:34:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682076; cv=none;
        d=google.com; s=arc-20160816;
        b=ow4WWYUxCUv/ONKaCPEAqgZGbP9VW1WDbrTiI4Sr2xQu5JSb64Cp7YRb1suW7IovlX
         FY3ZuPEom/dqqwlRWkXd0/quZDpY2YVA4wZjynDxDiSJub2btwWrbjWWUCHzPF4RoYX/
         dWNXVMoBsmxYFJ3gUrTwvrrVMrZFCZ1TwREADQwIzBZ2lPR83WCaHbqxC0JYWcYfhiHh
         C8FiFzjIztLZEZnkCrRl5N7zXTiyzI6zLo6FTvIyb3kyPwdhhBMHYpUE2rPbvF7/o0Mn
         isGVQfgeVH9svO2ck82hhO5RgSfne1N443mn1czSkj0Mf3Na9+jP2njH0+nE/udtPzHI
         3LEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=21coxlkQNnNjbgRrssaJT5btbr5A+uXZSpoWQo/gmIc=;
        b=WX3QkQEGrAjkGbqiMVRM65qi+yPiXD+6UDH98Kk3OpG12EAUwRh5zum+eObN28zVuR
         /lmR2JEnxhHOuvFqPHi0oZnCx3lr4SJUNMjULVOw4yUty9cp6zueDUX4ZcI3ScozejGw
         I03LBkAC7hCpMpLpyZ+DADVQWRtb/NX9Hebn1dNRYHG5dOGscdeNPr1N6u5KjQcnY6XT
         mHIqGWk7bPSK/eZpX3mLMUTIm/LhoFNuQRoeiz/RtBI524iCSVatC3ccRjLGmgnnvKY0
         UduMpxGmO3gmbrx8i6mQsCyyl+RwBcp/+nic7R4lEhllGaAJk0PHk6Qjl9NskD9oM0jl
         1DAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RQ7cq6OQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gy20-20020a056870289400b0010bda6eadbesor2233596oab.87.2022.08.16.13.34.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:34:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RQ7cq6OQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=21coxlkQNnNjbgRrssaJT5btbr5A+uXZSpoWQo/gmIc=;
        b=RQ7cq6OQSyl/ZNAxxoMYMMxBRVuTnEGsudt5CU6TahwAPP60Fkj1V4qs4QuL3reGhn
         umbUv7vXzKp62soNbPTJ2lJhxRLco4DBjsDGkWoW3OTzOLZMm1ic24Mh9UPi9iA7GTR5
         /WLlfNQJXsDNxL1gUI/ynPFpCupt/v0M9ZoOB06I+XKqkPFdNpxGLIb1mbZcmtMY0Swr
         uL0+bfx7UgyksctqS5IAry2HPgwoFOCwMT4OZ2c2Qn9SAp1PZ0w8jKyHgLuZBqDLV+cU
         DCJv6oWZOzXnmWM2lpXAVHwTO2YT07fx4VslNwNvRPQXLvNaK3n/lr3ZxwUBUxhEJCH1
         p2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=21coxlkQNnNjbgRrssaJT5btbr5A+uXZSpoWQo/gmIc=;
        b=0ohCDUC0BFhfDOEEjrRehKu/9MCzEa6Tth7sqXjVk8R1bRnejba5mkiuKAIPk0nZqk
         moLkQiG9CLdh9Gy8K4HdP+4xIohQcVVOvHXMQWQoGueGSXSJBWpl2WGVOKp/WRE0zNE6
         RbUn9PNzc/OKtmgtq5IIiJC9wCW3E/yILNgzCYIZl1B8w3ipizzpRTlBH2XmEx+FQVkZ
         U1Hl1MNDEwpJMSfX1yGOuP2rBKMJETtFz7PRrgv6Ba3epH9cq/uc9+QtNUy4382Xg2k7
         HL7ZxFszDj5rpwtg5rc8Imm/6TbgWsawRgIYFCSr1qn/NY0HGrrF0UecTvrWcMlFnCJh
         kSYQ==
X-Gm-Message-State: ACgBeo0Aep70VmC2qqVi0e8CF//KRVy88RWVmQTdYPVkjV4dvIyC0AWA
	TrlcxF2P+b+I+0GCrwGts4J6PnsK
X-Google-Smtp-Source: AA6agR6fhLPdyHarGUDx1LVj42NmZAZZTi3JDTtEOfkpskMj+5PLDxdLnyb2aBwWgwVyF0huoZ55BQ==
X-Received: by 2002:a05:6870:d78a:b0:10e:45a6:a400 with SMTP id bd10-20020a056870d78a00b0010e45a6a400mr146048oab.27.1660682075902;
        Tue, 16 Aug 2022 13:34:35 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:34:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 13/33] accel/tcg: Unlock mmap_lock after longjmp
Date: Tue, 16 Aug 2022 15:33:40 -0500
Message-Id: <20220816203400.161187-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: pumElEcFNVCV

The mmap_lock is held around tb_gen_code.  While the comment
is correct that the lock is dropped when tb_gen_code runs out
of memory, the lock is *not* dropped when an exception is
raised reading code for translation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 711859d4d4..7887af6f45 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -523,13 +523,11 @@ void cpu_exec_step_atomic(CPUState *cpu)
         cpu_tb_exec(cpu, tb, &tb_exit);
         cpu_exec_exit(cpu);
     } else {
-        /*
-         * The mmap_lock is dropped by tb_gen_code if it runs out of
-         * memory.
-         */
 #ifndef CONFIG_SOFTMMU
         clear_helper_retaddr();
-        tcg_debug_assert(!have_mmap_lock());
+        if (have_mmap_lock()) {
+            mmap_unlock();
+        }
 #endif
         if (qemu_mutex_iothread_locked()) {
             qemu_mutex_unlock_iothread();
@@ -936,7 +934,9 @@ int cpu_exec(CPUState *cpu)
 
 #ifndef CONFIG_SOFTMMU
         clear_helper_retaddr();
-        tcg_debug_assert(!have_mmap_lock());
+        if (have_mmap_lock()) {
+            mmap_unlock();
+        }
 #endif
         if (qemu_mutex_iothread_locked()) {
             qemu_mutex_unlock_iothread();
-- 
2.34.1
