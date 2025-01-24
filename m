Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp559248njk;
        Thu, 23 Jan 2025 19:03:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXazxwmtBgHzev6ZsQXkw7TLPY5iPyUb76pS9YJ8fbMsHM7P6QRTs7hzGJOoAuS2sOTsd7iMeqBqG2wpQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE+APf7PlQUnsD8ebe6MZBIBBLeayHXauin4fLSDem72/S8z2XDHLQwN+zCY1Pe6In12KrR
X-Received: by 2002:a05:620a:28c3:b0:7b6:dac1:cb80 with SMTP id af79cd13be357-7be6325c667mr4009521285a.58.1737687806914;
        Thu, 23 Jan 2025 19:03:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737687806; cv=none;
        d=google.com; s=arc-20240605;
        b=NyIqKJtgHuQO/sxDkuxNoExeJRcNZPuVoqOSNp4KjDJPkxvAC95+quNTIj8gd1YHM9
         n6GAo+fa9X0ethZGiK2gKR0MTJOBnMG4IM7EyXy73HVQ7+rEFV3ZgFAQPvMVokGIfuR4
         KC613eZ0DjtUyRyoFf+C+Yyroi07edjK2P4QJGdr/0BteZz1vSwtdXn6QVrDsKt6YUMs
         B/kl5+gJpyWnrQHDe3aioQ7ArgJnho8FN8AEV5jkiC9rJJrMZAWonkx9oHl0/i37Z7IN
         ZmkwKViLcym1HXo1ZWZZ2clDBNqi9P+e8cFA5BjELNtp29lyW0OyQPVATiKN+hN9A7HG
         hWPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=/nHw/8VGwJZ385WE+N/K6tK20flKjGJRKGA/5jZzboI=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=fEjdhJncFQAClPZKSi6Ni6XFj1ax7KnsPvZ8MVsj75Q6et4KOmQaNKFdm+wdqSz/+B
         dc2o7ioQ8/4P/o+/5WTQKqnU3eVxAV4oq6aSxhgBjERnJvdnD4RZShdfAuNfhv1Xagqz
         1OEqwx5uibLB3OW57aBWgTVGER0VRbN7msoKaJqObNI64Z6Qhbe7asEljV3rFezZciFs
         OIKFZRyJS60Zpgy8ufQwwBXri6aw+HCPEFLlcsAxMC66xB3voGYDwxVMRh9wztWkNSRo
         mhPOVh2jKujm436ZSEfzFx5EgneCKm7AJFjPWIv9ogPq1+Ps2qWltOVE3OS0cGprHxyq
         nt6g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9ae81a06si122353085a.80.2025.01.23.19.03.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2025 19:03:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tb9yH-0000u3-HV; Thu, 23 Jan 2025 22:03:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tb9yE-0000to-Vk; Thu, 23 Jan 2025 22:02:59 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tb9yC-0007tm-Tw; Thu, 23 Jan 2025 22:02:58 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 24 Jan
 2025 11:02:49 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 24 Jan 2025 11:02:49 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 0/2] wdt/aspeed: Support software reset mode for AST2600
Date: Fri, 24 Jan 2025 11:02:47 +0800
Message-ID: <20250124030249.1706996-1-jamin_lin@aspeedtech.com>
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
X-TUID: GpPuzTo9J9Qx

v1:
  Support software reset mode for AST2600
v2:
  Change to validate WDT_CTRL_RESET_MODE_SOC

Jamin Lin (2):
  aspeed/wdt: Fix coding style
  aspeed/wdt: Support software reset mode for AST2600

 hw/watchdog/wdt_aspeed.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

-- 
2.34.1

