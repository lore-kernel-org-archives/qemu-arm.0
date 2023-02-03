Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1463976ejb;
        Fri, 3 Feb 2023 06:58:39 -0800 (PST)
X-Google-Smtp-Source: AK7set+/D8CXpB46LJn4bZuxBB/bC67oNWnpJPZMbxyZ+jdld3qLProETsxOYv7qHwzQ+P0VtYse
X-Received: by 2002:ac8:5983:0:b0:3a7:e2df:e868 with SMTP id e3-20020ac85983000000b003a7e2dfe868mr19950188qte.41.1675436319072;
        Fri, 03 Feb 2023 06:58:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675436319; cv=none;
        d=google.com; s=arc-20160816;
        b=MMjxT01rKhOeJvwUjMuw89m6EC7dzosCjcbCFtuIw6KQ5egW9y7iM1D7D1K2AtqYZg
         tNuRrBU1g5WVdn4gm+fSswD8sJ/Uk+6GnSoV/CufAFULsHWQjBKsW/4Yz20L2atauF88
         cbk2yEvdmxewrC4xBhJJPN2DGrYyBeCTOOxDlo42moHSj7Lb8X39hiR+59jGAV3WaYWZ
         DrwowhmmMvW29IK4zAi2hpQRFsaZ9ZI46gEEZkwPQeM7r5K8ylyjPoOx/GIe+0IwoO0i
         +vMVNQb9NYBF3U2olcFZ8bZeRy6/jDNSNkcs9yvdBWv/B79y6QhgBCVUlf7BcSlA9Z1L
         nERg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=A0e0NEin6/qB1UWKlWtZ3V9I0KbRtGgK0QPchGtumd0=;
        b=XwCgQTjrgrVsPKVCVPmX28LqTEAwYWMddZ3LKOtaWesE7mpVqp/bokSBME7J0/OF8k
         WFAp0TLhr+QZlNPTUGqDKashrP2O/SDbEZeYzraOuUJOUJs2PNIdq0GTDlfyZSQvElfD
         GcG+3cIlWIZ1VXqzxECf91hqkd2VnsfhvlbEZkVV6QKuQgoc9EL8LqmuTb0UU+LWwtht
         kefXsW/2K6aPydNPdBykb8IFb+hjlh6f2skr8XWxhCgXomg1KTt0pzjAKByJCJwzwqVV
         2bFzv/QoF+JhSVFbnjEkAUKEchLk5das7hWjL/AqfCxNw5jc+KCW8CtRjJk0IsDBADwB
         snPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UOwBBOx+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2-20020a05622a02c200b003b838709b0bsi2111332qtx.373.2023.02.03.06.58.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 06:58:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UOwBBOx+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNxUf-0003kE-Os; Fri, 03 Feb 2023 09:56:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxUe-0003iF-4I
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 09:56:48 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxUc-0005xA-4o
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 09:56:47 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so4069365wms.1
 for <qemu-arm@nongnu.org>; Fri, 03 Feb 2023 06:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A0e0NEin6/qB1UWKlWtZ3V9I0KbRtGgK0QPchGtumd0=;
 b=UOwBBOx+pSOAx6o+hT9sEcWjZyxdZrjr2CamsYDUfjBVb7aI3AnVNQUIyblDNfTr0Y
 c0vFDlEzUCDqg/JSurVSKPlGi4X8L0tRnVZesraz9IpixZp83xc2LP89dc0aACmI2cx1
 hlZ5BcxLJ+PBKoq+U0SWPBkN+uYIuyrwDnunGbSjRB6rrg4EpnTGO3GVM+aMNFG4Vl/5
 sSaP6LRx55j625wZbQe5LLmEu3JKXWPUweRd6Zq5jRXKhroGIiUyvlJdJ0E4OUQHOeqw
 ey+j91d3dr0XsRh5cFVBR5NQK2HrY5PwKvKS2lzkY91RiCdYCKUmrG8m++XjwgEnAaIz
 J70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A0e0NEin6/qB1UWKlWtZ3V9I0KbRtGgK0QPchGtumd0=;
 b=Mwq5Kh291F7eCNFNQep4rj0AQMY67LMfAOYIN/BzLmDe7NySNPd8NDlWBlRJFw/sit
 iSk6ahB34p8YHiFL5HMCG+ADPv5VeDrLrgG2k90AZ/FXCmf1TLVfE6OtITa+9T65n3zV
 +ALvJ1IzKYMaEp60oIrcS7mLb4/5iKNeeQPm4hSCoOCTRsAnAl3kf1MGEHCGixeEekJe
 G7gEbrE/c1KXjR2PkFcCNMcSYmYGt7d7UNiO37SfrQOHw1KQvo35jTOtAashpA8Ro+JE
 Lj7d1p2PwaNdjAPo4LkYfejwPGRr6QeqUqN14R2OTM2sHXJuDwlYZvPcsKAzwHua3dkn
 LwFQ==
X-Gm-Message-State: AO0yUKV05l9EHLmuoW17ZF1xsWnYaAfT0M0C6unie6k3BYUKdMVLdO8m
 51kidAFIiTeTuP6kOFQxYhf6Gw==
X-Received: by 2002:a05:600c:c0d:b0:3dd:a4ad:ae45 with SMTP id
 fm13-20020a05600c0c0d00b003dda4adae45mr9636626wmb.12.1675436205411; 
 Fri, 03 Feb 2023 06:56:45 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a7bc851000000b003dc530186e1sm7952124wml.45.2023.02.03.06.56.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 06:56:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 13/15] hw/qdev: Remove DEFINE_PROP_DMAADDR() and
 'hw/qdev-dma.h'
Date: Fri,  3 Feb 2023 15:55:34 +0100
Message-Id: <20230203145536.17585-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203145536.17585-1-philmd@linaro.org>
References: <20230203145536.17585-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NYz4GEx9r42p

DEFINE_PROP_DMAADDR() is only used once. Since it doesn't
add much value, simply remove it, along with the header
defining it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/hcd-ohci-pci.c |  1 -
 hw/usb/hcd-ohci.c     |  3 +--
 include/hw/qdev-dma.h | 16 ----------------
 3 files changed, 1 insertion(+), 19 deletions(-)
 delete mode 100644 include/hw/qdev-dma.h

diff --git a/hw/usb/hcd-ohci-pci.c b/hw/usb/hcd-ohci-pci.c
index 6b630d35a7..92cc151264 100644
--- a/hw/usb/hcd-ohci-pci.c
+++ b/hw/usb/hcd-ohci-pci.c
@@ -25,7 +25,6 @@
 #include "migration/vmstate.h"
 #include "hw/pci/pci_device.h"
 #include "hw/sysbus.h"
-#include "hw/qdev-dma.h"
 #include "hw/qdev-properties.h"
 #include "trace.h"
 #include "hcd-ohci.h"
diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 9d68036d23..26c377bf1b 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -33,7 +33,6 @@
 #include "hw/usb.h"
 #include "migration/vmstate.h"
 #include "hw/sysbus.h"
-#include "hw/qdev-dma.h"
 #include "hw/qdev-properties.h"
 #include "trace.h"
 #include "hcd-ohci.h"
@@ -2008,7 +2007,7 @@ static Property ohci_sysbus_properties[] = {
     DEFINE_PROP_STRING("masterbus", OHCISysBusState, masterbus),
     DEFINE_PROP_UINT32("num-ports", OHCISysBusState, num_ports, 3),
     DEFINE_PROP_UINT32("firstport", OHCISysBusState, firstport, 0),
-    DEFINE_PROP_DMAADDR("dma-offset", OHCISysBusState, dma_offset, 0),
+    DEFINE_PROP_UINT64("dma-offset", OHCISysBusState, dma_offset, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/qdev-dma.h b/include/hw/qdev-dma.h
deleted file mode 100644
index b00391aa0c..0000000000
--- a/include/hw/qdev-dma.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/*
- * Support for dma_addr_t typed properties
- *
- * Copyright (C) 2012 David Gibson, IBM Corporation.
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef HW_QDEV_DMA_H
-#define HW_QDEV_DMA_H
-
-#define DEFINE_PROP_DMAADDR(_n, _s, _f, _d)                               \
-    DEFINE_PROP_UINT64(_n, _s, _f, _d)
-
-#endif
-- 
2.38.1

