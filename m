Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2943276njb;
        Tue, 22 Oct 2024 02:43:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUFXqXHhpJ9siAiVfrcqpJ6hJJxVDXwVIKYTqg1PL3Gw/PfB7F21tpPN1OR5tNctOkzFHU6DbCPMzJSqg==@linaro.org
X-Google-Smtp-Source: AGHT+IEYiypyafNU065Jv9SqzqgX//bU0pWkKw9pfnuVfW60wb5QIf2V+Po09iazUxeW0evEze6P
X-Received: by 2002:ac8:5fd1:0:b0:458:3a5a:94c5 with SMTP id d75a77b69052e-460aed034dcmr233416301cf.1.1729590210497;
        Tue, 22 Oct 2024 02:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729590210; cv=none;
        d=google.com; s=arc-20240605;
        b=fvb3eJ+bO+rHzyYMYTCuBRXdvsATa+MZILcW8Frj119E3tSHLxHG36sAM+cS2y3YDc
         0DePFPxPjAgpXXSX5WMfVLB9Sb/AiIiR5zGSUqG6BvZPAJhhRjswupvaByJVn8el2zwM
         8QAtWcfC2sBzjC1d9K+Q0bxWSO5J2PJKJLwmJVNNAU0nHAzwfK/p1zMRusShFAVd6zwJ
         TxuYjeaWOEiiSTWjQBQ+1M4ZxjA7Xg/gzM1flJaPTT2nYV4uzwgw1V9P2CK5rMy3Klsa
         NrM0d9i1RYnEXHpdmA9LFqJcD8MbRkoZXQGjoXQxbKkhheV3LJBaWxcTEF7k8uKK1uYe
         Pxug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=sk/u2CxIbxmPfVhMpnjoonKvQAOsYIhs2UDY+7ygnFY=;
        fh=tJ6TeM8XDKi6I9LERy0ves/+1WFn5YJhFzDAan5mwNk=;
        b=ISdNdMKFDi057v2Vd8oiFIstdxnM0zHj7qx4u5C7/xuXF3CfX8N9IEoQdb/5a5/rQP
         rnWKLRL3OsHFr9GlBgkl4B7jzO+W76AHX2HnwwzdWNoZSUIjKnvrm+Vy1nTQ6w87Ccqz
         LrpXUZLAcohqMylxuzz/Ot+EBRXigGTtBcKS27ZTAH+mYRltEHvkVb7obRyD4QYpkx+i
         NVoDLJ3GfYDhS/Eg63blISB4ZEt2HW+5M7qdAzlOl35HPBLO/OptK0IvalYX+j4w+Yw8
         aIbt0L/u2SudOblBRs+UyOlphjWiz5i0U1bg/YYsU4eTn+PndY6FYSbpZZtFkmmt+TFg
         KAwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460d3d5acb1si59712191cf.612.2024.10.22.02.43.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2024 02:43:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t3BOj-0002tm-D9; Tue, 22 Oct 2024 05:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t3BOa-0002ph-0e; Tue, 22 Oct 2024 05:41:45 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t3BOX-00015E-L9; Tue, 22 Oct 2024 05:41:43 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 22 Oct
 2024 17:41:12 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 22 Oct 2024 17:41:12 +0800
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
Subject: [PATCH v2 05/18] hw/arm/aspeed: Correct spi_model w25q256 for
 ast1030-a1 EVB.
Date: Tue, 22 Oct 2024 17:40:57 +0800
Message-ID: <20241022094110.1574011-6-jamin_lin@aspeedtech.com>
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
X-TUID: LqoZEpM8PQJQ

Currently, the default spi_model was "sst25vf032b" whose size was 4MB for
ast1030-a1 EVB. However, according to the schematic of ast1030-a1 EVB,
ASPEED shipped default flash of spi1 and spi2 were w25q256 whose size
was 32MB.

Correct spi_model default flash to w25q256 for ast1030-a1 EVB.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index cf0c6c580b..bf68224295 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1643,7 +1643,7 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
     amc->i2c_init = ast1030_evb_i2c_init;
     mc->default_ram_size = 0;
     amc->fmc_model = "sst25vf032b";
-    amc->spi_model = "sst25vf032b";
+    amc->spi_model = "w25q256";
     amc->num_cs = 2;
     amc->macs_mask = 0;
     aspeed_machine_class_init_cpus_defaults(mc);
-- 
2.34.1

