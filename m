Received: by 2002:a4f:9ad8:0:0:0:0:0 with SMTP id b85-v6csp1422870ivh;
        Tue, 3 Jul 2018 10:13:50 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeb8iOUfALAqZXQOoFZ71ph1hkqBn5i9wTeI7OSPW4dM/lO7ug++QdPGPAREeDUX3FVaWDj
X-Received: by 2002:ac8:17b3:: with SMTP id o48-v6mr26862510qtj.397.1530638029973;
        Tue, 03 Jul 2018 10:13:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530638029; cv=none;
        d=google.com; s=arc-20160816;
        b=V2qc4lvpmV02miEmVMg9Lk2s3xpPeG9sdN/bdb2lbEzdPbHfyrtKOK8MAOnbB9xRNg
         7k7KzrV5a2QEkSYlEATBwRAgFswtYekKwx+MXFZ9waoQkMn/ZImcksePVUOded9teeMk
         voxoJz7icaw9/o9n+MuzL6ouEcLP7UbcyO9aesECOCEELY2oPMLtoa7qTQuFn6PA/AqX
         wvEs5HSXA63Izb7lvejo7Z6ggsNYi0tgNza6jfzCtp3PVrQfEiqvt7vHlTh/40m6pjxt
         yr1cR/TsIIlCklZg4tIRp0ZOZjEIrF1Wiy26iKAv8CL27cEx3sKEfjJzCJmH6FiIF0UK
         skFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=gRwsYYQqBYMyXJ2DvW9LNnMeI6UI9Gw/1P2zJohcDoE=;
        b=SEvaZfmw8uzHo44Jv9cgRrt0ygfrG2Jf2BWJ8sjBLf2UbdtkBS0fdvu4RUAYHlq0qh
         sOl2+zYtGRg+RXk9MWP9irDIBT+N6THcCEJKwswG+H/xzfo9t6o+J+0x3JNn+mqChfoj
         HmZZmg/ypVgqdtEbQ6WiPSq9zsznApwRQd088Yk9rgsJovaM2FMhLHJbeuuGXWBmLDlV
         eFL5LPtWcZzlf5ltwKUbSaJ+SbxprrThDgQCN9YOUshSGGP3bEyYckZYzZrnY9fDdIt2
         jUJYvW84/N8E8JGPNtGBjyuNTnsGuHZxWdR/FPp4v8R6wUCUemaqAMNzch6n5dJaB7bE
         /3xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d75-v6si1416644qkb.390.2018.07.03.10.13.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 10:13:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41861 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faOs9-0005XJ-IT
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 13:13:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1faOpO-0003UP-I7
	for qemu-devel@nongnu.org; Tue, 03 Jul 2018 13:10:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1faOpN-0005Ff-KR
	for qemu-devel@nongnu.org; Tue, 03 Jul 2018 13:10:58 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43234)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1faOpL-00058l-8U; Tue, 03 Jul 2018 13:10:55 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1faOpE-00034V-O8; Tue, 03 Jul 2018 18:10:48 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  3 Jul 2018 18:10:44 +0100
Message-Id: <20180703171044.9503-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180703171044.9503-1-peter.maydell@linaro.org>
References: <20180703171044.9503-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH for-3.0 4/4] hw/timer/cmsdk-apb-timer: run or
 stop timer on writes to RELOAD and VALUE
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
Cc: Guenter Roeck <linux@roeck-us.net>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pD7x0OpgQB/v

If the CMSDK APB timer is set up with a zero RELOAD value
then it will count down to zero, fire once and then stay
at zero. From the point of view of the ptimer system, the
timer is disabled; but the enable bit in the CTRL register
is still set and if the guest subsequently writes to the
RELOAD or VALUE registers this should cause the timer to
start counting down again.

Add code to the write paths for RELOAD and VALUE so that
we correctly restart the timer in this situation.

Conversely, if the new RELOAD and VALUE are both zero,
we should stop the ptimer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/cmsdk-apb-timer.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
index 3ebdc7be408..801d1dba741 100644
--- a/hw/timer/cmsdk-apb-timer.c
+++ b/hw/timer/cmsdk-apb-timer.c
@@ -126,10 +126,26 @@ static void cmsdk_apb_timer_write(void *opaque, hwaddr offset, uint64_t value,
         break;
     case A_RELOAD:
         /* Writing to reload also sets the current timer value */
+        if (!value) {
+            ptimer_stop(s->timer);
+        }
         ptimer_set_limit(s->timer, value, 1);
+        if (value && (s->ctrl & R_CTRL_EN_MASK)) {
+            /*
+             * Make sure timer is running (it might have stopped if this
+             * was an expired one-shot timer)
+             */
+            ptimer_run(s->timer, 0);
+        }
         break;
     case A_VALUE:
+        if (!value && !ptimer_get_limit(s->timer)) {
+            ptimer_stop(s->timer);
+        }
         ptimer_set_count(s->timer, value);
+        if (value && (s->ctrl & R_CTRL_EN_MASK)) {
+            ptimer_run(s->timer, ptimer_get_limit(s->timer) == 0);
+        }
         break;
     case A_INTSTATUS:
         /* Just one bit, which is W1C. */
-- 
2.17.1

