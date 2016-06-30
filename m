Received: by 10.25.21.96 with SMTP id l93csp390979lfi;
        Thu, 30 Jun 2016 08:02:51 -0700 (PDT)
X-Received: by 10.55.20.170 with SMTP id 42mr18382159qku.168.1467298970173;
        Thu, 30 Jun 2016 08:02:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v35si2864979qtb.4.2016.06.30.08.02.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Jun 2016 08:02:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50809 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bIdUP-0001qz-MN
	for alex.bennee@linaro.org; Thu, 30 Jun 2016 11:02:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bIdUM-0001nk-Kr
	for qemu-arm@nongnu.org; Thu, 30 Jun 2016 11:02:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bIdUI-00010t-Lh
	for qemu-arm@nongnu.org; Thu, 30 Jun 2016 11:02:46 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:35782)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bIdUI-00010f-Gf
	for qemu-arm@nongnu.org; Thu, 30 Jun 2016 11:02:42 -0400
Received: by mail-vk0-x22a.google.com with SMTP id u68so70791926vkf.2
	for <qemu-arm@nongnu.org>; Thu, 30 Jun 2016 08:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=O/jAuQxFvtmvWP1Od3ZGLP/qIoArjVI+5hSN+auu3wM=;
	b=O5MFGqLJggzn4Yozs4LwltDui+7ktnmjcVxSfM7lb0TDL6LxU/hbJBNe5g1uqqsDCU
	Ll1dDAnnL0Q18+anQppfJ60Ajm71lHTpTP30MlnFcBBHjoiiLDbmt3gE17zKmv8b17GB
	wjozv2KP+rCQn/JsY7rWV2/1Mw8zpoI3m18Y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=O/jAuQxFvtmvWP1Od3ZGLP/qIoArjVI+5hSN+auu3wM=;
	b=GYj3Hbn5JKSi2ka6lM0+lUOteCB9/Y+UWeTN2qVTHvSGqi1SAbc6n2W+y+T9v7x/c/
	B7W74vBaKXDB6hcGtat1wCq0XMx8QPgykwysN5dJBPd2Df32zOmcsYsgdZc0FbX4i/AI
	FuT1jvtT7Zek0E+BlbJvI0zea940qkutbnNIq1OWRA1GAtXnSzknXl1fOET6G6IV3h/R
	GtP1x/1qwv8qnL57rxGR9eXemXX/tUNB7lgKtFNJWaZJZazZZl5YuzYWKdr3ZT/I5o8n
	76UXTcwXNErvsZo4o0vh3Nvqd1Lo2Q3tsxa46G2OurdhqicZ//bNTevU60Jb9EZN00PX
	cKaQ==
X-Gm-Message-State: ALyK8tKW+DidIqQVfcsLgi3ucDGcxmMbFLZzNu8lZbeJ7PM4F/WgG2x/L9s52LJuTt+Gh69XNCXYuexcPhoLkKy6
X-Received: by 10.31.7.78 with SMTP id 75mr7233668vkh.74.1467298961695; Thu,
	30 Jun 2016 08:02:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Thu, 30 Jun 2016 08:02:22 -0700 (PDT)
In-Reply-To: <5814242b-8a8c-852a-51e8-268033b51200@gmail.com>
References: <20160625123521.16752-1-digetx@gmail.com>
	<CAFEAcA8HFfuEHP-d8+H3DC06+RpjjXqQoCX81w2Yr+Txsn5fSw@mail.gmail.com>
	<5814242b-8a8c-852a-51e8-268033b51200@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jun 2016 16:02:22 +0100
Message-ID: <CAFEAcA8788W2infUBneuUh4eNMLqPpdNzGXqKESgi+ZKpigdyg@mail.gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Subject: Re: [Qemu-arm] [PATCH v2] hw/ptimer: Don't wrap around counter for
 expired timer that uses tick handler
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2UIE73bQ7JWp

On 27 June 2016 at 19:26, Dmitry Osipenko <digetx@gmail.com> wrote:
> On 27.06.2016 16:27, Peter Maydell wrote:
>> I guess this fixes a regression, but it looks really weird.
>> Why should the timer behaviour change if there happens to be
>> a bottom half present? That should be an internal implementation
>> detail. It's also a bit odd that use_icount is in the check:
>> that shouldn't generally affect device emulation behaviour...
>
> In case of a polled timer that doesn't have ptimer trigger bottom half callback
> setup, we are free to wrap around counter since timer behaviour isn't changed
> from ptimer user perspective, as it won't be able to change it's state in the
> handler.
>
> I just decided to keep that wraparound feature for a case of a polled free
> running timer, this should result in a better distribution of the polled value.
> The potential users of that feature are "imx_epit" and "digic" timer device
> models. I should have mentioned it in the commit message to avoid confusion, sorry.
>
> It is still an internal implementation detail, not sure what you are meaning.
> Could you elaborate, please?

What I meant was: ptimer_get_count() is typically called to generate
a value to return from a register. That's a separate thing, conceptually,
from whether the device happens to also trigger an interrupt on timer
expiry by passing a bh to ptimer_init(). So it's very odd for a detail
of interrupt-on-timer-expiry (that there is a bottom half) to affect
the value returned when you read the timer count register.

thanks
-- PMM
