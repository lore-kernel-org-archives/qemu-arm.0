Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4839391ejb;
        Fri, 30 Dec 2022 03:36:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuoTomN9c1e1YajwwCngjic64iuNaqpbHXHNFc+yfM2uiC6wwm4fAYcnZP6Wj7MDl0hbC54
X-Received: by 2002:ac8:44ca:0:b0:3a8:33:f873 with SMTP id b10-20020ac844ca000000b003a80033f873mr44606570qto.38.1672400191509;
        Fri, 30 Dec 2022 03:36:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672400191; cv=none;
        d=google.com; s=arc-20160816;
        b=Df78cYsJdG3if4KEwc7wTSjLF/OW6EpDdKJSp8NUmxlTL3uVnDWd93GNuTjHxvzS/L
         qH/+sbAD7oygignqsns8UnhhcvvWzOdC3Egmt2vXl/Wu7dwMyKlfTtX+xpXIgkRUFjQ5
         5+bZ9VzQjIb+LYmwyUFtxRJzcYPnLGoqbk8yNByfgq8/q4PAvHYSkou/z9DQ9kdr6lXw
         8nR02CyZAhCTx+x3y/30xzxgBc7ENXGO/lTad4e3jxonVp3LHQdKXOdyR8JZ6XDbbzEn
         6d8EUtMNDPcKKhmiOkwxbje0ne2gJciU3Z9yEXn47vBkgtvtkSVembWJjYfzxj+Go9RJ
         lF8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Iifc+3Al9YvWG0jFTBhIrUW5hx3TJ+e3zFqcRSlUTYY=;
        b=Z/tIYihpaoumF6twsWzoweEulEj2/qYKajI1JbW8jSu1vfN/547Zybip5LsYBA21Vn
         6Z+aVhkjhspd685XpupGCDDFpJ9X6GQZjjfNlERCwZxCfyRB1FBfFxO24NAv894MS6ev
         m7eNGHCnMNtiFqkPlT2w9dvHp5riKn1sV+Tr/5G5babRy7bHQSjmvG6aqzejWa6I0dBB
         gOh9sqBFlwcqwc7+tijgtoUTEZkKAk7ulTf2Wu5JwG629Za8k4oY9mMYtd9+gqLIT7Vz
         PkvlZh9XoNgRlwkzAg6T91nBYtXHhi7Nvmba6f0g3+oIu9EukjhJq+kHU65p9OC7JkR3
         AAKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WTu8RSaf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fy5-20020a05622a5a0500b003a814f2dc5esi10169817qtb.432.2022.12.30.03.36.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Dec 2022 03:36:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WTu8RSaf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pBDfz-0006TU-0z; Fri, 30 Dec 2022 06:35:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDfw-0006TC-EM
 for qemu-arm@nongnu.org; Fri, 30 Dec 2022 06:35:48 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDfu-0003vC-Ls
 for qemu-arm@nongnu.org; Fri, 30 Dec 2022 06:35:48 -0500
Received: by mail-wr1-x42b.google.com with SMTP id t15so10836534wro.9
 for <qemu-arm@nongnu.org>; Fri, 30 Dec 2022 03:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iifc+3Al9YvWG0jFTBhIrUW5hx3TJ+e3zFqcRSlUTYY=;
 b=WTu8RSafQqQCY9Q/UPq9gMnF+NNq8FiSNMn8VRjrGre5cQeuBBt0586qY2wc9ffIIs
 7+tAuxCNSq3bnrLKy0tAyqDbupdNZoJ2CFWOKTmFlR0bJO7/fCyQdKfmpzsBSrEoSfeP
 k5sZSUuIf0a9D8trQMuj1Wr+6DGJcCEeZkLVX/Z+oEBd/ZpZrmb+HCSBIiCgBV3SzX/o
 Xzph9xsRHbYz8pArxABJQg6P801Km48+My/9UnzPL3ByvXHQLG8eMsz5OXunui2WwbGb
 8rAnGQpuUUdC3oB5D5zzEO7k4S+l5d3L3iSyyyiuw0dE2KOfad4KgujeotFCPOu6yzkm
 PaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iifc+3Al9YvWG0jFTBhIrUW5hx3TJ+e3zFqcRSlUTYY=;
 b=7rK6d581L/weo41vgB7aHSjW0je1KRdjrsB7t3Zv1/yc7Oe0WUe6ZObJxE6qauz4h0
 e2cqba/ayjRsw5beWEpUrm/+p58mqAnXINTUpj8irv7OSHMla9YHKTnpiiEN7cjJuWxV
 wInUOnfqh0QOFziiyery3EROZOI4vhEaPao3LqDExM80nc+IUTzzXlx2wuNHpMNvB46i
 w6qzU5lmVnYoKBC7oS88VbkqTwU6omM22NJU7G9SWy2PJpALGIIc5pRUa0ALxmZ62Qr8
 FfWSxZspBd63HG8zLJZAUv6iv4oLL6Hv90/WMokS/eybzRqqVtR690h5WERNfre8QQfQ
 jSGA==
X-Gm-Message-State: AFqh2kry8F01xkPJs7fAoHKxGPTd6YO9picnLmbHlrUWP7WkIcdFaip6
 nbHw6mVYUfNAhF9pd9o2P4ZtXQ==
X-Received: by 2002:a5d:6545:0:b0:27f:4a7e:fc47 with SMTP id
 z5-20020a5d6545000000b0027f4a7efc47mr9588985wrv.67.1672400145411; 
 Fri, 30 Dec 2022 03:35:45 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m5-20020adfc585000000b00236488f62d6sm20838038wrg.79.2022.12.30.03.35.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 30 Dec 2022 03:35:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Peter Delevoryas <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH v2 07/11] hw/arm/aspeed_ast10x0: Map I3C peripheral
Date: Fri, 30 Dec 2022 12:35:00 +0100
Message-Id: <20221230113504.37032-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221230113504.37032-1-philmd@linaro.org>
References: <20221230113504.37032-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: VVFE/+mLj2ti

Since I don't have access to the datasheet, the relevant
values were found in:
https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/dts/arm/aspeed/ast10x0.dtsi

Reviewed-by: Peter Delevoryas <peter@pjd.dev>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed_ast10x0.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index d7dbc1a801..6c6d33d4a0 100644
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
+        /* The AST1030 I3C controller has one IRQ per bus. */
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i3c.devices[i]), 0, irq);
+    }
+
     /* PECI */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->peci), errp)) {
         return;
-- 
2.38.1

