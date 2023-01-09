Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2108519ejc;
        Mon, 9 Jan 2023 01:20:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsDqilQTv5TCFVonbaN82nd+0qDzCFlSWpvvzFzohY9tqzy8h0o6VroX6NEL2osxR9jHJuP
X-Received: by 2002:ac8:7205:0:b0:3ad:841d:e65b with SMTP id a5-20020ac87205000000b003ad841de65bmr3224377qtp.7.1673256014801;
        Mon, 09 Jan 2023 01:20:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673256014; cv=none;
        d=google.com; s=arc-20160816;
        b=bIoYTQrrnOQ3tMFIVCt61RjPn9djwnNnuGWyfHzqVGpLJt4X0alMkkj9G9I1V1Au9W
         xDMZTG/qZlw1pY/UR5dkDoFFAMNJ8yvpeDs/lUmFlVMvAijBSnNCok0jkLipw+qytq9f
         XDCY3lB4yx+aa2o9zl4gYavP/jFH7tk9GaZvmZYkzpq+NXFp0+9+wzoxZ0LuiHSnpl5u
         P0PrZGIj+RnjwhknKHFzfKP/FzT9fy+DsI1xKEGgcfExjktSxw6o/BUVGh1EzC7F9MLE
         LtAlHhmuvkPSA56ScfoOGFwwzwLB6OjPvsQR+SjWCVDN9OAio6gALBQw0rO+h6QbCTRU
         OYEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XBZPNJwwwaWX0RjrF0KkQO4XpoIayE+6GXh3agPp5AU=;
        b=pMuOrGmDINfMQIe9oduh1ybTOl5HKqVM4wSdCXx0wPkC0L/OyFHCcT3mwr7Me+bawe
         HAljuZmgi3Y7I2f7IyUACx26RNe7BszI6b3ZLE6IAlfRYDHdiC/Z9tgduveEjsJvg6E/
         MhbUPY3hZ4/zHLQb1XoEdhDblCJ2+Db91Vl2u9Pw27Vv3gQUruCaMStJPK2dlSILF0Cv
         Ru+egBsIiZL7+D1o6/TADm9Ex8wTG6fOvZRTT0GKPTV9GfTDjutS9Pa56uQF0CxPSBSk
         wD/zJLl3QAmN0VGCxEhljOEcbUBreJ8ynnufIRDFizESJlAFRLEM6XYBuxt9lOc3IPBs
         asEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HThy/Od9";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t133-20020a37aa8b000000b006fa22507c32si4161755qke.372.2023.01.09.01.20.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 01:20:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HThy/Od9";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEoIO-0000zi-Tf; Mon, 09 Jan 2023 04:18:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoIM-0000z8-SH
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:18:18 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoIK-0002ov-2n
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:18:18 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so6774331wml.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 01:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XBZPNJwwwaWX0RjrF0KkQO4XpoIayE+6GXh3agPp5AU=;
 b=HThy/Od9Mw18GjYaLpxMrV0IBibiTJIH/JaBK0A/JuGRaNHin+DU8kmFzbfHDO0YN+
 7jIPVAfQk7CczHZ0wrmUezEpcsdXKchz3kU1xZHH5xq9X+hmrsa3HjuFGg2nXDuR1MT3
 3KSySxx8WvUWBfJ71sEOlg8Saeao9kyKD+89EgYtXmiIgdKQFnI+uUIX3DSr8jFD9K3V
 YW7ukY+orZbwUmi3eELYgmfUSGhRGu5nOvQZt38diMysDx2cJy1yJABVQFQWjteSctmY
 2LQHNAv1Gy35RPZsKj7fsMVEvUsuliOOYP3nJqbgDL0bFRc6XVubktlmW4HemYvtoW7N
 UA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XBZPNJwwwaWX0RjrF0KkQO4XpoIayE+6GXh3agPp5AU=;
 b=sEQREgk2s90K87TC4atpSaHfSNeZxxjsGBkiEODEmiR9BDPLrFTVSK/oiAQmchsXdP
 trVVRtgII0/MeXP4hFdmqTwjGx13BNgXLO70GAABKVt7HOyFFUNATB4E1zyH4IOURUc0
 9vakHH/PJjlOrr93NZdHxbAvjD6P9zh48pWZZJ+Tk/EBg4RduUUeeF9SIZP3C0LrsZvQ
 Qd6+qCeTiQro01m9qf480L9GIBvx0ksSiE72qqLf61Wa8/g6UwDUoJVLdqPKpkp17Mj1
 XiaNy4bIub4aue/Nvd7uFsfXNMvlg7JjclcM1D/qkdtq4R7oiNGxWZoCBAf1M8lcRpsQ
 rpTQ==
X-Gm-Message-State: AFqh2kpwq568l8aSAFtRS1riBbNnGJR2+wdtEUV33DUPvvJtSUwelBUa
 vj0tu9pEihUqgjuOYYcnD6//u5ZXDJZtcXw2
X-Received: by 2002:a05:600c:1d89:b0:3d3:5cd6:781 with SMTP id
 p9-20020a05600c1d8900b003d35cd60781mr44990326wms.37.1673255894537; 
 Mon, 09 Jan 2023 01:18:14 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bg24-20020a05600c3c9800b003cfa3a12660sm27714784wmb.1.2023.01.09.01.18.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 01:18:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/5] hw/i2c/versatile_i2c: Use ARM_SBCON_I2C() macro
Date: Mon,  9 Jan 2023 10:17:53 +0100
Message-Id: <20230109091754.79499-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109091754.79499-1-philmd@linaro.org>
References: <20230109091754.79499-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: /Wl7PsH/RUJW

ARM_SBCON_I2C() macro and ArmSbconI2CState typedef are
already declared via the QOM DECLARE_INSTANCE_CHECKER()
macro in "hw/i2c/arm_sbcon_i2c.h". Drop the VERSATILE_I2C
declarations from versatile_i2c.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i2c/versatile_i2c.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/versatile_i2c.c
index b95c70608b..d19df62265 100644
--- a/hw/i2c/versatile_i2c.c
+++ b/hw/i2c/versatile_i2c.c
@@ -29,11 +29,6 @@
 #include "qemu/module.h"
 #include "qom/object.h"
 
-typedef ArmSbconI2CState VersatileI2CState;
-DECLARE_INSTANCE_CHECKER(ArmSbconI2CState, VERSATILE_I2C,
-                         TYPE_ARM_SBCON_I2C)
-
-
 
 REG32(CONTROL_GET, 0)
 REG32(CONTROL_SET, 0)
@@ -86,7 +81,7 @@ static const MemoryRegionOps versatile_i2c_ops = {
 static void versatile_i2c_init(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
-    ArmSbconI2CState *s = VERSATILE_I2C(obj);
+    ArmSbconI2CState *s = ARM_SBCON_I2C(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     I2CBus *bus;
 
-- 
2.38.1

