Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp2117052ejb;
        Mon, 20 Nov 2023 03:51:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4qSFidEgzAeEYLzRQkEyrP7xRxVZ0HwVg9gj1sWBkTZ8nPkWn25NasDcNBfdZ/U20erWv
X-Received: by 2002:a05:620a:248f:b0:77a:40ae:2e7a with SMTP id i15-20020a05620a248f00b0077a40ae2e7amr19552884qkn.24.1700481108483;
        Mon, 20 Nov 2023 03:51:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700481108; cv=none;
        d=google.com; s=arc-20160816;
        b=igOEDHWYi4hXT2DZoNZuRglqaOvQGkEd1yAXLNO1W7KgSe3/YifRpS9AxDxQVqXydn
         r6oBW9Z8x/0dneN2p7Hp4AlnzFtUOs3VTnTM7VFTLU4h6BAI+UxpQ25pdzcLPn5q63aj
         7hYQQsy/zmtKGj5V1DRoPt+oxpk7akedM85jaGBzoGm7pxee/tPxqgPeoUc6kHhx+2Ph
         2/F78S5X2vSHb6kuT9I7H9eYDqUivQO02mySif/QWlow3jBndaw8YiML2t9IhzkOl81m
         NoyKq6OEmeBAiUCHULZF8F1yLsZaUGl88Rrmoa2jmGuvRua2dTzWbRhvASEBovr27zY5
         kHRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=zrVc+uxt2aamx+bfLzj4zVN/8r9EOkToxVQHm8NrWKA=;
        fh=qPyKxZhbkmeWH7l3cH71nkkH0CZe3e9Slp3smM52VNw=;
        b=pCcCB00HvIrjXpBP84xCx+p54OACk5TwddpW66onaNVFzEzV3Wqtk1g8Pfc0Hdq7ol
         eNC1KZZefesswmZTWMdNvZut1AxMPotWsjZTf7TdzzMIh99UHsAohMMwIcyP30HR+RZX
         PYKGysp0Thx6P57BJOkLy4AL4h8k3gw7ANbCiexOGlI8dPVRnlwtuL/uoF0V5KFp7mTd
         FPhyr+t2LZa+cy6grGMbftnk6BdL1AX2p++LE0JwmdWual7LDerKyOADoQDv6FNm3/Bb
         ZPtLn+lOOUEiZz6u59ppJsu8Tkv44xW/WwVa5hXE1LBLNTVdiHQQYf2cgB0vyH/pYv/Y
         Td/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v6KZgT+t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13-20020a05620a080d00b0077a4af92713si7094814qks.565.2023.11.20.03.51.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 03:51:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v6KZgT+t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r52oJ-0001ZA-JP; Mon, 20 Nov 2023 06:51:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r52oF-0001Y3-0n
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 06:51:23 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r52oD-0008PG-2V
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 06:51:22 -0500
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5098e423ba2so5912315e87.2
 for <qemu-arm@nongnu.org>; Mon, 20 Nov 2023 03:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700481079; x=1701085879; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zrVc+uxt2aamx+bfLzj4zVN/8r9EOkToxVQHm8NrWKA=;
 b=v6KZgT+tx2D6DBWpI66z92Ls7wSKZUgaxqvS7IWqMfOkbQvjOLPANJtgX3uCA/W1k1
 pjsci9tXfAUeAX0vgLa2hRmJx2gGdsCtlClxRuLOX4GgLYoPFXvWMde1ZU+P9LzldvS5
 iWYDY3Lnl9K3dtvUxb6UuvqEKBVs3gN58K/58lJPepWrJ1Llp791UYZERoUWKb76tnml
 0wfeTXhK2c/0sCBuDq/MDbouym5vTrKajW24+fraCSEHfDCq2YLpODLa1lPPuKqHJcpf
 w7nQA+QGcvCraG2QHwQdsDO8uT0Cr1b3wFXYMtrVEAGgKNd7xVlbs8zkGmUwMyGDwrEq
 tgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700481079; x=1701085879;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zrVc+uxt2aamx+bfLzj4zVN/8r9EOkToxVQHm8NrWKA=;
 b=uQjxN8szPFNZvx2yqqkX7b7RloKcqPhfkskWtULdWRJMTOucMjRoz8HxymOODsN0sZ
 xGRiE6C6w+hUjYH40rymCVowCJoj27AQSyk7/ShLfocnKT8da8Nql9NxhzRNBtWeXaEO
 W/0QQqWqoF+7cNwQPJ8QnP7cb5522VOUM1YCZes+COEhWODY9/2+LpKoOoI46pm+K+vm
 sbxOxQcPqroA10uDG7QjyOX8XVAbBifK0adyQHBe+J+KmfoAy40ZPGZhMMmgNHdj9zIv
 R78MUdZc/QrJXcxGnHEYu70FNXEDSL+SppVp6nS0urptg30mLB5tmZDNN0iTf0PLf0+4
 oAcQ==
X-Gm-Message-State: AOJu0YwKYYmf1M3XZe0nEFK/hvdrqDS8FcT4/kgUSpDcjeWA2ZGqDrRQ
 crodT/BrO3/TWQ5qqqlHUT0AMw==
X-Received: by 2002:a19:7015:0:b0:507:9fa0:e247 with SMTP id
 h21-20020a197015000000b005079fa0e247mr5124919lfc.32.1700481078904; 
 Mon, 20 Nov 2023 03:51:18 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.190])
 by smtp.gmail.com with ESMTPSA id
 p11-20020adfcc8b000000b0032d9337e7d1sm11001729wrj.11.2023.11.20.03.51.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Nov 2023 03:51:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.2?] hw/arm/fsl-imx: Do not ignore Error argument
Date: Mon, 20 Nov 2023 12:51:15 +0100
Message-ID: <20231120115116.76858-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Wd3xm9Y+tlwW

Both i.MX25 and i.MX6 SoC models ignore the Error argument when
setting the PHY number. Pick &error_abort which is the error
used by the i.MX7 SoC (see commit 1f7197deb0 "ability to change
the FEC PHY on i.MX7 processor").

Fixes: 74c1330582 ("ability to change the FEC PHY on i.MX25 processor")
Fixes: a9c167a3c4 ("ability to change the FEC PHY on i.MX6 processor")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/fsl-imx25.c | 3 ++-
 hw/arm/fsl-imx6.c  | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 24c4374590..9aabbf7f58 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -169,7 +169,8 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
                                             epit_table[i].irq));
     }
 
-    object_property_set_uint(OBJECT(&s->fec), "phy-num", s->phy_num, &err);
+    object_property_set_uint(OBJECT(&s->fec), "phy-num", s->phy_num,
+                             &error_abort);
     qdev_set_nic_properties(DEVICE(&s->fec), &nd_table[0]);
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->fec), errp)) {
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 4fa7f0b95e..7dc42cbfe6 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -379,7 +379,8 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
                                             spi_table[i].irq));
     }
 
-    object_property_set_uint(OBJECT(&s->eth), "phy-num", s->phy_num, &err);
+    object_property_set_uint(OBJECT(&s->eth), "phy-num", s->phy_num,
+                             &error_abort);
     qdev_set_nic_properties(DEVICE(&s->eth), &nd_table[0]);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->eth), errp)) {
         return;
-- 
2.41.0

