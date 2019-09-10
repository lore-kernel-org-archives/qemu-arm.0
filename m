Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5574264wrp;
        Tue, 10 Sep 2019 07:50:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw3otQB3EcGL4CGpvT6bHNARx4CePWa3PTxV3sYsMoFKfhnrlewlLthBwmA3sYLLDL1SD5b
X-Received: by 2002:ac8:728c:: with SMTP id v12mr29716123qto.120.1568127033189;
        Tue, 10 Sep 2019 07:50:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568127033; cv=none;
        d=google.com; s=arc-20160816;
        b=xOhOZNQ0u3ngO9cHhYA2xxoturEnk/mVxF32bsY66Qyw/eEd1NhHhhsmqiAG0eW8tX
         DouNTfMc0yPjV2tGXovmYmxmWJQfm8rGFroiIg0hhO+BXcnqaZMPbodtahtNgD0Wod2i
         iBf2q8a6ZVdDlXeoR8lYRtOSkWi9W1Edd0G26mPmEj5XPh3s97mLCi37U/kG2KIjuRnS
         11zESPZV76XB8bwgi/ZR/NF7dmp3rgKYi5fnc2fEGwSrT/gnNiS4PhgB+o3/t8e0Nx9M
         1UXgfT7kxT2m8VbZxVEa7IZYiY3FoKxowf/8B5VKciy8zUUIjQuV1gps77u9q3+AIrJc
         hLIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=zlo9vQHXYMdSRYQxbnaGFzeWoJMkmJsq2rf4IJ1ziW4=;
        b=KWtGuzI56hDF3EGkFiv6Zo1aYvwZ5DG+u2qbq7/x6QXNTZzHejm4/7zpdKsyIj6Gh1
         DZJ2hqhzdBUpV7vfPFu2Qwie6OBS54eypeEmR5sBGiswdDuQ6lxIql6WgS/XFH0RmvpY
         k9qh9dwifpXL4SfAkCSa5/+BOW1zXGeXQmXIkjzy/lFYWTOlI1sexFf8M7xMhrskS+EM
         jiiijWsjvGlWymEZddHWJrUU78o9q8V+B0k2yYs7kgG4ummXuxD9z8h4DSfs1cSmctky
         N2vNDeta/ZcovPzxzSPIIhQCW/tmSmBgVY3wI2i65APmbDuMh+MU1X2wgEh13e7I/dAr
         pjhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pun+1zY5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j34si12998943qtd.391.2019.09.10.07.50.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2019 07:50:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pun+1zY5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i7hTT-0002LM-TB
	for alex.bennee@linaro.org; Tue, 10 Sep 2019 10:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53989)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i7hNn-0005Rb-GM
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 10:44:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i7hNm-00050o-34
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 10:44:39 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:38281)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i7hNl-00050H-Tc
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 10:44:38 -0400
Received: by mail-wr1-x441.google.com with SMTP id l11so20810879wrx.5
 for <qemu-arm@nongnu.org>; Tue, 10 Sep 2019 07:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zlo9vQHXYMdSRYQxbnaGFzeWoJMkmJsq2rf4IJ1ziW4=;
 b=pun+1zY5WhN2o0gSnE577xUfjuVDwQhUVEkMW8GsvWdeh82xhKthM9G80PRZ0dZJMB
 GP3hgPkZvtMQujx48UjpE+VuU1MaxhtDM0V7KqsxgDIe3S4hvscuuRMG82ZI/l2UUnM7
 ibzTgjoZtriyYo89qDZ4faNq6B20UfYbFYUH2PdZIv4IHQpRAlMSorG0jxSsqhogCkgy
 28gtcUnYN6Apll4DQ8kPb6TqVLwRTC85fMQ8JESNfN7yhJMB9gwDyG+hJ1UKlPRXYPrx
 qoMxWzBQB2dSAHvbSKTvpbDta9Xt9beJN2pHPI0vEb2cVavqGbQCoo+4Vh00N6Lct+vX
 cxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zlo9vQHXYMdSRYQxbnaGFzeWoJMkmJsq2rf4IJ1ziW4=;
 b=YtF8WY3LEjr5DpDAJfUlwX/xbfmyB9a20REiR4VoQ7IoLKGinGoIQxgk6rOToA37r9
 8GBUJYBdBGitBOPIFYfzGqOxRiXkwiTfFZXcUKM/fXwd7N9zPdVUgT5I9ahZGpyM5yHQ
 y4FLjfjQvtu2JSNS7mpbFewMAnffh/D/cGuivSFOAFV8CRdggeRzrhwCx6Pb0F0F1c2d
 DiO5TNYEtSSVpzBmE2pyo2wFj3Jm1zUi62iQ6U7D3oQZJcqOHq1jkxMI7g9cC8TZQEgQ
 1BN410XiaCJoCEEW2uzcSfpRTFSNmOxBxi5QvR30AnvYn4umNryL6xT/d9BBJVt0rJyM
 biBw==
X-Gm-Message-State: APjAAAU00IxVtDdi0rn5daB1lpQJkVzW+ubq3+yTt5/Lxfeq3lQPsvEQ
 drzQ/uB0udv/dht+GY9ujQMUEDNifnej/w==
X-Received: by 2002:a05:6000:142:: with SMTP id
 r2mr3251793wrx.212.1568126676765; 
 Tue, 10 Sep 2019 07:44:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a192sm5703814wma.1.2019.09.10.07.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 07:44:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 15:44:20 +0100
Message-Id: <20190910144428.32597-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190910144428.32597-1-peter.maydell@linaro.org>
References: <20190910144428.32597-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH 05/13] target/arm/arm-semi: Factor out
 implementation of SYS_CLOSE
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
X-TUID: +nFUV641+fzj

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
 target/arm/arm-semi.c | 42 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index ce3ba554bef..f3e0bf77cd3 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -116,6 +116,7 @@ static int open_modeflags[12] = {
 typedef enum GuestFDType {
     GuestFDUnused = 0,
     GuestFDHost = 1,
+    GuestFDGDB = 2,
 } GuestFDType;
 
 /*
@@ -179,14 +180,14 @@ static GuestFD *do_get_guestfd(int guestfd)
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
 
@@ -337,6 +338,37 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb_syscall_complete_cb cb,
     return is_a64(env) ? env->xregs[0] : env->regs[0];
 }
 
+/*
+ * Types for functions implementing various semihosting calls
+ * for specific types of guest file descriptor. These must all
+ * do the work and return the required return value for the guest,
+ * setting the guest errno if appropriate.
+ */
+typedef uint32_t sys_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf);
+
+static uint32_t host_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
+{
+    return set_swi_errno(ts, close(gf->hostfd));
+}
+
+static uint32_t gdb_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
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
@@ -452,11 +484,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             return set_swi_errno(ts, -1);
         }
 
-        if (use_gdb_syscalls()) {
-            ret = arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
-        } else {
-            ret = set_swi_errno(ts, close(gf->hostfd));
-        }
+        ret = guestfd_fns[gf->type].closefn(ts, cpu, gf);
         dealloc_guestfd(arg0);
         return ret;
     case TARGET_SYS_WRITEC:
-- 
2.20.1

