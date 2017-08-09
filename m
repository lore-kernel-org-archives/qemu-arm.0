Received: by 10.25.221.202 with SMTP id w71csp504102lfi;
        Tue, 8 Aug 2017 23:29:20 -0700 (PDT)
X-Received: by 10.55.165.137 with SMTP id o131mr8761206qke.226.1502260160446;
        Tue, 08 Aug 2017 23:29:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502260160; cv=none;
        d=google.com; s=arc-20160816;
        b=Z7Zgv3UMDBixw1G42TChiE5Z5GwX/X4rR39q4dNQxFW/Y144ME+2qakqngeRO0VrnQ
         E7S71XtnUkESbmi1YVIHxrC1mXueHNaVVZ6ytLWrWy8XL6KDJXdOhHdVuEwlNmiZ+RWm
         GGxaBQ+IeYHfpON679NxaDJeJy8HMdX4tXLXJuSGl5ykMxPZbN4H1oCJTe05Hc7D/AeC
         F811uEb3gex4TRqi9JBWlR3vmlEan56OTvHVRE4yVNMUKtoMeba5Yhv9PYlzGz+a7VV8
         69CzDP4CXHkPekmiEQZsZ6a02H1WNWDCg7P+osxhA6nxp0U67NRaOgPdyIAA09+hqsE6
         Btng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:dkim-signature:arc-authentication-results;
        bh=nzpy4AFz5RRQ/dXQA1fozxAB2mDJVhhr2zzPzm7M/Xo=;
        b=D8Mc8XlUZRcJWOUJFut9pWVd0o1lcX+ZCYYIpcN6MJf07PZKUz17sDm99efF4UHZp7
         +h1c9MSoDDOX8dhPN0UQxJuWgXeeR7Yy/gBVeKNbXLwmWrmQ5O3RU013SvpB32ML6z7j
         uQEcL7nb7WMFaqWyiPmGL7mk51LjLq3XxqsdLzeFYE74RlfeHyi5PJW9Yh/jPtpfchsG
         GvWcVy3Z41jDCt3PJRLpQ1jqkVER7CzlmrSc6gM3gqjsXLGzElEo1J+ao0soJtHmY4EM
         iIXw6IWFFRdrGTYIL2J+KoI2aDdQzFzj78PmLQYLx1TiNN3ISNX0wksZfTBEqb0xB1ib
         o80g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=MPHAu8ds;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=MZrnyTxC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u1si2445825qku.254.2017.08.08.23.29.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Aug 2017 23:29:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=MPHAu8ds;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=MZrnyTxC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45872 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dfKUX-00063C-PI
	for alex.bennee@linaro.org; Wed, 09 Aug 2017 02:29:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37009)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dfKUR-000630-N6
	for qemu-arm@nongnu.org; Wed, 09 Aug 2017 02:29:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dfKUO-00070u-Jd
	for qemu-arm@nongnu.org; Wed, 09 Aug 2017 02:29:11 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:46559)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1dfKUO-0006yy-6P; Wed, 09 Aug 2017 02:29:08 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 593A421D8A;
	Wed,  9 Aug 2017 02:29:04 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Wed, 09 Aug 2017 02:29:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:date:from:message-id:subject:to:x-me-sender:x-me-sender
	:x-sasl-enc:x-sasl-enc; s=fm1; bh=nzpy4AFz5RRQ/dXQA1fozxAB2mDJVh
	hr2zzPzm7M/Xo=; b=MPHAu8dsYvjRXQ4uGHBbGcUMgqw17THOSP14TI9vt71/yP
	bjZq/eA7WLNNvRq2lk3t5pf32bDnJrsL+U9IYGkX4GfYEENM1AGEtiwSxj5YZOEy
	bvXZMAHkuzcURaxaDx7FBfVU5oK3haP7e3r7hQ6JOY8X+8KWcFAGP7dm8F5adxZE
	43hBxM0msoOR3u+DGt0YAJNJViSk6eOUyo8XYxwv/plrVhi+bhoXY8BFVti/99bL
	LCQL+wJhiWnICjrWhHqorih4PCJlRvIAbRxwSX8M1Sh7KKo/XgbkMn1FdPNueorh
	t4+o3+rZyOw1T3l6DMRYZxWVdsg0ZDim4CMFf7fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=nzpy4A
	Fz5RRQ/dXQA1fozxAB2mDJVhhr2zzPzm7M/Xo=; b=MZrnyTxCMDs42zcBST8aUr
	dxu0DhXV7oHZQc5wctzS5F+frdfLDDsnVgK47Oshe+em1zNVNu52RohmlUDxLGI7
	dZXdgiY6p8jDzcHYI0bUuSwrMffZ6s8t1hpTikwar0oRnus7r2WgaC+WX8/HZlLU
	YeV0K7TIWeKtyuDPJbIug2f1/cM0O+hEI185e8z9tfCpgYU8i0FGyH7rfmwYWeBc
	rIOj2ZsUry9QX+Ka5xr1UM9QJgV0xCeUawYb8Dtf3Tu6Ex/WFp5l2iZKVt7PJ0+l
	KrGXhMmfmWxxEFnmLURMyPmLoSaWjyZ4++Yacobev1Q1IFx21uzTSyafLrg1BDgA
	==
X-ME-Sender: <xms:sKuKWfWLSN2Yodx2hIbqNUuy0RX9w3eNA44oYD6KNPtBn3v8ZSfn_g>
X-Sasl-enc: AkqOGMNDlu4TbWKUtakKVm0+GpfI7Nzz9d0jmpw2a3VG 1502260143
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7A0DB7E73B;
	Wed,  9 Aug 2017 02:29:00 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Date: Wed,  9 Aug 2017 15:58:25 +0930
Message-Id: <20170809062828.3673-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.25
Subject: [Qemu-arm] [PATCH for 2.11 v2 0/2] wdt_aspeed: Support reset width
 patterns
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
Cc: peter.maydell@linaro.org, ryan_chen@aspeedtech.com,
	Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
	f4bug@amsat.org, qemu-devel@nongnu.org, joel@jms.id.au, clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yEut5Vl1GFDr

Hello,

These two patches add support for the reset width configuration register in the
Aspeed watchdog. Initially this was just one patch[1], but I've reworked it as
two to explicitly support the varying capabilities between Aspeed SoC versions.

Andrew

[1] http://patchwork.ozlabs.org/patch/796039/

Andrew Jeffery (2):
  watchdog: wdt_aspeed: Add support for the reset width register
  aspeed_soc: Propagate silicon-rev to watchdog

 hw/arm/aspeed_soc.c              |  2 +
 hw/watchdog/wdt_aspeed.c         | 93 +++++++++++++++++++++++++++++++++++-----
 include/hw/watchdog/wdt_aspeed.h |  2 +
 3 files changed, 86 insertions(+), 11 deletions(-)

-- 
2.11.0

