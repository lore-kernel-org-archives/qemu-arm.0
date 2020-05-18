Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2878120lfb;
        Mon, 18 May 2020 02:52:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzHZBIiBmUhgYOz6o4saVxhABaRKHcHk9oOoAX2FQVx287N6dTNnxeLc7odsx6XZv0kio1
X-Received: by 2002:a0c:f054:: with SMTP id b20mr14538398qvl.112.1589795558055;
        Mon, 18 May 2020 02:52:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589795558; cv=none;
        d=google.com; s=arc-20160816;
        b=J7aACZ0P+G1kYMWQbcb7NoKsIC3rWGZXCHrstLAY6YpvSrKvWO0TmiG44n+OUenQP3
         BbNUcHYt2rYM9kAIDkwhTQONQS9/uzvRhxsMUgRJ9F+9zUaaQSQVHTyjM3x85u1g1Fau
         NsIbW7bQCehCInrHK0LeDBMOYvtv40XFOELn3NvUz15rZ2ynE8a9FlYFXdML1fEZLYhQ
         K9lu+Tng6fALC7W8uBfyD+7TpfGwIWSiPHjH1dOpNF7RQUmLVYJXtOxUWGOrdUQqomXa
         /ejv88cQSuNmsLF2k4Gnqh2TUB4J1x+I+TwiUkhJjtj6UK7Y8tEG4IU5sZ3r+ymGPUM7
         R+sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ld0kZiwSV3FEUIkheCStHZLy3HZpc3e2fMK1cMK95O0=;
        b=ijiOLItWASGHoYFJ63rRIuctksF8yi+YAjmex7WzgQqRL10DGWqBSrumbvK2Ft5seO
         k3ePb4z34JnE9+oG3Q3CsAgQ1i+hexoC5/aUrMD2e/4Sx3EXLbA25Ju2ebioQ4llRIfC
         CGYho+Ncm9UzLL6ArTbyBwSR7ZzQVWx1+J7Od2Jy8VKysm2XjQXi4F9XVTKfbi+ewQVu
         g9gJeFpUlpWFqP8tgLS5EsFHb2ITaMwyI++LPtF6Lx1ygqenpagikT+DnZvz5mfTzDpE
         +KZzI2ZFuvHPqBNLGyw+Gk08HfQrBCK5FXfUWj7GxcY8c7OlCuIrIICQXJiGX/htNn0l
         3tdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LTi9br88;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s17si5025746qkj.364.2020.05.18.02.52.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 02:52:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LTi9br88;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:60114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jacRp-0003bk-HK
	for alex.bennee@linaro.org; Mon, 18 May 2020 05:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jacRR-000347-Jk; Mon, 18 May 2020 05:52:14 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:35722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jacRR-00017q-0B; Mon, 18 May 2020 05:52:13 -0400
Received: by mail-wm1-x342.google.com with SMTP id n5so9613152wmd.0;
 Mon, 18 May 2020 02:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ld0kZiwSV3FEUIkheCStHZLy3HZpc3e2fMK1cMK95O0=;
 b=LTi9br88Mg+l2JDevPEYBoBXFZ/MUbIh13shVznZvzqkla8ae1/90XG7T/8sxE1DjW
 PoRHyBT/qiRxpcAGqNrbhmTnevzrKBahzfBD/0L0LuZQaJceDhBZilgjcMA825GbgLHA
 S0zQ8h06YV1VoSPeKbJ6Fy6eQ7SmZepjd24QwrhTgx77Q8ikYcELUxBFU/r7KW7GN76E
 W00hEM2mVv8fH0UlhT6xjCBgyh2aYfT9BRoHOMEr6TTzy3QUGao9AVlBmlObV1ofgK91
 sISh6m1ipOGroUN2xcVpyEAA6jJ3omIbTVTGPJc5GvRRrqNIPmT8iGhySRERPPyK5TP2
 Oh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ld0kZiwSV3FEUIkheCStHZLy3HZpc3e2fMK1cMK95O0=;
 b=UJWKnZZuMP1JXYkdURsCyZ2TA7QrMLvoN9Dw0cE8Ct2TriMPakk/+z5jAuVpddj6yu
 jkz/dJ69eebsFwYBSUjGGcT7pAQfZLK/rgvrVq6frPO1v7T3ifFnYss6YB9ThUhmogC7
 KlPLZleKAfVpOoF66DKWrnf/r5ybKKyyzPcSfKhGzxKASx/cHxAsQqL2mJ+ZMZHgu7rc
 VByN1WvVa6o3zRfLK+E7E88INfCUZZdqLpzi0XruAp1G8HZc9PyeYNQmheX2e4yLcJaL
 Fo9Y0vq59W0MUe5YqR3v3iIZqNhVxyL8kVAIDcsDf2pTK60kNyTVphzrf2iAuQvDHTd3
 NcIQ==
X-Gm-Message-State: AOAM533spA7cRXdpwYH05CZbj+iIORHFrhFhWDaK07B1Hs+hGLb3bjH8
 0qycpHX3yRC3HrTW4MAaUc4+oyYk61c=
X-Received: by 2002:a1c:6287:: with SMTP id
 w129mr19166621wmb.151.1589795531132; 
 Mon, 18 May 2020 02:52:11 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id r9sm5453542wra.52.2020.05.18.02.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 02:52:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] hw/timer/exynos4210_mct: Replace hw_error() by
 qemu_log_mask()
Date: Mon, 18 May 2020 11:52:03 +0200
Message-Id: <20200518095203.1013-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200518095203.1013-1-f4bug@amsat.org>
References: <20200518095203.1013-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NJ5FdcfBSpvY

hw_error() calls exit(). This a bit overkill when we can log
the accesses as unimplemented or guest error.

When fuzzing the devices, we don't want the whole process to
exit. Replace some hw_error() calls by qemu_log_mask().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/timer/exynos4210_mct.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index 570cf7075b..8398b774b2 100644
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

