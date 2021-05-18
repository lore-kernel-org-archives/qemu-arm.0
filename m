Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp719303lfm;
        Tue, 18 May 2021 12:42:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHCGNtT9d/9yYy36yYyDfM0JxyAuL77sA0zyEZQ1g6iEExgpFqHE1nI0/02WoqnT9tBY9P
X-Received: by 2002:a02:a19c:: with SMTP id n28mr7777598jah.117.1621366926976;
        Tue, 18 May 2021 12:42:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621366926; cv=none;
        d=google.com; s=arc-20160816;
        b=rARzCioAcTJX2o0Ry7kaww1OGUz3MnOdjbnCFEo44Oi9uixgPIkxRUehoFga3RUOtQ
         FN+0QTx5Wo+C8iA5pQUe+i+jPFySfHo70Zj3vwF0wSqxdTVTRdTWAK/bYA+WvsrrYNpb
         Lp0Z2CUMUlgJLDkJYVaOq5dBQausfYDZ5uflJTMqS/uTo3jpJwqE2PuQ+qx7+WO2SXVn
         OCk7faI1Z6mj2OZOZT0rdKpUOymwlYAnFraL8EeeUT5ax/XaPJ7eOvPa6DPTvyL14KSe
         WSkj6zlzwHKIBJLxgLPVZeqDvdj+vyP7w3km72UuRr2xRvnEc5tYPNAdmn+6cwiO8R2W
         jyJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=wi/OXFrMKlEqPmSMbr0B+gTzFcvO+RgxBM3B9kQVjzE=;
        b=QdGNLWwURe/tSvtHd2x6HJrkbpxMXVWzYGdTCgqrpdUn/Udip5svFZDFr3fzKfgyCq
         YM9ZxaSCoBhJzkZdpXfgMqukt72/XBZdXCJibl3rIYLLxJWmcdsRnWt9n0EuAGZzWIjC
         ad6GJFOGOFaB8Q2p7AOv4Iv/ivcSfyEEsLbxcbdjVsjRNwREln7Eo3rIED8NCIpw0k+i
         Dzi14ZKNul09Npl1xjVCxGMavZ5lXyeieaBYzhAVKRCq6dYeojGGmnlbK3WVjnKsDNNs
         lAbPwo/RrUQL1Y+HhVjgAJhkIPuqEo7t4G4uC+qbx8AgzTbanPe6DpR7ekEYzGjtiH2A
         EwVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=MpUTsiWh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9si7118780ils.154.2021.05.18.12.42.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 12:42:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=MpUTsiWh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:59088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj5bS-0006B9-8o
	for alex.bennee@linaro.org; Tue, 18 May 2021 15:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3cxikYAcKCEAxgpvwtgiqqing.eqosgow-ctopqpipw.qti@flex--venture.bounces.google.com>)
 id 1lj5b4-00067V-Nj
 for qemu-arm@nongnu.org; Tue, 18 May 2021 15:41:43 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:45752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3cxikYAcKCEAxgpvwtgiqqing.eqosgow-ctopqpipw.qti@flex--venture.bounces.google.com>)
 id 1lj5b2-0003gW-J2
 for qemu-arm@nongnu.org; Tue, 18 May 2021 15:41:42 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 d63-20020a254f420000b02904f91ef33453so14824560ybb.12
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 12:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=wi/OXFrMKlEqPmSMbr0B+gTzFcvO+RgxBM3B9kQVjzE=;
 b=MpUTsiWhj4u66naM4O2ond0IfWxdBRiMiA18CuWb6PAKKIk8h/V69KY8FSoRojOE+g
 bYRUYN0GH5FU4/2NZ2xqV2sLhMQZq3PsAimqlhAnuKT2WHfxZ4YnmxjbvrwNN+cTHfME
 fglF43lXf7bw4WLG1RpOIUgMxo8Gh+5DxxTffvvcRSqOIK1BEBVI4Bie4ANOdI6BWuVO
 AbgsuXpAIDHh0HFGz3HWeSoDc6mbbAPs5k8er5LTNQh9949BzXa6RgkcAU4kFDWbsCZ3
 XAmvwvmJq65z3FyJzmdWrpy33my2qEyW6urpFBK7cVAqZvcEmBMdWiSTGFUaVRChxpAh
 NOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=wi/OXFrMKlEqPmSMbr0B+gTzFcvO+RgxBM3B9kQVjzE=;
 b=Y1qW2q94y7xOhqYVlsZ+b1Xi4+WCtvVwY5tS0NpDe3TQnUs/Mzc/Cbvzo15jPzPXl6
 i6/Jeo1qMc+V3gITmexur6QUQz7nRT3tciyrOPToTNx6+/4Jytx0p3gSD4kSEwuHJKiv
 fXSNU3Tgbyw2ylzBMVo5+0IgkJx4dmR1mlAe3l+zcwuyQkV6FXULCBC5rr91zvcWtJoI
 Xz7JWvHkyeNPmEothv02FXWX9p+gmWg84UNs8Qj3xHEi+Q71/75J4I1IrNifqqpDOQel
 Icdf/aM89RclXI2a8BEz05ISfLJz1WVt2xNHNE34OE7d14VvpcgUW3GhnWeSVz2U+kiA
 oh4w==
X-Gm-Message-State: AOAM532DYHcbapb71M7xuo3GreqvYeWQyYf7ITBQTAx8I8LQ05vRk4ku
 gkiau6kRnQJJJFmMTE5gAiCqk8Fp403G
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:5902:8a04:d917:4e93])
 (user=venture job=sendgmr) by 2002:a25:218b:: with SMTP id
 h133mr9813508ybh.160.1621366899094; Tue, 18 May 2021 12:41:39 -0700 (PDT)
Date: Tue, 18 May 2021 12:41:17 -0700
In-Reply-To: <20210518194118.755410-1-venture@google.com>
Message-Id: <20210518194118.755410-4-venture@google.com>
Mime-Version: 1.0
References: <20210518194118.755410-1-venture@google.com>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
Subject: [PATCH 3/4] hw/arm: quanta-q71l add pca954x muxes
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, clg@kaod.org, 
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3cxikYAcKCEAxgpvwtgiqqing.eqosgow-ctopqpipw.qti@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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
X-TUID: pSULWkCTOQl2

Adds the pca954x muxes expected.

Tested: Booted quanta-q71l image to userspace.
Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/Kconfig  |  1 +
 hw/arm/aspeed.c | 11 ++++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 9d1c2a6f7b..4a033e81ef 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -413,6 +413,7 @@ config ASPEED_SOC
     select PCA9552
     select SERIAL
     select SMBUS_EEPROM
+    select PCA954X
     select SSI
     select SSI_M25P80
     select TMP105
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 3fe6c55744..35a28b0e8b 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -14,6 +14,7 @@
 #include "hw/arm/boot.h"
 #include "hw/arm/aspeed.h"
 #include "hw/arm/aspeed_soc.h"
+#include "hw/i2c/i2c_mux_pca954x.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/misc/pca9552.h"
 #include "hw/misc/tmp105.h"
@@ -461,14 +462,18 @@ static void quanta_q71l_bmc_i2c_init(AspeedMachineState *bmc)
     /* TODO: i2c-1: Add Frontpanel FRU eeprom@57 24c64 */
     /* TODO: Add Memory Riser i2c mux and eeproms. */
 
-    /* TODO: i2c-2: pca9546@74 */
-    /* TODO: i2c-2: pca9548@77 */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "pca9546", 0x74);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "pca9548", 0x77);
+
     /* TODO: i2c-3: Add BIOS FRU eeprom@56 24c64 */
-    /* TODO: i2c-7: Add pca9546@70 */
+
+    /* i2c-7 */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9546", 0x70);
     /*        - i2c@0: pmbus@59 */
     /*        - i2c@1: pmbus@58 */
     /*        - i2c@2: pmbus@58 */
     /*        - i2c@3: pmbus@59 */
+
     /* TODO: i2c-7: Add PDB FRU eeprom@52 */
     /* TODO: i2c-8: Add BMC FRU eeprom@50 */
 }
-- 
2.31.1.751.gd2f1c929bd-goog

