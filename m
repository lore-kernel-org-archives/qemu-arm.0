Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4771873lfa;
        Tue, 8 Jun 2021 13:27:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFVliSnGwRXOsjfqu37duwWYMfPWFECnR8/1JmZDyHtz6+rrPZvtY5+umKRBpnWavwbO+E
X-Received: by 2002:ae9:c005:: with SMTP id u5mr2034472qkk.316.1623184044563;
        Tue, 08 Jun 2021 13:27:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623184044; cv=none;
        d=google.com; s=arc-20160816;
        b=MLKf61M/Hf/xrbzZFAuYa1CUmOByUmS2Sr/Gp0FqCgTVaZ1DSV1TZ0y6AAeKkD4BVl
         0yglPvKXdKTxDzdinBUKqLDpJyfRP/RyW5MbUZFGUYVczo5t1g/G0sR6ARjMjiP24dHa
         iYZx5VyAxTSbU+bxkzUv3os1ULi5Ql2rL1hA224W3IvWl+OTtufuiePpfc7QV5tGMWJO
         uC3wkUIe7cTm5PJsZblLcqaZ1s262yOMXF7DtDNhSfyte0o27jtnqNPWmMag/B5nlekM
         LJeHR2BwUXgaaFapKamVhEzPW1F9AeK3gCmTilyIomxKET7yNuRHz9nGUnL+8ENpN5gI
         XUrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=FxAe0EZ6wpi9A2ORE+AfuOAXtfCwqR3DwiGh/urmkpk=;
        b=r0FRLjX33YBYEX5JhZXvbC2XQqA1Owy/5XjZ2w6nwbZtJhPOQYkX3x/6fyupWRtfzP
         hzxtewIOnR7ZImr8FIP5fSqksoPaMKiN98SvD72aJS109F5mXL1jApjp8oxIc516F+E9
         Wc0iw/Oz1AbHQ/SJz/XvWyylpjFPLube3Bu1w1NfafyGcoqqdwR5YVhvfQkx3ALlCRPd
         vDyB5ChrF9lC/E6XlkjDH6ynsycl8c78has7UwGz7sf/nughCg9mOCde7MnXLlFti3Ct
         gwU5LiJmYVPRmeGuGNK6dSDs533l289OGFVc7ZSBwyYTsjtcZUe+QCCQi5YQCT2XtBKH
         5gXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=ATeo1MPX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8si3264764qtp.164.2021.06.08.13.27.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 13:27:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=ATeo1MPX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:55940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqiJn-0004CY-S7
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 16:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3P9K_YAcKCO4lUdjkhUWeeWbU.SecgUck-QhcdedWdk.ehW@flex--venture.bounces.google.com>)
 id 1lqiI7-0000HZ-Hz
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 16:25:39 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:49065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3P9K_YAcKCO4lUdjkhUWeeWbU.SecgUck-QhcdedWdk.ehW@flex--venture.bounces.google.com>)
 id 1lqiI5-0001O5-Jt
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 16:25:39 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 v63-20020a2561420000b029053606377441so28660876ybb.15
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 13:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=FxAe0EZ6wpi9A2ORE+AfuOAXtfCwqR3DwiGh/urmkpk=;
 b=ATeo1MPXz4RN6CEL1CaBboXG/D0weUZ4MqO3+5ql72HHn2HSCiQLsy6LRi2lAHEN8I
 JeB4He2IR/3uaOwcNqEWUA1hhx6jyqbSyFlwBEbocwBFFaC0GLslyKeN9WKdgK3iYvaF
 CRNFJhdI3sZ2SVaZyHsqYhgog6OOaFpJhjnuxl3v1bVUWewiKcXC80JRGP5edvNq1ONq
 Cfef5Ix4SN8Wyl3rdz0Be2zxfSClVeSHLSthvAE4U2nFa5ER/8twaZDOdZ/MRsrvHZND
 KDFhxxdiBnn1fYxWTt1ClOW2HSt1Zk597s7HZXIr9CxrVRsq+5/RNZPtkDuOd/FM8sHw
 aqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=FxAe0EZ6wpi9A2ORE+AfuOAXtfCwqR3DwiGh/urmkpk=;
 b=UjWiMkI8nHOI7R8nKQxv7DCX/IXHxY8BWZZFJo6sYOvFqLqtiGEaGkg9AJEDJZgcgK
 71NjUKNei+2blXy7FpDfcyUCfO7AnumHsp1iU0IfrBTQBkZkktAiToWEEvaZ0bx00pwk
 cZZuHJ7NKVHvcuJIiYPau79pWaGWe42UyXNxVqJBLGI8fAEhgMis35oMmosDLOKxWSJI
 c3O3tyFFRczB3PmNuxlQnA2SFPxfkMeSttAoRM4XNU09ounflAf4oT4OImqArkaT8UgP
 +3ad7qpsMWuYILxVYCZkU7Cod/UA3I+Njz7XS+1wgAjHbOL8kfsbaLursEcitdihMklA
 rj4g==
X-Gm-Message-State: AOAM533rnLV2PksmfERlpfLe6aGjcsvH7VTws9BbF/2Q0fyBe9sUpW9J
 mK5sAHkHQermusw2WxUZTPVmujzPE9Ni
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:f886:41e8:7e16:711b])
 (user=venture job=sendgmr) by 2002:a25:9bc3:: with SMTP id
 w3mr32517916ybo.9.1623183935674; Tue, 08 Jun 2021 13:25:35 -0700 (PDT)
Date: Tue,  8 Jun 2021 13:25:21 -0700
In-Reply-To: <20210608202522.2677850-1-venture@google.com>
Message-Id: <20210608202522.2677850-3-venture@google.com>
Mime-Version: 1.0
References: <20210608202522.2677850-1-venture@google.com>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
Subject: [PATCH v2 2/3] hw/arm: gsj add pca9548
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, clg@kaod.org, 
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3P9K_YAcKCO4lUdjkhUWeeWbU.SecgUck-QhcdedWdk.ehW@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sTJg61k8Jjwp

Tested: Quanta-gsj firmware booted.

i2c /dev entries driver
I2C init bus 1 freq 100000
I2C init bus 2 freq 100000
I2C init bus 3 freq 100000
I2C init bus 4 freq 100000
I2C init bus 8 freq 100000
I2C init bus 9 freq 100000
at24 9-0055: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
I2C init bus 10 freq 100000
at24 10-0055: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
I2C init bus 12 freq 100000
I2C init bus 15 freq 100000
i2c i2c-15: Added multiplexed i2c bus 16
i2c i2c-15: Added multiplexed i2c bus 17
i2c i2c-15: Added multiplexed i2c bus 18
i2c i2c-15: Added multiplexed i2c bus 19
i2c i2c-15: Added multiplexed i2c bus 20
i2c i2c-15: Added multiplexed i2c bus 21
i2c i2c-15: Added multiplexed i2c bus 22
i2c i2c-15: Added multiplexed i2c bus 23
pca954x 15-0075: registered 8 multiplexed busses for I2C switch pca9548

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/Kconfig          | 1 +
 hw/arm/npcm7xx_boards.c | 6 ++----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index b887f6a5b1..9d1c2a6f7b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -377,6 +377,7 @@ config NPCM7XX
     select SERIAL
     select SSI
     select UNIMP
+    select PCA954X
 
 config FSL_IMX25
     bool
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 9b7a7cd201..f0a96564e2 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -18,6 +18,7 @@
 
 #include "hw/arm/npcm7xx.h"
 #include "hw/core/cpu.h"
+#include "hw/i2c/i2c_mux_pca954x.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/loader.h"
 #include "hw/qdev-core.h"
@@ -231,10 +232,7 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
      * - ucd90160@6b
      */
 
-    /*
-     * i2c-15:
-     * - pca9548@75
-     */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 15), "pca9548", 0x75);
 }
 
 static void quanta_gsj_fan_init(NPCM7xxMachine *machine, NPCM7xxState *soc)
-- 
2.32.0.rc1.229.g3e70b5a671-goog

