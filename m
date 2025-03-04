Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp3098967njb;
        Mon, 3 Mar 2025 22:48:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXfWjfPmonmItWn+lFs04IDuPNurgAhog1nRsIKLNBB/rFYtgo6YmV3wZKDoSqoZCGN32A7MEqjIrJIsA==@linaro.org
X-Google-Smtp-Source: AGHT+IF1pi68uI0aj8aHkOR+Gh+T/pHVx5ZBo2+mfcRqzOry4BmGhoYFTj2jc7hInSc7ELKcjdmG
X-Received: by 2002:ad4:596c:0:b0:6e6:591b:fa62 with SMTP id 6a1803df08f44-6e8a0c87aa2mr244334306d6.5.1741070885139;
        Mon, 03 Mar 2025 22:48:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741070885; cv=none;
        d=google.com; s=arc-20240605;
        b=WpalmfGTeI8hRaZx1CA8dEdLgwb++6LVwozOoBjFy42JAecIiD9l1BIIsNjY/yA6xH
         rWL4JYgXcWXEKDfHuSXZ0zCN84v8vNUgpgekzJky81VVvYvEW6QqE6wvZ/mesOSUSsgC
         RJxAn42oaRPsF2t+cGfBNRwq4Y4sB2G9feQu6vDtFglBQ2okEpD9GYP9wpIPMsYkB1Th
         2/y1gzjQsKQ9hpH6sURXEIhekfdUQGHH8bDZl3frplt5UEBRPgQiZ5nhn9IknDG60n1V
         +EbLUmmqiTLBBjnW7tuBg2I46mEY25yQVVUxvc13Nk1IaVpJGSf/uSDAL/rFvV3/Vqb+
         7HZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=OZhXsafmj/ln1xn+2Gb0MvP12S9ZMNxMlr7ibKKzG84=;
        fh=no4a9QA/0zeIocEYrBrieE6XYIGB9KPekpO3W6wNjNE=;
        b=QqdlmUJf1VWaucQzRuRhKx56LrVvoiCnZFK2YOSLjmnV/RuFe5UtbFAslZAuEIpp8l
         6/ehgNMXBfd4idZY3Nr3sy7hJUWsRdQZMVFh4OWslt51isX7sYqJLeIbFaQXEKeHAqrm
         pA6SOpeGk8F7zEfJLT9HEXQpp9l7J3qUjJ/wl4dapikEF+nToUccoumXUV/h2m70pk36
         1M3j5iIUWrZQFjYJYXFQ/jTNJE7BtaHRWiOVbJx491PdyHrKthMXbFGyoeD8qJ13BEZR
         9F2YVmFFOAjYiNJbtwvJy6w1qji9R58CPNLxTih3uawcHEavZfxjPF1kY96P5hKAb3zX
         J00Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8976c0ad1si104243806d6.246.2025.03.03.22.48.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 22:48:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tpM4G-0006YL-5O; Tue, 04 Mar 2025 01:47:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tpM4D-0006Y4-Ao; Tue, 04 Mar 2025 01:47:49 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tpM4B-0003IK-4N; Tue, 04 Mar 2025 01:47:49 -0500
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
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v5 1/6] hw/misc/aspeed_scu: Skipping dram_init in u-boot
Date: Tue, 4 Mar 2025 14:47:03 +0800
Message-ID: <20250304064710.2128993-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304064710.2128993-1-jamin_lin@aspeedtech.com>
References: <20250304064710.2128993-1-jamin_lin@aspeedtech.com>
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
X-TUID: DCI6mjbePH5z

Setting BIT6 in VGA0 SCRATCH register will indicate that the ddr traning
is done, therefore skipping the u-boot-spl dram_init() process.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/misc/aspeed_scu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index bac1441b06..50f74fbabd 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -157,6 +157,7 @@
 #define AST2700_SCU_FREQ_CNTR       TO_REG(0x3b0)
 #define AST2700_SCU_CPU_SCRATCH_0   TO_REG(0x780)
 #define AST2700_SCU_CPU_SCRATCH_1   TO_REG(0x784)
+#define AST2700_SCU_VGA_SCRATCH_0   TO_REG(0x900)
 
 #define AST2700_SCUIO_CLK_STOP_CTL_1    TO_REG(0x240)
 #define AST2700_SCUIO_CLK_STOP_CLR_1    TO_REG(0x244)
@@ -930,6 +931,7 @@ static const uint32_t ast2700_a0_resets[ASPEED_AST2700_SCU_NR_REGS] = {
     [AST2700_SCU_FREQ_CNTR]         = 0x000375eb,
     [AST2700_SCU_CPU_SCRATCH_0]     = 0x00000000,
     [AST2700_SCU_CPU_SCRATCH_1]     = 0x00000004,
+    [AST2700_SCU_VGA_SCRATCH_0]     = 0x00000040,
 };
 
 static void aspeed_ast2700_scu_reset(DeviceState *dev)
-- 
2.34.1

