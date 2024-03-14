Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id u6-20020a1709063b8600b00a45f2dc6795sm782303ejf.137.2024.03.14.07.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 07:56:57 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 0DCF85F785;
	Thu, 14 Mar 2024 14:56:57 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
  qemu-devel@nongnu.org,  Radoslaw Biernacki <rad@semihalf.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Leif Lindholm
 <quic_llindhol@quicinc.com>,  Cleber Rosa <crosa@redhat.com>,  Wainer dos
 Santos Moschetta <wainersm@redhat.com>,  Beraldo Leal <bleal@redhat.com>,
  Brad Smith <brad@comstyle.com>,  qemu-arm@nongnu.org
Subject: Re: [PATCH v2 3/4] tests/avocado: use OpenBSD 7.4 for sbsa-ref
In-Reply-To: <7da62f7f-3e87-470b-b089-1bfe5aa97555@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 14 Mar 2024 15:39:44
 +0100")
References: <20240314-sbsa-ref-firmware-update-v2-0-b557c56559cd@linaro.org>
	<20240314-sbsa-ref-firmware-update-v2-3-b557c56559cd@linaro.org>
	<87bk7hggcz.fsf@draig.linaro.org>
	<7da62f7f-3e87-470b-b089-1bfe5aa97555@linaro.org>
User-Agent: mu4e 1.12.1; emacs 29.2
Date: Thu, 14 Mar 2024 14:56:57 +0000
Message-ID: <87ttl8g8ue.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: G/eTavT3Yheg

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 14/3/24 13:14, Alex Benn=C3=A9e wrote:
>> Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> writes:
>>=20
>>> 7.4 was released in October 2023, time to update before 7.3 gets droppe=
d.
>>>
>>> Disabled tests for 'max' cpu as OpenBSD fails there.
>>>
>>> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>>> ---
>>>   tests/avocado/machine_aarch64_sbsaref.py | 47 +++++++++++++++++++++++=
---------
>>>   1 file changed, 34 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/m=
achine_aarch64_sbsaref.py
>>> index 259225f15f..0e52dc5854 100644
>>> --- a/tests/avocado/machine_aarch64_sbsaref.py
>>> +++ b/tests/avocado/machine_aarch64_sbsaref.py
>>> @@ -159,14 +159,14 @@ def test_sbsaref_alpine_linux_max(self):
>>>       # This tests the whole boot chain from EFI to Userspace
>>>       # We only boot a whole OS for the current top level CPU and GIC
>>>       # Other test profiles should use more minimal boots
>>> -    def boot_openbsd73(self, cpu):
>>> +    def boot_openbsd(self, cpu):
>>>           self.fetch_firmware()
>>>             img_url =3D (
>>> -            "https://cdn.openbsd.org/pub/OpenBSD/7.3/arm64/miniroot73.=
img"
>>> +            "https://cdn.openbsd.org/pub/OpenBSD/7.4/arm64/miniroot74.=
img"
>>>           )
>>>   -        img_hash =3D
>>> "7fc2c75401d6f01fbfa25f4953f72ad7d7c18650056d30755c44b9c129b707e5"
>>> +        img_hash =3D "7b08b2ce081cff6408d183f7152ddcfd2779912104866e4f=
df6ae2d864b51142"
>>>           img_path =3D self.fetch_asset(img_url, algorithm=3D"sha256", =
asset_hash=3Dimg_hash)
>>>             self.vm.set_console()
>>> @@ -180,23 +180,44 @@ def boot_openbsd73(self, cpu):
>>>           self.vm.launch()
>>>           wait_for_console_pattern(self,
>>>                                    "Welcome to the OpenBSD/arm64"
>>> -                                 " 7.3 installation program.")
>>> +                                 " 7.4 installation program.")
>>>   -    def test_sbsaref_openbsd73_cortex_a57(self):
>>> +    def test_sbsaref_openbsd_cortex_a57(self):
>>>           """
>>>           :avocado: tags=3Dcpu:cortex-a57
>>> +        :avocado: tags=3Dos:openbsd
>>>           """
>>> -        self.boot_openbsd73("cortex-a57")
>>> +        self.boot_openbsd("cortex-a57")
>>>   -    def test_sbsaref_openbsd73_neoverse_n1(self):
>>> +    def test_sbsaref_openbsd_neoverse_n1(self):
>>>           """
>>>           :avocado: tags=3Dcpu:neoverse-n1
>>> +        :avocado: tags=3Dos:openbsd
>>>           """
>>> -        self.boot_openbsd73("neoverse-n1")
>>> +        self.boot_openbsd("neoverse-n1")
>>>   -    def test_sbsaref_openbsd73_max(self):
>>> -        """
>>> -        :avocado: tags=3Dcpu:max
>>> -        """
>>> -        self.boot_openbsd73("max")
>>> +# OpenBSD 7.4 does not boot on current max cpu.
>>> +#
>>> +#   def test_sbsaref_openbsd_max_pauth_off(self):
>>> +#       """
>>> +#       :avocado: tags=3Dcpu:max
>>> +#       :avocado: tags=3Dos:openbsd
>>> +#       """
>>> +#       self.boot_openbsd("max,pauth=3Doff")
>> If we are not going to delete the entries then at least use a @skip
>> instead of commenting. Maybe:
>>    @skip("Potential un-diagnosed upstream bug?")
>
> Daniel or Peter suggested to open a GitLab issue and use
>
>     @skip("https://gitlab.com/qemu-project/qemu/-/issues/xyz")
>
> to track progress.

That's a good idea. Are you going to respin?

>
>> but it would be nice to figure out exactly where is breaks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
