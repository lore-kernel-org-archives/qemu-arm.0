Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6389291ejq;
        Mon, 15 May 2023 02:51:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7yrxfPnAnczT1FROXQ/dPhZyCFIrWTNydjXM3n8+A1EmDciVRquSeaMcWuPYAtq6Rx3tbp
X-Received: by 2002:a05:622a:38c:b0:3f4:f841:df70 with SMTP id j12-20020a05622a038c00b003f4f841df70mr19009083qtx.66.1684144287469;
        Mon, 15 May 2023 02:51:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684144287; cv=none;
        d=google.com; s=arc-20160816;
        b=PU4ZZIl5MzKktnuxeMGljjwD0aVbQJ4Wg2COp3HQ5FmGTiXMW58bcmcC9pyUYfY/KQ
         KbjQV3pIGPngMrEGjWr3vMeqZ0nlibrWxm1z87c2QZo97YwiPv0g+MEfMoDHTFI6uQBV
         T/X2IiwhoBFYDX5VHHXc4m+1xWijQh1f7AnWPhGsKS5y/z1m5ELuLfghQRLDZ107q+lS
         b/68qBVoWnZei4kFADXxWpiv3MpLXquyRwPxYyH24yjPBIq4gVMG3DMWxBIVxThMaPAU
         Tv7qhqMjO5mYDE0jRCPpCkYQTUwORIJwhQXxYLUZpb1AUl6XBF3s7SHh/PbS1HaFjfGr
         rQ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=KqdWxYlqBo3Mzu7KKRRgEJ8tcvTNHjL8Xs1GEkj59rc=;
        b=NFginFya2ds/AkzHfyEnTcGLPqb9zvHKaESOyJqNGaM9b/uLJaXbKCRRnbTIDwwHlD
         5EEyKnPegDWxcPPa39Gn/12WQUJxuedbUp83Cg0u1mbfSZ4hO2wExgk3nqpdlclXB3XS
         65CJh/uXyBQrenNlDUn558VF/lYS9AcqSnA48NJkHlteGy9RlT/GNaYmp1dyQqP/QAns
         ztnk8Q0aUBaPE23UZTUJiDJhXw5+0C30rjneytGEYng+lVdNhlYy1GjMEyF57/wr5asW
         PuLV+xHCuByNFx6p8WZDKh8aeTcV8S1lASN5Q/MPgRg2rfubHkqziBQuAZ1LXK+sivlv
         DDKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ispras.ru header.s=default header.b=Y4opuUJR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ispras.ru
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10-20020ac85b0a000000b003f223248863si9468076qtw.625.2023.05.15.02.51.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 02:51:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ispras.ru header.s=default header.b=Y4opuUJR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ispras.ru
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyUrB-0003aL-2b; Mon, 15 May 2023 05:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cheptsov@ispras.ru>)
 id 1pyUr5-0003YB-Qn; Mon, 15 May 2023 05:50:59 -0400
Received: from mail.ispras.ru ([83.149.199.84])
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cheptsov@ispras.ru>)
 id 1pyUr3-0006g7-GO; Mon, 15 May 2023 05:50:59 -0400
Received: from localhost.localdomain (unknown [212.7.210.181])
 by mail.ispras.ru (Postfix) with ESMTPSA id 2334F44C100F;
 Mon, 15 May 2023 09:50:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 2334F44C100F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1684144231;
 bh=KqdWxYlqBo3Mzu7KKRRgEJ8tcvTNHjL8Xs1GEkj59rc=;
 h=From:To:Cc:Subject:Date:From;
 b=Y4opuUJRWxIzWuhRzt8R8G+jjeFOLVGAOhcP/X1gHNJYoHy00Bl9A+9fqaGAONx9l
 8ccePwxQ/Ko5l7mmd6x3L7yOBQKVZ6l9RyxIo1fID7pJx4GOL4gVdtf6bJ9sy3rTVY
 WG8V/mXqIXNzpfPFW/Fk4aeBvC+PsTREADJRAiiY=
From: Vitaly Cheptsov <cheptsov@ispras.ru>
To: qemu-devel@nongnu.org
Cc: Vitaly Cheptsov <cheptsov@ispras.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org
Subject: [PATCH] fsl-imx6: Add SNVS support for i.MX6 boards
Date: Mon, 15 May 2023 12:50:15 +0300
Message-Id: <20230515095015.66860-1-cheptsov@ispras.ru>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84; envelope-from=cheptsov@ispras.ru;
 helo=mail.ispras.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: AIRdI9RZKtic

SNVS is supported on both i.MX6 and i.MX6UL and is needed
to support shutdown on the board.

Cc: Peter Maydell <peter.maydell@linaro.org> (odd fixer:SABRELITE / i.MX6)
Cc: Jean-Christophe Dubois <jcd@tribudubois.net> (reviewer:SABRELITE / i.MX6)
Cc: qemu-arm@nongnu.org (open list:SABRELITE / i.MX6)
Cc: qemu-devel@nongnu.org (open list:All patches CC here)
Signed-off-by: Vitaly Cheptsov <cheptsov@ispras.ru>
---
 hw/arm/fsl-imx6.c         | 8 ++++++++
 include/hw/arm/fsl-imx6.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 00dafe3f62..4fa7f0b95e 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -53,6 +53,8 @@ static void fsl_imx6_init(Object *obj)
 
     object_initialize_child(obj, "src", &s->src, TYPE_IMX6_SRC);
 
+    object_initialize_child(obj, "snvs", &s->snvs, TYPE_IMX7_SNVS);
+
     for (i = 0; i < FSL_IMX6_NUM_UARTS; i++) {
         snprintf(name, NAME_SIZE, "uart%d", i + 1);
         object_initialize_child(obj, name, &s->uart[i], TYPE_IMX_SERIAL);
@@ -390,6 +392,12 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
                        qdev_get_gpio_in(DEVICE(&s->a9mpcore),
                                         FSL_IMX6_ENET_MAC_1588_IRQ));
 
+    /*
+     * SNVS
+     */
+    sysbus_realize(SYS_BUS_DEVICE(&s->snvs), &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->snvs), 0, FSL_IMX6_SNVSHP_ADDR);
+
     /*
      * Watchdog
      */
diff --git a/include/hw/arm/fsl-imx6.h b/include/hw/arm/fsl-imx6.h
index 83291457cf..5b4d48da08 100644
--- a/include/hw/arm/fsl-imx6.h
+++ b/include/hw/arm/fsl-imx6.h
@@ -21,6 +21,7 @@
 #include "hw/cpu/a9mpcore.h"
 #include "hw/misc/imx6_ccm.h"
 #include "hw/misc/imx6_src.h"
+#include "hw/misc/imx7_snvs.h"
 #include "hw/watchdog/wdt_imx2.h"
 #include "hw/char/imx_serial.h"
 #include "hw/timer/imx_gpt.h"
@@ -59,6 +60,7 @@ struct FslIMX6State {
     A9MPPrivState  a9mpcore;
     IMX6CCMState   ccm;
     IMX6SRCState   src;
+    IMX7SNVSState  snvs;
     IMXSerialState uart[FSL_IMX6_NUM_UARTS];
     IMXGPTState    gpt;
     IMXEPITState   epit[FSL_IMX6_NUM_EPITS];
-- 
2.39.2 (Apple Git-143)

