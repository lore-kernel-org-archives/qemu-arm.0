Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4326763ejb;
        Thu, 29 Dec 2022 07:24:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsVUOp6Lj768+jNNtgXXEYJMPeCsPNdNKjYhDcrKZ4JpI0+yyc/BRNOA1zkH+erp6r9LAZI
X-Received: by 2002:a05:6214:3684:b0:51d:e450:c00e with SMTP id nl4-20020a056214368400b0051de450c00emr36811748qvb.31.1672327479549;
        Thu, 29 Dec 2022 07:24:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672327479; cv=none;
        d=google.com; s=arc-20160816;
        b=JJixhNJE9TX3o7eyyFuRFZHWErsw7lkIVTQqyJh8VeTcD/+8R9qdIGOn6aG8kh22Bv
         dr7v7E6TlKC6pEYQJqGNw5SSu1JXhBiNG/bwUweEaxHQPxOtAlJ1f8/jdEtkZiZ98eax
         0UFnUff4fbQRMSxtJ7IwCUzzqPqU4/c8eSk6RQ0sm8KZAHd4KWD2D3zujXOhuSMG5Q59
         AfCV3T3NBU+ZFIq8m9zUSmWQu4MDK+NU8fEyS7lK4//QP/ctV4RO8s/7wDKB4LIG4/C1
         3pxFdWv92eSF+unuRbl6VDNCDei/A1T8UsJnhP1620ctSWyYbXdwYbwHy4lmqElc10x/
         /mHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Wtm2mfHrpS5K/nDn4meqp35AVTYNEJHCIxdRSmJIby4=;
        b=UaEa0+romJpc52N4bLo5Dn3nyUMAn1+2ugISQo33P3r3hl8xbcMrcYh3Un3TU8CNKQ
         WMUa4OqTPiIoyD4vcBI882q1ZsVv37JlYmDvtqcNjzwAKqlsArXW3YwFh/eKUZLD0L5+
         s1K1ePeE2mwpqLzlm+uXMzIBgoVun2AYn6DY1tvsO58FH3xQBchbufs8lghLbiNq4JCo
         nL7KdJ1ztKLMMSjtpvOiKyxj1dULoCiTpmooF+QD+a4XzaOXyNXSQOqhrdHo8GEWLUOm
         A0zYS1KvS22ideNUba64uwyhg2UyxYNiGmtCnUtC+ilWpJ0Ln7fvvk3sHT4LQxmTyz9l
         A9RA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IkQ+oIug;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ow25-20020a05620a821900b006ce1a0968eesi8309956qkn.663.2022.12.29.07.24.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Dec 2022 07:24:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IkQ+oIug;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pAul8-0001Hg-S4; Thu, 29 Dec 2022 10:23:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAul7-0001HM-Sg
 for qemu-arm@nongnu.org; Thu, 29 Dec 2022 10:23:53 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAul6-0007sy-2B
 for qemu-arm@nongnu.org; Thu, 29 Dec 2022 10:23:53 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so16559796wma.1
 for <qemu-arm@nongnu.org>; Thu, 29 Dec 2022 07:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wtm2mfHrpS5K/nDn4meqp35AVTYNEJHCIxdRSmJIby4=;
 b=IkQ+oIugBj46dyLFu0+B1vV7hQw3FaQFHkfDXiwco3j3yRjbfjtW7hI4/I7qBSXPyp
 MjBNXIgunhARfqMKygIgQC6be5XFFM+oRJMbsh7bOWuJBNGaAy802OYOrBXQTOd/e5/V
 LnarijKPjZgyd7Q9jivb70xv/wfrVw4YUYMdoOBM8o26b7jax+/lryAsqGmytGt0nYP7
 ftMlbs+LUU7R0iNVYtuSZ2OwvQvkX8t99VpCTpcOfU3BtViTVbDRLHatbDNlKUTyPMDE
 SrTLa+l1B4aLevx3f18LGXmamHgAc7ws7Ma09UW+3DQSpjS8nwHs2JhA5u+gnQBDTum6
 Z4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wtm2mfHrpS5K/nDn4meqp35AVTYNEJHCIxdRSmJIby4=;
 b=dc6UHMZKh985eJgITQGnyy+yfxRamdfR42Hcjd+WDGoQHlDjGPxxs2SvzAIKBq2OnH
 IIiqGX3CLbpsqq8ZcY5QsIbcC3AzPt72iTg1iqeMRgKxnCCwyTcXa8TBzezeIC7cSQaJ
 xRpvQ3IpaU+HIhIEAHLcpwr0EQKhjTqz2VLXo5PS6TPYyHNl+yq1fjsCtlgFpMnK7+8s
 +fZFLHdKEJOcCrxDsnNqdOGq4Un2fZYXO2i5ZHXCvLPhiHwAJGs7A3jFVWgOm2VVh1Z6
 HJwuwR0tZBuAMO5duYZmPHnbGHbdy/L46c1a7SeGcNyMzAiEdLALSEhFf0GNxJWsAk53
 332g==
X-Gm-Message-State: AFqh2koaIn42efFSVVu6/tqQozeSPPQ5ImNNhiGgMO1+L1xXCxfV2abR
 5of3/KqbOI+w3KlZ2BIIMuFcezNdGHnyu94I
X-Received: by 2002:a05:600c:1e18:b0:3d2:5e4e:701 with SMTP id
 ay24-20020a05600c1e1800b003d25e4e0701mr20264466wmb.31.1672327430750; 
 Thu, 29 Dec 2022 07:23:50 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a5d4fca000000b00281eab50380sm9641905wrw.117.2022.12.29.07.23.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Dec 2022 07:23:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>, Peter Delevoryas <peter@pjd.dev>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH 4/9] hw/arm/aspeed_ast10x0: Map I3C peripheral
Date: Thu, 29 Dec 2022 16:23:20 +0100
Message-Id: <20221229152325.32041-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221229152325.32041-1-philmd@linaro.org>
References: <20221229152325.32041-1-philmd@linaro.org>
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
X-TUID: 1KjEY/JHDwz7

Since I don't have access to the datasheet, the relevant
values were found in:
https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/dts/arm/aspeed/ast10x0.dtsi

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed_ast10x0.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index d7dbc1a801..53ea6d471f 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -54,6 +54,7 @@ static const hwaddr aspeed_soc_ast1030_memmap[] = {
     [ASPEED_DEV_WDT]       = 0x7E785000,
     [ASPEED_DEV_LPC]       = 0x7E789000,
     [ASPEED_DEV_PECI]      = 0x7E78B000,
+    [ASPEED_DEV_I3C]       = 0x7E7A0000,
     [ASPEED_DEV_I2C]       = 0x7E7B0000,
 };
 
@@ -89,6 +90,7 @@ static const int aspeed_soc_ast1030_irqmap[] = {
     [ASPEED_DEV_ADC]       = 46,
     [ASPEED_DEV_SPI1]      = 65,
     [ASPEED_DEV_SPI2]      = 66,
+    [ASPEED_DEV_I3C]       = 102, /* 102 -> 105 */
     [ASPEED_DEV_I2C]       = 110, /* 110 ~ 123 */
     [ASPEED_DEV_KCS]       = 138, /* 138 -> 142 */
     [ASPEED_DEV_UDC]       = 9,
@@ -130,6 +132,8 @@ static void aspeed_soc_ast1030_init(Object *obj)
     snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
     object_initialize_child(obj, "i2c", &s->i2c, typename);
 
+    object_initialize_child(obj, "i3c", &s->i3c, TYPE_ASPEED_I3C);
+
     snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
     object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
 
@@ -240,6 +244,18 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c.busses[i]), 0, irq);
     }
 
+    /* I3C */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i3c), errp)) {
+        return;
+    }
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->i3c), 0, sc->memmap[ASPEED_DEV_I3C]);
+    for (i = 0; i < ASPEED_I3C_NR_DEVICES; i++) {
+        qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->armv7m),
+                                        sc->irqmap[ASPEED_DEV_I3C] + i);
+        /* The AST1030 I2C controller has one IRQ per bus. */
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i3c.devices[i]), 0, irq);
+    }
+
     /* PECI */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->peci), errp)) {
         return;
-- 
2.38.1

