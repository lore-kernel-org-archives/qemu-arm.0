Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp545852ejb;
        Wed, 26 Jul 2023 06:26:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE/5u7VBXRs4P1r8llSGj2gRlBymak+05WeZrjYjtfNvJjxcXsjNqCEOE++rjEbnNcok1Td
X-Received: by 2002:a67:f48e:0:b0:444:c720:6181 with SMTP id o14-20020a67f48e000000b00444c7206181mr955971vsn.3.1690377975060;
        Wed, 26 Jul 2023 06:26:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690377975; cv=none;
        d=google.com; s=arc-20160816;
        b=ff/DAZ25dw5yV9X6TVtSsVzU8xe/UH29jp2juD0rVmLLNbPlQtzTlSWOSJwypSTNJm
         r/Spd5C1raVorFIXpaaLe44NLJ15jj+g9Gaiin+qK5u73o6++QqBFrbv0KVUmE3rNZNr
         5xtYFo7NcE4Rp38Wx/Jq7cI5zdhkMi5LXAaT5AkFpxtzf4jBKMeAAm87t78t34f9DeSl
         TnaV3Tc8zaZ7B/FojFK/7YQTUb9tpjoNhGgMqbfU42LssZ2RuG5Mo8PHxZMUa2pKa+GV
         UKwbnHyWYYhFy3DIrFaz7UseMsWMNzBm2OSfnXNlulphLZIBVe0VbgiZbvldCVFh3zvM
         y1Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QUTTq3Lu47Slhpr26Kb7SAlOne02J9PpVHtdNI1+/t4=;
        fh=f5jt6gD4kTKAQV2ukO6ZfXPs+EJm4Q1+uDtHV6gcJRE=;
        b=bSWyE+r3rTHDoOE9ssz32pic2ZbbfkwHZBNECyxyc+SDQi1LggIuPHG/7NEcaWHneA
         DSEeFmFrnw99bRG7aEGR3RcJJOinY4TqGJvAAd48QZdY8OCGqxvWnzu1+UD7dFYCnJxG
         14yfCKgKTOPSusDjZ39kSgVK4QhYh/Nx0QXL/tsAi+QRoIfFdaBqXWTBLufkq83C5uAe
         qDGnyaeWYGrV71dx9PtGDonXqp3cZTEc/smCmUHLzV9pbz6255aYqMLpEeiTj/Vgx6Sn
         MZwu2H5MH9EwcEh2tXg5Ajqu28gcQ0nYQHIk3zrQdYogsiMJPk0/R7QVmNN9XOKDVdRG
         4aVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=UY0SItJs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u19-20020a0cf1d3000000b0062617a404casi2253865qvl.417.2023.07.26.06.26.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jul 2023 06:26:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=UY0SItJs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOeWW-0002oU-Pd; Wed, 26 Jul 2023 09:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1qOeWF-0002iW-F0; Wed, 26 Jul 2023 09:25:36 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1qOeWC-0003CD-Ry; Wed, 26 Jul 2023 09:25:35 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so10541685e87.2; 
 Wed, 26 Jul 2023 06:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690377930; x=1690982730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QUTTq3Lu47Slhpr26Kb7SAlOne02J9PpVHtdNI1+/t4=;
 b=UY0SItJs/yBxy1HZoMsd+BtZOF9V+Pci5o5gBUH+ida1ddihXJzy5KUPp0Ohl5nIv+
 RwRwUbCYTBhTM+eMcRfyUN7sS3VvFDYBa6YtysF6IvAH3BVwUJKIt3IFxDuqeiic5tcx
 Yvx+cjq2DZj+0guV+B9DLk4Y0HH2UDF+ioTn9PMLR3UGfCQ5XVghPj0of003X53ep30K
 zI7KxrpUvq3itoDu357Ni3yRbLLTjvO9XEnHyTmBKEOherKZ5F48CrV8ToNjz4/GmoJE
 wdAfpMNTuTqOsVBxPzgUn+hdZ724HLIA+kugNr2mo/gApyyEPxAwkTrctPv9N+bsBZHT
 B2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690377930; x=1690982730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QUTTq3Lu47Slhpr26Kb7SAlOne02J9PpVHtdNI1+/t4=;
 b=hdY+AvfAsx84Wv5zJowRLyv3VMpJTWcdgX2aoUL3ZfD6xHIgM436cc8vYhCu/Hd1Pl
 QiQDwXOrzWlXW/HCiCXDmzw7tId759qtDG5ROzMky/hW+Be41ssHIdm4vKj/K/jrW6MS
 HnttAPkowimE9GHcMGTPworZBsuK7mTwkkXA/aJEZgEQvZzSHxxX9acgO3aV2c92RdpH
 5nbqr+X/NpfyAgFopEepbJbQnx1ptxD++bRGEOvNQA/5TLOtZwyDVH31WX79/FJkNZzT
 P6q6qWQ2+b2Hl9TxSRd6K7y1sKgXq3MVWXtNK3mYH91gF8f2ch6+m04NrZzS2FKtlUz1
 yDKg==
X-Gm-Message-State: ABy/qLYd34K2JGwQSNZ4qGyT9DgBVH1kIwt40oU9gFlKmhoUmPG9EUR1
 JPcLenwGRk6nObT+wGciKfLpee35Tvc=
X-Received: by 2002:a05:6512:3c8d:b0:4fd:f792:242e with SMTP id
 h13-20020a0565123c8d00b004fdf792242emr2037336lfv.32.1690377930398; 
 Wed, 26 Jul 2023 06:25:30 -0700 (PDT)
Received: from sergevik-thinkpad.localdomain ([213.197.136.186])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a19f516000000b004fe0c3d8bb4sm565079lfb.84.2023.07.26.06.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 06:25:30 -0700 (PDT)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH 10/44] Add BCM2838 checkpoint support
Date: Wed, 26 Jul 2023 16:24:38 +0300
Message-Id: <20230726132512.149618-11-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726132512.149618-1-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=serg.oker@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: YzQVZf3b2qxD

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 hw/gpio/bcm2838_gpio.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/gpio/bcm2838_gpio.c b/hw/gpio/bcm2838_gpio.c
index 7291e473dc..f1121f9c58 100644
--- a/hw/gpio/bcm2838_gpio.c
+++ b/hw/gpio/bcm2838_gpio.c
@@ -17,6 +17,7 @@
 #include "qemu/timer.h"
 #include "qapi/error.h"
 #include "hw/sysbus.h"
+#include "migration/vmstate.h"
 #include "hw/sd/sd.h"
 #include "hw/gpio/bcm2838_gpio.h"
 #include "hw/irq.h"
@@ -324,6 +325,21 @@ static const MemoryRegionOps bcm2838_gpio_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static const VMStateDescription vmstate_bcm2838_gpio = {
+    .name = "bcm2838_gpio",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8_ARRAY(fsel, BCM2838GpioState, BCM2838_GPIO_NUM),
+        VMSTATE_UINT32(lev0, BCM2838GpioState),
+        VMSTATE_UINT32(lev1, BCM2838GpioState),
+        VMSTATE_UINT8(sd_fsel, BCM2838GpioState),
+        VMSTATE_UINT32_ARRAY(pup_cntrl_reg, BCM2838GpioState,
+                             GPIO_PUP_PDN_CNTRL_NUM),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static void bcm2838_gpio_init(Object *obj)
 {
     BCM2838GpioState *s = BCM2838_GPIO(obj);
@@ -355,6 +371,7 @@ static void bcm2838_gpio_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->vmsd = &vmstate_bcm2838_gpio;
     dc->realize = &bcm2838_gpio_realize;
     dc->reset = &bcm2838_gpio_reset;
 }
-- 
2.34.1

