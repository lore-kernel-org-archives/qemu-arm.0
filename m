Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp1869789njc;
        Sun, 3 Nov 2024 19:21:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXshxgn3XTdN0C/B6SRmNw5Jfomz5kI19h6uNzjdCXYOISeEz7QO8sovt0j5W2fStvAU94fOOsTd3sjsg==@linaro.org
X-Google-Smtp-Source: AGHT+IHdbkVmNLu8cKRfXgpU/xSa6P0OznfZObDL1iom8wS+kdiAfRr46E6LqymIRPOC4MLXNXGZ
X-Received: by 2002:a05:620a:c44:b0:7b1:7838:9423 with SMTP id af79cd13be357-7b2fb9bfd58mr1701026985a.64.1730690504963;
        Sun, 03 Nov 2024 19:21:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730690504; cv=none;
        d=google.com; s=arc-20240605;
        b=XnXOQMxkRO/Lx7b0QJLa5vBTeYYJhXsolSZ0O/vWo9uzNchzZGKLTsiasNmPxbwDwD
         cHQR5d7Kwug+DS+/ueggkWJowo+dqRBJxczS028cPkUgKVvxI0vQY9azbG2DkZo9EGJj
         fyVT7jy+a+4peRFxKT8r6gqWkM/n3DLRJmG3TGVunWvh80x3glN2+rui+q00vwHGgXbV
         9gTV6OIZTq77k7vu+uVGIa70iMw0csbnQltkTu46AtCUbo2H2NxtIUMopAy6zKyi0Qrs
         IpVpjfsajxx5DzT+JK27bMVNgFmq/Jh/J/UCBiaOHcwH9/KYGnETzAmZogQ6s0lAYCFe
         C2DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=NZ8ojB3epMr7Tyu/8hlnxeFAfzZkNW7bC9iTvkDY660=;
        fh=4rHsaFhVkVMXk5u1IVZO4usPBujjRbqK1KMv0eZ+6CI=;
        b=dQcCaNRrCzS5Nt9KnqHSQjwuXp4GvZ6vt4npNCNdJN/Ymgc3atxIWMV2kOd/6YpNP+
         iwu0+P3zs9FMyGy7wbtdcil+7nMeUSDQ9xHYFlbwnpgRgxzMSL/1K15A8f2S2ploImLz
         Fkqp1fPzgyT4Z6H9GXLNKvENjy6l278mlCsq7ODwvtHiwSFbNmnC5bnGITY6m12kEvQF
         vqshM4g+nZH5KUeKyMpR70xJVZlKUoXz7ed2n8AVf9TTu6EA5/tUvv1uUV9YY+bZdGvy
         FOFZda8InvOVuoXuv2mFeyuEzcmi0zJF0Ozz2GHtF2jOSRIRpXoXH86F7mOsxD+uG2SP
         86vQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3a9d3dbsi1001967785a.518.2024.11.03.19.21.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Nov 2024 19:21:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t7neg-0005s5-18; Sun, 03 Nov 2024 22:21:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t7neU-0005rU-Ri; Sun, 03 Nov 2024 22:21:16 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t7neR-0004QT-Tv; Sun, 03 Nov 2024 22:21:13 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 4 Nov
 2024 11:21:04 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 4 Nov 2024 11:21:04 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Bin Meng <bmeng.cn@gmail.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:SD (Secure Card)" <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 0/3] Introduce a new Write Protected pin inverted property
Date: Mon, 4 Nov 2024 11:21:01 +0800
Message-ID: <20241104032104.2784183-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
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
X-TUID: nEIcGvhUoRO1

change from v1:
1. Support RTC for AST2700.
2. Support SDHCI write protected pin inverted for AST2500 and AST2600.
3. Introduce Capabilities Register 2 for SD slot 0 and 1.
4. Support create flash devices via command line for AST1030.

change from v2:
replace wp-invert with wp-inverted and fix review issues.

Jamin Lin (3):
  hw/sd/sdhci: Fix coding style
  hw/sd/sdhci: Introduce a new Write Protected pin inverted property
  hw/arm/aspeed: Invert sdhci write protected pin for AST2600 and
    AST2500 EVBs

 hw/arm/aspeed.c         |  8 +++++
 hw/sd/sdhci.c           | 70 ++++++++++++++++++++++++++++-------------
 include/hw/arm/aspeed.h |  1 +
 include/hw/sd/sdhci.h   |  5 +++
 4 files changed, 62 insertions(+), 22 deletions(-)

-- 
2.34.1

