Received: by 10.28.71.27 with SMTP id u27csp2341869wma;
        Mon, 5 Feb 2018 02:57:53 -0800 (PST)
X-Google-Smtp-Source: AH8x225k75qgmxmU58N0Z7Bcu0mcqx8d7GK1WX2XFPb+Ygsp+tfEY3lzjmbtfiHRBqkRid75L5EJ
X-Received: by 10.37.185.81 with SMTP id s17mr4919747ybm.348.1517828273328;
        Mon, 05 Feb 2018 02:57:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517828273; cv=none;
        d=google.com; s=arc-20160816;
        b=h9jlgnPSrOLSJk6amHVloOKW6OZbtVHbXVGiJegaADggQBCq8lz6kndq94EgN0xAB2
         UuawF/TdfrdlOV3jxoHKb7qFSvo3PVhJagL7BMp4/Z51dIjvJRSFT70XmzGiiQI08KFJ
         Q/aC1DMgVk5Y2BvKTjrXDIzQi3gkuCNydVPXpdDBqJti41VdIo7GdY//gITwZEvsN9lY
         vxgPg3jp9jx1nAKmSQmyjmxcJJ2LwHwKksadVWG3nODhFMEcEAMLql0frnP1oC8BJ8op
         F3CC1oFRA31JegId2s/gc+AyyYdRhgPQh+sxHZSq/JeX+yCqWhMVybFaBlFCjFvWMeJL
         t71g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=C+2Jaq+Y6N+TeELk5AtE0dRlo2rH0ky/Drd3E6ipTaU=;
        b=vFTr67iTAUu+FaXFGb5lXhFTIeSSPMCqkHxu7j6exNF7+QW/pUoFwuMfywO1z8dbAM
         9EtD8K0MlW5g0MzLvBhhJmktTcfsjXrC5tUP9JSWWP4t0NWfUqCfqcLZJr1tK74d/b3+
         ymY32+Jh/q5iF1pwbPR1M1sYMb9eisYrU0S48QK8a6gRzhjkSbqF6OECWBrVrGiiM5ia
         uMzyDyyF+BI4dKSY3yc+IE1DA0DodMIu3dIRYkCG+ctRt1zAw/sLMU+aOmqXKVeLhIQE
         W5K50bWlpQ4kwhVojNPY3iX+g6Dh+LwUfG72uDlKJa5tB0w8i0XU48eEL9NjCGWdQMLK
         tekA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 206si1376713ywm.366.2018.02.05.02.57.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Feb 2018 02:57:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54868 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eieTA-00064o-LF
	for alex.bennee@linaro.org; Mon, 05 Feb 2018 05:57:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39931)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eieSr-00061v-Hm
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 05:57:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eieSq-0007BG-QG
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 05:57:33 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46192)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eieSq-00076t-Jn; Mon, 05 Feb 2018 05:57:32 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eieSl-0004Ft-DT; Mon, 05 Feb 2018 10:57:27 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  5 Feb 2018 10:57:19 +0000
Message-Id: <20180205105720.14620-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180205105720.14620-1-peter.maydell@linaro.org>
References: <20180205105720.14620-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 7/8] target/arm: Implement writing to CONTROL_NS
 for v8M
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
X-TUID: qc+FlBeYjcyW

In commit 50f11062d4c896 we added support for MSR/MRS access
to the NS banked special registers, but we forgot to implement
the support for writing to CONTROL_NS. Correct the omission.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3332565101..abb4d94a7f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10388,6 +10388,16 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
             }
             env->v7m.faultmask[M_REG_NS] = val & 1;
             return;
+        case 0x94: /* CONTROL_NS */
+            if (!env->v7m.secure) {
+                return;
+            }
+            write_v7m_control_spsel_for_secstate(env,
+                                                 val & R_V7M_CONTROL_SPSEL_MASK,
+                                                 M_REG_NS);
+            env->v7m.control[M_REG_NS] &= ~R_V7M_CONTROL_NPRIV_MASK;
+            env->v7m.control[M_REG_NS] |= val & R_V7M_CONTROL_NPRIV_MASK;
+            return;
         case 0x98: /* SP_NS */
         {
             /* This gives the non-secure SP selected based on whether we're
-- 
2.16.1

