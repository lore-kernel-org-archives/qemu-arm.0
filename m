Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4628970ejc;
        Wed, 18 Oct 2023 06:15:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFX+pWP6PoJQY3QZiswEVjL8WB1lQUkFci9B0fibRPUTrPBEevGiw4V14pD+3z/wWurssUH
X-Received: by 2002:ad4:5cec:0:b0:66d:61c5:8717 with SMTP id iv12-20020ad45cec000000b0066d61c58717mr5729481qvb.1.1697634917659;
        Wed, 18 Oct 2023 06:15:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697634917; cv=none;
        d=google.com; s=arc-20160816;
        b=dUM3HAAy4dYbr+pc28lBflD6SaMq78z0fBICm0Vc5XdJEPbVHvUE3ke5htwDjTWZc3
         3hAqmlMALmCWdyI/lT11SFockM/6szr7A+94mcwT9jJjFqsO7Ow5A+H8P0DjG2U0+53u
         bbRItupHz0I8l9niH1A+dQvztZEOrbdiGUK5z8U1iuYk3qFRVYV25SK+MQdHexpYYhjz
         z4M2Ya4RaQtwOxS/hN0y+T/G9aGqa1G/jRz4mj/nyOk+ecKs/LgUeC0JfQBdFsTTPxM4
         4nHalzmwZ2YD/dtYjZ9pGXftNOd1py80JUcwzFxsli4w3L+K9ydsHXFQKS/f+QIR11HN
         /bWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IrXKI6jVLRlYzi/YxZFiozSO1YVRsr5CmuAToS28wAk=;
        fh=Uq4CCH4qgIScoA1ZlzK6h1LD8Rw6xac8JtYTs6G5zlc=;
        b=jW1nTfnWrQQYLTarWnQOco5uoHcQ9PhfC/sYoxlsza5j2U2ocVxEGZ2vIFn2sXZdRu
         Z90sGLtdhgHjw7xTVcq5jk/iKfvHOWOArNinz3bMQZLDWfxr45LLPUNukJ/FoDYf02xn
         j87JeaqksRV/lw6Kt4qT8lGtTf5P2aCY6TfTtMRwxJXejNMKCcx+Cl5Lyc4bbpdyA9cv
         aJECJpTMm6VrrsTQVCMm0H0RO8o9JsdeW83t8dYHqfCAtTMlqDKEZ09omxUFFGJPWvw8
         dANwbuEnRkdJo5ELxrFUeY0Le3Z8GCvgqVZd8nfdHbyvCyvNLlqDiJGEYM7h0CFW1STF
         Y6Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lEcKY7oq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q5-20020a05622a030500b00403b84a6bbasi2652432qtw.385.2023.10.18.06.15.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 06:15:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lEcKY7oq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt6Me-0007zt-58; Wed, 18 Oct 2023 09:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt6M0-0007D6-JG
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:12:53 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt6Lx-0000ld-Ae
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:12:51 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-99c1c66876aso1105527866b.2
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 06:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697634767; x=1698239567; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IrXKI6jVLRlYzi/YxZFiozSO1YVRsr5CmuAToS28wAk=;
 b=lEcKY7oq2aVDkJm9QEs7FF5I3qgwi4I4I4k6eW8OU5ATE+X7eqO5wqD0bUs6Jg9uu5
 oLu/4FPHja7mGpsNAA+K87PzaeRvAybNfUn6bvQoT6FmKJDN/Wi5KpvQvph7DwcpYNMu
 H+xZNuAXf+wf917HlcW2QgBeSMm+HD3MfZhaIahiHwEL6A6wlz/NH5/w+ZB8ZFuAHlUh
 5QIw0vfW54YY5DuIRTBG4i/BDXM4W7CpYkLqhhW7iNZ0M2CYtPNARZgo5MWi9WkFDcVl
 LcnAVhkA5Vr4S13bo7vi5n5r363CvUgm9DPTC4CZw/TewOYMsrxrKlx665e9gE290FU4
 YKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697634767; x=1698239567;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IrXKI6jVLRlYzi/YxZFiozSO1YVRsr5CmuAToS28wAk=;
 b=Z+mDW5KAtisJgTpMtu9oLHY3VuPokJeYCgb4y7FFSGmUfFfqa2uPpMEiWRFXwISk8r
 NxLnU8klRKWUZM4FN0jPUCx3nduu9vmftdCiP3lFGFCoeBwhx0B7C7ftg3Aqjotz3vDt
 yYuplTtiMzrJc+yPUDX8xL2RxzHKtRTrWm5BqClni1yJS3t2RhUnNmUIao3f67gVLwG3
 L57A7rSsyrY4gV7BdpKODO8aTk8uoCN/2HGbZGWrcscUm2jPx2GuejYjWsWf1Wa0hlch
 Qj9vkzGeqlO0+bXfK+WJrMHv+phrtjkhekCM3HGhEGkWemEdplH0onlxc1KTv/ASzsou
 tOpA==
X-Gm-Message-State: AOJu0YzCAJiXrRYu/iEPwNXsQrUExc4EszR1N+xcIExWxOso9XVJL3rI
 zbdvYSVvp8zZRKeNiJQLQfuNmg==
X-Received: by 2002:a17:906:7310:b0:9be:53ef:211d with SMTP id
 di16-20020a170906731000b009be53ef211dmr3340434ejc.72.1697634766801; 
 Wed, 18 Oct 2023 06:12:46 -0700 (PDT)
Received: from m1x-phil.lan (gyl59-h01-176-171-218-149.dsl.sta.abo.bbox.fr.
 [176.171.218.149]) by smtp.gmail.com with ESMTPSA id
 7-20020a17090602c700b009b97aa5a3aesm1689320ejk.34.2023.10.18.06.12.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Oct 2023 06:12:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/8] hw/pcmcia/pxa2xx: Do not open-code sysbus_create_simple()
Date: Wed, 18 Oct 2023 15:12:16 +0200
Message-ID: <20231018131220.84380-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018131220.84380-1-philmd@linaro.org>
References: <20231018131220.84380-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Q4qrvlsagwWg

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pcmcia/pxa2xx.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/pcmcia/pxa2xx.c b/hw/pcmcia/pxa2xx.c
index e7264feb45..a2ab96d749 100644
--- a/hw/pcmcia/pxa2xx.c
+++ b/hw/pcmcia/pxa2xx.c
@@ -141,13 +141,7 @@ static void pxa2xx_pcmcia_set_irq(void *opaque, int line, int level)
 PXA2xxPCMCIAState *pxa2xx_pcmcia_init(MemoryRegion *sysmem,
                                       hwaddr base)
 {
-    DeviceState *dev;
-
-    dev = qdev_new(TYPE_PXA2XX_PCMCIA);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-
-    return PXA2XX_PCMCIA(dev);
+    return PXA2XX_PCMCIA(sysbus_create_simple(TYPE_PXA2XX_PCMCIA, base, NULL));
 }
 
 static void pxa2xx_pcmcia_initfn(Object *obj)
-- 
2.41.0

