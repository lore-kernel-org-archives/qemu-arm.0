Received: by 10.28.71.155 with SMTP id m27csp2571722wmi;
        Mon, 9 Apr 2018 06:43:56 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/ENKYOmICujHsoXfy2+H1jqC4qwu0KJxV+dOkgEJyNQzSkZ/xbm/ReGuHmsOlmcFfPvzpd
X-Received: by 10.233.235.147 with SMTP id b141mr48988961qkg.337.1523281436056;
        Mon, 09 Apr 2018 06:43:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523281436; cv=none;
        d=google.com; s=arc-20160816;
        b=MpMcpSFdZ+xcX5m/1p+upg/lHzmmltaixJWAnf3G5A9LHCKfx2ySG0feVmgGberrEm
         GQYo+0Q9KfLpwQIE6fBzrrETTHK/lL70QziAc+EF8VMbKM4NpalzwuTnOMUo8oZ5Ad7h
         xBgDnR6KF0svCeJfr1wfQIqQlZMSxDp5TZp7OQQHMskC3cq2yMqS2bUxaPuXhXHeM0//
         qE/75nNqXEUxFzAvky+9U+jqdf/0hlZfoL85Ga5rSjLFJL9RXsacECu6RGgJ4+HKCIxg
         L8fHuiFwMDWlMNL0VXvQSdV29sXsOx302fRYSTsoSvrboJr/QMcsSQRgjNx8D1PtLst8
         LxZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=TCQIc9DDw6OqqY2+FRryB2wGoZhzX+VFsng8YpuhQ5g=;
        b=HRXIH3UfsEGaRqvKKm7DHaqkodQHbnxDZwyeQ6bHV4VYOyNKL9LxXAbdAMPMmOY/zi
         OpC1TZGPrUMREMT9iRTZ9RKobYXPbOA9qmcbRnW1rE6t8ymA64NbwhxcjzYMpOLMDNal
         wMCP1M+JBGMWTl5TUZHaGeK0xrEpAo5iHsvqOY/RlczVQ2zOAV0sPmLYc0kjQ6FaKKcE
         32rwpmNIWfEs06smCHTFnuCUF4jxMzsi//YUcwuvfALzSOs9HjZzxqvi4vYVUrJT3TCB
         9PDxFd2KNsFYLSDF4O0/IzCEiL6FnQCKdeSH72d8Gsht5s/ih9b76ehpmaVShxDgvROt
         6UjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=AsxHQDHJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 71si403728qte.333.2018.04.09.06.43.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Apr 2018 06:43:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=AsxHQDHJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39620 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f5X5P-0006rI-Iu
	for alex.bennee@linaro.org; Mon, 09 Apr 2018 09:43:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44089)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ajaygargnsit@gmail.com>) id 1f5X5E-0006mq-Q1
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 09:43:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ajaygargnsit@gmail.com>) id 1f5X5D-00021t-SE
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 09:43:44 -0400
Received: from mail-lf0-x22d.google.com ([2a00:1450:4010:c07::22d]:37987)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ajaygargnsit@gmail.com>)
	id 1f5X5D-00021J-Jy; Mon, 09 Apr 2018 09:43:43 -0400
Received: by mail-lf0-x22d.google.com with SMTP id u3-v6so6639645lff.5;
	Mon, 09 Apr 2018 06:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TCQIc9DDw6OqqY2+FRryB2wGoZhzX+VFsng8YpuhQ5g=;
	b=AsxHQDHJmXdJ7vzGg9zQ9T39zpgUlCkRzsCEZPvPx2s9lZ1zAuPbAMsN7lIwUGCNTj
	poRrfaFsFjPnP2Fon2uf/U4nz0XkkYAyoEL+0YZUI2JEuBMsqgTYjexSHOaJn1pAkdG8
	RftQNp20zL926rE0UeFe1oYrARAWMPk5LZTvt8dkZWP76c+VQsc5zTqsqmKlB9HKCmQV
	Hqmbp1/x/I6G99nxyBQ14GaeP2uAuE9kWdy+bvP6uLamOODf9BBjnspV0fB/OiBImdGG
	Ed3hhg3efzMRjs4xCo48E35xhPS6OfoKSynPoQnJeWPk035Rxwp9mMgjBrYBz9Mx04UT
	fzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TCQIc9DDw6OqqY2+FRryB2wGoZhzX+VFsng8YpuhQ5g=;
	b=fDCW1wYZ25W+CjnG8szVfVQ13QsHjW+bC3b/IS+QTIxtNZDgD+rfSKA5MoSGRTwEeq
	PQH2eZuGxx/OjmRRX06OwMP/VZGzU73hrQzCOEZ7Dop3WhlgK91hF50g7ZAMX/O6hr3y
	EiQvwV0jQfEjkjC/wLQZlNXTpn3lqLd8Qujw0yPCWdKbCzcSQLiSykCYfmJzxlIUIk16
	c3IbEGaw2mwArWEYpqXkbtZYL3JLblETWIfv8zs7TxN6B4tPm30l4hBsJh1nSj0S6J6Z
	DndSSMGpFmDVMrMQ/mgXqv+awC6jCyFP6QJyXq9vuHD2F/9D7AePM4sbg79KXRcOABDS
	LDoA==
X-Gm-Message-State: ALQs6tAi3/mKKSuyr9vETB5nIJ3j0nln9YMDfns+07Ecm2bDvPF3EuSI
	szGDO3oNW/u2exlzWA2StxG1Xwk/H9hjPl0B06E=
X-Received: by 2002:a19:59d1:: with SMTP id
	n200-v6mr21747294lfb.84.1523281422118; 
	Mon, 09 Apr 2018 06:43:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:1708:0:0:0:0:0 with HTTP;
	Mon, 9 Apr 2018 06:43:41 -0700 (PDT)
In-Reply-To: <CAFEAcA9stTjg3Wpq5x_vj63jm1DrxAQREk4XPeFWb5rff-Uofg@mail.gmail.com>
References: <CAHP4M8VVWyNqi4yLS3S0GXaDz3j8QvUiC=aoJ_DfZLtZBaFwqg@mail.gmail.com>
	<CAFEAcA9stTjg3Wpq5x_vj63jm1DrxAQREk4XPeFWb5rff-Uofg@mail.gmail.com>
From: Ajay Garg <ajaygargnsit@gmail.com>
Date: Mon, 9 Apr 2018 19:13:41 +0530
Message-ID: <CAHP4M8X-Dus1Z8UegDTaab5LvaiDAgQa8upsx_KdnPO+A-XoTQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::22d
Subject: Re: [Qemu-arm] Use of -machine when running via qemu-system-arm
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iVPIBMedwVkA

Hi Peter,

Thanks for the reply ..

On Mon, Apr 9, 2018 at 7:08 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 9 April 2018 at 14:35, Ajay Garg <ajaygargnsit@gmail.com> wrote:
>> Hi All.
>>
>> Not sure if this is purely an ARM-related question, but I will be
>> grateful if someone could point to some literature that explains what
>> difference choosing a  machine makes (when we don't need to have any
>> such flag for qemu-system-i386 or qemu-system-x86_64).
>
> Hi; this is a pretty common question, which we talk about on our
> wiki page here:
>  https://wiki.qemu.org/Documentation/Platforms/ARM

Yep, had already been through it :)

>
> The underlying reason why you need this on Arm but not on x86
> is that for x86 every single piece of x86 hardware is pretty
> much identical. For Arm (as part of its history in the embedded
> space) the general rule is that every board is different.

Yep, perhaps I am needing a more layman-kinda example-cum-explanation
for this, so would be grateful for some help in this regard.


>
> thanks
> -- PMM



-- 
Regards,
Ajay
