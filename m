Received: by 10.182.158.201 with SMTP id ww9csp3384553obb;
        Wed, 2 Dec 2015 15:09:51 -0800 (PST)
X-Received: by 10.55.215.137 with SMTP id t9mr7220119qkt.23.1449097791144;
        Wed, 02 Dec 2015 15:09:51 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q94si5856998qkh.115.2015.12.02.15.09.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 15:09:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:60719 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4GX0-0003x8-ML
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 18:09:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4GWz-0003wk-0k
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 18:09:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4GWy-0006RN-4i
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 18:09:48 -0500
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:36260)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4GWy-0006RH-0j
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 18:09:48 -0500
Received: by vkay187 with SMTP id y187so34885319vka.3
	for <qemu-arm@nongnu.org>; Wed, 02 Dec 2015 15:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=PKxvrFXtY4xx41JrJ7veEWu/liKZ69969fzxmc5lqbA=;
	b=dSdVkmK2fe0obffkPmyytikdpbOqWdxc9f/PqLvr8ZRgDSJdPLScDLtv14WhzoWETI
	NZqfcESjYCm+Ttrrm/oinfUwRAwYpZdcEJLbCJov475zy+kKxg1HML/kXO+NK7iVzfKM
	Ia27sQ2ItkiZro9L1KFSnDfNKNhl9wVRAR1sK1kveJcR9NM/gLprwiL1ENPdRpaa6LE6
	HrgYHs7msVkN0zGojAQxOlmr57hGv5kHA0t2npFAsLQbpAQYy8avzcjfXxVxd3FZPtRa
	8ylOGYEagSO6mUzT4kN9nSP27uVlRDamKXqYioEWWc4zorMjIrFz6e+IkfH5BhDMOmd7
	wRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=PKxvrFXtY4xx41JrJ7veEWu/liKZ69969fzxmc5lqbA=;
	b=QV1lMmeum6OwAIJM1I6NcmR1eVkFvOd/5hnNw8FcD6iBUXBESrWuyA7FIvUVkguH5x
	XnSoxBZSuCnzQQ6dEz+PfHE76WohqvGNvMjV9xZz9xqkql+RLz7PI7yAI5QyMllRN1uP
	6Af5mSrNtOt3Om2xBTjkMDrGHy6Qrrp95nVWAlnfpCvuGcZupCt7Oupk7g/kOddB9BLo
	TGKNnfroBqgLZ4SOUa1s0c/lVdf0oesPGTR0SEfRaqZwLpQ740QmsJ3KMMUiWXBvn21X
	nvVEQfQ4TtiheM3QRy7OHifmWReb5aVMHwN5i6o8Cmhwu5uBQeL9DwuQHjWCzMutIWeE
	/NGA==
X-Gm-Message-State: ALoCoQmuueyNVh6+3oI+vnS7N7+U/WlI7DCrH9wHId3lw0aauLh4PN4rUz72Ara/eb1OI6YlrytM
X-Received: by 10.31.47.197 with SMTP id v188mr4000919vkv.6.1449097787554;
	Wed, 02 Dec 2015 15:09:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Wed, 2 Dec 2015 15:09:28 -0800 (PST)
In-Reply-To: <565F76E7.4060305@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
	<1447031505-12477-5-git-send-email-mdavidsaver@gmail.com>
	<CAFEAcA-yuKpZzEV1T1VMOU1HPbspTHP8PsSw80=UPr7mw2aBjw@mail.gmail.com>
	<565F76E7.4060305@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Dec 2015 23:09:28 +0000
Message-ID: <CAFEAcA8E8ovic9A7RDHG1p7Z8rVC126TGRkQ9Q=o=574teBZ_g@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 04/18] armv7m: Explicit error for bad vector
	table
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
X-TUID: pA972nnpnEo5

On 2 December 2015 at 22:55, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> On 11/17/2015 12:33 PM, Peter Maydell wrote:
>> The behaviour on a failed vector table read is actually architecturally
>> specified: we should take a nested exception (escalated to HardFault).
>> If it happens while we're trying to take a HardFault in the first place
>> then we go into Lockup (where the CPU sits around repeatedly trying
>> to execute an instruction at 0xFFFFFFFE; it is technically possible
>> to get back out of Lockup by taking an NMI or a system reset).
>>
>> That said, trying to get nested exceptions and priority escalation
>> right is fairly involved, and implementing lockup is both involved
>> and an exercise in pointlessness. So I think this code is an
>> improvement overall.
>
> This is my thinking as well.  One point against it is that abort() is
> inconvenient when using '-gdb'.  I'm not sure if there is something
> else which could be done (cpu halt?).

I can't think of any immediately good suggestions. It is probably
worth at least commenting (a) places where we are not doing the
architectural behaviour (b) places which should go into Lockup.
Then we can find them later if we come up with a better idea...

thanks
-- PMM
