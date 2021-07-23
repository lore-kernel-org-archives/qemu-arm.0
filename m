Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp711193lfc;
        Fri, 23 Jul 2021 09:22:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdskxKL8A1TlT1+EuvQSuvvglz0/aGqV46vWiNjRp0QTcrAegrK7p5pkiOnJW+9YPgkX4+
X-Received: by 2002:a25:6985:: with SMTP id e127mr7882861ybc.212.1627057359803;
        Fri, 23 Jul 2021 09:22:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627057359; cv=none;
        d=google.com; s=arc-20160816;
        b=0IvVBhn63GltJ0Puq6FhOpKb54SKHRgEQ4uqTEWfPAVoIXDqizZDiLNMoOyr32QFmg
         gkhbBzMzOemTZ13UrJ75o4a3/n99ln8cjFm3Am6L+UslHY2I3XIvGEtg1QTeLeU+FbZm
         YL/WdDg3Y7kd4bwVdPFjprrRiov1/Gh0OrbiO9M4t6PGSfkVapOaLNP10ArOgrR6VJgJ
         /pxAEZFPAtSlkfzi6aaggNtRBFlBpPmE6eoiLrs+CX6+NZhUcHHJvQPQYDtLwMLrlycM
         6z0dAFS8do0CHiG5OZA5UE136b/bCIDtn4u/0zrdYjQ7BZfdipkdokJuy3l8YSAaX4ih
         kgHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jtp3KRCI/WqcQZFgyWlDzbbEg7X9yExcchTvn/7fMB4=;
        b=fDyHXBqfQnW0M5QFHfqzomSu42RmGDjRE+u1risSabCLymYSZspTERiZAunlngiR5v
         G28SFauPPki2W3T7Fn7/TwVx5tbMtVs7mauUFlTzr5s9INQ3jVVMp8x4dC15sSUCcZYY
         sH2MG8avLWIBvFKUMf7HpZ/0/CM/V4pAfEc9O64bTK8FyQsOdj4m5bKuGyN8LmEnj1o0
         kx+7NtQrOvD3oKtKYiQGj//yahp6abnvozGzPlnCKmidK4eGAgyXRxL2fqIqMwixDWeY
         tn+bB5b0sC9pla9MWBUpEKpbSRb8vd0/aQAzIl6vZh0zfY03UD1/kaRKqemCKfWsYXfv
         DguA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="uSG0rBN/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y200si24737675yby.184.2021.07.23.09.22.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Jul 2021 09:22:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="uSG0rBN/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6xwd-0000xq-2e
	for alex.bennee@linaro.org; Fri, 23 Jul 2021 12:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xvu-0008Uo-Os
 for qemu-arm@nongnu.org; Fri, 23 Jul 2021 12:21:54 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xvt-0000mC-0B
 for qemu-arm@nongnu.org; Fri, 23 Jul 2021 12:21:54 -0400
Received: by mail-wr1-x42c.google.com with SMTP id z7so2913869wrn.11
 for <qemu-arm@nongnu.org>; Fri, 23 Jul 2021 09:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jtp3KRCI/WqcQZFgyWlDzbbEg7X9yExcchTvn/7fMB4=;
 b=uSG0rBN/5LXC/+w1ZA/oKc31355sHypP072dMWPEcK4OgXmO011TftO+3pbQkY/PvO
 z7Jfz3V+MrN/s2fVLple/sxHVBo0fkUmxwUX9VuqmeCxEyAL1M7BkR8ReOTFK9TYTanb
 kUlxsevFG+DOuKRwOuhneofW3mRH7YfmuGlOE4z+sT1wQ8+L3ce5Du4PrPj1GMeO1pB+
 wq5ORlNkHjY8mtl/ry9jZZBCdjxx/ozNAX2zVTzrjpaxlyy0kKdA+PvlslJMxgDi7rK+
 DbCFmlwBMmCKeHMDlC+XXM8MLUu1NbgISjiKcrJGWiuqfMQwDKqKeizA/0gP05w9pz9r
 cpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jtp3KRCI/WqcQZFgyWlDzbbEg7X9yExcchTvn/7fMB4=;
 b=d8NwuZflNsSz2vblJVxr2B2oCo2ugCiGaghSXBlMYS/oQxHEGJzF+H6Sh73NRwaPVL
 IFKe6fOpnAA4zKfzlkDvq9XVmqwAXemzj+M2fuadoVfo6QPswOMSxFsP41AxYhL/tWWm
 XY/ZIOiKkgy6wwkX/EESUa2pL+p7wqF5UKOA9pzzRnXlTDKB2xu6DEkzJYKuX5W7mA0T
 xa7WklDDieBEKSeUA/889zYhsaKXKMEWETWc6WL2uY+xQ6RPxt7S07EUofZMFGZb76so
 84CWaqsC5NaoB4xzzOIjVqVfbVtiCiTJ57DlSFQpwirto13BT24Cz50Tk2OsAlZndeWv
 W6LQ==
X-Gm-Message-State: AOAM533GSx3NXnpGWBM+D9DLgmC0X8dCUQ6JEGxZfd6/1r70vL3lA71s
 2AjfKFWP5fIjuxluwdegvORi5MdKFJyIQw==
X-Received: by 2002:a5d:53c5:: with SMTP id a5mr6264256wrw.15.1627057311454;
 Fri, 23 Jul 2021 09:21:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm5721416wmi.33.2021.07.23.09.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 09:21:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.1 4/6] hw/intc/armv7m_nvic: ISCR.ISRPENDING is set for
 non-enabled pending interrupts
Date: Fri, 23 Jul 2021 17:21:44 +0100
Message-Id: <20210723162146.5167-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723162146.5167-1-peter.maydell@linaro.org>
References: <20210723162146.5167-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FIWXUY5YImiV

The ISCR.ISRPENDING bit is set when an external interrupt is pending.
This is true whether that external interrupt is enabled or not.
This means that we can't use 's->vectpending == 0' as a shortcut to
"ISRPENDING is zero", because s->vectpending indicates only the
highest priority pending enabled interrupt.

Remove the incorrect optimization so that if there is no pending
enabled interrupt we fall through to scanning through the whole
interrupt array.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 94fe00235af..2aba2136822 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -127,15 +127,14 @@ static bool nvic_isrpending(NVICState *s)
 {
     int irq;
 
-    /* We can shortcut if the highest priority pending interrupt
-     * happens to be external or if there is nothing pending.
+    /*
+     * We can shortcut if the highest priority pending interrupt
+     * happens to be external; if not we need to check the whole
+     * vectors[] array.
      */
     if (s->vectpending > NVIC_FIRST_IRQ) {
         return true;
     }
-    if (s->vectpending == 0) {
-        return false;
-    }
 
     for (irq = NVIC_FIRST_IRQ; irq < s->num_irq; irq++) {
         if (s->vectors[irq].pending) {
-- 
2.20.1

