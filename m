Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4646132wrq;
        Mon, 18 Jun 2018 20:32:20 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKI8I7BQLVE+5HT/UR475fZXFMKnYR6UEFRWybH30U7L2rAsz4VgTxSeNexmWShcEPsRwl8F
X-Received: by 2002:a0c:e087:: with SMTP id l7-v6mr13001194qvk.217.1529379140652;
        Mon, 18 Jun 2018 20:32:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529379140; cv=none;
        d=google.com; s=arc-20160816;
        b=H8xlPO7WU6ZH28bGQ1bvMtTrh+ApGmZUfjQHBzzZs6W0ymqXp0/mwg82Eek+g7TA56
         lScAljpQvYIIChi19RRFRI7v56rA7G9GUrWYpgRWh/iT6HJkG73Fy/BYWHPe+ps55kUf
         jVEqna+Fp/lXa0qlUekh6giwq/SfejeZUI76a1z3+wLbMNuTYzZwKYgMNDVaU8WGfvci
         e3zYigWFUXEGKEUTMLTcy3djyNIwQ56rXSZ9ujuAZAEM6xBO6J0fvuYYttWZbVBBS4uS
         K2JjmknVpuaXe001c2Muc9FZwkS9G5Omz8x9eVjcZHK3kpYD7RJ1aBXk5fjzn1GHJfti
         W4aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=B9/TkDcAn1ar/2kEf4nPyT5lHETGEiUMI6+YhPfQxmk=;
        b=tr3iqGv0e1BbOJ2iQXlW1Nb1Qd4pc/eTeWj2RsiuqNzgYN9TfDWbPCAgRnv9mdmznP
         viMpeXLfTjjvfiyVRf+FLQb4SbB8tj79MQ9j2IOCuvnCGpvi2CFo5+R6NnxZL7M/lYn0
         bqHJs2nAZz3N0bkV8aw0STfrdDHtQ3TyQyrOJjeL7nGS9eS3a4CFgPwv8JqlpW54DXa5
         Dmb62CIvR7ChZ4rDHrJBp2LhNH6YmczwTiDicMtuTXM2kFbb9Z31jpj8lj5kCeH0HqQa
         RM3uEszmPWuNEeV3ICV/KU7wAmZyoKGxGEd1oWpinGfX1CVULwHcs6VFdvUrAkRTGvHL
         YGgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b=XhPNQMlE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r135-v6si3068013qke.357.2018.06.18.20.32.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Jun 2018 20:32:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b=XhPNQMlE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39094 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fV7NU-0002AC-63
	for alex.bennee@linaro.org; Mon, 18 Jun 2018 23:32:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1fV64e-0002L1-W6
	for qemu-devel@nongnu.org; Mon, 18 Jun 2018 22:08:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1fV64e-0001XA-Am
	for qemu-devel@nongnu.org; Mon, 18 Jun 2018 22:08:48 -0400
Received: from bh-25.webhostbox.net ([208.91.199.152]:60420)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <linux@roeck-us.net>)
	id 1fV64Z-0001WD-Il; Mon, 18 Jun 2018 22:08:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Message-Id:Date:Subject:Cc:To:From:Sender:
	Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=B9/TkDcAn1ar/2kEf4nPyT5lHETGEiUMI6+YhPfQxmk=;
	b=XhPNQMlE5MQVBK+QNfvcebJjn7
	m+dvuBb9JbZAnH+Z0fOGbNfsa8Vw7X78ccM0/wDu+Ql6jKxRg+q1cAPv+0c77oplkAXSiFJyq5C71
	roAQBc1DDkhYucg2c5pvcVK/JV8PxEic39dHGmAmUIoBXs/SiFBQj6ol7ZdH7bX9Y6JQNNfMN2Bcu
	AtPo41i8CTuhe/13kQaZRgVTZ3TtZlH0bP+NArTz096FpLXBdvk9xgSq1lVv8qXWYr+CauuKB9Oz7
	EHJpjeVOvQDbFXWQ0GlUzWO2fmTkqVn5D5tt+l2FSAFC2lUY1X9gO9cRw3Er/gypAjZ1OdQH2xkLO
	fQW3wPRg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
	([108.223.40.66]:40002 helo=localhost)
	by bh-25.webhostbox.net with esmtpa (Exim 4.89)
	(envelope-from <linux@roeck-us.net>)
	id 1fV64Y-00BvGz-4k; Tue, 19 Jun 2018 02:08:42 +0000
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jun 2018 19:08:39 -0700
Message-Id: <1529374119-27015-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
X-Authenticated_sender: guenter@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - nongnu.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
	guenter@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: guenter@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 208.91.199.152
Subject: [Qemu-devel] [PATCH] hw/char/cmsdk-apb-timer: Correctly identify
 and set one-shot mode
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /vPywz+RhXVX

The CMSDK APB timer is currently always configured as periodic timer.
This results in the following messages when trying to boot Linux.

Timer with delta zero, disabling

If the timer limit set with the RELOAD command is 0, the timer
needs to be enabled as one-shot timer.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/timer/cmsdk-apb-timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
index 9878746..79c1b49 100644
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
2.7.4

