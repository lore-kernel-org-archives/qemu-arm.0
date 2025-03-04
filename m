Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp3099136njb;
        Mon, 3 Mar 2025 22:48:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVM70yxDsuPQt05652hQEex1E2sYiUhDg7ypImZP/+t4RM9YOdi+VOK0LYjxzRHlyHut0qkRQehQiXMiQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFIYT1dcfsjiXJ2ESvLCJjbtyh8LjbkYCXRYjoB6lCVh8kvmuzCLiCAA6jUgmmPDpdZZiJJ
X-Received: by 2002:a05:622a:189d:b0:474:f10a:39e5 with SMTP id d75a77b69052e-474f10a40b4mr83653641cf.47.1741070917258;
        Mon, 03 Mar 2025 22:48:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741070917; cv=none;
        d=google.com; s=arc-20240605;
        b=O1jpsVsw9li4p5VC2rKp96QafEaUNpuzaZRMb5YicbVmbkK17c2wpI0kIp2QYcnFgm
         uPYDQNnz+p8tITATWmuoPNSsYOEgc3Djuxhumdw/UlhR4suhaUZXPdODraqYpIpkdgPq
         eloeHsAf7l9d9ylgTlnOIpqJENBnzOqjgBzn28IwAfWYsuK5q6y6pWd7wIMib+PcEFa+
         YHk0BmP8j7eFUfjCL/Z4zXEci31AeF+sc8Q6pjxmliHCOPbJuaLMHuAdPhxBxatgg8HE
         Aft5rb7eBBWd1ySYKbgawPhTn6/L6VovBTjbIRkXHB8q2mKSkRoXRSWLSxsEiTxRIbzM
         lnbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=xMk08CJD+LipYu8w9IChH8TAHQG0t+bsNfQHcA5EIC4=;
        fh=Gb4TIc8MExyZGNjx5T60USxFFuCM6mshEZ2Ta2WMSD4=;
        b=aW4FIS2kMWT/UjUv69S+NdaETLCB2EkPkHB6kCFFZk3Y2CDBiPUUkLKdsvK57FV8Qp
         YjNtOVXmV9gCo1Q73uwLwwc7dTVynVaBBScQatzlnsUIaTOX905mgIDaOGr66eExgzV+
         YN6m2PlpfYe5XY4S5GGGHaMFq+2MgGGY6cpZtPFsoBe9GPQVStxKep0CxKfFXHK+4qBw
         VABx9mFIJ+JZLTiLmDQPv1lVi7xBtkyfZ2MvcnNcPzCzQhdNvtpLhkMbRfi64lHV9pg+
         pWrlQPqQr1tFgckh6WurKHtxMywWyrWiGjDaHs9fAqypIOl39colMSqYloygpslcir+R
         u14Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-474e905605asi35281831cf.178.2025.03.03.22.48.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 22:48:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tpM4J-0006ZF-6y; Tue, 04 Mar 2025 01:47:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tpM4G-0006Yb-0h; Tue, 04 Mar 2025 01:47:52 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tpM4E-0003IK-82; Tue, 04 Mar 2025 01:47:51 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 4 Mar
 2025 14:47:10 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 4 Mar 2025 14:47:10 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v5 2/6] hw/misc/aspeed_scu: Fix the revision ID cannot be set
 in the SOC layer for AST2700
Date: Tue, 4 Mar 2025 14:47:04 +0800
Message-ID: <20250304064710.2128993-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304064710.2128993-1-jamin_lin@aspeedtech.com>
References: <20250304064710.2128993-1-jamin_lin@aspeedtech.com>
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
X-TUID: CKR0axkFSefh

According to the design of the AST2600, it has a Silicon Revision ID Register,
specifically SCU004 and SCU014, to set the Revision ID for the AST2600.
For the AST2600 A3, SCU004 is set to 0x05030303 and SCU014 is set to 0x05030303.
In the "aspeed_ast2600_scu_reset" function, the hardcoded value
"AST2600_A3_SILICON_REV" is set in SCU004, and "s->silicon_rev" is set in
SCU014. The value of "s->silicon_rev" is set by the SOC layer via the
"silicon-rev" property.

However, the design of the AST2700 is different. There are two SCU controllers:
SCU0 (CPU Die) and SCU1 (IO Die). In the AST2700, the firmware reads the SCU
Silicon Revision ID register (SCU0_000) and the SCUIO Silicon Revision ID
register (SCU1_000), combining them into a single 64-bit value.

The upper 32 bits represent the SCUIO, while the lower 32 bits correspond to the
SCU. For example, the AST2700-A1 revision is represented as 0x0601010306010103.
SCUIO_000 occupies bits [63:32] with a value of 0x06010103 and SCU_000 occupies
bits [31:0] with a value of 0x06010103.

Reference:
https://github.com/AspeedTech-BMC/u-boot/blob/aspeed-master-v2023.10/arch/arm/mach-aspeed/ast2700/cpu-info.c

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_scu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 50f74fbabd..545d004749 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -910,7 +910,6 @@ static const MemoryRegionOps aspeed_ast2700_scu_ops = {
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

