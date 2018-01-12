Received: by 10.28.173.206 with SMTP id w197csp1798350wme;
        Fri, 12 Jan 2018 04:43:17 -0800 (PST)
X-Google-Smtp-Source: ACJfBosy7t4v+IcsGPP63uCH0JpRb5DnDdLmPQetcZoyThOa/GA221l5XEKzpZCDRca8OG1T1HXj
X-Received: by 10.129.85.79 with SMTP id j76mr1537245ywb.189.1515760997226;
        Fri, 12 Jan 2018 04:43:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515760997; cv=none;
        d=google.com; s=arc-20160816;
        b=RzyIZtuYvcOBMVSxZ+zRVH1J06BNscflfeSftOG/Q3w3oPnd5lGnH3bhLUy/E8PFop
         +DL6DpUIYwWUz3n7VEAuV/24xQpuaIpC2TWRIR8lPFNwcr7mw0rJmM3S7mUJTwqVHP2r
         GFWjJFQikhsAMIRKQCJjLf8VCRoYkAEdcwptaWVPba+Zu9zhUWVnPZVK5CUq726mLX5+
         NdIGoP/ooG3HrgJd1CGQdQFSDZSuecQaJBvzudbM30ZQJoG9VE278Cv0btNP3lR6keC5
         anxsNPCSWbVN23zLtadefbEuHZxnagPkQJEU9VpL1sbPe37/lLzV5DHOa/IWUDdyYRhi
         gDmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=hcTjcB39FFhrP98nVGCx12uol9xUtmMHUY+dbxgnKMY=;
        b=d2SIYbBe6kMAHTzj6NdX9aTJYNG5fgdIEr5pE1oBkB376/Ku3C2zBUXlsPjZ9tAyR+
         lnLnm3OC35VGQ8HLt1QBQJrdcWz6CUInz7XjhoKzErtcrLSKNjHiQJh/tPpIFXS3PP/C
         /4xzDOelZ54KsAXp9TFcMbjVst+jrYbqB6IktVlM4sYcw5zlB80OmOmc7Q2haf0EP/Qb
         KteEHlHnTTyc1N3aoURcqIQVemO9J8i4x70RuxZgTKoZOysTpVc5fPrNG1v1ahM/W0QO
         imwGcyv9pmsqJciGONelGu7+Cc2MxiZPm/mfF0+I/1PSv6bVLiHmB9/oKlMQPuBmq/2Y
         TSQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E1QMkSFX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 193si4516815ybm.573.2018.01.12.04.43.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Jan 2018 04:43:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E1QMkSFX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39087 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZyg0-0001vv-NC
	for alex.bennee@linaro.org; Fri, 12 Jan 2018 07:43:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZyfc-0001uJ-BY
	for qemu-devel@nongnu.org; Fri, 12 Jan 2018 07:42:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZyfb-00008p-Fw
	for qemu-devel@nongnu.org; Fri, 12 Jan 2018 07:42:52 -0500
Received: from mail-ot0-x230.google.com ([2607:f8b0:4003:c0f::230]:44162)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eZyfb-00007Q-A3
	for qemu-devel@nongnu.org; Fri, 12 Jan 2018 07:42:51 -0500
Received: by mail-ot0-x230.google.com with SMTP id g59so4914441otg.11
	for <qemu-devel@nongnu.org>; Fri, 12 Jan 2018 04:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hcTjcB39FFhrP98nVGCx12uol9xUtmMHUY+dbxgnKMY=;
	b=E1QMkSFXfMWnwRQmDW6arVgHWK4K6phpH2WG0SzLn2I11UJ4WJVyshazsIaBmCJDNI
	AM+DSjv8mFxVnnbCOp1v4hnHVZmJ3XdJGklhVgPAsAdrltGv4aTqT9uOmCaIHvlUiAqm
	qOmJRisM952M9+WBGmQXCrsGRnf9NYM+oAjT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hcTjcB39FFhrP98nVGCx12uol9xUtmMHUY+dbxgnKMY=;
	b=EDjTc7aoFuRE3RixKgfuBTPbNFdNqL2g27vJ2MCldq5c6kFbmLJQzXDDwZsVNVFCz1
	FETcWqH03qyKpItC+2GY3KmUSEFL/WRScAUG+llpJof13lqIGyWwR09zyvmqCtrnnEtO
	Wv1vPcUO8pu8YwvbZfQD+VUTCFemkvcRC29Qgmd22++ogIzx+xzBuMY8x9Zwsx3FNvjj
	NhwWuiWFyg7ih6auBivxHFNJuhOuqZbUO6+RqngKI83ey//m6hHSjfvfliDXnL2/blek
	n3ngRH01FWKcd6r07+CkQSLhgfZrOj9Q4TeQDUrg9V/0kvI1ZPzu3s+VXhAF8jMs52/c
	s7BA==
X-Gm-Message-State: AKwxyteYOC3nyjgdP0rDLIxmvx9ap0euuxIxdPf4tzKH0b5S//8EIixa
	Jggk/m2gWvSXRV1wDWwrKH8vyEgVYKHpAduz0cMOMA==
X-Received: by 10.157.8.172 with SMTP id 41mr14069749otf.116.1515760970568;
	Fri, 12 Jan 2018 04:42:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Fri, 12 Jan 2018 04:42:30 -0800 (PST)
In-Reply-To: <833c4229-7a78-849f-c17a-bfbef4506458@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
	<CAFEAcA9Qnj0G03x72BFLAYmodeBMDB=t3pz4JxUj0HvrbhkuGA@mail.gmail.com>
	<f82e02e3-40dd-8e74-6fe5-3205cdd42758@linaro.org>
	<CAFEAcA9eNzA9Yar4SC5UKWzMij0ypyXKATRqU1pVx8UTf33u7Q@mail.gmail.com>
	<833c4229-7a78-849f-c17a-bfbef4506458@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jan 2018 12:42:30 +0000
Message-ID: <CAFEAcA-Hr0DAJi7rggmRudDc0L+g35MZ_1doOjSJe4TiThb23A@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::230
Subject: Re: [Qemu-devel] [RFC 00/23] target/arm: decode generator and
 initial sve patches
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZR0Jy/wZuCKU

On 11 January 2018 at 19:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 01/11/2018 11:27 AM, Peter Maydell wrote:
>> tgt-arm-cplx ? I had a look at that but it seemed to be a different
>> set of patches to this lot.
>
> No, tgt-arm-sve-{1,2,3}.  All of them should build.

Thank you. I've now had a look at the generated code and
reviewed patch 1. I had a quick look through some of the
later patches, mostly to check how the use of the script
looks, but I don't intend to review them properly at this
point (unless you think I should).

PS: a quote which kept coming to mind while I was reading
this patchset:

  'Er, what does the Z mean?' said Zaphod.
  'Which one?'
  'Any one.'

thanks
-- PMM
