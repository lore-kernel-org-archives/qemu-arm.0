Received: by 10.28.4.212 with SMTP id 203csp3911328wme;
        Mon, 23 Apr 2018 07:03:43 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48ylyrw5OelyfDR92+ESCJ2ty94QIMsFdu57pt8uMhNb387FZZcNv+sTGOHiI9UPC+BARkw
X-Received: by 10.233.232.197 with SMTP id a188mr22748415qkg.312.1524492223666;
        Mon, 23 Apr 2018 07:03:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524492223; cv=none;
        d=google.com; s=arc-20160816;
        b=aqpc49fOo2j1FA9iU5WOTyEzBOUupzIdY0nVT0Gd1SR6IMz0KKGhW+WMxsE/Cqvsdx
         jTCoCb+R/9SSMSucFL83ozdLv8aJ91ToOHQg201RDMSrOuhOAMr4EY71iC0iwV8+Vz06
         jbmmDGOPYs8HoVcy6ofEAHQuFv+Sw+snqYmtvxoXexWiBevoT12aIRMNEc4fVtCUgOr7
         iqc7uOgsEiUODVSffbEfAox84qj+1eAPu3/jkn5d/0HrUPTkIC1hHQ2EImqRZnDNPv6x
         uxH6koK8LDEYs34SEu9WSXQ2GID4t9fbLDF20Fx0KaGUYIx+dzZAgldLv0Qp8FvJtGbD
         7QjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Yg8zEX7+j8VpBCyHHuTz5nsrVWrBdQlya0F0FxGIwHc=;
        b=qTHicAJzUyrWBR5jXQU339tflyZUxl/0GMHvIPaekp/HnfMGdxsb0PT4dIAU9+r8d9
         8fFovIVqmTN6la/J3wrs5C/SIFgwhfWJ37v4a4peZQl74fwPnHiyPMTsVYeupUEKVrJ9
         eK8/hgMt5tPD0RKrPKNrXtwd2E5IyIZOYEgzB6IZz4tu6NEiXWXseBVL3J4YP4r3kVXm
         6qePwXll7iJN38IH7iiQu28BoE7lpmaXvyXHP4+lnGI/1dXZH0ookfkxYFxx3loSnc3s
         BBHTt8RgY0tQqNkmgcaNySJAFBCuH0SPgLV5+18XlvfqyR6EU3t/QRJLobljJWXEL2x2
         wy0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GGrx8kju;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o21-v6si8668697qtm.123.2018.04.23.07.03.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Apr 2018 07:03:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GGrx8kju;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49625 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fAc4F-00007n-6S
	for alex.bennee@linaro.org; Mon, 23 Apr 2018 10:03:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fAc3z-00005z-EG
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 10:03:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fAc3y-0002jw-Fk
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 10:03:27 -0400
Received: from mail-ot0-x233.google.com ([2607:f8b0:4003:c0f::233]:33104)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fAc3y-0002jJ-8C
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 10:03:26 -0400
Received: by mail-ot0-x233.google.com with SMTP id l22-v6so6777125otj.0
	for <qemu-arm@nongnu.org>; Mon, 23 Apr 2018 07:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Yg8zEX7+j8VpBCyHHuTz5nsrVWrBdQlya0F0FxGIwHc=;
	b=GGrx8kjuepouPiJtmJIAdr/bLbBT44tWjNEfCtSim+PjZyedHf7B1xzov+cHOpTpmZ
	byaX/btJbBdaZ1O0nO3LfcuccAhH/T+1DKKknKQp2c1mn8/BWkIhvL5ls7+ZY3yw67qj
	ehgxz+/7zhrFuxgCfll4YDdlIE/rJ6i7M2zjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Yg8zEX7+j8VpBCyHHuTz5nsrVWrBdQlya0F0FxGIwHc=;
	b=kfzTH7Fi9gbkwcYJeb9M+NH0Kn9sPs2EHVxpNrM+ko1z4JsEyYtjP6d1wjCHULD3SE
	c6I58jGwJuzbQmQyp8rkgtzWp8XXLAzNGit2Yno9XNkGQ+06Z1uQ4MZMtHjJNA4AMHfz
	rh8ZzqRO3ckw5fi3yuUIozd38uAsnnn0tannRNeGFDBoIel0zXNDK7VynHGmcqNKdj51
	gBxiSzm8KsSQ5GCwU5mcPk9b8sXD/FSQrsDHmnk12txzIWr30/HzVgd2V64xSmyv8jFn
	CcAJqyAVbEONWsOFzzjb+NWG6nyGi1/30yc8pTs2jaCJYM94viAiDO/is5CxkK2NxwHV
	uD5g==
X-Gm-Message-State: ALQs6tBvp6y/jQyGyqKpE8gDdv4OBv0jIkt2nzWJZ3HtoPOMpP3vEUWv
	qSl2XCT1v+MXM8KFG553HdCQUY6eTozhrC9mLrkunQ==
X-Received: by 2002:a9d:2842:: with SMTP id
	h2-v6mr9397754otd.210.1524492204874; 
	Mon, 23 Apr 2018 07:03:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Mon, 23 Apr 2018 07:03:04
	-0700 (PDT)
In-Reply-To: <677f3faa-24bd-0679-47ae-2dc9bd1c9bda@redhat.com>
References: <1523518688-26674-1-git-send-email-eric.auger@redhat.com>
	<1523518688-26674-4-git-send-email-eric.auger@redhat.com>
	<CAFEAcA84iZV8vUK4DxPpuO6LwUqE=LEoW63qy=FTiF6KHvYhEw@mail.gmail.com>
	<677f3faa-24bd-0679-47ae-2dc9bd1c9bda@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Apr 2018 15:03:04 +0100
Message-ID: <CAFEAcA9C2uuvE7MRt+TUnRARytKU5aH62FHf7c6F49KwRV-nFg@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::233
Subject: Re: [Qemu-arm] [PATCH v11 03/17] hw/arm/smmu-common: VMSAv8-64 page
 table walk
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
Cc: Christoffer Dall <cdall@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Jintack Lim <jintack@cs.columbia.edu>,
	Prem Mallappa <prem.mallappa@gmail.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: idD1VYwT/7vC

On 23 April 2018 at 13:10, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
>
> On 04/16/2018 02:59 PM, Peter Maydell wrote:
>> On 12 April 2018 at 08:37, Eric Auger <eric.auger@redhat.com> wrote:

>>> +/**
>>> + * TODO: handle the case where the level resolves less than
>>> + * granule_sz -3 IA bits.
>>> + */
>>> +static inline
>>> +uint64_t iova_level_offset(uint64_t iova, int level, int granule_sz)
>>> +{
>>> +    return (iova >> level_shift(level, granule_sz)) &
>>> +            MAKE_64BIT_MASK(0, granule_sz - 3);
>>> +}
>>> +
>>> +#endif
>>
>> When does the TODO case happen, and what goes wrong?
> Sorry for the delay [back to the office].
>
> This refers to
> D4.2 of ARM ARM , Effect of granule size on translation table addressing
> and indexing/ Reduced IA width.
>
> "
> Depending on the configuration and implementation choices, the required
> input address width for the initial level of lookup might be smaller
> than the number of address bits that can be resolved at that level"
>
> For instance with 4k granule and IA limited to 35 bit, we use a 9-bit
> mask here and initial level 1 offset is based on IA[30, 38] although IA
> is limited to 35.

Hmm. We do get this right for the table walk code in
target/arm/helper.c, so it would be kind of nice to get it
right here too.

thanks
-- PMM
