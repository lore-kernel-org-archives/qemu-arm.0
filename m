Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2100850ejb;
        Mon, 20 Feb 2023 01:17:22 -0800 (PST)
X-Google-Smtp-Source: AK7set81EsKKax98kXc72BRj1J75ipwX9QlWUd8vrxM1u0whU5fLRzRKgNkgBurVFK/hggiCAnww
X-Received: by 2002:a05:622a:4ca:b0:3b8:2a6c:d1e4 with SMTP id q10-20020a05622a04ca00b003b82a6cd1e4mr271145qtx.23.1676884641907;
        Mon, 20 Feb 2023 01:17:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676884641; cv=none;
        d=google.com; s=arc-20160816;
        b=VAuZuxOsOL+Xo5mieLV534YJtn3eUbtj97dDPoD5hwqJ/E3ZPZLUMHhY3GMTdhQyJG
         1fkkSFVJaYvcXTrMABQYcEcvf0tA+8UCICSnlrj7GZE6mynhLP0es1ti2MlMPn2ie1HF
         4Zy0iUfjYRHa/m8G3IUuLmaED+4QRuUxX4cmM/H/ZVlWwq8STR/o5hrVaQowqVsiXko+
         M1KCJJbII/HD+76gOLBc6dlBtUfkUiSTNfVyD2di0vs9xDLUp4/00p/054Ou4RTicHm+
         ia2pW9KaZE/gb1mox3GlNKrhCF25DFqEhKa7mGsOaNt5oMPAGI7MuBm4MfrD/dN9Xb6e
         VtWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=l+kQmnueqHR1/7y+7KCNnDEw+Oe5smCTiQ+KK+3S1XU=;
        b=wP07CGlKwhdhML660nVAGgOcwDdOAhNWl77zFmPwTrWmvQv2+kLRtRHObCE4rwoKjK
         v71sEekgAJ3JWxyR85NOFbKh4pOFLji6xpvNX4pOuqmZuaXYMLFpbhzlfa7j8JO9aS/p
         1IGsjaJyKriukKp8eoRIbaUCDnBV44+xJykApT1Oh1iU+jutvB3oFEuZrx7FOf0tNj/A
         EqrPn2KrANX+kjvUz7YGwqQVIMVLp9daja4ny8yftNx/uUfEXl2aB45MfReNG7l7MsYq
         ePFJhBN/ane+GkcN889cYU2BEqV2n9/ewJ74x7ZmVZ1E9Xe99gK+xuVnUxYu2Q2OreI2
         lTzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wj2U1p9M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f31-20020a05622a1a1f00b003b9bad5160csi10054412qtb.291.2023.02.20.01.17.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 01:17:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wj2U1p9M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2HR-0008F8-Aq; Mon, 20 Feb 2023 04:16:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Gg-00071P-2K
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:15:34 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Gd-0003kI-CN
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:15:29 -0500
Received: by mail-wr1-x434.google.com with SMTP id c12so338853wrw.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l+kQmnueqHR1/7y+7KCNnDEw+Oe5smCTiQ+KK+3S1XU=;
 b=wj2U1p9MxWJrb5KdACVC1CO7lBVcGMa/jKfn4/kdF4CVhh2IgYRbk+IqQL9KQuxJ4R
 liYRI9rU4um1J38EVAeI+a6CAsVww73tuD6rY/qzigXqTFHUpL9XEPprikbm0gHT/jvf
 6wjMWVC4t+7l7yE1LpMkbBz5o3aVcwK95XsYp3zAQ914d5Ugh6739RX8fFITV3Iluzq4
 nCz5Wi46gqluryzoiQeX1ff7X/OpNsAmboAtCFU9JLOyZpNB+WHOng9S5FsqFoG0i6ME
 ZMa3oXQi7p5YLKIgSiM3JwuPErwRXZ4jr38J+dFwPH1jFET9STHj+KP/+u65uKReLcA4
 7wkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l+kQmnueqHR1/7y+7KCNnDEw+Oe5smCTiQ+KK+3S1XU=;
 b=TCFbC03/vwXlKjPLgyJIeHORr9BfIMjbI5TmDqBBxc6ieqc79G1CIEcvthaRRAOEQH
 2YmU3RpBpBLPnAa/CJRWuQ8eXx7Br3GK96z0JgaOTfz+PDF8B+5OFYzjeCgdlH6nFwd4
 LGX+DtFY5P96On6I+oIh2qHzAwhFObaQeE7LMjE1OB5uoR5hUfhDC8TifYctNjpclSvO
 BKtTq8Vm2rvUrL/4YtBgiOAGDxIZQboufe7vByGHf5w1xjD9AMqnaD5MvF+c6eCk4OTJ
 dklJoVlTcFs1ORomL+y28ErxPJth5JrhXSbsiOiDt6Hgkwej9/PXhd9XNfyMKDNZ6qko
 8BZg==
X-Gm-Message-State: AO0yUKXs7ZAKEnFs1ZXuON91XoAxZ7wxqP1kTg/cT2qyknmz60SYMXgy
 9KofFSVs3NXJjEb+q/yC5RITu4wyDdMuuUal
X-Received: by 2002:adf:e255:0:b0:2c5:52ef:61c5 with SMTP id
 bl21-20020adfe255000000b002c552ef61c5mr136594wrb.41.1676884526496; 
 Mon, 20 Feb 2023 01:15:26 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a05600c4f4600b003df245cd853sm1048184wmq.44.2023.02.20.01.15.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:15:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 17/24] hw/ide: Declare ide_get_[geometry/bios_chs_trans] in
 'hw/ide/internal.h'
Date: Mon, 20 Feb 2023 10:13:51 +0100
Message-Id: <20230220091358.17038-18-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: jUn/WBf+s8lp

ide_get_geometry() and ide_get_bios_chs_trans() are only
used by the TYPE_PC_MACHINE.
"hw/ide.h" is a mixed bag of lost IDE declarations. In order
to remove this (almost) pointless header soon, move these
declarations to "hw/ide/internal.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc.c              | 3 ++-
 include/hw/ide.h          | 4 ----
 include/hw/ide/internal.h | 4 ++++
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 6e592bd969..79297a6ecd 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -34,7 +34,8 @@
 #include "hw/i386/vmport.h"
 #include "sysemu/cpus.h"
 #include "hw/block/fdc.h"
-#include "hw/ide.h"
+#include "hw/ide/internal.h"
+#include "hw/ide/isa.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/pci-bridge/pci_expander_bridge.h"
diff --git a/include/hw/ide.h b/include/hw/ide.h
index 24a7aa2925..db963bdb77 100644
--- a/include/hw/ide.h
+++ b/include/hw/ide.h
@@ -3,10 +3,6 @@
 
 #include "exec/memory.h"
 
-int ide_get_geometry(BusState *bus, int unit,
-                     int16_t *cyls, int8_t *heads, int8_t *secs);
-int ide_get_bios_chs_trans(BusState *bus, int unit);
-
 /* ide/core.c */
 void ide_drive_get(DriveInfo **hd, int max_bus);
 
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index c2b794150f..d9f1f77dd5 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -647,6 +647,10 @@ void ide_bus_init(IDEBus *idebus, size_t idebus_size, DeviceState *dev,
                   int bus_id, int max_units);
 IDEDevice *ide_bus_create_drive(IDEBus *bus, int unit, DriveInfo *drive);
 
+int ide_get_geometry(BusState *bus, int unit,
+                     int16_t *cyls, int8_t *heads, int8_t *secs);
+int ide_get_bios_chs_trans(BusState *bus, int unit);
+
 int ide_handle_rw_error(IDEState *s, int error, int op);
 
 #endif /* HW_IDE_INTERNAL_H */
-- 
2.38.1

