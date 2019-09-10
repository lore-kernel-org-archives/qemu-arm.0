Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5570813wrp;
        Tue, 10 Sep 2019 07:47:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyC2UE+gXm11rO/jk0gVhjKH50+jtMJ+7a6tOiRMxhPmb1SiPwH1y4og1VSbB/7Gw0r9Nmm
X-Received: by 2002:a05:620a:1103:: with SMTP id o3mr29502276qkk.28.1568126841457;
        Tue, 10 Sep 2019 07:47:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568126841; cv=none;
        d=google.com; s=arc-20160816;
        b=BvU+OO3UWe0CQSL0wmekdy4iCfFphHWMCIaWIwFJm2+FQCeCeiE/r8KiMNJqrghP4v
         yXZEU93ES/zWgf8JumNE27y8We47OhtCscgkLcI5xZMZMpkVIxHNGx8zzjIbTHhHT2SA
         fnYkgGHYXxvIpgO+1TZ6X9tPYK1t0qLlJVBcsOo6qB0rx3FRkxv28yF66z4+XJG24X9I
         Ww+/VxTGG+S273sZG+YM7ZIRwDAF8q6WXTXGtdZMbdpNKSHKSPT9U9Evqs9g0zdplcum
         ZQGa7A3whP4BD9g9BLsP79IhV0cuL7bsP7PX6a2fbUpbdrDeIhrztAhfFfGk34XJbroD
         cGJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=LQ3XAKoDLhaOzqFCNhsIdDGJrHIQSVj/rNDcC6T2wTA=;
        b=iKD0nRTdVGS2cUzziaDUmJtr2JqMZte/SndcyF/eBJdraM/BGzY8WEYYdkYr58ToF2
         KynqPeHjr5dWK3XUtUuswNDeSrMFVUfjMzUsLxfYZS4kIuzrGCGIJpMWwHsweAbi5h9x
         IliGfZ53AZGBV/SCKczjfFUJN7dvZ0OtzcJT8ZVT5l0Ys92vnVkViev9pFN3xWp56xjF
         lBaZ2RdPxMWtxGu+a37fnXTVMDiORBG7vSGytBpbLZV/wkhvkACroyi+LwbVsOeHNZhQ
         LDXrhxjXpIGlglz7Fn4fKlI3dohqX+uxYY+2ZT8va41mn/1Ep3RH9UHRY/2bwFtGjbqu
         CUKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CMo+23GR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17si12767776qka.319.2019.09.10.07.47.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2019 07:47:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CMo+23GR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i7hQN-0007kG-TU
	for alex.bennee@linaro.org; Tue, 10 Sep 2019 10:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54062)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i7hNq-0005Vg-2n
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 10:44:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i7hNo-00052n-UF
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 10:44:41 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39186)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i7hNo-00052K-OZ
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 10:44:40 -0400
Received: by mail-wr1-x444.google.com with SMTP id t16so20832780wra.6
 for <qemu-arm@nongnu.org>; Tue, 10 Sep 2019 07:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LQ3XAKoDLhaOzqFCNhsIdDGJrHIQSVj/rNDcC6T2wTA=;
 b=CMo+23GR2ChsncBNW3AD8r9qGAl4f70kTqLT5aG9Jjdja+WFEdwIgiGRU3vUBkHmHK
 6g7IHhCCIViRQ7itY+uX+uRkmdTbS6jFCe2GDsFiA+7VDFOPFiQxYrl3BdRIIszrHHQI
 8xqKeC4nzfmjr0TuAA0vuez+W9rFcMyhKQLuda3bYuEg3kZ+5c5H0L88rNXiV72liMKa
 fx4/GDxi3zM6HrfmGQuymVW60BsHXb/JZcHUkYlhonw3vnfSqs/qmJJkUk4FDln6Bghu
 P/oCKXVqQvg1E+IBmwlHkY5bMUnoQJ4gMXT4SRE28PB1FLi+l7PL7ihgxIe/QOPEkN4F
 p4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LQ3XAKoDLhaOzqFCNhsIdDGJrHIQSVj/rNDcC6T2wTA=;
 b=nHFXoq7YJiP5DJ1TxeuJsKIivtXE0jWFQXyabUlWPhHjEu4eWEGhG5jsR+BmACp17j
 U2lKdeqgeagEKbiopdaoxeRPR9DT2fdsV/49EgfriWZfSoTz0KKKHv3wewZ/yDLQxOLi
 B0LJGQwO4z+4JifUOAU5NU7fZ1oJn7reGnWq2bJLTs5UWLLTjUuc7QCiltORKlrruJiT
 xwvwD5Euu5Qt6ChRG2uvf+HAXrauCceAdRUFDVXzYWNeWX/3cwRBY5uQvP1/7NjTltkM
 RJM7+f8aqIIcnqbb0ffY4yXYC2G9zh2Aqnagb4vmZOloUZm+wFo3x9SU8Wbk6UU5gRki
 wczA==
X-Gm-Message-State: APjAAAUmukqTpYen5W6ujknHTyH1uaP4D8KOsvVcN4Q1zguvcpEoRCiS
 +09yFzPFoQG9FVq8w02VF5t5pcRCeJthEQ==
X-Received: by 2002:a5d:45c3:: with SMTP id b3mr27791244wrs.207.1568126679618; 
 Tue, 10 Sep 2019 07:44:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a192sm5703814wma.1.2019.09.10.07.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 07:44:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 15:44:23 +0100
Message-Id: <20190910144428.32597-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190910144428.32597-1-peter.maydell@linaro.org>
References: <20190910144428.32597-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH 08/13] target/arm/arm-semi: Factor out
 implementation of SYS_ISTTY
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
X-TUID: JvcjHN57I6m8

Factor out the implementation of SYS_ISTTY via the new function
tables.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/arm-semi.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 48a10dd3c3a..64ed39fc075 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -349,6 +349,7 @@ typedef uint32_t sys_writefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
                              target_ulong buf, uint32_t len);
 typedef uint32_t sys_readfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
                             target_ulong buf, uint32_t len);
+typedef uint32_t sys_isattyfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf);
 
 static uint32_t host_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
 {
@@ -399,6 +400,11 @@ static uint32_t host_readfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
     return len - ret;
 }
 
+static uint32_t host_isattyfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
+{
+    return isatty(gf->hostfd);
+}
+
 static uint32_t gdb_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
 {
     return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
@@ -420,10 +426,16 @@ static uint32_t gdb_readfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
                            gf->hostfd, buf, len);
 }
 
+static uint32_t gdb_isattyfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
+{
+    return arm_gdb_syscall(cpu, arm_semi_cb, "isatty,%x", gf->hostfd);
+}
+
 typedef struct GuestFDFunctions {
     sys_closefn *closefn;
     sys_writefn *writefn;
     sys_readfn *readfn;
+    sys_isattyfn *isattyfn;
 } GuestFDFunctions;
 
 static const GuestFDFunctions guestfd_fns[] = {
@@ -431,11 +443,13 @@ static const GuestFDFunctions guestfd_fns[] = {
         .closefn = host_closefn,
         .writefn = host_writefn,
         .readfn = host_readfn,
+        .isattyfn = host_isattyfn,
     },
     [GuestFDGDB] = {
         .closefn = gdb_closefn,
         .writefn = gdb_writefn,
         .readfn = gdb_readfn,
+        .isattyfn = gdb_isattyfn,
     },
 };
 
@@ -600,11 +614,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             return set_swi_errno(ts, -1);
         }
 
-        if (use_gdb_syscalls()) {
-            return arm_gdb_syscall(cpu, arm_semi_cb, "isatty,%x", gf->hostfd);
-        } else {
-            return isatty(gf->hostfd);
-        }
+        return guestfd_fns[gf->type].isattyfn(ts, cpu, gf);
     case TARGET_SYS_SEEK:
         GET_ARG(0);
         GET_ARG(1);
-- 
2.20.1

