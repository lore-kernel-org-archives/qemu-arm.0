Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3780057lfa;
        Mon, 19 Oct 2020 04:26:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHAFXdF8rq3MLN9zUhbSD5p4RxSX9A0VyMIYhewXzTpbufgo/mRaBsPMJ81Ohou3aoZ1bn
X-Received: by 2002:a25:1f84:: with SMTP id f126mr21302057ybf.192.1603106803172;
        Mon, 19 Oct 2020 04:26:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603106803; cv=none;
        d=google.com; s=arc-20160816;
        b=U4Oijj43PMQaeEpM4SwfiF93Q9OusQb0/KjDzNVDiXbDBFA+WTYKxn0yKtmz1IvE0a
         m34iI6stVtwP+Ravpjn67twvPLTkV/cwMp7lCmOJFr4qFj35tWpHkfj54ogMCDd6B+5y
         xZ4iZUvPjynedVoj91R7M+n5aE9hOheEMkg4NsWX47QYN6vOz37OOWtaoMLJhCpDyl7R
         cZglsGdL/uU31N8OdE+A7b3WyI78cZNmlWTme9cJ4jb7N8816h2Ycb+DrR6Z/smyAY5/
         9ED/BkjzE3ZW7vhFN5HLg6MOMhHTi9kYQKXMa1BtUHuQpUiaA+FOE0etvqrdd/C/uSox
         XU0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=OXeBoUdOo5NY6eTN5elXmFP20gkOzGyp6dljEkbwOz4=;
        b=dS6g+ZdUsPhBcI+YggG4bnw2Pbevh3Xu4w5MUruY3JFpIsd4Q0co8GTg/ywmkX2fuP
         +l04CE2h4Ns+TVaCjzUThgSHs3f7/H6a0Xzs1DeE2cFzlTUqnDt+mN4JgcGCW0WztKhh
         dmKx/qdG+6JUe0jGb3StxZ/6CZNd6cnCrZ+5f10QZebQr4wdIGlZOYsI9En4qWpcEzou
         QcHUDomu0a0A+SIs6YxetZnRQy22ZY3Qn0YZsvtBQ8XrkDaGdK4pgL1hj7vC5SL4tYWQ
         14HwO4Wftpe4wFvUEc6Nfeo6EmNSXVtDFb39K+oy292wo7qb5Ou+A1s9UBzDI5uoXuT9
         P7vA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rOm4sgLF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si12017588ybk.122.2020.10.19.04.26.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 04:26:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rOm4sgLF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUTJK-0007sX-Ik
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 07:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kUTJC-0007sE-Fx; Mon, 19 Oct 2020 07:26:34 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:37832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kUTJB-00066B-0o; Mon, 19 Oct 2020 07:26:34 -0400
Received: by mail-wr1-x442.google.com with SMTP id h7so11004192wre.4;
 Mon, 19 Oct 2020 04:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OXeBoUdOo5NY6eTN5elXmFP20gkOzGyp6dljEkbwOz4=;
 b=rOm4sgLFRXggPcf2uVYU+hOKGoG9BoYQ14AtneWNcEy+rvPhZDbnnVYQ8o9JnRFWpL
 Fbr0kySRQtez7lszCR7OlgpRAzcOrBSVt0VyZiBVHs8r5++eO7tMNk1z5GlqrUVa4Bgj
 e/b3+dvsbWAISESMXrH6IZZQl/xoEJLPxRdUmb38M+IDEfN75fIejc8YxcpU5EO2w0+f
 wckNpXT0yIgbpHbzY3+/bqjTRr+y0I2L79hI0AOiX/B1CQQsp/ms5YBhl4MPg2Gq0Pjm
 J+RewzURFVSmzIetiYYnhUEYnaLGLu8r5k69jW6u4qJrVulLn6QQCj74nAeVYDjryN/f
 IFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=OXeBoUdOo5NY6eTN5elXmFP20gkOzGyp6dljEkbwOz4=;
 b=TFznO2IpO73VM4FJTBu/pnRj5Bt4dKrC1kn3Mxa9O6YwxDeaq7HKUpwhbF1LzdQlcw
 R/0uut/8RkSR+yyREMxIEECzsCs60YHtPnO0DePGc8rieIfPR8Qf+x1HPkMWKfB+efoZ
 rxtrmUL0mL0sDx9DktOf9LYy/6UpTlE3quKqSOHeXf4rAMd4m04+jmw9LhBhvtMJkNvA
 lrgH6LjXTsgLSnS7L02ahEWXrgGClAwGn+ospmNxrRFF0MTOwaRiECS93wgdeAIKRapX
 W0NuITxLU2xUdCSdq5hiV/ORZHRdp0LWVHu4rbFRQo3q0aeRU3a2jIydNqfvjdlxwT1X
 gAyA==
X-Gm-Message-State: AOAM531v6Lj36K9He14uUGTu1nkt1cdFI+JLMyh6OsIEnhxm3CWa0QDH
 J6GS1SRKte9lai69kxXu+m2mGbAKo8w=
X-Received: by 2002:adf:e891:: with SMTP id d17mr12813765wrm.218.1603106790729; 
 Mon, 19 Oct 2020 04:26:30 -0700 (PDT)
Received: from x1w.redhat.com (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id x1sm17249422wrl.41.2020.10.19.04.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 04:26:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/misc/bcm2835_cprman: Make cprman_internals an included
 source file
Date: Mon, 19 Oct 2020 13:26:28 +0200
Message-Id: <20201019112628.1653550-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FF1XdQjcI+um

bcm2835_cprman_internals.h is only include by bcm2835_cprman.c
and contains various static array definitions. Make it an
included source file (using the .c.inc extension).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
I'm sending this on top of:
[PATCH v3 00/15] raspi: add the bcm2835 cprman clock manager
to avoid a respin before soft freeze.

This patch can be queued or squashed on top of patch #08/15:
"bcm2835_cprman: add a PLL channel skeleton implementation"

Based-on: <20201010135759.437903-1-luc@lmichel.fr>
---
 hw/misc/bcm2835_cprman.c                                        | 2 +-
 .../misc/bcm2835_cprman_internals.c.inc                         | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename include/hw/misc/bcm2835_cprman_internals.h => hw/misc/bcm2835_cprman_internals.c.inc (100%)

diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
index 7e415a017c9..9d4c0ee6c73 100644
--- a/hw/misc/bcm2835_cprman.c
+++ b/hw/misc/bcm2835_cprman.c
@@ -48,7 +48,7 @@
 #include "migration/vmstate.h"
 #include "hw/qdev-properties.h"
 #include "hw/misc/bcm2835_cprman.h"
-#include "hw/misc/bcm2835_cprman_internals.h"
+#include "bcm2835_cprman_internals.c.inc"
 #include "trace.h"
 
 /* PLL */
diff --git a/include/hw/misc/bcm2835_cprman_internals.h b/hw/misc/bcm2835_cprman_internals.c.inc
similarity index 100%
rename from include/hw/misc/bcm2835_cprman_internals.h
rename to hw/misc/bcm2835_cprman_internals.c.inc
-- 
2.26.2

