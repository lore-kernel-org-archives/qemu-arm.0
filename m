Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp295891ejc;
        Thu, 19 Jan 2023 04:35:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv7lSOodM7xA4NvvrZPoevBU3xXI2IjbmBcAkoHBRjiIHP4pdqeyViUfL4nuhhjfjX1nAht
X-Received: by 2002:a05:6102:3c9b:b0:3c4:607f:6025 with SMTP id c27-20020a0561023c9b00b003c4607f6025mr7683948vsv.3.1674131732312;
        Thu, 19 Jan 2023 04:35:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674131732; cv=none;
        d=google.com; s=arc-20160816;
        b=FKfaAsQ1bkwkYIsk7EK1Wtx3sDg7scctq4wFysK1rIV97cdfyNH220GvLGWgtqi0vu
         aWiCtwv3I9Tji8fxqo9sMoxPUns1SlVe0pPbTBRfPWXhcmSLKR7OGYzGdfgNjdEd3ndS
         sepzfg9BQ2TNJTd9FmOIUeajUcPR2ZegID7KqqyxVvJZ8cbXpB1W4ydvgn3TSVe6RxTd
         LsyfiPJ0VJ1Mrxsd0a2JzJ2GLe4w3CcBNR0KQV43FBo7BdYIuoYd9gy/VF5gc73NfGIM
         idXr2FgIgfPdtrvQgIKoooVvV67mXT1lJuAjLSCOQQPF9AM6sIj5LTReLStRoHguCP80
         wKQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=TuSzFZmADtryUVMBoBB11XlyRFo4AspHNjXbWNw6IUg=;
        b=Wv25jIq+gP+9Pv/jPfpiWzW6NAb9F8uHCcb9xWR/U2tV4D+DGkz8zyBR3PBipTedJ5
         81+F0AW7WD1eOmsRmDJse1LNMvusojiy+teQrlCR/iWPvSaQ/f1+WBAg1xHbGc4OFlO0
         +csi4GLQUmFiO5tGR27gEp7wBHAcb3AgMe4T8F7RlAQMinH125lRRKTkWHOhJtebUS9t
         NmYhPYT7RWam7h71VGnakHCkKvfOi6ZHhfHcFlBCdM1/Ns89ucmdwIFGRVb0DogWfu1x
         /8Z/rt4B6xOusvdiZFUBSVkKhHjLIANuJg6YtiVtvb+HZQzEA7769cPgSidY0OLgk5qU
         AmQg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w26-20020a05620a0e9a00b00706a55e90e3si4452560qkm.689.2023.01.19.04.35.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 04:35:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIU8W-0006JM-WB; Thu, 19 Jan 2023 07:35:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU8U-0006Hs-B6; Thu, 19 Jan 2023 07:35:18 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU8R-0007TU-TO; Thu, 19 Jan 2023 07:35:17 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4NyMXW1Sbbz4xN1;
 Thu, 19 Jan 2023 23:35:07 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NyMXS1gkqz4x1D;
 Thu, 19 Jan 2023 23:35:03 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <peter@pjd.dev>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 01/25] m25p80: Improve error when the backend file size does
 not match the device
Date: Thu, 19 Jan 2023 13:34:25 +0100
Message-Id: <20230119123449.531826-2-clg@kaod.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119123449.531826-1-clg@kaod.org>
References: <20230119123449.531826-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
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
X-TUID: 53fiohtrQNxf

Currently, when a block backend is attached to a m25p80 device and the
associated file size does not match the flash model, QEMU complains
with the error message "failed to read the initial flash content".
This is confusing for the user.

Use blk_check_size_and_read_all() instead of blk_pread() to improve
the reported error.

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
index 02adc87527..68a757abf3 100644
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
@@ -1614,8 +1615,7 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
         trace_m25p80_binding(s);
         s->storage = blk_blockalign(s->blk, s->size);
 
-        if (blk_pread(s->blk, 0, s->size, s->storage, 0) < 0) {
-            error_setg(errp, "failed to read the initial flash content");
+        if (!blk_check_size_and_read_all(s->blk, s->storage, s->size, errp)) {
             return;
         }
     } else {
-- 
2.39.0

