Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81709EA8541
	for <qemu-arm@archiver.kernel.org>; Sun,  8 Mar 2026 20:35:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzKqd-0007Io-W3; Sun, 08 Mar 2026 16:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vzKqb-0007Gv-O7
 for qemu-arm@nongnu.org; Sun, 08 Mar 2026 16:35:33 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vzKqa-00045u-8s
 for qemu-arm@nongnu.org; Sun, 08 Mar 2026 16:35:33 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4853c1ca73aso1116575e9.2
 for <qemu-arm@nongnu.org>; Sun, 08 Mar 2026 13:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773002131; x=1773606931; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2i4QWuXnsIYxEz7i8mpYTk9RDE3sISGydinWlpK7m7M=;
 b=Y92nr9TPAx6rfQlHQmR6bGbSjC3Qw7Io7377HYBDIgojVQLpBg82maSG4xyW2mT6RN
 1GDJhTXwGhN7HZPR3E8TyrLgSGtZy0Dnwk7V1GUg6ioImpSBzu7sCzkPjGiUNYTQ/IHC
 10mRAp+udJOKaPqMbL5/2j+md9Ktt0nBDUMgl02xmVP6GNDAwqcXoohVxbB5bDwDbSNy
 kj7hpKDnEO3O6t36aa01VUD9pyhpd1bhVjnqNroXJtptYRyWXlCqKszN6lw+RiYclbT0
 6c+tJ/wih3QELMAc8XdYkKMFT2Yyl+xMxIIaK39s7PA5NAdsa6pwO+4rDWyZq1iaGlWv
 aJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773002131; x=1773606931;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2i4QWuXnsIYxEz7i8mpYTk9RDE3sISGydinWlpK7m7M=;
 b=Aj0S0OGRlZiRgrOtrkiglasd+U8Le3w19kVG8PxP7Qc6muNvh2ywoV/7kVUMRajcN2
 KScm6NW7pE0erzCw5ADt0Ju6GKj167/yjVhVhOmYtUJAddxMwFRDLnc6CdQK9etLFRyL
 VJyCt8rcDFJr4UwO7HTV2qGvBr9owjt/qq/TmWkEgIwYtJreeeVvkVCaXglsaK28Kdxn
 KVTp1qibnLCgVNuipLLddlMdzxUxqMOAOggn4pHC9zVMCj4YXnq8SF1IzdMVDuHlx3Xi
 bBDAHM+nCIPXcz+kDGUHByTR0PqlP+HRS/mSj9NBoiZQ9usp8A060g4+acGGhlWHdB1W
 cp/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDXiPjd6cUjDMOmHgmsGQwJU3oY1c6r4paKzK87d4YZgwNDkmKr4lbn0MgcCK+aS7L63BoXF3zag==@nongnu.org
X-Gm-Message-State: AOJu0Yzy8qd79mTKbJdloyadmXsuWg/vprwTRzNnwn/kNunoC8LEqmMS
 S14KGM3TiR14x9RLhFlrqzKX5WAyiCSNvVTr0DNALxS/nILZst5vdQfC
X-Gm-Gg: ATEYQzwcQZoNr4/E+uE2IwULxmbbApKYIFYNWIr5AfpvmywezEhYCUjixal5fWqUEjQ
 yD90+IspGQ9VTkOYqc0cYED/J2ZmiNi0Hhm5ZgGmXtp3IWlvV8FCDdBZ9hfRlXSiegGqvUhjkW1
 L3RCCdfLfZdC4o1d68SPsBnnpS6zPFswibwK2x8CewrWQnXY+HnmHkMT6DuC6tu396jLMGVCl4V
 wIVIIqfPR+1B5qpJOQAieYEBnUtDb4pkLI55j72BzE0l892XD86TvLPIH2MJrgfG+KFj5mC5CAE
 43gMVdDuH4z2rAch8PO1Maa020KcyK2DSmni8y0i3rQI2ZKUDmGfclQM9IcsEDk/hT2oPzHVLh3
 ZZF4Z31JiniJ77BkgoomMzE1R3yQRT0b8sXFHD2IosQKekbq9UZG5l1whV7Bz0E+sIrmx1S9Pl6
 M7rJRt0TDHxeuMiuT7V/foU0OiULVOKu6zELj09Lzt/8YMZTEAAJaeb1tf1opQu4CNRzelZ7yqh
 jlWqP54JK6PMSae+QyIcnr6TGw/BGg=
X-Received: by 2002:a05:600c:64c7:b0:47a:7fdd:2906 with SMTP id
 5b1f17b1804b1-4852691ec50mr146662655e9.12.1773002130682; 
 Sun, 08 Mar 2026 13:35:30 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-25c6-8f00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:25c6:8f00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae2bdf8sm20995508f8f.25.2026.03.08.13.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 13:35:30 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH 5/5] Revert "sysbus: add irq_routing_notifier"
Date: Sun,  8 Mar 2026 21:35:16 +0100
Message-ID: <20260308203516.160103-6-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260308203516.160103-1-shentey@gmail.com>
References: <20260308203516.160103-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32e.google.com
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

The callback has been introduced in commit 715ca691daca ("sysbus: add
irq_routing_notifier") for use in VFIO platform. Meanwhile, VFIO
platform has been removed via commit 762c85543948 ("vfio: Remove 'vfio-
platform'") which was its only user. Remove this unused code.

This reverts commit 715ca691daca081108b33306faa6fa102f0df8d8.

cc: Cédric Le Goater <clg@redhat.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/core/sysbus.h | 1 -
 hw/core/sysbus.c         | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/include/hw/core/sysbus.h b/include/hw/core/sysbus.h
index c0d18d9e00..f3c4259d29 100644
--- a/include/hw/core/sysbus.h
+++ b/include/hw/core/sysbus.h
@@ -50,7 +50,6 @@ struct SysBusDeviceClass {
      * omitted then. (This is not considered a fatal error.)
      */
     char *(*explicit_ofw_unit_address)(const SysBusDevice *dev);
-    void (*connect_irq_notifier)(SysBusDevice *dev, qemu_irq irq);
 };
 
 struct SysBusDevice {
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 3adf2f2faf..3e1160ee92 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -104,13 +104,7 @@ qemu_irq sysbus_get_connected_irq(const SysBusDevice *dev, int n)
 
 void sysbus_connect_irq(SysBusDevice *dev, int n, qemu_irq irq)
 {
-    SysBusDeviceClass *sbd = SYS_BUS_DEVICE_GET_CLASS(dev);
-
     qdev_connect_gpio_out_named(DEVICE(dev), SYSBUS_DEVICE_GPIO_IRQ, n, irq);
-
-    if (sbd->connect_irq_notifier) {
-        sbd->connect_irq_notifier(dev, irq);
-    }
 }
 
 /* Check whether an MMIO region exists */
-- 
2.53.0


