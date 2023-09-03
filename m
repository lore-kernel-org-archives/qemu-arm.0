Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp595850ejb;
        Sat, 2 Sep 2023 21:31:36 -0700 (PDT)
X-Received: by 2002:a17:902:ced2:b0:1bb:cd5a:ba53 with SMTP id d18-20020a170902ced200b001bbcd5aba53mr9594011plg.14.1693715496511;
        Sat, 02 Sep 2023 21:31:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693715496; cv=none;
        d=google.com; s=arc-20160816;
        b=b+i2KgTc1jsaS1pL9/5nUW/Iy4lZrFED2S/P4XdCPhy2rZHTL8mE4eeSd7x3xsXQk1
         AhiO9o6Yj4VJEVoGUERgmprhLhzKFChzCrUPgNJDBXMljsPGLnoJLfLuFKRaqR/4AgEe
         ThB+oPkQd19NMZ1R5sODa1VsXmDJNuEnDDS7+RWUs3gEbtnZZOyhp5D+DpL1H63yB6BQ
         lrN9HnJJPm6xMs8xuX48LIoAC7NTu8hK49Rn9FJ120Oyb0KJUM1Lr/NaV12Z+ocumzBE
         C5fjFXotrswIunzsoLR2Dt/XX1F6rIjrijiCysUk5LncNqPsZzvsh0EdpKY8sTjthy9H
         F9+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=imQ9qzdcJDtD/a1jypCsLu37Mc6AwMqkJVAfloEAGmU=;
        fh=mOjAWjm9SVJGsoYL3k28ZexAFXQK9L+zOTfiRIvd12U=;
        b=ESw/RRVZCMiWji8LTtF8s4SrtmJpJPeEqT6CfNtVQtXTGAx/j8HiO/XneQ7+NRCSn2
         8Tr/Y5dYGWByc7k4oYrzard6DbmmaWz8uUQSJB12J28M1h0NHhC3SJB/CBtU2grw4I61
         CiGMF9Kq4YW+yt/ZcDM3bP9HeLTLXWB+FUdV5KAsjASxTYs6VAy7ySgS8iQolt2yJLXI
         usppTjtakGrtj0TP4jKVVQGjVOUWhnDIZdbjrn4EQmX98eUIQlHKaTl9sEpbvJSBfMGx
         ejTReqie0W9qeVDo8YyhU+kTh9sPRdEfNukAKLmB4TflUxeYzi5hzyt6hKsk8gpkRspx
         3S8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="d8T4Rzr/";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y8-20020a17090264c800b001b9ead2791csor3303649pli.3.2023.09.02.21.31.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 02 Sep 2023 21:31:36 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="d8T4Rzr/";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1693715496; x=1694320296; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imQ9qzdcJDtD/a1jypCsLu37Mc6AwMqkJVAfloEAGmU=;
        b=d8T4Rzr/j5sjzy0usbHvCGEiT0gB7+ETy+snDyaG7afRotfQPG/+ubgy38v0BL0Zbb
         7EIJlyz+uFiuJceh14HkG6Oco0faG/RzmBsX5mjJ0GqQgIIJDFRJ1YS93N01ATWJBju/
         rI13tjRZJNAodtPg206TeUatSDUZQSzeO1tBJ5TKzNH7lMV2w97RWGVQn+R/K6592/eV
         2maBU8kkNUEZCTO3jriwB6oSh0J1ICp+vSX8Hq75lnqo/pZd2gtU0axUEF7ujpbAC/EL
         m8KsUrTqFxX6i4Zki71wue94r2k2f/G43q44lp7lR8UyEIiuLVe8JSWwliC9J8i/7d5u
         wy5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693715496; x=1694320296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imQ9qzdcJDtD/a1jypCsLu37Mc6AwMqkJVAfloEAGmU=;
        b=ZF25OJ75Mf5lTI2qLH8a0yPqmTK8JkVxenYNAJpjxyWuSEFJjOntLNX1p9EWzWlrdb
         XNtzUH2vV+Z6EnK12gm9tn8J9Ronq5UqdtpWyL0Ur3sZ1hYkYzqJrK0rIZkSjsRgnnwd
         MV7A2bHFslDFtaY9Oqy++sIwkbXWVUtgOc9Z5/JCbLqvAdWh+XLBukKN41ew8lpNMM/A
         MVJouEnrvT0l+8SGH+5VvhmRBUTKXMlL+h44wjOBPlSvVpK0yV3F4ybosDM9TO4yGBrL
         h4ImicPz/akE/+1HaP+klTfyHJyRJHXwELBT2XssYaac1lPYpBUKQyYbHRvr+1Rg521r
         nj1Q==
X-Gm-Message-State: AOJu0YxEjCmhHz3JmAtYebqE1JDSzFvF0ULfh8BljUh/T4QRVnKoexKE
	fFRS9UQw2OtCbYARusshu20YFaQBs975/fpolgQ=
X-Google-Smtp-Source: AGHT+IGMbfp+G5QcVXO4jcvTYCcJ830aRAKEId2e0w6AbOvdHewaqNTukLG+W6rYVP9xPtXB7o9eTQ==
X-Received: by 2002:a17:902:ec84:b0:1bf:7aeb:c488 with SMTP id x4-20020a170902ec8400b001bf7aebc488mr9373299plg.29.1693715495898;
        Sat, 02 Sep 2023 21:31:35 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id iz2-20020a170902ef8200b001bb9f104328sm5295792plb.146.2023.09.02.21.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Sep 2023 21:31:35 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mikhail Tyutin <m.tyutin@yadro.com>,
	Aleksandr Anenkov <a.anenkov@yadro.com>,
	qemu-devel@nongnu.org,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH 6/8] target/arm: Remove references to gdb_has_xml
Date: Sun,  3 Sep 2023 13:30:16 +0900
Message-ID: <20230903043030.20708-7-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230903043030.20708-1-akihiko.odaki@daynix.com>
References: <20230903043030.20708-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: EdoqTg1CsJdg

GDB has XML support since 6.7 which was released in 2007.
It's time to remove support for old GDB versions without XML support.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/gdbstub.c | 32 ++------------------------------
 1 file changed, 2 insertions(+), 30 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index f421c5d041..b7ace24bfc 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -46,21 +46,7 @@ int arm_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
         /* Core integer register.  */
         return gdb_get_reg32(mem_buf, env->regs[n]);
     }
-    if (n < 24) {
-        /* FPA registers.  */
-        if (gdb_has_xml) {
-            return 0;
-        }
-        return gdb_get_zeroes(mem_buf, 12);
-    }
-    switch (n) {
-    case 24:
-        /* FPA status register.  */
-        if (gdb_has_xml) {
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
-        if (gdb_has_xml) {
-            return 0;
-        }
-        return 12;
-    }
-    switch (n) {
-    case 24:
-        /* FPA status register (ignored).  */
-        if (gdb_has_xml) {
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
