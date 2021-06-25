Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp1412158lfg;
        Fri, 25 Jun 2021 04:19:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjCu9+vvkRL1hA/AnIwbTHxs6cjeKPSXpam+9QTQF2NJEfUVxyBbfukK7QFnCeixKjynrn
X-Received: by 2002:a1f:3a4a:: with SMTP id h71mr7075487vka.20.1624619951075;
        Fri, 25 Jun 2021 04:19:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624619951; cv=none;
        d=google.com; s=arc-20160816;
        b=QbwITA3vc8YJoM1VwleCyyKIhcODy9pdczr8/n9ILpHPdnMrTLebeeEhOAOnc61ygw
         XyRG4I7VPGJCPJMpW3bEXqbXsj2kNYJ6nQQBYRILD5p+4c/5tOFN1NYeyXxtB4devlk8
         xn6wC+/JJg61NHKn454tHDPY2kJrWVM0oRYrCOv3h2et2Kbg1pff41ZsE5bGWihk9GEm
         FwTF9C1tAF5q2ahKuZ/+AsNF+629PySDzISoamIXvkRav4uiLFEF+FBUCC1nBa4VMQ2m
         VRvd/U+05/RrdofBiBYb7kdkhMKsFHlO00IJvT4KVFfb+G6jM65KB7DPIimezhsanOGU
         GYxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=72EAHzjgI7n9esbIxOKx7xfZpD41wmTxY05X8fNraEE=;
        b=CnyzmGvEZvPN1Xz7VR3xfKOB1KbbOxe/RO9yTuo+g0h+tvhVq9rHgS9A/5TPuqlihL
         98AoaDNnDVDm2tdYXsYc28GWCzwzo+gdRHA5aMzrmxmWqIre75LBXBLaFruo67Cy0cqN
         GsMOL1YiupUd83aemXmLb8kjO0kn96H4e6hvSmUJkF9jsDpwGNT8eK53EcyB9dZFa51R
         KfG3K3fF/cSWLXAYCbEq6KHHKEE6bx/hnn0rb/4D1I/LNIk7HdPVdqtitqBSK64Mwn/h
         ueIWD7oYBEhtnIx7fJ8fY6Oy9sDEZpxZkIBvKF4qj5Cz4xb79HtPHDlXFJgBrG1pz4AK
         9Z3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BS0i51QG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7si4717936vsv.123.2021.06.25.04.19.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Jun 2021 04:19:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BS0i51QG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lwjra-0007fc-Bm
	for alex.bennee@linaro.org; Fri, 25 Jun 2021 07:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1lwjrP-0007cv-Ui
 for qemu-arm@nongnu.org; Fri, 25 Jun 2021 07:18:59 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:38845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1lwjrN-0004W0-Dc
 for qemu-arm@nongnu.org; Fri, 25 Jun 2021 07:18:59 -0400
Received: by mail-lj1-x22d.google.com with SMTP id x20so5244072ljc.5
 for <qemu-arm@nongnu.org>; Fri, 25 Jun 2021 04:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=72EAHzjgI7n9esbIxOKx7xfZpD41wmTxY05X8fNraEE=;
 b=BS0i51QGphBB7lAKKvSacnw0beS4Yp1wepo2Ec0vsYwt013aBIs93AOUQY76eP2tlI
 Z3rysiwTV8Nz0630W5GcwrlaXf0xRwYNumdMgYr+/O5lTVJjCFRVnGY11gfa0x5x9QoL
 UUyM4kUGcjMLHcYeCyhyNYScoFvqSWy9Amn+zaDDGMUgSN9D5x7VUm4pCqE8Bv/9iS/G
 DbbH7YycLmxdYyc2RsS1pTOarJtrtz4HAzImGS7bYwL9NCROzGgIdyvyHxQQe9IVoujr
 j6lL01abans+LpGkfqyrk4Pd5pqiUvnYZeg/TY8aRE6JtWW2vQyPZQSQ86778Qt8goPp
 +w0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=72EAHzjgI7n9esbIxOKx7xfZpD41wmTxY05X8fNraEE=;
 b=tziuFotYogzMvPSSLNnqmE1gFS/BXbERovKdsQgGH8V6spFAxsQH0bX2VkXRNYeoeL
 3Eg4/UknyBj+btxwFzpbhcTTWzzvmtRoA+98YOpJDnFFX8uksHS0lDcijKHo27NgczDQ
 07TjCpyT2iqsVQlx/zT6QeV1auGswajuFz9Hal8BaEPZIDR893vR0mncIezLDuBHkvpb
 Im+U/8Tyszvvdt8dYCOvUfmaP2u9NIdCNc+E1Og309V5gEto9gWtUEDYZy6BxRhiugwa
 vhH1LF00155/hYWmN5P0iQBb8NHu04Gci8+UiUrACl/7AzKqmIQdWql+G4cJkGwPoMyX
 m3FQ==
X-Gm-Message-State: AOAM532cI9RsJ/hBTVijTSjkNMy1a2glnM2bHQP1cv53dQ4zScbIi8Mj
 BGqwyIKFK1QLVOi6juLGS/zDXg==
X-Received: by 2002:a2e:3619:: with SMTP id d25mr7614924lja.439.1624619935974; 
 Fri, 25 Jun 2021 04:18:55 -0700 (PDT)
Received: from localhost.localdomain ([91.193.178.173])
 by smtp.gmail.com with ESMTPSA id p19sm536354lfd.70.2021.06.25.04.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 04:18:55 -0700 (PDT)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] arm/virt: fix irq mapping for gpio_pwr
Date: Fri, 25 Jun 2021 14:18:41 +0300
Message-Id: <20210625111842.3790-2-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210625111842.3790-1-maxim.uvarov@linaro.org>
References: <20210625111842.3790-1-maxim.uvarov@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JOKt8+goTXZ4

Fix irq mapping for virt machine reboot and shutdown
interrupts triggered from ATF code.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 hw/arm/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 4b96f06014..d83f4ebdd3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -846,8 +846,8 @@ static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
                            "gpios", phandle, 3, 0);
 }
 
-#define SECURE_GPIO_POWEROFF 0
-#define SECURE_GPIO_RESET    1
+#define SECURE_GPIO_POWEROFF 1
+#define SECURE_GPIO_RESET    2
 
 static void create_secure_gpio_pwr(char *fdt, DeviceState *pl061_dev,
                                    uint32_t phandle)
-- 
2.17.1

