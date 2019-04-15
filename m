Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2314833wrx;
        Sun, 14 Apr 2019 23:14:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz2gUhlAApyuBOorYbSLD58v2U+JPrCMnTxVUdk2Gw2aZj9YBDHT1wLbcFVesYFTlGsaATF
X-Received: by 2002:a1c:9d8f:: with SMTP id g137mr21364551wme.26.1555308848695;
        Sun, 14 Apr 2019 23:14:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555308848; cv=none;
        d=google.com; s=arc-20160816;
        b=a1zmPN8fvKt7210tgxD4tAIeVRU8CaRqLjCi0uy4O+MwUquUJr7fTkPQsjtGWBjoe9
         nq7Ke5peoXuVGxgTFyMXJRyVt0LZMPvH8yEVYVvA0imPIOhZOIyxtnS+hLbIUExqnB/A
         IRSutEbEnk6HjSzrdUbJuVXijsM3BXbHonQ0cJzuruetl3SfjcVu9q8MSQluD0VRf0w/
         9QuohLDkxyWDu36XN5wrJe/qvze2cwKbFUA4QodI5Kk4o9jxMw57QOnhHZS2RScEAymx
         +gGjuZNNDRK88qruwWDhxBRgUIt18lGoY1L5cEklaG9O+xpz974z45rNyxsM+6Rd5LCY
         5Ulw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=gcmYgLjjOsEcztErvS/Wf4aH24vN0C35kzm+7nBRdJc=;
        b=OGLBZHc3O6/8+IlteCCfw4RXpygKs2QlMwOT0EUjwqMSMYey0iXpemH+ua63XKshV5
         pc11/cRfpQ2VjsySgGXf675vte9t4WQqVy9Wc8x+tDTVmYVyoMt6BPhDBeL9zSq8jqUP
         S6g/rbzX3ueKIVC9AgoU0QyaxcL4SQOtXSsB0Chd6lwahFTT9bpfAKoFDZaHwUlnWPn7
         CRm+Hrswi7yRchsPDU+DVjbfa8wg8gpNYLmbkAe5aoRiAdkUX02bKru2WlJjFai9ovPd
         yVOMGrF3yDVSlSs++JzHMkGc2B3wOvAelXEdJwkBpIMlEnelAMGVbpiB2n6IKa8BsPj1
         Lxfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a26si10003328wmg.46.2019.04.14.23.14.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 14 Apr 2019 23:14:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:45402 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hFusZ-0008Nb-Nl
	for alex.bennee@linaro.org; Mon, 15 Apr 2019 02:14:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45293)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hFusP-0008N0-5n
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 02:13:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hFusN-0006vI-S8
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 02:13:57 -0400
Received: from 3.mo68.mail-out.ovh.net ([46.105.58.60]:47694)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hFusN-0006rL-Gb
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 02:13:55 -0400
Received: from player798.ha.ovh.net (unknown [10.109.159.154])
	by mo68.mail-out.ovh.net (Postfix) with ESMTP id 91B951218D5
	for <qemu-arm@nongnu.org>; Mon, 15 Apr 2019 08:13:46 +0200 (CEST)
Received: from kaod.org (lfbn-tou-1-40-22.w86-201.abo.wanadoo.fr
	[86.201.133.22]) (Authenticated sender: clg@kaod.org)
	by player798.ha.ovh.net (Postfix) with ESMTPSA id A2A4C4D9E7E3;
	Mon, 15 Apr 2019 06:13:40 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>
References: <20190328062222.8409-1-joel@jms.id.au>
	<20190328062222.8409-2-joel@jms.id.au>
	<CAFEAcA_K1Rv1G-s=ndVYX6i_BvWME6ToShL6ZBpB4gnE3zdZdA@mail.gmail.com>
	<89438392-9a54-7f43-5dff-6ceeffaf9f3e@kaod.org>
	<CACPK8Xc_WeP3xuimjTBFRArteecikin9Qj8ZoCW-J2qBY4C=5g@mail.gmail.com>
	<CAFEAcA9t+GUG8PK623gb4v6ZBEhDX_7coOPcgLHDnUXTsrcrvg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c287ed71-59e8-3d7a-f835-1421cba7f6d9@kaod.org>
Date: Mon, 15 Apr 2019 08:13:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9t+GUG8PK623gb4v6ZBEhDX_7coOPcgLHDnUXTsrcrvg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 2385218956401478464
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -51
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrvdekgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegoufhushhpvggtthffohhmrghinhculdegledm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.58.60
Subject: Re: [Qemu-arm] [PATCH 1/2] hw: timer: Add ASPEED RTC device
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LBbvauyv7fCZ

On 4/12/19 1:55 PM, Peter Maydell wrote:
> On Fri, 12 Apr 2019 at 04:17, Joel Stanley <joel@jms.id.au> wrote:
>> vmstate and migration is a foreign concept for the small ARM machines.
>> As well as being a developer, I am an end user of Qemu for them (the
>> aspeeds, microbit), and the use case is to boot up a firmware and
>> check that it does correct thing. I've never considered saving the
>> state and resming it, and can't think of a situation where that would
>> be done.
> 
> It's a really useful debugging tool:
>  https://translatedcode.wordpress.com/2015/07/06/tricks-for-debugging-qemu-savevm-snapshots/

yes.  Our Aspeed machines migrate quite well today and, who knows,
we might want one day to run Aspeed VMs on the "cloud". I doubt it 
but, anyway, it's really not complex to do either.

Thanks,

C. 
