Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp154200lfo;
        Thu, 28 Jan 2021 03:56:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyIV4ahD+fI1MGwhMWKOlu5GPPpAxvgsTVa/qr5dePVujbjAu0jJPSWVHn3/qC9IctJbYJX
X-Received: by 2002:a25:348c:: with SMTP id b134mr676483yba.89.1611834988120;
        Thu, 28 Jan 2021 03:56:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611834988; cv=none;
        d=google.com; s=arc-20160816;
        b=ZNgZ5PlCj/i83ChJRn1Gyswub8w6g+SYdKKBTKdmL1Z3LnoxWt74TRbipT8ZzsZZBX
         UTmGSNPaW6ZlQaMT3ZVm/cD0Q2Tuxb20bf4Spps6jftsCKj352S4bU5zmpcf3T9M4Wh7
         6T8KCRC8QpadAxKhIfkDRNkDwuxwG2gz3dPLIhVq0MWtp9uQ/foAjVHKwD/CnK9oLdC1
         dUGlNUajVNsRVDUJa9R+wqI+cP7xuthLzzOuKAO/HIuFeMq7YEf7ydmiDKzdqTlss08u
         rXqAIty7oVNRn3c9Hy1j6BYwvxsmA/PS31yKMY42OjcrWIr6+ileYAZSv+PXbOWJWa3v
         iqCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=FLhKJfJA3wJXHxcMZPwl39x9goxCdaNuR65Z80YJ5OE=;
        b=GyI16qQHBMV0zGaRmYaCOEp5AtmJ01FytkFfdm7/g/0dwRqoE8rFfvbRv1A+5eXwbX
         1H+lGTb/7BSLJMpUlV3gepDuQloSkWMiyPe9ucw7yC5QYbksQKRt81OWKkqQ5ZIADGos
         4SSs8RGB2s6Deqj+BnPxdNoTfrLyVS84LmaM7d2UEU2L0TvMAazuZ+8mLIupmYv9FKYE
         upoyclpIiMrbAvLUL+07m8jb3a0Q9OUpKyesRD6C+N4DJ1IBPD7UAtvYFH2CPBYzp86Q
         7SRVfXFgOdmXtKRxiaJ8i/yNgklGSRB68ynG6pfcUI9AogtKFQ+kX2xR9hypuOKu1ybN
         qKTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dvL1tvBW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5si5309104ybp.301.2021.01.28.03.56.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 03:56:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dvL1tvBW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l55uV-0003Av-Gn
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 06:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gq-0001fK-Rw
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:20 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55ge-0006DJ-V0
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:20 -0500
Received: by mail-wr1-x435.google.com with SMTP id c12so5055806wrc.7
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 03:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FLhKJfJA3wJXHxcMZPwl39x9goxCdaNuR65Z80YJ5OE=;
 b=dvL1tvBW0hb+ABtbTnHOaDtgaVPGUu/yGvYan8qVNWP1vnhCE/+Fwwu5T/F6ZzgaL+
 VLnzY8sQq71XXz833C+mYNEjgn8YmE8U7OfdO7VHs0Y24sErXopLKSZ6uRsHdaMEVwgn
 4rxgOztIQ7Yo4z5rsEhCvNCzB81NaO00cgTUWFavGl+YLz+fnNH34CGwyZQ96AFPRGJ7
 s7yv2Vq9EI9R8ZPOKbKVDPu83+LTNA2Z6dNe7+yNCycedsYd82RxcPOSzjlhodEeQMfj
 lKHMBzMo5gOeCQu4weHzTKAcvZ7yeeR+UsLd410XQ4KjbBVPksIk7AWwxYgIXa4SqBUO
 ovmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FLhKJfJA3wJXHxcMZPwl39x9goxCdaNuR65Z80YJ5OE=;
 b=QGGtz3p/dP9PmCZ27LbsjnBa4XrBMicPTp6BK+vCwuyaz2N3NclRHTl46MvfDhdAg5
 pISJ8T8BvOhGwDpf1XRSqLwnYjlBwwkDuwr2JsAsDKjY9ZyjQOGJXY4sItia6ijVLNbW
 lkbzj4pK8d966QioC/M1qdAHifkb2vyKPZ+SS144x7yunyRZF25RUzvPhW7TwR+YpSbj
 o46GBIy9P3WZCQjBlslNSyZOP4+C97fBRwYLuM0XJ52EwC8OBaFq2k9ucoQTEuv9FjUf
 tfPko6+Jq24SWYaCq4368NHI7acL93X5g2Z7GT4tX98DewA6bvio6msQT9Ny7IVeOsxo
 KiMw==
X-Gm-Message-State: AOAM530MyzWyBbVL2LZHRrFdMGK1qFjR3gxR6WSaMkwIKyRYKPyyq8+o
 14bY3qsNsxeYTPxHoXHoQVKaqA==
X-Received: by 2002:a05:6000:188c:: with SMTP id
 a12mr16295896wri.105.1611834127506; 
 Thu, 28 Jan 2021 03:42:07 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:42:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 20/25] hw/watchdog/cmsdk-apb-watchdog: Convert to use Clock
 input
Date: Thu, 28 Jan 2021 11:41:40 +0000
Message-Id: <20210128114145.20536-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DNNxREHJ5WYo

Switch the CMSDK APB watchdog device over to using its Clock input;
the wdogclk_frq property is now ignored.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210121190622.22000-21-peter.maydell@linaro.org
---
 hw/watchdog/cmsdk-apb-watchdog.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/watchdog/cmsdk-apb-watchdog.c b/hw/watchdog/cmsdk-apb-watchdog.c
index b03bcb73628..9cad0c67da4 100644
--- a/hw/watchdog/cmsdk-apb-watchdog.c
+++ b/hw/watchdog/cmsdk-apb-watchdog.c
@@ -310,6 +310,15 @@ static void cmsdk_apb_watchdog_reset(DeviceState *dev)
     ptimer_transaction_commit(s->timer);
 }
 
+static void cmsdk_apb_watchdog_clk_update(void *opaque)
+{
+    CMSDKAPBWatchdog *s = CMSDK_APB_WATCHDOG(opaque);
+
+    ptimer_transaction_begin(s->timer);
+    ptimer_set_period_from_clock(s->timer, s->wdogclk, 1);
+    ptimer_transaction_commit(s->timer);
+}
+
 static void cmsdk_apb_watchdog_init(Object *obj)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
@@ -319,7 +328,8 @@ static void cmsdk_apb_watchdog_init(Object *obj)
                           s, "cmsdk-apb-watchdog", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->wdogint);
-    s->wdogclk = qdev_init_clock_in(DEVICE(s), "WDOGCLK", NULL, NULL);
+    s->wdogclk = qdev_init_clock_in(DEVICE(s), "WDOGCLK",
+                                    cmsdk_apb_watchdog_clk_update, s);
 
     s->is_luminary = false;
     s->id = cmsdk_apb_watchdog_id;
@@ -329,9 +339,9 @@ static void cmsdk_apb_watchdog_realize(DeviceState *dev, Error **errp)
 {
     CMSDKAPBWatchdog *s = CMSDK_APB_WATCHDOG(dev);
 
-    if (s->wdogclk_frq == 0) {
+    if (!clock_has_source(s->wdogclk)) {
         error_setg(errp,
-                   "CMSDK APB watchdog: wdogclk-frq property must be set");
+                   "CMSDK APB watchdog: WDOGCLK clock must be connected");
         return;
     }
 
@@ -342,7 +352,7 @@ static void cmsdk_apb_watchdog_realize(DeviceState *dev, Error **errp)
                            PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
 
     ptimer_transaction_begin(s->timer);
-    ptimer_set_freq(s->timer, s->wdogclk_frq);
+    ptimer_set_period_from_clock(s->timer, s->wdogclk, 1);
     ptimer_transaction_commit(s->timer);
 }
 
-- 
2.20.1

