Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4067905wrp;
        Mon, 16 Sep 2019 07:15:57 -0700 (PDT)
X-Received: by 2002:a1c:c789:: with SMTP id x131mr14234559wmf.20.1568643357262;
        Mon, 16 Sep 2019 07:15:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568643357; cv=none;
        d=google.com; s=arc-20160816;
        b=rvtae+4eeU3wJiT4V7v9J/RlFFyb30vIPpn/zDH3EgVBq7tLcXHHhcNPI75wmvvYh8
         6ukUJfOMNkuQNSW0p3w0gJfnGiK7gdSSiHI4GAX3gtFIyBBB7KRYL94NRyoA18LkWG0P
         euQy+7hxu5v9CxmiwFU+VMZvkowiNVpSBk3AbE2gNVqbwT0Pyx1DUrCrtj4AvykIFsXV
         tffaImGPweHqnXEuj4cpH4ioxpObmtKajgB9ISXWGO6T/+Pa0yndDvjnPawK8oprGxqJ
         AFKUdqnUypDy+RSR+Tef8EfoZsEuQ2NMdgo7UAuDjIg6oUIRa5ksUfspJ0oqKw5VPBQE
         W3rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Gh+oqgc2n48QT9sSy2M1g0ivWpPv75MEqogioo212qA=;
        b=Bq+v5+N4GpdCXZ2YDmjQBlHTrp0EtbMv3G+lYqqbk7xkGYpW0XMK2kp+9KzmJ8oEU6
         ylf67Je4VpShYKdIHf9Wf5nx+2Qat4TrWIzu5zkbW0WLsXjLpEXiXsbT3sZcr11NF9b0
         yRKtSVzVcY3r0C9k2qU7mlx4rjKWKRYMhI2t//atf0Xmym6sedd+gLG8UuQpQxQPqe71
         Nw6tqDU7ZsRPJy8PG9lDon6GVtwNXkBCBgTHQpVKvvEelUESMfSq3wjkCr9jorsX4dNa
         NeSyiNo6s8DI5aqDJ3pW5J3W5djc0UaYl0ncGlv2OnZJTqpCiLFgFoHFMbsrCsglypg8
         LNHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lrn07EFy;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h85sor6810679wme.17.2019.09.16.07.15.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Sep 2019 07:15:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lrn07EFy;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gh+oqgc2n48QT9sSy2M1g0ivWpPv75MEqogioo212qA=;
        b=lrn07EFyqGs0lOp4gEBmuBJWHYn1TV/RG3gvC6NFQv54xa/h97HYn3lSE0D45H+Aak
         /ZGFBk+FhlmEoPpJaTxbmCMBakBgN/JFba1irR5Bzlh4HuEgxT4f5benQ+MHBzS6ziR0
         +W4FDtc+u4aSOexVFb6y+pfmyjq5pRx1VUzV3K0v1oEa0eYjTQXhieyJ3npGQ5/TFyJv
         yOk5/rT7aO1KpIlHzvXc5qh03qgmW4+ft84zepll6Uj4ne+HKzC1lR8ZOL23FcqjmLIG
         aVIVPMkhYOVzdKyUv8IefU0+BYQPvXliCU26IDXrsS3If2EqBWDKyx6EZlu+eEHv1dGA
         rMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gh+oqgc2n48QT9sSy2M1g0ivWpPv75MEqogioo212qA=;
        b=MWqU+bIYX2wtMRjQhFBssx7WDorO0oqNmbkUhkgGceJvSc+DzUk3sqs8FoGA7nFYhd
         uiM2PmPIZ3lk0xaQ9hH3Fl/J/ATZb7+DgDuOnsamHULZwUyHP0Ybz22hkdvYhD1XWcbe
         7+BlVefZCxJu3tv1Vd3+cbmeJviEeax7bmxGy0ZdJ6hGan9FG1uf/rum/JFPSG4cuAeE
         RnTa3AtTRAey4E3JH0qq5mtvXMGTFgIxCev0ionsLF9BfDA5in9fvUuROTKu49QpB4Q/
         Kxv6p3/qMCllGGuJo5YRYhxcVi/GHhDG+WoKng0XGObnCf2G5jqVnfAnXcrO84j/ErOG
         bgww==
X-Gm-Message-State: APjAAAXFqalhNY90xjQT41UA85yLTG32Fywqa/XRKa0aYuNbx3Qd8lpd
	wNvsd1l5583CKSdW3LLdsHXoWmLe
X-Google-Smtp-Source: APXvYqxThPDe4JH2aEwcTLb4azIdpIzI5Kf3kh+42a8EMA9KZxDuUiG8itJbugrR9+yOgsk5/k5+6g==
X-Received: by 2002:a1c:2d44:: with SMTP id t65mr8151256wmt.12.1568643357065;
        Mon, 16 Sep 2019 07:15:57 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id s9sm15185884wme.36.2019.09.16.07.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 07:15:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 08/15] target/arm/arm-semi: Factor out implementation of SYS_WRITE
Date: Mon, 16 Sep 2019 15:15:37 +0100
Message-Id: <20190916141544.17540-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190916141544.17540-1-peter.maydell@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: QUUnGVO4ncel

Factor out the implementation of SYS_WRITE via the
new function tables.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/arm-semi.c | 51 ++++++++++++++++++++++++++++---------------
 1 file changed, 33 insertions(+), 18 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index e5f1e2aaaf2..c21cbb97bc1 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -384,6 +384,8 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb_syscall_complete_cb cb,
  * setting the guest errno if appropriate.
  */
 typedef uint32_t sys_closefn(ARMCPU *cpu, GuestFD *gf);
+typedef uint32_t sys_writefn(ARMCPU *cpu, GuestFD *gf,
+                             target_ulong buf, uint32_t len);
 
 static uint32_t host_closefn(ARMCPU *cpu, GuestFD *gf)
 {
@@ -392,21 +394,51 @@ static uint32_t host_closefn(ARMCPU *cpu, GuestFD *gf)
     return set_swi_errno(env, close(gf->hostfd));
 }
 
+static uint32_t host_writefn(ARMCPU *cpu, GuestFD *gf,
+                             target_ulong buf, uint32_t len)
+{
+    uint32_t ret;
+    CPUARMState *env = &cpu->env;
+    char *s = lock_user(VERIFY_READ, buf, len, 1);
+    if (!s) {
+        /* Return bytes not written on error */
+        return len;
+    }
+    ret = set_swi_errno(env, write(gf->hostfd, s, len));
+    unlock_user(s, buf, 0);
+    if (ret == (uint32_t)-1) {
+        ret = 0;
+    }
+    /* Return bytes not written */
+    return len - ret;
+}
+
 static uint32_t gdb_closefn(ARMCPU *cpu, GuestFD *gf)
 {
     return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
 }
 
+static uint32_t gdb_writefn(ARMCPU *cpu, GuestFD *gf,
+                            target_ulong buf, uint32_t len)
+{
+    arm_semi_syscall_len = len;
+    return arm_gdb_syscall(cpu, arm_semi_cb, "write,%x,%x,%x",
+                           gf->hostfd, buf, len);
+}
+
 typedef struct GuestFDFunctions {
     sys_closefn *closefn;
+    sys_writefn *writefn;
 } GuestFDFunctions;
 
 static const GuestFDFunctions guestfd_fns[] = {
     [GuestFDHost] = {
         .closefn = host_closefn,
+        .writefn = host_writefn,
     },
     [GuestFDGDB] = {
         .closefn = gdb_closefn,
+        .writefn = gdb_writefn,
     },
 };
 
@@ -539,24 +571,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             return set_swi_errno(env, -1);
         }
 
-        if (use_gdb_syscalls()) {
-            arm_semi_syscall_len = len;
-            return arm_gdb_syscall(cpu, arm_semi_cb, "write,%x,%x,%x",
-                                   gf->hostfd, arg1, len);
-        } else {
-            s = lock_user(VERIFY_READ, arg1, len, 1);
-            if (!s) {
-                /* Return bytes not written on error */
-                return len;
-            }
-            ret = set_swi_errno(env, write(gf->hostfd, s, len));
-            unlock_user(s, arg1, 0);
-            if (ret == (uint32_t)-1) {
-                ret = 0;
-            }
-            /* Return bytes not written */
-            return len - ret;
-        }
+        return guestfd_fns[gf->type].writefn(cpu, gf, arg1, len);
     case TARGET_SYS_READ:
         GET_ARG(0);
         GET_ARG(1);
-- 
2.20.1
