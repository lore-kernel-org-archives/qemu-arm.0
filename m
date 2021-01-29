Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1122620lfo;
        Fri, 29 Jan 2021 05:24:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcORUlJWw/meEb3Fm1oUCZ78plsaQSrkna5EmtdPNRU/p6VoOTxQ+/E1tzS183RcwdaUrY
X-Received: by 2002:a25:bf8a:: with SMTP id l10mr6473885ybk.262.1611926667232;
        Fri, 29 Jan 2021 05:24:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611926667; cv=none;
        d=google.com; s=arc-20160816;
        b=MQ4Mofd2svesS6v+we/SjUz5zlrh5wTHH79sC0cCS1iRO86ocTpXHDQGSmM6hdBv6Z
         JmHSTCQWIKt3hF7cZ9ZKuZ7wvQbHweHeknGvwoc9PW7ovztVfOmdKN6cYEVwEM1cO33R
         AmbkSdKuIO2kXY6a+zbAq4S9gLuqWciatlYMy3wpiPaduGSmHNur+Tv1WsywWBm1I04m
         rg42scWG3veJkYN/sg8xGWpy9NXh9y98pKVl8EREFW/y0fYIPQ0tZMF78gR+lnjrzW6d
         /c4UV7SvM/kU0tibBdk/lDYcYdMgonKuLxY1DIJv99uqpd55O9+xniXTSFfiPFPHG/RS
         0DAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kkLTOezkfKdPVe5VTO0yLce91pnJrqvoONkhLftQoZk=;
        b=aUwdqJLBlpGZfSShmPRKnTu2L6X67X35Trir4+Tq+snILxaPzq3KIBxqWj4aqi8ODW
         NH24ojmULj5QmS4ygBhLJlV40Sy727pUmmMPB5JQGEXeN2WtTNKrpsGl7d/07GjFDsL5
         w5bjn/QTblujOy8PQSNaDSATmjEQ/ZvgZeJ7kK9bJJpHbQE7Sos7PePICIkvPUNbVaxI
         zd+3oCMhzQUVJfYgh7ogZNqqMeI0CefseB4IQzbc9lHgdVlMTkFT5qO/B1Mgqltg1W7A
         YxfCeN9WKgBjLbyvOiQ7FUPdZq6TlsiaA+2neXafioKeGoidFFI4V7XXl1XN/3wnPHN7
         OneA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=eqEG4lbq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p197si10173013ybc.249.2021.01.29.05.24.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jan 2021 05:24:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=eqEG4lbq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5TlC-0003af-KH
	for alex.bennee@linaro.org; Fri, 29 Jan 2021 08:24:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5Tkg-0003ZY-Te; Fri, 29 Jan 2021 08:23:54 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:46423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5Tkf-0007sb-Cb; Fri, 29 Jan 2021 08:23:54 -0500
Received: by mail-pf1-x42a.google.com with SMTP id f63so6209806pfa.13;
 Fri, 29 Jan 2021 05:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kkLTOezkfKdPVe5VTO0yLce91pnJrqvoONkhLftQoZk=;
 b=eqEG4lbqJhLaCZLhPB91Aun/2c7Ahu1Agy2+z9p4cSbVDMViJJBZyR0BU9MsExrKwS
 v9n8skX2ZvtNqDMOWxMoN9iMbo1TwL1PQy3wt1d4ODxQjzo3Rn3V1Rf+7Qsgn0OtDJbR
 wt+FdK9K5B83+NOMFArOHh26vLPEOrr7e1JgX5iYGkR3qgfslsFORW8XeMzU2x8pGQZa
 7xjSkimBdIfc4ncU0aDB7MV7Uld2dtR/1lz99KByhHEkGRlPdetOqme0k256W4w3LOB/
 YXYfOYe6zgAoEhdNxH+sYIAZsCbnGEV+p6lOOsO6Y53WMQ7D39UByr2ZWo90K+MasIP2
 I1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kkLTOezkfKdPVe5VTO0yLce91pnJrqvoONkhLftQoZk=;
 b=fTpQNCBxipFagb/GmD5ROe3otdz1qfmlBLq8/Mi0MJ/9pGgSYvjeruXEVYzXMXUNvE
 qyN0Fy0X7UQug3UCw93fAWGhnEtyeAuuCjUYyykfdHvHh0mKvl72up/uloQS7THDbPjo
 THdFfQbRFPaGdsW5tJXTaoev9sNK3j41pavAvCcg8Yx1hVRKWoo5Y5fYZ3eq/0SvsvhD
 d96zKeAIBj0Mn1tSCRP5Wv4MttGxQ5TBF3pKI1SLzCxi6RS+Hzi5pYy2p6EGT0oRokVr
 bQ43qRBarRIQEAxzoLvb+WI3Vk3XNwJiyoHfkNQHUVgisZAaN1UVvdEm1CzWxYYMPfmO
 lbiA==
X-Gm-Message-State: AOAM530gwPR4r27IYkqqW8Nk7W+RW3BN+wZ/c0jUwTOk7Z/wuAqZyuU6
 2/NUIKBABKl21xeNpzioLpY=
X-Received: by 2002:a05:6a00:16c7:b029:1bc:6eb9:ee47 with SMTP id
 l7-20020a056a0016c7b02901bc6eb9ee47mr4539608pfc.0.1611926631946; 
 Fri, 29 Jan 2021 05:23:51 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id j6sm8857259pfg.159.2021.01.29.05.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 05:23:51 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v9 01/10] hw/ssi: imx_spi: Use a macro for number of chip
 selects supported
Date: Fri, 29 Jan 2021 21:23:14 +0800
Message-Id: <20210129132323.30946-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129132323.30946-1-bmeng.cn@gmail.com>
References: <20210129132323.30946-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42a.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c5alhL64Dunp

From: Bin Meng <bin.meng@windriver.com>

Avoid using a magic number (4) everywhere for the number of chip
selects supported.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---

(no changes since v1)

 include/hw/ssi/imx_spi.h | 5 ++++-
 hw/ssi/imx_spi.c         | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

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
 
-- 
2.25.1

