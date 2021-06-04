Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1132423lfa;
        Fri, 4 Jun 2021 06:07:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjzSYGo/AkZ/GwMsjBAvQIVnHlLIqTuIoEjXFTMbuQXcd0fSGtqtVRbOI8MGyajXeA5s/3
X-Received: by 2002:a19:8157:: with SMTP id c84mr2760269lfd.529.1622812057010;
        Fri, 04 Jun 2021 06:07:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622812057; cv=none;
        d=google.com; s=arc-20160816;
        b=H3k6Gdw/x+5xnlv9JWmKBcB5W40nlFCvXtCglVvomNKn27qnl8C13cAll5lP2Pa50c
         WfRaZu0BUlGoH/ekb2a1g5w2sMAX9sm5Ix8Ni+6nfsKf+DMp7gCtLJ78EpXcGbSmFvLF
         dU6soUQmPiOOmHfm9FGJoHx+Q/yT7k8aefOz6Y4ZuCB59Reg/+3EGi91rIG/888TsLqN
         6BU7L8TsHpixP+j4p1xhh3V0ldtwU6x4SOtlPZaKSp06VkISL5Z9BFwe4Bu1aQEfaHXV
         aF9BOmnjgZfc0OfhjfKPj2fxaOxsrnWDlEY/X1C/kHFokeZb+e1YfkAB75HYXCdyyzdO
         AOFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=G0RLPIkH7hpCKHh0hBYO5x2ioarQya+jGRF5wm/ztP0=;
        b=fIHV0j4OOH0uIF58wy348ICnLOVZ077U+73mEBuahJlDVXu3oQ5KSPld8mtK1FKW1K
         t30jKZXSr+M7uUpzy052D16q2WZPYoWtGpLle1OyvGm/ZmiaqOzk78qvaVW4ehzR05f7
         O5nlpanQnGV9a5RyOL2ObY/MkoCQPVXUjmzwHPhZsbXYicYOMzyTAB0OtG0OvcMrKnk2
         TFJ0UAL0bI0lwlM2ufMWqRVKrTw9TqlR9ZHyqrFDGJPyh5TFo98Rlmvn6lHyDIoetbPg
         fQrnh1txKm0oTDDsKpQ3Tf73/04ClXRxMp7gc0n1s2MDgVUiyEWxxwK3Ama2kXvVwEgZ
         fTuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z0Sg1muU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7si7150977lfg.457.2021.06.04.06.07.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jun 2021 06:07:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z0Sg1muU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lp9Y0-0007Cf-1n
	for alex.bennee@linaro.org; Fri, 04 Jun 2021 09:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1lp9Xo-0007Aj-Or
 for qemu-arm@nongnu.org; Fri, 04 Jun 2021 09:07:24 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:45627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1lp9Xk-0004sN-GW
 for qemu-arm@nongnu.org; Fri, 04 Jun 2021 09:07:24 -0400
Received: by mail-ej1-x632.google.com with SMTP id k7so14355470ejv.12
 for <qemu-arm@nongnu.org>; Fri, 04 Jun 2021 06:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G0RLPIkH7hpCKHh0hBYO5x2ioarQya+jGRF5wm/ztP0=;
 b=Z0Sg1muU83prq88JKS2honOVtVv0h1sc3Z7Xe1Hx2WsfB4EzgADqC0QgOOej5bMHoV
 jstXy2U1WoxoAEn5jAPL6fHyAaQp+n+xFS/kcgcFXFGnlgfuEDT/viWEG/xzScKWvo75
 E0K4pXDOAS+/4diL8hCu321IECn7UN1pEtPBwpgWLpYc+fEBCCrVimj8QCZkE8lLrenk
 dnmjZzKKlNuRcOTEc9UWPxA0WrIAeJ4wXQAQoqrf+uIMiDwhrhL+SIapQ0ioogRHCy/J
 vgAma/1fs9JaL+och3cc7fqg7pyAe4youb8u+w5vZeTntAOWdPrrOEhSjCM/xyQnfxxG
 fL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G0RLPIkH7hpCKHh0hBYO5x2ioarQya+jGRF5wm/ztP0=;
 b=T1pmaiilXBsgjybZk52WPWH7BUADVnOAoKz8zoiPzrhwz7k+vVsE2QR6fM6GXvyZ/K
 n4Ykl6IpC/bUvgBdhIO11zGJKZ17sb8MH62jhmx0Sp4tPDj5tcB5AXvxoyngyUKsFZ4V
 amDi/p+L04RCjdoCwb9Z7HUkMVvezAB9op+DWEyJOsClTeS5lZdLOgC0o+MN+BZcoZzo
 K7izkFKx+K5hFiWOeyA+uTREacdNQR9mabM95JBd6fbIBI4/2Zwp+f0WI3aCQEiAJl31
 JCAAu1yO8EnXqjDx9fhqsWqVx+GTRzvkiAGzeD/r2jtbQCpAyZoiO1goZR5S1LX3HJDE
 tW+g==
X-Gm-Message-State: AOAM5314n1Tw7nU9V/OFlc2W+1Tn3Q2cxxTgpN3TuNSB9bKbnzaFZJBD
 K0JLeQTrgLqpab+2pLvWfQpWZg==
X-Received: by 2002:a17:906:509:: with SMTP id
 j9mr1601327eja.149.1622812037488; 
 Fri, 04 Jun 2021 06:07:17 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-111-173.adslplus.ch.
 [84.226.111.173])
 by smtp.gmail.com with ESMTPSA id p9sm3189265edh.61.2021.06.04.06.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 06:07:17 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Subject: [PATCH v2] hw/intc/arm_gicv3_cpuif: Tolerate spurious EOIR writes
Date: Fri,  4 Jun 2021 15:03:53 +0200
Message-Id: <20210604130352.1887560-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=jean-philippe@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, shashi.mallela@linaro.org,
 qemu-arm@nongnu.org, philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7/bv7dUNh6eb

Commit 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access
check logic") added an assert_not_reached() if the guest writes the EOIR
register while no interrupt is active.

It turns out some software does this: EDK2, in
GicV3ExitBootServicesEvent(), unconditionally write EOIR for all
interrupts that it manages. This now causes QEMU to abort when running
UEFI on a VM with GICv3. Although it is UNPREDICTABLE behavior and EDK2
does need fixing, the punishment seems a little harsh, especially since
icc_eoir_write() already tolerates writes of nonexistent interrupt
numbers. Display a guest error and tolerate spurious EOIR writes.

Fixes: 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access check logic")
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v2: Added qemu_log_mask() (so I didn't keep the Reviewed-by tag)
v1: https://lore.kernel.org/qemu-devel/20210603110012.1182530-1-jean-philippe@linaro.org/

---
 hw/intc/arm_gicv3_cpuif.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 81f94c7f4a..3e0641aff9 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -14,6 +14,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/bitops.h"
+#include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "trace.h"
 #include "gicv3_internal.h"
@@ -1357,7 +1358,9 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
         }
         break;
     default:
-        g_assert_not_reached();
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: IRQ %d isn't active\n", __func__, irq);
+        return;
     }
 
     icc_drop_prio(cs, grp);
-- 
2.31.1

