Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1835056ejx;
        Mon, 11 Sep 2023 23:58:42 -0700 (PDT)
X-Received: by 2002:a17:90a:ce15:b0:26f:b228:faea with SMTP id f21-20020a17090ace1500b0026fb228faeamr8763826pju.18.1694501921785;
        Mon, 11 Sep 2023 23:58:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694501921; cv=none;
        d=google.com; s=arc-20160816;
        b=S+i9xnnRDhTJPqlMd+FLIJrdwtgUSHBWueLh1B4/pVZxwEOya5qra8np8OMeFKYdye
         DL8LE251FPlMkJD5hu9ARxyLGngElEY7oJyaMExHrisoM/QXTW0I08/qqPp28GXU9XB/
         a3s5AalveYR/qNbri3VC+9y4S+Y2M4Osx1asynPx+bTtWW427R6PNRqqEwYKZEvJcnTZ
         dFmgQDti7o8YMbTsFihqtsj4ov+ysFoKu0bKGFsvxF+awtaWsoAhKqa+oxkvGXlul8ud
         R+n3swTHgVI8UcFB7nhX7wKuth4qYUJuuvSGsAKO6FjqWBWBfgmXkE5cyqari/J/GPJV
         j/Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qUVjTcjkNZmdhwavklqNnzqJkSIaiyxihMzM0GkWlyU=;
        fh=mOjAWjm9SVJGsoYL3k28ZexAFXQK9L+zOTfiRIvd12U=;
        b=ckm6h1x5qiL1qNo0fpFfnAu6NcvJwfBM8kSyDHXLRqr7XXNNvZY5MPMyd/K8eIkJ6h
         KL0TQUgXXwUzobpOe9dEmU1TH1Qna2SQOB644DSE8r+see1IcgStI/+SZeJTVgl0AKeO
         7/kbwubJ0vNqnxdu9thJybxkM+jeGk/eTLpDaIKE63M2qZgqc5JIbde+PW+p6AGNx+WP
         BP+N537+wIsi5dWTE4cU6jJafXw6iw297MtVzfd9zmdP3E7VAr05Ub5Q+/48cYDojPLf
         /yjmW23Zm7KB6nf573KGXMDJ9E0waJruUN8GewyPrpkJ0avkaKsNfRtJFNFj4XMk1Jc3
         OnUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=jrEcLat9;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a22-20020a17090a8c1600b0026333edfab3sor4193675pjo.3.2023.09.11.23.58.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Sep 2023 23:58:41 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=jrEcLat9;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694501921; x=1695106721; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUVjTcjkNZmdhwavklqNnzqJkSIaiyxihMzM0GkWlyU=;
        b=jrEcLat93M93q6B9A6W0Prv4YpMJrixyMH7pS6jUW6mR9cMQCkkW7XVzTp5b9uS1qQ
         yzj0p8dIm9EN7hFF7Kiw8X2ptdOO3i0+5b477ewszwfAr1+gkU4p4TJ431OarbJptEhM
         HvdyEXj044lz0aD0RYe1Unh1UZuVBaI3zWu2LCaTuMiW3cYqiNqnbJYPk4NPYSmGPteb
         1nIAW0W3mU4CZXVr9DgQ5Fx4Eazgw5R5CmBCW6M9C1Viysy1wB/MvXTb1JWbudsld+5E
         xBLt+afxKPS9DX3DxKTEc7sJgMrQmD8ilijyo03XKDAxkaVdQprRov1owvJGS7KctDrm
         +Osw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694501921; x=1695106721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUVjTcjkNZmdhwavklqNnzqJkSIaiyxihMzM0GkWlyU=;
        b=KQBGP+CHnrccaTfQb8HE492SiHAUUXvlDU1swdwlOhDh7npzVc0ADiOc3RI2IX81NA
         Lb3Bb850yofsKmmfAYtuYOlTvweM7dW1W4cVsZk5YgSPpTBH21G648dmORCIsxX3DMO+
         DoMaNz3Lz8nMbZtjdXQjr5ZtpTCphLBMX3TRuy92HXKwOmQh7rsm+xcuUlj0G8YumoIw
         mGE2A1f38yxG/hnJh9T9KIsyC0Xv46ozOCRKQgrcWYBALFo5MQ3RkkBTGehXhdO0OKWI
         neN+Te3vq6yArX+5swFnBwAiI4hztwUBv3/2iJFa4pGiYvrAbLlLFRiRAihpHHJ/uyiV
         XIbg==
X-Gm-Message-State: AOJu0Yw8TaizOwqK03FwcriSolScuezQxOAiZZqtGzSfvNomXoV2vwW9
	opK/1fuP6jFceubgajG8vIj1dLz9349NkogLceA=
X-Google-Smtp-Source: AGHT+IEugFWzGyIJbgfzMAWZi8kFoV7blGP2kP/el/CE65Q22wACUuhF50orAYjH+Es7z+1uVi5USQ==
X-Received: by 2002:a17:90a:72c3:b0:273:b0bd:343b with SMTP id l3-20020a17090a72c300b00273b0bd343bmr9158534pjk.41.1694501921213;
        Mon, 11 Sep 2023 23:58:41 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id i8-20020a17090a2ac800b002696aeb72e5sm9315058pjg.2.2023.09.11.23.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 23:58:40 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mikhail Tyutin <m.tyutin@yadro.com>,
	Aleksandr Anenkov <a.anenkov@yadro.com>,
	qemu-devel@nongnu.org,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v2 08/11] target/arm: Remove references to gdb_has_xml
Date: Tue, 12 Sep 2023 15:58:03 +0900
Message-ID: <20230912065811.27796-9-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230912065811.27796-1-akihiko.odaki@daynix.com>
References: <20230912065811.27796-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: mbqj8Ml5z+MI

GDB has XML support since 6.7 which was released in 2007.
It's time to remove support for old GDB versions without XML support.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/gdbstub.c | 32 ++------------------------------
 1 file changed, 2 insertions(+), 30 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 8fc8351df7..b7ace24bfc 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -46,21 +46,7 @@ int arm_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
         /* Core integer register.  */
         return gdb_get_reg32(mem_buf, env->regs[n]);
     }
-    if (n < 24) {
-        /* FPA registers.  */
-        if (gdb_has_xml()) {
-            return 0;
-        }
-        return gdb_get_zeroes(mem_buf, 12);
-    }
-    switch (n) {
-    case 24:
-        /* FPA status register.  */
-        if (gdb_has_xml()) {
-            return 0;
-        }
-        return gdb_get_reg32(mem_buf, 0);
-    case 25:
+    if (n == 25) {
         /* CPSR, or XPSR for M-profile */
         if (arm_feature(env, ARM_FEATURE_M)) {
             return gdb_get_reg32(mem_buf, xpsr_read(env));
@@ -100,21 +86,7 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
         env->regs[n] = tmp;
         return 4;
     }
-    if (n < 24) { /* 16-23 */
-        /* FPA registers (ignored).  */
-        if (gdb_has_xml()) {
-            return 0;
-        }
-        return 12;
-    }
-    switch (n) {
-    case 24:
-        /* FPA status register (ignored).  */
-        if (gdb_has_xml()) {
-            return 0;
-        }
-        return 4;
-    case 25:
+    if (n == 25) {
         /* CPSR, or XPSR for M-profile */
         if (arm_feature(env, ARM_FEATURE_M)) {
             /*
-- 
2.42.0
