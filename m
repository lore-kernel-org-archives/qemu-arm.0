Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1206619ejb;
        Fri, 20 Oct 2023 06:06:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIB7DyxeaNVKJJ0Prs3mAxua+vgrBrd53nbCH5Mx5g9GDpQ8skT5VoUA1f2iytw+/qCg0Y
X-Received: by 2002:a05:620a:1328:b0:778:99a0:d105 with SMTP id p8-20020a05620a132800b0077899a0d105mr1742661qkj.23.1697807172683;
        Fri, 20 Oct 2023 06:06:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697807172; cv=none;
        d=google.com; s=arc-20160816;
        b=giRDijonMmLJIDt8qxOyrio0TK+tVQhBxxyO7VBtTGgvKqYlf7peMMP4DKHwCLNmpI
         na3lchzu6oxDQzoqk2AyyNTuE42PR7mheRe7beuqfMzX1vecPekE8dw3XslIX8H5xpAW
         BX5jrL1kN+/cniP6JjXIGC/VT0fG8/vz0Ijohh6sbf7ugCd+qnAv509zdlFRmSgsDdMa
         j1GSIdnNZ5p2FVK8r7COBzDLwb4eA67xCgcMjWJEZJJrzQyano6mnnVW9EEalbogCdwP
         p+0u1fNV/LyKK/aP9qhBZGdj/Y7d+E/lclX+VzK/NPmksOyowy9VGiqcRUuuaIPbWHh+
         6c8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qVpVhfYsMArn5+3t2ZWXwVgzj4H5ByX4fZEF0dWkMj4=;
        fh=QWGggua+3ufs1S3QlzhTWcDhlhc7bBCtXi/Y+/UuB8A=;
        b=G02iWWP1kxy9dJfYDYXwJ0ulEoh8d3mzC0N7pMqDjN4x1dZdtOGT8AcTwm/Iddb6ZU
         u+HumIA9h69w+vAp9fhRJVeJVUsxdVrzcqREDHZrfUSVBO3z3OWHkq/C0E81T4XEDpRW
         3/FxY7TrVQ+3UH1meqv+/pzfdE2dZNjVlXWtPKT7mTafCrk84qoiwLFOYB+k+YzKmkni
         aviHU1+010I6lET41RmV6AbGWd9P3wca3TC8ZyOAP75UGb7tdfsKXh2X0k8nU842rI0P
         VrtRwtmfdNrMII0v5/6r6u09SBq4clWojP3ZsADcj7eKgPZg6EvLW0UrXIOpQXUN91bK
         Yj1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pDh492T0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13-20020a37c40d000000b007770bfc26d8si1264062qki.39.2023.10.20.06.06.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 06:06:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pDh492T0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtpAt-00019f-5p; Fri, 20 Oct 2023 09:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtpAZ-0000hL-QR
 for qemu-devel@nongnu.org; Fri, 20 Oct 2023 09:04:10 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtpAX-0005K4-SB
 for qemu-devel@nongnu.org; Fri, 20 Oct 2023 09:04:03 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9b96c3b4be4so121593266b.1
 for <qemu-devel@nongnu.org>; Fri, 20 Oct 2023 06:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697807038; x=1698411838; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qVpVhfYsMArn5+3t2ZWXwVgzj4H5ByX4fZEF0dWkMj4=;
 b=pDh492T0LIHfqyFWzMWdCkOe2e5VCyI6wjvYCJ1hnXWIQzVhBvHoi4OhSjtyO0NZXy
 xwi2tUgYe+PZETFDCKjCgKNIpRrdA528KnQqUKB3B0WDdi+fbIDuBjIQ68P7z1yxSKZR
 51nUQpL0KwnZALAi3NStibBptq3T6L8jGXhN0cye6UIxDUq8T+KgjRWSstc7Tp/srljR
 kb+hr94b4xl4SkjuZtNIjK7VFzYYZXZwD3Y7KLELxnL6d2GU9D+nMhueThiiiIcCqWGH
 YaPBvSJ2oPYpTCkl3ILjXNPoU1+IOoGErLOupU1brNWw48kpzQ5EJPZbamxEb3CdYUvy
 8BBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697807038; x=1698411838;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qVpVhfYsMArn5+3t2ZWXwVgzj4H5ByX4fZEF0dWkMj4=;
 b=b6+qXp0l36ceJYXeeEdQPVnWQQXGXt5vgFmgp3xJVU9NFiDv/c+yY3Oem0kvWUqiqb
 JsLh7xTNz8pMBvaGvdymER4gJsrb/bHgrGK0zhlk1tARuFShgCp5g7mK2VizpJb7hodR
 lbwUla2MSRPlYcUZropJvVs/sWuhAsNWckZblZL7IoMnilHgsJa7zk1ROnOGKlsJg750
 jxc67m60Hd+Dg451iqyDT8WxtyMHZzCbFjBiYbCi9ElozKXHv916gYJRUctETGVAeIP9
 6lQte6/pRO3zQHJcZod+9R0KEh9fJKwP3iaSXwByl99t+rJCGiK50iVp5G2/JwkZ8p6y
 b1iw==
X-Gm-Message-State: AOJu0Yx5kw5pNZ0Dc0LtbywCR7v+FK6wKpvqbX7r01oPjmdhzrm11xN8
 rAhUzbMLQ9YiOzWaQUDukTJlObg979fzQbkHCSM=
X-Received: by 2002:a17:906:d555:b0:9be:fc31:8cd4 with SMTP id
 cr21-20020a170906d55500b009befc318cd4mr1556257ejc.18.1697807037847; 
 Fri, 20 Oct 2023 06:03:57 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 my18-20020a1709065a5200b009a9fbeb15f5sm1447874ejc.46.2023.10.20.06.03.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Oct 2023 06:03:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 4/9] hw/pcmcia/pxa2xx: Do not open-code
 sysbus_create_simple()
Date: Fri, 20 Oct 2023 15:03:25 +0200
Message-ID: <20231020130331.50048-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020130331.50048-1-philmd@linaro.org>
References: <20231020130331.50048-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Nl/0tDgFcTfr

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pcmcia/pxa2xx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/pcmcia/pxa2xx.c b/hw/pcmcia/pxa2xx.c
index e7264feb45..3d512a292c 100644
--- a/hw/pcmcia/pxa2xx.c
+++ b/hw/pcmcia/pxa2xx.c
@@ -143,9 +143,7 @@ PXA2xxPCMCIAState *pxa2xx_pcmcia_init(MemoryRegion *sysmem,
 {
     DeviceState *dev;
 
-    dev = qdev_new(TYPE_PXA2XX_PCMCIA);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
+    dev = sysbus_create_simple(TYPE_PXA2XX_PCMCIA, base, NULL);
 
     return PXA2XX_PCMCIA(dev);
 }
-- 
2.41.0

