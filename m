Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6105865ejc;
        Tue, 7 Mar 2023 07:57:00 -0800 (PST)
X-Google-Smtp-Source: AK7set++H54ko3Bmz6el4BgshCu8jIZqv2OP9soRzBWVTymwIPsY/fBnwRrpvejq3GXYQH8RA17x
X-Received: by 2002:a05:622a:306:b0:3b8:6ae9:b100 with SMTP id q6-20020a05622a030600b003b86ae9b100mr26594454qtw.7.1678204620680;
        Tue, 07 Mar 2023 07:57:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678204620; cv=none;
        d=google.com; s=arc-20160816;
        b=oMZD94R/cPPS35mm/ruuKCaLfcJAkhuDPIouqFtmD4cZj8CDTFxP9tLH+hYBKv47Bq
         da3gI7BmX0ErDo/7r2dLt5MiHc3cMjVwKwqffbAMaDxBWAUyH1XUT0cx/Hlcv6+JSFqx
         5jFzHufZ29An7IsGDe72FhZo2Jie7c7a4ncVPHKqLgbcxoUUWwnTuLADZxX81n18rRuv
         17JxsDas+m2ySJhJLJSHbnGm2EdZlNQ7vKJp2/1kd0iFh9ynSaaml0PrEZgZcCO/dzAf
         DJRXF7ehQlq5ulDPNMDOlsaDuVgglve4arZgID9r+0pKJKUjPXg/FfGHsdh22mOsYCsJ
         EXkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=JljY6wTDrrTS2PeRoo4qs6U095kEDbiv45KbPEFgkwA=;
        b=L7aODjFPSCRDLDk8PO/kyf0NorEn+krWmlPwurVc0/FtuW7wp1DTuqXMl7BlKvS2ny
         hJRqEM6QjK5gtIaU7yCohSatRkPtE+qZur1lIRJn6xxXwjbf9WZeEbNiDX5IPEo16mgl
         prkdldjUbUa4inMjpeNPyQoZKBnkKiW+ofYRvxj8dYk2pSoTWpqMIr7knEtUtG+HDj2W
         GrXPv6I05AnSAkD2mivSxYP6ZOPN1+c3h0SRuGccjipMNkFGDEYBCAUr82sGyYVjs7/e
         fkL9G5WlYFR6CbIUJNJqcNGJqvYFctec3BUzOfzwZGFqPPURe64U4zgKBw86bNMIZ2AD
         iYRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12-20020a05622a110c00b003bfc28e414fsi10112826qty.687.2023.03.07.07.57.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Mar 2023 07:57:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZZfY-0006MF-P9; Tue, 07 Mar 2023 10:56:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=rbq/=67=kaod.org=clg@ozlabs.org>)
 id 1pZZfS-0006IV-A6; Tue, 07 Mar 2023 10:55:58 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=rbq/=67=kaod.org=clg@ozlabs.org>)
 id 1pZZfP-0000R1-CO; Tue, 07 Mar 2023 10:55:58 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PWKmB2l4qz4xDj;
 Wed,  8 Mar 2023 02:55:38 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PWKm732qrz4xDh;
 Wed,  8 Mar 2023 02:55:35 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Delevoryas <peter@pjd.dev>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 1/5] m25p80: Improve error when the backend file size does not
 match the device
Date: Tue,  7 Mar 2023 16:55:24 +0100
Message-Id: <20230307155528.3655534-2-clg@kaod.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307155528.3655534-1-clg@kaod.org>
References: <20230307155528.3655534-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=rbq/=67=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: au1H7FAsTDTb

Currently, when a block backend is attached to a m25p80 device and the
associated file size does not match the flash model, QEMU complains
with the error message "failed to read the initial flash content".
This is confusing for the user.

Instead, use helper blk_check_size_and_read_all() introduced by commit
06f1521795 ("pflash: Require backend size to match device, improve
errors").

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221115151000.2080833-1-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 802d2eb021..dc5ffbc4ff 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -24,6 +24,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "sysemu/block-backend.h"
+#include "hw/block/block.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "hw/ssi/ssi.h"
@@ -1615,8 +1616,7 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
         trace_m25p80_binding(s);
         s->storage = blk_blockalign(s->blk, s->size);
 
-        if (blk_pread(s->blk, 0, s->size, s->storage, 0) < 0) {
-            error_setg(errp, "failed to read the initial flash content");
+        if (!blk_check_size_and_read_all(s->blk, s->storage, s->size, errp)) {
             return;
         }
     } else {
-- 
2.39.2

