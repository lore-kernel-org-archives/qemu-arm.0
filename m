Received: by 10.25.21.96 with SMTP id l93csp274867lfi;
        Fri, 17 Jun 2016 06:51:53 -0700 (PDT)
X-Received: by 10.55.169.147 with SMTP id s141mr2241581qke.107.1466171512782;
        Fri, 17 Jun 2016 06:51:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o77si7947426qka.265.2016.06.17.06.51.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 06:51:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57684 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDuBc-0003qB-5f
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 09:51:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bDtfE-0003Zb-US
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 09:18:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bDtf4-00035Z-QW
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 09:18:23 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:36773)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bDtel-0002pz-BH; Fri, 17 Jun 2016 09:17:55 -0400
Received: by mail-lf0-x244.google.com with SMTP id a2so8322194lfe.3;
	Fri, 17 Jun 2016 06:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=q6+fh2TRcfaG7Ai2kTlT0N4WEeLJzic8KL3fN4FpFuI=;
	b=maINaua7IquOu4fDPWXrNMVneabE+JpLZbMgPaQCLWi27knT9QwRkgu3rbagafGyl+
	WRlIIAX+x7MnZPzkmRPBeP/Ny5ydum6QshiYdUuAj0RQ9EF1/WAZmzmGMpgNL1EvREtL
	LnH7gMVtwAzxWKzmGkZLdvkRTB7tMPeAsKmcaRZlK/BjLPTVVrEWpE08vpo68m7rtD4l
	uYgXF6pGbVXr/1kXa7zu9XaqdE/owmgK2F19isLXYydPvOBxOcWINUNNykAVXle/koey
	RPdxUj0dRizC5xYGVP/ie5ipf7FkZAM6BzENv4LKSUYrwLCsPRioumDwjXePvo3YX1xy
	vK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=q6+fh2TRcfaG7Ai2kTlT0N4WEeLJzic8KL3fN4FpFuI=;
	b=Ff7ILAR1UDD1td6JITpfRCX1mU04x5mQjT7D9mPJMyCDbaQ7JBxANo7g/MjERC8pYG
	ORSJVkz2lLO6nBpd271wS2f57u/kROvypOJGuOJmh5DwqE979ukl3SVGTtHZhOfA0AVd
	RnGxqPbNQNlDyprL6pKeZ1ZczvW3H1FKr0rjTJ75V4zwRxR48SRkuJmitEdEhudXZ6Rj
	EufCa+p5u6CTxtndpP6dCSSyXk7cp9TTLtun34lENGc0yUIPKP8mHSQACvN/WsbqZUjD
	WZMm/xF2Vz8PBMIlmLQ2sppFFDpngLPRZRh/gkhAHC8shfiFutA5KsHHnDlVvgNuO5E1
	NRaA==
X-Gm-Message-State: ALyK8tIezgP+Y7Wl5PEsvlCHvpiaLdo76K6QiInJZmyEtasCfmfbfKLVX8NloHcNxXN0FA==
X-Received: by 10.25.196.216 with SMTP id u207mr592420lff.164.1466169474474;
	Fri, 17 Jun 2016 06:17:54 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30])
	by smtp.gmail.com with ESMTPSA id d8sm2538183lbc.29.2016.06.17.06.17.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Jun 2016 06:17:53 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Fri, 17 Jun 2016 16:17:27 +0300
Message-Id: <bf8a11d66b68c0d0738428bf6dd18d1a532b3eb3.1466167530.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1466167530.git.digetx@gmail.com>
References: <cover.1466167530.git.digetx@gmail.com>
In-Reply-To: <cover.1466167530.git.digetx@gmail.com>
References: <cover.1466167530.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Subject: [Qemu-arm] [PATCH v14 2/3] hw/ptimer: Fix counter - 1 returned by
 ptimer_get_count for the active timer
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QZEIp4qadpJT

Due to rounding down performed by ptimer_get_count, it returns counter - 1 for
the active timer. That's incorrect because counter should decrement only after
period been expired, not before. I.e. if running timer has been loaded with
value X, then timer counter should stay with X until period expired and
decrement after. Fix this by adding 1 to the counter value for the active and
unexpired timer.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 289e23e..7f89001 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -89,10 +89,10 @@ static void ptimer_tick(void *opaque)
 
 uint64_t ptimer_get_count(ptimer_state *s)
 {
+    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     uint64_t counter;
 
-    if (s->enabled && s->delta != 0) {
-        int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    if (s->enabled && s->delta != 0 && now != s->last_event) {
         int64_t next = s->next_event;
         bool expired = (now - next >= 0);
         bool oneshot = (s->enabled == 2);
@@ -144,7 +144,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
                 if ((uint32_t)(period_frac << shift))
                     div += 1;
             }
-            counter = rem / div;
+            counter = rem / div + (expired ? 0 : 1);
 
             if (expired && counter != 0) {
                 /* Wrap around periodic counter.  */
-- 
2.9.0

