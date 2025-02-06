Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1524100njb;
        Thu, 6 Feb 2025 05:12:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUvPfqPOTXyJvxOEuuwhZN7H96MmImRBmpIIFJlqaC9LGbBJ/SY5gih2zTHXLQERRThhBdSCsskeSFOiQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFpH3BWsrFdk5SMNCCKvWHVAL4X4F1c17gwbpHfFd95Gcqyj+qOdpcYxERU4EuOVxQHuP1p
X-Received: by 2002:ac8:7d91:0:b0:466:b122:5143 with SMTP id d75a77b69052e-47028168982mr106317251cf.16.1738847539944;
        Thu, 06 Feb 2025 05:12:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738847539; cv=none;
        d=google.com; s=arc-20240605;
        b=fLrB581+7YfwRniq8CVkfck4PwZOxiDB4/SePMqs+emp7k2/OdXGl3rvx82zwXfrPM
         ogZeeof2hgVOD4McNgJMwOGXRa155IAg+Qm6rYwIPLSgRFa/095aofOqgMbcjgXC+wXD
         ikEF78+KjtHpMZIoNf2ukCDfEibjKjQxlh/4clGUPJJiQGoShM6aD7T4W3hJp1pt2nLf
         pTt83IIx0IsPMqmzB2UfKUIUSAExlOrwbNxUzkO7qa+aiP5ro6OnSyoiSDmupLe71QLt
         LDv3Ypiw734PXln2WV92hhZe5Wyl8BLn8Ll07f8ZuG812pV5pzSHPPQE2Krq+HTsT0v/
         uQXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=r3g08ohEQSqeyZw6xIdCyqqo2uAlLNUZF1ZoGaNfqHI=;
        fh=7NsVx5R+L140HvZ0es4udPXCD2KdHoHcZm3kdyNBbE4=;
        b=gmCT/TM3uq4BrHUzgvM5qIXaRN1yc209H4/6Zg4Kce3lE6JJXDsuoPX3QE+91Lhg+y
         FbAquiE/y/0B4cCcZEF06RJjLoD1HDvc7qvj/AcIvPXSWj4z/w89TmwfgXDKv1HydWSE
         rP1hNAVQyqyn7iD/TVORsnFrUAYltB+NmKdN0dKw6pDANXoiCUln1xcv7iD6ei+hGOLg
         6lJn9yDbe94GFMixX+W3jynK/MK5l96If6Ee3zB/PF1jvWaQPoedLO3cXhrLorP5/TGE
         +DTmkA4pnfojS69v+my5g28JogSA6zsBA9H5vxetaJgn7Mz9Ol2JSWdtGCmTMEkf2+gf
         frtQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QvmxTOgH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471492947c5si11182971cf.169.2025.02.06.05.12.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 05:12:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QvmxTOgH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg1fF-00055y-Ht; Thu, 06 Feb 2025 08:11:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg1fE-00055O-N1
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 08:11:28 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg1fC-000862-S7
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 08:11:28 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38db34a5c5fso409380f8f.2
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 05:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738847485; x=1739452285; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r3g08ohEQSqeyZw6xIdCyqqo2uAlLNUZF1ZoGaNfqHI=;
 b=QvmxTOgHTmAnid7oFxuDWaPFcHlU2zS29pjJEd/IT9nt8opTgzn1iM4zLvrB1VJznB
 eVSyakxaSmy4Jf5KcR7B2pq0YBxjq2Yl2xDUOWUMUHGAtN7hKtYDfMhUPmpkC8hf/p7Q
 HMReITs2ey6oDclumUerK7ePjvAl39WWfoFS+HMnkLOUL3O1pEzpH3+VcyoTm1xAhsaS
 sp3+KCo569pTd2Vda9I+PGyODCpvrC/bPXqAl5KVe00PB/R/m7RmynGtVVWoquIqLXD6
 LpQ2+4cljAKJFtBCdtIYJvbBWiPxEKCwh8YtpCXRY2FLj7ALuLxCuViQ4KvWxHJgtEkT
 zsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738847485; x=1739452285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r3g08ohEQSqeyZw6xIdCyqqo2uAlLNUZF1ZoGaNfqHI=;
 b=ic/ojsSek/OGczCO8XveDWUKsHqlrkR+wYAw/uZUkYn1+K4hPF3Kz74nld8NeIQJOQ
 AU7eSB4jRqdlNqxZZWRtlzhpoKMV4QoQHIMAz/Ac7cpKDxCNeLFcIom6dclf/pFvLOB1
 GQGT8MlGXimoU/l2+pUy7YHzFAvYuAVpfY56UMf5/DEfVHvUT3ok1IJnxUfx3M3WKXjQ
 5BJDFqD0yP85PS4PAsMf8lgKU7H+EDwis99+ItuP0DD3EXjAcVowtg0f4si2nNRE/ush
 rYgL6Mv9HnFktP5WTPs4qTHUNE4o4lpX3A7kGlNT/D35aPkOcWJV2n+5giFFM23gw2rY
 zFhQ==
X-Gm-Message-State: AOJu0Ywhdn6CmouHjDqcfW7CD3ZIDWeCmtahE4KcR1Nl2nEguhfk1PUi
 NbRqwGLgi4/SF67WNwAJlBj8s4k7oQ5PuCZcAGmv+2j8MBYpM3B5A5/PxDT1OwVeq4ZgpEZOiZw
 ZwgI=
X-Gm-Gg: ASbGncunSegtHqWoa2gTfz4h/kilr9Jt2zt8XLBJTf1PyFTh+TDHjtgzRu6TQbpi0p+
 o/c5DzrIUtAfzLDFBpMjUkTB9RsaImi6BLQpn4SNI6iSjgEFmzKol6A3Ub/lvGAeR01PFfMcU5L
 2MyKg+HNc7d6KWdwef5Yf326XIsRubWHUSJum1IF4IT72rQVIJdqESCTKLvHeaY6d+CLrAhPldS
 yK9yfgvY9xcchIeFmusDMs4IPZtz3Gfz7Sja2kIqFGiD10UGzLE9Tg6YbkJhEqN0gMB7NOSqh25
 WR7Sh6+cRzbFM6DVl9DSYUOKvlRIhoypWNl7FbodlwTeODPmQLeTiZ+zsqihU8kbMg==
X-Received: by 2002:a05:6000:1546:b0:385:f249:c336 with SMTP id
 ffacd0b85a97d-38db48db20emr4823198f8f.45.1738847485416; 
 Thu, 06 Feb 2025 05:11:25 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390d94d685sm54977725e9.13.2025.02.06.05.11.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 06 Feb 2025 05:11:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 06/16] hw/arm/xlnx-zynqmp: Use &error_abort for programming
 errors
Date: Thu,  6 Feb 2025 14:10:42 +0100
Message-ID: <20250206131052.30207-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206131052.30207-1-philmd@linaro.org>
References: <20250206131052.30207-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: fovYm7RYatBT

When a property value is static (not provided by QMP or CLI),
error shouldn't happen, otherwise it is a programming error.
Therefore simplify and use &error_abort as this can't fail.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
---
 hw/arm/xlnx-zynqmp.c | 38 ++++++++++++--------------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index bd5b0dd5e76..d6022ff2d3d 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -689,16 +689,10 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
          * - SDIO Specification Version 3.0
          * - eMMC Specification Version 4.51
          */
-        if (!object_property_set_uint(sdhci, "sd-spec-version", 3, errp)) {
-            return;
-        }
-        if (!object_property_set_uint(sdhci, "capareg", SDHCI_CAPABILITIES,
-                                      errp)) {
-            return;
-        }
-        if (!object_property_set_uint(sdhci, "uhs", UHS_I, errp)) {
-            return;
-        }
+        object_property_set_uint(sdhci, "sd-spec-version", 3, &error_abort);
+        object_property_set_uint(sdhci, "capareg", SDHCI_CAPABILITIES,
+                                 &error_abort);
+        object_property_set_uint(sdhci, "uhs", UHS_I, &error_abort);
         if (!sysbus_realize(SYS_BUS_DEVICE(sdhci), errp)) {
             return;
         }
@@ -763,14 +757,10 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     xlnx_zynqmp_create_unimp_mmio(s);
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
-        if (!object_property_set_uint(OBJECT(&s->gdma[i]), "bus-width", 128,
-                                      errp)) {
-            return;
-        }
-        if (!object_property_set_link(OBJECT(&s->gdma[i]), "dma",
-                                      OBJECT(system_memory), errp)) {
-            return;
-        }
+        object_property_set_uint(OBJECT(&s->gdma[i]), "bus-width", 128,
+                                 &error_abort);
+        object_property_set_link(OBJECT(&s->gdma[i]), "dma",
+                                 OBJECT(system_memory), &error_abort);
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->gdma[i]), errp)) {
             return;
         }
@@ -811,10 +801,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi_dma), 0,
                        qdev_get_gpio_in(DEVICE(&s->qspi_irq_orgate), 0));
 
-    if (!object_property_set_link(OBJECT(&s->qspi), "stream-connected-dma",
-                                  OBJECT(&s->qspi_dma), errp)) {
-         return;
-    }
+    object_property_set_link(OBJECT(&s->qspi), "stream-connected-dma",
+                             OBJECT(&s->qspi_dma), &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->qspi), errp)) {
         return;
     }
@@ -833,10 +821,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     }
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_USB; i++) {
-        if (!object_property_set_link(OBJECT(&s->usb[i].sysbus_xhci), "dma",
-                                      OBJECT(system_memory), errp)) {
-            return;
-        }
+        object_property_set_link(OBJECT(&s->usb[i].sysbus_xhci), "dma",
+                                 OBJECT(system_memory), &error_abort);
 
         qdev_prop_set_uint32(DEVICE(&s->usb[i].sysbus_xhci), "intrs", 4);
         qdev_prop_set_uint32(DEVICE(&s->usb[i].sysbus_xhci), "slots", 2);
-- 
2.47.1

