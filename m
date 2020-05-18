Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3067547lfb;
        Mon, 18 May 2020 07:05:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+eADRtlbiigg7KYd9N+EjwBO9AN+QxvuYTtdLnJQ8VV1KuHTBFBlY7gqSNWN0kQZ46RQ4
X-Received: by 2002:a05:620a:1131:: with SMTP id p17mr16263383qkk.248.1589810742950;
        Mon, 18 May 2020 07:05:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589810742; cv=none;
        d=google.com; s=arc-20160816;
        b=jZbqDJ9SU1hf074uRP92cUQz+Uqp8EmXOuiYr75eL2VlCEyv9WCISaiWFnjOFV+0P+
         WHsPG0bctWYSp+ZO34k8sCm/7J9GAXa4AAZV9jHCw+OeRrhjnEYFTpzuXqLkhSGE9Age
         nLB3Z1Zz5tvTLC6pr8wZ/Hj+l0Um7KeDylLL6KKvj6Vn7PTQcgi53TtR6Wc/BJ3XOFG6
         cb6lM2wMJJ8RRWtNheDp5v6ZSJMq6I6weVWc0eyz5sCk+Y/8hKQkwZDwRidWZ2gAu698
         7Tjv6ZxH4Ghtjceb+TMyobd6sGq5u7aUPzrqso1SWv7XqPh5S5DHQUYGzcKKyXUExle+
         sA8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ynbMaAjpiD0x7UQ7qyXtXy4p3Mbw7B/2c81S4GZ2qwY=;
        b=L2ObCAATYJ0Ti1FM5Okkg7P1jycI7pOJP91SopZawjMbcKC0h3bVf/dD1AwJpkYpxH
         nWcvpLX2tGvoGOECjI3VpSIeSY7JZss8dFPYvWULXNqE+XSsBxqXN+tn6pCjyjp/b+uH
         i66fJuWs3S2wV6JUtpu5h0x8VbM75OkyT8iw7MFBCfiPdG8jE4lCYy1YheGEQk+hULXB
         ETv5IjMmtrqXbez7ACaIGvXODrss488th1i33/M/MqMdXrhOmQ1OvezzWyTKvOznhMzZ
         bAyS/8r1vp+yHyz7BMckGF7t9tor69LBr0uB97dDDKVXNNVk58bv4rBosayXXHwL0SZC
         xt0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BPO2G5bb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1si5828267qtb.163.2020.05.18.07.05.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 07:05:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BPO2G5bb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:55544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jagOk-0008Kp-AY
	for alex.bennee@linaro.org; Mon, 18 May 2020 10:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jagMV-0004JO-Kf; Mon, 18 May 2020 10:03:23 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:39225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jagMU-0001BP-Nd; Mon, 18 May 2020 10:03:23 -0400
Received: by mail-wm1-x344.google.com with SMTP id w64so10563494wmg.4;
 Mon, 18 May 2020 07:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ynbMaAjpiD0x7UQ7qyXtXy4p3Mbw7B/2c81S4GZ2qwY=;
 b=BPO2G5bbStMKoFidT2VTx7PyLs2AYrJD/RBVIMqaeenYWBRdzL2WdryUCuQCPWh2jI
 5mQ93bcfwgrCxHAJ/50H2TjtRxTFaNaNQRCABd0TXTwDbEEqlvX2dhlcOpAF513pM4rY
 VcC/wcwMDiile1YVcJwMZta5RWiCiyXRhaJp5pqjzv22qGrK1+dlr/IjYT285uUf809Z
 P++/5JlNgowdNArhzIBAXr2ADwvClY8PL7v+kER9RY1yndW8LhvcuSDbGnl1X5+sXQKO
 EXQtONRJiuKMWaZVg+vYrsr2JvVe1QE1XJ7mOZjdgQRDcQKYPOYdwJtDBgn5TgPmjy5v
 iIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ynbMaAjpiD0x7UQ7qyXtXy4p3Mbw7B/2c81S4GZ2qwY=;
 b=QHGftmVvBSlO3EwE8vcgJpmZgdaIJdGy4SzsV3UHxgu6XRz5QCdGJ1QhYaJsE1H539
 hKhUsBqXLv43PyA+HNBWWsUQLpUAoJ4LdDkE1xNlUEs1dXjVB/AaS8FH2TQu6Q+dFBwk
 6l+POA6I16BMy1OjJ7XvF/sK6v1xqgJbgppfEd8VX97p9md2N1EFZNBE3p6m1zmKc3au
 KQ4FmzEcrozos9lItWTOwBD2NqCI6+shJwKU/6nK8eY4Ux1xfWxg5MVNqhW2WOcnIW8T
 dfI5CcvdUsMiVrorTpn/9+wfDMgb6HxIK91tcTNu+CwvDGgXXoRJzeBa8FaUMTmJHRhk
 QIsg==
X-Gm-Message-State: AOAM5322Ldcf/wuXAQWsplJq+Ks3OhYtQ9njtlYmGaz7lEIcsO8zwVc9
 RLLDB/u4HlDdsGaTwSZ5qdcyWpFf77E=
X-Received: by 2002:a1c:acc8:: with SMTP id
 v191mr20554002wme.154.1589810600658; 
 Mon, 18 May 2020 07:03:20 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id s67sm16611946wmf.3.2020.05.18.07.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 07:03:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] hw/timer/exynos4210_mct: Replace hw_error() by
 qemu_log_mask()
Date: Mon, 18 May 2020 16:03:09 +0200
Message-Id: <20200518140309.5220-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200518140309.5220-1-f4bug@amsat.org>
References: <20200518140309.5220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oJhApV5XJ/fS

hw_error() calls exit(). This a bit overkill when we can log
the accesses as unimplemented or guest error.

When fuzzing the devices, we don't want the whole process to
exit. Replace some hw_error() calls by qemu_log_mask().

Per the datasheet "Exynos 4412 RISC Microprocessor Rev 1.00"
Chapter 25 "Multi Core Timer (MCT)" figure 1 and table 4,
the default value on the APB bus is 0.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Fixes -Wsometimes-uninitialized:

hw/timer/exynos4210_mct.c:1158:5: error: variable 'value' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
    default:
    ^~~~~~~
hw/timer/exynos4210_mct.c:1163:12: note: uninitialized use occurs here
    return value;
           ^~~~~
hw/timer/exynos4210_mct.c:1063:19: note: initialize the variable 'value' to silence this warning
    uint32_t value;
                  ^
                   = 0
---
 hw/timer/exynos4210_mct.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index 570cf7075b..29a4b10676 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -54,7 +54,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
-#include "hw/hw.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "qemu/timer.h"
@@ -62,7 +61,6 @@
 #include "hw/ptimer.h"
 
 #include "hw/arm/exynos4210.h"
-#include "hw/hw.h"
 #include "hw/irq.h"
 
 //#define DEBUG_MCT
@@ -1062,7 +1060,7 @@ static uint64_t exynos4210_mct_read(void *opaque, hwaddr offset,
     int index;
     int shift;
     uint64_t count;
-    uint32_t value;
+    uint32_t value = 0;
     int lt_i;
 
     switch (offset) {
@@ -1158,8 +1156,8 @@ static uint64_t exynos4210_mct_read(void *opaque, hwaddr offset,
         break;
 
     default:
-        hw_error("exynos4210.mct: bad read offset "
-                TARGET_FMT_plx "\n", offset);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX "\n",
+                      __func__, offset);
         break;
     }
     return value;
@@ -1484,8 +1482,8 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
         break;
 
     default:
-        hw_error("exynos4210.mct: bad write offset "
-                TARGET_FMT_plx "\n", offset);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX "\n",
+                      __func__, offset);
         break;
     }
 }
-- 
2.21.3

