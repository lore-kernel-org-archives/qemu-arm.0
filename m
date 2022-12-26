Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp2496696ejb;
        Mon, 26 Dec 2022 14:03:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvPLWl5pdi6BtZgPpxNno1WC+K+YAXBnrSL5J2F8Py2va60M+VTjD3mOAo1Eu90cBWE4wwL
X-Received: by 2002:ac8:4b6c:0:b0:3a8:119f:c0e1 with SMTP id g12-20020ac84b6c000000b003a8119fc0e1mr24981441qts.36.1672092224151;
        Mon, 26 Dec 2022 14:03:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672092224; cv=none;
        d=google.com; s=arc-20160816;
        b=qNNx92y0R/JWxhM9JZAxiUxK4uDI1d0tBzNfg1w4ae9ZiUucLr6nfLO1fD7ObUmLz0
         7vwT/He2JOYZvc3AxWKmzxxxkKQmfzv3gsYI24N+3Mw3Pk3rh6OblsCB6oafw8VTsQbC
         62664fpamWXz98IUtTR4YlqM+YkAL2eMmRJYkzUzphH8eqp5+j+jFAvvz5XpwQraZTe1
         CpzltbF+CpWm8wVc3uUYfozLr2t7wW/21WlC+4M5g77BEVsrGTYYspSEUwd4hGqR/8R+
         ZpCSeVUu/d9kg/pnlNpv22Amo5bjPDedwQRqeMIQL+xwqADhqz0Rr1CSp3K55fFPzT0u
         VGDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TYI62dQf9gn0f4gFAtfVXUEo9pYy6Fucsvct1OnfuTc=;
        b=PVNSKVLHv/gIFgzyxmTi+fJcPPOW3ML4a/dxME+l1Il5uIRRJ0UJfMuLlEIiHasOeW
         dkCdm12brdYOmz8iIt7Pa7DCoFr+SvY46VTPX+EfYVqnX2QEPEoOqW4pLukR+CSbLO4v
         IqShfVOB2BW1x0b2S66AKErARfO1i6IpJW8KFTSA/WEEbsbJvstE1tg0BL0ezeQNv3ZY
         eblb3jH6vhYqxwQdfu2/ifmus+oGSn1UiujSohLrvRfmRhLnsxrqyN4ZmfNgKNO4Zxuk
         6VBpj+u1mfMCRvy5ueY92c2fgWIXJRnnebWLnrqMVdnmhoxMJuE8jrHRmSCxHOnciIFC
         mqBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=bk88Xr9f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m21-20020a05620a24d500b00704ddf807b8si2803763qkn.415.2022.12.26.14.03.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Dec 2022 14:03:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=bk88Xr9f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p9vZH-0004p1-KD; Mon, 26 Dec 2022 17:03:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p9vZ7-0004lY-5z; Mon, 26 Dec 2022 17:03:25 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p9vZ5-0003Xk-M9; Mon, 26 Dec 2022 17:03:24 -0500
Received: by mail-ed1-x52a.google.com with SMTP id s5so16834605edc.12;
 Mon, 26 Dec 2022 14:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TYI62dQf9gn0f4gFAtfVXUEo9pYy6Fucsvct1OnfuTc=;
 b=bk88Xr9fTVl9PQX5obcmZzFU9vnDki9yIH/ycPwhg9JtaDy/pu47pPLVMQGlX4cZVM
 R0cuSRiYF85+xEatKACoM60C2VrgFtdOsBnAjS8e4lcJdn4+1G+RZbDN6OW/hblAPZMU
 brwtA2V9d/flXcEt2E3RrUfnpRMY16KOguHkl1u401NtEcYRYaRmliKWnV6Duh7NE+hm
 uquqNLNmVSxAaNQSZ0sZgAapN4LnXpkPI8ycsI7LqYJRQMoaH1OAJSCktQa0D76pGEVU
 ChtWU/Yrehhj8e541RKMCbM187WvJ14CkpxO0QRu3K3acnSIyHuRYgwVVvACy6C1T4r9
 GAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TYI62dQf9gn0f4gFAtfVXUEo9pYy6Fucsvct1OnfuTc=;
 b=Nj8QJ+srNLTynXRXuwONAy4zINK4nai9rsaZkYMMmcCMpLnaJeAOYsFZ9Ezuto6VmX
 pcNXDYhwtgGa+megybizaBX4PpDqgGM54lpG2tiH8U+vRx9P6gAR63sETrb3FzF4QvRx
 eQeejzE2Yv59RedI8wciVlO1Awb1jiTE6g2RyqnIz8RX76W8DhJCfeDVErzcHUcrpJiJ
 /18wefYe8JLl8CH+n38FIQ+j5eHKLIGkj4N5aUXsNvbMnJmqjmQq6S2YVZs6K8lLBqSE
 g+LtKD99L6EHxJZJjAm+sFv0HpSaWK8SgpEc1qD3f+pSz7v0NI8fQJtyeg0swXI0Aikq
 O7Hw==
X-Gm-Message-State: AFqh2kq0/l9oA9OXMjTlKGtdzcR/B5GzGwPCzNZaBKFNGTYkrwjvxeYg
 tyv+g6jNWjFXqQDCPhM6gqw=
X-Received: by 2002:a05:6402:1217:b0:461:e5d1:73c5 with SMTP id
 c23-20020a056402121700b00461e5d173c5mr14762064edw.32.1672092201825; 
 Mon, 26 Dec 2022 14:03:21 -0800 (PST)
Received: from penguin.lxd ([87.116.176.120])
 by smtp.googlemail.com with ESMTPSA id
 u1-20020aa7d541000000b0046951b43e84sm5111467edr.55.2022.12.26.14.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Dec 2022 14:03:21 -0800 (PST)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH v3 5/7] hw/arm: Add AXP209 to Cubieboard
Date: Mon, 26 Dec 2022 23:03:01 +0100
Message-Id: <20221226220303.14420-6-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221226220303.14420-1-strahinja.p.jankovic@gmail.com>
References: <20221226220303.14420-1-strahinja.p.jankovic@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: uaiRwytF0soZ

SPL Boot for Cubieboard expects AXP209 connected to I2C0 bus.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/Kconfig      | 1 +
 hw/arm/cubieboard.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index eefe1fd134..da6741f112 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -323,6 +323,7 @@ config ALLWINNER_A10
     select ALLWINNER_A10_DRAMC
     select ALLWINNER_EMAC
     select ALLWINNER_I2C
+    select AXP209_PMU
     select SERIAL
     select UNIMP
 
diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index 5e3372a3c7..dca257620d 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -20,6 +20,7 @@
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/allwinner-a10.h"
+#include "hw/i2c/i2c.h"
 
 static struct arm_boot_info cubieboard_binfo = {
     .loader_start = AW_A10_SDRAM_BASE,
@@ -34,6 +35,7 @@ static void cubieboard_init(MachineState *machine)
     BlockBackend *blk;
     BusState *bus;
     DeviceState *carddev;
+    I2CBus *i2c;
 
     /* BIOS is not supported by this board */
     if (machine->firmware) {
@@ -80,6 +82,10 @@ static void cubieboard_init(MachineState *machine)
         exit(1);
     }
 
+    /* Connect AXP 209 */
+    i2c = I2C_BUS(qdev_get_child_bus(DEVICE(&a10->i2c0), "i2c"));
+    i2c_slave_create_simple(i2c, "axp209_pmu", 0x34);
+
     /* Retrieve SD bus */
     di = drive_get(IF_SD, 0, 0);
     blk = di ? blk_by_legacy_dinfo(di) : NULL;
-- 
2.30.2

