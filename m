Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp3849961eje;
        Fri, 14 Jul 2023 00:11:20 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGfPb2KeDikO79tyRw+OFdQ8QO0wOoDXoe+/G9QZgSFWxzj3Cnc+/unNb9cTwxXXWMXVWtb
X-Received: by 2002:a0c:db03:0:b0:621:3b88:7b09 with SMTP id d3-20020a0cdb03000000b006213b887b09mr3634505qvk.35.1689318680158;
        Fri, 14 Jul 2023 00:11:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689318680; cv=none;
        d=google.com; s=arc-20160816;
        b=k9jLL/bCPrucrqrzeFuFgiHUobvYmDPqQ2ygBGOCvXOTzWsT0Cjm8Qk4nERsN99JDY
         wyeXoPPtKV0K4aU2zvk96IAJuAiEofbjVtkHBfUSEKu9I+uDweny7+IKBqPoIvpo0qDP
         EzyMrepdPTFuzUhwOW/+HnDoqUhaz4Vtab1E/X5ewF3FubQ4uvN8n8lKvFc/Oo8O0jmg
         KJ7C+962Ql7SFgD5mspRDZX4Y6Lcl8gSg/ofuw2d81XcU8yNSG+x1BrikGsUWkjEGrBR
         GLpp22y1ydWRnl3kMyAWZfKxid9ACV07N+1ZXhYrLMxXA6v6AOdz7D1DEa+fOObpFJ0E
         d2yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=+HQxHeYSCFt0gaxwSBu2iS2jS4+U9yok4dHEixFy53s=;
        fh=h7XMjZ+e+xKUPDdR7kC9prmVooLNagtTzwVYB/B/ZFI=;
        b=gIQN4+2nXwQ+WLAFF94ABnxkiMLOdz5Qs7ucsyOvoh7lgD9rw8JzYqJW9RDlIPX0Ti
         /VU7/zh3QbIXj0pczEmPLn1P0a/tggAXP+zIAc8EFkPqe2YGhJS22wLdtFNpofHoa/aw
         F2dNekaaj+qZqvN3/bINTXW0OojrlUqzjgLyQhcmM7XlhSf96S57qAm9b246aIIMUC2b
         nWnbMDAGXZNr1rGfM8tJ/XQg3QPJKkU+BozW6AFoHIY9/RokmrPSs5STS0Pdtnwd0ZpH
         JaBc42K6cesMWSNZp1aQNKhpzbNwOIw04bsgJ63Ub1ASPamiJajUfSf2inqkkBty1Jgo
         eLuw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10-20020a0ce38a000000b005ef46551916si4038930qvl.413.2023.07.14.00.11.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jul 2023 00:11:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qKCwG-0006Ov-KB; Fri, 14 Jul 2023 03:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1qKCwD-0006NI-RM; Fri, 14 Jul 2023 03:10:01 -0400
Received: from mail-pg1-f175.google.com ([209.85.215.175])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1qKCwC-00059v-Bq; Fri, 14 Jul 2023 03:10:01 -0400
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-55fcc15e109so68673a12.3; 
 Fri, 14 Jul 2023 00:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689318598; x=1691910598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+HQxHeYSCFt0gaxwSBu2iS2jS4+U9yok4dHEixFy53s=;
 b=U1PvDqG2HGEePQ2ErzqMEcUPzvdrHysRSRRxPt3inALN1AwkU/5aVGQjLsFmrMXNiy
 2YRGDRX4vjCHuhfLnp9aamadIW+JKHVBw4s05UXc++uMTmut8elrQefkyWtk6KfeMxpD
 +pCXViBSinHv4eQarYq8Dco6o6FtXJ9cqe8ZZSRbKcPwveUd+XRytFV+sC7dj0+KM4ID
 UvbIVL5X1dEg/4SjZqJmtv2gTx2hAXKqdLzLSo+UWhCQNQrje+o5XLWana9q2YxsAd2v
 8mIxpSd6U+Bp01YsVzTlNIPCVlnQHkmbDlnJxyIycMXJTDDryGEQrelrlYoWUJV3WBd/
 trUg==
X-Gm-Message-State: ABy/qLaNmOgj/L7GOlsu9lANBkc4QIhTblYj9n/ehR5T2/KABmPHqRE4
 Pa3jBBI3l7lZEInvMXoYNZh5B5duKHFbvQ==
X-Received: by 2002:a17:902:8bc7:b0:1b5:1787:d23f with SMTP id
 r7-20020a1709028bc700b001b51787d23fmr2370577plo.5.1689318598364; 
 Fri, 14 Jul 2023 00:09:58 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fb90:dd17:8dad:e558:8948:1ff6:c8c1])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a170902b20800b001b89466a5f4sm7041513plr.105.2023.07.14.00.09.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 14 Jul 2023 00:09:58 -0700 (PDT)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Cc: Joelle van Dyne <j@getutm.app>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:Virt)
Subject: [PATCH v2 07/11] hw/arm/virt: add plug handler for TPM on SysBus
Date: Fri, 14 Jul 2023 00:09:23 -0700
Message-ID: <20230714070931.23476-8-j@getutm.app>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714070931.23476-1-j@getutm.app>
References: <20230714070931.23476-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.215.175; envelope-from=osy86dev@gmail.com;
 helo=mail-pg1-f175.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Qbcns1dOzese

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

