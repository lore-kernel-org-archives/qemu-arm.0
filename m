Received: by 10.223.150.237 with SMTP id u100csp2343500wrb;
        Mon, 13 Nov 2017 03:31:20 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZE4O+OS82uH323kHHQl1OxYWdpdkVywoV0WN2eXof/+g6R+PuSVTfakbUm6C1XM/vQtY7h
X-Received: by 10.129.121.17 with SMTP id u17mr5416471ywc.342.1510572680550;
        Mon, 13 Nov 2017 03:31:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510572680; cv=none;
        d=google.com; s=arc-20160816;
        b=Y1hvR2GCOBRUZ3bCjpFfvodD9MqvgIA7ib8TRcPp7o2+iYLdaTEbOCiR6INUHBh2en
         oSvqDy00ASPOFKgXS4RyW9KF3ABSiY2aMTt7zrgnpnrPe9CyfZvFDC+iAeNupju66npl
         s3izkAjNFxXe90uQbFl5K7JZMzTBGWCoVwEgaurm6owwEl6Z89N/FWYBfUWrmTxhzydY
         0qSEuoBdMg0IKU+F1sxlWtLxDZ5ft25m/GfDc0fitt14P0jqFfeu22IN8E29o/4oDRmX
         8UoRsYdGhrDaly6D8iunpqZ4HME0+ohga7dOE9ZNVDF2KSguvQHc4wztDSmvUg5+YWYV
         7Y7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=jaAXzCyQuTltRvhhebMmvBeCy21DDkshyO0oCpm9QVo=;
        b=ivrOkA3tmm6pGCkg8SNDTOjYalbZd68HIa88o7X+3+07YwK9RCTLqUlYrjv6hBYOBZ
         l5MXsO3aZKos1WX2ugKttUnvkx/LIoGKNWLJsaoBhGmcgcB+RXt0PjzaSR+xNlUDP3sp
         vY6YFiLQsB6uSFWQUnIOMQ5GmdHuqGQgPMc5DUJDl/Hxjp7f8WdF2NDZ89hvmmbl4MD2
         ZTNR+kMuNm2Al6x/9XYNGp8phYDPOqVsxHxj2JZZ5Ij8x1OK8IOAhAQYXXSaRAH/ukjC
         apY+jBYaMFsMTLpvkcolXIPh4k6xOireGQ9lkH25rsexu3wpgASBv+XR4XU5V7fnyyP2
         +Y/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R97vOV12;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x3si3545754ybb.830.2017.11.13.03.31.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Nov 2017 03:31:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R97vOV12;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53694 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eECxU-0003l2-0d
	for alex.bennee@linaro.org; Mon, 13 Nov 2017 06:31:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eECxL-0003ku-N8
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 06:31:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eECxK-0000Aq-Eb
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 06:31:11 -0500
Received: from mail-wr0-x22a.google.com ([2a00:1450:400c:c0c::22a]:46187)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eECxK-0000AN-8L
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 06:31:10 -0500
Received: by mail-wr0-x22a.google.com with SMTP id y42so14137445wrd.3
	for <qemu-arm@nongnu.org>; Mon, 13 Nov 2017 03:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jaAXzCyQuTltRvhhebMmvBeCy21DDkshyO0oCpm9QVo=;
	b=R97vOV12XmcfnzsLuMhCHviufVK3vAmxn8VHR6Hcp695Xu6eyfx7J8iectez6hj9Cd
	OExnOJBeEukrScMXb3Vu1P3R5+F7lDdcWSuizECMvnu7vTZuOrHgTRlbHEfnBDUAQ2SX
	hJgJQB2l5OP6T3NbEWLdaifcXBZ1DYdrrkkpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jaAXzCyQuTltRvhhebMmvBeCy21DDkshyO0oCpm9QVo=;
	b=tl7r+d7sOU/mG2z++UA86IlAEC+QNgbMhQ+TZZa0iMYekTlt79V5MQ9IFfAwL8f8v3
	5w18LHJFKtricnyO6cboaMkPc0T2KknOv+uVOc0hNH8XpphI479qpNfyx7LkQmxZ6yax
	pSWTtSemHTeL3JaLoLNQ7boI2Dxg5rH1clT7DIyc19/1XNsreZtOolUeairtp9SBWvcd
	V8yIVEE3my+N3DOG3agxXBkwGGDcuD6pK38cMe4MMAWRD4HivK34jwiJwPR3+ycNJ95M
	2u/YLqCcUs9m+cOn5tBYn0fKewjnXW2BfCqjv9fX0f/D21fe8p4lTqggRFNXooRxdu+b
	GPkw==
X-Gm-Message-State: AJaThX5lgr+BisJc0CqIMlZeO+Fxz0vvQKDvPa+Z77zdNYLHyV2CgwTb
	Kdue9lhlKkFOuOHmaCTM5blAe7I7jQwvI8NifAgxXg==
X-Received: by 10.223.171.161 with SMTP id s30mr6610915wrc.194.1510572669149; 
	Mon, 13 Nov 2017 03:31:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Mon, 13 Nov 2017 03:30:48 -0800 (PST)
In-Reply-To: <20171113062658.9697-1-ppandit@redhat.com>
References: <20171113062658.9697-1-ppandit@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Nov 2017 11:30:48 +0000
Message-ID: <CAFEAcA-kTyadHKYTAuMOLi+AJyxVd9aWSowj=knU6vWdsaOqaA@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22a
Subject: Re: [Qemu-arm] [PATCH v2] highbank: validate register offset before
 access
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
Cc: Rob Herring <robh@kernel.org>, Prasad J Pandit <pjp@fedoraproject.org>,
	Qemu Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Shawn Guo <shawn.guo@linaro.org>,
	Moguofang <moguofang@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EVCq5KYkvNKc

On 13 November 2017 at 06:26, P J P <ppandit@redhat.com> wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
>
> An 'offset' parameter sent to highbank register r/w functions
> could be greater than number(NUM_REGS=0x200) of hb registers,
> leading to an OOB access issue. Add check to avoid it.
>
> Reported-by: Moguofang (Dennis mo) <moguofang@huawei.com>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  hw/arm/highbank.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> Update: use HWADDR_PRIx to print offset
>   -> https://lists.gnu.org/archive/html/qemu-devel/2017-11/msg02116.html



Applied to target-arm.next, thanks.

-- PMM
