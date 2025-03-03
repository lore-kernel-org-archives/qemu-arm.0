Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2451601njb;
        Sun, 2 Mar 2025 23:37:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV8RYWjHEPQ7CyDlJTW+798AJIRB2Lr3JtSMAJ6K+RX7HIpeJQl0cjEK3QTJD7rejhf1hNhFJMRQHQL2w==@linaro.org
X-Google-Smtp-Source: AGHT+IGB+rhjK4xnZk/qF1xVk03thW4L1qGFP8ha11aWUEax+f/AWkw3adqO0agpa0/njRtBKVxN
X-Received: by 2002:a05:620a:4552:b0:7c0:a3d5:4886 with SMTP id af79cd13be357-7c39c4ca68dmr1575613685a.29.1740987446769;
        Sun, 02 Mar 2025 23:37:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740987446; cv=none;
        d=google.com; s=arc-20240605;
        b=kHNyTJUBwqm+I/3Brm17glXYtW2qqgaX4HOgdmFT4xTj8rqEv2Ab0MWdM7nNDbYSln
         7KKHo2rk0jkiy1ZRX+soobaZbKqqT5ClkIpU8NnePpmYMs314Cxmiwt45P1eK2FS0Rfq
         PYqPnFamx5ut2SliwZKXmOXHksyXQdzQIIgpEVJHt56DpRxYQ+hIGR+pd8ZfQKfynEVP
         L9S00mogVkggrdI6lOrefFN4pRQ20nqmOTkEmYWdSPhr2GyjoH0mNwFqxhkiUbeU68Ai
         FTMfZlQTc4b0mQb86Av5K/1HsDFUyT8xe5wyL438A4wqbQwmt4N5Fq8Mmltyt/AcBIug
         MHQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=5v0xQlOyL6TuFh/uqRv6HLvkVDW08sMFOcYqkqAvRq4=;
        fh=Gb4TIc8MExyZGNjx5T60USxFFuCM6mshEZ2Ta2WMSD4=;
        b=FeSt/R0cxOHwyH6HHFcED+bjPE0kfhy30XajMelWsbJkcwJUyGscoDVEfSIngnDH2c
         HEInTJtVePP+aHtWDql4ll2hiJmaIUSTUW2XEFe3jEnLpBRjdqlDKqdh8XfIRtmLuZmN
         VWvfNtuYQXweS1yp30lTNG/H6YQ29gLiDV/MCyxh6WmJjLnJ9Xsvt6eWQzuCwonXt026
         1VQTD8j35yWCrz4lTKmyMzeakRSGt/yCxyeqt1j0W3NvjhMKur2cD7oI56Ipr7/5pd4W
         191v0bS5e1mYm2vU/A26YTZTCmOh1d8EtQL/3ZhK/n0c0aX+jnlNISs6cfOwpSyM/Fzm
         yfRw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c396472d4bsi773423085a.392.2025.03.02.23.37.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Mar 2025 23:37:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tp0Lr-0000sB-Tl; Mon, 03 Mar 2025 02:36:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp0LI-0000lt-By; Mon, 03 Mar 2025 02:36:00 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp0LG-0001xL-UM; Mon, 03 Mar 2025 02:36:00 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 3 Mar
 2025 15:35:47 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 3 Mar 2025 15:35:47 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v4 1/6] hw/misc/aspeed_scu: Skipping dram_init in u-boot
Date: Mon, 3 Mar 2025 15:35:41 +0800
Message-ID: <20250303073547.1145080-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303073547.1145080-1-jamin_lin@aspeedtech.com>
References: <20250303073547.1145080-1-jamin_lin@aspeedtech.com>
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
X-TUID: PrHDm/PueByG

Setting BIT6 in VGA0 SCRATCH register will indicate that the ddr traning
is done, therefore skipping the u-boot-spl dram_init() process.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
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

