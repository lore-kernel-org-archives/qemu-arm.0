Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2750109njd;
        Tue, 22 Apr 2025 18:40:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWnCJfj99K7tpddBwlN6nvuDK4WD+48Hfwvit2xIe9v0T5FGvxMtPbS9p2AqdT3PLHuNS6ZPYEgmmmldw==@linaro.org
X-Google-Smtp-Source: AGHT+IGca6ilHFN2ypP8H1PJJ2ZRDuwal0Hu3Fie/NV21MwMOT7mWv2SflaietXFP6UkrSpIxBSC
X-Received: by 2002:ac8:7e84:0:b0:476:6b20:2cef with SMTP id d75a77b69052e-47aec4b50cbmr343658491cf.41.1745372443690;
        Tue, 22 Apr 2025 18:40:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745372443; cv=none;
        d=google.com; s=arc-20240605;
        b=SRz2z3CItdhqAK9Wgkp1tmIjfaRgvP9Ncf4c9woXjrit+Fys266HRXxLdg2xUxPnho
         Gcha6SfK2+EC4t1Z17LK3aGcCmeQG3TEOfQ2UqbpxBAjDAD5ZhTKwKRL9AQ59ZiSKVpd
         woxBhGT8TadRlTborAczdGhnwKi04EUHWVSCPPikUxV/WTKqBkiOvEyTyKLzYid+Htd3
         IiWxWYzqpJ8GqQd7VLkOoOLudttXOLsxnkR0wZ2jCQ1gAuGzPjcik5WbzuPVZlr1mA8J
         +CFIzKXbMcCJo04RTEva6Ba1Uj2ou8IH13aVt+jbtHhRsKdcs3ErWhuXmWrifYbr6eHk
         29lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=9oQYGliNJ615rSHqI0dIX7snVAK68EviWQcVoInEnos=;
        fh=Gb4TIc8MExyZGNjx5T60USxFFuCM6mshEZ2Ta2WMSD4=;
        b=FhaXZkZ8IPWaFCxAInYSqeN5e7oc/KebnDoDxhegeJptVm1Cug1R8YJYvvRuegmKiJ
         hzyvMQSVipgXA9iSisQLlrij/f3GKBzgpu+zkvhUo78LpT4nYGheSRIKQYW1TpQ4uh54
         wkiOzJTBM28iUJLy2pPzy1QVqBZiSn5pJT+pbg9Pgc9vDm+k7cBo8ir1c5xuwoA8X9eH
         2yjWyPXr4Tv1BUvfrt2Jt0qGHmEG7UMNS4A1men+Q9RAGJi0YIwjxQBqQIAFjQWbipAW
         enPmlSQryZ3y2Zf0hYzxM0Pz9WFqWRc/0wGQCs6hrvPdOfcc9/ASQ5wi3/H7orc9Bd1b
         ECaQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ae9ceeaacsi128241741cf.610.2025.04.22.18.40.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Apr 2025 18:40:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u7P6B-0007XY-SE; Tue, 22 Apr 2025 21:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u7P69-0007W5-8q; Tue, 22 Apr 2025 21:40:25 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u7P63-0004FX-AR; Tue, 22 Apr 2025 21:40:25 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 23 Apr
 2025 09:40:08 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 23 Apr 2025 09:40:08 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v2 0/3] Update to test new ASPEED SDK version
Date: Wed, 23 Apr 2025 09:40:04 +0800
Message-ID: <20250423014008.147542-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
X-TUID: N/nMQLLDACXL

v1:
  Update to test new ASPEED SDK version for AST2600, AST2500 ,and AST1030.
v2:
  Fix review issue for AST1030.

Jamin Lin (3):
  tests/functional/aspeed: Update test ASPEED SDK v09.06 for AST2500
  tests/functional/aspeed: Update test ASPEED SDK v09.06 for AST2600
  tests/functional/aspeed: Update test ASPEED SDK v03.00 for AST1030

 tests/functional/test_arm_aspeed_ast1030.py | 10 +++++-----
 tests/functional/test_arm_aspeed_ast2500.py |  8 ++++----
 tests/functional/test_arm_aspeed_ast2600.py | 15 ++++++++-------
 3 files changed, 17 insertions(+), 16 deletions(-)

-- 
2.43.0

