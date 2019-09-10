Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5567963wrp;
        Tue, 10 Sep 2019 07:44:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzzxKcmbTQhvtr2kbg8KfOFez4v2By8me/iL2bPHkf+V3CriRroA8xeFPQOylNX0lOtkLRm
X-Received: by 2002:a37:a943:: with SMTP id s64mr27956106qke.404.1568126698503;
        Tue, 10 Sep 2019 07:44:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568126698; cv=none;
        d=google.com; s=arc-20160816;
        b=aOwD7Wl3s1pvfOwRRoGIJZcu8N0+wGYQyNW9+PwwCFattLrqVr6U9NYCQBWnK6lldl
         gqgDnarw7suOB7PA9+Ii84lkqwf3LKdAZywmBg9C4xh5CH5fusXwveQ7Egb/R17A5ltA
         UdqUgWairm8OjzVDJBhOlX7TDo7eynPfjeMuszos7fBd5wdwxhtjzN4omyUk8MFL0ft3
         5D5cM5Swoe58noqZX32Mz2klm0AtiOX422dmUta2C5xafG4HzkH6i5tUhlsQ2n6yCc1c
         YAomVWaO3QnJ0mwd4nxQ/X84p60Ronj+5O63e/KHqFjyewOG4M3x9OpRbSQvUq3Jy2qY
         V04A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=+93zhnxV6y7awAg0ASSqV7pmnPcURr2F+yzvl9fZsA4=;
        b=fJ+c6sMBOqEYf6DM9fPcqr/qNP5V3D1U41PCT4ENYNmhx2L1W/rBbOPye10NdiNdTl
         VReA454w61GklJMbnALKa1HrBKFh70+cILUfqoYNlCEXWr7/v6POj0zJt7LDjTtE8mMQ
         6vHYNyIEx4Fk9rncX3A08ckHAat6vGnRCDj2ta1kQ6+I+C+5gRIgwgqhRKy/Qgy04GiB
         RZ0urmoXAtKFlI69pBuCQaPFE8hW70suCePaz1QqXVdxC0KZ+dpMjh6yj3dv8jXeoa1h
         r94w/Y8kRikF3n3Oq0mn95tA0pGP/9H8E41h9VyJs/W+WFgqkoF+h+arskCZQulcVVEw
         F9Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yjlgCfy9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10si2618596qtr.225.2019.09.10.07.44.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2019 07:44:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yjlgCfy9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i7hO4-0005PP-Rz
	for alex.bennee@linaro.org; Tue, 10 Sep 2019 10:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53883)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i7hNi-0005Kv-IO
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 10:44:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i7hNh-0004xf-IV
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 10:44:34 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:35238)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i7hNh-0004xA-DB
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 10:44:33 -0400
Received: by mail-wr1-x442.google.com with SMTP id g7so20892634wrx.2
 for <qemu-arm@nongnu.org>; Tue, 10 Sep 2019 07:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+93zhnxV6y7awAg0ASSqV7pmnPcURr2F+yzvl9fZsA4=;
 b=yjlgCfy9He+gTLDKlS4tw4uJ09J7Z4UDlHWsRjtbB+txmHoBkLZCVFMrmmsmTuh2NW
 rlmUYDsPDLwT6abct4DmFK3w9vnVVOmqK7dNdwZzduuRc7ceYZpHMpN6mYv2VPje1hX8
 LUv8zHDO6H0C7IbQZ7lKKSWPisdiX9jbI1gx7JtgLDtDYbepW6gzfg8yifKqH7TlyaQn
 IDFNKgXt9L4uYdzZT3sBGEgSaoH91SkjAjOkSdzm7hUUnSw3fAQcW3V+xj4SBCvTBeaD
 uwFB2vzUsONxWrPeppaFOLM9bnBAhkckPPCYVh2W1XHxvqGJkv4It126hXq3BPWXRltt
 rSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+93zhnxV6y7awAg0ASSqV7pmnPcURr2F+yzvl9fZsA4=;
 b=IlxDkNEb6nU0KFW81Bmy9Q/FfT063ak7ICqRBy2FctX3PCJOrYSMul8DHaS+rLfrSI
 AAPw+iQ7Un3erbQcLjBtlbA9lrhzIvUgthd0tzdt/o/3Eya1XFgFsCJHchS0hrgD6CLV
 nt+3l+okt9HFBgq7qTLAl3RkZdnqhGv76mfKQbw0opMW6VZbkCbJgP9CyV+NpOMTazii
 1q9xw/NV7AUfRcURjHa7voij53XdFyU8D/U9AxnvuVpgZwtSovsDo/eAk0tu3VrwNmDY
 5y338ca9LxuezxHxI4vfzGnN3p9WZgLGCfpA3n9sE7QI2nQHaqSEz0fo07gBzS/a+56d
 jJXg==
X-Gm-Message-State: APjAAAXY9/EZYRU/QxkqfDGCxibzxcSxKVAXKhIBoc4Ob+XtJ6gn1nsY
 49ZyzX/rE54wjj50t5nqatJBGpZo7TF/PA==
X-Received: by 2002:adf:f110:: with SMTP id r16mr4111003wro.152.1568126672093; 
 Tue, 10 Sep 2019 07:44:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a192sm5703814wma.1.2019.09.10.07.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 07:44:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 15:44:16 +0100
Message-Id: <20190910144428.32597-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190910144428.32597-1-peter.maydell@linaro.org>
References: <20190910144428.32597-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH 01/13] target/arm/arm-semi: Capture errno in
 softmmu version of set_swi_errno()
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
X-TUID: n2y1FjKKfzjU

The set_swi_errno() function is called to capture the errno
from a host system call, so that we can return -1 from the
semihosting function and later allow the guest to get a more
specific error code with the SYS_ERRNO function. It comes in
two versions, one for user-only and one for softmmu. We forgot
to capture the errno in the softmmu version; fix the error.

(Semihosting calls directed to gdb are unaffected because
they go through a different code path that captures the
error return from the gdbstub call in arm_semi_cb() or
arm_semi_flen_cb().)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
NB that a later commit will put in some cleanup of TaskState
that will let us reduce the duplication between the two
implementations of this function.
---
 target/arm/arm-semi.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 90423a35deb..03e60105c05 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -114,8 +114,13 @@ static inline uint32_t set_swi_errno(TaskState *ts, uint32_t code)
     return code;
 }
 #else
+static target_ulong syscall_err;
+
 static inline uint32_t set_swi_errno(CPUARMState *env, uint32_t code)
 {
+    if (code == (uint32_t)-1) {
+        syscall_err = errno;
+    }
     return code;
 }
 
@@ -124,10 +129,6 @@ static inline uint32_t set_swi_errno(CPUARMState *env, uint32_t code)
 
 static target_ulong arm_semi_syscall_len;
 
-#if !defined(CONFIG_USER_ONLY)
-static target_ulong syscall_err;
-#endif
-
 static void arm_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-- 
2.20.1

