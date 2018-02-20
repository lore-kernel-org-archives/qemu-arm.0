Received: by 10.28.71.27 with SMTP id u27csp1372974wma;
        Tue, 20 Feb 2018 10:04:53 -0800 (PST)
X-Google-Smtp-Source: AH8x227NIne+0Mvmsg4qBBOUA36YVeHiv3BE1MbGmDGfe0mm/3FsAH7geGn1GRcF8A17ywI5p8OC
X-Received: by 10.129.193.5 with SMTP id f5mr455066ywi.110.1519149893096;
        Tue, 20 Feb 2018 10:04:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519149893; cv=none;
        d=google.com; s=arc-20160816;
        b=AUQBryOXoay/U698E3hM/dwGVfVHSdcuxQW2Uh8LezJReFuodvqY2ync7qmVdRGexR
         t8Yu+U25n9+2TkGPjko5zEIBfkJ0G8XsUcpjYQY+TH4w/M+NctvDmmDwYpiGvaV//68G
         p1h2/U5h2TMVw0PGZk5/rfxCl6fK1W1CyXgIQlubUiNIC2B42Zc9iSXxV1AQpIDKx7OA
         62YYnZKo4zC32FrThkntCRwgzlVZ2johsmpgKUK0fQzda3YFS3zVYf4Ke7TCpihTuWRQ
         IqzUEaSuBqsuH+KUY39BORa7qCW0UgQsyrg12U1Bk5pkL6y7+k1LE1GcW3tk6V4RF0HX
         m+3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=O3BrtQx4SO5LOAQKzMgLzcMX/jSOw42djrxN0OBQ6Eo=;
        b=TZvZz+rDsdwA7xRY1ldBgsORYljRcJ7w6JZj+YQQbqkUQEt+T2wDVNqC3su2wlQ/1O
         ymnMztmm26mVtuDuOaz1mf2cvUJH3HYJnrtpIkLvGrk6MTgdzLs+/D+8m9byyLuvgxw8
         pqcpQbop9wQ0heRE1d9VyPNeRHv2wE7py+jzK4sCw1pRsF2OIfZ+nyFPZvWgMu5U/6uk
         6RwiAkG8gLdkpo/8omKQWZFCIgOxWR+9MWwSPXyS2wYmzEd6cQCsrNk3VSbcw2mtcWUe
         FyI80hgmu7RtkK6FOQVSHIMAmI5PyygCrlhh3OxKv06Zg/U8x5RSfjbDldLXe+EwjxjS
         o+lg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w9si1662833ybo.462.2018.02.20.10.04.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Feb 2018 10:04:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56961 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoCHc-0000Wc-Ei
	for alex.bennee@linaro.org; Tue, 20 Feb 2018 13:04:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eoCGU-00089v-Dv
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:03:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eoCGT-0001dW-A6
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:03:42 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46524)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eoCGT-0001WQ-2g; Tue, 20 Feb 2018 13:03:41 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eoCGL-0008SP-HX; Tue, 20 Feb 2018 18:03:33 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 20 Feb 2018 18:03:16 +0000
Message-Id: <20180220180325.29818-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180220180325.29818-1-peter.maydell@linaro.org>
References: <20180220180325.29818-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 10/19] include/hw/or-irq.h: Add missing include
 guard
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
X-TUID: hk6UBpZ/YUSD

The or-irq.h header file is missing the customary guard against
multiple inclusion, which means compilation fails if it gets
included twice. Fix the omission.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/or-irq.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/hw/or-irq.h b/include/hw/or-irq.h
index fd900fcf19..3f6fc1b58a 100644
--- a/include/hw/or-irq.h
+++ b/include/hw/or-irq.h
@@ -22,6 +22,9 @@
  * THE SOFTWARE.
  */
 
+#ifndef HW_OR_IRQ_H
+#define HW_OR_IRQ_H
+
 #include "hw/irq.h"
 #include "hw/sysbus.h"
 #include "qom/object.h"
@@ -41,3 +44,5 @@ struct OrIRQState {
     bool levels[MAX_OR_LINES];
     uint16_t num_lines;
 };
+
+#endif
-- 
2.16.1

