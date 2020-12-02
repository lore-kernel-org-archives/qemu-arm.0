Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1211142lfb;
        Wed, 2 Dec 2020 06:45:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXm0AOsuauKjR7J+GGDSvoPsCXqONKhpQiC+8+9amtugjArE1rhhMsfXGo9b2F1qmHSPVB
X-Received: by 2002:a25:da0f:: with SMTP id n15mr2996249ybf.481.1606920351577;
        Wed, 02 Dec 2020 06:45:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606920351; cv=none;
        d=google.com; s=arc-20160816;
        b=N/Xa2bTEcW6AvdAzEtw049512DRC6cGHyEVSCQeXd4EvAMAiG3r4gMu4W/eQ61/nQ+
         f1Airyc2S6C7yFLkt0hDaFYID8aUYtTC8Lr9wH1cJclAps71bfCEF5u+t/PJJgP769/0
         nFa1PkZ2GB5azltsQmuPciw4hDI6WCFUvbSo1wpvYiNmr5eyFtrvtaplaF7+9kOVDPd2
         3rZHfMNCbmMfxr5g3ULnQrvBkUMCsd7tU4GpR4JnZKd6jXh4BHd1iZc369ergw6SDT9T
         hujBCwjPZogyjDmy2nFw2YKcxYrTcMr3NNjGvDoOX5tmFD0GxRPqU/GVs/UYs61u8XBX
         xnKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=hjwNWt57Ej4U7zipruW3su4cFwClr7ZfkPb/UCNL6zk=;
        b=Z47YU5bhQrviaVGV3afAv1A9VninO6l54RYP0cIHG7uJdqy5q5hjrwsgefC7+J+N6p
         6WjEDXrfEqd7rpy04ct3p3jpPTbCUwYzevcWKNPfMMjjFZwHq10hH9Dai7vOUZDux0Bw
         diQ0ywVEeNOlToLGb2cTrhR60xhnDxFTDG6oSQiQB6CXKWkdHEuHrr0gicXuEhbFUQfE
         4bfTA0pUN/lF0dQkSOjEK9wowYTC1Ly+hoXYTwTPTsUGI4KRjZap33R9xmm986Wy6tSM
         v7KU2B3/89h5TFvEVOr8UuD5cEsELe8qxBZM9DC6gbAWqysng+ej/MpmawifIfegKf9N
         8UkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=UFW6uJhi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e18si2204702ybp.285.2020.12.02.06.45.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Dec 2020 06:45:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=UFW6uJhi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkTOA-0003d6-Uv
	for alex.bennee@linaro.org; Wed, 02 Dec 2020 09:45:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kkTO1-0003cV-MF; Wed, 02 Dec 2020 09:45:41 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:42345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kkTNz-0006Ls-Vd; Wed, 02 Dec 2020 09:45:41 -0500
Received: by mail-pl1-x641.google.com with SMTP id s2so1230356plr.9;
 Wed, 02 Dec 2020 06:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hjwNWt57Ej4U7zipruW3su4cFwClr7ZfkPb/UCNL6zk=;
 b=UFW6uJhi2Mwztjtz3suJeEeYxREgIsWs/uMlcnRNGJYDIWVLK9JmEXwstsqUaJoTlK
 xrKnOxNBjEC1LlKjH7VpwDFz8lqIkYh6MmeLdbK4VUtDFiEJL/78YXJvFl8ELwZ7D7pk
 +92Y5CGuUMQu7GCN6mVUI6YJEeV7d0Cjb9krj2Cr83ut1HYKDh9ZrjCXKD+Cp2Zkkkep
 O4D9AePXD0zM0mTsyxQeDUpfx3Itd7Rnq4RiC2JhulLkQ1rU36hJvjdnmrsCDp0/hivg
 GJP8ou0Tx/0xtyRofACF6f+qJPgoaBrFouYrCs5CZtcCpmAWCAyKKGbM3sCo2idj8FLZ
 3sjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hjwNWt57Ej4U7zipruW3su4cFwClr7ZfkPb/UCNL6zk=;
 b=iD+jTWra4uXzePFAgSgrPMw+VVDeJJdaMkLtp9gS828V5lCjGwKIwXAXDFUcytBRmx
 Kub4mbXQaUOCOQZ0v4OZXCzlUt21dNT39/vh6+JRhNVx73B/jdi1qucqk3XUG4zEsMgv
 bqQVldOgWTnnhcBQW6PCcLYKL6WJJWuvZZft2eaPrpGpTh6wrbRdYK5KWSsMwLfc2uMy
 qSr2ahXDnizkvPakeViSMPduliK2UxOvZMaMEjtcL5qsyiJ5eUjey82paM4qfnA4EfWR
 +uWtbR7rAm3VoN4cZWUZlPNZFb1W/4JQu+Y8TFgU4aodQRSja7k3/mW+/5R6QXgcAGyO
 MFiw==
X-Gm-Message-State: AOAM531IGxeGHBGB4aH9qdDjdJ0S96ASia8UeTPRmZ2r9aQQl4Wa4oLE
 jFEn/OsXsmvy6v95zVNwvUc=
X-Received: by 2002:a17:90a:9306:: with SMTP id p6mr233329pjo.50.1606920337819; 
 Wed, 02 Dec 2020 06:45:37 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id u6sm92367pfb.197.2020.12.02.06.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 06:45:37 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] hw/ssi: imx_spi: Use a macro for number of chip
 selects supported
Date: Wed,  2 Dec 2020 22:45:22 +0800
Message-Id: <20201202144523.24526-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x641.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1fziI8Xo9uYr

From: Bin Meng <bin.meng@windriver.com>

Avoid using a magic number (4) everywhere for the number of chip
selects supported.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 hw/ssi/imx_spi.c         | 4 ++--
 include/hw/ssi/imx_spi.h | 5 ++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index d8885ae454..e605049a21 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -361,7 +361,7 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
 
             /* We are in master mode */
 
-            for (i = 0; i < 4; i++) {
+            for (i = 0; i < ECSPI_NUM_CS; i++) {
                 qemu_set_irq(s->cs_lines[i],
                              i == imx_spi_selected_channel(s) ? 0 : 1);
             }
@@ -424,7 +424,7 @@ static void imx_spi_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
 
-    for (i = 0; i < 4; ++i) {
+    for (i = 0; i < ECSPI_NUM_CS; ++i) {
         sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->cs_lines[i]);
     }
 
diff --git a/include/hw/ssi/imx_spi.h b/include/hw/ssi/imx_spi.h
index b82b17f364..eeaf49bbac 100644
--- a/include/hw/ssi/imx_spi.h
+++ b/include/hw/ssi/imx_spi.h
@@ -77,6 +77,9 @@
 
 #define EXTRACT(value, name) extract32(value, name##_SHIFT, name##_LENGTH)
 
+/* number of chip selects supported */
+#define ECSPI_NUM_CS 4
+
 #define TYPE_IMX_SPI "imx.spi"
 OBJECT_DECLARE_SIMPLE_TYPE(IMXSPIState, IMX_SPI)
 
@@ -89,7 +92,7 @@ struct IMXSPIState {
 
     qemu_irq irq;
 
-    qemu_irq cs_lines[4];
+    qemu_irq cs_lines[ECSPI_NUM_CS];
 
     SSIBus *bus;
 
-- 
2.25.1

