Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2451364njb;
        Sun, 2 Mar 2025 23:36:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUyOTScwiAfAvFyk3DWC8MD6BQ9LKZ54qaculMUa0RX0YfcLmqwZV2mjDOTBpyYoh5bPjQpY8THNXg0qQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHN5oRsTAOR6RAI89BXe1mrLnnN674tHHvFAyrWiYf8loKBrBz2fHpVQrCIpFpU7gcXXhOR
X-Received: by 2002:a05:620a:444e:b0:7c0:b1aa:ba5a with SMTP id af79cd13be357-7c39c4ce19cmr1657057685a.33.1740987401213;
        Sun, 02 Mar 2025 23:36:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740987401; cv=none;
        d=google.com; s=arc-20240605;
        b=FPEhr1zji+CFI515dt72v2SpVF3ubq7QCmpUtOkdQDlHNPPBbYDjZe7ZkAr3A70GRS
         KXXX4yNVSnaoZC/D0CubSokvnHn4L2PummeHE5Pmzx/u4fl7xgTmVZkq79E1A7BVY29U
         nwdOOYtpDovrBbwRaVyDyLA9Gp6K4qeiUHIjALZzFymvsjN8G/fWjsyDe7E3c4E3BI6q
         hShSCLgBRRnZ7TBhHUqObwFpdyUXWRmEp/kaY1sgbdGFzXU3Qlc7ap5gBvnPDaENfOmG
         2fZOIUawvI6roPDNJoqmXY1Hjh/aOAVOdZYyqR6U7ZTpvdPclYRBSYIOe1rQnMPZzIL3
         twZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=z891I2MVfqjTK55VxVmQ016mBxsDvXMEMipMXaAbXt0=;
        fh=Gb4TIc8MExyZGNjx5T60USxFFuCM6mshEZ2Ta2WMSD4=;
        b=gfjcert79H4FDZbwID8gHpTk4o4Zc/tgWJWQNzqpsJKJWzrcvaZU9KK7hGegkXNwdQ
         xjIDkSnI9/NRzfFmAdqYTzPvV94d9qfEcvWCvLj5FJutOa0DQiBrk/vCFIgefnSyfIyE
         qwu18yqb9Z4qlGCzf6wkvuJuWr0c+jnIzvK8hBxquGhNou2wfawU37eHflbVeVR/QGrJ
         d4zh58aFTeI9JUfVWWD78KRQv0cCFKc6fCNLxYnY8xcS7S7g4IPPBE55ufKuHEAkM1ox
         4OqltUSCJbMA5cYQCOPTInXku0PW1KQNCPdyB3ktECpCREThSjA6RYHt1IE3jBMGa0/v
         dr4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3749e0179si834790285a.416.2025.03.02.23.36.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Mar 2025 23:36:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tp0Lm-0000rF-56; Mon, 03 Mar 2025 02:36:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp0LT-0000nX-Eu; Mon, 03 Mar 2025 02:36:13 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp0LO-0001xL-Mu; Mon, 03 Mar 2025 02:36:08 -0500
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
Subject: [PATCH v4 4/6] hw/misc/aspeed_scu: Fix the hw-strap1 cannot be set in
 the SOC layer for AST2700
Date: Mon, 3 Mar 2025 15:35:44 +0800
Message-ID: <20250303073547.1145080-5-jamin_lin@aspeedtech.com>
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
X-TUID: ySOf7605YPN+

There is one hw_strap1 register in the SCU (CPU DIE) and another hw_strap1
register in the SCUIO (IO DIE).

In the "ast2700_a0_resets" function, the hardcoded value "0x00000800" is set in
SCU hw-strap1 (CPU DIE), and in "ast2700_a0_resets_io" the hardcoded value
"0x00000504" is set in SCUIO hw-strap1 (IO DIE). Both values cannot be set via
the SOC layer.

The value of "s->hw_strap1" is set by the SOC layer via the "hw-strap1" property.
Update the "aspeed_ast2700_scu_reset" function to set the value of "s->hw_strap1"
in both the SCU and SCUIO hw-strap1 registers.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_scu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 545d004749..0581c744f1 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -910,7 +910,6 @@ static const MemoryRegionOps aspeed_ast2700_scu_ops = {
 };
 
 static const uint32_t ast2700_a0_resets[ASPEED_AST2700_SCU_NR_REGS] = {
-    [AST2700_HW_STRAP1]             = 0x00000800,
     [AST2700_HW_STRAP1_CLR]         = 0xFFF0FFF0,
     [AST2700_HW_STRAP1_LOCK]        = 0x00000FFF,
     [AST2700_HW_STRAP1_SEC1]        = 0x000000FF,
@@ -940,6 +939,7 @@ static void aspeed_ast2700_scu_reset(DeviceState *dev)
 
     memcpy(s->regs, asc->resets, asc->nr_regs * 4);
     s->regs[AST2700_SILICON_REV] = s->silicon_rev;
+    s->regs[AST2700_HW_STRAP1] = s->hw_strap1;
 }
 
 static void aspeed_2700_scu_class_init(ObjectClass *klass, void *data)
@@ -1032,7 +1032,6 @@ static const MemoryRegionOps aspeed_ast2700_scuio_ops = {
 };
 
 static const uint32_t ast2700_a0_resets_io[ASPEED_AST2700_SCU_NR_REGS] = {
-    [AST2700_HW_STRAP1]                 = 0x00000504,
     [AST2700_HW_STRAP1_CLR]             = 0xFFF0FFF0,
     [AST2700_HW_STRAP1_LOCK]            = 0x00000FFF,
     [AST2700_HW_STRAP1_SEC1]            = 0x000000FF,
-- 
2.34.1

