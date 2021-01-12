Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3617996lfq;
        Tue, 12 Jan 2021 06:56:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJye6TMDqDK8V73i7f11TJbx12FwgmKKTNTscLzJoILeydrtU39iPO6UM2Ew3nLas1gbNyRQ
X-Received: by 2002:a5b:812:: with SMTP id x18mr7682801ybp.334.1610463374827;
        Tue, 12 Jan 2021 06:56:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610463374; cv=none;
        d=google.com; s=arc-20160816;
        b=s/kokcPioECtH/R9rB6cDEUt77jWMAUDMrqE8Hux6A0Hp50944aOjcI8WH4/Q+a454
         9jkHd8t28BKwkmFdba1l+P+gEYmsqDjupFEI8Pi48Cc5UKgLSOhDyoxrYYPXPU9dU0F0
         CyaqKxEbSy7T3KUCO74yXjKU5tnev5I7XU6vsWAHi1a6Y4FznrOT0mTQK6CcNekIzAhd
         SuaC8maYMEH2bIz3EPkCcLQIiUeF8P2p1XiX22YPvci0l5tHYNMtU1i5gQlvfNo5HXsl
         yDf50/s+uJVrREcLUNZg8KvzCpqhtjaViKTWSaOGYwPC2dV94IFKgLOMg0Ri7oO5AvjC
         zyug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yiZYra9gqHUl+N2i47qt4AFi/fzPb5dHXFPbEQlB07k=;
        b=yTgmEMt3MVz/JCFo1Ekzomd9iXsLhdzPxmJGJgcLLHdEZWXFM4IdejDm/gKfxJOz4E
         08FULG9loDvX1nWPcxp2YIzDr3Ku3JT2VfhHu9w/ZX750td/ojsvL75VspY1j5zaOLbD
         ddXL7QV2hsJIo5sH/hHfcSizJdsLJcAsLQOfngbg93funJ61ceVzOYJGCOf3URwT007u
         NHcvhWKcpXa1TQcUH4l0jX5RM8OsBvJr3dR1nfS70mi+sXUmVqFoztuxfxf6CBeAxPVk
         ve+NSIZ0kvsM/XQfckvepjnm5mmf2hhYRtDlKnIkGk0lc7njXB8ecJ0zKaXtch8N1TcH
         PIQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qpTNeDom;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d204si2967876ybh.382.2021.01.12.06.56.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 06:56:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qpTNeDom;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzL5i-0007rZ-47
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 09:56:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzL5G-0007ov-6h; Tue, 12 Jan 2021 09:55:46 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:41068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzL5E-0004jg-M9; Tue, 12 Jan 2021 09:55:45 -0500
Received: by mail-pl1-x631.google.com with SMTP id y8so1515580plp.8;
 Tue, 12 Jan 2021 06:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yiZYra9gqHUl+N2i47qt4AFi/fzPb5dHXFPbEQlB07k=;
 b=qpTNeDom9OndziOM8Iave2+BUhH8o3fvOOWa/Py2FermWKpLJ69KABqAVe//vZM3zQ
 izUHgLIWTZjqfAiSBm/hk7NtH+xfXHuqZfuXX8k4Ubc/9Frzb8tO5yNiP4gJnk77DKsG
 WGFfkjlwsfy+W+waFFaCA2Xme/Iy9XwPHQLUsXD0+p/4AdMs/4/nF+Im8EvagEgyDO1T
 IJFvun4fVSc4Jb/XNDC6PIofrGqQqthVFzWu+rX647cDxT4BBthpjSuUDfkHZFUtLfxq
 OHUpfVT4S95VU4LhRJm+3uxCphaasH/JlpBXJGcNwPO+gqgCwEU5Rcr0uK49fePk4m40
 Iz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yiZYra9gqHUl+N2i47qt4AFi/fzPb5dHXFPbEQlB07k=;
 b=asmidGtrslWyrb+SJX7ijSXrMStQtnobm68ZyadCbfa7rKffOKjyGatX7fZt1AWixt
 bYICDY6r65lDzLgFG7LOkQpMESecXJJUYvO0M3wVcvG8G0zQFl9YNnRYGo/p74niPyCx
 ot25xZi5iS9RgVAKQhnTwdXAoFrqwmwNkqUrfJngjysZBySDAvzLSSoNvDTV1cwV0t0Y
 B7HveEYW4BjlDL7YAN0wDwhF4+W0Ev9zTS9yW/WMbJQm5GipTPWLm5MJwStH0iq44hgs
 aFEWoahw+WGogK0et48z+MQjzMcNer6IC3AdYzvoRL3C9cpvDHsbFIC+kh2QgsWeKaZe
 0SlA==
X-Gm-Message-State: AOAM532E3FDj3vHlPtlk4ksHFKTfz1kmuUpvCw4d0ibfeFoqsEU377Yr
 DO/i9wQrYoU0NyF9LlvRu+k=
X-Received: by 2002:a17:90a:d48f:: with SMTP id
 s15mr5023862pju.137.1610463343194; 
 Tue, 12 Jan 2021 06:55:43 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id l141sm3593938pfd.124.2021.01.12.06.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 06:55:42 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v5 1/6] hw/ssi: imx_spi: Use a macro for number of chip
 selects supported
Date: Tue, 12 Jan 2021 22:55:21 +0800
Message-Id: <20210112145526.31095-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112145526.31095-1-bmeng.cn@gmail.com>
References: <20210112145526.31095-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TSXKy8A976Y0

From: Bin Meng <bin.meng@windriver.com>

Avoid using a magic number (4) everywhere for the number of chip
selects supported.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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

