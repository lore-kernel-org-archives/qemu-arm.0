Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a40eadsm1020530066b.138.2025.03.19.08.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 08:57:42 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 6E8C35F93F;
	Wed, 19 Mar 2025 15:57:41 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Polzini <laurentpolzin@gmail.com>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,
  millian.poquet@univ-tlse3.fr,  clement.aldebert@univ-tlse3.fr
Subject: Re: Raspberry Pi 3B energy consumption
In-Reply-To: <CABsFrshLGcmBEBXCMrOdDv213c1q6GB6pDs4JDLQGKrTzqvkYQ@mail.gmail.com>
	(Polzini's message of "Wed, 19 Mar 2025 13:38:57 +0100")
References: <CABsFrshLGcmBEBXCMrOdDv213c1q6GB6pDs4JDLQGKrTzqvkYQ@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 19 Mar 2025 15:57:41 +0000
Message-ID: <87ecytm2ru.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 0MVQdnhts6Fl

Polzini <laurentpolzin@gmail.com> writes:

> Dear Sir/Madam, My name is Cl=C3=A9ment Aldebert, and I am a third-year c=
omputer science student at Paul Sabatier University.
> Together with my teammate Laurent Polzin, we are working on a project sup=
ervised by Millian Poquet. Our project focuses on
> reducing the energy consumption of QEMU=E2=80=99s Raspberry Pi 3B emulati=
on, as we have observed that power usage is quite high
> even when the system is idle.

Can you qualify that a bit more? What are you running the emulation on?
What power usage do you see?

Power consumption of the emulation is really just down to computational
efficiency of the emulation and if we ever get to a point that QEMU can
go idle giving the host system a chance to reach a lower power state.

> Ultimately, we also aim to enable emulation on a single CPU core.

If you want to run all emulation on a single core you could use -icount
to do that. It is less efficient though.

> We are reaching out to
> inquire if you have any advice, resources, or suggestions for implementin=
g power management in QEMU, particularly for the
> Raspberry Pi 3B model. Additionally, we would like to understand any cons=
traints or best practices regarding adding new
> code or features to QEMU.

What documentation that exists can be found in the developers section of
the manual:

  https://qemu.readthedocs.io/en/master/devel/index.html

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
