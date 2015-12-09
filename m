Received: by 10.182.158.201 with SMTP id ww9csp62688obb;
        Wed, 9 Dec 2015 13:38:41 -0800 (PST)
X-Received: by 10.140.31.37 with SMTP id e34mr10716124qge.28.1449697121015;
        Wed, 09 Dec 2015 13:38:41 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l3si10929411qki.63.2015.12.09.13.38.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 Dec 2015 13:38:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37946 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a6mRc-00031x-M2
	for alex.bennee@linaro.org; Wed, 09 Dec 2015 16:38:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38908)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a6mR6-0002KD-Hf
	for qemu-devel@nongnu.org; Wed, 09 Dec 2015 16:38:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a6mR5-0005Db-Hs
	for qemu-devel@nongnu.org; Wed, 09 Dec 2015 16:38:08 -0500
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:38089)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1a6mR5-0005DJ-By; Wed, 09 Dec 2015 16:38:07 -0500
Received: by wmec201 with SMTP id c201so92600398wme.1;
	Wed, 09 Dec 2015 13:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Vt2D8gwe8w3b+KmWHcaiIzRiJVqewmYcHyb0aUs6qnA=;
	b=uv5oH4Qcwhje92+cU0IwWC6zM6Ib9irvsvwHvZBATac8Y1jZsxzaZGVtHun19hmqsR
	ZUk/1A6F80GLPDW0CWc3VVA+XloNDE6eUkpjgcJYEAf0I1uER90z/qtFQc7TwNx+76c/
	CJRw/HPZAa8oGn0OyU8nQSO+wn2Bv9PIXefZPq+o/7gXUGv8RsPMh802byN2fLhAVOOK
	6BWUKNKCCHYVjIywf8hgQLMrM8YLWTW1vpdFmP3WWgbMmehDQG7jr6U76zA/nvZJvT2T
	JsltvXetCKSMJib1STAORx9Cqi3H6+s13vXJ0YiO4tenS7/9oPpPTJPeFcVOUY/BYTTM
	orNg==
MIME-Version: 1.0
X-Received: by 10.28.218.75 with SMTP id r72mr34659537wmg.59.1449697086611;
	Wed, 09 Dec 2015 13:38:06 -0800 (PST)
Received: by 10.28.88.11 with HTTP; Wed, 9 Dec 2015 13:38:06 -0800 (PST)
In-Reply-To: <CAFEAcA-=97eWfJ+gfxU+AjKb6h1dNgvam+BgD6VLXKd4+hs2LQ@mail.gmail.com>
References: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-4-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=oskY5fBigEnpBkm-uKWaRW1+KYsmZLQ9HRrmnMPGYp6Q@mail.gmail.com>
	<BLUPR0301MB2034314DC44EA275D6FC79FA9EE80@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=poJ66bAJDx18WAtvuMCi-_fA=zBUAZAmzxP9Ke3BAzAw@mail.gmail.com>
	<BLUPR0301MB203408E90349BF451ED484B79EE80@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=od-urxW-0nkwoxhaip_EqDMnu93v5KF5G58tcrX6G0Xw@mail.gmail.com>
	<CAFEAcA-=97eWfJ+gfxU+AjKb6h1dNgvam+BgD6VLXKd4+hs2LQ@mail.gmail.com>
Date: Wed, 9 Dec 2015 13:38:06 -0800
Message-ID: <CAPokK=r_Ur1qTgvgp+sNFs39fqMVddf1Ju17hWNf_1SG2EuH-Q@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22e
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Stefan Weil <sw@weilnetz.de>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Kevin OConnor <kevin@koconnor.net>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 4/8] bcm2835_emmc: add bcm2835 MMC/SD
	controller
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rKmCPNN2ay5D

On Wed, Dec 9, 2015 at 1:01 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 9 December 2015 at 18:54, Peter Crosthwaite
> <crosthwaitepeter@gmail.com> wrote:
>> On Wed, Dec 9, 2015 at 10:17 AM, Andrew Baumann
>> <Andrew.Baumann@microsoft.com> wrote:
>>>> From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
>>>> Is that more likely to be an IP connectivity problem (wierd input to
>>>> the card-detect pin in the SoC)?
>>>
>>> That might be it, but in any case I still need to model it somehow.
>>>
>>
>> Ideally, this would be managed on the board level but it is kinda hard
>> the way to code is organised. Currently SDHCI is managing the SD card
>> instantiation due to a lack of QOMification. So for the moment, this
>> would be valid as a boolean property which disables the card detect
>> logic completely. If we get the SD QOMification though, the power,
>> card detect and sd interface proper can then be more finely managed on
>> the board level for all these varying connectivity configurations.
>
> Card detect you should be able to handle on the board level without
> waiting for QOMification -- it's just modelled as a QEMU irq line
> (the vexpress board connects it up to a random register, or you could
> not connect it to anything, etc).
>

It's probably worth waiting for the QOMification though, so the GPIO
out has a correct formal owner.

> I'm working on the QOMification of sd.c this week, though I'm very
> rusty on how to properly model buses.
>

The last bus I did was SSI (SPI) which I am reasonably confident that
it is up to date unless we are trying to achieve the "busless" goal or
pure QOM links. When I was looking at NAND QOMification (unfortunately
I didn't make it to conclusion) I noticed that many of the features
were common to SSI, mainly WRT GPIO based individual chip select
lines. Since SD is has SPI compatibility mode an SD card should
actually be a subclass of SSI_DEVICE. I'm thinking the same might
apply on the bus side. So you could subclass SSI_BUS as SD_BUS which
picks up SSI's CS stuff for free while quite naturally having the
consequence of SD cards being SPI devices.

Regards,
Peter

> thanks
> -- PMM
