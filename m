Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1101206njc;
        Mon, 30 Sep 2024 01:53:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV0jASAh2qo2+zcbLfJT6i3ToMLndPcgghaKLGbZ1sErIo/Fjs/CLth0W9z4u83AuMJ4/IAEjlXQODl/Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEELqmeuWp4bkx7ey5TZC+Q27rFB5I4T+hTDLtgxfYyc/zeZZ+jfdDhXlk7GLWrUB4jkcGI
X-Received: by 2002:a05:620a:2624:b0:7ac:9c64:8ac3 with SMTP id af79cd13be357-7ae378dc7ebmr1868511785a.56.1727686405060;
        Mon, 30 Sep 2024 01:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727686405; cv=none;
        d=google.com; s=arc-20240605;
        b=NLF1szSksnnJpWEy34S6WfYpqGbBUq68D97P8TcfihvfkPn/LkYAvKff28a4bnKe4h
         8ZpJOi2UQQkOV7c881+IVokkaPxD161wRJds0G9TgnTMJ/Z+bMwDgziaAM1PMlVJJA3s
         8Iev+ahPK1NYrmMTDV3HfyWkW1jB2ru1ZyYJqlHNrgJJoUtr9/TpHNVSC8iuXdS0X8so
         P8t05pw+EbMlmVqLgyhfwYg8y2i6PVCOvHMbW5Z/YkK8AcX8n6tbsx1Vl/yVy0QtWR/Y
         5tVRVW9EjT3S+Eo9UtyZ2w5NsbXdI6W6hRbb7YXjA4UgjQhK7FUNayqU0jNZIbQytg/h
         7etA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Wth1AkYkGAQWUYC9Eg7oUANxmXE9K06KsIM9ACBBkBc=;
        fh=RdJersRTvVIU6GkG8yrSEUovA6vfgZWQMb4aw2HkXSs=;
        b=QNS0cCT8K4eIXDj/Yi60wQ2QWXGHFykUdrn6VvvQLVjPqeRoz6Vh32WENotuvpyNTI
         Zpr28VfhYWIzakPgaASKIUEZbhZG9dklxFSguubkT3K3gfws7+t0uM8b2ZNyuYwtAYkp
         EDHDWV7sn9pvhe6kLr0nbtHrmpoD/OAjVwxySiwlsbvBsAplvAQbYqTvw+7xUN+b2tkF
         k9EQGEA6RQqp3GL1L3FOXSzYC+/Bf5i7OPKNd6JtoUAn151D9yRl4ec902pU4dI90L1+
         tnF6ql5A4MEWnhBCCqIL24yxO4ZgBrXNpo+9UjRW/AaVR2C9GhGE/gC5GnbVR5dK6WEe
         BPYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae377e3816si805094485a.170.2024.09.30.01.53.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 01:53:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1svC9L-0003Dw-Jq; Mon, 30 Sep 2024 04:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1svC9E-0002qa-Bp; Mon, 30 Sep 2024 04:52:53 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1svC9C-00025U-MK; Mon, 30 Sep 2024 04:52:51 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 30 Sep
 2024 16:52:40 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 30 Sep 2024 16:52:39 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v6 1/8] hw/gpio/aspeed: Fix coding style
Date: Mon, 30 Sep 2024 16:52:32 +0800
Message-ID: <20240930085239.3089901-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240930085239.3089901-1-jamin_lin@aspeedtech.com>
References: <20240930085239.3089901-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Ezso9zbaeTK2

Fix coding style issues from checkpatch.pl

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/gpio/aspeed_gpio.c         | 6 +++---
 include/hw/gpio/aspeed_gpio.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 71756664dd..00fb72a509 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -340,7 +340,8 @@ static void aspeed_gpio_set_pin_level(AspeedGPIOState *s, uint32_t set_idx,
         value &= ~pin_mask;
     }
 
-    aspeed_gpio_update(s, &s->sets[set_idx], value, ~s->sets[set_idx].direction);
+    aspeed_gpio_update(s, &s->sets[set_idx], value,
+                       ~s->sets[set_idx].direction);
 }
 
 /*
@@ -629,7 +630,6 @@ static uint64_t aspeed_gpio_read(void *opaque, hwaddr offset, uint32_t size)
 static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
                                                 uint64_t data, uint32_t size)
 {
-
     AspeedGPIOState *s = ASPEED_GPIO(opaque);
     AspeedGPIOClass *agc = ASPEED_GPIO_GET_CLASS(s);
     const GPIOSetProperties *props;
@@ -963,7 +963,7 @@ static void aspeed_gpio_set_pin(Object *obj, Visitor *v, const char *name,
     aspeed_gpio_set_pin_level(s, set_idx, pin, level);
 }
 
-/****************** Setup functions ******************/
+/* Setup functions */
 static const GPIOSetProperties ast2400_set_props[ASPEED_GPIO_MAX_NR_SETS] = {
     [0] = {0xffffffff,  0xffffffff,  {"A", "B", "C", "D"} },
     [1] = {0xffffffff,  0xffffffff,  {"E", "F", "G", "H"} },
diff --git a/include/hw/gpio/aspeed_gpio.h b/include/hw/gpio/aspeed_gpio.h
index 90a12ae318..39febda9ea 100644
--- a/include/hw/gpio/aspeed_gpio.h
+++ b/include/hw/gpio/aspeed_gpio.h
@@ -88,7 +88,7 @@ struct AspeedGPIOState {
     qemu_irq irq;
     qemu_irq gpios[ASPEED_GPIO_MAX_NR_SETS][ASPEED_GPIOS_PER_SET];
 
-/* Parallel GPIO Registers */
+    /* Parallel GPIO Registers */
     uint32_t debounce_regs[ASPEED_GPIO_NR_DEBOUNCE_REGS];
     struct GPIOSets {
         uint32_t data_value; /* Reflects pin values */
-- 
2.34.1

