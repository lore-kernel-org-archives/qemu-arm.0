Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp344760njc;
        Wed, 12 Feb 2025 19:38:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVJzM18fgYC543CFVd44gFX5EqYeyiIxefdeLGJJTyHLmrtpC/Sur8YjD7J7f2U9D3XS5YoTZ65PQdt4g==@linaro.org
X-Google-Smtp-Source: AGHT+IFb40esbidwJs15y+W0ahXewpnbCakmge1mzYFJGfsLFrPB1cF/IXVDmNjRB0vf+KGMGcWy
X-Received: by 2002:a05:6214:dc7:b0:6d4:36ff:4356 with SMTP id 6a1803df08f44-6e46ed8abc6mr98812716d6.19.1739417900051;
        Wed, 12 Feb 2025 19:38:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739417900; cv=none;
        d=google.com; s=arc-20240605;
        b=RX47fypL9Hc3s8uGfuoGBZIrvtpkF9e44Wu1XcdjBHJzfCkaWwMmcGuphJkUdOnHjj
         auaaxArG2enEj1SaKjN1FqBS568r6lcEuHxnsxmesSMEqKCVJoIQ11W+bOTChmCIPp1S
         2eqY9fSqDPC26UH3lKA4Va+KwtWrsLOuziJpx4hMewCg7VV4+Zkwmw6Q5IJ2mLSgnhJX
         2gof3D0SWV9Od1SAfmklXuFcUDofs1ja/H+04MMJ3NGpKxYkcQbvhpcHVCmR8VZkpuF2
         RMHwlLWUx0QNbYUN3B/DlnbjmDG1+LZF81vEyI4kyEt7TMOwoMblMKcanpzDe9nQ0Jqu
         FrmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=lErHmpJ+T5uLBGxd/2QewqZtmiA72ekEQfPgHFysZZI=;
        fh=08d/IJI4U+AnOjHRYBcV+/5HqY2oyeWSX1NtojG11zk=;
        b=OLRYU4TNpllCC23EVylSoQrl54yiKSbw/nQQWBZ1rg+UQF7VxQbAcuRFy4L9iD+3AN
         galR0o3ZplHAxCvhQxG2wccDM6SkhN6gJTu8csYV9q4biAhaHhwbBg+1tk9SmFpPvZqu
         Q0OpdRuFBF0XYRs11P28xyhntN9Qi3tRqXPrDzqpf/tdbq+WDxcaaEcfz+gtMHjgyH6E
         ynaWRNdDkkhcBZm4JNALrINKfhrdpMLJNf3teoGNrMvEtBmm/ATGnfTsM17O1ZKSyT1F
         h7ZJQadYfgTRz4lgJDUUv20YdKk4o2DMVrOIxVBnFMTWHgIysNu/iOPjy8nvipZr+2lO
         Sl+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d9c171dsi5969596d6.345.2025.02.12.19.38.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 19:38:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiQ1n-0007eE-AV; Wed, 12 Feb 2025 22:36:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tiQ1k-0007az-RY; Wed, 12 Feb 2025 22:36:36 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tiQ1j-0000l1-2p; Wed, 12 Feb 2025 22:36:36 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 13 Feb
 2025 11:35:37 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 13 Feb 2025 11:35:37 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v3 15/28] hw/misc/aspeed_scu: Fix the revision ID cannot be
 set in the SOC layer for AST2700
Date: Thu, 13 Feb 2025 11:35:18 +0800
Message-ID: <20250213033531.3367697-16-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250213033531.3367697-1-jamin_lin@aspeedtech.com>
References: <20250213033531.3367697-1-jamin_lin@aspeedtech.com>
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
X-TUID: sbX1VLeCFQL8

According to the design of the AST2600, it has a Silicon Revision ID Register,
specifically SCU004 and SCU014, to set the Revision ID for the AST2600.
For the AST2600 A3, SCU004 is set to 0x05030303 and SCU014 is set to 0x05030303.
In the "aspeed_ast2600_scu_reset" function, the hardcoded value
"AST2600_A3_SILICON_REV" is set in SCU004, and "s->silicon_rev" is set in
SCU014. The value of "s->silicon_rev" is set by the SOC layer via the
"silicon-rev" property.

However, the design of the AST2700 is different. There are two SCU controllers:
SCU0 (CPU Die) and SCU1 (IO Die). In the AST2700, the firmware reads the
SCU Silicon Revision ID register (SCU0_000) and the SCUIO Silicon Revision ID
register (SCU1_000) and combines them into a 64-bit value.
The combined value of SCU0_000[23:16] and SCU1_000[23:16] represents the silicon
revision. For example, the AST2700-A1 revision is "0x0601010306010103", where
SCU0_000 should be 06010103 and SCU1_000 should be 06010103.

Reference:
https://github.com/AspeedTech-BMC/u-boot/blob/aspeed-master-v2023.10/arch/arm/mach-aspeed/ast2700/cpu-info.c

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_scu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 2d9fe78926..b45a36a555 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -911,7 +911,6 @@ static const MemoryRegionOps aspeed_ast2700_scu_ops = {
 };
 
 static const uint32_t ast2700_a0_resets[ASPEED_AST2700_SCU_NR_REGS] = {
-    [AST2700_SILICON_REV]           = AST2700_A0_SILICON_REV,
     [AST2700_HW_STRAP1]             = 0x00000800,
     [AST2700_HW_STRAP1_CLR]         = 0xFFF0FFF0,
     [AST2700_HW_STRAP1_LOCK]        = 0x00000FFF,
@@ -940,6 +939,7 @@ static void aspeed_ast2700_scu_reset(DeviceState *dev)
     AspeedSCUClass *asc = ASPEED_SCU_GET_CLASS(dev);
 
     memcpy(s->regs, asc->resets, asc->nr_regs * 4);
+    s->regs[AST2700_SILICON_REV] = s->silicon_rev;
 }
 
 static void aspeed_2700_scu_class_init(ObjectClass *klass, void *data)
@@ -1032,7 +1032,6 @@ static const MemoryRegionOps aspeed_ast2700_scuio_ops = {
 };
 
 static const uint32_t ast2700_a0_resets_io[ASPEED_AST2700_SCU_NR_REGS] = {
-    [AST2700_SILICON_REV]               = 0x06000003,
     [AST2700_HW_STRAP1]                 = 0x00000504,
     [AST2700_HW_STRAP1_CLR]             = 0xFFF0FFF0,
     [AST2700_HW_STRAP1_LOCK]            = 0x00000FFF,
-- 
2.34.1

