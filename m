Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD8FF513E1
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 22:11:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyGsx-00016E-FL; Thu, 05 Mar 2026 17:09:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vyGsp-0000zm-Iw
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:09:29 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vyGsn-0002Dl-4l
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:09:26 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48374014a77so103425035e9.3
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 14:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772748563; x=1773353363; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1zwrmPpb2MBMovII3IbF2clfBEwlzxPfQXORImB3zwE=;
 b=TNHES+mNy+TYV+BjU7et/XBvk7AduNXsJWLlau5XBo+uzkOgMQpkAsbKImUTiG+5Mw
 hS3KMfGf/HlfsuS+Ipx0A4S0QkKwNUYUmOyeNSw7lHN23Nfu1QXdf2JBsfJzVtfQE9ch
 91s0lhXqMF1+lP6/GTcZSViHDn9FqQdmCNjH6cqJ8ow5GY/xsK8SmF1xAU0lmgpKra5I
 zduS8IJ0bvW7hYIr78JR+SjL113rGPkY0EQ/UCBqqUn6tJNJ+qzVcMziLYzoX16IlqQU
 qDovT5NkpIS6wkVA5hkGJpDLIrW8rh/scUMvl2a5MDftTtMJqZoXyMzQMi4Cts/gTVQm
 JPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772748563; x=1773353363;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1zwrmPpb2MBMovII3IbF2clfBEwlzxPfQXORImB3zwE=;
 b=tShchcQb+voUoNlqzj3mH6hj7PM5RmDzLV4t9UKzDtF68HL7a2XHtDJjBQkhXrQ7zt
 6wcN2dUWtFGJXb559kxpx9uJ9Id8yyzTAiP9CnKVtrK9FApSvdzV5F9TkevXJZa1lXhH
 MFfszF/JXOboJsHtQt1jHUKvlsvN7aPS9blLRNOo+0FSSjOB+KKQ3t54WAdqgRSwf19N
 hD9jXB68KzvP6EC2jqLfB9hYMHwP0HaxnJ9iRFjm6B6hVsVvHKxg/KTvUODJEtR/AkUp
 oenfEzKpesd8g6Yb6g22hxKm8kql8MFF+C7gAREkAux4e8dtfhDUE50GDMOd4QE5v0lV
 ispA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZgxrDND64gTCGyyCd4/mVGOKMg1oUtqMF6y0bSeNr8uIfezxlHxB14XRNjfiDBoAmvpSmGFNXdQ==@nongnu.org
X-Gm-Message-State: AOJu0YyH7I+dPbah2K2ZxjQkz0DVCGgrzH09yzpZW2KqQAPGpPfhH12X
 drDUS+UeK4rGzuo/6sNMLYwuB0kwuzl4qdWo9q/NXodeiv+Jp9H02zTw
X-Gm-Gg: ATEYQzzEx8h0S2ARwAfRVAh8ItFW+KOQ1F2I+bp08GmzJlcrii+StH0KeWlxqiml5dc
 V9Q6aLaUvmuNQRM9Xvg2WwvHToe94EcLP8rfkdKygrLYwFW8ckqfmCL/UTNfXOjzxOMUyfSIJNc
 sWJ9i0W189SUncubRQKi2f+qRR+Ki7xbpE74auIdtf6BkJHBX7KRnGMsbjPSSZ9SkIlOqRKmV5J
 +sd1bDpP0Zsj0dbuNy131yHgMzDe6Sz30jFxMnIbmj4TNE5SZI5nuMWjBklqSulKQClwBvWhkFa
 5cHcmYb2EHaCF1XTSeYd44++r8YT72Xk5eLZEK/QXkeikjEL+hhpEnAqyXYOxZOdjcJSiGG+rPk
 +jEI5OXevJlm10tlOjlVoiEVTalUtzT4kghIrpDYjN7bBKnKlidlgqw/sG8vRyrqQwFo1Rpsz4u
 sROXtpl3wnl4M80lQ5uEaXrEIrRiSrHJiCHVpoTs2p+Sfy3XEb4pfgiitSdoDZdWVUY1dm1iRYb
 LMUMupEFRDG0Dym8WYUs/Utqt493OfObelKYUYHpvp7BHAFrjL/OKxMYg==
X-Received: by 2002:a05:600c:a51:b0:47e:e20e:bbbe with SMTP id
 5b1f17b1804b1-48519889928mr122885855e9.25.1772748562947; 
 Thu, 05 Mar 2026 14:09:22 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-2a02-3100-2989-c400-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2989:c400:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fa87e56sm67419615e9.0.2026.03.05.14.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 14:09:22 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Troy Lee <leetroy@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org,
 Helge Deller <deller@gmx.de>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 03/14] hw/arm/aspeed_ast27x0-{ssp,
 tsp}: Do not access SerialMM internals directly
Date: Thu,  5 Mar 2026 23:09:00 +0100
Message-ID: <20260305220911.131508-4-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305220911.131508-1-shentey@gmail.com>
References: <20260305220911.131508-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

SerialMM inherits from SysBusDevice and exposes the memory region by
means of sysbus_mmio_get_region(). Use that in order to avoid accessing
implementation details of SerialMM.

Reviewed-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/aspeed_ast27x0-ssp.c | 7 ++++---
 hw/arm/aspeed_ast27x0-tsp.c | 7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0-ssp.c b/hw/arm/aspeed_ast27x0-ssp.c
index 9b12ba6743..8b84300e0f 100644
--- a/hw/arm/aspeed_ast27x0-ssp.c
+++ b/hw/arm/aspeed_ast27x0-ssp.c
@@ -149,6 +149,7 @@ static void aspeed_soc_ast27x0ssp_realize(DeviceState *dev_soc, Error **errp)
     AspeedCoprocessorState *s = ASPEED_COPROCESSOR(dev_soc);
     AspeedCoprocessorClass *sc = ASPEED_COPROCESSOR_GET_CLASS(s);
     DeviceState *armv7m;
+    MemoryRegion *mr;
     g_autofree char *sdram_name = NULL;
     int i;
 
@@ -230,9 +231,9 @@ static void aspeed_soc_ast27x0ssp_realize(DeviceState *dev_soc, Error **errp)
     }
 
     /* UART */
-    memory_region_init_alias(&s->uart_alias, OBJECT(s), "uart.alias",
-                             &s->uart->serial.io, 0,
-                             memory_region_size(&s->uart->serial.io));
+    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(s->uart), 0);
+    memory_region_init_alias(&s->uart_alias, OBJECT(s), "uart.alias", mr, 0,
+                             memory_region_size(mr));
     memory_region_add_subregion(s->memory, sc->memmap[s->uart_dev],
                                 &s->uart_alias);
     /*
diff --git a/hw/arm/aspeed_ast27x0-tsp.c b/hw/arm/aspeed_ast27x0-tsp.c
index e39d1dc171..e7c7b74491 100644
--- a/hw/arm/aspeed_ast27x0-tsp.c
+++ b/hw/arm/aspeed_ast27x0-tsp.c
@@ -149,6 +149,7 @@ static void aspeed_soc_ast27x0tsp_realize(DeviceState *dev_soc, Error **errp)
     AspeedCoprocessorState *s = ASPEED_COPROCESSOR(dev_soc);
     AspeedCoprocessorClass *sc = ASPEED_COPROCESSOR_GET_CLASS(s);
     DeviceState *armv7m;
+    MemoryRegion *mr;
     g_autofree char *sdram_name = NULL;
     int i;
 
@@ -230,9 +231,9 @@ static void aspeed_soc_ast27x0tsp_realize(DeviceState *dev_soc, Error **errp)
     }
 
     /* UART */
-    memory_region_init_alias(&s->uart_alias, OBJECT(s), "uart.alias",
-                             &s->uart->serial.io, 0,
-                             memory_region_size(&s->uart->serial.io));
+    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(s->uart), 0);
+    memory_region_init_alias(&s->uart_alias, OBJECT(s), "uart.alias", mr, 0,
+                             memory_region_size(mr));
     memory_region_add_subregion(s->memory, sc->memmap[s->uart_dev],
                                 &s->uart_alias);
     /*
-- 
2.53.0


