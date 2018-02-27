Received: by 10.28.71.27 with SMTP id u27csp4851717wma;
        Tue, 27 Feb 2018 06:00:12 -0800 (PST)
X-Google-Smtp-Source: AG47ELsoAZ5gPni5IUPyHlUbtQPY26iMNbJ2c83aEtV37wrG3uqI7qlHLmlWUxM2Lxm0qK2kywN4
X-Received: by 2002:a25:905:: with SMTP id 5-v6mr9210090ybj.397.1519740012126;
        Tue, 27 Feb 2018 06:00:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519740012; cv=none;
        d=google.com; s=arc-20160816;
        b=ZP7l2mKwFFJLvkGcflA2lPtkSJYdDgPwWToqLbYyL+YbbzZnFLIWVWew2+uVKwYtdJ
         jBS2t2+AdSZmE8d36rLAbnLbMO4RS+U89UhyRtPaoPvijEVedrwDTERIfp23Qi72G8ED
         jIXxHp4NWnaoQoU8qvkm5RinTcLu51VM0WwSjoGWZoIswB3im+Muj7B2J1tQFNQBXopl
         wKy5eVhL002MgAvXHj4cqXOx1Qte5Fxc9SpDIl4RSXMqe5EaAP6gntEfmCY3fo7ZTd1Z
         xAqeGCHD8ZPz8JFRLED1oUpI/BpGMImwu6ooy0HCkPCPVSr0UEpCl2Cgj41Q2qJIgXUo
         p3Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=9Woq5h2DyksaIqb9mKEwGER/yYzlxLBfR3tMph4KeUk=;
        b=Y2V5BVTFIpPzgI9Nbwkot61fKgU5cgQTCNwHJrPqJ5tz0gxZtl0awN5ZOQx3HRgDLx
         bSIp0jbx35MNyv0hIuLFYS0gvHHiPj8uUlVRxAwCHGPmNcpcu1uEODaKGHSRX+gYEZIk
         Xmzv7dOXDIIFW470Ea8scZylIKgi6/A12zZks6tjsfk8I6qiDr9hiUbuwFU5dLMANBWZ
         iLiUxhcJ71bckigr2NrsHmyGZ3ONPxSFlrACYpIolde4dSw3/1cm2AJFlFu+syAJ2mpf
         7qxVzpK3km+L/OfF95xNWIGPeKfpR2Zk16LoU+GgdtzNzCVX5e8ajHzk2u1HUEicSI+T
         CHFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PZlGpBux;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l25si1922301ywk.294.2018.02.27.06.00.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 06:00:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PZlGpBux;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37321 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqfnf-0002T7-Ig
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 09:00:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqfnU-0002PX-5a
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 09:00:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqfnT-0007e5-HO
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 09:00:00 -0500
Received: from mail-ot0-x232.google.com ([2607:f8b0:4003:c0f::232]:39262)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqfnT-0007ds-Bj
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 08:59:59 -0500
Received: by mail-ot0-x232.google.com with SMTP id h8so3826200oti.6
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 05:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9Woq5h2DyksaIqb9mKEwGER/yYzlxLBfR3tMph4KeUk=;
	b=PZlGpBuxMm7AIEtZ1EZD5qY5pq1qxyk0ofXek2vy9NE+NWaku1Lvz19zaQ2Nu5TVB2
	UxAon/qgkeH8jtaor5EAksO3nEmi+UmfSV/PYUPtodjLsBHziPg+V4oGj3TObRUf+A7M
	dJxE3u8SUvb7zhtajIqdrTyFiiRgklqO9SBt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9Woq5h2DyksaIqb9mKEwGER/yYzlxLBfR3tMph4KeUk=;
	b=gWAwHhVrzssD2+ApRRSH7VZntzHTUr69JV+aeHGNCup3eiCMblSvNMDRdfypTg19e9
	ljcqpKC9bArZ4OF5VsrBtemDBjFFUxFKemZaqg/125qXeL3rznWzAEJOjHM7ZPtJvdPS
	lP0/qZmvRzF515JwVRwWTi7fzrisZPkszj865U1qaH1MsftRJujW4C6w5nAfAGqoR1Ea
	SIj89Mf0USc+FGHkS0zz4l8nLgWrWp09mDYaPph+MkLgm7vwhU3ELgtf+K33JLvgWSCJ
	KJ9oTzl+gUxUgUWoxvssfXsN6FWs/m2+EHzjdty7e7u1nvMTlpG/aWhYmgkWSxG4af5f
	0Z0A==
X-Gm-Message-State: APf1xPAJwUk3X+GZi9+7jiSIeNd2s1SpF5XSxjAUldAxZ5erf9ul9ikt
	kIX0mgoIz8slVNYYUxaESEBTkUWXUtlXFvNa5LKdfQ==
X-Received: by 10.157.3.70 with SMTP id 64mr9960404otv.258.1519739998530; Tue,
	27 Feb 2018 05:59:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 05:59:38 -0800 (PST)
In-Reply-To: <20180217182323.25885-51-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-51-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 13:59:38 +0000
Message-ID: <CAFEAcA8R4AXDfj8rwM8Cnw8G=4aDuFbdwFRrGx4g5s-GRWw4qw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::232
Subject: Re: [Qemu-arm] [PATCH v2 50/67] target/arm: Implement SVE Floating
 Point Accumulating Reduction Group
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZvzUKeKMxVsl

On 17 February 2018 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  7 ++++++
>  target/arm/sve_helper.c    | 56 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 42 ++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      |  5 +++++
>  4 files changed, 110 insertions(+)
>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
