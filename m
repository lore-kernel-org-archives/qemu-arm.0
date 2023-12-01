Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id p11-20020a05600c468b00b0040b561924bbsm7414744wmo.21.2023.12.01.07.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 07:14:51 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id EAA9C5FB5F;
	Fri,  1 Dec 2023 15:14:50 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Eric Farman <farman@linux.ibm.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Leif Lindholm
 <quic_llindhol@quicinc.com>,  Beraldo Leal <bleal@redhat.com>,  Andrew
 Jeffery <andrew@codeconstruct.com.au>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>,  Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>,  Thomas Huth <thuth@redhat.com>,
  qemu-arm@nongnu.org,  Radoslaw Biernacki <rad@semihalf.com>,  Yoshinori
 Sato <ysato@users.sourceforge.jp>,  Eric Auger <eric.auger@redhat.com>,
  Halil Pasic <pasic@linux.ibm.com>,  qemu-s390x@nongnu.org,  Wainer dos
 Santos Moschetta <wainersm@redhat.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>,
  Christian Borntraeger <borntraeger@linux.ibm.com>,  Aurelien Jarno
 <aurelien@aurel32.net>,  Cleber Rosa <crosa@redhat.com>,  Joel Stanley
 <joel@jms.id.au>,  Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 3/7] tests/avocado: drop
 BootLinuxConsole.test_mips_malta_cpio test
In-Reply-To: <1f9eb253-0346-4264-8817-11cf079e8f07@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 1 Dec 2023 14:57:11
 +0100")
References: <20231201093633.2551497-1-alex.bennee@linaro.org>
	<20231201093633.2551497-4-alex.bennee@linaro.org>
	<cbcdea98-4fc2-4952-9f7b-b3db242ad8b6@linaro.org>
	<1f9eb253-0346-4264-8817-11cf079e8f07@linaro.org>
User-Agent: mu4e 1.11.25; emacs 29.1
Date: Fri, 01 Dec 2023 15:14:50 +0000
Message-ID: <87o7fa5505.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: DG1oUmpCM/Uj

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 1/12/23 14:45, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 1/12/23 10:36, Alex Benn=C3=A9e wrote:
>>> The assets are no longer archived by Debian so we can't run this on
>>> CI. While some people may still have the test in their cache we do
>>> have more recent images from tuxrun so this isn't a great loss.
>>>
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> Cc: Stefan Hajnoczi <stefanha@redhat.com>
>>> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>>> ---
>>> =C2=A0 tests/avocado/boot_linux_console.py | 22 ----------------------
>>> =C2=A0 1 file changed, 22 deletions(-)
>>>
>>> diff --git a/tests/avocado/boot_linux_console.py
>>> b/tests/avocado/boot_linux_console.py
>>> index 231b4f68e5..5d978f6dd0 100644
>>> --- a/tests/avocado/boot_linux_console.py
>>> +++ b/tests/avocado/boot_linux_console.py
>>> @@ -116,28 +116,6 @@ def test_x86_64_pc(self):
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 console_pattern =
=3D 'Kernel command line: %s' %
>>> kernel_command_line
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.wait_for_co=
nsole_pattern(console_pattern)
>>> -=C2=A0=C2=A0=C2=A0 def test_mips_malta(self):
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :avocado: tags=3Darch:mips
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :avocado: tags=3Dmachine:ma=
lta
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :avocado: tags=3Dendian:big
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 deb_url =3D ('http://snapsh=
ot.debian.org/archive/debian/'
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '20130217T032700Z/pool/main/l/linux=
-2.6/'
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'linux-image-2.6.32-5-4kc-malta_2.6=
.32-48_mips.deb')
>
> This link still works for me, what am I missing?
>
> $ wget
> http://snapshot.debian.org/archive/debian/20130217T032700Z/pool/main/l/li=
nux-2.6/linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb
> --2023-12-01 14:55:31--
>   http://snapshot.debian.org/archive/debian/20130217T032700Z/pool/main/l/=
linux-2.6/linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb
> Resolving snapshot.debian.org (snapshot.debian.org)... 185.17.185.185,
> 193.62.202.27
> Connecting to snapshot.debian.org
> (snapshot.debian.org)|185.17.185.185|:80... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 30231730 (29M)
> Saving to: =E2=80=98linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb=E2=
=80=99

The failing link is the malta_cpio linux-4.7 one, I've fixed that in the
PR.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
