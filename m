Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp83121ejh;
        Thu, 25 Aug 2022 02:02:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4AQ0O8WIUEFByb6C8DYZK761vLDGMIUUhz2KtdLVCD4Q+8a2hTf8hdAKKea0FgGxsDgB/n
X-Received: by 2002:ac8:5a49:0:b0:343:6d5a:43ba with SMTP id o9-20020ac85a49000000b003436d5a43bamr2676143qta.63.1661418179195;
        Thu, 25 Aug 2022 02:02:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661418179; cv=none;
        d=google.com; s=arc-20160816;
        b=zbvilcIc/fzRqxUuBoowA9nI2WAkQl8dK1nEniuVgz0tMXK3gqVIjS2GoYTsjOi0ZD
         ysF6MXQCplecIFDxaKbJD9NG2/14xkWuwDyUG/PXcFbYnGnLKk6oTwKa0VfybujUNB0i
         2jAP6yEgtCBHC2NPlAJhLmE/953Cx32D6uQL9iUSzTtVobjk+cSJVUI0v2ycgnUrrDlo
         +KKU5meJSsO/MIGyO3CvDZ1RTxHUmTS6sXbt2TDjXzsxjCT3b9lsBOBIJjnGTYDJSoOL
         TRiKU2S3rfECYADCDMQRAKwkZlD9Yv/oWPtBQJ+I/mDjifpcz29XiqSI5GetxKvwBZHl
         oTQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=EtKLXe9WmUFOAmoqu8MYXyZ+r2XcTXAeiWCXCZ5wFc4=;
        b=JAoD4sQw8PbP4/hfG1V+sdi6dkM+GiQzMGnX0SLCbXnpFUu7T7S2uDrEYtbzeUOncA
         Leuj1pog3WXWjIfl+pW03ZyVj1HcFxg7pUa9EvPJmXeUy7dk5adghkD/+e5v/YuZLP2L
         H1bI5pO/nqn1fNz2wUg/z7jz+iKOm9muchtMz0P3nf9mnUIYW1cbGkbU2kQiQlzgs0qn
         +W7WqQ5Pt0hksOVHbIbXdxcX8j8S37SaTUxpwzRtA4IvjUS01xG/g+Q4Voqcirium2EA
         Hr60a3+ZZH7GC74OAaHT5bXG92AWJ+ZVKlk85/GWQPngnLkD+/nNdSUo8jKd0JF/XCZp
         9V+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9-20020ac85649000000b003436ed07723si8191933qtt.261.2022.08.25.02.02.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Aug 2022 02:02:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oR8lN-0005a8-Ld
	for alex.bennee@linaro.org; Thu, 25 Aug 2022 05:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=RIc8=Y5=kaod.org=clg@ozlabs.org>)
 id 1oR8g9-0002aK-Fr; Thu, 25 Aug 2022 04:57:33 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:45791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=RIc8=Y5=kaod.org=clg@ozlabs.org>)
 id 1oR8g7-0003EY-Ap; Thu, 25 Aug 2022 04:57:33 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MCxg31tV7z4xDn;
 Thu, 25 Aug 2022 18:57:19 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MCxg03Qnhz4x1G;
 Thu, 25 Aug 2022 18:57:16 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL for-7.1 0/1] aspeed queue
Date: Thu, 25 Aug 2022 10:57:09 +0200
Message-Id: <20220825085710.34800-1-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=RIc8=Y5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gUn/Dz2eYRvJ

The following changes since commit 9a99f964b152f8095949bbddca7841744ad418da:

  Update version for v7.1.0-rc4 release (2022-08-24 19:27:56 -0700)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20220825

for you to fetch changes up to 7ccff968f65cfad573bc0015cb0ab800d4337a6e:

  hw/i2c/aspeed: Fix old reg slave receive (2022-08-25 10:46:42 +0200)

----------------------------------------------------------------
Aspeed queue:

* hw/i2c/aspeed: Fix old reg slave receive

----------------------------------------------------------------
Peter Delevoryas (1):
      hw/i2c/aspeed: Fix old reg slave receive

 include/hw/i2c/aspeed_i2c.h | 1 +
 hw/i2c/aspeed_i2c.c         | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)
