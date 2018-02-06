Received: by 10.28.71.27 with SMTP id u27csp3740183wma;
        Tue, 6 Feb 2018 04:47:02 -0800 (PST)
X-Google-Smtp-Source: AH8x224oonPeu1lzqQSdt1Nw+esvl0692G5iB6/0WUZmjdu/UoLuRuC3cYiqsNak01lFFSBIwjhn
X-Received: by 10.37.103.65 with SMTP id b62mr1257322ybc.312.1517921222770;
        Tue, 06 Feb 2018 04:47:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517921222; cv=none;
        d=google.com; s=arc-20160816;
        b=bDaBz7xfjZIwJsGYHeN+vI/lB75moBKca5mYwHaH3aBIWw2oUYqZ+aojQjRBAE2UWE
         H6qIMQcUJyDVss3eh4J0r396G/MEovTBz+s7qjCQ6UOisLyblvxwj8UvIn4cSazulpPC
         rvchqSKFn2Msv6gwMxQVBJgCtPYL71H1lkQCGzlNmzIKiFPR7FwtI+sFqC4dxKJzkmO/
         ZTNPzxO11BRhoWEizIyn088I6qYz+TVVVm2yizVn3XFap7DOShr5y+44mHiatalro04H
         XdD5ONpD9N9w1MSPTSXbfOxeoA4pzO9KrpN3h1JTZ5IAi9r/owDtHqjrrVkdQQAlTt1X
         0IsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=tiWTrUnW+5UTgPzKO/pRT/ePikVZ7kjDXrCuWdBGGww=;
        b=BF+2zU/KzENiqwTmYn+rufI5mWKb/VSXfFUZylOm8B3cnC0eFhYMRQ3I1dEb/VFA0S
         jAn+gzgehLpcb6f7H7Fg0+DJAW7VzPZrrTWdLKR32Hlz2d6Cv8KJ7n/rqOIipUSe/+KB
         AtcvMG4231h6/ApSQp5Uc5cIFXf0ocoQmDO4z0rUthUCrEIoo38QvEQWsNhoRPowkyz4
         cTBMWu0b+wsyFaXyrGFcfFUStyECuhn+KS6NjcipzgzOdRkEGVKC7AKMOUrxb1qywYj5
         nqd3w7J/hfDMVmNHPKBAcUBotazcpbB6N31s1GY3u6WGq3qe5WGfVWR80VWrjp89c6uz
         4q9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dM5ngbeU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 85si1415606ybn.26.2018.02.06.04.47.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 04:47:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dM5ngbeU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38517 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ej2eM-0006um-6n
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 07:47:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52986)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ej2dZ-0006OG-7z
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 07:46:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ej2dY-0000JZ-Ds
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 07:46:13 -0500
Received: from mail-ot0-x231.google.com ([2607:f8b0:4003:c0f::231]:39398)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ej2dY-0000IC-9C
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 07:46:12 -0500
Received: by mail-ot0-x231.google.com with SMTP id f18so1581460otf.6
	for <qemu-arm@nongnu.org>; Tue, 06 Feb 2018 04:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tiWTrUnW+5UTgPzKO/pRT/ePikVZ7kjDXrCuWdBGGww=;
	b=dM5ngbeUehhrfnDK8hDl/t0N/tMw/rWmmPlQXiNhlTmI8lLXGrWFUEC7atUgFf0Czq
	FJfgiU0Y9pEMLEdupPCJqVcbTqBUtf2mLMyK5xkA07X51M/CnvAKSFPPQjoNrtPlUddE
	I8EwdFz/nCQ9OspRniQqNS8dVuxT4fFvxeNOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tiWTrUnW+5UTgPzKO/pRT/ePikVZ7kjDXrCuWdBGGww=;
	b=coozyPPNJPOwJ+BqwRq05848O1vTzM+11W0n+YP0hSR8JG1TU7GZ/lf8U9zYbUYepP
	UY6bHbhFf1Xm3yrtqF/iA1ELy1FmED1TG9qGOYtJWAsT/2ZdrEhCPCMK4+PaVmVWqx12
	LSh+MZvZZA9xvRzg7NdlkIJ6XM3kheSZjmafoXb8o8k5L5DDUg1Yue+HvE2RAi3i4IT2
	kDb/GYdNbmtWR+t/ZtU0A4zbbyLDjWe67LYf2HBciRoDeHFPAoIOCFzP0yzu3UZc24FD
	m3Tyjq7GeZC4PNs5/vdkdFMrWPKukjk0735dk5ZwC7Y9zQv/imdUmcmk7Uv6mwbRhTmz
	Nysg==
X-Gm-Message-State: APf1xPCzEZLpkG/3hTR4ezqZAcltZwpFQaAKWS8iNmMJHfCgZcOkV9al
	rK1ZVmnetAFA7JEGrO47g34d7kWmD33eDhb4WELOAg==
X-Received: by 10.157.29.211 with SMTP id w19mr1500463otw.24.1517921171592;
	Tue, 06 Feb 2018 04:46:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.34.163 with HTTP; Tue, 6 Feb 2018 04:45:51 -0800 (PST)
In-Reply-To: <5c98e7b7-ca50-ed3e-6e0c-671cd793b175@redhat.com>
References: <151784238084.63.357873266609338192@bdbb90650ae5>
	<5c98e7b7-ca50-ed3e-6e0c-671cd793b175@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Feb 2018 12:45:51 +0000
Message-ID: <CAFEAcA9m9x0Vz6-A95P7_WUj+oJS=NLQyWFPJubC2ttOJZWhWQ@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::231
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v8 00/14] ARM SMMUv3 Emulation
 Support
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
Cc: Fam Zheng <famz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	linuc.decode@gmail.com, Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: anVVPuvs2jJI

On 6 February 2018 at 12:22, Auger Eric <eric.auger@redhat.com> wrote:
> I will add
> #include "qemu/log.h" in smmuv3-internal.h in next release, to fix this
> mingw compilation issue.

It's an issue with configs that don't use the 'log' trace
backend, rather than mingw specifically. (It just happens
that patchew's mingw backend is the one that's configured
with a different trace backend.) The default backend means
trace.h includes log.h.

I really ought to write some patches to make this be an
error always rather than only if you configured a different
trace backend...

thanks
-- PMM
