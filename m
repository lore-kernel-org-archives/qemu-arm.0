Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3320639njd;
        Wed, 2 Apr 2025 02:20:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUfuSItDpSs/G4mc26hXlcqSgIr2wBw/KnmsQEMpzMENaibgmIe2pFSAketqqopRlHynzZ5qX1FbQ8IxQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGv2YVG/Z+qtCADo4/lfs8j7nXPmT+FLfDKqT1Z/lkdeFKQDKMhafhyNOIQUKGQcodCuOU6
X-Received: by 2002:a05:620a:450d:b0:7c3:d5a4:3df3 with SMTP id af79cd13be357-7c690731797mr2054561585a.34.1743585643347;
        Wed, 02 Apr 2025 02:20:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743585643; cv=none;
        d=google.com; s=arc-20240605;
        b=PEcHqJ8d2EHo9fbiJ0jCFCoM14iDQS7dma/ff3axmnvbIWnnzHDW5juGgmvmkhUvNv
         I+ZekwsJYPmbTqxazVufEv1QpFgj3zNsVc+wViTSuf1EkcKdWPq9g2lxu+NEq9NWea0e
         pDL8/Dx850seaMP+rpBsot858sfeUAMzHu5KJv1FfXNgeY21wloy34RuDrn2gBtTjrXx
         orOd8wobdQuBnuFLtQdT4OBnIqmQsXbRs9kqw/XnedJvn30La9a5FgQ3mdizpKBrHjwQ
         ba8xxzzOxW+3vQ+YTiGJ/G2N/nYs2A+upK5f0oZyWCw2lciyleaAlpGZNMQAms0N+14j
         qa0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=uyGXr8b4pz48DXe2TyWEsaX8oe/somihiZWTmV7bZ3M=;
        fh=PPdKJeR1ELyXAndQd+UDvsR7koT4SZ+47R660cdsM5M=;
        b=ULk4So1hBWgcB5b4iUQ07T7yqzJgeAxKc4RTqsWAhxMnYi4FuRAzJjDOrZPJ2xrmCB
         e/g2PjbxjeHvRLc94e5bBHjLXn6upIbYZIOppIT28V71CjWM/1pzSjxvffvDxJkmNJ8A
         OulQvMrdoT3qRScr6lhAYpHBrcIZVN9KJoQ++LuvGWx1waeyLXIKqU3G0KlMxSf4BTM4
         7LReuOwNqgNZcwp4qRnN8FMppEb7L/YhVdISr7mK8PrbQCKdePbOYfzvhIylGD/0p1cB
         a4a7zXR9H3hs2TDHXG4NiwW9ZNKvwI+3XT32FDWSJeKPhUncRCrqii5PRmiSgvT7UmWi
         6fYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5f76829e7si1135756885a.94.2025.04.02.02.20.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 02:20:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tzuGV-0005ec-4f; Wed, 02 Apr 2025 05:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1tzuGS-0005bz-Ex; Wed, 02 Apr 2025 05:20:04 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1tzuGP-0001EE-Iw; Wed, 02 Apr 2025 05:20:03 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 2 Apr
 2025 17:14:47 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 2 Apr 2025 17:14:47 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>
Subject: [PATCH v1 0/1] hw/misc/aspeed_sbc: Implement OTP memory and controller
Date: Wed, 2 Apr 2025 17:14:46 +0800
Message-ID: <20250402091447.3381734-1-kane_chen@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=kane_chen@aspeedtech.com; helo=TWMBX01.aspeed.com
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
Reply-to:  Kane-Chen-AS <kane_chen@aspeedtech.com>
From:  Kane-Chen-AS via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: y2RwdvXYLhqj

This patch introduces part of the Secure Boot Controller device,
which consists of several sub-components, including an OTP memory,
OTP controller, cryptographic engine, and boot controller.

In this version, the implementation includes the OTP memory and its
controller. The OTP memory can be programmed from within the guest
OS via a software utility.

Kane-Chen-AS (1):
  hw/misc/aspeed_sbc: Implement OTP memory and controller

 hw/misc/aspeed_sbc.c         | 304 +++++++++++++++++++++++++++++++++++
 include/hw/misc/aspeed_sbc.h |  14 ++
 2 files changed, 318 insertions(+)

-- 
2.43.0

