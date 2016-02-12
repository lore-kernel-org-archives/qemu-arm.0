Received: by 10.25.159.19 with SMTP id i19csp898331lfe;
        Fri, 12 Feb 2016 07:49:28 -0800 (PST)
X-Received: by 10.140.96.245 with SMTP id k108mr2861109qge.31.1455292167959;
        Fri, 12 Feb 2016 07:49:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 139si16245771qhi.109.2016.02.12.07.49.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 07:49:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:33779 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aUFyJ-0002Ae-HY
	for alex.bennee@linaro.org; Fri, 12 Feb 2016 10:49:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aUFyH-00028F-7s
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 10:49:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aUFyG-00067V-96
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 10:49:25 -0500
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:34106)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aUFyG-00067C-4I
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 10:49:24 -0500
Received: by mail-vk0-x22c.google.com with SMTP id e185so63556875vkb.1
	for <qemu-arm@nongnu.org>; Fri, 12 Feb 2016 07:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ls5oTrLqxIqHek0IbUld8lpMJZcA8ppRx9cygfFil7I=;
	b=LAUCZS58fOIHAcElbZrJJLkYd+x65bpeUnVdCMkGPrEFHBC/BWMdJSc1AZSss5j8XM
	E/pcVWfVJ2ybzFoEu7d3MSLF6DBtW8p/Ylm99kFgSWhF2xqHUutq+A3GhyLCQ93lRHYQ
	30iJ4kvC0t2VJG21YAfajr9K/t0woO77C90Ko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ls5oTrLqxIqHek0IbUld8lpMJZcA8ppRx9cygfFil7I=;
	b=X5+2cjz/pY8USn5YXIJrWIWUqyu0IpgoouVU70i3c0dx9355aMPggmVTlnPqDmp0d8
	RJTwc1T2dwG6PwDXJ+87s9LdTCj65dKyjOl14hy3ObXn/JyhuNBzVQslI9+Gxhta+188
	q6/s+TmgCHga5M0GIQaQDy0YkNyMr0NsQS5LRBklZauUawesyucgTFADxzrk56IC7mYU
	taWPHEKK0T+HieAh2wpvZwJS04Fw2Varahy7UXdV2TdmOarKKGiDR0rHDgM/gwb/d8yi
	zd6baMW1Dja0pJtavTMEKxKQn3DvyHm4AT+APVdOmenDCQt5TTclvnWvLEXkfZKCY6eK
	i43A==
X-Gm-Message-State: AG10YOS54lSeWKWDeoaG2Dk3sz2/hlcmSsqBqoIx+2iUqheGuoTImHDld7Z/Pg8pk96U5Hs8cfZn8OMmvt5K3W9K
X-Received: by 10.31.107.194 with SMTP id k63mr1687382vki.27.1455292163563;
	Fri, 12 Feb 2016 07:49:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 12 Feb 2016 07:49:04 -0800 (PST)
In-Reply-To: <20160212151608.GI31433@toto>
References: <1455217909-28317-1-git-send-email-peter.maydell@linaro.org>
	<1455217909-28317-4-git-send-email-peter.maydell@linaro.org>
	<20160212151218.GG31433@toto>
	<CAFEAcA_00+sVTot-q5iHKLDiLbPRFsRTBQNE4Dbswt1haaxwGQ@mail.gmail.com>
	<20160212151608.GI31433@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Feb 2016 15:49:04 +0000
Message-ID: <CAFEAcA_hUBO2034iP-hM3qjEMjGj39PNCZuxioj04WO1TXBj7A@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-arm] [PATCH 3/4] target-arm: Combine user-only and
	softmmu get/set_r13_banked()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: l3fyvrbZ4hsL

On 12 February 2016 at 15:16, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> On Fri, Feb 12, 2016 at 03:15:22PM +0000, Peter Maydell wrote:
>> On 12 February 2016 at 15:12, Edgar E. Iglesias
>> <edgar.iglesias@gmail.com> wrote:
>> > On Thu, Feb 11, 2016 at 07:11:48PM +0000, Peter Maydell wrote:
>> >> The user-mode versions of get/set_r13_banked() exist just to assert
>> >> if they're ever called -- the translate time code should never
>> >> emit calls to them because SRS from user mode always UNDEF.
>> >> There's no code in the softmmu versions that can't compile in
>> >> CONFIG_USER_ONLY, so combine the two functions rather than
>> >> having completely split versions under ifdefs.
>> >>
>> >> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> >
>> > Hi Peter,
>> >
>> > Do we really need the assert?
>> > If we keep it, can't we have it for both -user and -softmmu (avoiding the ifdef)?
>>
>> I would be happy to entirely drop the assert, yes.
>
> OK, thanks.

It turns out that the compiler was being clever and dropping all
the code after the g_assert_not_reached(), which meant I didn't
notice that bank_number() is only compiled in in the softmmu build.
We should just move bank_number() into being a static inline in
internals.h, I think -- it's pretty trivial. Will send that patch...

thanks
-- PMM
