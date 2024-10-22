Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2942781njb;
        Tue, 22 Oct 2024 02:42:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZ6YqkUTpk7QGFNGz6C0iAUFQ+uEGuGAJLVN0LRqKRU3BhXVBMNZ6lcvIP0z8jG7bRoz+Ppf5M4aIQbQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFr3ahOG23eB3wf+zSkbcN9F8gE8lyHbiHuYSVdLw3rAXDKSx4Iv5URVu2pSjIwvAMXuQdT
X-Received: by 2002:a05:622a:110f:b0:45f:7f0:c3fc with SMTP id d75a77b69052e-460aed85b56mr218868331cf.28.1729590139065;
        Tue, 22 Oct 2024 02:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729590139; cv=none;
        d=google.com; s=arc-20240605;
        b=lKsBewEn2a+Oz0xGFuDAe+cUmrPGNI8gNv0VgujKiNlDqBepXIa2lHDFiDuEvvzFQt
         JGaAvzYbcGjG+lMVZM/56GVi28WsNaSsMdeUPL2DSL/tW7xZfBIB86QJu9/Shzo7qcDj
         ZZ9V7K6kN7z/QbBtQOZgJV+BJifaxtnapQfnSmfOrtOJyHDa0QIOiNPi1ppKtsSq9Y2U
         NvHJVnTUBhT2n6wLujDv9hpcwY+DETeufN1PbpY+DjxrEOMj1W+38vFtfV4BiKtE9F+E
         EvPh2OtSz5UozzVb74BabnuKFeUIXJtklzhHUqErczYvGTTUhL5Nldz37xZsDJNZm+Xd
         Fefg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=gjvK+6/jWxUEm8Ho5T6VJg+z6kw4hcnNotBNx0Hzark=;
        fh=tJ6TeM8XDKi6I9LERy0ves/+1WFn5YJhFzDAan5mwNk=;
        b=BNOdrNJIlE5RDoEeyoBj1onVP2WPDnkMHrQhgNgS61Cdn5BBdb8iYUJfvN9xBxvFq9
         xc4uUuMIx7hF2usPewQJplqMQUGYlCdExRCgZw2A5bKLwc6knAALHlSo0m/md+aLKvgM
         vm+BnypUcfTtFxIRaO2tLP+zIRvnP6DdJ4oSv48e6Yvt9eS1VkSxZjASIxvy271Nsm7C
         Z4xkiW8xUszRPazl7i2MFEmmmDxTragishLlL8kHXSUAvCt+KLaAFO/SPn0tHYks6D50
         lGE178PJs8GiSdDAKRKmD47RdicB8GYIr66dsTxvQUdzdyCGV+ZJ5/qezsXbeudud4AL
         iLrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460d3d5b318si59990211cf.602.2024.10.22.02.42.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2024 02:42:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t3BOj-0002u6-Uz; Tue, 22 Oct 2024 05:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t3BOd-0002qd-0T; Tue, 22 Oct 2024 05:41:49 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t3BOb-00015E-Jp; Tue, 22 Oct 2024 05:41:46 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 22 Oct
 2024 17:41:13 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 22 Oct 2024 17:41:13 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, "Kevin
 Wolf" <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>, "open list:Block layer
 core" <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v2 06/18] hw/arm/aspeed: Correct fmc_model w25q80bl for
 ast1030-a1 EVB
Date: Tue, 22 Oct 2024 17:40:58 +0800
Message-ID: <20241022094110.1574011-7-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241022094110.1574011-1-jamin_lin@aspeedtech.com>
References: <20241022094110.1574011-1-jamin_lin@aspeedtech.com>
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
X-TUID: HnMpYL6GYggR

Currently, the default fmc_model was "sst25vf032b" whose size was 4MB for
ast1030-a1 EVB. However, according to the schematic of ast1030-a1 EVB,
ASPEED shipped default flash of fmc_cs0 and fmc_cs1 were "w25q80bl" and
"w25q256", respectively. The size of w25q80bl is 1MB and the size of w25q256
is 32MB.

The fmc_cs0 was connected to AST1030 A1 internal flash and the fmc_cs1 was
connected to external flash. The internal flash could not be changed because
it was placed into AST1030 A1 chip. Users only can change fmc_cs1 external
flash.

So far, only supports to set the default fmc_model for all chip select pins.
In other words, users cannot set the different default flash model for
fmc_cs0 and fmc_cs1, respectively.

Correct fmc_model default flash to w25q80bl the same as AST1030 A1
internal flash for ast1030-a1 EVB.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index bf68224295..b4b1ce9efb 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1642,7 +1642,7 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
     mc->init = aspeed_minibmc_machine_init;
     amc->i2c_init = ast1030_evb_i2c_init;
     mc->default_ram_size = 0;
-    amc->fmc_model = "sst25vf032b";
+    amc->fmc_model = "w25q80bl";
     amc->spi_model = "w25q256";
     amc->num_cs = 2;
     amc->macs_mask = 0;
-- 
2.34.1

