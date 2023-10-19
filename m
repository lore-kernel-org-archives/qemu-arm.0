Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp503414ejb;
        Thu, 19 Oct 2023 06:11:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2mCBAq+9w4vmPNlk0D5U4lSpOdmZXcJATAIg6u5Y8aIisLa+XIu8PoXAWH1Tc37urotV9
X-Received: by 2002:adf:f8c6:0:b0:32d:a3c5:ea80 with SMTP id f6-20020adff8c6000000b0032da3c5ea80mr1672668wrq.51.1697721100358;
        Thu, 19 Oct 2023 06:11:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697721100; cv=none;
        d=google.com; s=arc-20160816;
        b=HiIC55eSBnW3m3Yz6tWVXHy/2UbwBMnlBLI4hCuiPeFwXd4LdHFAu8rHNki0iNStcm
         qCfvJhbDsBTCciTfUt8D6IM9FKUka2Wuf/OAigW/vi1FYpMPRMrUAAeEJKVBwYNu/sby
         XIlChwXUE0MmxwWrrWMx2zRvK4lw4Ow3HRnAJvCN3Z+YD4ohaMXFd63+GsFW4IX9NNrl
         8Jd/27CYkixPvWpy8kMJLrF8+A/VzImZJ//D4hUPleTu9Juo0TSNh+jiomCBANvIKW/m
         +gUWM/jzlTGPSbsHkortZZNhtKyD7oRuZUkwtiH9/5JNSjfeuDLwUUPP+iITH7ubEyly
         8fJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AJfJ06RDafLRLEOQTU58KKvhb0KtBRhLr9Bft9JesEY=;
        fh=rYBZhAJdgCvxZRRcO2tKw9iXjHkAG8ZfVdmqU/2KeAE=;
        b=B4DwaogD0oPsLwe7fT448B8Qt0YCr7BGjwKTLvzI7uKDfYp3Ca8Cce02Aozst1jIaW
         zKKskeQkXnNhVqyrHHiyUBdfPRmnlNwNXZhJU+U4OXNxQm8ZyI3p95gwHiT8ROYVF+Bp
         vKEfezErSmYRUndUS3tgMzR8+/eZ6x77sk+xJAX8eV819cvcR6TxWjk0yTBaOjaL7Fe3
         QdAVouNpo16yYX+0V2+AveG0qvZcXqsniC3JQ8kHk9IKQPYCD9OIaI3bSxeCwcii4YLq
         IZeYIqzpdzBixH1Nr+vVCouKNIEXf5L8wDu5z492ychof+ZCKplK7+ZsHf8/0Y5XfriF
         3o2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=myfnfk+7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6-20020a5d5266000000b0032d8da048c5si2600798wrc.445.2023.10.19.06.11.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 06:11:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=myfnfk+7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtSmt-00057X-3w; Thu, 19 Oct 2023 09:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtSmV-0004Mg-9J
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:09:51 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtSmT-0007QW-ED
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:09:42 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-407c3adef8eso23615865e9.2
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 06:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697720980; x=1698325780; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AJfJ06RDafLRLEOQTU58KKvhb0KtBRhLr9Bft9JesEY=;
 b=myfnfk+7mIjhUyLOgjIuqBOvgkunFxpV8p6QoSIsE90YbAFZjQFeoK3GFU26NwjV06
 qbbVM3Y/lNOsLMHMbW6EgVam7EM96pzXNc/0y3G2D6L/yadkU6sGiTiQBe56oglF4kPL
 KMtxYaXQfEFC7ONn6Myg2yu+FSRFgiwX7sfwKZI3BRyHJcH6aG/Zmr1nmxxWD4WmuGvJ
 do6UaeI3q0Mo5/sbk6XPEN37VLkys/rtv9X9T0atMXnoP2f1sM1YsM+8H5VAf4tZ01P/
 XyYqmQDxcHYaOmMBtZUVHZMkB6mlc2tNjxjxEF7CnslgO4YRXbUFh8WuqH/URYL77DrB
 Z7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697720980; x=1698325780;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AJfJ06RDafLRLEOQTU58KKvhb0KtBRhLr9Bft9JesEY=;
 b=v66gqIk5mOElwoea+dDAFHXEuPHrq/SZa28ulo4a4JUbCE5RnYsxrIsFT6rYcSZYPA
 yiBWBFckP2wui8axKqIL59ShK0s/xsaicF9BigqlOmtFoj1qxhnqxUGUy54Y2Z3IiFoe
 ieNYlbXwM7ZyLwZT7YnpcHMdoqZIPxwyi+nE/dOcgQ7BsGTed28bRbAY7FvfA8zrFkJu
 F1/YakjEEoCuJIgBqSFv2J3s1UEQQUFDZZTWlkdYLF6Cq9CQ5yWSanEizjz4l32tH5M7
 Efx2vRG5Oe1rYB/T8r66BYVnT/GDaVK1BvSAxSR++ESmSruGbVRhk+IzYemg/qwU1dLf
 a5oQ==
X-Gm-Message-State: AOJu0YxY5dMt2pKrK4TE1MPvVQkIZME49yG19Bn0RUSJGI6r0jeCWw0z
 uXWAi01rXM+8BvXjxXwmwwLSNw==
X-Received: by 2002:a05:600c:3591:b0:405:375d:b860 with SMTP id
 p17-20020a05600c359100b00405375db860mr1884089wmq.21.1697720979709; 
 Thu, 19 Oct 2023 06:09:39 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 l32-20020a05600c1d2000b00402f713c56esm4494647wms.2.2023.10.19.06.09.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 06:09:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/9] hw/sd/pxa2xx: Do not open-code sysbus_create_simple()
Date: Thu, 19 Oct 2023 15:09:17 +0200
Message-ID: <20231019130925.18744-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019130925.18744-1-philmd@linaro.org>
References: <20231019130925.18744-1-philmd@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: NLcrCvAN/Ify

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/pxa2xx_mmci.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 9f7a880bac..4749e935d8 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -479,13 +479,8 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
                 qemu_irq irq, qemu_irq rx_dma, qemu_irq tx_dma)
 {
     DeviceState *dev;
-    SysBusDevice *sbd;
 
-    dev = qdev_new(TYPE_PXA2XX_MMCI);
-    sbd = SYS_BUS_DEVICE(dev);
-    sysbus_realize_and_unref(sbd, &error_fatal);
-    sysbus_mmio_map(sbd, 0, base);
-    sysbus_connect_irq(sbd, 0, irq);
+    dev = sysbus_create_simple(TYPE_PXA2XX_MMCI, base, irq);
     qdev_connect_gpio_out_named(dev, "rx-dma", 0, rx_dma);
     qdev_connect_gpio_out_named(dev, "tx-dma", 0, tx_dma);
 
-- 
2.41.0

