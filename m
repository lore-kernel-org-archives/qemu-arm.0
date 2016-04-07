Received: by 10.25.208.211 with SMTP id h202csp333685lfg;
        Thu, 7 Apr 2016 00:05:11 -0700 (PDT)
X-Received: by 10.140.28.117 with SMTP id 108mr1589379qgy.40.1460012711166;
        Thu, 07 Apr 2016 00:05:11 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t18si4917532qgd.30.2016.04.07.00.05.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Apr 2016 00:05:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@livius-net.20150623.gappssmtp.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47974 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ao406-0005Ga-54
	for alex.bennee@linaro.org; Thu, 07 Apr 2016 03:05:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ilg@livius.net>) id 1ao3zk-0004xL-HP
	for qemu-devel@nongnu.org; Thu, 07 Apr 2016 03:04:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ilg@livius.net>) id 1ao3zg-0000oI-Gn
	for qemu-devel@nongnu.org; Thu, 07 Apr 2016 03:04:48 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:34268)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ilg@livius.net>) id 1ao3zg-0000ny-AV
	for qemu-devel@nongnu.org; Thu, 07 Apr 2016 03:04:44 -0400
Received: by mail-wm0-x242.google.com with SMTP id n3so18895224wmn.1
	for <qemu-devel@nongnu.org>; Thu, 07 Apr 2016 00:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=livius-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=stDanXOINebDykmFY+OUjFrVNZpEZEq5m1Fp1uWnCig=;
	b=irzAqzRTwKTn5f9KV7Ib+cOkwSjXBlIqozQqOrhl9BTuHcq/7CdHtbYgpakmwh+Vb9
	+ufTC+3d6uyjkESU+M1QikyNJkfrBiDRKAsWB+BqtFliVvLl2agaYf8JuU7cRflGWydD
	Kzm3xQwaITDAUZX9ZGslyiOAMXL8oVwxFzlOlliJgT48wMHRBOR0GHrxnwx1pu9BkMzg
	0TAMiMsfxf5fTCAE9bekfC5HXidztSFo0+EWz+sR2MdBQ0rhOuklyTVMcjc3xgOPWOki
	mVF5OdKJ7iH/QYbpIqHbiRHH1WpdFp8Fi59WAtmaFQqFU3MhwFwr4EM/nYAcUTlKlQXZ
	FLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=stDanXOINebDykmFY+OUjFrVNZpEZEq5m1Fp1uWnCig=;
	b=IpaHtK5cw6S0BRr+4aWmXj7KNYtAzKHJL4zHMTayYNH2Qm9/QxYX8fZqPaS5Z0lB4O
	rSjIkIM3UMjz5FNL1YgD/prlULbpfY/MZAOvXvp0Szr+L1ZWo61WU4P8tmMrIFVkkgsU
	KyfLdAtKX25FahlekJUQXTTZaBgiOfdzwAPcdeIY7dqRN+IzeaBL00fCXHaeDs/sTP7V
	CuAby1lB50tfqd63lt5zvuxol5kQ9Ts87mji0D6/357WS+b13EpHJan26QgBjABjO6RC
	59lRYDsWm1Lj5s6b+ksEYo3pgb9bqc6od49PwsKu0hxX1E3U4/2B+30ZoYgJbp7pKyih
	S9Uw==
X-Gm-Message-State: AD7BkJKFOsGEXOyx3QoITM9TJ/Vdfq3LU6ogd8igYNJSE1kVCUxkjSK+G7lssfar0bFI8w==
X-Received: by 10.194.71.226 with SMTP id y2mr1573114wju.127.1460012682681;
	Thu, 07 Apr 2016 00:04:42 -0700 (PDT)
Received: from [172.16.62.12] ([109.99.239.84])
	by smtp.gmail.com with ESMTPSA id a73sm6012835wme.2.2016.04.07.00.04.41
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Apr 2016 00:04:41 -0700 (PDT)
Content-Type: text/plain; charset=windows-1252
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <5705ADE6.3070502@gmail.com>
Date: Thu, 7 Apr 2016 10:04:39 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <180818FF-6753-48F5-8BE8-CA72AA2B811A@livius.net>
References: <4472FF70-5E47-41AA-893C-01CF82C8BA2D@livius.net>
	<CAFEAcA-PM5GCL0RNhPm9bsMZm_ya7vdES0SG=ozwCKY2dCQWjg@mail.gmail.com>
	<F9E27184-2608-41F7-ABDE-FB02DB46A593@livius.net>
	<CAFEAcA9mmAL8cdL7Ayvg0kLq5LZbt5fiKsBVaCJ5XAwTNObaGA@mail.gmail.com>
	<49544542-7BDE-4C03-843C-7852D345CF46@livius.net>
	<CAFEAcA8m5z_HZHLKx0985nFVwK1tHoQYH6b9kmCP0X8hK5R-RA@mail.gmail.com>
	<D2CD166F-5E77-4BA1-B468-64296F379D05@livius.net>
	<5705ADE6.3070502@gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
X-Mailer: Apple Mail (2.3124)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] Any progress with the Cortex-M4 emulation?
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
X-TUID: 7/UbJFQECu3S


> On 07 Apr 2016, at 03:46, Michael Davidsaver <mdavidsaver@gmail.com> =
wrote:
>=20
> ...  don't hesitate to appropriate, or ignore, what I've done so far. =
...
> https://github.com/mdavidsaver/qemu/tree/fixirq2

from what I see here, the nvic is still one big monolithic device.

as I said before, I like modular things, and, even if this might be a =
little slower, I'd split nvic:

"the current plan is to create a new object (probably called SCS - =
System Control Space), that will cover the 0xE000E000-0xE000EFFF area =
and inside it to map SysTick, NVIC, SCB, MPU, Debug and FPU as separate =
objects."

another difference is that I have a very elaborated infrastructure to =
manage registers, and I'd like to use it for the system registers too.

fyi, a simple device is:

	=
https://github.com/gnuarmeclipse/qemu/blob/gnuarmeclipse-dev/hw/gpio/stm32=
-gpio.c

a more complicated device (in terms of tables, otherwise the additional =
actions are minimal) is the=20

	=
https://github.com/gnuarmeclipse/qemu/blob/gnuarmeclipse-dev/hw/misc/stm32=
-rcc.c


this table-driven way of implementing peripherals is specific to GNU ARM =
Eclipse QEMU and I plan to further improve it, with an automated tool to =
generate the tables.

Peter expressed concerns that this infrastructure will clash very badly =
with your work. actually it shouldn't, because it is completely =
separated, there are 3 objects =
(Peripheral/Peripheral-Register/Register-Bitfield).

in general none of the changes I did in GNU ARM Eclipse clash with =
existing code, because I use separate objects, from separate "cortex-m*" =
mcus, to separate peripherals and separate boards.

unfortunately nobody else expressed any interest in this new =
infrastructure, so it is available only in GNU ARM Eclipse QEMU.

> Separately, I have a set of target test programs which I can run both =
with qemu and a real board.  They mostly agree.  Aside from test8.c =
(MPU) they might be of interest.
>=20
> https://github.com/mdavidsaver/baremetal/tree/qemutest

ok, good to know.

however projects generated by GNU ARM Eclipse use a distinct trace =
infrastructure, I'll probably create a separate test inspired by your =
code.


regards,

Liviu

