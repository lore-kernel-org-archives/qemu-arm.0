Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531B9D6AB16
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Apr 2026 21:59:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8Q3B-0001Cf-9a; Thu, 02 Apr 2026 17:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w8Q2p-0000My-Nh
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 17:57:46 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w8Q2m-0007Ie-SP
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 17:57:42 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b9c11eba219so168211566b.2
 for <qemu-arm@nongnu.org>; Thu, 02 Apr 2026 14:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775167059; x=1775771859; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iL3C1pS7IifBgrlCFYdscA+wkLZ194nZOqF5fMNffCY=;
 b=e7i3rcM/0HgRHaTVJFv272qgD4rNfsp7KVxhzd53YDbV1pUokSCLCJqnJPOw3bK+Di
 P2VfdjsKK8GBUoEURZUYcswT0/ZDoqcEwe37JN5Z9B+jmQ57mQj2imTjz8UzvJYA8iPh
 XsNdUm6zesFTqgZMw6Few0u8EZgb4/u3dQlR77IrVa1Rp9kyl5sVhZNsbPRAe79LJSTq
 YBydB2T6lHzYkRqz38ULUS/FJdVKEyGlGN78dEO4N38sWw3mNDb64ujhGqffJlqEhkyO
 yRHcB8wNcXXqRSfr+fZe4LNnwGX/ayeubEo5cfxfbu+XMlTTAQjhYMIU6NKFEwA2m9hz
 Vkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775167059; x=1775771859;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iL3C1pS7IifBgrlCFYdscA+wkLZ194nZOqF5fMNffCY=;
 b=MdiK2Q0jq3xtowsetiTxX4elYYc07DWG7TJ/YFBAkW5tS3fp8TwTdBKT4/8vd3Oqqf
 b9xQqreg8VxcXneYpx+6ZIkTXLQ8HscTZy4WQr72zByPAf8lPgwyI44ar2nIFi7yhoIT
 R5d9B6TZF1eh6yFBGJIu0iH4zbVQYvDDlLwMoberI1zri5I+iBaATI+pNwolCU3mrOr9
 fFHJP12qCu1fQQJDTh76R1rE3U9iJITvg/ZVKypF3S/qvc6FzKCIAPkv6lkQIkiTHVVr
 9+tj2qVH2f0wFvDu8XN0VEqVtg/LmMLlTUkTVBed5IRMy7ulwJeYsaGMIaT/w3lE20yO
 VvQQ==
X-Gm-Message-State: AOJu0YxunpEduwjXcHK/4X6RzzlV268FN+TTXIV6gtXZy48WkA/oZiOX
 4xFgYSxPal/qRCXAn9Yh/4DfoZn3ZO1XbVL+aO02Wi9UF759v7PIfVqa
X-Gm-Gg: AeBDiesbEdSHcT6RrSCXJTIZ/nfgTFbCetNmWDVkpi26vlM5iQlkbqYHp+foDYXjTzF
 ls4MMqM/lXOdqe3bbjsp+cr8fRP8COXgyStqdzdkc5kk22ziE5zAwPRRYHAQ1JpzfjQEPpWBCtk
 hA9X0T2O7yBfdPwdcJIjU+SlHV27vMyWYE6smxG+6W3OWCjo/xiEb3ePBhCsXu7USdBvxsObVud
 W+rAnrlmZr6xmVOS9VBH0fEAUA3w2QOS5dGbVmGcdlrBCw1+kg4BNwS4lOC/pPNmfOtZ2J1ciAi
 HobepjYQ2on12gQVteOhDqB7SQKKdm/yhdSxj4PjQ9WjXbfJfVVTqA6MAPDm5mVO6Evsf6nQ2jH
 bnqRj5duAIp/XdE5hiUIpCTRO1EMbofrGgpHEJmIrv1flpHUyUfaPxRDPjZhaFQJVTIzj/NMJfu
 aGSCFuGihD1h8apHdVwFUvvQhp7WhEtZxvwWgs3YDqcaiFogjakvbwhEfcjYCCv4nuEpb6WUbcj
 QupddtP
X-Received: by 2002:a17:907:a317:b0:b9c:4096:7893 with SMTP id
 a640c23a62f3a-b9c67308dacmr28594166b.14.1775167059305; 
 Thu, 02 Apr 2026 14:57:39 -0700 (PDT)
Received: from thinkpad-t470s.. (93-143-182-244.adsl.net.t-com.hr.
 [93.143.182.244]) by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b9c3cac0e1asm134009166b.27.2026.04.02.14.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2026 14:57:38 -0700 (PDT)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org,
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com, balaton@eik.bme.hu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v3 32/33] hw/pci-host: add gsi-irqs property array
Date: Thu,  2 Apr 2026 23:56:17 +0200
Message-ID: <20260402215629.745866-33-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402215629.745866-1-ruslichenko.r@gmail.com>
References: <20260402215629.745866-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-ej1-x634.google.com
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

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

Add a new gsi-irqs array property to the GPEX PCI host controller.
This enables them to be configured on realize callback.

This is required to init GPEX PCI host from a static configuration,
such as Hardware device tree.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/pci-host/gpex.c         | 6 ++++++
 include/hw/pci-host/gpex.h | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
index e66784ce51..6125b2c319 100644
--- a/hw/pci-host/gpex.c
+++ b/hw/pci-host/gpex.c
@@ -148,6 +148,10 @@ static void gpex_host_realize(DeviceState *dev, Error **errp)
         s->irq[i].irq_num = -1;
     }
 
+    for (i = 0; i < s->gsi_irq_num; i++) {
+        gpex_set_irq_num(s, i, s->gsi_irqs[i]);
+    }
+
     pci->bus = pci_register_root_bus(dev, "pcie.0", gpex_set_irq,
                                      gpex_swizzle_map_irq_fn,
                                      s, &s->io_mmio, &s->io_ioport, 0,
@@ -190,6 +194,8 @@ static const Property gpex_host_properties[] = {
     DEFINE_PROP_SIZE(PCI_HOST_ABOVE_4G_MMIO_SIZE, GPEXHost,
                      gpex_cfg.mmio64.size, 0),
     DEFINE_PROP_UINT8("num-irqs", GPEXHost, num_irqs, PCI_NUM_PINS),
+    DEFINE_PROP_ARRAY("gsi-irqs", GPEXHost, gsi_irq_num,
+                      gsi_irqs, qdev_prop_uint32, uint32_t),
 };
 
 static void gpex_host_class_init(ObjectClass *klass, const void *data)
diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
index 1da9c85bce..f8e9874756 100644
--- a/include/hw/pci-host/gpex.h
+++ b/include/hw/pci-host/gpex.h
@@ -64,6 +64,9 @@ struct GPEXHost {
     GPEXIrq *irq;
     uint8_t num_irqs;
 
+    uint32_t *gsi_irqs;
+    uint32_t gsi_irq_num;
+
     bool allow_unmapped_accesses;
 
     struct GPEXConfig gpex_cfg;
-- 
2.43.0


