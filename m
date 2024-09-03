Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1355491njf;
        Tue, 3 Sep 2024 01:36:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW8hx6As+QkEkX8XEycH/WdLqhF5hvYh4FlQCUFTW5Zd1J1J8tykBJGnq+ahJjYkBNIET81nTDrZI8idw==@linaro.org
X-Google-Smtp-Source: AGHT+IGZij1NzlfFY7xMNw7Yp6IQLTSo080tOvCvE/5vrXRBuDjQ2gU4W1ARWjsQye8V+xNsYYT3
X-Received: by 2002:a05:6214:5902:b0:6b0:7f36:8ae3 with SMTP id 6a1803df08f44-6c3556d31d9mr114255316d6.32.1725352600847;
        Tue, 03 Sep 2024 01:36:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725352600; cv=none;
        d=google.com; s=arc-20160816;
        b=fqfcFgRY8EoJD7ewLdtWcQZeG0otgTUUZbiMbvL0payJRR7SQBN9/ffIZ1MZwU/kHl
         IwMWmDueUjEtzmd8rRyhQXNqcUSUk9dafKIIDEnz19EEdl93EP1wmRT9Bb3R7L5op4Uv
         0ROhyXQAvrqCKjnMG59egcVtXKTMpg8c9UI5/gsuZolfLGdu5dmheIQ4xgtHfVc0dDDn
         fosUY/+xwQqYkvjjX38wvkn/k36Y8/QSV09GAV5uwLOHNhPEpFUflKJDrpdviUIhJx8w
         GTFLnaY6QIde0SKHF1J7P+PjOVZKo0AQv/+WKKFl0pr+UxL+ZkTQ8wUQgZSj0tToWu9+
         Xw3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=OEtOfONY4cGi6KoOKEWZOg8+fh6Ob5urhWZxbXw7q10=;
        fh=FCtYWwOtEgMeIuI7wG7f687kK1NW14MjWu/nT+chD9o=;
        b=SmfmOu5daJFdBH7nM5p25qezkIk+fhTu3juik/2IepMOwj6zoHRweURDAoXU6MXk0l
         4oF8NPmwW1L44+0M3J080jvA/rD0zbbpPi3roByIxxkMtT70CRbqrKKLEc9b5UhEiwHo
         seQTjS08hdoJCqGO11ghv23EHBRnUW3tOG14r5ZkAFnW6/LBTq0z70zxd5MoD6rrlQEK
         nvJKQO7vfXQYPzrSWeLkIrEJxh2uv4M1EGWAw0mRpO08+tgHZ3AcEUckUMtXaViVPFQQ
         8eHqLSBt+YfMkI4KDli8muAzII1vzIq1QRCwFNcVIQdIc08HNnIF4c8jsPXWxwCt6MN/
         tKJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c35710c39dsi77938396d6.470.2024.09.03.01.36.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 01:36:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1slP1S-0005Zi-V6; Tue, 03 Sep 2024 04:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1slP15-000466-7x; Tue, 03 Sep 2024 04:36:00 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1slP13-00084x-Qx; Tue, 03 Sep 2024 04:35:58 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 3 Sep
 2024 16:35:30 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 3 Sep 2024 16:35:30 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v3 08/11] aspeed/soc: Introduce a new API to get the device irq
Date: Tue, 3 Sep 2024 16:35:25 +0800
Message-ID: <20240903083528.2182190-9-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240903083528.2182190-1-jamin_lin@aspeedtech.com>
References: <20240903083528.2182190-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WeB3Z1qHmh6g

Currently, users can set the INTC mapping table with
enumerated device id and device irq to get the INTC orgate
input pins. However, some devices use the continuous source numbers in the
same INTC orgate. To reduce the enumerated device id definition,
create a new API to get the INTC orgate input pin
if users only provide the device id with its bus number index.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 4257b5e8af..a5eb78524f 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -193,6 +193,27 @@ static qemu_irq aspeed_soc_ast2700_get_irq(AspeedSoCState *s, int dev)
     return qdev_get_gpio_in(DEVICE(&a->gic), sc->irqmap[dev]);
 }
 
+static qemu_irq aspeed_soc_ast2700_get_irq_index(AspeedSoCState *s, int dev,
+                                                 int index)
+{
+    Aspeed27x0SoCState *a = ASPEED27X0_SOC(s);
+    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(aspeed_soc_ast2700_gic_intcmap); i++) {
+        if (sc->irqmap[dev] == aspeed_soc_ast2700_gic_intcmap[i].irq) {
+            assert(aspeed_soc_ast2700_gic_intcmap[i].ptr);
+            return qdev_get_gpio_in(DEVICE(&a->intc.orgates[i]),
+                aspeed_soc_ast2700_gic_intcmap[i].ptr[dev] + index);
+        }
+    }
+
+    /*
+     * Invalid orgate index, device irq should be 128 to 136.
+     */
+    g_assert_not_reached();
+}
+
 static uint64_t aspeed_ram_capacity_read(void *opaque, hwaddr addr,
                                                     unsigned int size)
 {
-- 
2.34.1

