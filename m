Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp3055707eje;
        Wed, 12 Jul 2023 20:53:54 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEIJJ6fmcgSaUGLfnWEhT7dlcgsYTtLTKNDTcKbDb//vs1A+BUPaxwYtBME0f+IhBjjmqDY
X-Received: by 2002:a05:622a:1302:b0:3ff:24a8:4f26 with SMTP id v2-20020a05622a130200b003ff24a84f26mr867671qtk.16.1689220434497;
        Wed, 12 Jul 2023 20:53:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689220434; cv=none;
        d=google.com; s=arc-20160816;
        b=LcGYDbyTJpectpEWiLSmCx0nrPk9SWEn7yVBeDLhtdNvLmxh6nMGiqcsp7Mb057L++
         VQ4Db6yiO8zA9JV2FL7kVKNu9A9b86SVvjEjdXpGJAf2Dv7Bu+CZKCTgODF25sqlMfs/
         cdxhAEMWeivc1k3kx3mt13fsCyYi8PgcJJ0svD4BVXNizNz5qdQTMA7Ub06WPRcsWFkE
         i+LjCVQJjvVTV47XpMYxQtpRpWKSiBgLQGAi1LQJHHGLyOGjAHh2xo6VyXi7tY/DrIzZ
         bxyTPCQuof9i0hCoDGonBnR/CxnqmhyJOHCAwjcPomI/+5OftJoGkycIp5D3I+xNZu1f
         ZCBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=+HQxHeYSCFt0gaxwSBu2iS2jS4+U9yok4dHEixFy53s=;
        fh=h7XMjZ+e+xKUPDdR7kC9prmVooLNagtTzwVYB/B/ZFI=;
        b=e/XeYwoinvwM5T+8pImafNiIqBQyMVMkXieP5XIkLgEsUIeanK2DEsTvbCdXVQcZUM
         Y/fLuXGjyPGIPPlNA9+jFy43da0FsEJa8bp3wrDifwhjrAmre2gbaZ1tkX/0kN6aJm6Y
         i6thsMIuQIKZgBrUr/QTTWwX+94QU6KN6hP70fy1sdZJxbumKMTX+p1EzR6uGTdB+B2I
         Ta9N6ZCPqvpn+AUK2081nainUH8gtbzM6ru7YYlh66ONYlQMEYd4ZJHhWqVoMNNHL6r0
         EtHBalesfE/8Ft0C6WMIcip+ChedAsrp/8swq18epVEJaziDEf9GunFUItPPW5MejrjC
         EjiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z3-20020a05622a028300b00403b21c69c3si2589438qtw.214.2023.07.12.20.53.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jul 2023 20:53:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qJnOB-0005RP-Pe; Wed, 12 Jul 2023 23:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1qJnO1-0005PK-UY; Wed, 12 Jul 2023 23:53:01 -0400
Received: from mail-pg1-f171.google.com ([209.85.215.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1qJnNs-0004cV-H9; Wed, 12 Jul 2023 23:53:01 -0400
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-55ae2075990so204404a12.0; 
 Wed, 12 Jul 2023 20:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689220369; x=1691812369;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+HQxHeYSCFt0gaxwSBu2iS2jS4+U9yok4dHEixFy53s=;
 b=MRSvrKeJLBpIN2xe5dfTEkhjQjzNQqaDNqWbEaZ+NT6joqkyg8jtZoxvHSdlYH/V+R
 CgBxwJM1LRLmET/UqkXA8VjqOQ0Og75doizXlr8a54vPysJevUmvYYgVtyKgy7z3aYdY
 O9NuJGAInezBeJ8EAQ+owndk8jLPMjTzBzs3rt5O38evBaHU+p9CSkceLiNXtr+E5049
 USHWUi5ERHn8T3bpaemnkG6UyC9h9bZRVXM3ZZMgok5GVxf/DL22dSmY/lWE1h2BsqTZ
 TfefezRcWphCdUcs9bcL8b2CdzJrPB3zQZkL4ZVeFYuWbYUU+KtjL7CgSH3JGwxgf8L6
 lmyQ==
X-Gm-Message-State: ABy/qLY1cEwsjvfPo+RVLWgCDHsMAj9oaXZgGXHsEIJv9R9M6cfecci0
 DqkX5x64Hh+8SOXCFMYVFa/CD06cyybBFQ==
X-Received: by 2002:a17:903:124a:b0:1b8:b433:7fa with SMTP id
 u10-20020a170903124a00b001b8b43307famr292425plh.13.1689220369431; 
 Wed, 12 Jul 2023 20:52:49 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:8b82:587c:b800:84d:31b7:313d])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a1709027c0600b001b8a37ffb5asm4756199pll.4.2023.07.12.20.52.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Jul 2023 20:52:49 -0700 (PDT)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Cc: Joelle van Dyne <j@getutm.app>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:Virt)
Subject: [PATCH 07/11] hw/arm/virt: add plug handler for TPM on SysBus
Date: Wed, 12 Jul 2023 20:51:12 -0700
Message-ID: <20230713035232.48406-8-j@getutm.app>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713035232.48406-1-j@getutm.app>
References: <20230713035232.48406-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.215.171; envelope-from=osy86dev@gmail.com;
 helo=mail-pg1-f171.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: BQCuAO9XcD9G

TPM needs to know its own base address in order to generate its DSDT
device entry.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 hw/arm/virt.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7d9dbc2663..432148ef47 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2732,6 +2732,37 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
                          dev, &error_abort);
 }
 
+#ifdef CONFIG_TPM
+static void virt_tpm_plug(VirtMachineState *vms, TPMIf *tpmif)
+{
+    PlatformBusDevice *pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
+    hwaddr pbus_base = vms->memmap[VIRT_PLATFORM_BUS].base;
+    SysBusDevice *sbdev = SYS_BUS_DEVICE(tpmif);
+    MemoryRegion *sbdev_mr;
+    hwaddr tpm_base;
+    uint64_t tpm_size;
+
+    if (!sbdev || !object_dynamic_cast(OBJECT(sbdev), TYPE_SYS_BUS_DEVICE)) {
+        return;
+    }
+
+    tpm_base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
+    assert(tpm_base != -1);
+
+    tpm_base += pbus_base;
+
+    sbdev_mr = sysbus_mmio_get_region(sbdev, 0);
+    tpm_size = memory_region_size(sbdev_mr);
+
+    if (object_property_find(OBJECT(sbdev), "baseaddr")) {
+        object_property_set_uint(OBJECT(sbdev), "baseaddr", tpm_base, NULL);
+    }
+    if (object_property_find(OBJECT(sbdev), "size")) {
+        object_property_set_uint(OBJECT(sbdev), "size", tpm_size, NULL);
+    }
+}
+#endif
+
 static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                             DeviceState *dev, Error **errp)
 {
@@ -2803,6 +2834,12 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
         vms->virtio_iommu_bdf = pci_get_bdf(pdev);
         create_virtio_iommu_dt_bindings(vms);
     }
+
+#ifdef CONFIG_TPM
+    if (object_dynamic_cast(OBJECT(dev), TYPE_TPM_IF)) {
+        virt_tpm_plug(vms, TPM_IF(dev));
+    }
+#endif
 }
 
 static void virt_dimm_unplug_request(HotplugHandler *hotplug_dev,
-- 
2.39.2 (Apple Git-143)

