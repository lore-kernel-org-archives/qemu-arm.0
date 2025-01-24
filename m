Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp559208njk;
        Thu, 23 Jan 2025 19:03:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXvxhqZF+AZ6vfytWTisYXk/9NDsOhL/NCxHb+fPyGEEm1gKWHSal5qw/cCVVht0/N4lIqwGFI/GwZH7Q==@linaro.org
X-Google-Smtp-Source: AGHT+IF4WtRR4dmd6DrHZ8UIBns/Ftes8/xf8oYlocMl/1ISRP5KbcPsDepguiIM2cMDwzmEkzDY
X-Received: by 2002:a05:620a:2a08:b0:7bc:db11:4951 with SMTP id af79cd13be357-7be63288572mr5001553785a.48.1737687801211;
        Thu, 23 Jan 2025 19:03:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737687801; cv=none;
        d=google.com; s=arc-20240605;
        b=kylN/w7kOXcK9Ii2vgIm13THN10tnGpv02vAlT2XJtIqKZFUUTkmpI3YNoHafudIO3
         IRXrrbA1Yf7K1RjtK2cJFXRbo7Ck0HGI1MZdS4DxAYHj/c/NQeBvM38Ma5FE0f26U4Zg
         /cb0A/WJUsenvXqe/qHb9Gop07Mphyd3HiKWmJwqPopys5PivLrrAE0X83pkQ6yTWbM4
         I2BYO1yKoOkzsXZ9jgwy3Dz0O/CnbEy1X1PORcltEY0LfPthH/4vr9euMT20avhhKjyE
         i//lOk+2FALGDX+LC2grx/FODE+otWHfiVM8E9rOwE4JjOdGFlwfsD1Bdm/9PP/d0awZ
         YDxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=R2Z5JLIJ9aP1q3MSdgthCnf6Xtyx0csmM0tCjbtdahM=;
        fh=oHzELYP6xEldnfh1elECkRDXzq+40wADKO/d7kYb8Lg=;
        b=BJ1wqXXph7KC/raKpKUMi3TWNIvZZVxdX8wRs88LifG3JGhOIHikPnVGgT1bTxGnGM
         azgzZ1i/adnPzqxObADgK2b2l1BkP+slDAkmdE14VJZeLJMo+NxsEsgY1hZd/KWSW5YM
         C8QJNRiytAcOGtkhG6T+d+8sVrLVOv8n44e8eTFBiCM/IjaglBZaBU82CSxFZBxZYPqh
         6M6LAD5IqVtqf7+7qh1Eok0YANqCxem8HtJ/9i2ddFHJSn3w2jjbzn0SmRlFj50op9V6
         dtWnk97IM48tXh42RS4QhgfyViNRzQ0bQO/VnZGGW8CrNuQqaGmZEmACsHqx1TtMxDZ9
         WRqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9af2ad90si114565685a.627.2025.01.23.19.03.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2025 19:03:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tb9yI-0000uu-Vg; Thu, 23 Jan 2025 22:03:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tb9yH-0000u4-0W; Thu, 23 Jan 2025 22:03:01 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tb9yF-0007tm-Nn; Thu, 23 Jan 2025 22:03:00 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 24 Jan
 2025 11:02:49 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 24 Jan 2025 11:02:49 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v2 1/2] aspeed/wdt: Fix coding style
Date: Fri, 24 Jan 2025 11:02:48 +0800
Message-ID: <20250124030249.1706996-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250124030249.1706996-1-jamin_lin@aspeedtech.com>
References: <20250124030249.1706996-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
X-TUID: 97c+ZseUwJpl

Fix coding style issues from checkpatch.pl.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/watchdog/wdt_aspeed.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 81f5c5189a..22e94e7b9c 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -278,7 +278,8 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
 
     s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, aspeed_wdt_timer_expired, dev);
 
-    /* FIXME: This setting should be derived from the SCU hw strapping
+    /*
+     * FIXME: This setting should be derived from the SCU hw strapping
      * register SCU70
      */
     s->pclk_freq = PCLK_HZ;
-- 
2.34.1

