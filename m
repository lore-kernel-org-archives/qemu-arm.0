Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp2440665njm;
        Wed, 3 Jul 2024 01:18:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXkZMtKOmdzrln5J7qzzaMBT5pzb7y+tlWP5wvfrKBgWIJY6FIVfBYwfvWoSADzVBfZCw7VyppCv6PwcbKAWIcP36uEveCt
X-Google-Smtp-Source: AGHT+IEGNdmOShnNZcADpTFzsRzYEmu5vDeFhHvePWBt8WtqhgHWqrG/aVlaVyyH59WohxXsuo8E
X-Received: by 2002:a0d:e84d:0:b0:62f:b282:9f02 with SMTP id 00721157ae682-64c716196abmr136326787b3.21.1719994679721;
        Wed, 03 Jul 2024 01:17:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719994679; cv=none;
        d=google.com; s=arc-20160816;
        b=hx3iokD3U3fDPab2Nkz5ePA+9CaInsEWdtHdZIpl08jDZh7daNrDfB1V9jYNeXe0BS
         DWmfz2pRCQIj2V0B3GbjBLdauI1DEVAWicdfSGGHs9j8xu8loFpP8/mGTpU8iWHkyrn6
         NkNeAkdjoLpOld5Llf6X8cqZtKLqESNc5WVE57PkAE3nQYJvWQ2R2Z7ghrQ6oKiyXdvI
         Kp3H3aRlN8zQh/0XqkGEpJxhvoKfmarHq96OARKXnD27zE1ZYocaC7N3fx04N+e1XzFk
         WTENRglbij3ZlaJajruDYRRtNqRXXKEFuV2KKzQVnVuw33tAcL+zqlzGN4jm94ZSWdgG
         wCcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=u/OgqHtzguGTYj3JunW541UYTQVAy/aLoIWqqzLTxrY=;
        fh=Vva0SnTfFpZ62XWQNW5X4TL2jFj5cBikmg9Gp1PrOrY=;
        b=lNVrwvYdwMWMNXuRorZzXHaDf1W0Z23kfghLld6LjkXUdTYdKaoFZpgYuhrXMvRvJp
         fh5eOIXVaF1bJgjNA13NfYn57BdyC6aWBGzbaZYMU1gr2dJgDLw0sd5Rct1NkiuCDGcT
         NaBv+XhWSIcZhKXmRduerWrdsBIGyWrf/m6kdT6qlAcaKWE+rrCWFO8ZOaA82s/Ew8fp
         u819DIirjMg/faw8Nd+ji+bhJuyG1yR0zhKQCfWMcbLxYhGMIvO+S2V9AHsJJ2FVqM01
         9zGhkue3gbkMQ5XxW9EunuImOWUuMSIEpFtIaOoWaeZjNt/aN+tDRFpUK31unhYGXeHY
         HuAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e36c692si122436256d6.174.2024.07.03.01.17.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2024 01:17:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOvAi-0003ID-Ma; Wed, 03 Jul 2024 04:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sOvAg-0003HX-Va; Wed, 03 Jul 2024 04:16:59 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sOvAf-00014r-FS; Wed, 03 Jul 2024 04:16:58 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 3 Jul
 2024 16:16:25 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 3 Jul 2024 16:16:25 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, "Kevin
 Wolf" <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>, "open list:Block layer core"
 <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 3/5] aspeed/soc: update to ftgmac100_high model for AST2700
Date: Wed, 3 Jul 2024 16:16:21 +0800
Message-ID: <20240703081623.2740862-4-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240703081623.2740862-1-jamin_lin@aspeedtech.com>
References: <20240703081623.2740862-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xpryQZvgEfTk

ASPEED AST2700 SOC is a 64 bits quad core CPUs (Cortex-a35)
And the base address of dram is "0x4 00000000" which
is 64bits address.

Update its network model to ftgmac100_high to support
64bits dram address DMA.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 18e6a8b10c..04604a4bef 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -332,7 +332,7 @@ static void aspeed_soc_ast2700_init(Object *obj)
 
     for (i = 0; i < sc->macs_num; i++) {
         object_initialize_child(obj, "ftgmac100[*]", &s->ftgmac100[i],
-                                TYPE_FTGMAC100);
+                                TYPE_FTGMAC100_HIGH);
 
         object_initialize_child(obj, "mii[*]", &s->mii[i], TYPE_ASPEED_MII);
     }
@@ -552,6 +552,7 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    /* Net */
     for (i = 0; i < sc->macs_num; i++) {
         object_property_set_bool(OBJECT(&s->ftgmac100[i]), "aspeed", true,
                                  &error_abort);
-- 
2.34.1

