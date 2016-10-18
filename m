Received: by 10.80.166.35 with SMTP id d32csp1022337edc;
        Tue, 18 Oct 2016 07:28:31 -0700 (PDT)
X-Received: by 10.37.39.74 with SMTP id n71mr795035ybn.93.1476800910922;
        Tue, 18 Oct 2016 07:28:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a7si17941967vkh.14.2016.10.18.07.28.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Oct 2016 07:28:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41868 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwVNW-0006lu-8n
	for alex.bennee@linaro.org; Tue, 18 Oct 2016 10:28:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bwVDP-0006Ow-S2
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 10:18:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bwVDL-0006vB-T7
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 10:18:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42560)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1bwVDL-0006ux-NR; Tue, 18 Oct 2016 10:17:59 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E7DE531B303;
	Tue, 18 Oct 2016 14:17:58 +0000 (UTC)
Received: from javelin.localdomain (vpn1-48-97.bne.redhat.com [10.64.48.97])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9IEHpg2009706
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 18 Oct 2016 10:17:55 -0400
From: P J P <ppandit@redhat.com>
To: Qemu Developers <qemu-devel@nongnu.org>
Date: Tue, 18 Oct 2016 19:47:49 +0530
Message-Id: <1476800269-31902-1-git-send-email-ppandit@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 18 Oct 2016 14:17:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] timer: stm32f2xx_timer: add check for prescaler
 value
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Huawei PSIRT <psirt@huawei.com>, Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kt2fnllAzRi4

From: Prasad J Pandit <pjp@fedoraproject.org>

The STM32F2XX Timer emulator uses a 16 bit prescaler value to
limit the timer clock rate. It does that by dividing the timer
frequency. If the prescaler 's->tim_psc' was set to be UINT_MAX,
it'd lead to divide by zero error. Limit prescaler value to 16
bits to avoid it.

Reported-by: Huawei PSIRT <psirt@huawei.com>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/timer/stm32f2xx_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/stm32f2xx_timer.c b/hw/timer/stm32f2xx_timer.c
index bf0fb28..2cad36d 100644
--- a/hw/timer/stm32f2xx_timer.c
+++ b/hw/timer/stm32f2xx_timer.c
@@ -208,7 +208,7 @@ static void stm32f2xx_timer_write(void *opaque, hwaddr offset,
         return;
     case TIM_PSC:
         timer_val = stm32f2xx_ns_to_ticks(s, now) - s->tick_offset;
-        s->tim_psc = value;
+        s->tim_psc = value & 0xFFFF;
         value = timer_val;
         break;
     case TIM_CNT:
-- 
2.7.4

