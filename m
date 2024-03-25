Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp702118ejj;
        Mon, 25 Mar 2024 06:34:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/B8oSo5IAZxP2IgSRU/ll64i2anSyooJTT3pYi2DekWqbly+HQDY9xZF4BZH4yBzkSTJY7tZtEaImIRul4kNb5vIf5OtJ
X-Google-Smtp-Source: AGHT+IEDVnTt7QVcQHamDAwq0wRu4uWxh44UxbVBAD3lswQReXUh10/HCF227tJDlpewreKbwwDv
X-Received: by 2002:a05:622a:d6:b0:431:5b18:5c61 with SMTP id p22-20020a05622a00d600b004315b185c61mr2228302qtw.36.1711373677655;
        Mon, 25 Mar 2024 06:34:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711373677; cv=none;
        d=google.com; s=arc-20160816;
        b=sFt40UlNev+L/ldqEfmW3j6/M7uT7/I63TgFTghw+jByEOAmZyLsn8BxueeOOY4Ssu
         K6ZsW5V9AO5AaXpsId5YY5jiN1JB/6S3NoLNw/Kkp9373jmVMOUoGDwSo+79dsbwPK7x
         5nOOyOt2x5cczek16zqDIAoNwa6Bxmffph2h/ENdJcw5JPJKn5YnJYim4/JdFv8iqF4q
         00YdW//YeI+o/1+m/DSKiqZjmy1OlNMVUdNmvglLEigycVzbyG6lP07Ph82VaIrptjPD
         /7b87c1m/is1nev91DTkm0VKHWVQRCYsbioIKKZyStDaibUTe/IpoyAQOHrZv7dU+qY+
         GnKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eAE2yytRBI+AooWG1nnNIGk1ax3StRcF3qR/MNn/B7A=;
        fh=5ZBxX/75JnTE7pAizH79Dt1FwAFvnneQvYbFXSysomA=;
        b=P0pssepqhS05gzxHsw2f4UKqE9Ro8xXIgJERDV/YAq+Cp8jLYifTXolQFGRLF5Zwei
         d0Uo6nsx+TfRvU7uiaedvuIgfFaDeeiqzkCOPz4GWeOftnWlpfU58HKjFPmTsbQ9IdpB
         3IYa+/T8rnrvDV+SeNhHIxLs56u+McuY9aHT3L3T8iEDDjk0xKpPhAYQ5BB+bfvoQB3m
         GU6Gm8jdK+oOp4BUYbgJ7Hfq7LZ99aF3X1yw87bY3IoYTwzFIWbcMJKECYNkwQtToDfq
         dmQHLPVBZiVr2spI+7MAofGXnM/ZrdoklYSqqRgLJXlEXA9qKVsEfOAVKUcM4JpDZIsk
         1hVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S4fXYeOt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3-20020a05622a100300b00431620a32e1si663145qte.243.2024.03.25.06.34.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 06:34:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S4fXYeOt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rokSJ-0002pV-4X; Mon, 25 Mar 2024 09:33:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rokSH-0002hr-Bv
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 09:33:37 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rokSF-0007Nr-8j
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 09:33:37 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41400a9844aso30673035e9.0
 for <qemu-arm@nongnu.org>; Mon, 25 Mar 2024 06:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711373613; x=1711978413; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eAE2yytRBI+AooWG1nnNIGk1ax3StRcF3qR/MNn/B7A=;
 b=S4fXYeOt1szLbaDkSZ57+UEX+5imdJifPsqxCdQ3qjde4PpYPpIiJbIV8ioJ8DFEnZ
 NJ59SP09dVgWMvgX0+yJG/nkvox0SJo4AktguJkjW7AvizKNGAqXasl+uWtBD7gh+Cro
 IumRrtKU7iNvVidk/fY8pue1WtWWHL9R22i/wxGyTUo3P6tGxNQ/Ri0UxUlssM4LDQm7
 wrLxmfN4AlL4FfhX9bfpKu9d3Z3z3C2M1DgmU4FfnhxvumQn1a5GCSd74wCFCBz6kU+p
 F4wwJVDoh1oiJ90YnsClw6tavaC0rvLfUy43ThQomi06fLZD+57fqqMj/cfuCdLL14i2
 wEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711373613; x=1711978413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eAE2yytRBI+AooWG1nnNIGk1ax3StRcF3qR/MNn/B7A=;
 b=jjItICFh4VR7LczP5XEofcosm5YQUHuhoN+4zcg/g9s8JsMJNbXVBYcbhCw/YCInWd
 nmLH9ATmQbcsSwxGIrmcuh++/Jl4VCIBrHEbWA6AomSn5M0aZN9BqoKKcO4E1ob53r0h
 duSHr0KFK2CpwFNZ1pIONgmlssmYaD7RGofNbfAsVFg1Zc5EYal6dNqilSHQPBhVNt7k
 h5acQzSCxhrL4Kaw+S6TbKJapu2UifwLq6KxNPo40pQ7gVsqZUzpgpoHCvZSQCKaJa7z
 J7DeL2LPaHidbP0BDeZCFN3DeVvZDoTz+RgvBH0xQ3pNe1yYmO2CVH6ksg9n3R7CUdkq
 2ZDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZfjGxOCym9t9g5jLTrTHCgWhb6zJIf5GRNVBBxpzYLA3wONxPYGYaZU8Qoa7enJsA1VFW/ApW3B79+QN13zjlR+Hf
X-Gm-Message-State: AOJu0YyOu1WWxRilVUjOlRGkevH07Ez78oCW1QI+prtPjL/80NeaUdB4
 bdAGxchYosNexdseKDO8rKOb+UZeSY9jugW0DkJFoJ0R/ilimrL2wMJ8i+mvpSs=
X-Received: by 2002:a05:6000:1362:b0:33e:ca2c:70f5 with SMTP id
 q2-20020a056000136200b0033eca2c70f5mr6078181wrz.7.1711373613710; 
 Mon, 25 Mar 2024 06:33:33 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.208.214])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a5d5946000000b0033ecb329f15sm9612390wri.9.2024.03.25.06.33.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Mar 2024 06:33:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Damien Hedde <damien.hedde@dahe.fr>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH-for-9.0? v2 5/8] hw/clock: Pass optional &bool argument to
 clock_set_mul_div()
Date: Mon, 25 Mar 2024 14:32:55 +0100
Message-ID: <20240325133259.57235-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240325133259.57235-1-philmd@linaro.org>
References: <20240325133259.57235-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: 6GXiiQh+pqLt

Pass optional &bool argument to clock_set_ns().
Since all callers ignore the return value, have
them use NULL.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/devel/clocks.rst   | 4 ++++
 include/hw/clock.h      | 3 ++-
 hw/arm/msf2-soc.c       | 2 +-
 hw/arm/stm32f100_soc.c  | 2 +-
 hw/arm/stm32f205_soc.c  | 2 +-
 hw/arm/stm32f405_soc.c  | 2 +-
 hw/core/clock.c         | 7 ++++++-
 hw/misc/stm32l4x5_rcc.c | 2 +-
 8 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
index 3360e5616d..027a3c5dbc 100644
--- a/docs/devel/clocks.rst
+++ b/docs/devel/clocks.rst
@@ -279,6 +279,10 @@ You can change the multiplier and divider of a clock at runtime,
 so you can use this to model clock controller devices which
 have guest-programmable frequency multipliers or dividers.
 
+Similary to ``clock_set()``, ``clock_set_mul_div()`` takes an optional
+boolean pointer which is set to ``true`` if the clock state was modified,
+that it, if the multiplier or the diviser or both were changed by the call.
+
 Note that ``clock_set_mul_div()`` does not automatically call
 ``clock_propagate()``. If you make a runtime change to the
 multiplier or divider you must call clock_propagate() yourself.
diff --git a/include/hw/clock.h b/include/hw/clock.h
index f0ac410fc8..0e4c5b67a2 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -376,6 +376,7 @@ char *clock_display_freq(Clock *clk);
  * Note that this function does not call clock_propagate(); the
  * caller should do that if necessary.
  */
-void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider);
+void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider,
+                       bool *changed);
 
 #endif /* QEMU_HW_CLOCK_H */
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index a94a10adcc..7257bd5ded 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -111,7 +111,7 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
      * implement the divisor as a fixed /32, which matches the reset value
      * of SYSTICK_CR.
      */
-    clock_set_mul_div(s->refclk, 32, 1);
+    clock_set_mul_div(s->refclk, 32, 1, NULL);
     clock_set_source(s->refclk, s->m3clk);
 
     memory_region_init_rom(&s->nvm, OBJECT(dev_soc), "MSF2.eNVM", s->envm_size,
diff --git a/hw/arm/stm32f100_soc.c b/hw/arm/stm32f100_soc.c
index 808b783515..4879bd6188 100644
--- a/hw/arm/stm32f100_soc.c
+++ b/hw/arm/stm32f100_soc.c
@@ -93,7 +93,7 @@ static void stm32f100_soc_realize(DeviceState *dev_soc, Error **errp)
      */
 
     /* The refclk always runs at frequency HCLK / 8 */
-    clock_set_mul_div(s->refclk, 8, 1);
+    clock_set_mul_div(s->refclk, 8, 1, NULL);
     clock_set_source(s->refclk, s->sysclk);
 
     /*
diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index a451e21f59..aeb0cb0a5a 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -110,7 +110,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
      */
 
     /* The refclk always runs at frequency HCLK / 8 */
-    clock_set_mul_div(s->refclk, 8, 1);
+    clock_set_mul_div(s->refclk, 8, 1, NULL);
     clock_set_source(s->refclk, s->sysclk);
 
     memory_region_init_rom(&s->flash, OBJECT(dev_soc), "STM32F205.flash",
diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
index 2ad5b79a06..07cf0e8287 100644
--- a/hw/arm/stm32f405_soc.c
+++ b/hw/arm/stm32f405_soc.c
@@ -115,7 +115,7 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
      */
 
     /* The refclk always runs at frequency HCLK / 8 */
-    clock_set_mul_div(s->refclk, 8, 1);
+    clock_set_mul_div(s->refclk, 8, 1, NULL);
     clock_set_source(s->refclk, s->sysclk);
 
     memory_region_init_rom(&s->flash, OBJECT(dev_soc), "STM32F405.flash",
diff --git a/hw/core/clock.c b/hw/core/clock.c
index e0f257b141..6ef60a2423 100644
--- a/hw/core/clock.c
+++ b/hw/core/clock.c
@@ -145,7 +145,8 @@ char *clock_display_freq(Clock *clk)
     return freq_to_str(clock_get_hz(clk));
 }
 
-void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider)
+void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider,
+                       bool *changed)
 {
     assert(divider != 0);
 
@@ -157,6 +158,10 @@ void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider)
                             clk->divider, divider);
     clk->multiplier = multiplier;
     clk->divider = divider;
+
+    if (changed) {
+        *changed = true;
+    }
 }
 
 static void clock_initfn(Object *obj)
diff --git a/hw/misc/stm32l4x5_rcc.c b/hw/misc/stm32l4x5_rcc.c
index bc2d63528b..f01113308a 100644
--- a/hw/misc/stm32l4x5_rcc.c
+++ b/hw/misc/stm32l4x5_rcc.c
@@ -59,7 +59,7 @@ static void clock_mux_update(RccClockMuxState *mux, bool bypass_source)
         freq_multiplier = mux->divider;
     }
 
-    clock_set_mul_div(mux->out, freq_multiplier, mux->multiplier);
+    clock_set_mul_div(mux->out, freq_multiplier, mux->multiplier, NULL);
     clock_update(mux->out, clock_get(current_source));
 
     src_freq = clock_get_hz(current_source);
-- 
2.41.0

