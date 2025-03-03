Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2451478njb;
        Sun, 2 Mar 2025 23:37:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXGSdhMIlVD39TslIzV9bkc6Ie2VBzcYMRPxIWrxho6yJ2P8HfMTaDncattDUFvWQWofhXORg7vNPQftA==@linaro.org
X-Google-Smtp-Source: AGHT+IHV44eAaElRXpn4uNCk2RmnU1rBDfQwBPspT/kdiHKEZ6IjU+jEw7px1pd/+oni5ihlGE91
X-Received: by 2002:a05:6214:5098:b0:6e6:698f:cb00 with SMTP id 6a1803df08f44-6e8a0d95cc9mr181590306d6.42.1740987425131;
        Sun, 02 Mar 2025 23:37:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740987425; cv=none;
        d=google.com; s=arc-20240605;
        b=bYNseY+YpoMJ7okhnc+oaEiLX/0XiIhzKRqtzRDshUZOkpZrtfqiGX+Sjwhf0GDXWI
         kdyagVJI9D+o9WQdCgRtrLlPbBCoHLDjYvedl2CxvJ60o5pqvwyaA5n1NIvRpxGk8xcN
         xno46dqeR9C196qRpSGGzt13Gs48lRSO4kjXT9dyjnYhTLJm2OzAq1xS3/i8cRpCl1b1
         B5UMqAhqyqgLz5QOUW+5wGrfwggT0h+j04QzLuKtpPAmIY1d+HJiSqqJgZpehEDGF1fq
         SXoT3qnKcR5/M0yp+eqWZbWViLf1lAqeSZfDu5q2kJ2JQr2hJDf/GJpgeDdpzNuqeI3U
         bA+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=9NBmuUn1h38MuT8FxzNS8lJ+RJ1AdW4fs1amrFyahw4=;
        fh=Gb4TIc8MExyZGNjx5T60USxFFuCM6mshEZ2Ta2WMSD4=;
        b=EMzUGNFsS9CPSKkenvzAyYheGDdomnUj1AGaBujNHcOiTX9r/AnNggDSC8xegDRm99
         8SWFhVbsF6BJ1KYHwbhi/UqwrcvyxfvCEoA0DrXWIxhBpXcGNEpV4UsAIq30zc2SaR7G
         SEHMOB1gcpXVUanu9TGVrjnr+T883QBTjtsJzqr3kaVMwNkknK35OygioudBir7HSGeI
         v3zPc7KGWx7Ekn9DEtBU/ou5QCW03pZpkBVEiPt8Om1gUcav31vrq5hN3q0WiauHKqqP
         9CbJNibVIvXO0ncfFeoDVEivvlPt7IuH9aQjQNXEf42WVKD7o7VxowMxsLPhx+psQIS9
         qqew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8975e7339si81057576d6.52.2025.03.02.23.37.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Mar 2025 23:37:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tp0M5-00018z-Dk; Mon, 03 Mar 2025 02:36:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp0LN-0000mv-JF; Mon, 03 Mar 2025 02:36:05 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp0LM-0001xL-19; Mon, 03 Mar 2025 02:36:05 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 3 Mar
 2025 15:35:48 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 3 Mar 2025 15:35:48 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v4 3/6] hw/arm/aspeed Update HW Strap Default Values for
 AST2700
Date: Mon, 3 Mar 2025 15:35:43 +0800
Message-ID: <20250303073547.1145080-4-jamin_lin@aspeedtech.com>
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
X-TUID: SXQJwwiXwGVR

Separate HW Strap Registers for SCU and SCUIO.
AST2700_EVB_HW_STRAP1 is used for the SCU (CPU Die) hw-strap1.
AST2700_EVB_HW_STRAP2 is used for the SCUIO (IO Die) hw-strap1.

Additionally, both default values are updated based on the dump from the EVB.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
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

