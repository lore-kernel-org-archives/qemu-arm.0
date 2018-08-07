Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3916165wru;
        Tue, 7 Aug 2018 00:58:23 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyNqVF0a6FtNeYGIuhjydoapCniWZv3xwWU6uhnNgbIGGlKtRH0U9dzeP2Zj4DBRlKfXVQ6
X-Received: by 2002:ac8:4504:: with SMTP id q4-v6mr5535127qtn.1.1533628703500;
        Tue, 07 Aug 2018 00:58:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533628703; cv=none;
        d=google.com; s=arc-20160816;
        b=K4jGWi6MGsDINWS8rIm4c1w5MjgRmHu8K3nOEIKsoh3uX+kEB8IpRH0vxzAGDHXiDe
         Id61o5pziSddfDbQozXwi9nd4Bgqc13nBrKOhXGJ2CrHxoE881DB+QO5/yWrwCNPy/vY
         n4vQydw2aJtov4UnLqqsK6S1EORfBXFYHKfnnLpLVw7N7PK+YW+12kFZCBIlF95uzjtF
         tNA1bTbOrkKcDJWdhvimkdaI5higIKQ8Qt4c4Pw6CO9x/lVeWY+QMcRkoZp8CisfOMHa
         pwteGbSr7780zCm8rwerkmHvYlLr6GjNdrh79Tkmkw0WyHEAUi7Irmr1x0Ftw1nSOA63
         dj4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=ijkYyIcGZoDN9KNpHJIsfMlyeIqXEf01+jkVbcGqo+Y=;
        b=LdD7+sQgGff4j3uEB3yTat+oWdRWNtzEg2MsZudt0y8cjZalo+wBAhkhf0WpCHOEoF
         Kc+jgJvZerfxnLv6AFv2EZ/4oZe7VE9jg5hcDuXe4DQxS/bs+sn/L+t686RGlsWv7JsR
         f1q0NKcDwrmJpjcXBCem4gYQmLYhcW22jAx80NKy6Tb/qk8oC0x30nTnok2MdVjUieiV
         vA0qTa1QhhIxUEvwn0cJwUt56o+OFsE2CnSB09f/5c4MgNK1XBOgvLLuEMXpTJItFM0k
         0AbuV5OQUKWP50t+hcL0l6M6RETVcVr55A9itw5kZOCVcYm8nEJZRwjlI7m334Wogzgy
         FTvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YxyLKnBs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x45-v6si707007qtk.32.2018.08.07.00.58.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 00:58:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YxyLKnBs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37798 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmwso-0002TC-Vx
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 03:58:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fmwsd-0002T4-Hi
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 03:58:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fmwsY-0005RC-MV
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 03:58:11 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:39860)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fmwsY-0005Qy-FX; Tue, 07 Aug 2018 03:58:06 -0400
Received: by mail-pg1-x544.google.com with SMTP id a11-v6so7452086pgw.6;
	Tue, 07 Aug 2018 00:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ijkYyIcGZoDN9KNpHJIsfMlyeIqXEf01+jkVbcGqo+Y=;
	b=YxyLKnBsdmJxhP+SUDaOZc8r27IXiuQru3JJEnvjcg38hPn1X9f2pD1iz0dltmyZ8/
	YMPiB0D/mqQXl9zfC/4stMWcwTAWnB3MWmHObFyc4deXQIMd+osTA0BVw89JwMz1GC6H
	1UlHSS8LYnlmJNd/xZ/E+1kWnwhtI9zZ7lwUXPPKWW6n7VCvTEroFQkiIResXEerxZrs
	MhlTrNHR3+fkC9QOT0zCwL93RSukqjpRGKBonSp1FheKoG9VuvXcsKJ/COlRZLw5G41p
	JgUMH8iGoUUU5Q3vP9uPUfk12Z+YR4NuNY3lrbwQXWYBh4QcxGezFlnqiN9L0AVCAv/c
	xf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=ijkYyIcGZoDN9KNpHJIsfMlyeIqXEf01+jkVbcGqo+Y=;
	b=igOyDOSUUY8cQeFeOS4hYcjVpTXc1Fd/9frBK4hO2qgkwvmcRAfy6kdhuM4vjSnexA
	HuSHWaJVt1ygUWy0TGiwXaW6foZ1aONc65Jp5EMs+HHc+qEIiZDThQlZ30HP43sSNKn5
	NUkS8uSIlkaw3EcPdbJz/1V25Mp5hmEZoM2NjHsPa2jDbYx8GUtsI8mxnFnJ+AnHVGF6
	yuPsbvRuFU+RGrfkwKV1Yveev1qBM2lxpKJ+JMDghCN9cpDXLCidTClzxPu8GoWwVRr4
	fklrAcb5B4gE2F8j+ygLpprq/lO9BI3valWaq4yKy4Mud9Nz/ZvBnFSDYcTPCgR68Lvm
	YeEQ==
X-Gm-Message-State: AOUpUlFXcSvGBut5mYmIDoqKVX2O78+mQ5ebfFY11CEp59pyB5odsy6d
	mGLimIufNVtEZMATFyVSsFc=
X-Received: by 2002:a62:dbc5:: with SMTP id
	f188-v6mr12671164pfg.182.1533628685137; 
	Tue, 07 Aug 2018 00:58:05 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	d19-v6sm2677782pfm.48.2018.08.07.00.58.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 Aug 2018 00:58:04 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Tue, 07 Aug 2018 17:27:57 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Date: Tue,  7 Aug 2018 17:27:50 +0930
Message-Id: <20180807075757.7242-1-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-arm] [PATCH 0/7] arm: aspeed: Extend SDRAM controller
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nXSI2Uk2paTW

This series allow us to run upstream u-boot on the ast2500-evb model.
They have been tested with upstream u-boot, as well as openbmc's ast2500
and ast2500 images.

Cédric Le Goater (1):
  aspeed: add a max_ram_size property to the memory controller

Joel Stanley (6):
  aspeed_sdmc: Extend number of valid registers
  aspeed_sdmc: Fix saved values
  aspeed_sdmc: Set 'cache initial sequence' always true
  aspeed_sdmc: Init status alwlays idle
  aspeed_sdmc: Handle ECC training
  aspeed: Link SCU to the watchdog

 hw/arm/aspeed.c                  | 31 ++++++++++++++++++
 hw/arm/aspeed_soc.c              |  4 +++
 hw/misc/aspeed_sdmc.c            | 55 +++++++++++++++++++++-----------
 hw/watchdog/wdt_aspeed.c         | 20 ++++++++++++
 include/hw/misc/aspeed_sdmc.h    |  4 ++-
 include/hw/watchdog/wdt_aspeed.h |  1 +
 6 files changed, 95 insertions(+), 20 deletions(-)

-- 
2.17.1

