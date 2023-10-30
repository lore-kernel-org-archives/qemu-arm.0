Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1715819ejc;
        Mon, 30 Oct 2023 01:37:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENbcI6tCojnmJmiCsEkC/wt/F9BojcB6g5ER3j0FLFDyAjvPTKzwAfdK3TFkRRtJPW/Lhj
X-Received: by 2002:a05:6214:2b9e:b0:672:5946:ffd2 with SMTP id kr30-20020a0562142b9e00b006725946ffd2mr3264047qvb.30.1698655062670;
        Mon, 30 Oct 2023 01:37:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698655062; cv=none;
        d=google.com; s=arc-20160816;
        b=WsRZb8DM4R36rpWys6+d+pRuZ6Jk3enKk0jrbivpxwBT4BUpomOQgpv2Cnv4eSUVja
         emruyFVmwgGNJ86+EkV7LlcX3HyFb+st4+YKb+vL8GmNaIu6vauUZQOu20pvM3m6U0Ga
         Qdqd9+R5vd9FMJlFocjoEU/Eo+1S0NjmX8gQgGEV+cATRTydt0wH2EPNqAkjvNwp5Tc9
         prrciHtE6YETckUnzroIklplKXI9N8DtJrFutb7CZgJSSS7c6iZMdmTLHfxeIPiX07zN
         VCIlo5HwKOs21sBC7marMtoR62Q9I2KmHJK9AxXGCBT3rzsQMU/2LlWZDdsFnxxwlTc6
         OK9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=vzmvmyVQ+oA867Qws9NF2zxwyLsLq34rfuCOG7/GxcY=;
        fh=Uq4CCH4qgIScoA1ZlzK6h1LD8Rw6xac8JtYTs6G5zlc=;
        b=Bxw6PAo09uhnDohWqLOXGHLlxdsXkoKdjGHYGN0C7PUGCZ8NYLAQyVqv+mE9arm45M
         cBkYWB6lP+8C3C0vzssVCsclavBu1J9dU58QabBRFr9lu/PSaxx8G/dKlCSx5Osrtpmp
         LBGARt4rWMPUpc6cMMaDaAR3jFocLeSsaRywTrx0TAwnxjM7hnn4ehgZXpe28CvUZDKk
         dwyGO8DtbOmowWmwzevqX+r3BTEDdn/szQKCV8V87jBIJ23eBatZs+jAFXSw256wiOr2
         ZcfX2HaqkTvpA6aHCiZYs95ABmjtx9WUXwPtQvQ9GKxvnHLfOkcKhRBfYcrEZ081QAPK
         ynyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=quAwy3hX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c22-20020a05622a025600b004181ae1bc43si5490251qtx.543.2023.10.30.01.37.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 01:37:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=quAwy3hX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxNlt-0005Ni-IW; Mon, 30 Oct 2023 04:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxNlr-0005N8-6I
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 04:37:15 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxNlo-0004F2-VF
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 04:37:14 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9be3b66f254so616312366b.3
 for <qemu-arm@nongnu.org>; Mon, 30 Oct 2023 01:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698655029; x=1699259829; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vzmvmyVQ+oA867Qws9NF2zxwyLsLq34rfuCOG7/GxcY=;
 b=quAwy3hX86F6NqV1CcRde3wQdSkkVIsY3DYvNTACZxBcMqNctKAqvTc7UpKPspe+cB
 uYxV2qxYA1QCPWTJt69fjfjg6No4aUOBlI7t8T/wFKpleC3365kdoNAJwnLjiVM0SHZI
 3B0/FvsghH8ieVs9Oa1bjZWEvzlEtCfu/4doJnGCiPNx8J2XgNOGgDN7AyHew2bcheBW
 /82aG2V2eTFYeWRjyyeIsDwrqAVklMvK37wDLOwysE3W6DqcEqo9Wz1/xspbSFSuCiwD
 tLATiP03tPJQ6L0xIIoXEkTH4ITgoutqvfdJq1EszQqtNwqB5oIHZy1Tefa/8Qpy1Tg2
 l8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698655029; x=1699259829;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vzmvmyVQ+oA867Qws9NF2zxwyLsLq34rfuCOG7/GxcY=;
 b=I1cFvngMDNIOBaLupz8otRG/GzgkxYHYB8E5h09ifnEKUF99vGhFqOz0VVgc1TvlfP
 q3nM56MonHk70fld6VXcZ4KeBEESLlH9KsKUhpkcGbysZtcJedcVc56qgAjcbDjXKgsl
 NNzWRWHGD8rpSbGAG7LcQrtrf4/hnx/JFPbi6Z8RrX6aWGj4taOjGWyKdoerT62mhXqZ
 A8vfsLxFdOZrZMysywphzCT5+m/l9azryNRt1eHh5kXOyN84B+JoFR8b8jHZroa8mvwu
 MDM3XmmCnBJDVTrqqmqELI5viZ66L/MqYzeUQXpjDcn8pXl/imVX2ofqiCAD9yfYVsAi
 GshA==
X-Gm-Message-State: AOJu0YxPIwJK5JyaugtV1yF97d88ZyED9co9rBChjIXRcMgIVEj77sV4
 OHPdDgRMSJTb5+96yQ6zpPhE+AOO3XSeNmKjCtQ=
X-Received: by 2002:a17:907:7ba1:b0:9b7:37de:601a with SMTP id
 ne33-20020a1709077ba100b009b737de601amr8044179ejc.49.1698655029305; 
 Mon, 30 Oct 2023 01:37:09 -0700 (PDT)
Received: from m1x-phil.lan ([176.170.212.50])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a1709062b4e00b00988e953a586sm5627636ejg.61.2023.10.30.01.37.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 Oct 2023 01:37:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/arm/pxa2xx_gpio: Pass CPU using QOM link property
Date: Mon, 30 Oct 2023 09:37:05 +0100
Message-ID: <20231030083706.63685-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
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
X-TUID: TogQRi1bxmpc

Instead of passing the CPU index and resolving it,
use a QOM link to directly pass the CPU.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/pxa2xx_gpio.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/arm/pxa2xx_gpio.c b/hw/arm/pxa2xx_gpio.c
index e7c3d99224..c8db5e8e2b 100644
--- a/hw/arm/pxa2xx_gpio.c
+++ b/hw/arm/pxa2xx_gpio.c
@@ -32,7 +32,6 @@ struct PXA2xxGPIOInfo {
     MemoryRegion iomem;
     qemu_irq irq0, irq1, irqX;
     int lines;
-    int ncpu;
     ARMCPU *cpu;
 
     /* XXX: GNU C vectors are more suitable */
@@ -266,12 +265,11 @@ static const MemoryRegionOps pxa_gpio_ops = {
 DeviceState *pxa2xx_gpio_init(hwaddr base,
                               ARMCPU *cpu, DeviceState *pic, int lines)
 {
-    CPUState *cs = CPU(cpu);
     DeviceState *dev;
 
     dev = qdev_new(TYPE_PXA2XX_GPIO);
     qdev_prop_set_int32(dev, "lines", lines);
-    qdev_prop_set_int32(dev, "ncpu", cs->cpu_index);
+    object_property_set_link(OBJECT(dev), "cpu", OBJECT(cpu), &error_abort);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
@@ -303,8 +301,6 @@ static void pxa2xx_gpio_realize(DeviceState *dev, Error **errp)
 {
     PXA2xxGPIOInfo *s = PXA2XX_GPIO(dev);
 
-    s->cpu = ARM_CPU(qemu_get_cpu(s->ncpu));
-
     qdev_init_gpio_in(dev, pxa2xx_gpio_set, s->lines);
     qdev_init_gpio_out(dev, s->handler, s->lines);
 }
@@ -339,7 +335,7 @@ static const VMStateDescription vmstate_pxa2xx_gpio_regs = {
 
 static Property pxa2xx_gpio_properties[] = {
     DEFINE_PROP_INT32("lines", PXA2xxGPIOInfo, lines, 0),
-    DEFINE_PROP_INT32("ncpu", PXA2xxGPIOInfo, ncpu, 0),
+    DEFINE_PROP_LINK("cpu", PXA2xxGPIOInfo, cpu, TYPE_ARM_CPU, ARMCPU *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.41.0

