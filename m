Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id h19-20020a05600c351300b0040b347d90d0sm8841404wmq.12.2023.12.01.04.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 04:49:27 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 096205FB5F;
	Fri,  1 Dec 2023 12:49:27 +0000 (GMT)
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
 <joel@jms.id.au>
Subject: Re: [PATCH v2 4/7] tests/avocado: drop malta yamon tests
In-Reply-To: <45077c53-ed18-4821-bfbe-6dba3ca994d4@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 1 Dec 2023 11:24:14
 +0100")
References: <20231201093633.2551497-1-alex.bennee@linaro.org>
	<20231201093633.2551497-5-alex.bennee@linaro.org>
	<45077c53-ed18-4821-bfbe-6dba3ca994d4@linaro.org>
User-Agent: mu4e 1.11.25; emacs 29.1
Date: Fri, 01 Dec 2023 12:49:26 +0000
Message-ID: <87ttp25bqh.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: jcLN9ULinxy9

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Hi Alex,
>
> On 1/12/23 10:36, Alex Benn=C3=A9e wrote:
>> The assets are no longer available on the website so these are
>> blocking CI.
>>=20
>
> How are these "blocking CI"? Missing artifact wasn't be fatal,
> is it now? Also, did the artifact cache got flushed? These tests
> pass locally, I disagree with removing them.
>
> I can send a patch using YAMON_PATH like we have with RESCUE_YL_PATH,
> but I still consider missing artifact shouldn't be an issue. We are
> missing the point of the Avocado cache and the possibility to manually
> add artifacts.

Sure but in this case the binaries are gone, you can't share them and no
one else can ever run the test. At that point it just becomes dead
weight in the repository. This doesn't stop you keeping your own branch
where old tests live on while close to a warm cache but it does somewhat
limit the use of the test to the wider community.

>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> ---
>>   tests/avocado/machine_mips_malta.py | 37 -----------------------------
>>   1 file changed, 37 deletions(-)
>> diff --git a/tests/avocado/machine_mips_malta.py
>> b/tests/avocado/machine_mips_malta.py
>> index 959dcf5602..3a1ec85c20 100644
>> --- a/tests/avocado/machine_mips_malta.py
>> +++ b/tests/avocado/machine_mips_malta.py
>> @@ -122,40 +122,3 @@ def test_mips_malta_i6400_framebuffer_logo_8cores(s=
elf):
>>           :avocado: tags=3Dmips:smp
>>           """
>>           self.do_test_i6400_framebuffer_logo(8)
>> -
>> -class MaltaMachine(QemuSystemTest):
>> -
>> -    def do_test_yamon(self):
>> -        rom_url =3D ('http://www.imgtec.com/tools/mips-tools/downloads/'
>> -                   'yamon/yamon-bin-02.22.zip')
>> -        rom_hash =3D '8da7ecddbc5312704b8b324341ee238189bde480'
>> -        zip_path =3D self.fetch_asset(rom_url, asset_hash=3Drom_hash)
>> -
>> -        archive.extract(zip_path, self.workdir)
>> -        yamon_path =3D os.path.join(self.workdir, 'yamon-02.22.bin')
>> -
>> -        self.vm.set_console()
>> -        self.vm.add_args('-bios', yamon_path)
>> -        self.vm.launch()
>> -
>> -        prompt =3D  'YAMON>'
>> -        pattern =3D 'YAMON ROM Monitor'
>> -        interrupt_interactive_console_until_pattern(self, pattern, prom=
pt)
>> -        wait_for_console_pattern(self, prompt)
>> -        self.vm.shutdown()
>> -
>> -    def test_mipsel_malta_yamon(self):
>> -        """
>> -        :avocado: tags=3Darch:mipsel
>> -        :avocado: tags=3Dmachine:malta
>> -        :avocado: tags=3Dendian:little
>> -        """
>> -        self.do_test_yamon()
>> -
>> -    def test_mips64el_malta_yamon(self):
>> -        """
>> -        :avocado: tags=3Darch:mips64el
>> -        :avocado: tags=3Dmachine:malta
>> -        :avocado: tags=3Dendian:little
>> -        """
>> -        self.do_test_yamon()

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
