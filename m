Received: by 2002:a4f:9ad8:0:0:0:0:0 with SMTP id b85-v6csp1422514ivh;
        Tue, 3 Jul 2018 10:13:29 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpddkyjtuAF51e7okR8RXNHxCBDJZKSSey0HiVCMtn9pq2ymaJo2iuEePq0lJgIlH4Gy6FAt
X-Received: by 2002:a37:34cb:: with SMTP id b194-v6mr26753896qka.258.1530638009865;
        Tue, 03 Jul 2018 10:13:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530638009; cv=none;
        d=google.com; s=arc-20160816;
        b=wGLlu0d/ah0RYvqBmAehIQ+xjJW451fsmqke4tTrGIpN8O2Ny40rlGKvUHIKAexnHB
         jGPd9Cg5K56AYoqoX9/WwM1SLicnigMbOceYJNzPEsXZdHhkZH0Kp/PUXHWLilIEAtyG
         g7tEZJUWAuh6RMn5oeU/ouEZ9R+sNPaeCN84F0vXtbOrLSFI+NbYN8sbUL4qrGkSWfCa
         zvMRwTS8GtSw5r6DOH8qo7WIxXIMC0+cZisDZWKGG0fFgmaFwzyB/QY9I26CP4oY74E2
         clgQLNESDIEYj6xkFaMp05/zCsp5Xatd5R/vw2Yx3TiYxEYW3wAXez00aNBu8snquFMU
         zjwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=a8hndHYZuem+T5Dg3rybntLlTe81HzYRZW2CGIalBu0=;
        b=IM/8+QwZLWgjMTwo67qERzcu64ysRx3vJpmiHiZ9Q0poa2VWyUOOc59HMgdJeQj8hy
         eCLNiiwPMSaCnKr+z2HArwocZHdlYul4+n3xR9KpbnprrXJqigOD/ejtknQ0FtAAmkJH
         q8jtUoAHIXGfAApYMrYF4Guse1O0L+stOjNPMyrgWXlidGTGdMUyP4T5sVIS4xpLZop+
         g9Pam08Alks/kDEFfmRE/ahAI+iap8nua3d8YDrJSflXIdfT4xDM0c9tvDP5XMKg+T18
         odpqDXOZ6AMz0Tnwp4uxYabPPdnw9Jf6ahN+EHcP6r1D420u0rC8TY5BM2z6SNWhJwD9
         SPDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o6-v6si1462728qte.149.2018.07.03.10.13.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 10:13:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41860 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faOrp-0005RL-E2
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 13:13:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1faOpO-0003UO-Hn
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 13:10:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1faOpN-0005FQ-DO
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 13:10:58 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43234)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1faOpN-00058l-68; Tue, 03 Jul 2018 13:10:57 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1faOpD-00033Z-80; Tue, 03 Jul 2018 18:10:47 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  3 Jul 2018 18:10:42 +0100
Message-Id: <20180703171044.9503-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180703171044.9503-1-peter.maydell@linaro.org>
References: <20180703171044.9503-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.0 2/4] hw/timer/cmsdk-apb-timer: Correct
 ptimer policy settings
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
X-TUID: DGUErjOAiGhw

The CMSDK timer interrupt triggers when the counter goes from 1 to 0,
so we want to trigger immediately, rather than waiting for a
clock cycle. Drop the incorrect NO_IMMEDIATE_TRIGGER setting.
We also do not want to get an interrupt if the guest sets the
counter directly to zero, so use the new TRIGGER_ONLY_ON_DECREMENT
policy.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/cmsdk-apb-timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
index 9878746609a..1f99081db1a 100644
--- a/hw/timer/cmsdk-apb-timer.c
+++ b/hw/timer/cmsdk-apb-timer.c
@@ -201,7 +201,7 @@ static void cmsdk_apb_timer_realize(DeviceState *dev, Error **errp)
     bh = qemu_bh_new(cmsdk_apb_timer_tick, s);
     s->timer = ptimer_init(bh,
                            PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD |
-                           PTIMER_POLICY_NO_IMMEDIATE_TRIGGER |
+                           PTIMER_POLICY_TRIGGER_ONLY_ON_DECREMENT |
                            PTIMER_POLICY_NO_IMMEDIATE_RELOAD |
                            PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
 
-- 
2.17.1

