Received: by 10.25.159.19 with SMTP id i19csp1193394lfe;
        Fri, 29 Jan 2016 14:22:46 -0800 (PST)
X-Received: by 10.55.53.208 with SMTP id c199mr13962545qka.109.1454106166762;
        Fri, 29 Jan 2016 14:22:46 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t67si17293085qkl.123.2016.01.29.14.22.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 14:22:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36698 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPHRG-0006Eo-7O
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 17:22:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59089)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aPHRD-0006C3-DY
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 17:22:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aPHRC-0004O2-L3
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 17:22:43 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:33115)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aPHRA-0004NZ-M9; Fri, 29 Jan 2016 17:22:40 -0500
Received: by mail-wm0-x241.google.com with SMTP id r129so12288468wmr.0;
	Fri, 29 Jan 2016 14:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=E2+OlZmuDmBUl2zCh3SbveqqCFw6GqAPyJu7Z2pDvnI=;
	b=LR3Rl5eFWjFoWLFrVqZ5FtHnYxRw0sa9ULP49mTyqDCBwU3BT24ssF7hTaTp92qNsb
	V0mPJTCuUA6JKe53C/y5WwFSeyHUxHpjJ/J15yYIVzoCOzaNJK2i/1ogCkNNVlxdDjBA
	cVCayRBT7smDd2OgtlgwEYXN3orIHE/adDlKwYZPZA8HZFN0M/OZJNj0XP0HaEt1dZpS
	e6tiRfyzN8Xb7A0O4nurB0iy2BrsxT1/C+0ii5Zpie8Qixn9MhbMqeYWM6S4jxYqexn0
	v+6Mbb+a+hnHqffgBsQh5lJXnfDcScudj+L1qv51wHd4H4P//StaT9jVXSKNXod8TtmJ
	+h/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=E2+OlZmuDmBUl2zCh3SbveqqCFw6GqAPyJu7Z2pDvnI=;
	b=S1P2Eo6JLfQm7pBjdC2zDg7/uHq//q/aixd1xrEjYL3N96VQq5R2pmUsneLZP+AMxH
	GHZzZJMmNISY9gKqCw4hKrh4kw5Iy0f5NZteXdc7k5sr+h7BjGR9wgy3xya5d5Af/ZGo
	FdVabbCZBY1OxNOYckcU8N1X5WFWB806hgq9BC781z8SfyylYf6IE1z37//I68A8lsnQ
	ppLEokokjCOY9ms8yp/ftHyEatauWGTMWAmCQ/CLZuIJESiuKfY8Zvk2iocHBuAD3r8R
	VniUHIZhP2+KdoIhEmTMPVwTSJ6xPI5F8hOU39EctWZBzHYgizcF9kydPI7CCDfWjWaS
	4Clg==
X-Gm-Message-State: AG10YOSajuCFm1BdNoHMGiBTO2RNIneyP+2niOIRE43PqQ5vP69/pOjyBwWe9YIqVAb24KcvSYbaETLTtAAaXA==
MIME-Version: 1.0
X-Received: by 10.194.22.132 with SMTP id d4mr11181476wjf.174.1454106159969;
	Fri, 29 Jan 2016 14:22:39 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Fri, 29 Jan 2016 14:22:39 -0800 (PST)
In-Reply-To: <BLUPR0301MB2034170EF1FBCB3856E044FB9EDB0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1452902337-13844-9-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=ory3pnNPsBgde12BqGGW_L3QOG0OVdtLNJomK0QhxxYQ@mail.gmail.com>
	<BLUPR0301MB2034170EF1FBCB3856E044FB9EDB0@BLUPR0301MB2034.namprd03.prod.outlook.com>
Date: Fri, 29 Jan 2016 14:22:39 -0800
Message-ID: <CAPokK=pLw9OVv3_FHedk12byTu0gjGFy80UT1T1TUFTewi5kpg@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [Qemu-arm] [PATCH v4 8/8] raspi: add raspberry pi 2 machine
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
X-TUID: s754J79Qxs2Q

On Fri, Jan 29, 2016 at 1:50 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> Hi Peter,
>
> Thanks for all the reviews. I should have a respun version on the list shortly. There's one minor change to this last patch:
>
>> From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
>> Sent: Thursday, 28 January 2016 23:31
>> > On Fri, Jan 15, 2016 at 3:58 PM, Andrew Baumann <Andrew.Baumann@microsoft.com> wrote:
>  [...]
>> > +typedef struct RaspiState {
>>
>> A quick google search, I see the camel case form for rpi is usually
>> "RasPi". Should we follow?
>
> Ok.
>
>> > +    union {
>>
>> union not needed.
>
> I know it's not needed now, but it will be as soon as we add pi1, which I hope to address in the next patch series. It will make that diff cleaner if we keep this here now, so I'm going to leave it as-is. I hope that's ok with you.
>

It sounds like you are implementing an inheritance outside QOM. I'm
not sure about this, can we just drop the union and figure it out on
the next series?

Regards,
Peter

> Thanks,
> Andrew
