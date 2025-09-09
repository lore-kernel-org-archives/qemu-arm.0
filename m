Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E27FCAC58C
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Sep 2025 22:13:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uw6Zq-0007Ri-41; Tue, 09 Sep 2025 18:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3EabAaAYKCKwkgNUZlSaaSXQ.OaYcQYg-MdYZaZSZg.adS@flex--yubinz.bounces.google.com>)
 id 1uw6Z2-0007Fq-IG
 for qemu-arm@nongnu.org; Tue, 09 Sep 2025 18:11:48 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3EabAaAYKCKwkgNUZlSaaSXQ.OaYcQYg-MdYZaZSZg.adS@flex--yubinz.bounces.google.com>)
 id 1uw6Yp-00050P-0Q
 for qemu-arm@nongnu.org; Tue, 09 Sep 2025 18:11:47 -0400
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-24ce3e62946so85504875ad.2
 for <qemu-arm@nongnu.org>; Tue, 09 Sep 2025 15:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757455890; x=1758060690; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=G/LP6fTHBZkghRvQJyUqTkcACbgbCjWb3Gp/fpwioow=;
 b=eZTGCHawkY5g/Zo0sq6x+7rPmGuinGlaWcayGI86L0jl7n0sSNv+YiTz3OC3xFvPwa
 Tm5TqsMrovomnQ83K61HPIe9XK+mjfIxeyJHiDCSzFYqHIKXcTTwa5yhZKcsTllCpmBY
 DzQQxeQrQp+6wBd2oG0yockFaSQdzdXKJKXLIR3iLvFQ1uy4OmDlooxwqFD3imu5MkDX
 fJRZ6EpwHjq/lZ8jC8gonT8wYv3i+5pYnf51aT3AIrwylrITJkkAT71QUrz/d1BVofym
 hGFmsxP5d7POBOjZVhFVVJT4imfT7gYvJVfMEjipmTH/VaOh7Iv/6Rw14yOd4w/a6G73
 EvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757455890; x=1758060690;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G/LP6fTHBZkghRvQJyUqTkcACbgbCjWb3Gp/fpwioow=;
 b=DPPDglu1lmoKw7AkwoaEDdpoxbIaR05MbzbJFp9Po7prALNqJg8KVQnbflHvMhpA9R
 cF7cKrW9KJYdi1GjVsIavxuK9Hybx5jP6Hmv+dp58/Bym/MHc6IxeB72Cj2M24FqNPrv
 WksSLoyp3fXroWGT8vLC4Q/1nUFwlcsdBdHlhp7ng6DLrTkiazc04B9qciuAuwckR9e8
 fyDSUVjrXqsl7HRlShIgaIAXF7pJgbnYncrvc8CK98TJ037lJWZhhaAYl+JjxbwGzIyT
 +V5YtVgDfyy1RFplebNhN/6XMcHV86HV+QznmMGfL1C73Wo0Xitfv3wtl2sRqPhldKig
 oXfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgfyRu3f2vroDULwg5UeJkUUXx/DvsgBBQ42jjbhE0YqQ8bybUcdshZOdRFlnbWAqDDMVyL9IMGQ==@nongnu.org
X-Gm-Message-State: AOJu0YywPZI1tTEYlqY375pTVs6AY2Qp/h7ieTaC/AmMxIvbRHfX4Lc7
 uDEPieOYB/EBPlThChVtmLzv5xMWp0ixKK+paqoyjRwRj7k8oQy+URmsq+8J/+TIh0OIOTkPDEi
 JDpUChw==
X-Google-Smtp-Source: AGHT+IHH4qu8wF32SPlJxkXsZfzuY+S4V3Ffo0txGNpbpcarWbDIS9gQh8G3oZB2I5R52nYg9FMPN3howA8=
X-Received: from pjg4.prod.google.com ([2002:a17:90b:3f44:b0:327:e021:e61d])
 (user=yubinz job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d54e:b0:246:24d:2394
 with SMTP id d9443c01a7336-2516ef54ef2mr151541235ad.8.1757455889902; Tue, 09
 Sep 2025 15:11:29 -0700 (PDT)
Date: Tue, 09 Sep 2025 22:11:00 +0000
In-Reply-To: <20250909-pcie-root-upstream-v1-0-d85883b2688d@google.com>
Mime-Version: 1.0
References: <20250909-pcie-root-upstream-v1-0-d85883b2688d@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250909-pcie-root-upstream-v1-5-d85883b2688d@google.com>
Subject: [PATCH 5/7] hw/pci-host: enable MSI on npcm PCIe root complex
From: Yubin Zou <yubinz@google.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Tyrone Ting <kfting@nuvoton.com>, 
 Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Yubin Zou <yubinz@google.com>, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3EabAaAYKCKwkgNUZlSaaSXQ.OaYcQYg-MdYZaZSZg.adS@flex--yubinz.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 09 Sep 2025 18:12:32 -0400
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

From: Titus Rwantare <titusr@google.com>

This allows MSI capable qemu devices to attach to the root complex

Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/pci-host/npcm_pcierc.c         | 5 +++++
 include/hw/pci-host/npcm_pcierc.h | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/hw/pci-host/npcm_pcierc.c b/hw/pci-host/npcm_pcierc.c
index a1767335fe79a30464acf32ae94fc14e417c89eb..0af76d1067a78bdbb169af3e3d5c4a2514cd0ff5 100644
--- a/hw/pci-host/npcm_pcierc.c
+++ b/hw/pci-host/npcm_pcierc.c
@@ -10,6 +10,7 @@
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/pci-host/npcm_pcierc.h"
+#include "hw/pci/msi.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
 #include "qemu/units.h"
@@ -442,6 +443,10 @@ static void npcm_pcierc_realize(DeviceState *dev, Error **errp)
     address_space_init(&s->pcie_space, &s->pcie_root, "pcie-address-space");
     pci_realize_and_unref(root, pci->bus, &error_fatal);
     pci_setup_iommu(pci->bus, &npcm_pcierc_iommu_ops, s);
+
+    msi_nonbroken = true;
+    msi_init(root, NPCM_PCIERC_MSI_OFFSET, NPCM_PCIERC_MSI_NR,
+             true, true, errp);
 }
 
 static void npcm_pcie_root_port_realize(DeviceState *dev, Error **errp)
diff --git a/include/hw/pci-host/npcm_pcierc.h b/include/hw/pci-host/npcm_pcierc.h
index a47eae0084b88ba4388681b24ab97f77a4338594..7d18177510f60d49f7fae7908dd1e3bfbe9ae12b 100644
--- a/include/hw/pci-host/npcm_pcierc.h
+++ b/include/hw/pci-host/npcm_pcierc.h
@@ -87,6 +87,8 @@
 #define NPCM_PCIERC_NUM_PA_WINDOWS          2
 #define NPCM_PCIERC_NUM_AP_WINDOWS          5
 
+#define NPCM_PCIERC_MSI_NR                  32
+#define NPCM_PCIERC_MSI_OFFSET              0x50
 /* PCIe extended config space offsets */
 #define NPCM_PCIE_HEADER_OFFSET             0x80
 #define NPCM_PCIE_AER_OFFSET                0x100

-- 
2.51.0.384.g4c02a37b29-goog


