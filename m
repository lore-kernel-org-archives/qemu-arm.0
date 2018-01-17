Received: by 10.28.173.206 with SMTP id w197csp5459263wme;
        Wed, 17 Jan 2018 08:23:51 -0800 (PST)
X-Google-Smtp-Source: ACJfBos5bcYoiOOpbHfn4HLdHax6wr6ZHBjfk8vijTeNTxDyadBwJyLuK4WEs4tqKjr8qNPDhrCE
X-Received: by 10.37.189.207 with SMTP id g15mr18836392ybk.509.1516206231189;
        Wed, 17 Jan 2018 08:23:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516206231; cv=none;
        d=google.com; s=arc-20160816;
        b=Bt1PqPxpJ/Hh7DeBfytkqUXFNVukTC2Ka3FlxVpF/pH0hw4mTgLlblQN/4J0phldih
         lkL956+aztMM1t9JCBJgsdUb6guig+Z8mXF7s2oYUdgQVeQdjw5zgv8ofqxPxnwVEFdi
         Azs4XKMh9pfrUbA3GVXF0HX3ntUzXv2vrcyW3KpUhYjq0Hp2T4e7+Xi+ZdUUR8tR1Rki
         9hcitKOiD40k2d4jaboeEv1H78y7hL9ZVSlCMQddvqJ3ylKMdSBG5mgNXYi30XZVWvIm
         rJ9q0nFA3TopZjBsUY+5SA+rO88sqbz+IdeXX/E1X1r4S8KDjdA01CnWtSSoXvh9Vuht
         iBtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=6FChVCrkoulLsqEdR9KK8Y4c/0LEwp8GsTanAN37dtU=;
        b=L6RdONSL/D/i7vr1mg7AFL+RZAfVJbF7fG9+Nl8RzpgCrWH7I4JbqU0LKCl/kHi+5O
         tQETL191am82r3Vc689mJDnGZ3B/6ZWxaUF+E2lhLr0QeFjQPmta1vyz3DE8/0X5+jDY
         GSRwnO048tzyz1vYg9BJvp5APNdhVKTobAp15tnaaXYXKHZb74kQFWxlKw2uZvFA1doQ
         Ykx3/D6meNNYsYeaTgZpV4vyrP3p+4JV1AXGzCf+ARopDhQMKMJNNcsAS8xBgdFAeJ/N
         hnzaexqeSLoExGWlFgsQGAEMBo3sctxOeNp1QrkI9HIWpIdrVsIrdoqFRbMujTDjWngM
         uIYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NSI+RtJu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 67si1164138ybh.375.2018.01.17.08.23.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Jan 2018 08:23:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NSI+RtJu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45592 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebqVC-0005Jf-IR
	for alex.bennee@linaro.org; Wed, 17 Jan 2018 11:23:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebqKa-0004O2-HX
	for qemu-devel@nongnu.org; Wed, 17 Jan 2018 11:12:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebqKZ-0002nF-Bt
	for qemu-devel@nongnu.org; Wed, 17 Jan 2018 11:12:52 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:37583)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ebqKZ-0002lx-7L; Wed, 17 Jan 2018 11:12:51 -0500
Received: by mail-qk0-x243.google.com with SMTP id y80so19297274qkb.4;
	Wed, 17 Jan 2018 08:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6FChVCrkoulLsqEdR9KK8Y4c/0LEwp8GsTanAN37dtU=;
	b=NSI+RtJuhmk6KQnqcPabxl9SH6nOvrt/W2UJ8tgbIqhliAoaYBeuLqVNoysvfRf+T3
	ITevtrQkmGgVYvT2y+Sz9vbaSQHqp701r95n+dtMrK+i7WpI9y0hW5nsQ5QJrsBjsoX9
	gvYsWUwEP7o9K3TBp7E796AXxIgYN5tgaPWjFYZmI/oLWvwmH0bW2+lp/B4RVkxa8QM3
	QTy99mfwYzuuhiTp4GnNwXT2919oizeGN2da6UuyNxFxhRkBfF/QnIVwJg057nebPrph
	gHJxFRcscoW4+KVyR8+okUFeN15ZbEGVYyUHGmwPO2sgxAucNX0KtjTXKrdmfqZ2iBwT
	0AYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6FChVCrkoulLsqEdR9KK8Y4c/0LEwp8GsTanAN37dtU=;
	b=WwTK6GgPwOyKRwxc/tqcrUvw1mN0ZzYsCkCVohZJcvAPBf6oSknfWaIqbtgbIuUZh/
	UpnIFCnamCzOyKOqbChoqArFLerKjIqV+z49STO1LZIURy6lVQcM5ezg8jzAt/ObjPGh
	kGKX6ux2pB5QId1vPZjwd/K/ugZ8s/f7QHcnzQ11CQjWEgHAwklHur0R17V1JDo1pqQH
	Mj+imzLq1Etqgujh4UIs6TgppGgtY5XHvYHnA18WCvAHesut5THbsFphqovff4jJ0riO
	NYLfMh6khLKLh4or+wX/mg8skY5dxArWNWIY4qO7BJP38QmqvvLA8+CKr2ryJ2pg2DEu
	1gng==
X-Gm-Message-State: AKGB3mL5lZ76IlXrBO4fh3pd7GOR5gWuqmbl4+/fuuQtHeoXh9LGHfT8
	6VBEaEQJleRQKBrPZLNCMFZ6qOtIo2r6n/oDD8E=
X-Received: by 10.55.33.162 with SMTP id f34mr59869259qki.210.1516205569076;
	Wed, 17 Jan 2018 08:12:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.80.240 with HTTP; Wed, 17 Jan 2018 08:12:48 -0800 (PST)
In-Reply-To: <b9661e65-5fb2-46b5-b082-6e768afff7bc@zoho.com>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<20180116013709.13830-10-andrew.smirnov@gmail.com>
	<CAFEAcA-hEgWp58nte89Vs6nZnp4wA6_f8-Vaovm2hiJe9SWwHQ@mail.gmail.com>
	<b9661e65-5fb2-46b5-b082-6e768afff7bc@zoho.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 17 Jan 2018 08:12:48 -0800
Message-ID: <CAHQ1cqFknfW0NmiD-3GFJRedgVE-9bacKhm-pYx0ycviRsmucQ@mail.gmail.com>
To: marcel@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-devel] [PATCH v4 09/14] pci: Add support for Designware
 IP block
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kTm3Z89gGhYi

On Wed, Jan 17, 2018 at 7:23 AM, Marcel Apfelbaum
<marcel.apfelbaum@zoho.com> wrote:
>
> Hi Peter,
>
>
> On 16/01/2018 16:34, Peter Maydell wrote:
>>
>> On 16 January 2018 at 01:37, Andrey Smirnov <andrew.smirnov@gmail.com>
>> wrote:
>>>
>>> Add code needed to get a functional PCI subsytem when using in
>>> conjunction with upstream Linux guest (4.13+). Tested to work against
>>> "e1000e" (network adapter, using MSI interrupts) as well as
>>> "usb-ehci" (USB controller, using legacy PCI interrupts).
>>>
>>> Cc: Peter Maydell <peter.maydell@linaro.org>
>>> Cc: Jason Wang <jasowang@redhat.com>
>>> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>> Cc: qemu-devel@nongnu.org
>>> Cc: qemu-arm@nongnu.org
>>> Cc: yurovsky@gmail.com
>>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>>> ---
>>>   default-configs/arm-softmmu.mak  |   2 +
>>>   hw/pci-host/Makefile.objs        |   2 +
>>>   hw/pci-host/designware.c         | 618
>>> +++++++++++++++++++++++++++++++++++++++
>>>   include/hw/pci-host/designware.h |  93 ++++++
>>>   include/hw/pci/pci_ids.h         |   2 +
>>>   5 files changed, 717 insertions(+)
>>>   create mode 100644 hw/pci-host/designware.c
>>>   create mode 100644 include/hw/pci-host/designware.h
>>
>> I'm not familiar enough with our PCI code to be able to review
>> this, I'm afraid. MST and Marcel are our PCI subsystem maintainers --
>> could one of you have a look at whether this seems to be a correct
>> implementation of a pcie host controller ?
>
>
> Sadly PCI Host bridges do not have a standard, each HW vendor
> can do pretty much what they want.
>
> That being said, if Andrey can point me to the PCI spec for the Designwar=
e
> PCI host bridge and what parts they implemented for it I can have a look,
> sure.
> (I will not be available for a week or so, but right after)
>

Just in case you still want this:

To the best of my knowledge, Synposys does not provide specification
for their PCIe IP to general public and I am in no way affiliated with
them, so I don't have any backchannels to get it any other way.

The next best thing to an actual spec, that I found to be pretty
useful, is PCIe chapter of i.MX6Q Reference Manual
(https://www.nxp.com/docs/en/reference-manual/IMX6DQRM.pdf   page
4049), which is what I used to implement the code in question.

Last, and probably the most important, "source of truth" was actual
Linux PCIe driver for i.MX/Designware which I used as a sort of
inverse reference implementation.

Thanks,
Andrey Smirnov
