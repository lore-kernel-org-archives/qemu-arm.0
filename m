Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2372781ejx;
        Tue, 12 Sep 2023 15:41:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:a585:b0:154:fb34:5f01 with SMTP id gd5-20020a056a21a58500b00154fb345f01mr1141648pzc.6.1694558498306;
        Tue, 12 Sep 2023 15:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694558498; cv=none;
        d=google.com; s=arc-20160816;
        b=QSQhC/gqErdbUqX/aOmWyR8HA6SjbpAwqyHSgGEbwznXrB1aBguQKd0tUwXGSZk2tP
         osJvhCr0lJ3IbP+Z0rAXZIwj7fOLzLmVMxziZARG8UovoPWpJ5MEoQ4vHLuVfJwfn1FA
         gZ1ZfSYfBYNXyYzPn1L7JM3hDI/sbYOEiHYbax8DTsh+xmc5MBjCOFkx0z5vqI6qa74H
         6lbesc54karBH1yfEyhBn+3llTO5h7fs7bl4ItBD+RttqGGjglpNdI8IdvML2rYMTIRX
         mKjEVm/4uugUcj9Ii7Wk0TMi3zsLOJ1pMX+2qylQXU6t92KNuygcyjLlenosW8djsuPJ
         01hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qUVjTcjkNZmdhwavklqNnzqJkSIaiyxihMzM0GkWlyU=;
        fh=WS7ynnbUkvYXwAP9icKU1dVJlxsq4RIthkhMOdKIoMw=;
        b=DxpBFyiq0NUFX019UeI1pCiRfmcNmxO73r75GbYbQo5G2fk9TMaklLWOCED5WJ9V3Z
         mcF3kJbnLE6eqiFp+X81QuwhXPjyuKe38n9a8Ls219Wf67Mv9qtTHdL/LNLHoTlinutI
         JP7iAtsluabT6pwL+ejyIs9SOgeh29ngdwMCY/cncHH/Z+kQZhAV7BpoHAFdOF8bLgN0
         M6EpHV0ek8Wj/rAbMU70Pd1PKqB5IeRvasqQcq/r7JWHCGNi4sABJGBa/zafzFce3fXK
         Lntc+cKFj1ViPJMSosizrjfGKYb1IGRcBQ8FzQz0RVB1zVgIHnsZbgNY9VYBNByqboG0
         AnBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Yagt2fRX;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ik15-20020a170902ab0f00b001b9e4b6d33bsor6116509plb.7.2023.09.12.15.41.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Sep 2023 15:41:38 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Yagt2fRX;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694558497; x=1695163297; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUVjTcjkNZmdhwavklqNnzqJkSIaiyxihMzM0GkWlyU=;
        b=Yagt2fRXRuvPFQdCJy64A/Q1bGP1VAOz2GQZUkNTuBL9UlRp5U0/Ih3Hnha3b7PMhv
         JVoAOCGVlzXtFbB7RgMwudvZLExF5U3ylHMNrUZlpGreqmDNxc1tMgGNbZGtUtBIyDFt
         k8i64uTgiJDJ2ws0eWYJNfnQjOcmqRoybRmKxlEoi+u+10+rcg4CFNaZp+bSYLds/RY4
         DyVu7ZOjp4TgcetX3FFmyGRD0RbEbx71udd/6ga+WwWAhQrye+XnxwUuhNtxt+SSv3ZV
         XtIIe2RoCcMYnLvrxNkRF5/t/P4uyvT8fcxrB4PhcnSf47MdtxvG/qRciz0dYh5ugMEe
         JVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694558497; x=1695163297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUVjTcjkNZmdhwavklqNnzqJkSIaiyxihMzM0GkWlyU=;
        b=D69ZsiOiWSw3Gsc4faLSLxz0n/WZTrOIKpz2XvVMoJ/nXeV8Qatn6AatnBWxuKC3/t
         KKJaSDVI+6aa5z9xOm6sYKoalvHEufHn0/YjHEdeJwsYX6S1g+dk9GUPi5cPleQe6CXX
         RGAI8LcQ6sI1hiAb1eFbRWWgPP4Ki5dCyTGEkFDUt031JLoQHGjwRCSBhzamW4WcuT+c
         mQp+1pNner2tE2jPX9LDDRr7XZAkzO7CRrYjQMs2TGqeXq4lA88MxvIYLhaKrpUWmYnq
         kPKD0aok2iOz2ZxnthZQxNlqG3+BIlwgaKJi2ZDlsPhxvRWXvfAyIEsJfBpyB//X5m0G
         FHtA==
X-Gm-Message-State: AOJu0YxYXhFzbTSrqQw5MIj6T6YDBLgg4y9+jLwV22IIoop0rHkmjz+Q
	uGzjM/IjCcxrygpngV7t3MJgrbRunXElYxgoXX4=
X-Google-Smtp-Source: AGHT+IG2nbzABz+c+CMqzZPhKJhBEfkgWTxlp3sD/pBZI1VhAGcfZZmGkwuua0HR3rZDxiah+fFh9Q==
X-Received: by 2002:a17:902:7892:b0:1c0:e6e1:4a11 with SMTP id q18-20020a170902789200b001c0e6e14a11mr980553pll.54.1694558497679;
        Tue, 12 Sep 2023 15:41:37 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id l13-20020a170902d34d00b001bbbc655ca1sm8996977plk.219.2023.09.12.15.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 15:41:37 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mikhail Tyutin <m.tyutin@yadro.com>,
	Aleksandr Anenkov <a.anenkov@yadro.com>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v3 09/12] target/arm: Remove references to gdb_has_xml
Date: Wed, 13 Sep 2023 07:40:58 +0900
Message-ID: <20230912224107.29669-10-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230912224107.29669-1-akihiko.odaki@daynix.com>
References: <20230912224107.29669-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FkXaUo4Ursfd

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
