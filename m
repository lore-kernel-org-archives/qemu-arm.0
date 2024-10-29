Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp106478njj;
        Tue, 29 Oct 2024 02:18:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV6yFG0B0YIEGYJjpQHb4Xl8KQpFVutMI/S+1k4CNBzqnZq8GG0RZMl3vRWu5CoggP9akxmOSoA3g7ySw==@linaro.org
X-Google-Smtp-Source: AGHT+IHTEwNKNwR/EEMPj4D1chdpLifLHL5/kbPXCqABoCJCSP4R6G1w0TfxihRCvvPcf+dnw3Pj
X-Received: by 2002:ac8:59c1:0:b0:460:78ad:16af with SMTP id d75a77b69052e-4613bffba5emr185369181cf.21.1730193513701;
        Tue, 29 Oct 2024 02:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730193513; cv=none;
        d=google.com; s=arc-20240605;
        b=SrlAA9HNA9hMoG9MOorcgmC894+FdlerjkOGGUiOJBOzNX4NTYuSQbk1RYl4pwGqbL
         ewMXRCNJ2mRZNCMGUAlJyx5KJbAhvEppExPxm8L1IqDe6S8BH5WvTw7plZ7riufppvz1
         sNyeUd5R356s8Fk/Xo2m7Hh2E65fa/yQ33fugvsRA0Z8LtbElCpdIcdZRanoOQbedjlJ
         cSsTdshmUDTvOOFsvUVTUKwHCozE8axoHzxf1gI2EykH/fu0vdw9hJto7sx0Nm4pZDlI
         lhLzYaRvNDB6C+K2gZuQXMCloI0IHYVpf4ri809kBUOP/ELLr0vhTd7m3nrrm1f3h/L9
         ygog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=I6b8ZfEbINB6Js0mAvDW78IC2X6VREHK+mCncE394Cc=;
        fh=4rHsaFhVkVMXk5u1IVZO4usPBujjRbqK1KMv0eZ+6CI=;
        b=iZgqLcWUQ0+rGMAE5ARncG5rmrY2OQ2LobZ4dCyTA/aBtYCBOEuxCN/Hi15B4BMXVk
         oKsHbX8AxN6mGqdA+MYRPt2qPAEbX4OQ9InAN8EHc8PA7SqyC1XymTes8WEkIhtO5JC7
         fK6fUCGiEi53tyt/3U2JOfpxiGhY0X+UDUqlV72wQjYdJMTtjc/Vf5r0abDVdufLPkib
         6bzvqBVNl4mgHDIdRldZJhCh8N40cTc713RxXC2lR4HRxZ15hThUoXuLab79ijAUd0FI
         dDPAaaSZV7EI54vZTFYZQBvccGoGKpKPH2xYLgXufDj2fGTVBXxibJ6yX4StHk2zLLFD
         4Ifg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-461323c40b8si102728821cf.557.2024.10.29.02.18.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 02:18:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t5iMJ-0000Zf-3c; Tue, 29 Oct 2024 05:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t5iMG-0000YE-0F; Tue, 29 Oct 2024 05:17:48 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t5iME-0003A3-Pd; Tue, 29 Oct 2024 05:17:47 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 29 Oct
 2024 17:17:30 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 29 Oct 2024 17:17:30 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Bin Meng <bmeng.cn@gmail.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:SD (Secure Card)" <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 3/8] hw/timer/aspeed: Fix interrupt status does not be
 cleared for AST2600
Date: Tue, 29 Oct 2024 17:17:24 +0800
Message-ID: <20241029091729.3317512-4-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029091729.3317512-1-jamin_lin@aspeedtech.com>
References: <20241029091729.3317512-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4vQue0CY6gZe

According to the datasheet of AST2600 description, interrupt status set by HW
and clear to "0" by software writing "1" on the specific bit.

Therefore, if firmware set the specific bit "1" in the interrupt status
register(0x34), the specific bit of "s->irq_sts" should be cleared 0.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/timer/aspeed_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 5af268ea9e..149f7cc5a6 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -580,7 +580,7 @@ static void aspeed_2600_timer_write(AspeedTimerCtrlState *s, hwaddr offset,
 
     switch (offset) {
     case 0x34:
-        s->irq_sts &= tv;
+        s->irq_sts &= ~tv;
         break;
     case 0x3C:
         aspeed_timer_set_ctrl(s, s->ctrl & ~tv);
-- 
2.34.1

