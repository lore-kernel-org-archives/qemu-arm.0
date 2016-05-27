Received: by 10.25.27.66 with SMTP id b63csp43992lfb;
        Fri, 27 May 2016 02:01:59 -0700 (PDT)
X-Received: by 10.140.84.229 with SMTP id l92mr12016261qgd.100.1464339719105;
        Fri, 27 May 2016 02:01:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h140si16736774qhc.40.2016.05.27.02.01.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 May 2016 02:01:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44740 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b6DeY-0003RJ-GO
	for alex.bennee@linaro.org; Fri, 27 May 2016 05:01:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b6DeR-0003Ph-Pw
	for qemu-arm@nongnu.org; Fri, 27 May 2016 05:01:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b6DeP-0005dg-Qf
	for qemu-arm@nongnu.org; Fri, 27 May 2016 05:01:50 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:32780)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b6DeP-0005dS-Dr
	for qemu-arm@nongnu.org; Fri, 27 May 2016 05:01:49 -0400
Received: by mail-vk0-x229.google.com with SMTP id r140so135641986vkf.0
	for <qemu-arm@nongnu.org>; Fri, 27 May 2016 02:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=nhwIrp+aEKw9aLvw2b/sVsfKtfjs8/E6ovZ6N+Zz8/I=;
	b=P8dOV295Eh8E4YBprECPt4KxVEjER2lbohUNZutbBLV1yhGexrw5duCDOdNcl5PSAn
	C05qGsqWk5oMpI7DdxNo4GDiUK86XFZN4pVwKFANq0w6KPK/uAaGSF8qfawBoMdgAkwU
	XjPozaDGdSShyo/eeKNwMJlo/+0yYYk2LfMlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=nhwIrp+aEKw9aLvw2b/sVsfKtfjs8/E6ovZ6N+Zz8/I=;
	b=aSAqqh/8ZJAE38nSlVWVF+v30mgqyPzM+A+lv5DXLmxt1tBt3j1Qrd3wVl55edGLXm
	k6uWigDbUoSM0hnwBG4G9m71TzhSAaC84Yy6plWukuJVbjh54NcVxXxAo/4c75U41/Jw
	OZg+4GE0eYF5h5NHau+fRhEXqIGCt/YP1NYQyvyNELGJz8vNIRP6nDc7sGcbbOmKW0G7
	sH9/rvjHCswRNNJwnCOT7H+VTrNEqzc7u6EkuEbFs8IhnbVMsR8MHZUFYB/NzGiN7ToZ
	ucmY8qCxtBitOYzUM4GdQL43Y8IZWG4rVObSl6e93HC6xTNQnAIwczwN5syh13Yn2ITq
	WwYg==
X-Gm-Message-State: ALyK8tJN57rMNe3oVp7QdQOruIUPCLZV/QrdquNvx4bzMuFj7v9wXJHR4OzWV06YnwSx93hMg/UKbPPoIXUoEl+O
X-Received: by 10.31.88.196 with SMTP id m187mr8044932vkb.37.1464339708825;
	Fri, 27 May 2016 02:01:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.69.66 with HTTP; Fri, 27 May 2016 02:01:29 -0700 (PDT)
In-Reply-To: <5747AB8C.7040502@163.com>
References: <1464173896-4088-1-git-send-email-zxq_yx_007@163.com>
	<1464173896-4088-2-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA8oEjC0wUudEpKKmtbk86eB87KOh-__QB+GrcW6LFy5uA@mail.gmail.com>
	<5747AB8C.7040502@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 May 2016 10:01:29 +0100
Message-ID: <CAFEAcA8XO+6y8LoVnPa-WVKT2+HFFYC8KS5i0yHCa2jjingR=w@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/6] hw/char: QOM'ify pl011 model
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
Cc: Rob Herring <robh@kernel.org>, Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?B?0JDQvdGC0L7QvSDQn9Cw0LLQu9C+0LI=?= <antonynpavlov@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y9my7hlitlE4

On 27 May 2016 at 03:06, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> =E5=9C=A8 2016=E5=B9=B405=E6=9C=8825=E6=97=A5 21:08, Peter Maydell =E5=86=
=99=E9=81=93:
>>>
>>> -
>>> >      /* AUX / UART1 */
>>> >-    /* TODO: don't call qemu_char_get_next_serial() here, instead set
>>> >-     * chardev properties for each uart at the board level, once pl01=
1
>>> >-     * (uart0) has been updated to avoid qemu_char_get_next_serial()
>>> >-     */
>>
>> This comment says this should be fixed by having board-level
>> properties; you've removed it but this patch isn't adding
>> the properties to this (SoC-level) device. I think the board
>> level should be looking at serial_hds[], not this code.
>>
> Hi, Peter:
>
> I found bcm2835-peripherals is only used by bcm2836 code, you mean
> this(bcm2836) is the 'board level' and I should set chardev properties he=
re?

Device models subclass DeviceClass (possibly indirectly).
Boards subclass MachineClass. Only boards should be looking
at serial_hds[]. Sometimes you have a device which is just
a "container" which encapsulates several other devices
(typically this is a model of an SoC). For that kind of
container device, it should expose chardev properties for
its UARTs, which will usually be alias properties for
the properties on the actual UART devices which the
container has.

bcm2835-peripherals is a device, not a board, so it shouldn't
be using serial_hds[].

If it's clearer, you can use a separate patch to push the
serial_hds[] usage out another layer, rather than folding
it into this one.

thanks
-- PMM
