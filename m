Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1298530ejb;
        Fri, 3 Feb 2023 03:39:01 -0800 (PST)
X-Google-Smtp-Source: AK7set8vxGLqS0w9yoG/x6UXM8nxWH+9fwsi9jMUkXms25Cvb9hUY+dFI09LZVoIKPU9bRBFjYFy
X-Received: by 2002:a05:6214:5092:b0:56a:8d2a:8ef9 with SMTP id kk18-20020a056214509200b0056a8d2a8ef9mr596324qvb.35.1675424341412;
        Fri, 03 Feb 2023 03:39:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675424341; cv=none;
        d=google.com; s=arc-20160816;
        b=JKigx50IocMJgPMzRHmfBtExuhQvAnI04M3KRW0qxg1XrGImfhQ/QmDFgKFM74ZJwc
         TdYEAR4T9IguO3kofZUKDpvUc0N4ktspqr63syQiHcNf5yZe8zfH2rx6Xe3yEnM6nIZD
         S9+jjbLY1SbyFVxoAQVYaRWX0AT5S/BfW7QhL9WL+2RLxnkRRoDP41/bBi1wr+AGrLKp
         8MAU2nRvhhKvJgckMsHjrx2gLx4DQVvhojPzmCwbfuvbx+KPQIGGAxgLdU4E5KY3okfE
         sWbY7O0l19DCBk4WsJs9xtzUrCszxAk6B6GR0EGoFUcTz8KZYFi4QzQf+IT824x/T6FL
         F1QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=A0e0NEin6/qB1UWKlWtZ3V9I0KbRtGgK0QPchGtumd0=;
        b=AVoJu61PelmfXRhnm2jsKciIJXUKLy8q1AvH3q1X4ayxQM+uvV11lGVEkbRMWl8qyn
         DiD3nceKkPOSE0cKeS2d/ATfa7Jk6cqDEez3FQXZqMHW7STq6pXTsAsq3SeH0wL0LMyk
         n3JWk5ioH1hVXfaxz0Has6uivo3kTWKAZP4+Db9V7q2M4ODzfd/S8u89jM2Fjt4yzzUm
         BYoYOSyXcYoXJKOXpy/ejvKCgFav/A/F53JpPfEEisMyBwvAeZQKViFD5mRVTga07aSM
         NgUTUFurMV1VuAVu5iUSFn3llPLWL0Y/QCSK003G5oPQabYXPNE+g9fnXwvYk3UDldK7
         +u9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DMrWgame;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y6-20020a37af06000000b00708fd79facfsi1650725qke.733.2023.02.03.03.39.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 03:39:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DMrWgame;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNuNn-0008Eq-DW; Fri, 03 Feb 2023 06:37:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNuNm-0008EC-27
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 06:37:30 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNuNk-0001HA-Fi
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 06:37:29 -0500
Received: by mail-wr1-x429.google.com with SMTP id bt17so1344211wrb.8
 for <qemu-arm@nongnu.org>; Fri, 03 Feb 2023 03:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A0e0NEin6/qB1UWKlWtZ3V9I0KbRtGgK0QPchGtumd0=;
 b=DMrWgameUQbjcd64+jNpjO/Qc9YTZNVQ3swQhJPAqBtUV/EmghCwdKjgTj5CEKwj4y
 fRyHuxc7qWci9UnH0yaHbzbtaMWV1iMxTikpF0EmFGbb0bOgHS6VH4pk78Fp7CX+TxzQ
 HBNXOo8l7OivuOBEfps/QVSKdI5YnJWQcW3r+4El74ckF3cDG35H9R6/iDjvDMS+8QlE
 jqpxMpgGpr12J1TufqCTxhlPT8jhMH93Sa+mL76OuBCiJ4jqkaQeIcSqA6qd/uvEtbj6
 c8v3J4AOIoTuDvneYP78cFFycmOtIj7/ApTV/HoEmxPmRa6zJeR7aMWT/5/JNvjamfoz
 P53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A0e0NEin6/qB1UWKlWtZ3V9I0KbRtGgK0QPchGtumd0=;
 b=dWiMFiiea0mKXXLLxiOMCiuORwpAS7NG6Xai/lTeZ/5ReWoVXdyH11hHHgvNLicieC
 MCsIJiWKhvUQu/5e0S+QyNMOEDtQ+mqcTqHDvLsZ61KpC+xcH3IzPd/aOT7PPconj9NP
 ngZdsJfVo66FJQmRY4DNhVGk8qlspdDTC8ekSVqm/MYZd+SUnU58joTXR2Cndb0Nea/G
 HmWEVdk/S+ZIvWPpx3tRWRD960F5ndQsgQAz2rXcnUfs+bfc6XG5MDzyXR0jv40Ngd0I
 5pWIs7IpguJW/6U2SdLvsmvM9iKDy9x0lyuBBCDQunSELJ4YUiGtbBnyY3M/OCcUO8lc
 soMQ==
X-Gm-Message-State: AO0yUKUJpZnZ2J0JDMkRpAssGO5/lSJbYosSyKs02kZ1wMskdSIWQCq6
 dFi4+8KTyBLS0AApg0xkF25lQg==
X-Received: by 2002:adf:f68f:0:b0:2bf:ae17:bf58 with SMTP id
 v15-20020adff68f000000b002bfae17bf58mr9143116wrp.37.1675424247207; 
 Fri, 03 Feb 2023 03:37:27 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 s7-20020adfeb07000000b002bff1de8d4bsm1791560wrn.49.2023.02.03.03.37.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 03:37:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 7/9] hw/qdev: Remove DEFINE_PROP_DMAADDR() and 'hw/qdev-dma.h'
Date: Fri,  3 Feb 2023 12:36:48 +0100
Message-Id: <20230203113650.78146-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203113650.78146-1-philmd@linaro.org>
References: <20230203113650.78146-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
X-TUID: BWzXAztln2K2

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

