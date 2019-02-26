Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id a184sm11719349wmh.37.2019.02.26.02.46.17
        for <qemu-arm@nongnu.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Feb 2019 02:46:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 54E921FF80
	for <qemu-arm@nongnu.org>; Tue, 26 Feb 2019 10:46:17 +0000 (UTC)
References: <CADdcL-_dA=xQ7dur=ZMWPVhSx=jWk=eF2GDMvp5Pt4RbrT3Lvg@mail.gmail.com>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] QEMU host
In-reply-to: <CADdcL-_dA=xQ7dur=ZMWPVhSx=jWk=eF2GDMvp5Pt4RbrT3Lvg@mail.gmail.com>
Date: Tue, 26 Feb 2019 10:46:17 +0000
Message-ID: <8736oan7ye.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: hXP6RepF4WgX


Benny Baraz <benny.baraz@hexatier.com> writes:

> I wonder if there are restrictions on the host running QEMU emulator.
>
> Can it run on VM (on XEN or ESX) or it has to be a physical machine?

QEMU always has the fallback option of TCG and can emulate a system by
doing dynamic recompilation. There are TCG backends for all the major
architectures. This is however quite slow.

If your question is can I use hardware virtulization while running on a
VM machine then that depends. The feature is called nested
virtualization and certainly works on a number of platforms including
x86. It would have to be allowed by the hypervisor you are running on
though.

>
> Thank you in advance


--
Alex Benn=C3=A9e
