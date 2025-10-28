Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC73CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 18:37:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDoZX-00025l-Ul; Tue, 28 Oct 2025 14:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoZW-00022y-VD
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 14:37:31 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoZM-0004zf-4X
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 14:37:30 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4710a1f9e4cso51541005e9.0
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 11:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761676635; x=1762281435; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=da20sap9SAei7iAOsl6G96LauqZxiVssKlSk19y/1Tk=;
 b=XELCyF9cVUcKv2F0ges/gg8zm0dId+/iDI3HEDKKSurDbnJZe0ehGxc+gvsw6S3yJL
 EzwWeq2Cd7RB8NncsRv2LQuTbghnsN8cjO6bPn3jUR8L2zM5c5klRofJwbVmhHfFi7s1
 JGYjdqCXDxv9WFj2sGVX9Xz2wQdRxoAnTCgfCp6fMIvRmS4rfeWnsYR5kiqYZfTVAiPX
 8xtl4n7mY8eb4TgRX0wTkgokXT2V6NYjyaJ0sjZxpJ5y+rsnoIPGrsuUG5bcrBtzG1Bp
 JpfOpBfs1HvXT/39nmH/9aZ7eyYUqaKVPm6ZfyAO7YVrgKNIhbz+mbVaOAN0au2/Azcs
 CLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761676635; x=1762281435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=da20sap9SAei7iAOsl6G96LauqZxiVssKlSk19y/1Tk=;
 b=bWNHK9+qgHYpz69WkeHA9gE8MG7aUOzkpb6pB4c3283CilFVzVr2r6djqh/Ce+kHSr
 cby2nxkfmbeJK6qXhStUwzYIp3G265ZD6KD5BTtxIuZEV1OogqKWsiGony6Rx/32bG3v
 KPth9ZseLaMWRCoGC7Jbf9v/nbPyF2FCS/NGjhwveFV1GBQaD9Bs7gbq8PruQB2eKepn
 sX2894YUPNEGAVqAY3W7punr+Yto+eXR6R0dCcPpmh0ZO8pDq/Nr/0yCmqb3qnbxbtd9
 W1HRBRPzdhb3k7YB2WReXPvB8pWbAR8oZcLKup9xkigSkhKPOUGHDBmc57ofUQoA/7F9
 3Vhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaPRQDuMZ2T/UNGdYnwj0sQ72a7S/FH5pDysIBwVxL5RjkMW2Y0mjHrmXeHWjSlMGj+7m7bRyP9Q==@nongnu.org
X-Gm-Message-State: AOJu0YxxGUrb6EpBSszK8actjPAuUpEkHN7FFaRzOItf+/2GfFG3LJoF
 AQxxfuYdTAnieW8HVWuBJkyfeZWUzUALaVxxD04IA1tXF1FL1wvnhtqfz+lrl+gHlzM=
X-Gm-Gg: ASbGnct38ACzeiondDyFcso+s9zJidSKUC9l3/Rcn0oT985zubjXAy/pajAFobuabSR
 1BFso6d2wiTYgJGNU1ceY95Eo+Hd6luTce1gw0Ez4IHDJhahmAPvrHljuV7LHkQvH/EGNkEAGq3
 WdXt85BnJdpsqaXtxcSAV4dGsVU+2Ata42HXWLLVdSsV4FE66b96FzDIemdj++nFIOs5kGZliS9
 DiuGVn/0JDPSUJClBtm0MHSJVAMjXRmcXlIq5r6IPWFLCbFNdnzg1Di1WU623uAdJ+umovieO3E
 KXEwPA+Oh/NJviPsWeUBFUg3YdKItwjSqhDol5UbvaUbEks8v0v+3cknX9Bl/QOvOoM1oq2/9Ne
 8Bgo/WXkwRnOOzrInuqBSfdwcQslfDEN4Qp7I7AQjD2cAymjHuwUM+l9f43BG2UJOX9FpiI054d
 +m5QVYJPYTC/n0pbUq4cpjbp9qB0AzSa+YcdzNXOPPHjzaYcD2iA==
X-Google-Smtp-Source: AGHT+IFapD6B1mwLK5l5mb2JHMsdWVzmVKw4vmGK+atso96F/zVqkutbGq8wyv3L0Md4xYfeUTvgrw==
X-Received: by 2002:a05:600c:5197:b0:46e:2e93:589f with SMTP id
 5b1f17b1804b1-4771e17ef8cmr3841085e9.14.1761676634843; 
 Tue, 28 Oct 2025 11:37:14 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771e372a2asm4969435e9.1.2025.10.28.11.37.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 11:37:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v3 21/25] hw/sysbus: Use memory_region_get_address()
Date: Tue, 28 Oct 2025 19:12:55 +0100
Message-ID: <20251028181300.41475-22-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028181300.41475-1-philmd@linaro.org>
References: <20251028181300.41475-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

MemoryRegion::addr is private data of MemoryRegion, use
memory_region_get_address() to access it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/sysbus.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index d33be6b2b52..414b3f806d1 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -257,13 +257,14 @@ bool sysbus_realize_and_unref(SysBusDevice *dev, Error **errp)
 static void sysbus_dev_print(Monitor *mon, DeviceState *dev, int indent)
 {
     SysBusDevice *s = SYS_BUS_DEVICE(dev);
-    hwaddr size;
-    int i;
 
-    for (i = 0; i < s->num_mmio; i++) {
-        size = memory_region_size(s->mmio[i].memory);
-        monitor_printf(mon, "%*smmio " HWADDR_FMT_plx "/" HWADDR_FMT_plx "\n",
-                       indent, "", s->mmio[i].addr, size);
+    for (int i = 0; i < s->num_mmio; i++) {
+        MemoryRegion *mr = sysbus_mmio_get_region(s, i);
+        hwaddr addr = memory_region_get_address(mr);
+        uint64_t size = memory_region_size(mr);
+
+        monitor_printf(mon, "%*smmio " HWADDR_FMT_plx "/%016" PRIx64 "\n",
+                       indent, "", addr, size);
     }
 }
 
@@ -282,8 +283,10 @@ static char *sysbus_get_fw_dev_path(DeviceState *dev)
         }
     }
     if (s->num_mmio) {
+        MemoryRegion *mr = sysbus_mmio_get_region(s, 0);
+
         return g_strdup_printf("%s@" HWADDR_FMT_plx, qdev_fw_name(dev),
-                               s->mmio[0].addr);
+                               memory_region_get_address(mr));
     }
     if (s->num_pio) {
         return g_strdup_printf("%s@i%04x", qdev_fw_name(dev), s->pio[0]);
-- 
2.51.0


