Received: by 10.25.87.130 with SMTP id l124csp308630lfb;
        Wed, 7 Sep 2016 06:24:34 -0700 (PDT)
X-Received: by 10.200.34.219 with SMTP id g27mr9436187qta.42.1473254674777;
        Wed, 07 Sep 2016 06:24:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t88si926438qkl.336.2016.09.07.06.24.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Sep 2016 06:24:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40984 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bhcqA-0002Td-3s
	for alex.bennee@linaro.org; Wed, 07 Sep 2016 09:24:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46392)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcp3-0001Zg-I5
	for qemu-arm@nongnu.org; Wed, 07 Sep 2016 09:23:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcp2-0005gp-Nh
	for qemu-arm@nongnu.org; Wed, 07 Sep 2016 09:23:25 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:32840)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bhcow-0005eO-KP; Wed, 07 Sep 2016 09:23:18 -0400
Received: by mail-lf0-x242.google.com with SMTP id l131so830514lfl.0;
	Wed, 07 Sep 2016 06:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=wCWmRwHvjsbJnKaba/0OQZmjYp872mE9u5B3/V5czuI=;
	b=fIG4ycxU/s+C+KtkHsEXofqCPpM6ahOISuxfhgXntCqtX7DsRYh6tf4MZQqYyrmCh8
	C9tmc0Qu6OBqVMGxndUwkM6ptS315SNbxwgR5aVT3FkBDPSOY6k7jW91ZzFXShUG2eB1
	IDPnlF6k8NpyTVVsaGTtWCPMeDk5M8prOORuZCZFei6fDyC7Lk7QrLCsTiWaHzvxP/lB
	roxCAcIWG3mpo8am2IQVKwE1wVFpxhMjN0PKb5+zi5iKqu5Z735CjgjS7IkffyBFQiMf
	bQATnjWcoDaMxRmv9RXkxIUUoJ81wMbvZoreqXozKT3ZwMBs/HkzrJXQ6BITlUZ8w6BA
	da6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=wCWmRwHvjsbJnKaba/0OQZmjYp872mE9u5B3/V5czuI=;
	b=GfiFDfnd/WWmZ5NJhxxrW7I5Ctcy8Dqh0w+hwnRu3HJh+7d58fz2PSRTSrP0xGsYbA
	znhLTYuhtl+5KnDTLGshCVhjSF/Ia8sRkXWCoeVVbE35GltJCtgt2qsk5+hvF88YKQUI
	CotWttxvyxIJQdbVMx0nYTGU1NTumuckDjCufTgJavfF0KMXUeItRaGQ0BRRpLD2gTkG
	olIcfyI8h2Qo5QMzi0cyKPjKdjNlsKoixNGIvkqHvgA3Q5c9xcPpj+tYRQpPBe8JLUDJ
	kM9yfD1NGDilRA/Az3X2CmV3gjJiv90GZGvGDD48Rlxcv2/fbAAmh1ji/hNxhNLTMc2e
	NL+A==
X-Gm-Message-State: AE9vXwMQ0PzFDz+XzxVLmLRVl0ZoyWWcotz4JqPUR5NQYttvUq77cCSJrHb6DJK3ySZNSA==
X-Received: by 10.25.228.217 with SMTP id x86mr11604lfi.137.1473254596746;
	Wed, 07 Sep 2016 06:23:16 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17])
	by smtp.gmail.com with ESMTPSA id h29sm11375lfi.18.2016.09.07.06.23.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Sep 2016 06:23:16 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Wed,  7 Sep 2016 16:22:12 +0300
Message-Id: <1e9bae4fae3c36430d7c28b0f486a0c71aff7eb3.1473252818.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Subject: [Qemu-arm] [PATCH v16 01/16] hw/ptimer: Actually stop the timer in
 case of error
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
X-TUID: +sTaH1EoLYUH

Running with counter / period = 0 is treated as a error case, printing error
message claiming that timer has been disabled. However, timer is only marked
as disabled, keeping to tick till expired and triggering after being claimed
as disabled. Stop the QEMU timer to avoid confusion.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 30829ee..02c3135 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -44,6 +44,7 @@ static void ptimer_reload(ptimer_state *s)
     }
     if (s->delta == 0 || s->period == 0) {
         fprintf(stderr, "Timer with period zero, disabling\n");
+        timer_del(s->timer);
         s->enabled = 0;
         return;
     }
-- 
2.9.3

