Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp600765njc;
        Tue, 25 Jun 2024 00:08:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXbPGkZo4wBNUVfzleW/xelWak9vE6Uy0cPgq7gE6qHSO5qroUftE19i2MVBMuzvT/aJpCFe5ykkPQpFochUzxuzpCMugXI
X-Google-Smtp-Source: AGHT+IGtuHjeMlo/8k4/GUNCPwsnbUk8vvSt2bTigtIJv4XtD+cMlWeOv3iv5g1P9zwNFVFj7gtR
X-Received: by 2002:a25:a003:0:b0:e02:92cf:4bb6 with SMTP id 3f1490d57ef6-e0304049e42mr6961018276.56.1719299320446;
        Tue, 25 Jun 2024 00:08:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719299320; cv=none;
        d=google.com; s=arc-20160816;
        b=waOV5j1y6p0YMUdUUoB858vhqyqYvndg0NJ4XtOAiy4OT54CJmVilIGjQFMEPybeVX
         mu7fjCbi+Bm4xRWnTPHZWV3l0ds6ud+AlQf9cMhZgr44jlRS7WI1k7IlHl2bjDtSjX8B
         wdobgMtplAG+/4zfMzwkpxkwER7/WGRtnMicV+TnvvLDtvAkXCkeRBHZVS9gjf8sTuJ0
         T0tHJRFteF4tyo9Q9pbA0zBFh8dI382xkr7VaAqTBs2VhkGkB5AxQtGowhMYCzsLH+X9
         qwMskYadv6JEm/JT8xFlMBFNs73sZypfQR3bk+CkF3wIBkOlMnY1+ykMKP7G5fjyFtri
         c1LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=boQuFfhdJ6twxAi2DHQpNYcNcx0vkaLoZ9+rg757TLE=;
        fh=HrGJUFnZHz7hWxi+LYnD6UY3P1PFtgkIHq6jddVMKYw=;
        b=lvMarG8tC9/FQW9T9P8P+ee2SSW3PIeZ4q9oABgIPInNejXwl36ANxDazOoYiFfXvM
         57RFFvRjJKo2RwYK4x64fwNEUfEkCKRwejgzzsmzVwf9LmooBPUeijGJ/eLaJTWD0Nc3
         QxUW62/cRJCI5JhisdtW+aMkqc204BdQaAJqpSHTyoNpDp7RafNiKIjlk6qJIYLK568e
         o1BSVSucXzDq8xRKYKIvvXkMATJYb0sMSnVJ9Yw/vZZj9KOL3dRK0Z6vPHF/swIN6Ub7
         +rOVJIXs4rUrBq4VjzutLooDS0qwXNzBIdpeHGGct8ECb0gE1h5mmLFKlKEQmAxWtNV2
         qxGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444c2c64826si97329161cf.585.2024.06.25.00.08.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 00:08:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM0HQ-00011F-6k; Tue, 25 Jun 2024 03:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sM0HO-00010k-VZ; Tue, 25 Jun 2024 03:07:50 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sM0HN-0007Jh-HA; Tue, 25 Jun 2024 03:07:50 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 25 Jun
 2024 15:07:41 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 25 Jun 2024 15:07:41 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v3 1/2] aspeed/soc: Fix possible divide by zero
Date: Tue, 25 Jun 2024 15:07:39 +0800
Message-ID: <20240625070741.2852946-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240625070741.2852946-1-jamin_lin@aspeedtech.com>
References: <20240625070741.2852946-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
X-TUID: 4qTLI8OhkYKk

Coverity reports a possible DIVIDE_BY_ZERO issue regarding the
"ram_size" object property. This can not happen because RAM has
predefined valid sizes per SoC. Nevertheless, add a test to
close the issue.

Fixes: Coverity CID 1547113
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
[ clg: Rewrote commit log ]
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed_ast27x0.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index b6876b4862..18e6a8b10c 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -211,6 +211,8 @@ static void aspeed_ram_capacity_write(void *opaque, hwaddr addr, uint64_t data,
     ram_size = object_property_get_uint(OBJECT(&s->sdmc), "ram-size",
                                         &error_abort);
 
+    assert(ram_size > 0);
+
     /*
      * Emulate ddr capacity hardware behavior.
      * If writes the data to the address which is beyond the ram size,
-- 
2.25.1

