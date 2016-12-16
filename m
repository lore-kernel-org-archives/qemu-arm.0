Received: by 10.103.86.15 with SMTP id k15csp1326271vsb;
        Fri, 16 Dec 2016 05:09:43 -0800 (PST)
X-Received: by 10.55.118.65 with SMTP id r62mr2947769qkc.21.1481893783435;
        Fri, 16 Dec 2016 05:09:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o45si3100013qtc.298.2016.12.16.05.09.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Dec 2016 05:09:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60433 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHsGb-0003c7-32
	for alex.bennee@linaro.org; Fri, 16 Dec 2016 08:09:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jiahuanzhang90@gmail.com>) id 1cHrVO-0006iT-M7
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 07:20:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jiahuanzhang90@gmail.com>) id 1cHrVN-0000bJ-Uz
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 07:20:54 -0500
Received: from mail-qk0-x22c.google.com ([2607:f8b0:400d:c09::22c]:35598)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jiahuanzhang90@gmail.com>)
	id 1cHrVN-0000b6-QB
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 07:20:53 -0500
Received: by mail-qk0-x22c.google.com with SMTP id n204so88600736qke.2
	for <qemu-arm@nongnu.org>; Fri, 16 Dec 2016 04:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=CsublKzDv5va4ltDb9HsZON0599cERmC4hkQCSSIPcI=;
	b=isnOD+htDYEncq4PeeTsrmpK7RonIlv9m4qzzm4dk+T+1+y7lpmID7xyK1vhnlmQeh
	0Y3/mY9xyvnaztAApnQ83Lcc3mA2AvGFRhGkHVepjj4a/152PU1pmJKannkuPBI/5oN7
	bu+aLHhBw7bffxXh++ICPu6E37TEvaBEMpaSuTIT1LI4jKYbCFbUXRqFYpcANMeFMo82
	Ud5845cyD7y45Nx/c9OWwl0KMLgpTwXlkV5kN48De0qN5sTAlr+jVPI1kvdK0WF1Qhz3
	GaAYiWQ+Ep5RkAigNvhQrLFMMf0MfQ65PABA7oSoTNKCEjjXC5C9KCCnjGC0QeYqYHqu
	nTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=CsublKzDv5va4ltDb9HsZON0599cERmC4hkQCSSIPcI=;
	b=LuiSg43Aae28wT9TfOARCGOiJHIBZ+V3rO6cwR1rKbWVIQcMiXB6UPbkQcJ3Yhw/fA
	8ABzntE5W8V1AP8p+0IMdglawKBHvdNZbKK+pkAmC4aJuveeEOXSnZ9EUEnYkMIQMb8J
	BYjrVOMfmIQMOp6nY+aYQ6lQokfqzYICMcfj/7nKkalEXewuIl9P0F4DU29AfUILFKfQ
	58FYexAfbsdMrPMmeVtCYzF+t8ov/hCDfVoBm7ugNZrt/uV/gjPAFrKnpWlgfnJpUdR7
	wAKk7JStDjrPM8aL0wZ86RFKvtfDGWNrL4L6quLXk/tPBuOPJd/N9tDU+B8SOcd1XXou
	kneQ==
X-Gm-Message-State: AIkVDXJPZI5pL+lvstpVCn9BPnPIOtXVxWA8FnWpI++/nVv4qZF58cw1UrZ/BbtTpFDDschKvvpGCAKgH5no9A==
X-Received: by 10.55.197.6 with SMTP id p6mr2601175qki.239.1481890853202; Fri,
	16 Dec 2016 04:20:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.101.139 with HTTP; Fri, 16 Dec 2016 04:20:52 -0800 (PST)
From: Jiahuan Zhang <jiahuanzhang90@gmail.com>
Date: Fri, 16 Dec 2016 13:20:52 +0100
Message-ID: <CAJy91CZtQuBMs_r19miomuZE76ktyY=3cADSBotqhUstpZZ4aA@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary=001a1149a18ce6b0480543c599fe
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::22c
X-Mailman-Approved-At: Fri, 16 Dec 2016 08:06:18 -0500
Subject: [Qemu-arm] Emulation AT91sam9261
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QmT36aQVOLki

--001a1149a18ce6b0480543c599fe
Content-Type: text/plain; charset=UTF-8

Dear All,

This is my first email to you.

I am a student doing an internship about emulating a board based on the
microprocessor AT91SAM9261. I chose QEMU to be the software emulator since
it develops quickly, emulates fast, and is open.

The emulation is very hard since no existing device emulation in QEMU can
be reused to emulate atmel boards. Only the processor, ARM926EJ-S, is
available.

I am looking for people also working on the emulation of atmel boards. I
need the company badly. We can discuss and you can undersand my specific
problems.

Best regards,
Jiahuan

--001a1149a18ce6b0480543c599fe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Dear All,</div><div><br></div><div>This is my first e=
mail to you.</div><div><br></div><div>I am a=C2=A0student doing an internsh=
ip about emulating a board based on the microprocessor AT91SAM9261. I chose=
 QEMU to be the software emulator since it develops quickly, emulates fast,=
 and is open.</div><div><br></div><div>The emulation is very hard since no =
existing device emulation in QEMU can be reused=C2=A0to emulate=C2=A0atmel =
boards. Only the processor, ARM926EJ-S,=C2=A0is available.=C2=A0</div><div>=
<br></div><div>I am looking for people also working on the emulation of atm=
el boards. I need the company badly. We can discuss and you can undersand m=
y specific problems.</div><div><br></div><div>Best regards,</div><div>Jiahu=
an</div></div>

--001a1149a18ce6b0480543c599fe--
