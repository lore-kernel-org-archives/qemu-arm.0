Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3385406njk;
        Mon, 2 Dec 2024 18:16:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUPSXxZMEBSLP+mJ26JDUGs00wk9qPyOaXf/dDAmxv9M4exggQmpG1OR+0hb993lzyKxSXIjfwsEQbFSA==@linaro.org
X-Google-Smtp-Source: AGHT+IF6wIg5waesnPgRCxYmHh+LLxRpneA5mNupQ5d6UE5pKhOIwbyevtAYe9+Vx0uTH2UxzkIs
X-Received: by 2002:a05:620a:1708:b0:7b1:49a4:d1df with SMTP id af79cd13be357-7b6a61fc9d8mr85278285a.53.1733192183147;
        Mon, 02 Dec 2024 18:16:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733192183; cv=none;
        d=google.com; s=arc-20240605;
        b=do2OG/DBM/4kM8WG9cYHzYf4qxkp4QKEhkfWej+UIzcM2ujnETqA5w0F4eM//q8tox
         Yavo5GFjk0XN/FFqt8DhdVuuiFMWfDo8DDzt7VQ5Bch2CEhkU8wwKXvVij2chKhxKXDu
         +5SRmQbzp1VWZGWLbf4mnuOCansZgCBTR1NFTYO+FeLDXfW23AkYF2BD6FfcapDxG5fw
         DrD06LTrUvqpoPxLoX2nhl8f/V7F3tqaAIB49i9/OVM5xwpV0tHzwEN3xPUl918AH1Hw
         W1V3gn6qWEdq1jF43iR1zI6dPEZz8QKvLG5mvP9o4XB6C3NJXFKBtgnHUVFiqq5xvcMN
         WaHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Sdj27LjMpSo7UuDMbnBHmV99BByF7NAieVVXloNuVow=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=lQ48IylAVB8wTtWbr0TmIG/WKQclyO/ISUa1CR2rBfZAN69sF7K3NIl/1gYFUE6xxF
         OYA+VxBHC+1LUMuuUFSGZeG4W+pLF+iyTyOwl64T3UI+y0Sk/VptH40dYwGhnt0N/K5m
         XOJApsEe8sBffxPltnMvSCcOKta2+koDPdnYrUb/RHPCJmGEel9YI7VFnleocFCv119W
         Cm6wkyeeJKIW0DIzs1u2MdPVdzQbA3bUURAu5zGP36dtH3fAHxYSS+bHv5W5ZOcmy9Hm
         kbcoI0DULjfS/TmNum8v2De+gmg0nEBDyhllKR21h6q349+Aji/JS0waDfd8U0esd7CF
         bAEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b684923a9bsi1404488085a.128.2024.12.02.18.16.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 18:16:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIIRk-0005TX-0B; Mon, 02 Dec 2024 21:15:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIIRZ-0005QV-25; Mon, 02 Dec 2024 21:15:19 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIIRX-0003dt-L9; Mon, 02 Dec 2024 21:15:16 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 3 Dec
 2024 10:15:00 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 3 Dec 2024 10:15:00 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 2/6] hw/arm/aspeed: Fix coding style
Date: Tue, 3 Dec 2024 10:14:56 +0800
Message-ID: <20241203021500.3986213-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241203021500.3986213-1-jamin_lin@aspeedtech.com>
References: <20241203021500.3986213-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lcOTl7XwRbcl

Fix coding style issues from checkpatch.pl.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast2600.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index be3eb70cdd..c40d3d8443 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -541,7 +541,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
         return;
     }
-    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->gpio), 0, sc->memmap[ASPEED_DEV_GPIO]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->gpio), 0,
+                    sc->memmap[ASPEED_DEV_GPIO]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
 
-- 
2.34.1

