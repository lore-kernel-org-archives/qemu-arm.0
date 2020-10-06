Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n66sm3254254wmb.35.2020.10.06.02.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 02:58:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9FCFB1FF7E;
	Tue,  6 Oct 2020 10:58:46 +0100 (BST)
References: <47dbcad4-3121-b1c3-06fa-abec7c353fb6@gmail.com>
 <87sgatanti.fsf@linaro.org>
 <CAFEAcA_ZMLV3DZ_R_SHvPLdEf=i-xpspD5itBmfYeqyMhgtLWQ@mail.gmail.com>
 <875z7p3t9e.fsf@linaro.org>
 <e43be86d-1847-199f-4cbd-2e3bd124d70a@gmail.com>
 <CADBGO794+ZPD=B=dFuA7SC96g3GDJXF1A8j=VP6MeiSw1Sf4oQ@mail.gmail.com>
 <d8d79b4c-aeb4-4f07-7110-91d8d1afd701@gmail.com>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Schneider <74cmonty@gmail.com>
Cc: Paul Zimmerman <pauldzim@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, QEMU
 Developers <qemu-devel@nongnu.org>, Andrew Baumann
 <Andrew.Baumann@microsoft.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>
Subject: Re: Emulate Rpi with QEMU fails
In-reply-to: <d8d79b4c-aeb4-4f07-7110-91d8d1afd701@gmail.com>
Date: Tue, 06 Oct 2020 10:58:46 +0100
Message-ID: <87362r3cbt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: yRzyMgtNBVbX


Thomas Schneider <74cmonty@gmail.com> writes:

> Hello Paul,
>
> many thanks for sharing this info.
>
> Can you confirm that the emulated RPi with your command will use=20
> "internal QEMU" network, means the client cannot be accessed from any=20
> other device in LAN?

The support for user-mode and TAP networking is orthogonal to the
emulated device. However if you only want a few ports it's quite easy to
use port forwarding, e.g:

  -netdev user,id=3Dunet,hostfwd=3Dtcp::2222-:22

which forwards 2222 to port 22 on the device. I have an alias in
.ssh/config for accessing my QEMU devices.

> If yes, what is required to setup a TAP connected to host's network
> bridge?

I'll defer to others for this but generally when I want proper bridged
networking for a VM I use virt-manager/libvirt to configure it because
it can be quite fiddly to do by hand.

--=20
Alex Benn=C3=A9e
