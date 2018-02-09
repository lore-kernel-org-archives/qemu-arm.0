Received: by 10.28.71.27 with SMTP id u27csp1158984wma;
        Fri, 9 Feb 2018 08:58:57 -0800 (PST)
X-Google-Smtp-Source: AH8x224jNuxuxtd36vTFl0lBZ6jlfG6MKGhWxYgVwRNWbzMbXp0RIks+ZBPVBcphSwElIWi8lVv/
X-Received: by 10.37.189.9 with SMTP id f9mr1498958ybk.53.1518195537556;
        Fri, 09 Feb 2018 08:58:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518195537; cv=none;
        d=google.com; s=arc-20160816;
        b=PYBx6VpbiDJG2I2md53W813Vhb9JXXmANJ2MBsjv++4kBV+4hn/Px6QDWmVbyjl+mZ
         BhDtUyx289RyGolzmDhHw7FgnHd82/iKS6Qv5kh1XdV4ek97Apda8xQia2i3+Bbp0Z22
         goUHk7IKCBKldAit0fyMCVmvAw52SQXplNCEwLia5+Y1lyLXjm59Mhq2PrS6GezSZm0W
         m67X47Q3emQmWiIqBfMn792FfaynSP0jMIlgL8t3Z+hmOI0EBGlozupS+auo36k4Y5RK
         6yNYQKLWV3xtwQtBYbkZbUqcoRAPUc3K0M2tZmWmUSQXv5rdaHFVII1b4nyJb2vD70Uo
         fc6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=ryLvpalX9lQiwK3dkujoCkEwiM9hw3XksDW0xnO8TUk=;
        b=t6ATsiajpq05QkPJwfy1Xkte8UqbxlmIC0uGoRjQXU5o8waC2PJr808PlaM1L/8VvP
         q9wCfq3GnVSFFBRm1KWrFMnvOfG/FplbMuMLZZpDZHiH9lcmxTFH4ZEa1IzWhsXQFlKw
         FCvdbbIiriaZm4ftwxEoQMW39ZxkVqDMvWBU7jjbLnTndbh38yt45zRkiz5kBgSV97rN
         HGlRcE+3f2JIvJpOBLMpUhCIPi2MT3PtSMFffEMTfbG9vC+6N5Ub64iMHUDk2L5rFfJ9
         Dl1QwrDsdtBIS8k7cvVqxzn+b61GkptofQaydYc24sVFArmHN8em1z/s2sJNkpi1V6sJ
         aLCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g133si465475ywg.166.2018.02.09.08.58.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 08:58:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45083 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekC0n-0004Ib-1L
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 11:58:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40842)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ekC08-0003tC-T8
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:58:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ekC08-0007hl-3T
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:58:16 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46272)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ekC07-0007fy-Sv; Fri, 09 Feb 2018 11:58:16 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ekC06-0002zo-4w; Fri, 09 Feb 2018 16:58:14 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  9 Feb 2018 16:58:02 +0000
Message-Id: <20180209165810.6668-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180209165810.6668-1-peter.maydell@linaro.org>
References: <20180209165810.6668-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 03/11] hw/intc/armv7m_nvic: Implement M
 profile cache maintenance ops
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
X-TUID: HFinUSDK41s5

For M profile cores, cache maintenance operations are done by
writing to special registers in the system register space.
For QEMU, cache operations are always NOPs, since we don't
implement the cache. Implementing these explicitly avoids
a spurious LOG_GUEST_ERROR when the guest uses them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 06b9598fbe..74b25ce92c 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1594,6 +1594,18 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
         }
         break;
     }
+    case 0xf50: /* ICIALLU */
+    case 0xf58: /* ICIMVAU */
+    case 0xf5c: /* DCIMVAC */
+    case 0xf60: /* DCISW */
+    case 0xf64: /* DCCMVAU */
+    case 0xf68: /* DCCMVAC */
+    case 0xf6c: /* DCCSW */
+    case 0xf70: /* DCCIMVAC */
+    case 0xf74: /* DCCISW */
+    case 0xf78: /* BPIALL */
+        /* Cache and branch predictor maintenance: for QEMU these always NOP */
+        break;
     default:
     bad_offset:
         qemu_log_mask(LOG_GUEST_ERROR,
-- 
2.16.1

