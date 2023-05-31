Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp230778ejb;
        Wed, 31 May 2023 13:39:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ75Oge4NE4r0MUcSmaGfHg0O0Ezj9sm4eNYqIQMcXOYEnOIBhqDZTrYcqZLYziZGWI0BUMb
X-Received: by 2002:a05:620a:410c:b0:75b:23a0:e7e2 with SMTP id j12-20020a05620a410c00b0075b23a0e7e2mr8350555qko.67.1685565575089;
        Wed, 31 May 2023 13:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685565575; cv=none;
        d=google.com; s=arc-20160816;
        b=xVz/Iyf6VEsw2coFajL+vtCV6HFlYnHrOeuigvGtSrL/NOifvlxFWztBWA1dAqG1FD
         TI6KI+CzklxD3iFQ0IECh5iQAoHxA0/NxUMSFfO4fkwIO2edBsNlioY/XzrKJe6uDByI
         MnBODVkJ4BcerqHrOnZkIuERfT3BROvGi3ugWgo3tOD520dtIHIQY0iXtlYgEi2demjG
         8SK2hQCoqOaKERxRQdjCLGYwSAUJ6V/IgFy86PKfBoCI09rniKLWsKXOWYCtyJ6NL5pr
         2GkMAEzLGEH937G0etOXII8W/L91gmxXGFe+YrMgq7uOggHiUZgP07BCkdQXcNZiU9pJ
         Bm6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cBL0tJ6A533UUXBJlMobIsNt8VadG3dvYB/dy1tc5wE=;
        b=FubhsNcbtZd/z6nTIkMQlt44/YbaeMxlj3O1uot+zkFC+HD2wi6A8lj1BN2fNHw/6E
         YvXtYA2toeNVsd1QQXq6rFdNzIRdVHIDGxi/df7EHBttdji3NknOdDkE/SqInxXnSKv0
         IE/l+TGTb2JG7xz4C63aTvaWH7kwEjqyUu7wa6PHYn9F6vLhIr3QAp5WhKIADvsPkHey
         YrkZ1HEHQGj+j3E31ffr7IIam4sHgUC2zPk/k3wmpFVGqWEvkDpZq8CWsFSI6H5s1qRl
         wLZO1tL7DSOXGQqpkdanUY4AzQ4UL8cN6QchHbNtmCTgI1PKfELhLUS/brjEuzQFaDFx
         gEJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n1B3RSb0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b11-20020a05620a126b00b0075953c7471csi8384341qkl.14.2023.05.31.13.39.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 13:39:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n1B3RSb0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q4SZY-0001CI-AI; Wed, 31 May 2023 16:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4SZQ-000105-RR
 for qemu-devel@nongnu.org; Wed, 31 May 2023 16:37:26 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4SZP-0003Rb-0N
 for qemu-devel@nongnu.org; Wed, 31 May 2023 16:37:24 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f6e1394060so870965e9.3
 for <qemu-devel@nongnu.org>; Wed, 31 May 2023 13:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685565441; x=1688157441;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cBL0tJ6A533UUXBJlMobIsNt8VadG3dvYB/dy1tc5wE=;
 b=n1B3RSb0LTIlhc44Q7x8n2DhkEDnO5z1fgGSJz0XLWBUYgBqM/hbs/MNMK9xcYWr4R
 5n+kP3Z31zjxQ5tog0K1XYi9apdxEbgfkbdHfGYuNnM3Fuvcuo0ON5L9PsJMnV/OV6fS
 iV6prv+4kJcYvYAEs6xrgWIXxmCVKXoqWde711C2ixTY5TNY5zAKfJxynk8MW4n621HK
 wnNNeiOicarEiISzXKHCWZ08lH/q1JQkvUH1ascwqYUe6npr8til1UxdNfIsuDESRoPo
 u3KAcXGMISrm7+h1SDGof2B0aH7CezeI29ZLrEH64+0J8tKT/04EHdFrpCYSy2g7enWa
 Yj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685565441; x=1688157441;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cBL0tJ6A533UUXBJlMobIsNt8VadG3dvYB/dy1tc5wE=;
 b=ZdvNv4A6SVkW0y+X4Kx+R41Tu9ecVRFtIkhLusdelhqWbaqbf2l4M5y2MXoV5q0z00
 2qlsSC5/tuhs0orVvjTXwSu89ChS4DHr/WdwXz9ygfXmbrESamjuW7rBHa1gHGA7HVqj
 CVfODmvu7siiUaJ47qfsXG+LKB9gC1jmibfIZKs3sQbGN2gP+9DwWzEoWMxwT9L2Iojs
 cpcpRvRke/n8OgRHvbZmdkPTI8MoJ98QlhxDec96x+4rdgEeXX3Q1MBxFs0ESK38yVEI
 jmKl3aC+YQq7WYuE6j0gkJhckm4W5v87eKaUxACto/S6k2UMCsI5yLix5iseL/FU/SbC
 cRDw==
X-Gm-Message-State: AC+VfDwhdDs6NfLOJRD/+lHqGOTworoXIuKlbjgFU5edP46Yi+iBU/rh
 OHeC4lQ0b5QgQS9gEYMGN4hFxy9BRIspFbhRkfc=
X-Received: by 2002:a1c:4c09:0:b0:3f6:677:3ec6 with SMTP id
 z9-20020a1c4c09000000b003f606773ec6mr327803wmf.30.1685565441526; 
 Wed, 31 May 2023 13:37:21 -0700 (PDT)
Received: from localhost.localdomain ([176.176.146.12])
 by smtp.gmail.com with ESMTPSA id
 2-20020a05600c028200b003f42cc3262asm25508931wmk.34.2023.05.31.13.37.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 31 May 2023 13:37:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Sergey Kambalin <serg.oker@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 14/15] hw/timer/arm_timer: Extract icp_pit_realize() from
 icp_pit_init()
Date: Wed, 31 May 2023 22:35:58 +0200
Message-Id: <20230531203559.29140-15-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230531203559.29140-1-philmd@linaro.org>
References: <20230531203559.29140-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JTum/yD6UYXl

To make the next commit easier to digest, extract icp_pit_realize()
from icp_pit_init() as a preliminary step.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/arm_timer.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 874f9b63bc..82123b40c0 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -416,8 +416,6 @@ static void icp_pit_init(Object *obj)
     for (unsigned i = 0; i < ARRAY_SIZE(s->timer); i++) {
         s->timer[i] = arm_timer_new(tmr_freq[i], s->irq_in[i]);
         sysbus_init_irq(dev, &s->irq[i]);
-        sysbus_connect_irq(dev, i,
-                           qdev_get_gpio_in_named(DEVICE(obj), "timer-in", i));
     }
 
     memory_region_init_io(&s->iomem, obj, &icp_pit_ops, s,
@@ -427,12 +425,30 @@ static void icp_pit_init(Object *obj)
        save themselves.  */
 }
 
+static void icp_pit_realize(DeviceState *dev, Error **errp)
+{
+    IntegratorPitState *s = INTEGRATOR_PIT(dev);
+
+    for (unsigned i = 0; i < ARRAY_SIZE(s->timer); i++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
+                           qdev_get_gpio_in_named(dev, "timer-in", i));
+    }
+}
+
+static void icp_pit_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *k = DEVICE_CLASS(klass);
+
+    k->realize = icp_pit_realize;
+}
+
 static const TypeInfo arm_timer_types[] = {
     {
         .name           = TYPE_INTEGRATOR_PIT,
         .parent         = TYPE_SYS_BUS_DEVICE,
         .instance_size  = sizeof(IntegratorPitState),
         .instance_init  = icp_pit_init,
+        .class_init     = icp_pit_class_init,
 
     }, {
         .name           = TYPE_SP804,
-- 
2.38.1

