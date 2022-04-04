Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp295404lfu;
        Mon, 4 Apr 2022 08:57:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGICAIemV3wKS5oFC03ZBZ7qjGI+omPhSJ/b11V1o1ZkyFwjpCl2U9/sea4KtZBtKjwzxr
X-Received: by 2002:a81:f90:0:b0:2ea:cd36:c332 with SMTP id 138-20020a810f90000000b002eacd36c332mr579395ywp.464.1649087842976;
        Mon, 04 Apr 2022 08:57:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649087842; cv=none;
        d=google.com; s=arc-20160816;
        b=J+j32idY8tzLtUqmT2602kqqOGCYCJ5+iWCVPLxNBp3rvS814oxnynK/iRAhU4vFYN
         ckMIkFlDkuRtsvifrjSo/AtlU+DUEKkM9tsPAyj894fS1AbHmeaDK4nDS9wv/nhYc/4h
         GEtDM2fay79v9jRKvsM6kEsvftivlBFjVvQOIC/LRFS6F7+NYsE80L6lr7HKaQEGoGz5
         ug6tFs3LtiWZ0aroNFhcEUXDhoXCLpxYbK/T5er7LHt6o60+7nHx0KojpYBQL1QFN1y+
         nmkpyZvkgf9qcnb0oIF+GDQI00VUGVDn96+pe8i+G2cgpMmgaGDDsg1LX8qKXEaTnU2+
         puvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JriftgZJ9tNiOTYedkPYR5b8es/GLFwCKeN4JFkzOK0=;
        b=he84njG7uas3CM0nmUS3AWvtgO5HCUHRKgYqwg3xyqlS8H6s/iJcL0nog1/c1KyKwO
         yaltEp3iu6iqrQyOoW60d4mfWdp04GEBZP6I7Jg2UBrjf+jQlgsUxI/bwZZNq1tNdUEq
         3YZ4Mvfa0DZF003ykOlEOdAisSXC0q57TX4w36xQl1cDG/Fr5pun1vJmj9hOIfo7tj43
         3aam5KDEPRQbbjNRuUuhQw85GonDa5u2qM/99sxVvlBY9BGCf7P2x3YQL1FWGe9BYBHD
         /i88oNO30XZnUREhN1THVF7C6ohCNQqqGuIGq0nkkSIDQRdzJ7dtlsPdCounB+VczTiB
         3deg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=neOB8Pmk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j187-20020a2523c4000000b0063db51c9c21si3966615ybj.26.2022.04.04.08.57.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Apr 2022 08:57:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=neOB8Pmk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nbP50-0006Bm-DB
	for alex.bennee@linaro.org; Mon, 04 Apr 2022 11:57:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOv6-0004nH-Sd
 for qemu-arm@nongnu.org; Mon, 04 Apr 2022 11:47:09 -0400
Received: from [2a00:1450:4864:20::436] (port=37781
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOv4-0000Sg-3K
 for qemu-arm@nongnu.org; Mon, 04 Apr 2022 11:47:07 -0400
Received: by mail-wr1-x436.google.com with SMTP id z1so2832822wrg.4
 for <qemu-arm@nongnu.org>; Mon, 04 Apr 2022 08:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JriftgZJ9tNiOTYedkPYR5b8es/GLFwCKeN4JFkzOK0=;
 b=neOB8Pmke5sILRSu/ZSOtl19ctDmz/ZZpIQIa/DC+jK0j95g9mROlwRcQE3lD8CqvG
 RYA+JRnJlKBOMkmYzA/tbsDcfFWWl+FVB2EmRaxHKrpLgVaMeZ7UmjrA1+HZTJOe9JPt
 Kx5CTlXIUOPQZmKy5ELNBwqgfu1GcJWgXmmvUtu877QOaKiIE9Lm7o5pu7wZtGWXgACg
 23tUO03HqFB5f++ICenaYvZTriQRFIPQEm3UQTmJ104V/6tZd1bdOFoWx5MgZK3uVtOR
 HvXRgn40gLxY5+Z1rVoypVFe8qAKHjNDoOTEwCWgj1YdcHsB4neOncSYSx7dklywq85R
 YUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JriftgZJ9tNiOTYedkPYR5b8es/GLFwCKeN4JFkzOK0=;
 b=e9PXo87XVnYu8jrlwS3Z1aZI0TVRzOGKrjcc7VMIJj7z4bmD5N1LLdj/LIwwNBpUnl
 rbBO9g9g6tfyzBomrdpgSpw/s6TsE7OaQU/Mx6p2sB10ABdm774jiADOul36tLbVv5+7
 Z4ehlbfx5nYsh7w6EYSPoK1YLh+lnN1YZibn0ZXc3HNKJMeKrkmbKLSZB2YyNUzMreCa
 A3DylMldl7cO6q91jjIj3TuHP5LhMwJiFIVGuO4cUn/C3QtsYCZhpbSQM9XuK844ndfn
 pt2Is7v6pgHS3LE0fCK1Rwm9VvYiUoCn8+XcUyvMs8X+zqcr1Y8Ve03ckuJeLMwvkB7H
 j/yw==
X-Gm-Message-State: AOAM531gdmWDtg5jbFKPGUxUClQwK8I0wC9dwynEJIty2vGeo9bDd4+b
 ABEhe0eWULGsXd2EfuWGcTTuCGCes4H84A==
X-Received: by 2002:a5d:5510:0:b0:206:1150:9f65 with SMTP id
 b16-20020a5d5510000000b0020611509f65mr296878wrv.160.1649087224359; 
 Mon, 04 Apr 2022 08:47:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056000184800b002040e925afasm11731347wri.59.2022.04.04.08.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:47:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.1 04/18] hw/arm/exynos4210: Drop int_gic_irq[] from
 Exynos4210Irq struct
Date: Mon,  4 Apr 2022 16:46:44 +0100
Message-Id: <20220404154658.565020-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404154658.565020-1-peter.maydell@linaro.org>
References: <20220404154658.565020-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4IgbahADM9Xb

The only time we use the int_gic_irq[] array in the Exynos4210Irq
struct is in the exynos4210_realize() function: we initialize it with
the GPIO inputs of the a9mpcore device, and then a bit later on we
connect those to the outputs of the internal combiner.  Now that the
a9mpcore object is easily accessible as s->a9mpcore we can make the
connection directly from one device to the other without going via
this array.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/exynos4210.h | 1 -
 hw/arm/exynos4210.c         | 6 ++----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index 215c039b414..923ce987627 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -82,7 +82,6 @@
 typedef struct Exynos4210Irq {
     qemu_irq int_combiner_irq[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
     qemu_irq ext_combiner_irq[EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ];
-    qemu_irq int_gic_irq[EXYNOS4210_INT_GIC_NIRQ];
     qemu_irq ext_gic_irq[EXYNOS4210_EXT_GIC_NIRQ];
     qemu_irq board_irqs[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
 } Exynos4210Irq;
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index ef4d646eb91..60fc5a2ffe7 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -252,9 +252,6 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
         sysbus_connect_irq(busdev, n,
                            qdev_get_gpio_in(DEVICE(&s->cpu_irq_orgate[n]), 0));
     }
-    for (n = 0; n < EXYNOS4210_INT_GIC_NIRQ; n++) {
-        s->irqs.int_gic_irq[n] = qdev_get_gpio_in(DEVICE(&s->a9mpcore), n);
-    }
 
     /* Cache controller */
     sysbus_create_simple("l2x0", EXYNOS4210_L2X0_BASE_ADDR, NULL);
@@ -281,7 +278,8 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     busdev = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(busdev, &error_fatal);
     for (n = 0; n < EXYNOS4210_MAX_INT_COMBINER_OUT_IRQ; n++) {
-        sysbus_connect_irq(busdev, n, s->irqs.int_gic_irq[n]);
+        sysbus_connect_irq(busdev, n,
+                           qdev_get_gpio_in(DEVICE(&s->a9mpcore), n));
     }
     exynos4210_combiner_get_gpioin(&s->irqs, dev, 0);
     sysbus_mmio_map(busdev, 0, EXYNOS4210_INT_COMBINER_BASE_ADDR);
-- 
2.25.1

