Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05217CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 08:07:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDeix-0000ig-9h; Tue, 28 Oct 2025 04:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDeiL-0008MB-J1
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 04:05:59 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDeiE-00018x-2a
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 04:05:57 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-42421b1514fso3959112f8f.2
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 01:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761638733; x=1762243533; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iLNTJJ29Ee3X1iQPo0J9sRKYXDME7PYcE1MlaahJ0F8=;
 b=NmbsCkdFO1bIXmdJPZU5bZmPxgf5ssytzFLmJLBu+iAO8MQO8Euwm1fpl0FSv2MkhR
 jVUuPj97s9f+Lq7Waz2GWX5rrBTYr0Pord70qhHz6verIv0VuR9M5XIzNC9P5V2MXWhg
 9WS50bMnqQQ7OCZ//b5YytlMQ2bo8CQnnTdnTKWIymkU4zovi1f9aRBY7YVjjbHQLJfZ
 GpEZHNOzEpuKzhyuAznsOIh7InZtsUkccwWDeiQrczi/7oVbxvHiH48csvARNMOUhDvU
 vAK3c/Qj+bHA5ff6d2nI5X6857bQEvPHlFsJnJFgN3yAs5cyFzOINwErkw1cZnsJ9OpA
 b9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761638733; x=1762243533;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iLNTJJ29Ee3X1iQPo0J9sRKYXDME7PYcE1MlaahJ0F8=;
 b=H/OZwSX0PzGZn6aCJyaRRAekF77LzsC3lMWpQFktgT32WvMHncs2J5erY3BHWxyRaB
 G/Fd8iY73xanQ2QAowFQRRjiH5H7vG94wTUTWoXj5YyAJjT+5+1ECGes/QAfPIVHf+lR
 SQW/Vx05aDZOvuRfV6+nm0JIvYOZnlVAFB84JMZZv5TpVwDtoQ+nMdMPJaypcP6XUwea
 nhBIGEEGbsRAnZzPhFdWtqOYAw0cuxVN2AGt0AxAF6UhGaQSPByk5VNnRKwk2F+VPCIf
 0sDktu8wHspNI4XMGlFyK25ddTn4bknpo2aTn2Nyw97nSHQwRXEfPJkw4DboQOSFC6XW
 p96w==
X-Gm-Message-State: AOJu0YyEXsy0Ho0FTcouTiseM3ozaM/mxc4EGn60oK/cLI/uuPw+T46B
 aQFudh5cOorK88fa/EkaKMluK7sH75a9Tt+a/OHtnViZZy52ZB0J9UbMmspl0xsa1w4=
X-Gm-Gg: ASbGncvGy2d0R3i+AnZOpiCLHfOVuO57Hg7ajmg33dzhBPxsVIEiGy1Ucm5iimCYSEs
 KzIUSwbajgCVBlrTjCfQ2QqcngEIC5yedBdApGn7wRwSkuPZ3FypytsgXvxP5z7HJJHIW+sy6Bi
 LeDivVAnXAnHBiTo+Bc40n8aJy9PclAAB2QZbLsj9+e4jIIoUqaCIv2T6zZ8d8L6meE+LA1CHbD
 HgVHRSpYZBrELKtZiI/RHE2uT86PlQqNi0Bk8e6kZGjb+uvA4DZMXeVj2Q6PbPkcvjtaLi1lyoG
 fVR9g7NwHWX8Ke7QXk/vCXXMRSyC9fHWlGJ8LX6JfoF8VesVIhpl/aEfmusba54eB3cJ6am8smu
 OYRLuzRedcV5jJpsPvBz5BBEqXX7xMAziBIgggXHuYRAGFB+flHq3mk4O53GbtowVYSB6iPPTIe
 QcCVwTuSCHLJbPGdazYruD+RDBfrxWl1KNL+Cmhcyao4446S3+PPoxODztycZTWqIfyw==
X-Google-Smtp-Source: AGHT+IHTV9tfboutLKGYM3eTyb+CR5VW0SOflc97As9XGisSmavfqFO11jtskHLKrFhaWBMZ+mW0Jw==
X-Received: by 2002:a05:6000:40d9:b0:427:665:e37f with SMTP id
 ffacd0b85a97d-429a7e36fe9mr1801485f8f.4.1761638733488; 
 Tue, 28 Oct 2025 01:05:33 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952da12dsm19103620f8f.29.2025.10.28.01.05.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 01:05:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 7/7] hw/pci-bridge/pci_expander_bridge: Use proper SysBus
 accessors
Date: Tue, 28 Oct 2025 09:02:57 +0100
Message-ID: <20251028080258.23309-8-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028080258.23309-1-philmd@linaro.org>
References: <20251028080258.23309-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

SysBusDevice::mmio[] is kind of internal. Use the proper
sysbus_mmio_get_region() accessor.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-bridge/pci_expander_bridge.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index 1bcceddbc4d..b4e2c95ae4c 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -157,9 +157,9 @@ static char *pxb_host_ofw_unit_address(const SysBusDevice *dev)
     main_host = PCI_HOST_BRIDGE(pxb_dev_base->parent_bus->parent);
     main_host_sbd = SYS_BUS_DEVICE(main_host);
 
-    if (main_host_sbd->num_mmio > 0) {
-        return g_strdup_printf(HWADDR_FMT_plx ",%x",
-                               main_host_sbd->mmio[0].addr, position + 1);
+    if (sysbus_has_mmio(main_host_sbd, 0)) {
+        MemoryRegion *mr = sysbus_mmio_get_region(main_host_sbd, 0);
+        return g_strdup_printf(HWADDR_FMT_plx ",%x", mr->addr, position + 1);
     }
     if (main_host_sbd->num_pio > 0) {
         return g_strdup_printf("i%04x,%x",
-- 
2.51.0


