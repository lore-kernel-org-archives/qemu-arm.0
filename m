Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp894484wrt;
        Fri, 25 Jan 2019 16:32:22 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7LvoAsxxPpu8O8KekxWWD1A4JJja2Y/2XohLbXAT+wM61tC4f/hqTK94NbGR3hK3t7NQiZ
X-Received: by 2002:a1c:5604:: with SMTP id k4mr8304020wmb.107.1548462741979;
        Fri, 25 Jan 2019 16:32:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548462741; cv=none;
        d=google.com; s=arc-20160816;
        b=WKZ466/Q8kZA2pIIq8KkHU2+9Tyo4U3eoBlsxyG2TcciX53zTwK3oBjWITt8NVHbNq
         Dw4l3koLu9XGKQEF90NXJJWR/UJq0rcGTGCjuH3ygio8GI7/15cuQ+9Tvu07Pu/JEjSt
         0RaCDYa4ua6JEvpWMvxCZkuqd8Rtx07V/u5z5h2xdZjQaguWf5R4U8KQtmVnKaEaHcmh
         2hunMEzwZQD5tsUrMUYbjdyMPLNEY5c+m1vtwc+oTAajTpbK8Ru9ZpQ8ciIbjGbGXwMA
         NyH/nITEvSrEiPoaD/ppc/LbBudsXGMMDCF3dzYxVkvS5Gvn8itiMeApLqBptD+ddl6W
         ox5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=vS87ahWQRr45bG7lB5yHz+WcbmFkIo7x4cizuGwWvrw=;
        b=yDZd34J3qjFsY6EjXeOeseFFaQ/xVBrs9YP5jU2iEXOnSupsXe6g3gvLUNSzVnRr+Q
         oUCcsTXymmB+YBGbLU8KTBtLFMRdexk8a+Eqd4QKHHSX8PvvI2J7aEimC0LUgfm1QxXm
         M/G/dRVrycOgHK9j+AF+HKHMDAb8AIeWswEiv9Jcs6bumtH1xtRxOcyCQaUylBT96PL9
         hmNId+T5BP7pocF4sfToA4wLfFweo+d+WmnFg7hqAW4DpBHFO3lIKzHYecRU3Aa1Qm54
         f399xIwBN633SP9az16CbMJhNkm2weNYwTjBi/w9SjDqnZEgqA9Fqu1OAoPtAl4N5BBC
         wtgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LzT5Nf2Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s20si55141940wrg.424.2019.01.25.16.32.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 16:32:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LzT5Nf2Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:53019 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnBtV-00050Q-2v
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 19:32:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40751)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnBtF-000504-PP
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 19:32:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnBtF-0007VP-4z
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 19:32:05 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:38021)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gnBtE-0007Ut-UC
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 19:32:05 -0500
Received: by mail-pl1-x641.google.com with SMTP id e5so5288739plb.5
	for <qemu-arm@nongnu.org>; Fri, 25 Jan 2019 16:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=vS87ahWQRr45bG7lB5yHz+WcbmFkIo7x4cizuGwWvrw=;
	b=LzT5Nf2QUkbB/DWQbfqXJbORhS8ziLgpd4UFuSnT9g/+lU+9NJKarv/Napoe8vCmW8
	NnkyeFS2jkqfvWlcn/MquUQV7LVTOKdGeyWRpbXYF2763QtVsNpxrnz5owm/aNCP/a5M
	NiAxIS2zA88hz/yZFPMpPHGNLTFX/apdLImoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vS87ahWQRr45bG7lB5yHz+WcbmFkIo7x4cizuGwWvrw=;
	b=Ki8hdMmHy2nQKB0i0hUgY+PN1qBaqe4oST1ofsOy5yr2EQrE9/hz8bBMPjmihqH9Va
	26UIItZl6HMdd6+OuTtgQ77cAvtAdKC/XsLzGDP1nBZemAqEBTy8pLWPK1ET1bJ7gBDT
	uvDc+Sehjj1rOqXjyumw9Vf3cu3l6dXkuRpnEISrXbVlzu2vt75A/P6wQL478HJ/VKU7
	S3jDT3liy46MKP9ZSapec5Wco6hBdplIBqkZjYxP1nB/QNf+ztjh7Ap6yGP78FY9/bEt
	cuqiJufrIebVUQ8Y4yI5p3DA+a5ucAmFsbULyqTzMf7jH/BmQDrLXUPHDmJ9Xr3s8GyF
	EXuA==
X-Gm-Message-State: AJcUukc2i03ay+QQ7dtu85pL58YEdEm63m4bnPNjM2qZq4RsojF6ELjc
	9gqGfn9VWiHOK5iUxw8ykIwj9A==
X-Received: by 2002:a17:902:6acc:: with SMTP id
	i12mr12861897plt.148.1548462723811; 
	Fri, 25 Jan 2019 16:32:03 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157]) by smtp.gmail.com with ESMTPSA id
	f64sm86774911pfh.0.2019.01.25.16.32.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 16:32:03 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <99e500e6-d839-6870-7737-65487887b474@linaro.org>
Date: Fri, 25 Jan 2019 16:32:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 14/23] iotkit-sysinfo: Make
 SYS_VERSION and SYS_CONFIG configurable
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5V+xKk4hhBc8

On 1/21/19 10:51 AM, Peter Maydell wrote:
> The SYS_VERSION and SYS_CONFIG register values differ between the
> IoTKit and SSE-200. Make them configurable via QOM properties rather
> than hard-coded, and set them appropriately in the ARMSSE code that
> instantiates the IOTKIT_SYSINFO device.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/misc/iotkit-sysinfo.h |  6 ++++
>  hw/arm/armsse.c                  | 51 ++++++++++++++++++++++++++++++++
>  hw/misc/iotkit-sysinfo.c         | 15 ++++++++--
>  3 files changed, 70 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


