Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1204426ejb;
        Fri, 20 Oct 2023 06:03:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvhW/fPx7t6m1Now97VVZ1LJnDRB5e829obn1zXs6eJiUKxTGDhOluHxPo8jvbTLpM9tiL
X-Received: by 2002:ad4:5aa3:0:b0:66d:6526:d605 with SMTP id u3-20020ad45aa3000000b0066d6526d605mr2285681qvg.63.1697807033114;
        Fri, 20 Oct 2023 06:03:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697807033; cv=none;
        d=google.com; s=arc-20160816;
        b=YTK2azwzhFg5rqMNggujfifbwGKocUGJknmXmLKlBmnqXHNG0eR2z/iW+n02CKW+0F
         nb0yMkPHyXtqXXKcYodANFAOmuuB4FpF5F5LTM1CyvmK+HRG/28OT6HfhxpT48BjW2tf
         vG36GvGnwbNRuqAAONUfXXR4MrahXPvO+Q+txM2tK0H7WWzjNIJYw6dJG410xnTxLMST
         ShTShxTwMpmq5WZOYoRHW0VEsuTT8I6ROEy2H/KpBT0OXzS3hpXs+5mkmf+f7OY3FkS3
         mMrjnlVBB1yKyhLcoyqr5Tf+NRfKWW6ehPshePJOTRYbzV/yaj2igFS11qLolSdNpSWb
         BsZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=j7mClc/LVpV4WxhBVsV429+V8CLaLMPjHNY4x1KwfS4=;
        fh=QWGggua+3ufs1S3QlzhTWcDhlhc7bBCtXi/Y+/UuB8A=;
        b=F1aGEmg3lo+S74DIUpBXYKzQh3Q9vm+WKjTF9ei9SCS53ckOTIrVlAQ1jWa8qX5Tbz
         2qrzl8qBAtSPXkO3YH8+dKZU/nnyevcFMZ/xCfVQ8vL3TjBM2AdaItxp8LFfgETwlS7u
         +I20Ky97N6PUn6fBgQJAE9/U/9hG4Zh9MtJ1hUx6nb9GKu/Omf8Pss/UfjjBMgaqDaMw
         C77c09iE5Bs8SOfc8ihHBxYhgvNOnEazovSVdKkYePT3bV+sRrINKPuzUGa0fPTQfzGe
         Upc9V8HqlQcBp/BQyg9fW+Z1g0Fiw++mlyJaILBekWXKaiW9nik5ucK/VMUKCN/bovF/
         Mzvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F26q20g1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id mu8-20020a056214328800b0066d12ac2600si1384416qvb.158.2023.10.20.06.03.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 06:03:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F26q20g1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtpAJ-0000FK-Os; Fri, 20 Oct 2023 09:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtpAG-0000Ej-6Z
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 09:03:44 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtpAD-0005Fc-O6
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 09:03:43 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-53de0d1dc46so1164327a12.3
 for <qemu-arm@nongnu.org>; Fri, 20 Oct 2023 06:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697807020; x=1698411820; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j7mClc/LVpV4WxhBVsV429+V8CLaLMPjHNY4x1KwfS4=;
 b=F26q20g1TgPUCF56MHKXbOwhTHzuhOBmxQ8CZdXZhKODaqrC66aYi8bSQR0/ZFoKMT
 um4l5dcYdyr/hnuBrO30prSEW5M3u1rJSlBXzPGWvTNtjXvhuoAfFQdJjbhc9tV3GoYW
 FHQSAhTrMtRmO9W0V9GUGvFE45x4i6uJf/J4QNX56nZOgPZ3E1/72cvjB3YNmqueP35Q
 KNa6CqHNXvHY9a4tFcZD1cJ6WnZqK9RL1ccZGccxpo3atjG46KgrNUlHqOftvWxBYSch
 WYatl4vnNM06C9qSvGE473V9Gbi+rozL6hpNrIt1VSreBgMe2RhUw+WK4CwhSyQf+t0t
 j4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697807020; x=1698411820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j7mClc/LVpV4WxhBVsV429+V8CLaLMPjHNY4x1KwfS4=;
 b=N5xmqRuXN3+ptVDD0xjlGjIBgSAorXfgvpT3L4dUgp5m1P6/TGCGdRqosDkdvG5iKk
 t6t8rFoKEqtI7e+xkMjPXlVi3hnf2wcg6wEo+fOhDk9T9z+OIBqz/SCxGafy1blbS0+X
 VCZqWGo57zru0N4f1E+RltkcCWP7OvhQ3MyyB9he3fGSx5RuWOKPjIeHyO+K5B+xPPj4
 1p8m+FT+JOlrvqdIpz526tXjHfMhh5GkAcTUopDS5HOewMngj22ar+8F42owO02GGpCu
 p5R7Bc9EN/5MfGOitkp5gVn3qyKE9AX9iT+dg6CBSThBoeo1f6vZgYuodkuII6sOri+s
 HqLQ==
X-Gm-Message-State: AOJu0YzhFna3EZichUMnkR8w4Zp/WfOVZAm190eXsUOwB5J8d9b+QBUV
 b116pOClYZXJHlc3OKVf245KEQ==
X-Received: by 2002:a17:907:26c9:b0:9c6:287d:c59d with SMTP id
 bp9-20020a17090726c900b009c6287dc59dmr1485002ejc.28.1697807019858; 
 Fri, 20 Oct 2023 06:03:39 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 f26-20020a170906085a00b009ad8796a6aesm1454419ejd.56.2023.10.20.06.03.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Oct 2023 06:03:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 1/9] hw/sd/pxa2xx: Realize sysbus device before accessing it
Date: Fri, 20 Oct 2023 15:03:22 +0200
Message-ID: <20231020130331.50048-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020130331.50048-1-philmd@linaro.org>
References: <20231020130331.50048-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: dLn8fNXrJVCt

sysbus_mmio_map() and sysbus_connect_irq() should not be
called on unrealized device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/sd/pxa2xx_mmci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 124fbf8bbd..9f7a880bac 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -483,11 +483,11 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
 
     dev = qdev_new(TYPE_PXA2XX_MMCI);
     sbd = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(sbd, &error_fatal);
     sysbus_mmio_map(sbd, 0, base);
     sysbus_connect_irq(sbd, 0, irq);
     qdev_connect_gpio_out_named(dev, "rx-dma", 0, rx_dma);
     qdev_connect_gpio_out_named(dev, "tx-dma", 0, tx_dma);
-    sysbus_realize_and_unref(sbd, &error_fatal);
 
     return PXA2XX_MMCI(dev);
 }
-- 
2.41.0

