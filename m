Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp612047njb;
        Thu, 17 Oct 2024 22:33:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVwBDcGUsDp5ojeN/xCFYrcZiHtCWpTez3bpdAFxMZdi+GFzLnVj7nQx8Gypx81mn7wQ8sBTYM6YJVtFQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH8iqmXiqkaWfgVZD/I/twzM6jmTSBL48WX07cWLlhIS4P6DyWMctiHN1ziLOw0Hnb4vTXL
X-Received: by 2002:a05:620a:4046:b0:7b1:5143:8da1 with SMTP id af79cd13be357-7b157bdfabbmr131447485a.43.1729229592336;
        Thu, 17 Oct 2024 22:33:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729229592; cv=none;
        d=google.com; s=arc-20240605;
        b=Wf6HVta9ZTdwrCeQwGsBYQBSFknl9XUZBDZtGUCOVW2AD/S56lIl5Oanq2bfL9djSL
         +xUSBJRSeOF8VzC9a+VYT1KaLSV+1VNFWZFVqVqmcL/wZFZ2ESnMRuED0ER/VJ1BDccU
         rGDVOGXu0z9dHXAwCbB5Q1NmQ0NJPe/5Z/HuXDE72NjLO6/nRZtUT5W/3pZuiZ6H60Z5
         Xmy1YehrZ/sT6lA3lPmpyTkaa+is2JHH1URJ0PlY/i04XL9OEv8XtzIgHljkAixxhotz
         ChN4fW/Vy5XnsFab5rQEGg7bqMOYlGpOBDchNc6bGZGV4f7AFRBJAU4N1dfr/ypOLBcs
         zCYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=R8OvZBrll4nIRn14QLhTAeVjX1HTay7E8RfM2eUNaho=;
        fh=RVX+uUL/oYxgKlLpNyiQfzI75/ka+93kXvmeIy2Oap4=;
        b=MT8c1r6Nf0/yZXKWGXtofAFyheQJHlqDWEBAHIiPpsR6jOehmFqpMB97NExSD6jteC
         nrKi/SZYv07b3MHotb4ir/lghYBDBfEVHIXxovb7mw1AvsSnEynbG44WSQIQnAkqQnoP
         xGRAeLSdtuhRk005/JnFzSFlpCtxhc7cHfUiUdYcamMFO2lGCrXXqFDy8K8XQfKQIuU4
         24o/NJJEf2Mi0ZrDMUCyFy5KDbLpege/oD9cusA2jE1mC743okaWSUSjyq7H7sDTm/5v
         cHFzqZbTwxbVVAkCs8otWe3euGP9CaiqcNRniTSZowyUwYchzsbAtkbd5/mYLeNaf/N+
         J90w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b156ff16a0si102416085a.577.2024.10.17.22.33.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2024 22:33:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t1fac-0008Tv-7M; Fri, 18 Oct 2024 01:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t1faT-0008Md-W5; Fri, 18 Oct 2024 01:31:46 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t1faP-00089Y-5h; Fri, 18 Oct 2024 01:31:43 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 18 Oct
 2024 13:31:14 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 18 Oct 2024 13:31:14 +0800
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
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 06/16] hw/arm/aspeed: Correct fmc_model w25q80bl for
 ast1030-a1 EVB
Date: Fri, 18 Oct 2024 13:31:02 +0800
Message-ID: <20241018053112.1886173-7-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241018053112.1886173-1-jamin_lin@aspeedtech.com>
References: <20241018053112.1886173-1-jamin_lin@aspeedtech.com>
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
X-TUID: 3rPuiLzIpdTV

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

