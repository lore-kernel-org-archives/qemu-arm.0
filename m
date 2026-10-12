Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93CFCA9ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 14:56:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGHS6-0000MX-Dx; Mon, 12 Oct 2026 10:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHS4-0000Jt-2B
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 10:56:32 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHS2-0005S1-1H
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 10:56:31 -0400
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48af4d4e61fso1387524f8f.2
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 07:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791816988; x=1792421788;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MVSG8EzaWLj+Z754/87jnXfWdb4zSMi3q66mrxn3Q8s=;
 b=NQSpGXuzTnmm4xi7BJk9xPTzk09gqD7ldasP4O1KCYFwz7j3knA7e/zLoQ3g+lvKhy
 BGnSmN7y/ZeRAI+gQGwrOdSZwcAqM2lFbDnyXLicR7v2xFCQThHFbUqocGAxl/ByEH3J
 CcXJ6P91VFuXyRD52QvTqHRhrjPQECzImD5llQVx2kyMva5PqTZuFdxr0W378ZwYiXCv
 xUSrIChMTSpngfM79wagKyxHVhPkXkXrV2rNQRoLnBFnM9EFBgoRRgwBoQDil2egrN1R
 dVpQ7b2YAGoPcKdKcaq/BsC3lIuZrU4tp4gAnNJc9BKYqjqQJrS/ATN4gIJvOtfCKR9v
 m9vg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzBcUY/ydSK4OjoVvqTHmDYffezlIFeC9VwJmktOcuYOz05ed1zsjkP0t17RsiOaR76fz15crxL0Q==@nongnu.org
X-Gm-Message-State: AFq9FYIoinZwoHIGwtcgoGsJMqKw14z1v2PmYabe59j3YJPb5sFsAnZw
 VqihFEMWtP8vy0eDNZX1OkY8+65xA9aTTdT+sUMGDu/qaxv1aijRYV5M
X-Gm-Gg: AYBFou10WsYW14Nn5x+Rrw2tqbsJo6NXNtRiOFySYiYlm4SKmr4/prYdHUavsd1S8sw
 ZLHioQ4j93uoJWFJFrCwkZRd8ZR0Oy8QJJS2zfTujvknwp0RDkFsUXXXMg0DHB75ITGJ4+P9fW3
 N1ZJgEj9S56+ZmN/wswaCASPBdkiSYk3GU2Og/J7KQ2YSzOK6GjqkeaImxpJlm5yL6CgHAd8ZTp
 Q/R+Fj/MFkneV2wYCSn3YYNMXR+OkoaTjy8ERUbOkKJANCu2bUUglyqRFnn/C+/TANCsTWsD8ZD
 zlfI0ZOL32YaNEaMTGqS2jUDwJf6W/NsDaYnRUt9N198uSfWiqcLhJm9ASWab6ncicrX9nBvXOU
 Ry+8lW1nXw1vsbbeeHNndLHoGNCysSGpMR7jLGpIQvzwaLSi8E6WEmAx1cwRBysgCAOz0ZxbXpI
 YxmqdgCoANuYX5XIveqHo6R4nGuqKWPi4TBWFw650wqbxz5YJIJXhkkZ7AmpX4c7/JJWA2LZl/A
 Je7oxZNmrP5eYS6HJgWBAsPI8NRh1t4dtvp56QTrjJhvg==
X-Received: by 2002:a05:6000:3102:b0:48d:ca32:e90f with SMTP id
 ffacd0b85a97d-48dca32e9b5mr11121631f8f.55.1791816988226; 
 Mon, 12 Oct 2026 07:56:28 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9abd57fsm19265393f8f.37.2026.10.12.07.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 07:56:27 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:31:57 +0200
Subject: [PATCH v2 04/50] hw/i2c: pca954x: drop unused header inclusions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-4-4c3dff084ec9@free.fr>
References: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
In-Reply-To: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815519; l=838;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=b9K700bDZsWgDrz5nZ97CmrXARWhU1wSPXweUqGmEJM=;
 b=Tl71FE+9JTd2lCFH9MHeRy9QCAflu+bF7+oW1C+qsX1R2DLonL4r/bn1gjB2xxkmFQeDlxpZc
 +kpBqMhNRD0C6okC3kOgx6cDYO2/aPSPQiSICheFlZcE4sPWrBhIhBS
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.41; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f41.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The qapi/error.h, hw/core/sysbus.h and qemu/module.h headers are
included but not used by i2c_mux_pca954x.c. Remove them.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/i2c/i2c_mux_pca954x.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
index c603446028..c8e75da8b2 100644
--- a/hw/i2c/i2c_mux_pca954x.c
+++ b/hw/i2c/i2c_mux_pca954x.c
@@ -15,15 +15,12 @@
  */
 
 #include "qemu/osdep.h"
-#include "qapi/error.h"
 #include "hw/i2c/i2c.h"
 #include "hw/i2c/i2c_mux_pca954x.h"
 #include "hw/i2c/smbus_slave.h"
 #include "hw/core/qdev.h"
 #include "hw/core/qdev-properties.h"
-#include "hw/core/sysbus.h"
 #include "qemu/log.h"
-#include "qemu/module.h"
 #include "qemu/queue.h"
 #include "qom/object.h"
 #include "trace.h"

-- 
2.50.1


