Received: by 2002:a4f:9ad8:0:0:0:0:0 with SMTP id b85-v6csp1420034ivh;
        Tue, 3 Jul 2018 10:11:11 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfUfeiTAN/NIe1zO9zZnwyYOBlMHm+fK/jACoxoarha4LYG0/YTTeKAs++au09HPY+41zY9
X-Received: by 2002:ac8:3304:: with SMTP id t4-v6mr25901589qta.43.1530637871269;
        Tue, 03 Jul 2018 10:11:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530637871; cv=none;
        d=google.com; s=arc-20160816;
        b=S/0Cr4n6QVBkDWX5Yd9AhhWpiCO2bfuLPEASDzUC5hta5Lx7VhOqmZIwqr+gaxbx3M
         +3p4MbsnneIBpKHIjESu6LMTxhJXmrgeF5qd9te5wnGiDPDJ4eCLFrh+xdkuy4uQtYc7
         n6NpdIJyds3JAnqysT64KiOu9FcxQpWMsTESTLYO0uGrPAZQ9WE09U6mGBM7Wxc+yrB+
         PLwg3TrscXzR5ihPF7+xjxAjue7IMKgtQXRvuY4Eq9R/sd4umAXF5arcvsldVAiEvgyD
         wh32W50vN46NyG7r4+XVkUGC3U6qwH7/U6dCDMUGHwdw+dfDSvHlP5l6adhLtVeGI0Y/
         BlRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=KfyfK3IN5eDHwN8e5wMk/I4z29HE/hBx5VAEwsmVAfE=;
        b=ElXuH3G0zr299s3AjpuTgwPy5X8Ubxu1iTqLWfSt1y8cHApwEzfUcyXVkJg+YbWfiF
         MOzwpTa4kshyxcJpVG1w8e6ocx8+0W02iuQ0lQ6tETbG9r+QrNpBGwyhkjchs7WlC0hC
         4U7QoBhRl4DCK0127Oi/+atFtxiV1y2UHdem0fp3oZhqaZk4JgO0pBJn6dFFJqqSZKpq
         J63+mS1ctT+QuVs90I0/Qa+x5a7trMaIlR7URjcfYN13Cigp8NxonWKQaJ8YrL3NnEs1
         xzNfPy7XcSuO5jTcokM4lZQXZnGbpVkpVurcjiFqnUj0XFE1lF44pAp7OplAMEKHst3P
         SOzg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j11-v6si1590153qtf.169.2018.07.03.10.11.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 10:11:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41844 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faOpa-0003Uc-J4
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 13:11:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1faOpN-0003TT-FR
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 13:10:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1faOpM-0005El-Du
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 13:10:57 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43234)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1faOpM-00058l-7S; Tue, 03 Jul 2018 13:10:56 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1faOpE-00034F-0z; Tue, 03 Jul 2018 18:10:48 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  3 Jul 2018 18:10:43 +0100
Message-Id: <20180703171044.9503-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180703171044.9503-1-peter.maydell@linaro.org>
References: <20180703171044.9503-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.0 3/4] hw/timer/cmsdk-apb-timer: Correctly
 identify and set one-shot mode
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
Cc: Guenter Roeck <linux@roeck-us.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nTMHwmXYu7WC

From: Guenter Roeck <linux@roeck-us.net>

The CMSDK APB timer is currently always configured as periodic timer.
This results in the following messages when trying to boot Linux.

Timer with delta zero, disabling

If the timer limit set with the RELOAD command is 0, the timer
needs to be enabled as one-shot timer.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Message-id: 1529374119-27015-1-git-send-email-linux@roeck-us.net
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/cmsdk-apb-timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
index 1f99081db1a..3ebdc7be408 100644
--- a/hw/timer/cmsdk-apb-timer.c
+++ b/hw/timer/cmsdk-apb-timer.c
@@ -119,7 +119,7 @@ static void cmsdk_apb_timer_write(void *opaque, hwaddr offset, uint64_t value,
         }
         s->ctrl = value & 0xf;
         if (s->ctrl & R_CTRL_EN_MASK) {
-            ptimer_run(s->timer, 0);
+            ptimer_run(s->timer, ptimer_get_limit(s->timer) == 0);
         } else {
             ptimer_stop(s->timer);
         }
-- 
2.17.1

