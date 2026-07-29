Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6D7C53200
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Jul 2026 15:29:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wp6Dc-0002IN-6W; Wed, 29 Jul 2026 11:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wp6Db-0002I5-ER
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 11:29:15 -0400
Received: from mail-wr1-f43.google.com ([209.85.221.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wp6Da-0008Eb-1C
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 11:29:15 -0400
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09aaso1014028f8f.3
 for <qemu-arm@nongnu.org>; Wed, 29 Jul 2026 08:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785338952; x=1785943752;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9UU67IURNj8PURmFA5VKoABWjQcNQzhVJM3O/Bwow3E=;
 b=L4ZuMokUe57g5JetpLg2MLlELqf5eipkbYfBsp8vbigIhny0MjnI/PzrpMBSwhZlEe
 ZEzqImQjf8KeHp7de6hi+eP3QVGSE+PNIQmCevIa02lAhEFwkO+HI3hIWfCl/WCfwCzK
 RAXnXe9nFJk4AI5kpYSr1PwwMRcW7jKFwV8awVu9dMu6RfzvfwH+ZMR4rOVKJ2COKkNA
 OgaHB9G53UueIX0QWBd8cywsDX4Nj/SobDMftpZbX22A3Pqk6Pdro+NG7Rxj9hezIPGR
 yFF/kPNNq7kSrH8jEfFNJwM9cbDBdSvycQ0gXVxqzqqAbIlzlEK09NYTMhFiSpzujpc8
 wR7A==
X-Forwarded-Encrypted: i=1;
 AHgh+RqstWOgtPbTKVeqTSF5peaDWalqzZVAryMpj74IJ+edGLG7SfMwUe3NdENsDGYLhSMSS895MyHsVQ==@nongnu.org
X-Gm-Message-State: AOJu0YyV/a4t4uLSyo+fEYDsJrFeGRZSLwlHiwhsqvcP3pWIkQ5bglP5
 jQhw4bUTkhJ0LPY3S8iTb1vKUN9D8QITD1qZx9jvkbc6nEHEqppKZ6ZpttU2NXUG
X-Gm-Gg: AR+sD11aEuX91fky8wvBkfLA49RpVX75+U4q1t/5Jrlr+4WP/Hz50t3DqnDhgxmYipt
 PRUIe5vODNe9RUb+uYBQ0giiEi1I98pX3qdPqalmDB69SVOOjscuJ9jruPcve8JK3TauWsF+K/o
 ba+V2g52gtfU/jYt26STUm5DWrQaAnePJci8Kx7kai0uiTZBdQC8HYddTs/ywxG6Z0O8jBqPU5e
 XLmeZHRv7huGoIjbhCxt+VMrjTqaU4dHdxWLgikhk+y72sOSt9AuhM/J1f8pw5N+xx7sRySVWO1
 sqyj58so87iNqUjo1Na+fC5sETlie+EbsZCRttbIe5bXeqyUYUiQihLlKXq4xyWqIrMOZHaasNe
 hAWMeBKqSdV5aW1NUJFFFFz0MvHOd9wFbFRLJ4g1LXUYlV/ptTGPMfV2/NwbWLCfxXAiq0wd1cx
 5iVqyVn3ZX7DEO9id2SdAO8yiQKARqbwPI02ryqMdYlzmVTCFyAcOvgX60/FAj+a4TKL4f+Sara
 tslwL04dv9GNCnFQnL9wmFDfA9szBilnAJGT1JW+Xn7ykRe
X-Received: by 2002:a05:6000:2dc4:b0:47d:ed1d:e0e6 with SMTP id
 ffacd0b85a97d-47fb1f2a08dmr9196249f8f.55.1785338952567; 
 Wed, 29 Jul 2026 08:29:12 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fbf0a4a00sm2558113f8f.34.2026.07.29.08.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 08:29:12 -0700 (PDT)
Date: Wed, 29 Jul 2026 17:12:41 +0200
Subject: [PATCH 05/25] hw/sensor: tmp105: describe the temperature property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-sanmiguel-bmc-locator-v1-5-c8f9a8d101f6@free.fr>
References: <20260729-sanmiguel-bmc-locator-v1-0-c8f9a8d101f6@free.fr>
In-Reply-To: <20260729-sanmiguel-bmc-locator-v1-0-c8f9a8d101f6@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <th.huth+qemu@posteo.eu>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Emmanuel Blot <eblot@meta.com>, Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785337963; l=972;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=dtFmKtAlRiVXJztXMlux9lIKLH6pMshNOkJwipbdeOQ=;
 b=AT4qhv0C1pJItpktotlJxfRrfF3wClzk3gbUDiD8QoHK4O7xdJCyXzg4+vTmT7Ot0Qmsdptxq
 y0EWOgJSQguAi5l2aqyt2Dj11hdGl+iW/BbjvgmlbJsUqO2OjDuc3Ik
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.43; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f43.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Attach a description to the dynamic "temperature" QOM property so it is
documented in the QOM introspection output (qom-list-properties), like
the injection properties of the INA230/INA238 models. The value is
expressed in millidegrees Celsius.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/sensor/tmp105.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/sensor/tmp105.c b/hw/sensor/tmp105.c
index 5c77f991cc..fefa661711 100644
--- a/hw/sensor/tmp105.c
+++ b/hw/sensor/tmp105.c
@@ -367,6 +367,8 @@ static void tmp105_initfn(Object *obj)
     object_property_add(obj, "temperature", "int",
                         tmp105_get_temperature,
                         tmp105_set_temperature, NULL, NULL);
+    object_property_set_description(obj, "temperature",
+                                    "Temperature, in millidegrees Celsius");
 }
 
 static void tmp105_class_init(ObjectClass *klass, const void *data)

-- 
2.50.1


