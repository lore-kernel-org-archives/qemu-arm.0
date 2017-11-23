Received: by 10.223.159.82 with SMTP id f18csp527913wrg;
        Thu, 23 Nov 2017 01:53:02 -0800 (PST)
X-Google-Smtp-Source: AGs4zMasU9Ba+9yPREzx7y+UcYm6KHqypRv8Z926Ed8Yw7RYC6S4nhbUx5f0BXQa865/OiuMkTFw
X-Received: by 10.37.99.194 with SMTP id x185mr14737076ybb.411.1511430782384;
        Thu, 23 Nov 2017 01:53:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511430782; cv=none;
        d=google.com; s=arc-20160816;
        b=WgGvMwY4GEQxHVSIz3SZLjrnZ/hNGseozbPJ5MWgtyUAp4ufScftn4Bm+DgZqPAsqs
         zUCF5wDF1xuPb+aR5z5Wzinj9zZ97N5haEHXFpd2c6x4GrcQKmVjtdgG2ERrRgNOub9y
         rm5E43UvwgRIgfaVAyNQcijpUScBVsoDyGjJF+o7kGFC2mEpr/FA3Jul0LyfaHZtFenm
         AwnLMsk/dJV4J/fqGLRsTtbcQVENllsSRJkCkyjt02hDW1iUv+gCr5ZRZc9sc5bVMJ7c
         BXzfkcJNYiKit9I+flKzOnnJdDq0p7FslDcv0suGqpF/UfsvemYSOWCZSzJQXE2EkTOo
         9g5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=focIjQTWIlPjxWuBUPW2JcQdVH/yo3vdkn+Iwbg/KrQ=;
        b=zwxyXwACv7L3I+oH3zmbP8UqDJ1YOe0k1gYt5teAw2TlyqxQegPNcL+HOpVQFMDbF0
         Hx3q320zGGItIgj3NPB5z0atc1++CSFypbjq75efse0bDEkoP4atUjq8EJWhtOLDrHpv
         eGVlCTsRCW0VPsaBXp6vW275Y84BPAjm/1vRkeN/domV0FppDd2LzgINHMutFLRXp8i8
         /ucKZZ6nx1eXvzVWnOnw4aEmbHOeaRiU5DniOleVRFTP/9V38LVF4AxzDcMinLljrQH7
         PTXARqub9ECFT3wF5+FpL01RuoPQBRVDloPUle9/DbHtccKUzPrjJRoyvH/aufCYek54
         Cr5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QpIttsM8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h5si3802785ybk.235.2017.11.23.01.53.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Nov 2017 01:53:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QpIttsM8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43245 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHoBp-00052M-TC
	for alex.bennee@linaro.org; Thu, 23 Nov 2017 04:53:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHoBf-00050e-H2
	for qemu-arm@nongnu.org; Thu, 23 Nov 2017 04:52:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHoBZ-0000W4-Na
	for qemu-arm@nongnu.org; Thu, 23 Nov 2017 04:52:51 -0500
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:35398)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eHoBZ-0000Va-IC
	for qemu-arm@nongnu.org; Thu, 23 Nov 2017 04:52:45 -0500
Received: by mail-oi0-x244.google.com with SMTP id e142so12813299oih.2
	for <qemu-arm@nongnu.org>; Thu, 23 Nov 2017 01:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=focIjQTWIlPjxWuBUPW2JcQdVH/yo3vdkn+Iwbg/KrQ=;
	b=QpIttsM8xRAF5slbYUrDXjGtSw76ErM3t0Nhl8+27wDKwDa9ogbwcPUXheMnzL/yCF
	IdL8mjd71s39feO9gWJljskfiaS/plqRYpSlFgEbFaZr8gJMQHbhoHanv7zJ3oT6dWUH
	bFYP/PKCHWJofdnn/CNbQD92oHFCynAPo+Fq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=focIjQTWIlPjxWuBUPW2JcQdVH/yo3vdkn+Iwbg/KrQ=;
	b=PmF56rsezInSnm7mnfgdRN3QRQAGDyFKRB3cOoZoAdaln7GoaKAF7CL4qyx/BOr9Op
	y35kGouel3lJyVxH/W1oSrhMyzqmpEVRH4i24SGLldfgMPK9F188M/+ALbishQ6MUm4L
	fMmPPWuXXmDroqgt7NhBgEpSlxIwGN/FYewr08We9YplGeAUkjhK28OuBys0XxNRhCgT
	+RPQ1RheNUJ0BmbAOkXWh7AJO5Rn+ffq0zYS/zwjrTlNVkFcGvZy6ELCYgLUOj2C3b6f
	VDGW8CT5/MNV24JFq9+lgtyDVHgQO8nF0dcJMV/Dt9lXnqBIQra2TCVIUmuReVDjQewP
	fagQ==
X-Gm-Message-State: AJaThX5J3Jch1yHHNXaI3rEswSrcdZ840xhGosn8Gp3KTvMe3Mju+YeE
	urUxQ/DddIYsYuPVVClzg+hoea2YhOMx2y3L/L5Qeg==
X-Received: by 10.202.83.22 with SMTP id h22mr5683156oib.8.1511430764662; Thu,
	23 Nov 2017 01:52:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Thu, 23 Nov 2017 01:52:24 -0800 (PST)
In-Reply-To: <CAHQ1cqHm1MRWaxh7v4EWgRraS4Ezrx2QdbH43ao_FOX3P6MZQA@mail.gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
	<20171106154813.19936-12-andrew.smirnov@gmail.com>
	<CAFEAcA82Y3fWJyAUwOSxy6btutrS+FPa7sRm3AOKZM_GTcmBrA@mail.gmail.com>
	<CAHQ1cqHm1MRWaxh7v4EWgRraS4Ezrx2QdbH43ao_FOX3P6MZQA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Nov 2017 09:52:24 +0000
Message-ID: <CAFEAcA9FoRPWiXvtO2-mtc-Y2SgdmkH2habTcP+TY9RJZ02Bcw@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v3 11/30] sdhci: Add i.MX specific subtype of
 SDHCI
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bCRavIFgQT3y

On 22 November 2017 at 20:43, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> On Tue, Nov 21, 2017 at 10:02 AM, Peter Maydell
> <peter.maydell@linaro.org> wrote:
>> On 6 November 2017 at 15:47, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>>> +/* Controller does not provide transfer-complete interrupt when not busy */
>>> +#define SDHCI_QUIRK_NO_BUSY_IRQ    BIT(14)
>>
>> We only have one quirk, so why is it bit 14?
>>
>
> I took that code from Linux kernel, so I tried to keep it as is (same
> with unsigned long in quirks field).

That's fine, but if so we should have a comment that that's what we're
doing, so that subsequent additions by other contributors follow the
same convention.

thanks
-- PMM
