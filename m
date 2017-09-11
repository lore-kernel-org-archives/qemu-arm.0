Received: by 10.223.172.38 with SMTP id v35csp5564022wrc;
        Mon, 11 Sep 2017 06:55:14 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QC+xXUvWo4B6Br2Xyu8vT4uSzrCpc8HeleCLslg/BAPV8vpvxffoHvcAWVgJeji8ZVNXUZ/
X-Received: by 10.200.55.83 with SMTP id p19mr15232115qtb.21.1505138114711;
        Mon, 11 Sep 2017 06:55:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505138114; cv=none;
        d=google.com; s=arc-20160816;
        b=lCzYc1OLC44ExTHOG+B/Edwww2IvwnsXMLmA0ybZRJHFQfDD/OAZtdP8wZ3u4mp1TS
         8M0I5yFLReb35DY1VnkP/nNvv7L5JWHqkB3r/Kotu0+bqwu5A6eR2OY/srxvxVIzLW2T
         I2MavrY6PVurX8tipqWgGeyWvWP7Ko0WmKWwLL9f/5zQ3HaxAOyG/BXfDG9/U7oxnq+V
         dBeyld4n5aOfs/J9U6CwrN7it/8RUicWGGu3Xbb6KgbdWBt17GynEWKjZoN5kC4y2oUZ
         7rBABB5mDjachp3gMRykFhWrsKJ98pNMZFZi4d43z9FZOVJK+kh9fvZnDaXbO2sSHN5N
         9Ccw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Cw1uYhjDSVmI8ptdsucthUFSvhXnPYZcwKfVp+ghky0=;
        b=YQ3T+eJTtAnODLPp6Xz4tq5iyG8Ryghep292uJiDIzSNoqwdXIBt6bxApRTnxF/9hj
         HHWezSg8Yc9u7tPixTQNLGCbJ8kjYn5zSeCYYnCrx0xVejNh/1XLKWO7vvEOdpe5vhtg
         f0R5FdMKIQqD3Q6uX+e09Wc5FEp1+Pd4FxxM0Zb9aELWO/cqHVeZSuGiXPoo6lAkP8f4
         kYTFtmusrInVPB8Huy+I3avU3gmJIdMHD8uoEFdcpCVELmalE9jAAJ/P0/Nc3i+J0ma+
         Mc7jTrDzxCFA0Z9bxJhl4jxkCLeaTAMKgXfRTuGwVQoMvBDPprQyYEVeFN6uMUzZiOFn
         Bnhw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r65si9885691qkr.413.2017.09.11.06.55.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 06:55:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57919 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drPBA-0004in-E6
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 09:55:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41743)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drP89-0001jm-1r
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 09:52:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drP85-0002Cn-2W
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 09:52:05 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37238)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1drP84-00023m-RC; Mon, 11 Sep 2017 09:52:01 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1drP7p-0007lo-Gn; Mon, 11 Sep 2017 14:51:45 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 11 Sep 2017 14:52:04 +0100
Message-Id: <1505137930-13255-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
References: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/7] target/arm: Use M_REG_NUM_BANKS rather than
 hardcoding 2
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gg98C8EuMHe8

Use a symbolic constant M_REG_NUM_BANKS for the array size for
registers which are banked by M profile security state, rather
than hardcoding lots of 2s.

Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Philippe suggested this in review on the last round of
patches but I forgot about it :-(
---
 target/arm/cpu.h | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 98b9b26..5a1f957 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -81,8 +81,11 @@
  * accessed via env->registerfield[env->v7m.secure] (whether the security
  * extension is implemented or not).
  */
-#define M_REG_NS 0
-#define M_REG_S 1
+enum {
+    M_REG_NS = 0,
+    M_REG_S = 1,
+    M_REG_NUM_BANKS = 2,
+};
 
 /* ARM-specific interrupt pending bits.  */
 #define CPU_INTERRUPT_FIQ   CPU_INTERRUPT_TGT_EXT_1
@@ -433,19 +436,19 @@ typedef struct CPUARMState {
         uint32_t other_sp;
         uint32_t other_ss_msp;
         uint32_t other_ss_psp;
-        uint32_t vecbase[2];
-        uint32_t basepri[2];
-        uint32_t control[2];
-        uint32_t ccr[2]; /* Configuration and Control */
-        uint32_t cfsr[2]; /* Configurable Fault Status */
+        uint32_t vecbase[M_REG_NUM_BANKS];
+        uint32_t basepri[M_REG_NUM_BANKS];
+        uint32_t control[M_REG_NUM_BANKS];
+        uint32_t ccr[M_REG_NUM_BANKS]; /* Configuration and Control */
+        uint32_t cfsr[M_REG_NUM_BANKS]; /* Configurable Fault Status */
         uint32_t hfsr; /* HardFault Status */
         uint32_t dfsr; /* Debug Fault Status Register */
-        uint32_t mmfar[2]; /* MemManage Fault Address */
+        uint32_t mmfar[M_REG_NUM_BANKS]; /* MemManage Fault Address */
         uint32_t bfar; /* BusFault Address */
-        unsigned mpu_ctrl[2]; /* MPU_CTRL */
+        unsigned mpu_ctrl[M_REG_NUM_BANKS]; /* MPU_CTRL */
         int exception;
-        uint32_t primask[2];
-        uint32_t faultmask[2];
+        uint32_t primask[M_REG_NUM_BANKS];
+        uint32_t faultmask[M_REG_NUM_BANKS];
         uint32_t secure; /* Is CPU in Secure state? (not guest visible) */
     } v7m;
 
@@ -546,7 +549,7 @@ typedef struct CPUARMState {
         uint32_t *drbar;
         uint32_t *drsr;
         uint32_t *dracr;
-        uint32_t rnr[2];
+        uint32_t rnr[M_REG_NUM_BANKS];
     } pmsav7;
 
     /* PMSAv8 MPU */
@@ -556,10 +559,10 @@ typedef struct CPUARMState {
          *  pmsav7.rnr (region number register)
          *  pmsav7_dregion (number of configured regions)
          */
-        uint32_t *rbar[2];
-        uint32_t *rlar[2];
-        uint32_t mair0[2];
-        uint32_t mair1[2];
+        uint32_t *rbar[M_REG_NUM_BANKS];
+        uint32_t *rlar[M_REG_NUM_BANKS];
+        uint32_t mair0[M_REG_NUM_BANKS];
+        uint32_t mair1[M_REG_NUM_BANKS];
     } pmsav8;
 
     void *nvic;
-- 
2.7.4

