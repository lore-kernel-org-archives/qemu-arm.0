Received: by 10.182.158.201 with SMTP id ww9csp40918obb;
        Wed, 9 Dec 2015 13:01:46 -0800 (PST)
X-Received: by 10.141.4.4 with SMTP id g4mr1393199qhd.45.1449694906363;
        Wed, 09 Dec 2015 13:01:46 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z62si10766197qgd.79.2015.12.09.13.01.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 Dec 2015 13:01:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:37799 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a6lru-0006yx-45
	for alex.bennee@linaro.org; Wed, 09 Dec 2015 16:01:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a6lrn-0006xj-3H
	for qemu-arm@nongnu.org; Wed, 09 Dec 2015 16:01:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a6lrm-0003N7-8N
	for qemu-arm@nongnu.org; Wed, 09 Dec 2015 16:01:39 -0500
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:33276)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a6lrm-0003Kv-1q
	for qemu-arm@nongnu.org; Wed, 09 Dec 2015 16:01:38 -0500
Received: by vkca188 with SMTP id a188so67335377vkc.0
	for <qemu-arm@nongnu.org>; Wed, 09 Dec 2015 13:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=bRQ1VbqCklIZLSC/dPZJ9CfM4s6STjRJTJOoiHv6SWU=;
	b=WQf1PhBlqoFJ1RRdbY2QrYHZ1Est9fLlfH9GlQ2fhlQaFkynlTWt+nKlj/C2dFgfVD
	g/c9x2hI8bXlz4gMU7jD0a4Heg17Aym7ahM1GkUGvDGMl08TQaJb9vNEKSvIsrHWmL6q
	NazsA7WYlRqZ+B+l0QXillbRgGwiNbsXKI405THENbJcQyYoonbU9SMcFHI2Vz0OU8Jn
	l4E35yYmqFEu+fvccBX0X421Hr39zcYWgRbBuuRQCms68+f1pOxmzZISWXYOW0P8iUyw
	534sheQ92ZW146zaFdcnQXcbzO+vX0zvA8VctpOzGYQqJAhL0wnnAdKKbadPOMd5X4tA
	IDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bRQ1VbqCklIZLSC/dPZJ9CfM4s6STjRJTJOoiHv6SWU=;
	b=HYj1HYGNxiRZ6VLFMg0gI1KUyVGkH9FKhU/1n6CM+bgDMBq8UzP6SmlaM9Gh/bFuMe
	Rcfj5l+WbHcew9+80MhkzJgwuksZKqEEcIwcbgdXi3kOyEOAjfll/9N900ZvX2EyrXTa
	xQ2GR3Aj1+KwE8gT22lEeHjJBVAYJ3T9XBd2A7aFSUigyGjMBYNQ94OJ1y/q35O5DAy+
	N7PUSNF04hXq+h/QCVgg2bRqQ4v5oZxl0F0CsuDx5NsBizMXLTxKuxDT6XUCDgh2Od/e
	o0rmDBs4tdyfIcfB7rSq3g3d2SxIfE5gleKYARvEUkpe0BUy+VI0vhjuertEKI4Gj+q8
	w3QQ==
X-Gm-Message-State: ALoCoQkcKlFHgfXB4X6zH5UCS/oia0dsgGTBNusRSXKpZQ5qUPRkaFSp4OkaUNqHKfqmehp+dmUtWHxHPXoqMZtPX0GSPODaXzER+Z4Xs9qSsCuFYOxCHIM=
X-Received: by 10.31.180.145 with SMTP id d139mr6452376vkf.83.1449694897245;
	Wed, 09 Dec 2015 13:01:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Wed, 9 Dec 2015 13:01:17 -0800 (PST)
In-Reply-To: <CAPokK=od-urxW-0nkwoxhaip_EqDMnu93v5KF5G58tcrX6G0Xw@mail.gmail.com>
References: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-4-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=oskY5fBigEnpBkm-uKWaRW1+KYsmZLQ9HRrmnMPGYp6Q@mail.gmail.com>
	<BLUPR0301MB2034314DC44EA275D6FC79FA9EE80@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=poJ66bAJDx18WAtvuMCi-_fA=zBUAZAmzxP9Ke3BAzAw@mail.gmail.com>
	<BLUPR0301MB203408E90349BF451ED484B79EE80@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=od-urxW-0nkwoxhaip_EqDMnu93v5KF5G58tcrX6G0Xw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Dec 2015 21:01:17 +0000
Message-ID: <CAFEAcA-=97eWfJ+gfxU+AjKb6h1dNgvam+BgD6VLXKd4+hs2LQ@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Stefan Weil <sw@weilnetz.de>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Kevin OConnor <kevin@koconnor.net>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 4/8] bcm2835_emmc: add bcm2835 MMC/SD
	controller
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
X-TUID: 6Qd4RSIY9Ue4

On 9 December 2015 at 18:54, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> On Wed, Dec 9, 2015 at 10:17 AM, Andrew Baumann
> <Andrew.Baumann@microsoft.com> wrote:
>>> From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
>>> Is that more likely to be an IP connectivity problem (wierd input to
>>> the card-detect pin in the SoC)?
>>
>> That might be it, but in any case I still need to model it somehow.
>>
>
> Ideally, this would be managed on the board level but it is kinda hard
> the way to code is organised. Currently SDHCI is managing the SD card
> instantiation due to a lack of QOMification. So for the moment, this
> would be valid as a boolean property which disables the card detect
> logic completely. If we get the SD QOMification though, the power,
> card detect and sd interface proper can then be more finely managed on
> the board level for all these varying connectivity configurations.

Card detect you should be able to handle on the board level without
waiting for QOMification -- it's just modelled as a QEMU irq line
(the vexpress board connects it up to a random register, or you could
not connect it to anything, etc).

I'm working on the QOMification of sd.c this week, though I'm very
rusty on how to properly model buses.

thanks
-- PMM
