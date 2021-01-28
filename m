Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp148910lfo;
        Thu, 28 Jan 2021 03:49:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdAR+Bvc+n6YHvIldKVKZwRYKVxqr+8NSGEWZ6jcg8MC1haZ0rWLtG3YfJt5NkJAiPiRmP
X-Received: by 2002:a25:1004:: with SMTP id 4mr22870750ybq.137.1611834583653;
        Thu, 28 Jan 2021 03:49:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611834583; cv=none;
        d=google.com; s=arc-20160816;
        b=iOaF26zvAIKyq6775Xi2cpS11cGniBfBFgMzFoSnDSSCBX9nkb8QyaMXMmGZT6CXmv
         vWmIU2CW21oFcZFYN6Lab3AC1dPWgflg2RU8VhD4EUXXMJNBasdRApWPSYjiJqn2f2dh
         +CYOw8+bQLBz3KWSsLsvmJhVHj6sSioFkckdVKfrV+Twvq1kRTtPKSAHH7fbuJ9uL2Ks
         p4yh0qTT+rKqXNAJd3JAK0bIawYxhO3/kGuo0jq1pbSqnPyVGOZBHLP5/kYQqsCKV6Qs
         01f6Py4PBRsf0yHhCnImxZA9va9w4YB7BUGXRlojVkAsFQutDcO9m2rHoYKTg0fqHLt5
         bv1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yZ8xu0Lo6T+SwLC4D2n+MG9CZOTMUcUo5Src/38TuZs=;
        b=jTFb7+RymWGSKaqC+gjkGMTb1/IhsXbK/zl1KR5Xwogijjr2BO0nNzON7PuiSh2cFv
         pVHeGkvvglesd8CIVxskJXIvP5qTt2dvUXlbXSgWbG09Hst22L9r5LFpuK3fu1ysTK9h
         z1/o4T6BZSEiny4LoVeYaRpQd4kGRflqI7k2I8ee0rIQJDZnggqBQZkM72MNVkfqn0QQ
         7PDjZYjdDd74HELjvsDskzC4lkm82W9FPvj+M1NVmW04ycrXwPgmX9lkmtKLinOkZbOe
         8qyaJm4gME4i5P30l98nd5qBQqYozLAKKoz03VGK05Kr16g4Oyjh7/HWpUaHVyFdCoq9
         Ym/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g40UFwzg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r16si5098416ybl.70.2021.01.28.03.49.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 03:49:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g40UFwzg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l55ny-0002U9-Ve
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 06:49:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gq-0001dZ-7b
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:20 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gd-0006Bv-2M
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:19 -0500
Received: by mail-wm1-x32c.google.com with SMTP id 190so4054107wmz.0
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 03:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yZ8xu0Lo6T+SwLC4D2n+MG9CZOTMUcUo5Src/38TuZs=;
 b=g40UFwzgOTp7m7ioPZrkGlaY3gtXHEjV3giEP6Wq40EvOKxWkRsJpy81y164YY8mvF
 NgeCt/QzrnHr5Py+P8rdaSWwY1LOy6VEzLgzriUOeiBbkF1xQY89QX8TCZzIIkaxdvEI
 BGZpE9dSabTgaBrDMQ5MjDDOQFY9yng6uJdmUsSFg7y17CXFIeddxEN7djZBJtWnEQ2/
 x60YRnj/7Wj+5w6+rYGHG36G2gz2dkLVBr794ekiRiy3oeDNti8Cdx7VAlGoxGNVGlf5
 Jd6NKaNbz1MIQx8ec8EHFd4D9StJblj8re7I5ila3zAkXVIu/Wysvfi1Cyj9c54Z4fgH
 H2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yZ8xu0Lo6T+SwLC4D2n+MG9CZOTMUcUo5Src/38TuZs=;
 b=o8ICjrlMW1HnEpfpe4o1gEKORYZE4dJyrG1dZR2RlSeucX88qxiKxDOiKduLKNMjE+
 C8phH7lwj7YiAtERWkM9mqScv3U+3z1G//fBdcvlz9NMMbyTD8evMcPDsR5wA5JZLiju
 YYiFvy1YdqGIEQthxjPCLgzXRKoghNj8WrVg7xPz9Y4S7ILbM7b0WsUrb1MtgvEITj7X
 drzif6YwDIhh4kZQvGiAly11gXJDbRkD9qFdzL26h5xsRHJ4wMhNXZX/TTqTyUnQVPqI
 WRvyvo/GNiQu6ly19kTtpY3/w3yoGEFJKvX+VmkU/DbTjyO6hgzW8Gd7B6B9yzfQf3dM
 rGQQ==
X-Gm-Message-State: AOAM533Dw75oN13RHzDM4B2Dbpk4Mmvu8qXLT2UH17lgpt0vbgEoHNNO
 6aIKl2xs6OFUOCUTDdDcbv+l3A==
X-Received: by 2002:a05:600c:2295:: with SMTP id
 21mr8506158wmf.133.1611834125570; 
 Thu, 28 Jan 2021 03:42:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:42:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 18/25] hw/timer/cmsdk-apb-timer: Convert to use Clock input
Date: Thu, 28 Jan 2021 11:41:38 +0000
Message-Id: <20210128114145.20536-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: tnAKY17J1WQB

Switch the CMSDK APB timer device over to using its Clock input; the
pclk-frq property is now ignored.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210121190622.22000-19-peter.maydell@linaro.org
---
 hw/timer/cmsdk-apb-timer.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
index c63145ff553..f053146d88f 100644
--- a/hw/timer/cmsdk-apb-timer.c
+++ b/hw/timer/cmsdk-apb-timer.c
@@ -204,6 +204,15 @@ static void cmsdk_apb_timer_reset(DeviceState *dev)
     ptimer_transaction_commit(s->timer);
 }
 
+static void cmsdk_apb_timer_clk_update(void *opaque)
+{
+    CMSDKAPBTimer *s = CMSDK_APB_TIMER(opaque);
+
+    ptimer_transaction_begin(s->timer);
+    ptimer_set_period_from_clock(s->timer, s->pclk, 1);
+    ptimer_transaction_commit(s->timer);
+}
+
 static void cmsdk_apb_timer_init(Object *obj)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
@@ -213,15 +222,16 @@ static void cmsdk_apb_timer_init(Object *obj)
                           s, "cmsdk-apb-timer", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->timerint);
-    s->pclk = qdev_init_clock_in(DEVICE(s), "pclk", NULL, NULL);
+    s->pclk = qdev_init_clock_in(DEVICE(s), "pclk",
+                                 cmsdk_apb_timer_clk_update, s);
 }
 
 static void cmsdk_apb_timer_realize(DeviceState *dev, Error **errp)
 {
     CMSDKAPBTimer *s = CMSDK_APB_TIMER(dev);
 
-    if (s->pclk_frq == 0) {
-        error_setg(errp, "CMSDK APB timer: pclk-frq property must be set");
+    if (!clock_has_source(s->pclk)) {
+        error_setg(errp, "CMSDK APB timer: pclk clock must be connected");
         return;
     }
 
@@ -232,7 +242,7 @@ static void cmsdk_apb_timer_realize(DeviceState *dev, Error **errp)
                            PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
 
     ptimer_transaction_begin(s->timer);
-    ptimer_set_freq(s->timer, s->pclk_frq);
+    ptimer_set_period_from_clock(s->timer, s->pclk, 1);
     ptimer_transaction_commit(s->timer);
 }
 
-- 
2.20.1

