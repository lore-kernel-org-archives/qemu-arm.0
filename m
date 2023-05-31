Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp230337ejb;
        Wed, 31 May 2023 13:38:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7V9GCIWSqJ9fbNOFjcDoBpbCeH3PnLmfgu1YQTfwY+k/qwguldM04AHqxk7oxWuAiRW1Tk
X-Received: by 2002:a05:6214:e4b:b0:5ea:d52:7042 with SMTP id o11-20020a0562140e4b00b005ea0d527042mr7384926qvc.31.1685565517928;
        Wed, 31 May 2023 13:38:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685565517; cv=none;
        d=google.com; s=arc-20160816;
        b=uea4PJq148K3bSc4Gczyw6zPqoM8TqbuAS+0E2UFeNJ97+fRvHhARkU9xRJHpVulti
         nOwG1plE9TthMtYvKlKuSd3LXSPb0D1P+MKtAwqYmPzxaBy0QXio6su0HMSic+05NKsy
         BOzWNCk+IC84BlmEO9Fdn5frDGa7CUYHSsJ7ISAY7SDW0UGPNGW5ULQnDz9TUWmA5Bbc
         zu6Y/QwjunqVq7Lkh1wDeXHLVt1rovl+XzYXLIexES09dgfpxGFQBbHx3Bt6DRFbLVl6
         CIadXnw6zaB83VzIavg2vQmQofv90sq5cS9N0SpwkZJ9Q1p1RFiH1XB3As+ttBgaYxGs
         3SMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cqmxkSyXDcjXzwtphH1bFAgAKMWrKTeKoHsfOWjfasw=;
        b=SRiVz5RHPywA6gmqDO0Z7tD1tLe95FHKLmZudY/v3dUajXYG7XgWgql8gmvauBaSOc
         WtiVxSNZzYZffP5vmLMKyFto4GlPUE4g4z6tqTauM87du+uJv5BpzMsIeF8ACFO+/HDc
         MQnqe+BuVv9jsMC+UCaZQ/ljXU1yfnNEF+eIHfWtmKFHffN3rqBZy54djWw30pnvOyxj
         FU/ubs6PRPZBLjedKcNE4b6WkBL//6FenG34RMBcX7RS4GZQ6ZxLQUHGGMQWgmKDYQcj
         rVcYiv4WGp7IIo6HC6gGEe+h3Jta8N8yKeq1771GJBPNL9i+ou9FF1zn7q75b2NBsNQ4
         RGeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fpTM2ur8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y20-20020a05622a005400b003f6262ba088si8509725qtw.17.2023.05.31.13.38.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 13:38:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fpTM2ur8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4SZ1-0008S9-3v; Wed, 31 May 2023 16:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4SYt-00089R-1n
 for qemu-arm@nongnu.org; Wed, 31 May 2023 16:36:51 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4SYr-0003LO-6H
 for qemu-arm@nongnu.org; Wed, 31 May 2023 16:36:50 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f6042d605dso819935e9.2
 for <qemu-arm@nongnu.org>; Wed, 31 May 2023 13:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685565407; x=1688157407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cqmxkSyXDcjXzwtphH1bFAgAKMWrKTeKoHsfOWjfasw=;
 b=fpTM2ur8d/1G9NkfRgb3I606Jl5/sSIsRAUzCAFXspxNnWuxpdNYTgjl2RhyO8Gwuv
 QSSeXsorCiy9TQtZZ1fj1BIIFT95XvUZlg0pEnxGdvNm8mKdO8DIqQC+BcM1HodT45dw
 /cEam/MijEDaBdK9k5MLeFB3Ln3DUUIsD22xI05ob8GsKt30/53v7G2IqPtoD8Tmi4eI
 kvLyOHXDph0AwitdCnjhaP5Plsw3yNQhQM+jPrH7AkduaETdNjpEFqaCV7VAku/ii9kl
 IbOBevb5yl4sp/ntWilSFV3ibriKdJZRbRP5DXy3vbAm1xNhzT5MGkSPVVBzDbXM1pmS
 OZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685565407; x=1688157407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cqmxkSyXDcjXzwtphH1bFAgAKMWrKTeKoHsfOWjfasw=;
 b=lBFvUAWwcSyuQAycqKwva3gb1WGMcKYIxtSEyLLbYcoY32rfM/8uoE3GPPCLRIR72k
 cf2RyGUuMz6OADUUwjzC1P0Se6H3xpDp/oFRwH+2iPfz4uk0MgYuLqVISDRIkomXaSm1
 E95kpH9hqTQamD7lXFzu3KS3KXjWBCkdXudDf3d+6AW8uy3BDnEYV+3oKIZprDF8RByc
 pXcgnMNLYAW8KxtJUaqWAsowmC7YMHI1ovxeWGfhocrtEjzFJ/1l+oXugPe8YnDY3J7B
 hVSGGw+UrIvfjGGFsTNWcEjMDTpHYYTIfHRNZmVR9lfabewUtm0TRC5iFCcSpHIeR0so
 lZcg==
X-Gm-Message-State: AC+VfDyOhPSJ/UANs1Km8IWicq/g5uUJxZPlnmP9wsMGeg2TCgaoreOC
 DTprqI8S+FqTAloFKxz0tb+MCw==
X-Received: by 2002:a1c:cc03:0:b0:3f6:d40:c89 with SMTP id
 h3-20020a1ccc03000000b003f60d400c89mr306190wmb.12.1685565407595; 
 Wed, 31 May 2023 13:36:47 -0700 (PDT)
Received: from localhost.localdomain ([176.176.146.12])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a05600c21d500b003f6041f5a6csm21998812wmj.12.2023.05.31.13.36.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 31 May 2023 13:36:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Sergey Kambalin <serg.oker@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 08/15] hw/timer/arm_timer: Rename arm_timer_init() ->
 arm_timer_new()
Date: Wed, 31 May 2023 22:35:52 +0200
Message-Id: <20230531203559.29140-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230531203559.29140-1-philmd@linaro.org>
References: <20230531203559.29140-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Mlh1D9ZwNsnn

QDev models often use foo_new() as the combination of
foo_init() + foo_realize(). Here arm_timer_init() is
a such combination, so rename it as arm_timer_new() to
emphasis the returned device is already realized.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/arm_timer.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 54318d0a57..1f4d66291a 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -177,7 +177,7 @@ static void arm_timer_reset(ArmTimerState *s)
     s->control = TIMER_CTRL_IE;
 }
 
-static ArmTimerState *arm_timer_init(uint32_t freq)
+static ArmTimerState *arm_timer_new(uint32_t freq)
 {
     ArmTimerState *s;
 
@@ -308,8 +308,8 @@ static void sp804_realize(DeviceState *dev, Error **errp)
 {
     SP804State *s = SP804(dev);
 
-    s->timer[0] = arm_timer_init(s->freq0);
-    s->timer[1] = arm_timer_init(s->freq1);
+    s->timer[0] = arm_timer_new(s->freq0);
+    s->timer[1] = arm_timer_new(s->freq1);
     s->timer[0]->irq = qemu_allocate_irq(sp804_set_irq, s, 0);
     s->timer[1]->irq = qemu_allocate_irq(sp804_set_irq, s, 1);
 }
@@ -394,10 +394,10 @@ static void icp_pit_init(Object *obj)
     SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
     /* Timer 0 runs at the system clock speed (40MHz).  */
-    s->timer[0] = arm_timer_init(40000000);
+    s->timer[0] = arm_timer_new(40000000);
     /* The other two timers run at 1MHz.  */
-    s->timer[1] = arm_timer_init(1000000);
-    s->timer[2] = arm_timer_init(1000000);
+    s->timer[1] = arm_timer_new(1000000);
+    s->timer[2] = arm_timer_new(1000000);
 
     sysbus_init_irq(dev, &s->timer[0]->irq);
     sysbus_init_irq(dev, &s->timer[1]->irq);
-- 
2.38.1

