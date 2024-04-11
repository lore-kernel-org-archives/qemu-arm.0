Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp853897ejc;
        Thu, 11 Apr 2024 03:17:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUHprUBjVLQuZ74JU0bf+sod28nF0s4Q/YDuIsu/Hlu62s8Ud7F8ZXJ/CVCBsZSi1FXWDaogwe/HtIm0jleJ55e0TjAR4v7
X-Google-Smtp-Source: AGHT+IGxRM6vcnyCepoa74u3HMfG7qs7y1iv0eynxtZKufKHqliIuF9vee/AIOSF4Mi5P7g15cmi
X-Received: by 2002:a05:622a:594:b0:431:7f86:951c with SMTP id c20-20020a05622a059400b004317f86951cmr6491477qtb.28.1712830627215;
        Thu, 11 Apr 2024 03:17:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712830627; cv=none;
        d=google.com; s=arc-20160816;
        b=IqM+GLkVWF0qU3E7S/QSsnNTmXObWzPf1iVi7FCDvhs5Y/b7ABHpXT1sZUr3bMgEsv
         uRVj1UkS+XzNMAHKCjhxDaN0RPcNt4teibapPX2DMrxF/q/1Y3Z+qyWfuJWfpKbKPS4r
         AMAT8bA5sXJkRRYawCkVQj7D9ZXFCYjxUn/mD0CEcjni/6At4hLroQlbAm7fwvjfa61d
         EK1W+55GsvzkEwI09tVOxfbiYHNO10GwzIXWUVqhEMp9WuF64rII6H+8j+rBJDXn3W/z
         1r9p/ZAYCdmAy11YrYhBZP2vc+qP5CqVoF77O6THnPEnN4jdRRkkFsA9GtbpwVIrqrMX
         WbDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4MCcGHhKA7wPhoBY3l6p9Olu+doueLftUh6GAPbrfFo=;
        fh=pz1yopd/wrdYlGtYXbhy+U1KH6qXkA5iyTnaoXfRYpE=;
        b=z89pYJloagszdk17xl8M/Rsc1LsiW7eMvsSLkkG3iupyWa99EThdheYbJLo/9eLIZE
         CBauzuy7d0jEA1VduCi00KKdf9pK21F33PTmoih7URP1lM7TPsXcIlEynJR5Z4HGkZCB
         ZfA4hnaz4k2kKGTZ6+BDJZYOimu+IbU4NNdiVy7LfoovLbbnLwjbM9jm7pTDPaN00QwP
         9NnhESaTyRX45aovH8GRzNSM2sKy9oiLuNPFWrclAS1QU/HWs6mcZ3idOa+Aa96yDgD1
         RTRjZBG2cpBFC7Mvwa9N8MnUaHfrcxMExfsgLGzuZHYa2mpHrqPVTyVMhVlcQ1OAgsuK
         8RgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OSb52WSY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z17-20020ac87f91000000b00434ca1c4552si1189679qtj.713.2024.04.11.03.17.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 03:17:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OSb52WSY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rurU9-0005J0-GV; Thu, 11 Apr 2024 06:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurTh-00051p-9Q
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:16:22 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurTe-0007UM-D1
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:16:21 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-34665dd7744so1303448f8f.1
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 03:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712830577; x=1713435377; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4MCcGHhKA7wPhoBY3l6p9Olu+doueLftUh6GAPbrfFo=;
 b=OSb52WSY0B2mZTlTPa51sMidfmq+eaI6IArXxnW6ZQBxwoqvhQP5jryhgCXSXQc8PL
 p/lBeOKhVGgbQRll8N0Fb3EiunFeqMiXsOnxGrIkeyDGji2xjyc6oAQ/CGJJ5eRCADNA
 u2XxT1q4+lFAx68Hfp5tQ4MqgwvRjh1OIVGiRXVAXc5xzs6xyw1IJBaBiQ8h3zlvjlSw
 L6hJr3dwWdIHfs4/GTloxSeJS/LWOkTIjadIxUtAhQvHpjfGSSiT1rMAVe7Eu1lxs4uS
 07wGXhtecaogZBZkVFridO2JiUWf0KYI+EXexT/CcUytBuqttjzDuVntNEXCY6nAiFQ5
 7a6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712830577; x=1713435377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4MCcGHhKA7wPhoBY3l6p9Olu+doueLftUh6GAPbrfFo=;
 b=XkZCjI3En+NcUioIOTzVGEtOssGz5q93nnoQ3YgJvV5yeslAhOQKh+7EnjUVicLuUD
 65Ob0Mbl4kjIVkcfuQEl8JO1BWsGbglYxlWknlSDFuEYpIds+DIZ0AZF/ITYZ+Jw5twZ
 iq6vJnrH51I3NRa78YjCZqujYt0v1ZYSTNi9V3736Wd8tV29WC9Ec9Is+EaACQqIxH63
 03D1CFMMQlWvL9k0dB3Z+JdZ3oMsuYbmcemdedgAmJcMSoAqbpmclTqTlwpRNUzuzP/U
 C2tpPbOjl6X9+6QIopO0Era0N0KlkIobbyYFnmHV+Ls7EHv/Q+HG3VS7dUyA8VghFWsw
 jJGQ==
X-Gm-Message-State: AOJu0Yxm52LAgn6TCpIwRmQEwz7e4rxtX8DI5zwqIUny74NRnVhTBkC2
 SP3QkYvp/NmZNY4UxN5OupQ1hyslLEe63Ad0WZnSY7p8TxoCcRE6YVkYBcw9p0M=
X-Received: by 2002:adf:e702:0:b0:346:305c:d34a with SMTP id
 c2-20020adfe702000000b00346305cd34amr3676036wrm.20.1712830577088; 
 Thu, 11 Apr 2024 03:16:17 -0700 (PDT)
Received: from localhost.localdomain
 (137.red-88-29-174.dynamicip.rima-tde.net. [88.29.174.137])
 by smtp.gmail.com with ESMTPSA id
 dl5-20020a0560000b8500b00345fb949c28sm1404822wrb.100.2024.04.11.03.16.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Apr 2024 03:16:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 04/13] hw/mips/malta: Add re-usable rng_seed_hex_new()
 method
Date: Thu, 11 Apr 2024 12:15:40 +0200
Message-ID: <20240411101550.99392-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240411101550.99392-1-philmd@linaro.org>
References: <20240411101550.99392-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: kFMCDK6yU4lW

Extract common code from reinitialize_rng_seed() and
load_kernel() to rng_seed_hex_new().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/malta.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index af74008c82..9fc6a7d313 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -850,15 +850,24 @@ static void G_GNUC_PRINTF(3, 4) prom_set(uint32_t *prom_buf, int index,
     va_end(ap);
 }
 
-static void reinitialize_rng_seed(void *opaque)
+static char *rng_seed_hex_new(void)
 {
-    char *rng_seed_hex = opaque;
     uint8_t rng_seed[32];
+    char rng_seed_hex[sizeof(rng_seed) * 2 + 1];
 
     qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
     for (size_t i = 0; i < sizeof(rng_seed); ++i) {
         sprintf(rng_seed_hex + i * 2, "%02x", rng_seed[i]);
     }
+
+    return g_strdup(rng_seed_hex);
+}
+
+static void reinitialize_rng_seed(void *opaque)
+{
+    g_autofree char *rng_seed_hex = rng_seed_hex_new();
+
+    strcpy(opaque, rng_seed_hex);
 }
 
 /* Kernel */
@@ -870,8 +879,7 @@ static uint64_t load_kernel(void)
     uint32_t *prom_buf;
     long prom_size;
     int prom_index = 0;
-    uint8_t rng_seed[32];
-    char rng_seed_hex[sizeof(rng_seed) * 2 + 1];
+    g_autofree char *rng_seed_hex = rng_seed_hex_new();
     size_t rng_seed_prom_offset;
 
     kernel_size = load_elf(loaderparams.kernel_filename, NULL,
@@ -946,10 +954,6 @@ static uint64_t load_kernel(void)
     prom_set(prom_buf, prom_index++, "modetty0");
     prom_set(prom_buf, prom_index++, "38400n8r");
 
-    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
-    for (size_t i = 0; i < sizeof(rng_seed); ++i) {
-        sprintf(rng_seed_hex + i * 2, "%02x", rng_seed[i]);
-    }
     prom_set(prom_buf, prom_index++, "rngseed");
     rng_seed_prom_offset = prom_index * ENVP_ENTRY_SIZE +
                            sizeof(uint32_t) * ENVP_NB_ENTRIES;
-- 
2.41.0

