Received: by 2002:a19:87d7:0:0:0:0:0 with SMTP id j206csp896399lfd;
        Mon, 25 Jan 2021 15:49:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaUpd/Rc+MAnCpmHy7MjvFb6Fe5HMtYVj4oZcRQ6b3flZ5h1SZE1GGNEpFXULTU2jH02AK
X-Received: by 2002:a25:d3c3:: with SMTP id e186mr4199340ybf.349.1611618578076;
        Mon, 25 Jan 2021 15:49:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611618578; cv=none;
        d=google.com; s=arc-20160816;
        b=iXQHrNfFhx4jqYjDSTukr4ss0pJLK/fGl25MAV2V6zMq7rJ0Tu2IswM6NdqhV0OVVt
         y7DFvCh30nSYvp4ITxqtXDRsiukB4DmmPi0Vbp6olBqMt8GNZwJLOUf5YGRZqFlTD7CD
         zzA7mOxLImu497ey7eYHU1L0IR5fFJoiBfIHHNTMIFbCv5Nc69z5kL7xmk0OyNZ64kkd
         JLMmWpfsXe7rRAD0ExUZQR1JIlHvV5wvwdNTP0AOsjo69hP5JopsUCWAhuUT/1iMDqdA
         rcWvJ2ah/7dP08LGdXDIFOhWupa7DIBzdtq6Oy1XB8+n13jFd1VS30w5LJeHcDuzqpiY
         S40A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:to
         :subject:mime-version:message-id:date:dkim-signature;
        bh=I+jzqQbXvQgWEuHn+S1cGshEJkxZZv/tRlV4YBUAhVY=;
        b=joN5TiuLXpdbgYtkSPoK1TnpBqQnpZMRgvA6Fpe8aVE39/85O+U4p4hTltG96UbXcG
         H76TI0xj+YoQyF24NFY03VB5cZrlEbyQW98k7FPjZN4bNIXpHpwTcFsIFSbR/5sSeCKn
         E68Ie0EJVFE2SyRgzAxcLJ/tjqUkA8lmbC638C9AQRZVnL+aIinNAvG7UUZlbFHBpMDr
         bWlep+gaS+B1fu+QCgZHDYqrNCkX08LUKKcx2bbh6i4PmO0CQ/FWONDInfzHpsCpzRul
         N+miUejwUfuJ0iiZT0pEgTu7Hg/orSG4Uj/LT9zN3FJZ7lG58VX9e3PkVRCZ7guzj8fP
         OzAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=mRCTh8N3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14si7324386ybk.29.2021.01.25.15.49.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 15:49:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=mRCTh8N3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:52714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l4Bc1-0006UT-E8
	for alex.bennee@linaro.org; Mon, 25 Jan 2021 18:49:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <35lgPYAgKCNsTRE7LQPEDLLDIB.9LJNBJR-7OJKLKDKR.LOD@flex--wuhaotsh.bounces.google.com>)
 id 1l4BbS-0006MH-1x
 for qemu-arm@nongnu.org; Mon, 25 Jan 2021 18:49:02 -0500
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:42253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <35lgPYAgKCNsTRE7LQPEDLLDIB.9LJNBJR-7OJKLKDKR.LOD@flex--wuhaotsh.bounces.google.com>)
 id 1l4BbN-00038d-27
 for qemu-arm@nongnu.org; Mon, 25 Jan 2021 18:49:01 -0500
Received: by mail-pg1-x549.google.com with SMTP id j37so8950769pgb.9
 for <qemu-arm@nongnu.org>; Mon, 25 Jan 2021 15:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=I+jzqQbXvQgWEuHn+S1cGshEJkxZZv/tRlV4YBUAhVY=;
 b=mRCTh8N3GYdCOaCaGlFqMFUkJp0rJ0i4BEUeKzpQ9hW1vK8AcNT6ij0J4irEMjEZCJ
 5OnxJb4TbhFrboNDKEKYjKt9fV9NXN9dXUfEO9nNVGvrQF14SRBaQOby/0GMs1NyZ9Zg
 Njr0zji/DBdO2OlHsbc5ZZm6W6Xx5bjuxsF8f92NjBhPMGoAqxgmqm7ah9UQ0ghxHBH9
 56S+JOH6KhFVlcvUiFGPT9T9MU+xzYYxDQkgRudf34NRoFy0skXb/CzQhjY6TLPfe+01
 hDsdhJ+mg35SNprl5yqHAS+g2TpEX7IlvJAigpSV+KxlBrfB5P7fTxrjOAt8rZW+FQvB
 MNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=I+jzqQbXvQgWEuHn+S1cGshEJkxZZv/tRlV4YBUAhVY=;
 b=RBQlvqyanFlgqjHQR5R3RD6mU3ay1KdsKMHED4P+845zGM/s8q9CBST1IP0QAUffaZ
 NM0y64DIX9oIuWp0R4hVY1uVhibmVfdbC6A8dJaw4CQUYbEQHb8SMBga/1aRwUd28tQX
 GiO/U9wEnZgQ8WhvGy0Gq8b3xUhX4dygmfhzKntgE1J34RWaFcwkkMUjhnzvB+f4yev3
 xsfem/gaqsPVv6NJj1XUBbtNxBfxcoR1TWLdCoezSOBaEsSgoMwizoS+2y5BA2wVrcaN
 VKArT1nivOHyJf1jvrAulPMRbsNyA2ByrM2UDbtiuXCRfujDmYUXUECR0rHY8Jztr+4h
 8pgw==
X-Gm-Message-State: AOAM533XsZHp9JFvYE/L1cBTVRoSyGw0rbAcjt6pU6w3bae+lYlRSmyU
 XUZrMbnob2o/Cpgw2SvLTLTZjs4fuQyPqg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:b189:b029:dc:4102:4edf with SMTP
 id s9-20020a170902b189b02900dc41024edfmr3086577plr.80.1611618534131; Mon, 25
 Jan 2021 15:48:54 -0800 (PST)
Date: Mon, 25 Jan 2021 15:48:36 -0800
Message-Id: <20210125234836.607233-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH] hw/misc: Fix arith overflow in NPCM7XX PWM module
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=35lgPYAgKCNsTRE7LQPEDLLDIB.9LJNBJR-7OJKLKDKR.LOD@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, wuhaotsh@google.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, hskinnemoen@google.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Hao Wu <wuhaotsh@google.com>
From: wuhaotsh--- via <qemu-arm@nongnu.org>
X-TUID: A2lKKLuq2flb

There's a potential arith overflow in npcm7xx_pwm_calculate_duty.
This patch fixes it.

Thanks Peter for finding this out.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/misc/npcm7xx_pwm.c          | 4 ++--
 tests/qtest/npcm7xx_pwm-test.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/misc/npcm7xx_pwm.c b/hw/misc/npcm7xx_pwm.c
index e99e3cc7ef..90b4f630a0 100644
--- a/hw/misc/npcm7xx_pwm.c
+++ b/hw/misc/npcm7xx_pwm.c
@@ -102,9 +102,9 @@ static uint32_t npcm7xx_pwm_calculate_duty(NPCM7xxPWM *p)
         if (p->cnr == 0) {
             duty = 0;
         } else if (p->cmr >= p->cnr) {
-            duty = NPCM7XX_PWM_MAX_DUTY;
+            duty = (uint64_t)NPCM7XX_PWM_MAX_DUTY;
         } else {
-            duty = NPCM7XX_PWM_MAX_DUTY * (p->cmr + 1) / (p->cnr + 1);
+            duty = (uint64_t)NPCM7XX_PWM_MAX_DUTY * (p->cmr + 1) / (p->cnr + 1);
         }
     } else {
         duty = 0;
diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.c
index 63557d2c06..f55571b31d 100644
--- a/tests/qtest/npcm7xx_pwm-test.c
+++ b/tests/qtest/npcm7xx_pwm-test.c
@@ -280,7 +280,7 @@ static uint64_t pwm_compute_duty(uint32_t cnr, uint32_t cmr, bool inverted)
     } else if (cmr >= cnr) {
         duty = MAX_DUTY;
     } else {
-        duty = MAX_DUTY * (cmr + 1) / (cnr + 1);
+        duty = (uint64_t)MAX_DUTY * (cmr + 1) / (cnr + 1);
     }
 
     if (inverted) {
-- 
2.30.0.280.ga3ce27912f-goog

