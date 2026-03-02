Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B67EB3637
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 22:03:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxBMH-0000RV-Qf; Mon, 02 Mar 2026 17:03:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxBME-0000Pn-Ty
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 17:03:18 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxBMD-0001A0-Ax
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 17:03:18 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-4398c7083d7so4338518f8f.3
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 14:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772488996; x=1773093796; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a0q3doKdbgb3JqnYROywKi9R6evoTwQ/dQN4VyRTwQg=;
 b=mTd3OmAW8D/ZqpsCAZPnYTwG1TeJW/uRFTOZLhCnp1BJ+EcrMDR7vpyA6ZSpG+2cv9
 m9gsIWrT2gdiLWJfB+N1yLNm2f8YXyBKNhBWvzyzC481bPZDmSmvdOJvXHJf1AqstmQM
 Vddf6iUbQrP7UdgwxjAC74urVmFsgRok9UNxc020nFdncnMkpj4JLJ7qXbQQM8U3tvO8
 UX4anh2JAYZt8Vz/2l9eV8d3H/UOD0iu3/H2Us6y+v3fa8LkFNzfmmtZYv8QFJ9+q1or
 eILmH6oKvR5q43AGHcOTYQLjl6emvrq0nSiip1eHXFIdtzn5qJRc1Z2seNprprOs9F1k
 s22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772488996; x=1773093796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=a0q3doKdbgb3JqnYROywKi9R6evoTwQ/dQN4VyRTwQg=;
 b=ZRQFMQQdjTY/rurp7x48gxKjrWCrb0vFkSa2oKVTKsIN+5myHhPYb0XKg2JfbLdNjI
 qdnA0ZXzp19UaeV9zcCOzE6v+p37gohGbWxxfUuj7XTfUfgHdNfm+ieX+HjNYIHvmQjK
 xX1voMx80h/jCKazKaxpvtwe5jo3DCu1mRDlpY+mEb6PY7jHUKttuebanrwtoSb8r/Ht
 4UXXvoVX2iHRn/bDur1k8NxfOdxo3/gaGJbVW0QjojSoxYWnlDwVRVxuNyK1OozkfaKI
 PilDAo1GwT+dG6uzFPQz9/5jUvPDWlQC39iwbzLywvZPMbE013uoOeXwXMFo+URlB8oB
 QSzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9pvCTtwD6vyS11tOqPCnxzTQBztf4EI/Ton+L97l5H+jftlT5PCQhmWNaZKbniDMceD2ZCvxRMQ==@nongnu.org
X-Gm-Message-State: AOJu0YxFECO+tNvlcWpom6yIdO78a/D3PbaTlc9o9d8ihkmG2pBwGpMd
 pT15CAuysstpyVEXvRYn7QTy0hWO6Dn1BbfXVVR7DWE2YZxqLBl81jI3
X-Gm-Gg: ATEYQzxpxIX9FQ0Dd9x62qIDchk10dNUpLvmRO0Ev9n5JaQVdXzu74DH9hcxm88ML1W
 MyIwBtCFIlsVirEGnLrnr1tP4WVN0LvuoI/1nNlWxhTijRn30ByUHdAjn32dulTXVwfB/sNf695
 L3p7k7EqdtFF1xPPYqiB3zWmN7lTvXtYGDO3JN8/wMvwgdTV24eWQSR7zZssasdSQrcbJXmKm2W
 kFdQKegYjDej/s9RxmUuvBWbDLJoDt+DljvwFi5+PvnXyL+g6vZlFF2z7U2ZS9+gc3AUTn+8KBm
 3IwYR0ZVLtKpO+VaV9YqSNOkYh1QIn5zWEy6WBPy1DZc2sJg2O78mY3k05nxo1ymxdCXhjja9hE
 tuVBq2lKbUKCSf5712PqtQoUivBjd58l9HW9IO0ARa4nY9kBSIIQMP7yo6Sv+hmrQUJgPF8Z7hG
 vyTVuo1QHsAdPloe0uT3pm8z2aCw306pPZIhx+0gwvF/xB+ggAxRu2X/6hmIrGTL+AQd3xBr/SB
 YG/qsDNMpEgwWzcw9twNmiL/rRva1KYhl0g89bwylzHRuA=
X-Received: by 2002:a05:6000:2dc5:b0:439:b858:1d28 with SMTP id
 ffacd0b85a97d-439b8581e08mr7408633f8f.26.1772488995816; 
 Mon, 02 Mar 2026 14:03:15 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-2a02-3100-2e0b-4800-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2e0b:4800:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c765c38sm29308102f8f.31.2026.03.02.14.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 14:03:15 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Helge Deller <deller@gmx.de>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Troy Lee <leetroy@gmail.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 10/12] hw/arm/aspeed_ast27x0-{ssp,
 tsp}: Do not access SerialMM internals directly
Date: Mon,  2 Mar 2026 23:02:52 +0100
Message-ID: <20260302220254.1166849-11-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302220254.1166849-1-shentey@gmail.com>
References: <20260302220254.1166849-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42a.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

SerialMM inherits from SysBusDevice and exposes the memory region by
means of sysbus_mmio_get_region(). Use that in order to avoid accessing
implementation details of SerialMM.

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


