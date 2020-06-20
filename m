Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1871172lfm;
        Sat, 20 Jun 2020 15:59:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQ4y4VHypOtfyRvp/NR+LcGarBLijwdOMYJv2SdfCGvZMYUEgOTwngCkssDCyyhrGtn70H
X-Received: by 2002:a25:cf44:: with SMTP id f65mr16585758ybg.368.1592693976221;
        Sat, 20 Jun 2020 15:59:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592693976; cv=none;
        d=google.com; s=arc-20160816;
        b=pSkV7Cb8bmd7dYz31G6+SwQRsAaZpgalCW9qmTxPQjARQX0z1td1+lWtSYuWiQo+/w
         W0zFiI+Z2Y8trFuMsOJd/8hflUR2AgaeIr+rfzhQSWactvn3EBjUT5JdFdewtmoErck6
         0CaGEzw4Zn5DAOrDzQiz4GQ80sx78mvBSlCAxcHtoQam7MIXQeZ8nQg6QWxMKMECwL2a
         hkJ0DNDq2+5bbmbZjr6h51VzbsLCIO48ECRQD0WvXD1PFDI//UEBdfgaaMQC+Braue1u
         w6WJYZcyVabcE7ak0bv5jK4tabC4Ji+CZlsIxl3ta0z78P9CiTW+Xn2uTKuX31gq/eoM
         5l8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ecdWcrYL1Jj227XOQ2qPsZtEv7ne60QEm0iDo/NnAik=;
        b=DNW/y1Lng+ATUqmLXfUixe9H85S+uSIIbfm93zBhbqi8txxxN3qk8fWsO7oBDkTr46
         fPlpZZUtPH+qwnxMJtbuF/zVUgI1nmMxqoSkaEVYQXOWsul+K7bvtBtmVEJDjiG+usTD
         DwVkaQPNrDJZDWTNW2kW4OV1AC+Re8WF+AKLH4Cbda0spSQ88TyMauK2VAD3ISYdtDlx
         qWlL2w+gaiSHxIWmN0rUzJ8+tU15bi5I9WDvWlRjXKTQbnyVO9sUIYZVm/0/RTxLeo7y
         vPJV41FVMaAiv+hx+Iuo8JI5oYqCzD8bRsD3kbEIIfe5RLl9A1vTHuYtE1TNmoLqRNX6
         dc/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IHbmxLsI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e81si9213051ybf.12.2020.06.20.15.59.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Jun 2020 15:59:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IHbmxLsI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:32888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmmSV-0001Vs-IB
	for alex.bennee@linaro.org; Sat, 20 Jun 2020 18:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jmmS0-0000iK-7e; Sat, 20 Jun 2020 18:59:04 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:33530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jmmRy-0000xs-Nx; Sat, 20 Jun 2020 18:59:03 -0400
Received: by mail-wr1-x441.google.com with SMTP id l11so13166648wru.0;
 Sat, 20 Jun 2020 15:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ecdWcrYL1Jj227XOQ2qPsZtEv7ne60QEm0iDo/NnAik=;
 b=IHbmxLsIfA7MSwDPdmBAq5HRVqJCRZlavhomTkv78VVZ/YdjVInwIbO5M5SU2gHXYC
 TBPTXWD6+h7qAJR7pWmgDfVQtZc235wLIJPby55fo970yf2oKt+zDRfT1P7MvhkXzUDZ
 MD/+xjngcy7Tip9e8Qrpqy1IUJER4sz806Qc9dK1Ef+1FzHr9aPRfrRi9yksRYZha4Eh
 P7eQgi4K+geya76tI1aQR0yLfvtAzX4Bi14VRJiDO73zxiCwqRRlttayG7AuQ9MW5VMc
 1S+tqpJuhKHZAaos/BdIA+Txx3PPxtNZImzxYLFKxkuXvBn6XwZErJcDFYkCmK0ecRRC
 Hiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ecdWcrYL1Jj227XOQ2qPsZtEv7ne60QEm0iDo/NnAik=;
 b=lOax4kpvM1uCiyQX20W/EhW2EtidhKw9zMD1uenxnPUFtkljr8dpBo0MsdQ9LBvEoy
 fOo8qe7GZDABMxw29e15+DA/yE6VAX4RvEVxQDM/yrbxn5+sxR93AY4cxjqhToLemFiG
 SGpvHHlyFadw0mHqi/ySTeJ7qkoddTIh3kVaa9ytxs0VguXmoPs/8NKJ/hDq5FQwBgzn
 PaTMx7V1oAyrEM4cSmKzZuM0nDzjqDRnoyb4fsr3ERHZDbyPDklxFZrcNlF3TgCAI042
 UKYbSppUHJCGs9QgEJ5AjIodZq5c3fDAlrQ204UdxmwKNS+73zH67ZR6vGPhAeLtShOe
 +Bpg==
X-Gm-Message-State: AOAM530pGTYWXYxHT3l3IF98LF4UQawNI2P/1sIcNg1qjc+tCnrIJF8t
 E438ksdaULWJoi28/khTYCOMFH59
X-Received: by 2002:adf:828b:: with SMTP id 11mr11799979wrc.58.1592693940761; 
 Sat, 20 Jun 2020 15:59:00 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id x18sm11147127wmi.35.2020.06.20.15.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2020 15:59:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/8] hw/misc/pca9552: Use the PCA9552_PIN_COUNT definition
Date: Sun, 21 Jun 2020 00:58:49 +0200
Message-Id: <20200620225854.31160-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200620225854.31160-1-f4bug@amsat.org>
References: <20200620225854.31160-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5c7umE5lboqW

The current code models the PCA9552, but there are comments
saying the code could be easily adapted for the rest of the
PCA955x family.
Since we assume we have at most 16 pins (for the PCA9552),
add a definition and check the instance doesn't use more than
this number. This makes the code a bit safer in case other
PCA955x devices are added.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/pca9552.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
index cfefb8fce8..b97fc2893c 100644
--- a/hw/misc/pca9552.c
+++ b/hw/misc/pca9552.c
@@ -303,6 +303,17 @@ static void pca9552_initfn(Object *obj)
     }
 }
 
+static void pca9552_realize(DeviceState *dev, Error **errp)
+{
+    PCA9552State *s = PCA9552(dev);
+
+    if (s->nr_leds > PCA9552_PIN_COUNT) {
+        error_setg(errp, "%s invalid led count %u (max: %u)",
+                   __func__, s->nr_leds, PCA9552_PIN_COUNT);
+        return;
+    }
+}
+
 static void pca9552_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -311,6 +322,7 @@ static void pca9552_class_init(ObjectClass *klass, void *data)
     k->event = pca9552_event;
     k->recv = pca9552_recv;
     k->send = pca9552_send;
+    dc->realize = pca9552_realize;
     dc->reset = pca9552_reset;
     dc->vmsd = &pca9552_vmstate;
 }
-- 
2.21.3

