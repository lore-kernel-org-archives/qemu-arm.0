Received: by 10.25.159.19 with SMTP id i19csp969991lfe;
        Sun, 7 Feb 2016 10:44:27 -0800 (PST)
X-Received: by 10.55.200.141 with SMTP id t13mr23666009qkl.101.1454870666987;
        Sun, 07 Feb 2016 10:44:26 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t81si15589961qht.15.2016.02.07.10.44.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 07 Feb 2016 10:44:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37158 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aSUJt-0008DF-EM
	for alex.bennee@linaro.org; Sun, 07 Feb 2016 13:44:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56941)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1aSUJq-0008Cj-C3
	for qemu-arm@nongnu.org; Sun, 07 Feb 2016 13:44:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1aSUJn-0007ul-6N
	for qemu-arm@nongnu.org; Sun, 07 Feb 2016 13:44:22 -0500
Received: from zose-mta02.web4all.fr ([185.49.20.43]:43868)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>)
	id 1aSUJm-0007ug-W7; Sun, 07 Feb 2016 13:44:19 -0500
Received: from localhost (localhost [127.0.0.1])
	by zose-mta02.web4all.fr (Postfix) with ESMTP id D1C6143EB2;
	Sun,  7 Feb 2016 19:44:17 +0100 (CET)
Received: from zose-mta02.web4all.fr ([127.0.0.1])
	by localhost (zose-mta02.web4all.fr [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id JFmqlXCa0mBa; Sun,  7 Feb 2016 19:44:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zose-mta02.web4all.fr (Postfix) with ESMTP id 2860F43EB3;
	Sun,  7 Feb 2016 19:44:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at zose-mta-02.w4a.fr
Received: from zose-mta02.web4all.fr ([127.0.0.1])
	by localhost (zose-mta02.web4all.fr [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id QEwvXXxkVdGt; Sun,  7 Feb 2016 19:44:16 +0100 (CET)
Received: from [192.168.1.128] (smm49-1-78-235-240-156.fbx.proxad.net
	[78.235.240.156])
	by zose-mta02.web4all.fr (Postfix) with ESMTPSA id A1E5243EB2;
	Sun,  7 Feb 2016 19:44:16 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1453844678-26279-1-git-send-email-jcd@tribudubois.net>
	<CAFEAcA_xk8ChTA0YppK=mbTZptiL8AGy8RDKQTBS-L0SDaKRXA@mail.gmail.com>
	<56AA6A8C.6030906@tribudubois.net>
	<CAFEAcA-_Bo1UPfjzOZKT6SJ_xb+rMcPPHJ+GAFuDxAObWX-PJQ@mail.gmail.com>
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Message-ID: <56B7907F.2090100@tribudubois.net>
Date: Sun, 7 Feb 2016 19:44:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-_Bo1UPfjzOZKT6SJ_xb+rMcPPHJ+GAFuDxAObWX-PJQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.49.20.43
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 0/6] Add i.MX6 (Single/Dual/Quad) support
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
X-TUID: eTEstHKSUNfo

Le 02/02/2016 18:01, Peter Maydell a =C3=A9crit :
> On 28 January 2016 at 19:22, Jean-Christophe DUBOIS <jcd@tribudubois.ne=
t> wrote:
>> Sabrelite uses uart2 for console but on qemu, this is uart1 that is wi=
red to
>> the default stdout. Consequently, I changed stdout-path in "chosen" to
>> uart1.
> This I find a bit awkward: we'd like to get eventually to the point
> where you can run the stock device tree unedited. The other items
> on your list are just "we don't emulate something yet", so the path
> forward is to (eventually) emulate the missing things. But it's not
> clear to me what we need to do to be able to stop editing stdout-path
> in the future.
>
> Perhaps the answer is just to use QEMU command line arguments to make
> stdout be the uart2 rather than uart1?

I'll send a new version where the platform (sabrelite) can chose=20
(through properties) which uart of the SOC (i.MX6) it wants to use as=20
default output.

>
>> For now i.MX6 SOC code does not emulate SPI controller. During the boo=
t
>> Linux was getting stuck trying to access a SPI device that is supposed=
 to be
>> there. Therefore I disabled the SPI controller in the device tree.
> This is OK for now, though I guess it means the SPI controller is
> worth emulating to at least some extent.

I'll see what I can do next.

>
>> The sabrelite is supposed to have a bunch of push buttons (home, power=
,
>> back, vol up, vol down) wired to various GPIOs. I guess these buttons =
might
>> have pull up or pull down resistors on the real hardware but obviously=
 on
>> qemu we have no such things. As a results the GPIOs were triggering a =
lot of
>> interrupts for nothing. So I commented out the GPIO sections were the
>> buttons were defined.
> This is OK for now, though it would be nice to wire all the GPIOs to 0 =
or
> something if that helps avoid the problem without editing the DT.

Ditto.

>
> thanks
> --- PMM
>

