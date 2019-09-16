Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4068029wrp;
        Mon, 16 Sep 2019 07:16:03 -0700 (PDT)
X-Received: by 2002:a7b:c182:: with SMTP id y2mr5420574wmi.156.1568643363076;
        Mon, 16 Sep 2019 07:16:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568643363; cv=none;
        d=google.com; s=arc-20160816;
        b=aOPhUNZ3wlGAAZ6MXcRR9biKEgwZwfbJ6pSyF6WxMqY7ZD8NBFL9BHzsrpqNs+sqLD
         QeQKYkGmM2GeXfiLxMFhLYRI19pwSGPG1SpCNWffzNIUizDsq3ec1RVtfaQtJ5XsIGHs
         FufpLXo5UlM5hmXRh761yctMLdKnMR0zFv4NRyb67D1+nXO1juZqod8WptEbBGlNrrhr
         NYT0HGTakVtMoAE6FOMdIxjpBPfgMGnFVE4wkSfBFYNP/8e1HA1jwh3wPasSFGLG3aK2
         EDmNilI/EDjrUq2f2N+qVBWdfBIppci+gs8aPgWwTzdutDNh4wZyusSWIfc8gj2k/z3w
         CJwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+TLqHbpNEdFdoOs/T99sxVwsEvUGOL0cA+fPHcIpClc=;
        b=Wba1TKayMWIAi70wu68X+nGL7O+i6Di15VNn3MeaZKmr/qTqyP25GBsFT849WFYr9d
         S9Bxd5CpoQlfQTuOYmAMZzYBS8XpA/ANz/nzprH3bvTWFzaBMzjgXtBUAJUhVRFFUCPa
         Nhjc1CDKOZMU3Q08Yhl65QNOemTRFz0X1BgS335pIrQbNr1AjXcTXggo7VGI1ECIF98h
         cis3pZPg239x4dZdMwSiA6wxpzAGWNo8tvcHYrzbLKUIVaHhWsE3AJ1BlH+u3OjHjmFe
         DRZzxo0SY630cMj68zfh1m0wqJ1aPPCvXxi/gT6/B1jK2ksye58G/b3r2G9v7CRusaTs
         orpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sWuRAHJ+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r10sor13135094wrx.23.2019.09.16.07.16.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Sep 2019 07:16:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sWuRAHJ+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+TLqHbpNEdFdoOs/T99sxVwsEvUGOL0cA+fPHcIpClc=;
        b=sWuRAHJ+Lp0Yyv0LksXsbzNARffbqNQ0AtbIl7CvRMLd2hIXjLH8lWE3NXEhuRSd3n
         6fGAG4M1GfZCk4olMbIJd+8Mdx5UlNXa7NlpGadYbcpBak/Ee+l4bQPE4/ZdmtOjZBrb
         6ca+S9XAKta6/koGyMJrh94bpkEceDjcLIQ3wA11r4GJkh/flAkckunXEe1OyNY1b5HI
         iskjSbmUg6XHw5wI1y2cEvCnUwbmRt56MtvsDZ31Mq753n802xbbxMdKRqYGYWDyH+dl
         G3iKQBfkN6cVy2Ds7PFX659nn0mWc6FmYAdhjjqkih+qAjLfR803adNaPxqwDZN/5rrs
         BnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+TLqHbpNEdFdoOs/T99sxVwsEvUGOL0cA+fPHcIpClc=;
        b=IeIoNhjWC0us/dXrLah3YCwzRZplUbNQsNQCc1B4UEP7wBDDZ1dQcdLy13ZV/TInTN
         WfUMIwBLxFWmvJ960AGBLtlYzDvoHZ5O8Nxp0drOtZVPal+e6HZlzAQJbGDhl756VEE3
         PlI57MDgpsieAp5eTK+pVkSf5XQLwre0k83yyKo3hHkSJZ8IW4EEks1EYzi/U2u3Z0Nk
         AQNycr+eGNfprPDd29vb+ITcZBYLtl9I1NSx4L3TL91joWo0d+mopt2gDUysitvv0AhX
         m5LuNrAyxRPgSUcWtNPX6Z2X8MYVvqoi0xGhYBuCtJkWOqfKCR9GiRwooCeXdhf7yZdI
         zuHg==
X-Gm-Message-State: APjAAAULWRqRoMntLZWwzA1L55zg+uCREkakKfxof26cZCU5l1xue2FL
	dkzSj/m+gbIm60qLa1uUjHzVPkWvQCHGi87w
X-Google-Smtp-Source: APXvYqxXjV9ACn0RO8JvYa5+5KwRR80QHwJXhZVSaT7RJR/S9Sse7DCQDn/W6/9nOCOwY4SIkfySAg==
X-Received: by 2002:a5d:55d0:: with SMTP id i16mr32654wrw.108.1568643362808;
        Mon, 16 Sep 2019 07:16:02 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id s9sm15185884wme.36.2019.09.16.07.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 07:16:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 13/15] target/arm/arm-semi: Implement support for semihosting feature detection
Date: Mon, 16 Sep 2019 15:15:42 +0100
Message-Id: <20190916141544.17540-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190916141544.17540-1-peter.maydell@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: MVQVNjEFso1e

Version 2.0 of the semihosting specification added support for
allowing a guest to detect whether the implementation supported
particular features. This works by the guest opening a magic
file ":semihosting-features", which contains a fixed set of
data with some magic numbers followed by a sequence of bytes
with feature flags. The file is expected to behave sensibly
for the various semihosting calls which operate on files
(SYS_FLEN, SYS_SEEK, etc).

Implement this as another kind of guest FD using our function
table dispatch mechanism. Initially we report no extended
features, so we have just one feature flag byte which is zero.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/arm-semi.c | 109 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 108 insertions(+), 1 deletion(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 87c911f0187..57491740d73 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -110,6 +110,7 @@ typedef enum GuestFDType {
     GuestFDUnused = 0,
     GuestFDHost = 1,
     GuestFDGDB = 2,
+    GuestFDFeatureFile = 3,
 } GuestFDType;
 
 /*
@@ -118,7 +119,10 @@ typedef enum GuestFDType {
  */
 typedef struct GuestFD {
     GuestFDType type;
-    int hostfd;
+    union {
+        int hostfd;
+        target_ulong featurefile_offset;
+    };
 } GuestFD;
 
 static GArray *guestfd_array;
@@ -504,6 +508,89 @@ static uint32_t gdb_flenfn(ARMCPU *cpu, GuestFD *gf)
                            gf->hostfd, arm_flen_buf(cpu));
 }
 
+#define SHFB_MAGIC_0 0x53
+#define SHFB_MAGIC_1 0x48
+#define SHFB_MAGIC_2 0x46
+#define SHFB_MAGIC_3 0x42
+
+static const uint8_t featurefile_data[] = {
+    SHFB_MAGIC_0,
+    SHFB_MAGIC_1,
+    SHFB_MAGIC_2,
+    SHFB_MAGIC_3,
+    0, /* Feature byte 0 */
+};
+
+static void init_featurefile_guestfd(int guestfd)
+{
+    GuestFD *gf = do_get_guestfd(guestfd);
+
+    assert(gf);
+    gf->type = GuestFDFeatureFile;
+    gf->featurefile_offset = 0;
+}
+
+static uint32_t featurefile_closefn(ARMCPU *cpu, GuestFD *gf)
+{
+    /* Nothing to do */
+    return 0;
+}
+
+static uint32_t featurefile_writefn(ARMCPU *cpu, GuestFD *gf,
+                                    target_ulong buf, uint32_t len)
+{
+    /* This fd can never be open for writing */
+    CPUARMState *env = &cpu->env;
+
+    errno = EBADF;
+    return set_swi_errno(env, -1);
+}
+
+static uint32_t featurefile_readfn(ARMCPU *cpu, GuestFD *gf,
+                                   target_ulong buf, uint32_t len)
+{
+    uint32_t i;
+#ifndef CONFIG_USER_ONLY
+    CPUARMState *env = &cpu->env;
+#endif
+    char *s;
+
+    s = lock_user(VERIFY_WRITE, buf, len, 0);
+    if (!s) {
+        return len;
+    }
+
+    for (i = 0; i < len; i++) {
+        if (gf->featurefile_offset >= sizeof(featurefile_data)) {
+            break;
+        }
+        s[i] = featurefile_data[gf->featurefile_offset];
+        gf->featurefile_offset++;
+    }
+
+    unlock_user(s, buf, len);
+
+    /* Return number of bytes not read */
+    return len - i;
+}
+
+static uint32_t featurefile_isattyfn(ARMCPU *cpu, GuestFD *gf)
+{
+    return 0;
+}
+
+static uint32_t featurefile_seekfn(ARMCPU *cpu, GuestFD *gf,
+                                   target_ulong offset)
+{
+    gf->featurefile_offset = offset;
+    return 0;
+}
+
+static uint32_t featurefile_flenfn(ARMCPU *cpu, GuestFD *gf)
+{
+    return sizeof(featurefile_data);
+}
+
 typedef struct GuestFDFunctions {
     sys_closefn *closefn;
     sys_writefn *writefn;
@@ -530,6 +617,14 @@ static const GuestFDFunctions guestfd_fns[] = {
         .seekfn = gdb_seekfn,
         .flenfn = gdb_flenfn,
     },
+    [GuestFDFeatureFile] = {
+        .closefn = featurefile_closefn,
+        .writefn = featurefile_writefn,
+        .readfn = featurefile_readfn,
+        .isattyfn = featurefile_isattyfn,
+        .seekfn = featurefile_seekfn,
+        .flenfn = featurefile_flenfn,
+    },
 };
 
 /* Read the input value from the argument block; fail the semihosting
@@ -616,6 +711,18 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             unlock_user(s, arg0, 0);
             return guestfd;
         }
+        if (strcmp(s, ":semihosting-features") == 0) {
+            unlock_user(s, arg0, 0);
+            /* We must fail opens for modes other than 0 ('r') or 1 ('rb') */
+            if (arg1 != 0 && arg1 != 1) {
+                dealloc_guestfd(guestfd);
+                errno = EACCES;
+                return set_swi_errno(env, -1);
+            }
+            init_featurefile_guestfd(guestfd);
+            return guestfd;
+        }
+
         if (use_gdb_syscalls()) {
             arm_semi_open_guestfd = guestfd;
             ret = arm_gdb_syscall(cpu, arm_semi_open_cb, "open,%s,%x,1a4", arg0,
-- 
2.20.1
