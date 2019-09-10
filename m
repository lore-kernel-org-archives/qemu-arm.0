Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5578009wrp;
        Tue, 10 Sep 2019 07:54:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzWxBeMi3a16hn5mfk9I4cEyjErt+aQAvxDpKc1ZCzhM90WJP2Q7PX411E+FHYXUClE5Ff1
X-Received: by 2002:a50:eb88:: with SMTP id y8mr21938284edr.150.1568127257654;
        Tue, 10 Sep 2019 07:54:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568127257; cv=none;
        d=google.com; s=arc-20160816;
        b=KUrtG6IR/xg9LnyB+rLZ8knw2LULrzuhiBALsHuESQWeMrOjBd+QLdGhb7d57VVxg+
         jIVXWRHFgnKzIv4TbfVfrU6VLL0LqRbOO+P+QHdJVR/qSh0WIAKWutmDtAJ1yvb9ZLpO
         vkistZN4oxdqef5Hr2DSTkz6gucIImppNbPhHbsgZdhm2Z3fiksG3HnVPNisuj1zgCR+
         I4sxYITtcP3TitEwf60Q1CR0OPaclrr8Hy3qFw7orUP/prd3cvnp2XoFaUqkOgfexqAz
         YSlG6Z/5SOdtGmSqd+OVRm8el+AGZXdWNJs9IbtMPww9+dKrtk0XJ9pcbr5c+kJ/YAEY
         ftrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=LA9MpYwh3mZJWgj+jicjrA5Nt9K2oC0TJFXiZTBybLY=;
        b=yFwvXkfWAqS+E53vwa8g5BgihhXZ9zWsIfp7+fQL3y49NdMewEmfFh11Z78toh9Ws+
         Z+WI+1+QZK1VbIesVt/N5Vcg9+2V+zFDhaEQR2+X8Um9vPjnUv3u/7s6W7JCwvd6Rpuc
         mUIbOfll+M8UnhUp9ETIBYWF2dM6uYTUIVbD2STtSOUIJT+7u1iS2XVucMkhDFojdvVA
         9sEXcuyzJQ5O9+i5rxfa0k247fAVYrUTcb/sqilkhi/7wOYeIYCTHfZaWv2EnEEtyain
         8wziHH8fUqZ9CPecZyjGOpVZcS46BaOTzNq41pNa9CfuwBZv6wEAGJrvZcw0GN6xgqbf
         uLuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=frJtnUdJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9si9348782ejb.68.2019.09.10.07.54.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2019 07:54:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=frJtnUdJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i7hX6-0006BF-1u
	for alex.bennee@linaro.org; Tue, 10 Sep 2019 10:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54170)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i7hNu-0005cO-NB
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 10:44:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i7hNt-00056U-Id
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 10:44:46 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:38283)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i7hNt-00055p-Cc
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 10:44:45 -0400
Received: by mail-wr1-x441.google.com with SMTP id l11so20811753wrx.5
 for <qemu-devel@nongnu.org>; Tue, 10 Sep 2019 07:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LA9MpYwh3mZJWgj+jicjrA5Nt9K2oC0TJFXiZTBybLY=;
 b=frJtnUdJmrWMbeMlSI4ZaC0DUyjKF0jSF2ar0QTkVt4vqGH414/fh6f4cec6hioWgF
 bVubc+ZbCy4Zo3wNxyPpHzUhpokvzCpCmZqwWqCC5mLxtYx/8FULeoW/FY/nU2iQN8Er
 DuGebK8eZNhACwvJFAoB/FGyYGaeS9Mn3OGNcHR9teG34gNKscxSXh8fHKYz46GrYXVX
 6K2vRrSfWYqDa8BBT3sQlxmaAWLzAX8sS8nSRduDQaD4hoU9zMA8yMV6/Zp1tyewgaZx
 wOUO5rni+XYUAy7LrGmqcDGyquC9yi8NqaQxRq9I3qZPNDbdsqw36Kq1lYIbQmRxFSJD
 UGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LA9MpYwh3mZJWgj+jicjrA5Nt9K2oC0TJFXiZTBybLY=;
 b=CcjyoUPpwu+Ut9fbSnMPaKtHsVQew+r3HUdODN6HbGP5X/znwaOoVYiC+xUMA3twNE
 9HDxKNssh9bLjcJ4Lmom/dD6czrYwmj55eEvEfdbfkirEuUZW21nu9uvMgbkqEVGIeGi
 dVlb0A+iiu6AWFOhpH+O4Co7Gb7KPnw/khN8wXK8G1sJexOmk43GCFJ3Nm54zlyDPjC2
 dxcC+NEf/Cnzk4LlEbZRdjo06PAUc56fJhQyxDi0utIHt6061BLT1Oi+7Yf2rUarQxUz
 NzrqOGwLlWAhPjl0/AZotiGlTumYaS+M8dQ4KBLp23JG16CXc2EO2J780zt3/BtltA9/
 9B5A==
X-Gm-Message-State: APjAAAV91vJa1869WdwqGgNt/qpWfiIN5Ntz5gx8BVx+0ISoVCLkdOkZ
 XsLyCJhwgvy2TsALG1y6pjT1wg==
X-Received: by 2002:adf:e392:: with SMTP id e18mr28592507wrm.87.1568126684565; 
 Tue, 10 Sep 2019 07:44:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a192sm5703814wma.1.2019.09.10.07.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 07:44:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 15:44:27 +0100
Message-Id: <20190910144428.32597-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190910144428.32597-1-peter.maydell@linaro.org>
References: <20190910144428.32597-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-devel] [PATCH 12/13] target/arm/arm-semi: Implement
 SH_EXT_STDOUT_STDERR extension
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DhmyIsU0KweK

SH_EXT_STDOUT_STDERR is a v2.0 semihosting extension: the guest
can open ":tt" with a file mode requesting append access in
order to open stderr, in addition to the existing "open for
read for stdin or write for stdout". Implement this and
report it via the :semihosting-features data.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/arm-semi.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 531084b7799..0df8d4d69d6 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -476,12 +476,16 @@ static uint32_t gdb_flenfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
 #define SHFB_MAGIC_2 0x46
 #define SHFB_MAGIC_3 0x42
 
+/* Feature bits reportable in feature byte 0 */
+#define SH_EXT_EXIT_EXTENDED (1 << 0)
+#define SH_EXT_STDOUT_STDERR (1 << 1)
+
 static const uint8_t featurefile_data[] = {
     SHFB_MAGIC_0,
     SHFB_MAGIC_1,
     SHFB_MAGIC_2,
     SHFB_MAGIC_3,
-    0, /* Feature byte 0 */
+    SH_EXT_STDOUT_STDERR, /* Feature byte 0 */
 };
 
 static void init_featurefile_guestfd(int guestfd)
@@ -674,7 +678,21 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         }
 
         if (strcmp(s, ":tt") == 0) {
-            int result_fileno = arg1 < 4 ? STDIN_FILENO : STDOUT_FILENO;
+            int result_fileno;
+
+            /*
+             * We implement SH_EXT_STDOUT_STDERR, so:
+             *  open for read == stdin
+             *  open for write == stdout
+             *  open for append == stderr
+             */
+            if (arg1 < 4) {
+                result_fileno = STDIN_FILENO;
+            } else if (arg1 < 8) {
+                result_fileno = STDOUT_FILENO;
+            } else {
+                result_fileno = STDERR_FILENO;
+            }
             associate_guestfd(guestfd, result_fileno);
             unlock_user(s, arg0, 0);
             return guestfd;
-- 
2.20.1

