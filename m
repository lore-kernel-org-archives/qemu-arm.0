Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp715754njb;
        Wed, 8 Jan 2025 01:28:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVarFJ2++3xhVH9wHpxP1rmdSaSUhws5rFtTCONL0Ecmf1YXS299UB7nyNCM0yQKMxAAZ6IiuaAuk/D5A==@linaro.org
X-Google-Smtp-Source: AGHT+IFen4kZ4cklZ8+eC6WPuWIxOzsoxvvnLw6vs8t/CjOjBPPdU+EY+ck3TH6hzucAA1skFc38
X-Received: by 2002:a05:622a:199b:b0:467:50b8:63aa with SMTP id d75a77b69052e-46c7102caf4mr30805241cf.28.1736328483925;
        Wed, 08 Jan 2025 01:28:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736328483; cv=none;
        d=google.com; s=arc-20240605;
        b=Xx0Yy2CI/cR5JYZ+ccY8165e3aLVwGu+wv8YKlmDqDOUGK6zPsoNfg58EQd6A2Iyvt
         SrGUGZ0aQQU+KW4rY12ZbO5/kGwwCDK7AF8F1LEGlxmj5EgmpKhPwrUzmZadnhKoYj71
         Tj3BGKyaXacruSbKlXKkWV00cKPTKuNrR4wJ6cioTkVmjvXcfBdr0crwVJgf1PlkxfhY
         hZxOxZU75/2NsPXSPV+R7/QiWWiw6Xd2c54XDB3MWhqdadlldtxnZhh5KcYf6zUEt7dU
         3hQT1d9wCntcGqMUW3Iu5vURKdH07dnqYvc5cAfqL7r7lIqxaue7nB/YBdA4pV54RdSM
         6oNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BWONvS3zrMT7DHIR9fjnPk/2xHHvbX1PNKzkC10sjG4=;
        fh=FlbQTFUWDDjW7YTPb97t4F4vxpLVsy0glhrbSva99NM=;
        b=lv1z2JmMWqwaFHhSIYe9JbO3swAPw2ajYuCHOUQNbcdDWPdGSQs5jlo/fR081caMhx
         FPErWzTPx5HOl4D6FT4BfksGIEZUk34vMop1vLJzErhCiTMA0xItQwVK0hchqhTFw9A2
         kJhW1DSQCZy+k8erjn5M5Z8bXxSSKnoHZnabr/rFODrOb1RjnUH3Y22ymtrZhAE3MFkM
         2S6dgDeR7Ig6fgl59emHbBVsNDiDWL5/dLHe/AxCdNaDNCuDrQWBT3vKpgYs/CfiBaMt
         Gigt51x6/sclDTYfhO0cKe07WJWwl45D0qMKxzxAfBT+jNGo/A8b65747LR5EfB0+nz6
         SngQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=hAC2A1WW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3ebbe47esi451339121cf.413.2025.01.08.01.28.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2025 01:28:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=hAC2A1WW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVSLn-0005cy-2J; Wed, 08 Jan 2025 04:27:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tVSKL-0003yB-DN; Wed, 08 Jan 2025 04:26:14 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tVSKJ-0004qK-SV; Wed, 08 Jan 2025 04:26:13 -0500
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aaeec07b705so1943716866b.2; 
 Wed, 08 Jan 2025 01:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736328369; x=1736933169; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BWONvS3zrMT7DHIR9fjnPk/2xHHvbX1PNKzkC10sjG4=;
 b=hAC2A1WWz1ZgGcldU8hLDqxqrxRF+AO/J08ZoDFleHhGpcotFqqyMiLGu8Y5dSqPsv
 boEkBIXz0f0mWYS8A3tk7iLMF+cyuzkSVqv9jwXixEEZ6BkUcaY19IvW30SkIQlLSXqk
 sDRX6aSo1cAm6rBF5Ywdgjjm+6dW+dRGTAbGQKwhKyY5bCfN59XZXXeM25BFIOB9+pVz
 tTkNfZ2UgUpTMJs0Zs/9k8QJ4hJSR0ZF/NFgHDhqLqQI+x2zdEbKu5N2jr1E1hSq16an
 LiIeDis4YVrGNplNbliWVgQH3JaFzzcajq20t8lXEL19BWsNud/EFjztoGEY7S5UVPJD
 DJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736328369; x=1736933169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BWONvS3zrMT7DHIR9fjnPk/2xHHvbX1PNKzkC10sjG4=;
 b=SAg21YSZAG8PIxTPqyPsBZREM7z5/Jq9Cda3EuFbIKcxv93TNfxz8vW6fZ6cvqyynX
 3J2ParraRr5BH1XZoW+CNAvNQ90Dwj79JFeXbqKmpvvWCEUXvLwtuCNNPHZiENwyLMUg
 mXfF3rmLUouHxliaJacsQEZxUUVVa4/oYM6comjMI8py7wUYweF4NGcrvAArYOHCz6mI
 oabb/+8q9qTUjHuMYr3dSiXEq34AxVSQzAwn7pMr27GmXhCJPDrPOu15SZyPYId99arO
 M6CI/6IAoyS7lAzT59uRa24GfyKvPAYPm+xGbQ2EenCSkSZhl4qjHeESUvy3EeCaJIpV
 6aZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkoCHWoA/ehS+TStLU8ksdlwKG8JsRV7RY3qPLX/2csGFcJfnODtWyzJ5H44lKvN7V109D5bSc7d3ZFQ==@nongnu.org,
 AJvYcCXunRkFzMnEfLUzvBau0ggULpAVecLNLbYDLT9EVf9GQ6dGcT/reOUIDZl1tEGNIBg+S+ntCNGmmQ==@nongnu.org
X-Gm-Message-State: AOJu0YwRcI9Pax5PrkcbMUUm5ALUNjQArCue7TZVBxUTuoXTinXOj2B3
 WP4vKLLD3m6eqEHFzaiG29D5ytAeoikTb/S2rEKmC4+Ju+dE26BQyizbQ+vt
X-Gm-Gg: ASbGncubilwiabOiEpiygyQhMLmBl0BpS2O1Czn3gXcbf3z9y8qqsEzjPrIc+pFwaQ8
 BNsB8ru9JVhndE9doneTjXC01rDm4ANIBN2yvjhHUmLfo5QA60nSsEHFrqeYebsfJAxdtkpzrqG
 cSSS6qf309fGzT4UJotARLCp6Sh/5vXbwCdKyxhPNtOw9UEfBDhpCaeoYrUezp+r1zrRIFb6E6+
 egd887kZ+kSXSKzO7e3U2660Cj5i3LKnisQ0aFCF/e9ZD1wBuhOQQ7X0ryWOFm5smjxAbb5lCIW
 AbTmn6FFkQJWX8guMBwisIE41SNk6lyDydD/IgERv8z1hQc=
X-Received: by 2002:a17:907:3e9f:b0:aae:bd4c:22c0 with SMTP id
 a640c23a62f3a-ab2ab70aeccmr157228366b.19.1736328369051; 
 Wed, 08 Jan 2025 01:26:09 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-188-106-228.77.188.pool.telefonica.de. [77.188.106.228])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d806feddfasm26116096a12.58.2025.01.08.01.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 01:26:08 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Fabiano Rosas <farosas@suse.de>,
 Guenter Roeck <linux@roeck-us.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 14/14] hw/gpio/imx_gpio: Turn DPRINTF() into trace events
Date: Wed,  8 Jan 2025 10:25:38 +0100
Message-ID: <20250108092538.11474-15-shentey@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108092538.11474-1-shentey@gmail.com>
References: <20250108092538.11474-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: P0vDRHmTOeCV

While at it add a trace event for input GPIO events.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/gpio/imx_gpio.c   | 16 +++++-----------
 hw/gpio/trace-events |  5 +++++
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/hw/gpio/imx_gpio.c b/hw/gpio/imx_gpio.c
index 67c47a7280..f77132fe04 100644
--- a/hw/gpio/imx_gpio.c
+++ b/hw/gpio/imx_gpio.c
@@ -24,6 +24,7 @@
 #include "migration/vmstate.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "trace.h"
 
 #ifndef DEBUG_IMX_GPIO
 #define DEBUG_IMX_GPIO 0
@@ -34,14 +35,6 @@ typedef enum IMXGPIOLevel {
     IMX_GPIO_LEVEL_HIGH = 1,
 } IMXGPIOLevel;
 
-#define DPRINTF(fmt, args...) \
-    do { \
-        if (DEBUG_IMX_GPIO) { \
-            fprintf(stderr, "[%s]%s: " fmt , TYPE_IMX_GPIO, \
-                                             __func__, ##args); \
-        } \
-    } while (0)
-
 static const char *imx_gpio_reg_name(uint32_t reg)
 {
     switch (reg) {
@@ -111,6 +104,8 @@ static void imx_gpio_set(void *opaque, int line, int level)
     IMXGPIOState *s = IMX_GPIO(opaque);
     IMXGPIOLevel imx_level = level ? IMX_GPIO_LEVEL_HIGH : IMX_GPIO_LEVEL_LOW;
 
+    trace_imx_gpio_set(s->iomem.addr, line, imx_level);
+
     imx_gpio_set_int_line(s, line, imx_level);
 
     /* this is an input signal, so set PSR */
@@ -200,7 +195,7 @@ static uint64_t imx_gpio_read(void *opaque, hwaddr offset, unsigned size)
         break;
     }
 
-    DPRINTF("(%s) = 0x%" PRIx32 "\n", imx_gpio_reg_name(offset), reg_value);
+    trace_imx_gpio_read(s->iomem.addr, imx_gpio_reg_name(offset), reg_value);
 
     return reg_value;
 }
@@ -210,8 +205,7 @@ static void imx_gpio_write(void *opaque, hwaddr offset, uint64_t value,
 {
     IMXGPIOState *s = IMX_GPIO(opaque);
 
-    DPRINTF("(%s, value = 0x%" PRIx32 ")\n", imx_gpio_reg_name(offset),
-            (uint32_t)value);
+    trace_imx_gpio_write(s->iomem.addr, imx_gpio_reg_name(offset), value);
 
     switch (offset) {
     case DR_ADDR:
diff --git a/hw/gpio/trace-events b/hw/gpio/trace-events
index b91cc7e9a4..9ddacc12e3 100644
--- a/hw/gpio/trace-events
+++ b/hw/gpio/trace-events
@@ -1,5 +1,10 @@
 # See docs/devel/tracing.rst for syntax documentation.
 
+# imx_gpio.c
+imx_gpio_read(uint64_t base, const char *reg, uint32_t value) "0x%" PRIx64 ":[%s] -> 0x%" PRIx32
+imx_gpio_write(uint64_t base, const char *reg, uint32_t value) "0x%" PRIx64 ":[%s] <- 0x%" PRIx32
+imx_gpio_set(uint64_t base, int line, int level) "0x%" PRIx64 ":[%d] <- %d"
+
 # npcm7xx_gpio.c
 npcm7xx_gpio_read(const char *id, uint64_t offset, uint64_t value) " %s offset: 0x%04" PRIx64 " value 0x%08" PRIx64
 npcm7xx_gpio_write(const char *id, uint64_t offset, uint64_t value) "%s offset: 0x%04" PRIx64 " value 0x%08" PRIx64
-- 
2.47.1

