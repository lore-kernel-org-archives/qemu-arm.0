Received: by 2002:a05:7022:6a3:b0:92:a90b:6588 with SMTP id y35csp63220dly;
        Thu, 23 Jan 2025 00:19:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWQAMdFbEza4em8P4wSD9Zrruk1eTBnY7EEHfM6xetyq6NRyWjOP1vKGeIenDZYPd2ZufRN9VPQlk8wFQ==@linaro.org
X-Google-Smtp-Source: AGHT+IES57zuN4On5wUSG+cAwXhynYEukaAGi9rLZrU4QfvS0SNvk1zOrYZQLaOC5RiZgl02zhvZ
X-Received: by 2002:a05:6214:5004:b0:6df:8112:3e48 with SMTP id 6a1803df08f44-6e1b220e3a7mr456314026d6.36.1737620398900;
        Thu, 23 Jan 2025 00:19:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737620398; cv=none;
        d=google.com; s=arc-20240605;
        b=XVdYVZ6n0hfH9uKJLRQzFllsGnleZCLgDVRDjTH1MeMDyH9tYkUq+x1Rz54o0six5x
         Mstvipk/+8TC7fFzNRD1Ahk9n2J4rltJcd/687r7JDZq8VNxk4ZyU+BlGY7iMBHTUkVW
         0ilrvR7rZrUX2f6qGQMGSOAFrkN5DQYczQLswxbzcOk8oY8CxYSGol/P4T8xLetaSCJ0
         syMj+avDrYz8RG+X9oDaO4y4Wl86N83jVbf5WexU5upm9KsnFPtljNir5AncSZp8sYBk
         c0oxtFbBgZG/I2Azmbz0wzBjxKC/sD9Ck+8C62DTxf/7HMcJsGz3TpKiyzTLSPQWpuQm
         0Giw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=cZXKeKwMAi6dzna5jhkzbPD6i21l6k+ETn5znSC8J8U=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=FCDdfQt2XBfkRNNx+YYL6d/2zuVOL3jPxRPrzIod/hm3WixLGPEs8CAQnMw2fZ3Zzy
         p2x9bcrtzYU9YstRhZc2fV9Xjf1hWhiEo4/R13bmVE99cU3m31aFkct/FGeagMCaiLOU
         de039rlEgCG+BVQ6YVSt0qQP+Mwn4htOnNlmdq2QXoLgnTkDqBW+50l/8aoh3jeiD/Y1
         7nvpyeMVLEPczy8zC1k1QAL5EbS7tSC1JSLYZJoyY69KMY88ZhFxHts5QO+NgujJpUA5
         EOUJMHUU8O/3ozUGkiUP71aTOOtvqq2BososX6BGVteFnw5M3bcado9vrrUOQge2exYI
         Qq4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e10305c7esi166144251cf.165.2025.01.23.00.19.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2025 00:19:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tasQp-0005He-0S; Thu, 23 Jan 2025 03:19:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tasQm-0005Gj-3Q; Thu, 23 Jan 2025 03:19:16 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tasQk-0002Qj-1q; Thu, 23 Jan 2025 03:19:15 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 23 Jan
 2025 16:19:01 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 23 Jan 2025 16:19:01 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 0/2] wdt/aspeed: Support software reset mode for AST2600
Date: Thu, 23 Jan 2025 16:18:59 +0800
Message-ID: <20250123081901.2688471-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
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
X-TUID: JnB/09eJnjMZ

v1:
  Support software reset mode for AST2600 

Jamin Lin (2):
  aspeed/wdt: Fix coding style
  aspeed/wdt: Support software reset mode for AST2600

 hw/watchdog/wdt_aspeed.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

-- 
2.34.1

