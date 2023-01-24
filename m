Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4004813ejc;
        Tue, 24 Jan 2023 15:21:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv6iPn8hF3qPMiT9Zm3igJuRcyjocx9LnMJI9Rn+UnWHhinyfEXNW+n8yOSOHS3MCry1L5b
X-Received: by 2002:ac8:1402:0:b0:3ae:189c:7455 with SMTP id k2-20020ac81402000000b003ae189c7455mr37438237qtj.47.1674602497900;
        Tue, 24 Jan 2023 15:21:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674602497; cv=none;
        d=google.com; s=arc-20160816;
        b=f6k1UAAPDaBVksUyhs6pWaWUhNRN5A06yPP0FziperjqULJibdodp+MZZnmfOzsYMu
         vB9AaH4TXNF110iQkT3quXoSKaNMZ9lGxRtFQbXa24iVJd2DB6QiTylzy/wl9z79rN9x
         doDptAZberNfxQojduMcXC5My/ryiMBm4iqgqxGFTlijC7GWPyor8j7jwo2ejeHvfC0D
         Rf5KHx2gKTyIiRiHrL47oXIY/dsvAy+oMezYAw2gyWBfAW+tDsm5KheR2Vx5OHg7rgI6
         NZD7HxUi5uoPRs45RbdSfMlgwMp9I4VtedswIqJEOt7C+F9kUbf5oqKxPu2ntG7pqvJ0
         SUoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=1ERJ2Ch1QZiTxrD9CCXUoOLeDzJoYJb8Lu3vpv52E10=;
        b=BbfCE1qQO4Hpp9097clnJ9+MklTrdUjmPE9UInq7SZgKGjNAtqxBEfj9TNQrVgGDaQ
         G9cEljtRuQmJr5xvZaVeL+eJaci5AfDADX3tnWgZZLe+05oYGwvpbjp/EBaMeFRXYoqL
         8x9yqwUAPf4KUSt0XEKBfN+pbJXJBihhgJz0r2H+DqRwvx6Vgl4Z80odowa0ILzlOELJ
         jcY+KMeo4l4XqxG532j4tAnHM+i0LP9IfMiYYDi1XugoRYgt3ciDXARdq5G7LGqdl5Qy
         gaJXJPvAogGSOXVtUMedCyL84Da0K+/f+jppNQVTR7eFDJaZA793oSIJ4BFwSWxYpjGA
         eB+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IvVXzOWZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s199-20020a3745d0000000b006fb05de4731si2395621qka.722.2023.01.24.15.21.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Jan 2023 15:21:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IvVXzOWZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pKSbK-0002dE-1u; Tue, 24 Jan 2023 18:21:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKSbH-0002cv-Gw
 for qemu-arm@nongnu.org; Tue, 24 Jan 2023 18:21:11 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKSbB-0005B5-Ea
 for qemu-arm@nongnu.org; Tue, 24 Jan 2023 18:21:11 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 z9-20020a17090a468900b00226b6e7aeeaso276092pjf.1
 for <qemu-arm@nongnu.org>; Tue, 24 Jan 2023 15:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1ERJ2Ch1QZiTxrD9CCXUoOLeDzJoYJb8Lu3vpv52E10=;
 b=IvVXzOWZqdG2xbBkAQTJGgVIz6AyY9O0CWAl5upP91Ioh3sqUxgzCb9KvFkXYqGaDE
 KPKj0tRTKmTC/F/7mI3z0g0yg2n18Ln9k+T7P+jH1Q3gDqNhzfvkKCsOjVD/8KP5S5uL
 hCbevRSHDC4gYSEXDC5z6Sxg/V0sdl72ojAGc6Coh9VPyABJUQBp20HxmoAJiFZPqZId
 mgbDaIOD+IT8UC0Bc/13SSaeUu1C9beagBcqurrePJKLKMkNyi8jchLNxrNggzuXQAT/
 O7JpjRVeUwslyv3DnIOnxS+lT9w/Mv7I3wBcctJWeHOG9+E4kqQmKOesRMhsCisLf8lK
 D9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1ERJ2Ch1QZiTxrD9CCXUoOLeDzJoYJb8Lu3vpv52E10=;
 b=GMEkxog6HJ7U4cqy96WwQVcwZcA876XYFyLwWgHEvWWJCdOK2O9lxi0u7zwuCRWjgh
 fs6j9UCHfSEvN3ZLJ21S9kpncch2dh5MMab1p8Paa5dFCSWqi9Z17Zx4ksM9G6sZsp50
 wImOQ+gC63TtZuL0oFLk9G/86gg8s26GiyixseeaN5g/kROCSHWo0sh8Mmb2BQq1x76F
 0/cGtqG6vz8CHXQA87wDhz5psXh23fzTp0BaeKf5CqUe+wBqOupxsj92z07Xpcp2gJCs
 PGHQ+e5qAEmvy3uN18rn332KWkB1OfDp080U0zClkN/YzcPHh6l4BZZ2SDcFK9pz97wN
 pMAg==
X-Gm-Message-State: AFqh2koQAL0Pr9v+DIaM/2SuXw0kyRWS9LyhLfwQeylPLm4eE9XERixE
 jV1VfyTeY4F5waBo+PHDnaIXd18P9SJtiyiD
X-Received: by 2002:a17:902:b713:b0:194:3fa4:3f46 with SMTP id
 d19-20020a170902b71300b001943fa43f46mr29383782pls.29.1674602463713; 
 Tue, 24 Jan 2023 15:21:03 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a623809000000b0056c2e497b02sm2194090pfa.173.2023.01.24.15.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 15:21:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH] hw/arm: Use TYPE_ARM_SMMUV3
Date: Tue, 24 Jan 2023 13:20:59 -1000
Message-Id: <20230124232059.4017615-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 3Aj7kXwAKn/Y

Use the macro instead of two explicit string literals.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/sbsa-ref.c | 3 ++-
 hw/arm/virt.c     | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 4bb444684f..8378441dbb 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -29,6 +29,7 @@
 #include "exec/hwaddr.h"
 #include "kvm_arm.h"
 #include "hw/arm/boot.h"
+#include "hw/arm/smmuv3.h"
 #include "hw/block/flash.h"
 #include "hw/boards.h"
 #include "hw/ide/internal.h"
@@ -574,7 +575,7 @@ static void create_smmu(const SBSAMachineState *sms, PCIBus *bus)
     DeviceState *dev;
     int i;
 
-    dev = qdev_new("arm-smmuv3");
+    dev = qdev_new(TYPE_ARM_SMMUV3);
 
     object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
                              &error_abort);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5f1fddd210..d103de8c2e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1344,7 +1344,7 @@ static void create_smmu(const VirtMachineState *vms,
         return;
     }
 
-    dev = qdev_new("arm-smmuv3");
+    dev = qdev_new(TYPE_ARM_SMMUV3);
 
     object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
                              &error_abort);
-- 
2.34.1

