Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp3099295njb;
        Mon, 3 Mar 2025 22:49:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXtQ12IO3jov4/VsIeicV3RmWI1yRXOiQapwmPav+qkE7cp7i0ZvgljKDYGHFIYqwiUFgJGXp80YdwAZw==@linaro.org
X-Google-Smtp-Source: AGHT+IGhykRlBa5UReemtAqIeVstJW5Pfs797034dwM2h4W/ms0JOTJ/1oSOu0Y3ZvmG5A0Hp9+J
X-Received: by 2002:a05:620a:258a:b0:7c0:a28e:4964 with SMTP id af79cd13be357-7c39c4b4d9emr1980236185a.14.1741070954151;
        Mon, 03 Mar 2025 22:49:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741070954; cv=none;
        d=google.com; s=arc-20240605;
        b=dSKIXeCaXqK+owxz388jLAkwrYccfvyUzdVwWPwemfAJnKWS2mkao5d4c9oSDqW3jg
         Jm8T0bcbJUS3JFE+OycztIxuT4/RsAKgm0Uc5y6/BJMX/7s6wT8IkEh3nqNtJj4bdj+O
         FxEp1iaR3HQHbpK3DmnVnjfaZqXLVlfXcPOrPgf9XxMHrRsblljRRIaAaerwMUBTE9+i
         nScyj9qhEdoO1Y5KKkN7rih6t5k+AnBCn8+/s2iJ3qRUEGsd20BUSNR0sOoGc+izPEb9
         kNeoDMvJj922yU+AIpGt/wpFe5QVv9ohPbYscXja1gU2BS4ZNGLGXN2cCii6OpdUgeGu
         6lMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=WZyn+V6Bbo+84XSDP5p+dJzYTP9ZHRlsbTV7u4Z+epo=;
        fh=no4a9QA/0zeIocEYrBrieE6XYIGB9KPekpO3W6wNjNE=;
        b=c1dMosHgFplLMCsq88TGkRGJ22VMTCjLWPoVtz6cHJgsLT7ZkGspl99BZ9nJOujpQi
         uNOKNgwWH2MlazhLr5EqQ3JKk/ODAzCiHoThFdHEALqsPiPohaA8P1Q4IdJlBhITAP+m
         9zgwtekFEwyWP3fE258t2qu+6x3l7B7FXcum6UEogmRxGD49vaFhpigVFaS9DWTqZbc/
         EydVufDcxFba2rHqjaonU1pBqjPWm0crz5tf9piEjWbvRXrq5lTISQ9OwTNfiRW9RYLv
         7fTzqQ821RaJXTxc2gx4AeSJJiX2uDZYl9Ednyx9wSPT1cpVe2yOGmuDLyJaxWh1smEK
         IsaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3c86c058fsi194114585a.265.2025.03.03.22.49.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 22:49:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tpM4K-0006a3-T5; Tue, 04 Mar 2025 01:47:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tpM4I-0006ZJ-89; Tue, 04 Mar 2025 01:47:54 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tpM4G-0003IK-Sn; Tue, 04 Mar 2025 01:47:53 -0500
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
Subject: [PATCH v5 3/6] hw/arm/aspeed Update HW Strap Default Values for
 AST2700
Date: Tue, 4 Mar 2025 14:47:05 +0800
Message-ID: <20250304064710.2128993-4-jamin_lin@aspeedtech.com>
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
X-TUID: 5dsNPr4yBaDn

Separate HW Strap Registers for SCU and SCUIO.
AST2700_EVB_HW_STRAP1 is used for the SCU (CPU Die) hw-strap1.
AST2700_EVB_HW_STRAP2 is used for the SCUIO (IO Die) hw-strap1.

Additionally, both default values are updated based on the dump from the EVB.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 98bf071139..c6c18596d6 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -181,8 +181,10 @@ struct AspeedMachineState {
 
 #ifdef TARGET_AARCH64
 /* AST2700 evb hardware value */
-#define AST2700_EVB_HW_STRAP1 0x000000C0
-#define AST2700_EVB_HW_STRAP2 0x00000003
+/* SCU HW Strap1 */
+#define AST2700_EVB_HW_STRAP1 0x00000800
+/* SCUIO HW Strap1 */
+#define AST2700_EVB_HW_STRAP2 0x00000700
 #endif
 
 /* Rainier hardware value: (QEMU prototype) */
-- 
2.34.1

