Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5573454wrp;
        Tue, 10 Sep 2019 07:50:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzY2A7VXcUzT4tlvpcxkNYNlYt05HY92HDcSv/nD2a/SWUPDCb2D7L0RZP66Sz5rd5nnfkf
X-Received: by 2002:ac8:690d:: with SMTP id e13mr23166350qtr.352.1568127000191;
        Tue, 10 Sep 2019 07:50:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568127000; cv=none;
        d=google.com; s=arc-20160816;
        b=o/LcJgfnyCbeXPjczhMC7QdjIk7L4h7p6NoseuaZPWAVrMz14HBnP0FOWF0PVte6+l
         vQaEf/ri27zLaTskT8ZsNj7ap/sC5iedPlNwElEuuB5uovbAYGMVtp/Q10Fae2nM6LdF
         mkY+hZDZbn98GiPr1RZGIkBqvUuBMTaUj787CNdc9YjFvBusj64QGoY3rwhvQtwZWdvA
         qpn9VN+Hlt8C5vGnmkrhto1eeHmXHXQ1fGwsjmJYnBGJQiEkdC3TNzob3AG0148Oey3I
         r4vfkKHFvfZWv/Cc4l3YN9qkDJPFC+SaBvThk4WMQm48rWSxjfnSutXbkVtsvo1zOs2t
         ukDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=HFFhnwi1XTh3mteeZB/9qILvDTOSvSbdeT/3s5BHyng=;
        b=C5dTP8m/Yn9diGoqnNOcj4Irh2YDr3SjKNhiYlD1MXtDvPG0o/tVxnsDg2xPQ+1AVe
         3KEEidk14N1NbJnETVJK4DhSt6gQne+qb4gY7aTL0n79CntYygwcgXn2ycBu99TkGM1r
         NBHzapdzJl9HPmCn/VYSleDH7rBiZlPF/cs23mBhRXSNpVjkBAP4yWMx+s621zzVAzV4
         OgRsfK+2sZ1lUfF64/WYBCRGMJQWDI3UTTFsu6g1kliYShy+J36NThhREw51l/6ZOziZ
         lJxWqfpa+xILGU5anbClX99zJ3AgoWWFCcn6wRfIN0FZ7JBHinOT6K59Gg30wWGGoK60
         1P8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=z0OXDxHK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q20si13109813qve.100.2019.09.10.07.50.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2019 07:50:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=z0OXDxHK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i7hSw-0001d0-FM
	for alex.bennee@linaro.org; Tue, 10 Sep 2019 10:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54162)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i7hNu-0005bk-AC
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 10:44:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i7hNs-00055t-Tx
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 10:44:46 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:34248)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i7hNs-00055D-OG
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 10:44:44 -0400
Received: by mail-wr1-x441.google.com with SMTP id a11so11069291wrx.1
 for <qemu-arm@nongnu.org>; Tue, 10 Sep 2019 07:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HFFhnwi1XTh3mteeZB/9qILvDTOSvSbdeT/3s5BHyng=;
 b=z0OXDxHK0OAM37pLD3qWAdkOd2MXOAjoEsXOa6/rmAaP3RxEgFPj+MkEEe2R5xmLyT
 N6Dmh4rlbm6D6Vet9Hp894dXJC+t8qEmC71ryNd0RW+HVcQDe5iCzPxr5Rqn49TAm3BQ
 AnCXv1eZ/FxwkMeZZ3G9yrEB+uCz53JO9cRicduZQO+8o3IkG/xVTlzDVLZ73oYpZ/2C
 yyIn7kMqwf0R0pQ+jLcrTC9Xvh8cokBxF0bN/XtySXYZs1gcf+J/ah3cg1+P6ypD+r9H
 KYb6pKaqYnMWJMv7iiwLor32Ucz7L46Y+P7Myse0E7ivB/R5AWUPYDJMzRPmgZNFIxWE
 kdbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HFFhnwi1XTh3mteeZB/9qILvDTOSvSbdeT/3s5BHyng=;
 b=nj3g3+6CkVkmE1di6yBdY6wWSE9QfGhb0zRoGyxO1539XzWnCLd6nX9wdjJLNKkx1i
 TDDr14VqZnOUfIMoCGfwQaaoodlGnlDzPVOPBGE2UFIAaK4q/ZIhoYzk2l0cIqAiR8BL
 SIls+OtAHlkxv2sCJsfy3+/Y0y0LauQXauhYz6tR66YbIasGfJJiX+MR+M3aKXU1r+/o
 3N6X0wHsp5JSh7rF09vsoz+MkvBdf7epppx+XJ54EMDdwKxglBKYaptwQ1O0Zvf1peyQ
 6ZBR86F9T7DiOBIlR2Ykltc3eBHbAJwd6nyHADdfZAiHUl/SvzWNGh35neexHjkYBvXt
 fOjg==
X-Gm-Message-State: APjAAAWvg0m1nB7cdtIidtzbMQXKc1/eXNRQsjSDNVOPppf9qM6IupMw
 856qXxKdoQXR7a342yrizI7V2FM5/43stw==
X-Received: by 2002:adf:f543:: with SMTP id j3mr8291026wrp.243.1568126683569; 
 Tue, 10 Sep 2019 07:44:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a192sm5703814wma.1.2019.09.10.07.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 07:44:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 15:44:26 +0100
Message-Id: <20190910144428.32597-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190910144428.32597-1-peter.maydell@linaro.org>
References: <20190910144428.32597-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH 11/13] target/arm/arm-semi: Implement support for
 semihosting feature detection
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HUhsFl+0lLHh

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
---
 target/arm/arm-semi.c | 107 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 106 insertions(+), 1 deletion(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index f9019b00b8d..531084b7799 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -117,6 +117,7 @@ typedef enum GuestFDType {
     GuestFDUnused = 0,
     GuestFDHost = 1,
     GuestFDGDB = 2,
+    GuestFDFeatureFile = 3,
 } GuestFDType;
 
 /*
@@ -125,7 +126,10 @@ typedef enum GuestFDType {
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
@@ -467,6 +471,87 @@ static uint32_t gdb_flenfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
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
+static uint32_t featurefile_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
+{
+    /* Nothing to do */
+    return 0;
+}
+
+static uint32_t featurefile_writefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
+                                    target_ulong buf, uint32_t len)
+{
+    /* This fd can never be open for writing */
+    errno = EBADF;
+    return set_swi_errno(ts, -1);
+}
+
+static uint32_t featurefile_readfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
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
+static uint32_t featurefile_isattyfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
+{
+    return 0;
+}
+
+static uint32_t featurefile_seekfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
+                                   target_ulong offset)
+{
+    gf->featurefile_offset = offset;
+    return 0;
+}
+
+static uint32_t featurefile_flenfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
+{
+    return sizeof(featurefile_data);
+}
+
 typedef struct GuestFDFunctions {
     sys_closefn *closefn;
     sys_writefn *writefn;
@@ -493,6 +578,14 @@ static const GuestFDFunctions guestfd_fns[] = {
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
@@ -586,6 +679,18 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             unlock_user(s, arg0, 0);
             return guestfd;
         }
+        if (strcmp(s, ":semihosting-features") == 0) {
+            unlock_user(s, arg0, 0);
+            /* We must fail opens for modes other than 0 ('r') or 1 ('rb') */
+            if (arg1 != 0 && arg1 != 1) {
+                dealloc_guestfd(guestfd);
+                errno = EINVAL;
+                return set_swi_errno(ts, -1);
+            }
+            init_featurefile_guestfd(guestfd);
+            return guestfd;
+        }
+
         if (use_gdb_syscalls()) {
             ret = arm_gdb_syscall(cpu, arm_semi_cb, "open,%s,%x,1a4", arg0,
                                   (int)arg2+1, gdb_open_modeflags[arg1]);
-- 
2.20.1

