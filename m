Received: by 10.28.71.27 with SMTP id u27csp2342013wma;
        Mon, 5 Feb 2018 02:58:08 -0800 (PST)
X-Google-Smtp-Source: AH8x226E5O776yXQIHmimco7Lvzv8PjzDqMnuDF4fCpERZ+czV+zBEiq4xtkbHO/qp8QAME0rNTZ
X-Received: by 10.37.173.213 with SMTP id d21mr7254079ybe.63.1517828288059;
        Mon, 05 Feb 2018 02:58:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517828288; cv=none;
        d=google.com; s=arc-20160816;
        b=px/Pe/fBQ90dBvNbbCUHrL4Y4aQk0eTVgc4EzH2MHQu4eAH0RxM6RX5DBlFmO3JJmW
         6tf9HqqJauEv30DH6w0yxXoGA+9H6GKvd8a2M/svzbDG7vK1zctkSct0gkPqHt+4G7Nm
         JBh2tOuVm6v6lq8DDc+AkM6mg8P2n/euDtSg/TDqh/zrEZzZVF50gaQLvX3wkHeRGODx
         uxC3GNkrLeizilvOJ8cGKt5zY1u6rtzehoKeEVI1hD31u/dPPi2esNYcjHjIKyxJo0KS
         BRAVcoNbHUQWDRBH6wUxAJVgAWzSpoi5KsahyucEIJtS8BLc2oNkh1ZsV6ajjBNHs9AE
         HlVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=ryLvpalX9lQiwK3dkujoCkEwiM9hw3XksDW0xnO8TUk=;
        b=brL45bjrAsoHiTM5x37EeRSFHdq9AZpTSITEFUF2tKP/+tEjV/PoZcr6cqump2W2rZ
         P1UCM3hS85fOmwodSn4q17Y8yWAWrtz8NvalgHnJrcdZcOwDvCOyBlZGXEGJem5uOnnL
         i9gxSdnEgCzjb9HBBIWyDpPCK6S1vkFno3DVdMFTr9TzJZu+vIblVPwMx3d3ZMhXmMvH
         2jygNBMJp+sUeexe7KeXUQcAFmJJceDM8O2xc3HtdS7EQ9F58JzVzkrzCE2m5mwHF/ID
         MO54NbvOPZSa8Jwb8oMsYwEo49Y8Q3QUXsFu1j9CJKk1o3o+LSf7mL7tSPOttXeTUOBE
         dVlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a126si1375190ywg.1.2018.02.05.02.58.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Feb 2018 02:58:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54881 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eieTP-0006OS-Ds
	for alex.bennee@linaro.org; Mon, 05 Feb 2018 05:58:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eieSv-00064k-CD
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 05:57:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eieSu-0007EV-Pk
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 05:57:37 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46192)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eieSu-00076t-J3; Mon, 05 Feb 2018 05:57:36 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eieSi-0004Ev-9H; Mon, 05 Feb 2018 10:57:24 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  5 Feb 2018 10:57:15 +0000
Message-Id: <20180205105720.14620-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180205105720.14620-1-peter.maydell@linaro.org>
References: <20180205105720.14620-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 3/8] hw/intc/armv7m_nvic: Implement M profile
 cache maintenance ops
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
X-TUID: Ue5IoNgPpmzd

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

