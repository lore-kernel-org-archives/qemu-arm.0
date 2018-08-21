Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2131719wrd;
        Tue, 21 Aug 2018 09:52:46 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdblMIXhPQ20jp4j3WG2C7YO/7SniIcxUHMDPYE6P4zwODd1tOWOwaIcm8E6+JmixbBfRO0f
X-Received: by 2002:a0c:8962:: with SMTP id 31-v6mr14904096qvq.190.1534870366818;
        Tue, 21 Aug 2018 09:52:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534870366; cv=none;
        d=google.com; s=arc-20160816;
        b=Sai9VRq1nAeEIaD4LHoNbrQstHQg7k7MWENiY+MnDAgcyBnVdhLxdgjxHCgaeOIe14
         LSKh8JFk02u4jxzKP6x7+EIo7VTXYGpefBOwvGVVB3J83AxOTfR2hBeHqh6p6a6nTnRL
         7Gi31H7XlwZud1g/F571A+XoGJSRUW/8LRjRUST7wHOB3lrq5nhhOepIfIk+T7hmMgoD
         uqr9tx4TsJhNc8ZsU3OhrLfTxPXugRO6oaQyhC3RpUOsC3+gpjCx0WxK8lngVi9zuoqz
         TcE+9nE9TVZob85QKP5jMxfZOaPizpt26NlwTh5o2Cie1dFKF5xXOAR4RcVnGdkKut2h
         tmVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=xD3Jm2cFnBDkRtZZZ0pufsgstuhxJE/c4D4fuHBIBgA=;
        b=kMUP3ZGpahbturGh7GJSG9OiczbCy9Q6/K3jdJEgtqqQz7PkW+dc8E9vJzbdtUuqQp
         dMWtEjPU93WAlRYFaCAq5yyYBI0kU3vorMveBJ2UWL6pEnR2dveZNq/5d3+vQmsd762p
         TGWWOgagvyLct9XYAH8vkA7vHq52PEi70p/YM8QugUcifayZQvOJBiNRmZTsP/MqUji0
         lpN7YbFYMQr4Y26Z3NgZu108hXIxgsvOES63jYNxJXn2zmWQcLkA+bhJWmnINp3vXeay
         fhO39v8jM2e7DE/7UKLpFcVubeOKdOGIH0oybOgqPSBPu1fgy7rmKsZdVvI2j48QJB27
         Oq9g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d11-v6si2873070qtr.393.2018.08.21.09.52.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Aug 2018 09:52:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54854 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fs9te-0008Mu-AD
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 12:52:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fs9tQ-0008Kd-Ue
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 12:52:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fs9tP-00053h-W1
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 12:52:32 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44798)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fs9tN-0004di-OI; Tue, 21 Aug 2018 12:52:30 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fs9tF-0004KW-81; Tue, 21 Aug 2018 17:52:21 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 21 Aug 2018 17:52:15 +0100
Message-Id: <20180821165215.29069-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180821165215.29069-1-peter.maydell@linaro.org>
References: <20180821165215.29069-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 3/3] target/arm: Remove a handful of stray tabs
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
X-TUID: K772icdqpHxq

Following the bulk conversion of the iwMMXt code, there are
just a handful of hard coded tabs in target/arm; fix them.
This is a whitespace-only patch.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h      | 16 ++++++++--------
 target/arm/arm-semi.c |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 62c36b41507..65c0fa0a659 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1320,14 +1320,14 @@ enum arm_cpu_mode {
 #define ARM_VFP_FPINST2 10
 
 /* iwMMXt coprocessor control registers.  */
-#define ARM_IWMMXT_wCID		0
-#define ARM_IWMMXT_wCon		1
-#define ARM_IWMMXT_wCSSF	2
-#define ARM_IWMMXT_wCASF	3
-#define ARM_IWMMXT_wCGR0	8
-#define ARM_IWMMXT_wCGR1	9
-#define ARM_IWMMXT_wCGR2	10
-#define ARM_IWMMXT_wCGR3	11
+#define ARM_IWMMXT_wCID  0
+#define ARM_IWMMXT_wCon  1
+#define ARM_IWMMXT_wCSSF 2
+#define ARM_IWMMXT_wCASF 3
+#define ARM_IWMMXT_wCGR0 8
+#define ARM_IWMMXT_wCGR1 9
+#define ARM_IWMMXT_wCGR2 10
+#define ARM_IWMMXT_wCGR3 11
 
 /* V7M CCR bits */
 FIELD(V7M_CCR, NONBASETHRDENA, 0, 1)
diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 7cac8734c70..b2b22d231e3 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -136,7 +136,7 @@ static void arm_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
 #ifdef CONFIG_USER_ONLY
         ts->swi_errno = err;
 #else
-	syscall_err = err;
+        syscall_err = err;
 #endif
         reg0 = ret;
     } else {
-- 
2.18.0

