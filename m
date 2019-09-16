Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4067874wrp;
        Mon, 16 Sep 2019 07:15:55 -0700 (PDT)
X-Received: by 2002:a5d:4247:: with SMTP id s7mr33192wrr.110.1568643355736;
        Mon, 16 Sep 2019 07:15:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568643355; cv=none;
        d=google.com; s=arc-20160816;
        b=YrTiv2Xj11ARU9TGInYwINvDrCVN7iiq64jOxksqtANP4l9tjxscposvILKXc9xphV
         CiIKtZajU30ZR8LXOvE4gB3Tnd450R2nHDpe1AGUTxuW+c26VVkQlmM20QzturycDK9i
         JNmi566ytUCpdy+9IBwIsF0MyMRr1X36noGohVWTL1quq03aUJGg5pehlCJ5Vl3u2hJ6
         8ZSYJeHY42b+Yy3Z0ME2XTKnP4qaBZStO+vXtWSKGVDNqsCOmzr3FHpzv+Sli0xWzbdt
         mtQmHHmopecD03fTYtKhaWl2+x8nGUgn3YTZCi3lODYI1mKKgYbP7uXhWlwBUWZiEOaG
         t/Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yIjqE3N6eSZNfzCdyh3+uQKud53B4e3Qu5WNOWAkg2U=;
        b=f4ETKqg+UDXt8rCZfnFijjLxJDNJ/X201/peSTp4bRCGIF+DHQrC0BXwQNDaSXDqYG
         6EPqEb86t3vBs5d8LcYNUv6rcmfIYPNOWWM2qVckhjpCUzroS8LsePq/MM5OH7+y4r6a
         VKqkSy2DsXSli6/gf6owVnRtrlIK9hlrd08LguC+3tKbyW7AEaC0PwSwVyLg0MafadIy
         lTlVfUYUPYDPE3+bD7vtfxozG3nW0e9x30ss3sm7gcf2szfJGu3DYLT1I4KrSzHrIrdC
         acef6BgzjfE3WJBEu1ZbDmRxBIIwShGzAJKyWa/Cxnc0nDXvOQ5iJ7ZLg/DqMp337zkn
         bhKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FI7uP5I3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o205sor6680898wma.26.2019.09.16.07.15.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Sep 2019 07:15:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FI7uP5I3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yIjqE3N6eSZNfzCdyh3+uQKud53B4e3Qu5WNOWAkg2U=;
        b=FI7uP5I3r/O4vIdyj5lxWSCJONj5vFeUZpRbFdEIDXU7IqTRuD/Pa2XvZjpGa1rnE0
         ygxMj+LaPFC73LaHF44dWHpV0VmZTCtMhxGQUeXW2wEFU81gh5DC4mgkop+t9k7EnZWc
         AqzMQUKXPmnSOnWPGL5EAkiDiM+3rxePO42528SiXJe/e8pgo01ANz8CAU4G354eNPFi
         PEHounEUwnlSDOgQ+58y2RO6lLiQ//G5wpzB7mXVt2S/tSvNNM2ZcIgsVqf+r//GkGRA
         hB5uTGu2/xNB9tyxFFnNPt7+Bpj58t0QWlDoHLCoRUgHXb3oR6w4xbYqTUUXiK5ZvFGG
         MejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yIjqE3N6eSZNfzCdyh3+uQKud53B4e3Qu5WNOWAkg2U=;
        b=skLrdutBu3OjHH+jmSwpfToqXRURLgA1IuQ3VpHCW7IKTfxi2nsqw+r6L7avuoYI8D
         gxz5Xl028GgNcghLEpVdZGx1az9f70fhqJIRggE+O891OFBZaxeLApF/8W3zYg1jyov9
         O+4edb6fBlicq8YBqQ4xEo2QqQ0iAoLdoTiRatJM/t9SWYLg2/1ubBTxwjJatUcvUsb8
         04vMBJ5Z1LZTiXQeMBZpazytpGAQeJsY8RmC5puUGtUMW+odxrgkfRo5ok7jZ1pK87PO
         mlKvfiO1ASfpIbyI0KC7Al9+crCIJobziKIY1o7vJJPcOu5YZtj/hdRHtKCyZmtjR7bf
         fo7g==
X-Gm-Message-State: APjAAAWAxbXdiyQjaT/xUIf8I5VbG0PjtHVxj1gHYDoyYLPWm7wDlhV2
	2tgOmN/MvEucWeTYZ1YOtp8dolbB
X-Google-Smtp-Source: APXvYqwhSbt37KGJoxGgGS/0t9N2/7BcUCfvfap3uG1/+J/XQxIgl2soGD+qLYdjk5g2MIHlHTw7nA==
X-Received: by 2002:a7b:c108:: with SMTP id w8mr2915539wmi.8.1568643355519;
        Mon, 16 Sep 2019 07:15:55 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id s9sm15185884wme.36.2019.09.16.07.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 07:15:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 07/15] target/arm/arm-semi: Factor out implementation of SYS_CLOSE
Date: Mon, 16 Sep 2019 15:15:36 +0100
Message-Id: <20190916141544.17540-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190916141544.17540-1-peter.maydell@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /k+ULDQ4mH/x

Currently for the semihosting calls which take a file descriptor
(SYS_CLOSE, SYS_WRITE, SYS_READ, SYS_ISTTY, SYS_SEEK, SYS_FLEN)
we have effectively two implementations, one for real host files
and one for when we indirect via the gdbstub. We want to add a
third one to deal with the magic :semihosting-features file.

Instead of having a three-way if statement in each of these
cases, factor out the implementation of the calls to separate
functions which we dispatch to via function pointers selected
via the GuestFDType for the guest fd.

In this commit, we set up the framework for the dispatch,
and convert the SYS_CLOSE call to use it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/arm-semi.c | 44 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 02cd673d47d..e5f1e2aaaf2 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -109,6 +109,7 @@ static int open_modeflags[12] = {
 typedef enum GuestFDType {
     GuestFDUnused = 0,
     GuestFDHost = 1,
+    GuestFDGDB = 2,
 } GuestFDType;
 
 /*
@@ -172,14 +173,14 @@ static GuestFD *do_get_guestfd(int guestfd)
 /*
  * Associate the specified guest fd (which must have been
  * allocated via alloc_fd() and not previously used) with
- * the specified host fd.
+ * the specified host/gdb fd.
  */
 static void associate_guestfd(int guestfd, int hostfd)
 {
     GuestFD *gf = do_get_guestfd(guestfd);
 
     assert(gf);
-    gf->type = GuestFDHost;
+    gf->type = use_gdb_syscalls() ? GuestFDGDB : GuestFDHost;
     gf->hostfd = hostfd;
 }
 
@@ -376,6 +377,39 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb_syscall_complete_cb cb,
     return is_a64(env) ? env->xregs[0] : env->regs[0];
 }
 
+/*
+ * Types for functions implementing various semihosting calls
+ * for specific types of guest file descriptor. These must all
+ * do the work and return the required return value for the guest,
+ * setting the guest errno if appropriate.
+ */
+typedef uint32_t sys_closefn(ARMCPU *cpu, GuestFD *gf);
+
+static uint32_t host_closefn(ARMCPU *cpu, GuestFD *gf)
+{
+    CPUARMState *env = &cpu->env;
+
+    return set_swi_errno(env, close(gf->hostfd));
+}
+
+static uint32_t gdb_closefn(ARMCPU *cpu, GuestFD *gf)
+{
+    return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
+}
+
+typedef struct GuestFDFunctions {
+    sys_closefn *closefn;
+} GuestFDFunctions;
+
+static const GuestFDFunctions guestfd_fns[] = {
+    [GuestFDHost] = {
+        .closefn = host_closefn,
+    },
+    [GuestFDGDB] = {
+        .closefn = gdb_closefn,
+    },
+};
+
 /* Read the input value from the argument block; fail the semihosting
  * call if the memory read fails.
  */
@@ -485,11 +519,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             return set_swi_errno(env, -1);
         }
 
-        if (use_gdb_syscalls()) {
-            ret = arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
-        } else {
-            ret = set_swi_errno(env, close(gf->hostfd));
-        }
+        ret = guestfd_fns[gf->type].closefn(cpu, gf);
         dealloc_guestfd(arg0);
         return ret;
     case TARGET_SYS_WRITEC:
-- 
2.20.1
