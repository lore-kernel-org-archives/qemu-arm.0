Received: by 10.28.71.27 with SMTP id u27csp993467wma;
        Fri, 26 Jan 2018 10:05:26 -0800 (PST)
X-Google-Smtp-Source: AH8x224y1B3cwLuXhgcF4rsgUCaeU0+BlbedQs1hInXdE7gMgr6nqSIPwPNu/NgszFsTLtM89DH6
X-Received: by 10.37.180.10 with SMTP id n10mr11512241ybj.117.1516989926368;
        Fri, 26 Jan 2018 10:05:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516989926; cv=none;
        d=google.com; s=arc-20160816;
        b=ZI9CTbmQL7sP2VzmgsT26h0jANSBUzFVY7EkwVQ3nyAU2xcqGAfdYem/NP8W5iqL4c
         jhMkwCYTslIhx6AppOqaMXHAsHwVc8N2zGZWOnrNoKDlmgSiJBC2uK9UW56gfOgLOJzW
         Pt0K0jpSOIm0+PHfi7TC4mxqqDmV1Juy/lKP0AV5OOjwHW72jLLa14PoYTvWklAd31a/
         SCTtcrOqJ7/iGnxCMptji+Ny27SNeCm2OZ/5Ces1NT/8osVYVzxEyCB69QTZ1QenmmFy
         m5UjC6Ph8w22VI/0FagQBGogW4IcxmkXr4W89nRH8uOGgSCIPd3zQlROwVuBPJ22NzDV
         qcOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=oNLjIxDuRKwRIXEeE2/EaVBcvOizOj6cy+6FdTQF3zE=;
        b=w4xKYqP5admx7ZXtOyl2COCxciLMQDaWdxO8fusr7bxLS3qlpOS60VWPmTdUDZ4l4l
         IzQ78C1Ip2f060yTbRZ4XeLBsDW5dZiFNzxSYr52jukPV78WI1Gp6xxnzBAwEgIEo6nj
         SRS5GracwXcF5ngNgkf81h2woYHA8HGU/MUxkBcka9itFaUAXuilF25r+t70R4IUghJa
         Avk91dBMqOVD9AyU1eDAWbKQ1JrmFKqw5tnYHE4MnNA8aNizI+Xbl1wwsrm9zG1o3BA9
         tWL7yRd5CePOAOso/Pm5SLCuB/dpc9qKDqbz3CwwtwzpBbJ8qzCQwdsQD9APh2Asc8qT
         5SAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Sc5HtvlA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t9si2355891ybk.393.2018.01.26.10.05.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jan 2018 10:05:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Sc5HtvlA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42893 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ef8NR-0000Ms-T7
	for alex.bennee@linaro.org; Fri, 26 Jan 2018 13:05:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ef8NJ-0000MT-NN
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 13:05:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ef8NI-0006iY-Ef
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 13:05:17 -0500
Received: from mail-oi0-x22d.google.com ([2607:f8b0:4003:c06::22d]:44158)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ef8NH-0006iE-S9
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 13:05:16 -0500
Received: by mail-oi0-x22d.google.com with SMTP id j15so860343oii.11
	for <qemu-arm@nongnu.org>; Fri, 26 Jan 2018 10:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oNLjIxDuRKwRIXEeE2/EaVBcvOizOj6cy+6FdTQF3zE=;
	b=Sc5HtvlAmZqRshOIT8FM5qVJyvCTv2dPjc194g3EqYupz3uU3QrSJD8zNdJ0OAmCjT
	GZeq6+5Pff3vzF+Xmwv0QLoyXKi387Yoa3lr8qP/Xhr8rjkTJr/tAwydSBAv9ktwzjqI
	g6BnrkQbNRsov6IqCPscrW2HcA/fUcPkIvqXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oNLjIxDuRKwRIXEeE2/EaVBcvOizOj6cy+6FdTQF3zE=;
	b=oKMdK88OVaq0qgUPWejJZzE1l47lBhIwv9EUrOpmu5MEpbC5qveMDhw8y1zTOTJg2e
	fDU2dDx87ndkABlG5CfuyDQQtTxLwRstRgC8TeZn3xwaxbbI4NGqa6GFhKfd+zEUSpf8
	ekYXtJHVVZ+PdhQXTI1C2qI5bppL1T5HvsOn7X4ptcwXzsYqE4orjkghrniFxgSjHckE
	9Sf7CpnYCooMK5auYnlpRAqI+L1jY/YEVwjZFD1TkWQ/j4w7dxTQNhaPc23+q0/OpaSy
	Lulx9qRkDk09vel+RFfO1wAeSHQpBqpglyWTEmHZl5b51D9AaueGggHYOWI5XCzKLfOo
	Xjog==
X-Gm-Message-State: AKwxytfL4akeZQnyOVA+Te3LeGLOhn/tFGO171kBRAdq4FxeNAlSm86m
	ZL3S8+nS5vmrGTVCYXxog18jvNMo+0OGO+7WPhwjDA==
X-Received: by 10.202.252.73 with SMTP id a70mr13372288oii.256.1516989915106; 
	Fri, 26 Jan 2018 10:05:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Fri, 26 Jan 2018 10:04:54 -0800 (PST)
In-Reply-To: <20180126175418.GH25150@localhost.localdomain>
References: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA-UO5Y_ACSZ2EEQEzgy30wdfEm3u8wUrBrXWaQaE_v+Kw@mail.gmail.com>
	<20171209010811.GJ3037@localhost.localdomain>
	<CAFEAcA9oG=+mJ+jSGTM_z54S09gjHoFowDkOvofdkhJd+g3=Cw@mail.gmail.com>
	<20180122183301.GA31237@localhost.localdomain>
	<CAFEAcA8pGXMs3hMxSs-t7qGfeR__H-CQ1roRVe5NFMCP8R2vjw@mail.gmail.com>
	<20180126104247.GF25150@localhost.localdomain>
	<CAFEAcA_zU+tAMvcqNHQAaVOEaJrrGOEWPS8RpUi+eZQ3tf1yiQ@mail.gmail.com>
	<20180126175418.GH25150@localhost.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jan 2018 18:04:54 +0000
Message-ID: <CAFEAcA9BLhWAEjL8eVNtwc+oo+_F_ga4AFXrS77h=CkuWSo_4Q@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22d
Subject: Re: [Qemu-arm] [PATCH 0/6] arm: support -cpu max (and
 gic-version=max)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>,
	"Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W4ooefv/L3Ht

On 26 January 2018 at 17:54, Eduardo Habkost <ehabkost@redhat.com> wrote:
> On Fri, Jan 26, 2018 at 11:02:24AM +0000, Peter Maydell wrote:
>> None of those are things we'd want to expose to the user, really
>> (except maybe 'cfgend'): they're all intended for the QEMU board
>> or SoC code that needs to configure and wire the CPU up. Ideally
>> there'd be a mechanism for screening them out of the -cpu option
>> list.
>>
>
> Yeah, it's becoming clearer to me that we need to address this
> better than with a simple "x-" prefix convention.
>
> If we remove the link and child properties, we have:
>
> midr (uint32)
> mp-affinity (uint64)
> psci-conduit (uint32)
> reset-hivecs (bool)
> node-id (int32)
> start-powered-off (bool)
> cfgend (bool)
>
> I wonder how many of them aren't useful with -cpu but might be
> useful with -device in the future.

It would require a lot of work to be able to create an Arm CPU
with -device -- there's no way at the moment to wire it up
to the interrupt controller...

thanks
-- PMM
