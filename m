Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3363492lft;
        Tue, 28 Jun 2022 09:55:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1spJtFZ07G8Zn+KdPWROkehJz9gizzgiUiYuhtWU5ostQjvT5QINBZZcS+ra7Y6MS4V74lu
X-Received: by 2002:ad4:4ea6:0:b0:470:390b:c1e0 with SMTP id ed6-20020ad44ea6000000b00470390bc1e0mr3245058qvb.97.1656435339023;
        Tue, 28 Jun 2022 09:55:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656435339; cv=none;
        d=google.com; s=arc-20160816;
        b=cl4ygxaN3jn26bIa3vaWvpEnf3+2lhDcSI5D1Og8KN++nA1KiIG6JdTNI0HfssaSiA
         eUn+FqucX55OUBEJMRce8NHefRGpos4Z5//HnU7Gdocf2Pxf/95pihEgibOf7jEDVSUG
         ndIk/BAuSn8zBqQhU0mK114CtoK1yJ6nkKAhueZuVFqmPFxef5ZVgSLzJsFHXTzY6LNm
         WU+uiJa1rKOAId5WlIeO6VWbZM9Z1x9zdFCDa3TdDxfkYJ7iS/hxuKr012xRWFDGK4o5
         Sd4TunSxxNcBU73TArhTJj744yKhM96IJmfWrx3XfqqMlkKe9/mn/hodn0gL4t1XTlOp
         Qltg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=xpLAIAVdpQlijYSN3UH5skyVzduKOc3ZofIKe9WzLxs=;
        b=p2aapQt2HOcaKNxYVZ4+h4PfkshVpwaSInQCpDIXV+vH/nt0ntqCQajZmitY1wZ4e+
         t65VzUv6PsVn0YM05M+dDDMNvjCM9mIwijX1tgqAHQwzn+GnmCAeNU5p/+qjoyCFZOTs
         MUAkr6vjPEW9q4M0C2c/HrhpXBGEmIu7TOnF7i5uNrMNwx3B0oCnNSueOnJWq2QTg9qp
         fnFms3aYRBLUNgKMcRVsZU8j4x7TdpCsn6L0pWHUj7Z5UTg+OEWrssOPRkPu8MaBd9A6
         a6iS6rX3zh8Z/SekzeYVnminxtGEhrMQrD2bIYukluPaCgN+RRrXYjmDXFVGvftLvzPp
         0zQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d22-20020ac85ad6000000b00304b4fcf4a9si800586qtd.203.2022.06.28.09.55.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jun 2022 09:55:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6EV0-00060k-DE
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 12:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=xpXT=XD=kaod.org=clg@ozlabs.org>)
 id 1o6EUq-00060J-Kx; Tue, 28 Jun 2022 12:55:28 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:33341
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=xpXT=XD=kaod.org=clg@ozlabs.org>)
 id 1o6EUo-0004GW-JJ; Tue, 28 Jun 2022 12:55:28 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LXW1P3Yvgz4xYC;
 Wed, 29 Jun 2022 02:55:21 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LXW1L4WvLz4xR1;
 Wed, 29 Jun 2022 02:55:18 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] aspeed/smc: Fix potential overflow
Date: Tue, 28 Jun 2022 18:55:12 +0200
Message-Id: <20220628165512.1133590-1-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=xpXT=XD=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B6gHGB64sgoW

Coverity warns that "ssi_transfer(s->spi, 0U) << 8 * i" might overflow
because the expression is evaluated using 32-bit arithmetic and then
used in a context expecting a uint64_t.

Fixes: Coverity CID 1487244
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index d2b1dde604e3..26640539ae64 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -490,7 +490,7 @@ static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
     switch (aspeed_smc_flash_mode(fl)) {
     case CTRL_USERMODE:
         for (i = 0; i < size; i++) {
-            ret |= ssi_transfer(s->spi, 0x0) << (8 * i);
+            ret |= (uint64_t) ssi_transfer(s->spi, 0x0) << (8 * i);
         }
         break;
     case CTRL_READMODE:
@@ -499,7 +499,7 @@ static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
         aspeed_smc_flash_setup(fl, addr);
 
         for (i = 0; i < size; i++) {
-            ret |= ssi_transfer(s->spi, 0x0) << (8 * i);
+            ret |= (uint64_t) ssi_transfer(s->spi, 0x0) << (8 * i);
         }
 
         aspeed_smc_flash_unselect(fl);
-- 
2.35.3

