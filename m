Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1602636njc;
        Wed, 21 May 2025 20:36:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXLHflCXwWqvQAGf0BFZVbkcn8IrJD6ghZuWVMDXCq8FpCt+iK9gHws4pbnuIAEdceX9LfuLpgW3TMIaw==@linaro.org
X-Google-Smtp-Source: AGHT+IFGzIWy+oayqwJYR5urv9NaYWxSXU77FWDxo/q1srV+sGbCX8AMDh6au2ivC2CdboNY+tiZ
X-Received: by 2002:a05:6e02:184f:b0:3d4:3ab3:daf0 with SMTP id e9e14a558f8ab-3db842ce32amr230454225ab.7.1747885014203;
        Wed, 21 May 2025 20:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747885014; cv=none;
        d=google.com; s=arc-20240605;
        b=J6hu1WTaxpaJb1yvRWrZ9SNpiIOGLpdPUcnR531a4mhdromfrvynrmWxl/ZUTBo2Zn
         TCy0Vf2tX2o2U8YLVGGVuV0GY31zPUJHILs7Hdfsi9O8ptH5uTiYarWleU394EVM+i0R
         1FKCUys/M0vBvX0tey1sspXFjgaM41VbdiZNzxJIx9UzOuM4aWtGfICx+E8zosB/BwBz
         ksLvwQvi6sEdtRaQf0NjKAaPWWz0Su2eZbMvOgGUcR2xQen5HnbE4Uy5nZ2hScm/XH5h
         RVrSQGm2NHyTTsr5CJPFMUTpyTIgWzCRAVE8yTxkeX9oAo5bkDNMgVsjGblcfRqiPswS
         7sgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=wNFnyxxw/NnSRaqq4amBQiv3SaYwjIja4TNhaBD5DeU=;
        fh=Yg1QA3CYCa2LdK3Mf8oXZ+DbfQ0OHIFsuQO5E7pFx2w=;
        b=GYUpO1Reho/5jh2rI+Rkb390XKyJvb9AKO+e9zKW8Rvki1xGKL/EpFdnoQXakJJjWF
         U51PmdJp+QNECqT9nDRjlmp7OZB0BO/K2Eg//2H2tUC1TEQ3FGpHmBmtxQbd8dksk8Ta
         8Qj4zap3UcU+B+/NUKK+X5ynqIufBIymGs/NWnilZoQIyo3qs4ye0pxDwErvejQlrMzn
         AkWd1q+1MjhwEwwCYbd8NU8HoGYmn1kjgetM2hll1eezPKAYMqUn17Sjk54BfbURYSts
         JUvvh17va62lpJfsYEHSIo41xyUkDm6tCnvCK0wYjWxuagmuTiIJxxhIyvP1xReYwFrL
         pHnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8926c6da1cb9f-4fbcc4bbfe8si14864628173.135.2025.05.21.20.36.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 May 2025 20:36:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uHwjd-0005kc-VK; Wed, 21 May 2025 23:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uHwjc-0005kH-Fw; Wed, 21 May 2025 23:36:44 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uHwja-00047S-OI; Wed, 21 May 2025 23:36:44 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 22 May
 2025 11:36:29 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 22 May 2025 11:36:29 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>
Subject: [PATCH v3 1/5] hw/arm/aspeed_ast2700-fc: Fix null pointer dereference
 in ca35 init
Date: Thu, 22 May 2025 11:36:23 +0800
Message-ID: <20250522033628.3752086-2-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522033628.3752086-1-steven_lee@aspeedtech.com>
References: <20250522033628.3752086-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
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
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cg4TqEvoq/DV

Clang's sanitizer reports a runtime error when booting with
'-net nic -net user', due to a null pointer being passed
to memory_region_find(), which subsequently triggers a crash in
flatview_lookup().

Root cause:
- Missing NIC configuration in the CA35 initialization.

Fix:
- Reduce ca35 ram size from 2GiB to 1GiB to align with ast2700a1-evb,
  where the ram-container is defined as 1GiB in its class.
- Add nic configuration in ast2700fc's ca35 init function.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0-fc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast27x0-fc.c b/hw/arm/aspeed_ast27x0-fc.c
index 125a3ade40..f8cb632bca 100644
--- a/hw/arm/aspeed_ast27x0-fc.c
+++ b/hw/arm/aspeed_ast27x0-fc.c
@@ -48,7 +48,7 @@ struct Ast2700FCState {
     bool mmio_exec;
 };
 
-#define AST2700FC_BMC_RAM_SIZE (2 * GiB)
+#define AST2700FC_BMC_RAM_SIZE (1 * GiB)
 #define AST2700FC_CM4_DRAM_SIZE (32 * MiB)
 
 #define AST2700FC_HW_STRAP1 0x000000C0
@@ -86,6 +86,13 @@ static void ast2700fc_ca35_init(MachineState *machine)
                                  AST2700FC_BMC_RAM_SIZE, &error_abort)) {
         return;
     }
+
+    for (int i = 0; i < sc->macs_num; i++) {
+        if (!qemu_configure_nic_device(DEVICE(&soc->ftgmac100[i]),
+                                       true, NULL)) {
+            break;
+        }
+    }
     if (!object_property_set_int(OBJECT(&s->ca35), "hw-strap1",
                                  AST2700FC_HW_STRAP1, &error_abort)) {
         return;
-- 
2.43.0

