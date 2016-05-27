Received: by 10.25.27.66 with SMTP id b63csp108926lfb;
        Fri, 27 May 2016 04:37:31 -0700 (PDT)
X-Received: by 10.140.85.106 with SMTP id m97mr12528651qgd.41.1464349051634;
        Fri, 27 May 2016 04:37:31 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o9si8011948qge.88.2016.05.27.04.37.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 May 2016 04:37:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45403 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b6G55-0003y5-2e
	for alex.bennee@linaro.org; Fri, 27 May 2016 07:37:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b6G4z-0003vz-Hh
	for qemu-arm@nongnu.org; Fri, 27 May 2016 07:37:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b6G4x-0003u6-KS
	for qemu-arm@nongnu.org; Fri, 27 May 2016 07:37:24 -0400
Received: from m12-17.163.com ([220.181.12.17]:38367)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1b6G4p-0003ry-TU; Fri, 27 May 2016 07:37:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Mime-Version:Subject:From:Date:Message-Id; bh=kkucY
	5EBdPURdOkebYbtxaPWMuR/VC50Q7hB3Le0PqI=; b=EgLxtbhKGjv0fPnPEBshM
	QjWrzcxCF7qnH5MNJeb87ILgqmxW/A5lXqHxxXZ8F4ER8KPuc1FVK3PrreMruRtZ
	GNIeJJlvM5pUf8B1wYupeFvqfP62PVQdYfBniI37DJo8G19neyorFatQDtpS4Gax
	HgIIizSz+lUNEjLwdr+lhU=
Received: from [10.162.33.50] (unknown [223.104.38.41])
	by smtp13 (Coremail) with SMTP id EcCowACHlrpMMUhXZASBDA--.25962S2;
	Fri, 27 May 2016 19:36:45 +0800 (CST)
Content-Type: text/plain;
	charset=gb2312
Mime-Version: 1.0 (1.0)
From: xiaoqiang zhao <zxq_yx_007@163.com>
X-Mailer: iPhone Mail (13F69)
In-Reply-To: <bf2900b6-980f-6a0c-fabe-6037b7592647@redhat.com>
Date: Fri, 27 May 2016 19:36:43 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <E3903DF9-3C5C-4A2B-8737-20A64EBEF6C6@163.com>
References: <1464173896-4088-1-git-send-email-zxq_yx_007@163.com>
	<1464173896-4088-2-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA8oEjC0wUudEpKKmtbk86eB87KOh-__QB+GrcW6LFy5uA@mail.gmail.com>
	<5747AB8C.7040502@163.com>
	<CAFEAcA8XO+6y8LoVnPa-WVKT2+HFFYC8KS5i0yHCa2jjingR=w@mail.gmail.com>
	<bf2900b6-980f-6a0c-fabe-6037b7592647@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
X-CM-TRANSID: EcCowACHlrpMMUhXZASBDA--.25962S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrKry8GrWrZry3Gw15Xw17trb_yoW8Jr43pa
	ySqF4fKa1UKw18Cw4DZr1rua10kFyfJFZxJrWxXr4Yka98Xrn5GF92ka4j9a47WF1kJayU
	KrWxGFyruas2qFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UFiiDUUUUU=
X-Originating-IP: [223.104.38.41]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiOw12xlXlTxSzAAAAse
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.17
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
	=?GB2312?B?p6Gn36fkp+Cn3yCnsafRp9On3afgp9M=?= <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SSBl0ixnTEDZ



> =D4=DA 2016=C4=EA5=D4=C227=C8=D5=A3=AC17:42=A3=ACPaolo Bonzini <pbonzini@r=
edhat.com> =D0=B4=B5=C0=A3=BA
>=20
>=20
>=20
> On 27/05/2016 11:01, Peter Maydell wrote:
>>>> I found bcm2835-peripherals is only used by bcm2836 code, you mean
>>>> this(bcm2836) is the 'board level' and I should set chardev properties h=
ere?
>> Device models subclass DeviceClass (possibly indirectly).
>> Boards subclass MachineClass. Only boards should be looking
>> at serial_hds[]. Sometimes you have a device which is just
>> a "container" which encapsulates several other devices
>> (typically this is a model of an SoC). For that kind of
>> container device, it should expose chardev properties for
>> its UARTs, which will usually be alias properties for
>> the properties on the actual UART devices which the
>> container has.
>>=20
>> bcm2835-peripherals is a device, not a board, so it shouldn't
>> be using serial_hds[].
>>=20
>> If it's clearer, you can use a separate patch to push the
>> serial_hds[] usage out another layer, rather than folding
>> it into this one.
>=20
> I agree.  This patch is fine (perhaps with the FIXME comment left
> there); then chardev properties can be added to bcm2835-peripherals and
> set in bcm2836.
>=20
> Thanks,
>=20
> Paolo
>=20
Much clear.
Thank you guys=A3=A1=


