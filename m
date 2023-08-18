Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp1529380ejs;
        Thu, 17 Aug 2023 20:37:53 -0700 (PDT)
X-Received: by 2002:a17:902:da89:b0:1bc:4f04:17f4 with SMTP id j9-20020a170902da8900b001bc4f0417f4mr5762619plx.30.1692329872628;
        Thu, 17 Aug 2023 20:37:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692329872; cv=none;
        d=google.com; s=arc-20160816;
        b=y4HkIfjeYM27DBqbh8HmO/3SGbD5/31xmBaBk2lKFMd9MpwxgWplVeSKWHz//JtGMi
         tcBaxRU64Cut27bdvDRvqOobMNPt9Ax+5PmDL/6zyFst3s7Hf3xoionROKypfEBTRmPi
         WD0wXYfIz04vR4aukBWKov9UmZOQZSj8KcZ9Gg2lhFNCx+RAM0aQijagiNfEN2ZffVnh
         XgU9i/D/8czbKX+oiraPAfG/VUWeW1HdxKLdTtzRb9U8okXFZsl+Lj0EgU3PYWIs0V3U
         VGYVLNTSac1jS6VMkwj0Ctxajkf6dgNnZ7FzHFLLggeCA43396UuIRx9Ss3mTvAKEih0
         71YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Gp/kxAcFG041fuCB7eSCneQ328svw2ciA3ODd6siWoU=;
        fh=gfDbRRhOdmFCOBT59vf8daDPZ6IOwQnGTjK0VtoKJLI=;
        b=Z+SWVGWS7mP4zz+3JAK4AUVz1UfFbeWCPrIrYwaW5/Ad6HiB6Lc8JECBa5/3xdsfvk
         KVrqoK1ngCl1ndtelecFRH2Pt6nIgEg1BlZyjoliuUm1kKXMDLHr3MNOmwnlNX5VUcCi
         ViwT3/oVnEPoDl8SsJM7ufoeKvSPGF8YVmINxdJg3f/Huqlw0qM5wKSxc++4ocOcTDK9
         CT6LJfftLGt9yQVpiQPzLiM1mQzIpleX/cb4MqcAImMcDG6lPQKClo2Y/EkU/A8i/xHk
         gnF49PME2UEKcStWvklN2lYb7uDC1V6rv+TGkkEcvsSOeD/hpBT2uirP0Ldx2TIAqEmo
         CSTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=CB3Zd7Xi;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q19-20020a638c53000000b00563f30adfd0sor496808pgn.4.2023.08.17.20.37.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 17 Aug 2023 20:37:52 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=CB3Zd7Xi;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692329872; x=1692934672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gp/kxAcFG041fuCB7eSCneQ328svw2ciA3ODd6siWoU=;
        b=CB3Zd7XiCZPUa9cfX5MIrERKntVTDPlXfzhlrw3DD384Ne486U76HN2/ICgNDUaPBg
         kat+vkX77bbb7pibsrjhqnSD4aOnX3dprzHuQQwlu2/QXl/6M0xJLmlqsjZPbsURgxlq
         1mu7iMPY5TG7nN7YdalxOyfJIRIkGR3mQ2rqTYdv2KwIHOxxtE9pJbhrgbv8OpbAhGIx
         sr8Hff1Aq6Qtqknju7D5mbiHdMumpeHlK+NXQy2QcUFEamcqpQ3Y+EoByca/cZjSWByD
         SbwUF905YfFJ2tBU9sQtdzdsNXuAstyslHJAk49537oQMotWn3MYYl9M3iTAfmbIfpv/
         vkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692329872; x=1692934672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gp/kxAcFG041fuCB7eSCneQ328svw2ciA3ODd6siWoU=;
        b=KkWDUe+pdRMjpA6ja3H4CC4rodxX3Qk/wKMfQ+5C6v5NAPzCPvybBKOX0jm6uy5NVY
         ju3Wepxcp5H0Sf4lB9D1FcfiT9pIW6YyIwQgpL9kawmfwscIQoDKgINbAHqhprOEs+aP
         MinppLI/hZmNhg0hpb7EvcRGkoodoVNksJcUczoFKCXazine4cBUX1ZT3b336tskS01C
         gZBcI7FVmIr0pD6Zd0Ms0Sgy8tWoX+wR+d2XX0oc5YlVfyCEuDIb6oeCZ5/9QBBb19q5
         IhO+TvrQ2b0bTr9U6Hf40X9SKHaWuhmNRcRYv0cY9I8KSem5zmoTlRT3Ze6pZ93Z7bBl
         DcVg==
X-Gm-Message-State: AOJu0Yzb96MrRAMB0pDe1MLoLxycBFxXzeLXy55RNlZlzJh0Ewyvwn3n
	ZuRHynRZiUbi9GrUshZWQJvB35B8+XeLvNcj+7U=
X-Google-Smtp-Source: AGHT+IE9jOBNcA9rOpHutz5RSCndyrwhakRzbJiNH6sQwIGKL51XiY+yEQNwtLn2oIl71lezIovewg==
X-Received: by 2002:a05:6a20:1594:b0:134:73f6:5832 with SMTP id h20-20020a056a20159400b0013473f65832mr1780255pzj.16.1692329872018;
        Thu, 17 Aug 2023 20:37:52 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id c24-20020aa781d8000000b00686a80f431dsm484135pfn.126.2023.08.17.20.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 20:37:51 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mikhail Tyutin <m.tyutin@yadro.com>,
	Aleksandr Anenkov <a.anenkov@yadro.com>,
	qemu-devel@nongnu.org,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH RESEND v5 18/26] target/arm: Remove references to gdb_has_xml
Date: Fri, 18 Aug 2023 12:36:37 +0900
Message-ID: <20230818033648.8326-19-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230818033648.8326-1-akihiko.odaki@daynix.com>
References: <20230818033648.8326-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: sG0AGC5tpYJI

GDB has XML support since 6.7 which was released in 2007.
It's time to remove support for old GDB versions without XML support.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/arm/gdbstub.c | 32 ++------------------------------
 1 file changed, 2 insertions(+), 30 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index dbc396a88b..4cccaa42e0 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -45,21 +45,7 @@ int arm_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
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
@@ -99,21 +85,7 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
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
2.41.0
