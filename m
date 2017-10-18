Received: by 10.223.197.9 with SMTP id q9csp6147282wrf;
        Wed, 18 Oct 2017 15:05:28 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QqN5nrf+eElS6+C/ZTbS2GSCgxTBHcJWQ5ZIsGBocBGkGtKJrp5m6BcbuqOXrCrPoGP90C
X-Received: by 10.237.53.198 with SMTP id d6mr5215034qte.20.1508364328557;
        Wed, 18 Oct 2017 15:05:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508364328; cv=none;
        d=google.com; s=arc-20160816;
        b=bS2YUtn4bJt4HDQNrAymFg2qmUZqCE2Uk/YdVYuJEbTdBt+9EaeOShNpAVJafWc0Hn
         X+tQoX9K2UL7kuzXKH0uigyG08ba/yopXWxzrkIHLUnsn49JW4epJcmlME/AlCJrhFzx
         NgOHkyjilG/V1hi25C4sb3xBqRTr3yAyRJw1IuH7246tVdaf7QMCkg5QIA8nIq1k9LHS
         GokbLRyOsoDRRupJG/7Z+i/7blaGu5ZBz/QuUzD41VXWfk9r2Jet6UPj0PT/TMs6m/k0
         7KUSzAcpqazYJTE8qtPEvNOukO5PmOGo99K7Qoq7e1pe/O4805XGNgnCSG/j9DDEV71t
         dLOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:to:from:date:dmarc-filter:arc-authentication-results;
        bh=PXDGJs77CMsdMxXY8y3iB0Oi1lEpPSgeBFz2qgVBBGI=;
        b=Xhsf/HN2fUpUENiPQ/3ntidQVOiUbuePvZw2bZMRBf8jP7qS5U8OyDtUysLandgmms
         d4xNbYR0wxqqS2HnzmQVGqFR3eD2rAWtsXSEuSWRVSz7JX6ShbNGkPNn+crQB5MqYe7A
         f8kI2UMKzbcdTw7PC9fT2yWDI20FYHaEOEpucVOzAuLYQJtta6ZQvuS6Lo2/ePhDCPks
         qKJv7Uw5cw1ScZCEfTbaoNQJOQx/VXmtz+COoUsXK0SLXdF/Tu6YYxxvCyXfUYAiMwF/
         gZJMKibPT3gf+09gSI5B4T88xkD13xJF436tPhdhvirx/HC07nvmv0BhWp6BQLlVs7y1
         rq/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q1si2100787qti.374.2017.10.18.15.05.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 18 Oct 2017 15:05:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46681 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4wSs-0002kI-C9
	for alex.bennee@linaro.org; Wed, 18 Oct 2017 18:05:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e4wQd-0001Dm-L1
	for qemu-arm@nongnu.org; Wed, 18 Oct 2017 18:03:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e4wQa-00056x-Ii
	for qemu-arm@nongnu.org; Wed, 18 Oct 2017 18:03:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:37548)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sstabellini@kernel.org>)
	id 1e4wQa-00055Q-CW; Wed, 18 Oct 2017 18:03:04 -0400
Received: from [10.149.184.130] (162-198-228-33.lightspeed.wlfrct.sbcglobal.net
	[162.198.228.33])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E6F3C20C01;
	Wed, 18 Oct 2017 22:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6F3C20C01
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org;
	spf=none smtp.mailfrom=sstabellini@kernel.org
Date: Wed, 18 Oct 2017 15:03:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: peter.maydell@linaro.org
Message-ID: <alpine.DEB.2.10.1710181439060.27209@sstabellini-ThinkPad-X260>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: [Qemu-arm] [PATCH] fix WFI/WFE length in syndrome register
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
Cc: qemu-arm@nongnu.org, sstabellini@kernel.org, qemu-devel@nongnu.org,
	julien.grall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RsX5oG3CQGAA

WFI/E are 4 bytes long: set ARM_EL_IL_SHIFT in the syndrome.

Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 1f6efef..cf8c966 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -398,6 +398,7 @@ static inline uint32_t syn_breakpoint(int same_el)
 static inline uint32_t syn_wfx(int cv, int cond, int ti)
 {
     return (EC_WFX_TRAP << ARM_EL_EC_SHIFT) |
+           (1 << ARM_EL_IL_SHIFT) |
            (cv << 24) | (cond << 20) | ti;
 }
 
