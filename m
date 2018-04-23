Received: by 2002:a4f:9ad6:0:0:0:0:0 with SMTP id b83-v6csp3687424ivh;
        Mon, 23 Apr 2018 02:36:13 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqlQ5ch2XNRvY7U6lRW2mhvxKujMejkkSHDRAITKCVgXGOQYfT4lhtUQJicsAw0ywWLaJ/a
X-Received: by 2002:ac8:25ed:: with SMTP id f42-v6mr21238859qtf.175.1524476173040;
        Mon, 23 Apr 2018 02:36:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524476173; cv=none;
        d=google.com; s=arc-20160816;
        b=bUB17WvJG6V86fL6YM8Zct9/HqOG7ClNfoupTdUPUcLtHz/AM7S21tE/9Gnyrnrpjx
         tcvs+0fuaMuQ3JUlv1We+E7wOtfVCEKQDTrO77JURxGST2t4nxpWIJ1qDZl3iYxEUM4C
         9UKpzoBUFrJAWfN8lWixW9se89QqTA+1Gs/KheVR1tTP2NPv+zOI687htoyiN2gpBcNy
         bt72L4EXkr7gvh+3VGhsWOmtO4ri+fsLmNe1E6bP3lhjdjj/0p6VVtFL2PE132SMFGMJ
         7pZqrnoF4DMzVSBncWG1uH6VhrbbayFWUMEyIeeoW5T4uM1Ce2njxj+pEX6xKhxb7Fgd
         e8Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=59rUpxZy8r1BSngVykgRSTJVfrUqS7fmLancb2thUFU=;
        b=e9pxTI2T/DMMQtVJn9nKXRLZnqXPqVxyJccmVSSVD20b9ou0+LAq0OC3ysUXI8QD7b
         LwCVHXxDDL1uzqfmHLCqnJtJrYjOG3a0L7iNUhcZ8Jgx0Pm2wQfRzYdQgqJImU7EFXqo
         o3gd38299ukscAy6zYgyeFDPJ9CFxZ7KEwhmRhIp2QS0JTZv8Rw+zgI4zbq3l9hVETsX
         qK9psZYqBurkRniIzRc9nzoGDG4s2KaQbIesOwKo3yfdKGU1KqgUYBI7ClUBkd+FDSLK
         3wnb/RmWN2o12gkPV3EnMXTlQ3hYNHE5TiNAyFHBoNQ7bGyTJhFpHqb09bO7iGN1V5Q3
         TNGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WrTZyLpl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 9si2773132qkg.322.2018.04.23.02.36.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Apr 2018 02:36:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WrTZyLpl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59085 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fAXtM-00079Q-Ju
	for alex.bennee@linaro.org; Mon, 23 Apr 2018 05:36:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fAXrv-0006CV-PV
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 05:34:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fAXru-0002ch-TN
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 05:34:43 -0400
Received: from mail-oi0-x230.google.com ([2607:f8b0:4003:c06::230]:40386)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fAXru-0002cI-Oq
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 05:34:42 -0400
Received: by mail-oi0-x230.google.com with SMTP id x9-v6so13633161oig.7
	for <qemu-arm@nongnu.org>; Mon, 23 Apr 2018 02:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=59rUpxZy8r1BSngVykgRSTJVfrUqS7fmLancb2thUFU=;
	b=WrTZyLplclyZO4rd0+sZWoygXA5fJENk/SCv8vSTT2gpugOIxQh05im6Nhl+Ieyydc
	LcVyeC8enIaFAdDMpNdQVSw+qwy8Lg96s2BVqdDyyMnEBol/UDptw2HXTkZNZD+8Zgy1
	o3G9+u4jbbPc/cC3PuGweAo0KzX6jdMz6kkmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=59rUpxZy8r1BSngVykgRSTJVfrUqS7fmLancb2thUFU=;
	b=Ojpa6Zq6N6rYG2v6yMXZi2D1ts8PV0/27hwL7xYRBWEZUtA29rhs12kCL8mF88VN6A
	w5b5tkGsj8qJAK6vVB868453iAgdTrWHceJR0qG/MRIFEO60x2t4gadi/QBd+bkWToR7
	RbTrjSZMAz+ACtP0kmQO6rWMjQxcYdfaScfc/QECiwGLZalDGXuUXC3gLz7QR3ZLrAAo
	mA/cPHzG3td0lrOQYfnjHUQ1M21SK3ywMiHlDwjp25yPEhyjN8zaQg2qEuGrsRRimAwX
	/ylgUS4Bucsv75ltjYsFqeFWYc9ZlTlKOnHFLBJl172s5MZyEYuAsCogLHhGNvFgP0Yq
	so8g==
X-Gm-Message-State: ALQs6tCPgWGK2ObRvAzue1y5xHOWBBY5aGWCZUgs2bZzjUGMoOYPzsB0
	jHpEmcUkgHgW6j8ydAehyl16TcRhJPgofCnlS8sSVQ==
X-Received: by 2002:aca:e043:: with SMTP id
	x64-v6mr11541053oig.164.1524476082014; 
	Mon, 23 Apr 2018 02:34:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Mon, 23 Apr 2018 02:34:21
	-0700 (PDT)
In-Reply-To: <53691cbf-08bf-e3f7-22d3-601a279aa08a@kaod.org>
References: <20180423064020.25434-1-clg@kaod.org>
	<CAFEAcA-LtNpGTV08jvK4i5C5i64WjM5gMB4zGr8P4fkVSkNH7g@mail.gmail.com>
	<53691cbf-08bf-e3f7-22d3-601a279aa08a@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Apr 2018 10:34:21 +0100
Message-ID: <CAFEAcA9XBHE5YxN27M1ugprmSf=o5iiNakO2omrY+HBgCszV5Q@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::230
Subject: Re: [Qemu-arm] [PATCH] timer/aspeed: fix vmstate version id
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
X-TUID: O3OCyvS6TumH

On 23 April 2018 at 10:28, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 04/23/2018 11:12 AM, Peter Maydell wrote:
>>> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
>>> index 50acbf530a3a..7df19bd9df91 100644
>>> --- a/hw/timer/aspeed_timer.c
>>> +++ b/hw/timer/aspeed_timer.c
>>> @@ -498,8 +498,8 @@ static const VMStateDescription vmstate_aspeed_time=
r =3D {
>>>
>>>  static const VMStateDescription vmstate_aspeed_timer_state =3D {
>>>      .name =3D "aspeed.timerctrl",
>>> -    .version_id =3D 1,
>>> -    .minimum_version_id =3D 1,
>>> +    .version_id =3D 2,
>>> +    .minimum_version_id =3D 2,
>>>      .fields =3D (VMStateField[]) {
>>>          VMSTATE_UINT32(ctrl, AspeedTimerCtrlState),
>>>          VMSTATE_UINT32(ctrl2, AspeedTimerCtrlState),
>> Wouldn't it be simpler to just fix the incorrect value in
>> the VMSTATE_STRUCT_ARRAY(timers, AspeedTimerCtrlState,
>> line ?
>
> Yes. Also.
>
> Or bring back all the version ids to 1, as we never supported
> migration before.

I think it's nice to at least do the "bump version" thing, so you
get a (hopefully comprehensible) error rather than just wrong
data if you do try a cross version migration, so I would
vote for just fixing the one thing that was wrong: the
number in VMSTATE_STRUCT_ARRAY is the version to be used of
the substruct, so it didn't need to be bumped in commit
1d3e65aa7a; the main version numbers for vmstate_aspeed_timer
did need to be bumped because part of the main struct changed.

thanks
-- PMM
