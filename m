Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2151306lfo;
        Sat, 30 Jan 2021 10:42:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcOaKbdDWA26YhV83NyaGrn8nREKDRbCO2Q3zu3pTWETxLnideFi7GzbCATze0WXi3l9Nd
X-Received: by 2002:a05:6902:1025:: with SMTP id x5mr13999240ybt.96.1612032174045;
        Sat, 30 Jan 2021 10:42:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612032174; cv=none;
        d=google.com; s=arc-20160816;
        b=xVbfkn3htl7Vq7yONUuo0qHe80hyXvVaFgWI4Y9ukoDhUHjbpmABpJE3axd5M16NpG
         V1ZoNOIkJgZsjjs7Dx/RroMkZBfO+A6pXW0LyfsPUJIOBX08aPRBo1Sx/T0qFpFAe2gC
         3pnLgvxjONSXl1FqOCyd59kmhBI2E7TY+znybkyn1FsMRAONN0Pj9E/Er6LAEYAO5xxO
         sOJh3+EvD7eyMrAk6VPUxllxg1zKNRdvqyHRa+aSL7Sbe1kvo6vM8e+Cy61LbKP69a91
         e3HAPvzgVarh+9j+aOjRgUkV/xrQWhsB8vUXbvT1wwRMjrJXigkiVd1ir1ZZ0A5iScir
         4Eww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=7xN3NWujt0MZ4nsv093+6CZQ4eRij5kiYXwtNg1RWPc=;
        b=tOt8r/zcjBDZgRQdVBjf/5ZImV4G71WbLCt1phjKe/qRjnaqJj8UxpTmdhaF/xAmsR
         To0U+bPQG6NFxRO9E7mltyW3BWxkkgSc2CIELEyrFBxHvmuUOsNXdxnjiaFrkfqWTJPx
         ND/2TQUPqPokcUh50f3Hgvo9llqv3Z8VX2QyVpk8HyqdJ5svaTr1x+Tc3T2I0iyI3TB8
         AKHFGGYQbAIckJgbxBBsZwORwmwEYjE2gFpbJaBsd+GbJ+l4NlTvhDrgBN5t13G5K5Vr
         FswdFVx/okIC372lgc2/MzmamSXhhrdS5iU2YfbeMqlCR0tpKn/22OG8LBn6jb844WKO
         a+QQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@modwiz-com.20150623.gappssmtp.com header.s=20150623 header.b=PdIoDgAQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18si12456269ybq.172.2021.01.30.10.42.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Jan 2021 10:42:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@modwiz-com.20150623.gappssmtp.com header.s=20150623 header.b=PdIoDgAQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5vCt-00011x-OI
	for alex.bennee@linaro.org; Sat, 30 Jan 2021 13:42:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iris@modwiz.com>) id 1l5vCk-00011e-GU
 for qemu-arm@nongnu.org; Sat, 30 Jan 2021 13:42:42 -0500
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:40310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <iris@modwiz.com>) id 1l5vCg-0006WC-Sj
 for qemu-arm@nongnu.org; Sat, 30 Jan 2021 13:42:42 -0500
Received: by mail-io1-xd2c.google.com with SMTP id n2so12995242iom.7
 for <qemu-arm@nongnu.org>; Sat, 30 Jan 2021 10:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=modwiz-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7xN3NWujt0MZ4nsv093+6CZQ4eRij5kiYXwtNg1RWPc=;
 b=PdIoDgAQ4rA9KCjUsfE2HvoJ9FJv9RY2tPeFVbHmrrMr74SihQhLuOq8TxWCNRidAD
 zhu+nPVScrV4mM+U+uARN5A6cTAQxXwMcq1SONj70pVGwk6yg2hX/HBWGXGtX1m5dnHo
 PkCwIn/8DYEZflLO5FPgLBdN2UUU+TQ/ydvhJ+sMauskJE6qLaMhedKGmGPnxPpdfCf8
 mYsClvyvH9NdiDtDfcF1ZJLuvRYBYrJB/nz93L7o7pPRR4xgd9IFVavGmfjizQUXVDMm
 HdDuTdg/8M1ruNJtUXstxNJX+JpNqtRJslCnjImizdgJZCWz9lH2Yfz3dKbkA/mh5zj0
 evnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7xN3NWujt0MZ4nsv093+6CZQ4eRij5kiYXwtNg1RWPc=;
 b=CiNp8QC/siYL0jyhgqdETWzZuwUrAaBXrRQIAEEbyoNE91bMasB8DXgr3EJMZyYrYg
 epSMKoba2ImmT4pR6qY0xFa2aIvdtSXqFHc/8ZsvUr1uC9T3K1h8lHHAZOhmEODbGAnj
 3+gvWtjAXgXazPmZnVsqy0W8PoENiDyXNkRQxazcJIC35zKTzdVap277OjBNrR6tY87Z
 sKRMTY2CAxlq8EtfoJWP9yVYNJdNrskR7PHpGHf0Ubtv5wryIZHOKE5e3gB4mQj+lOvZ
 Jyrqw1zoYAobNLQ7S6fcLR/UuBNEiSKVVnyyygXUOXATFPkwaMLtu5q0FskKUanpuKSr
 Zphg==
X-Gm-Message-State: AOAM53135uRT2TG5CF9z6boWa7oDGLNkd4vUbTg9DeB3yVJfg0ckj36W
 u58fF/7uSDh8lrjhurCPIrMjcQ==
X-Received: by 2002:a05:6638:138e:: with SMTP id
 w14mr8281564jad.98.1612032153675; 
 Sat, 30 Jan 2021 10:42:33 -0800 (PST)
Received: from localhost.localdomain (c-98-223-182-45.hsd1.il.comcast.net.
 [98.223.182.45])
 by smtp.gmail.com with ESMTPSA id n193sm5662253iod.21.2021.01.30.10.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 10:42:33 -0800 (PST)
From: Iris Johnson <iris@modwiz.com>
To: 
Subject: [PATCH] hw/char/exynos4210_uart: Fix missing call to report ready for
 input
Date: Sat, 30 Jan 2021 18:40:17 +0000
Message-Id: <20210130184016.1787097-1-iris@modwiz.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=iris@modwiz.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Iris Johnson <iris@modwiz.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:Exynos" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +gtzc6Ss9QW1

When the frontend device has no space for a read the fd is removed
from polling to allow time for the guest to read and clear the buffer.
Without the call to qemu_chr_fe_accept_input(), the poll will not be
broken out of when the guest has cleared the buffer causing significant
IO delays that get worse with smaller buffers.

Buglink: https://bugs.launchpad.net/qemu/+bug/1913341
Signed-off-by: Iris Johnson <iris@modwiz.com>
---
 hw/char/exynos4210_uart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index 6361df2ad3..51ba862d0b 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -519,6 +519,7 @@ static uint64_t exynos4210_uart_read(void *opaque, hwaddr offset,
             s->reg[I_(UTRSTAT)] &= ~UTRSTAT_Rx_BUFFER_DATA_READY;
             res = s->reg[I_(URXH)];
         }
+        qemu_chr_fe_accept_input(&s->chr);
         exynos4210_uart_update_dmabusy(s);
         trace_exynos_uart_read(s->channel, offset,
                                exynos4210_uart_regname(offset), res);
-- 
2.25.1

