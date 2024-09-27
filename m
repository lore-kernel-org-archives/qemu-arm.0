Received: by 2002:a17:504:5f68:b0:1be9:327d:8ee3 with SMTP id gl8csp190446njc;
        Fri, 27 Sep 2024 01:34:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVEWDnR9UacWvsR+Te3Ls/1OWhzVqNhzRR2STImlZaokGoj9DIHl90Sj/l/pvv263l9A8eoPAr3PSGPgg==@linaro.org
X-Google-Smtp-Source: AGHT+IG2r8KkEZLSnaMbvEKCeZe8Wef4+NKs+oOgp5PTCYrVCPedKPhibxUomx6x3lYvOkNZl+hB
X-Received: by 2002:a05:6902:1025:b0:e25:9962:a726 with SMTP id 3f1490d57ef6-e2604cf9459mr1963030276.49.1727426078440;
        Fri, 27 Sep 2024 01:34:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727426078; cv=none;
        d=google.com; s=arc-20240605;
        b=EpoHMFZRHRYfREDVVh94Qk3emutWpuHD2Yvu/MT+neanomOn14QpTavdSijbM/z6X+
         SalSgrxxOsrccqEpdc3uiGS9SP1FAJAvtLdMxJ6Qn9c52cVJbPgx60YfZRYG0+DX1wuh
         petCs8S/xVcZADisRzzHdaes7/skpN+c2tD6n/ruIb4jaumMsIXjAjzI1MpIfLg70WQG
         tpuAjaYGFihfTZ10ZSGJktZsTmt3/7YOkjugJAxyh4ozbZzYoYhElwoCtUUp7qducCBu
         v+s98mFekRbl4IE11JSIjwKvXJcPF3bB83dkEdOADkRgbTTr4H3jbqgB0f9Lj2VfTk52
         4VUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Wth1AkYkGAQWUYC9Eg7oUANxmXE9K06KsIM9ACBBkBc=;
        fh=RdJersRTvVIU6GkG8yrSEUovA6vfgZWQMb4aw2HkXSs=;
        b=kTRlgoI0BKsr+hmt4SN1X5K9Ibr2rpDe4zeySh/eu7qjJ3ONqGIapjZCemnbQWk3tb
         7FvZRF7pkCRcAhXRCcSfiqzcnh64EaLgt32PQwW+YNOOsY5QnQR8yecUlTv94NxPp4Vu
         dbhzn0infJ66s+gaeQazJomj+sbK+nnevy3B3osEzGv0rhc2RG3vKW4Lidg/8oUiOzqj
         ivi+UQ/Bm0Eu37v+ujH3yAxkMSK6K9E/OWeDmiA5R5MEsvaJL0ED9zJxJLL4ymjzGUbr
         e5oX3iNDbcotrE/w3tfAUp7kn474J/zKN+Xba7bykIj0YydHAGSRezTXIU4WXJ1Zg5Ao
         Fs0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45c9f37c920si17542811cf.636.2024.09.27.01.34.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2024 01:34:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1su6QP-0006iz-UX; Fri, 27 Sep 2024 04:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1su6QO-0006cl-Mt; Fri, 27 Sep 2024 04:34:04 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1su6QM-0003ff-RJ; Fri, 27 Sep 2024 04:34:04 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 27 Sep
 2024 16:33:51 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 27 Sep 2024 16:33:51 +0800
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
Subject: [PATCH v5 1/7] hw/gpio/aspeed: Fix coding style
Date: Fri, 27 Sep 2024 16:33:45 +0800
Message-ID: <20240927083351.2637798-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240927083351.2637798-1-jamin_lin@aspeedtech.com>
References: <20240927083351.2637798-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mnQh4Ucm9bXy

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

