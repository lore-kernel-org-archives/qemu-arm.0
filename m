Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp6019081wre;
        Thu, 31 May 2018 07:57:04 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIdFZtyG6uwW8j8ebAU8x2//lmOOyQx4SAwfP9+hKZUFHbqlcbIQvVLmBaA/qH9Vi4f/QbU
X-Received: by 2002:a0c:8601:: with SMTP id p1-v6mr2958960qva.184.1527778624352;
        Thu, 31 May 2018 07:57:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527778624; cv=none;
        d=google.com; s=arc-20160816;
        b=HZ54SNom4sIcGANI588q9byIAOwwDN7lF27r8sgBCfiIdOp5KkLe7AXKTCaUWX4k2e
         6maXQDEieSlweSTGGbHIs1EamLiUVU54DFMmVjN4FDO4ir3io9hYV5R96lmNrqtria9L
         1BDhiii5gJhDnhrjYEuVWSTo1PM2xvclC8aMg7VZiz91/0/RWli4OkPM6cuDBtHb2NzM
         VlbbmJkO2r46p1yV7rnBbb51ig6N9hBVNseFYppCRnzPVOGNwSRkMzixlUFZe7h02UhH
         NBPsdrM73ThaT4fdYqOjeUwrplFcPZ8tFFMHnh0ljvDqtGacr5ceX9K9v2k+OET/ggIW
         iakQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=fWD+SPNdCYRL/QiS7pYqzwaXVUOTmsKX6HNtUD97KEI=;
        b=ozH0+6XF0XDJIFCUFhdXlfhYXJ27qNRrfIVxHhUnY/vzc6LixTpH3h3sC0ATSBKsuX
         jFRLW5jgR3T1JSYbS8PW84b0tgt6nCoZKDTSiAtFKlta/17vy/wkDMVKDjDo8gYTTPVk
         4G9Q1nXGRSjEAe8nT4NYCdtUjRMCzerkaWbkOCAqAIozeRq267KfNeo7VkZZaO63CI81
         EdERbDiwu+z4LUJJiZkiVAvV4Pr8jt8WoeCqEooI30bk8nEaFSzH6akpk8D6slIquAqQ
         XK0vBTQtqQhm73gV/joVx3mhT8JPEl4+vqjrOb+qxWLMCW7E8CqXj0jttpszFxPNk1HT
         KA7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SVVDvVjY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g18-v6si11158501qvd.192.2018.05.31.07.57.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 May 2018 07:57:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SVVDvVjY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44602 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOP0h-0007RY-TM
	for alex.bennee@linaro.org; Thu, 31 May 2018 10:57:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fOP0W-0007Qa-Vo
	for qemu-arm@nongnu.org; Thu, 31 May 2018 10:56:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fOP0W-0004DM-AA
	for qemu-arm@nongnu.org; Thu, 31 May 2018 10:56:53 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:43126)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fOP0V-0004BU-Tj
	for qemu-arm@nongnu.org; Thu, 31 May 2018 10:56:52 -0400
Received: by mail-ot0-x242.google.com with SMTP id y10-v6so25604228otg.10
	for <qemu-arm@nongnu.org>; Thu, 31 May 2018 07:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fWD+SPNdCYRL/QiS7pYqzwaXVUOTmsKX6HNtUD97KEI=;
	b=SVVDvVjY0ro5NikJUiaPVLBGK9pLtIg4Z4Bq2XmaMlvfma3tVGWcFBuuERdPMw4WbT
	2MnWEdgvee0tIjKnbD/ChY6Q6r5aAMtaTjBq04ZBAkDsSfJCkHGg6CqYYALUi6GSDkDo
	rXDpBFyVLGDMb/F+qvRyy3wJvS3xi3W8SFcc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fWD+SPNdCYRL/QiS7pYqzwaXVUOTmsKX6HNtUD97KEI=;
	b=sLt/1VA9Zpu+2m7g1yWoJGtO46sOhD3RIJ9G311zIbta02vH9FqW/j+2zmWcecvM46
	Aaj2YqY0pQBcPpN0TAn50WYiJdcFzK9ogNegfP5sw3OVZNviZ/2iVGjAvMXozc+rtqAn
	jaczXBLf0AH79l9gAyL/P2UVXKxYgCdNT4yILL4FSgaLc9EGUkkjZUfHJf+WvoG24KXw
	FEKF3yrki94gmeINafP8pwvzQYVGJFIvGfd31u/jAm1CfIbIj8+KNimBnriZi+Z/lNO9
	72yoowknZ3EQP9KNCFxkVRnMdbGxboYkCdVXKtcIHDdurYjlLSNq5UdijriTuWcp0CMZ
	SqbA==
X-Gm-Message-State: ALKqPwdeTtzhDCmzJtSralP5OvsUMoPKhQoFe2ueGu9HCIfAfLqdbEr4
	E+IA92/gU+qeDgmA7tVx7QJvgONS7kMSpkxCsmDChA==
X-Received: by 2002:a9d:5014:: with SMTP id
	a20-v6mr4470848oth.205.1527778611227; 
	Thu, 31 May 2018 07:56:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Thu, 31 May 2018 07:56:30
	-0700 (PDT)
In-Reply-To: <CAOMwq8-H+iZ1L996G4jdky__zstwFo6x0qTucqLRstuXhs1CEA@mail.gmail.com>
References: <1527736557-11084-1-git-send-email-zhaoshenglong@huawei.com>
	<1527736557-11084-3-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA-qWkhueUUnZ1RmhRuhHLstGpwmameHgsOM7UautJVxpw@mail.gmail.com>
	<CAOMwq8-H+iZ1L996G4jdky__zstwFo6x0qTucqLRstuXhs1CEA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 May 2018 15:56:30 +0100
Message-ID: <CAFEAcA-R6N3Umg6=TzQrwoCw8VAL7VT7NTzLN4TnKoPBP4jRBQ@mail.gmail.com>
To: Shannon Zhao <shannon.zhaosl@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH v5 2/2] arm_gicv3_kvm: kvm_dist_get/put: skip
 the registers banked by GICR
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-stable <qemu-stable@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6GxbB/tqvePI

On 31 May 2018 at 15:36, Shannon Zhao <shannon.zhaosl@gmail.com> wrote:
>
>
> 2018-05-31 21:50 GMT+08:00 Peter Maydell <peter.maydell@linaro.org>:
>> Shouldn't we be adding the same thing to clroffset that we add to offset ?
>>
>> Yeah, right. It should like this
>
>   clroffset += (GIC_INTERNAL * 1) / 8;
>
> I don't remember why I didn't write this way. Anyway, Could you please fix
> this when you apply this patch or I send a new version?

It's probably easiest if you resend; you have Eric's comment
typos to fix too.

thanks
-- PMM
