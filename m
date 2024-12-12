Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3f1323f99sm6497588a12.34.2024.12.12.04.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 04:32:06 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id DD03D5F8CF;
	Thu, 12 Dec 2024 12:32:04 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  "Daniel P. Berrange" <berrange@redhat.com>,
  Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
  qemu-s390x@nongnu.org,  Halil Pasic <pasic@linux.ibm.com>,  Jiaxun Yang
 <jiaxun.yang@flygoat.com>,  Weiwei Li <liwei1518@gmail.com>,  Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,  Cleber Rosa <crosa@redhat.com>,  Palmer
 Dabbelt <palmer@dabbelt.com>,  Leif Lindholm <quic_llindhol@quicinc.com>,
  Eric Farman <farman@linux.ibm.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  John Snow <jsnow@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Harsh Prateek Bora
 <harshpb@linux.ibm.com>,  Aurelien Jarno <aurelien@aurel32.net>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Joel Stanley <joel@jms.id.au>,  Bernhard
 Beschow <shentey@gmail.com>,  qemu-ppc@nongnu.org,  qemu-riscv@nongnu.org,
  Daniel Henrique Barboza <danielhb413@gmail.com>,  Laurent Vivier
 <lvivier@redhat.com>,  qemu-arm@nongnu.org,  Wainer dos Santos Moschetta
 <wainersm@redhat.com>,  Fabiano Rosas <farosas@suse.de>,  Markus
 Armbruster <armbru@redhat.com>,  Bin Meng <bmeng.cn@gmail.com>,  Pavel
 Dovgalyuk <pavel.dovgaluk@ispras.ru>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>,  Christian Borntraeger
 <borntraeger@linux.ibm.com>,  Beraldo Leal <bleal@redhat.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Radoslaw Biernacki
 <rad@semihalf.com>,  Nicholas Piggin <npiggin@gmail.com>,  Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH 20/20] tests/functional: extend test_aarch64_virt with
 vulkan test
In-Reply-To: <d2a73820-58fa-41d0-8f38-68b0ad53fa7d@redhat.com> (Thomas Huth's
	message of "Wed, 11 Dec 2024 07:58:00 +0100")
References: <20241210204349.723590-1-alex.bennee@linaro.org>
	<20241210204349.723590-21-alex.bennee@linaro.org>
	<d2a73820-58fa-41d0-8f38-68b0ad53fa7d@redhat.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 12 Dec 2024 12:32:04 +0000
Message-ID: <87bjxhrsjf.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: mqMovEQzoH8/

Thomas Huth <thuth@redhat.com> writes:

> On 10/12/2024 21.43, Alex Benn=C3=A9e wrote:
>> Now we have virtio-gpu Vulkan support lets add a test for it.
>> Currently this is using images build by buildroot:
>>    https://lists.buildroot.org/pipermail/buildroot/2024-December/768196.=
html
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
<snip>
>> +        self.vm.set_console()
>> +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
>> +                               'console=3DttyAMA0 root=3D/dev/vda')
>> +        self.require_accelerator("tcg")
>
> Same, please move to the beginning since it can skip the test.
>
>> +        self.vm.add_args("-accel", "tcg")

Actually this could run under KVM if we have it for Aarch64. Can we
represent that?

>> +        self.vm.add_args("-cpu", "neoverse-v1,pauth-impdef=3Don")

I guess in that case we'd use -cpu host as well.

>> +        self.vm.add_args("-machine",
>> +                         "virt,virtualization=3Don,"
>> +                         "gic-version=3Dmax",
>> +                         '-kernel', kernel_path,
>> +                         '-append', kernel_command_line)
>> +        self.vm.add_args("-smp", "2", "-m", "2048")
>> +        self.vm.add_args("-device", "virtio-gpu-gl-pci,hostmem=3D4G,blo=
b=3Don,venus=3Don")
>> +        self.vm.add_args("-display", "egl-headless")
>> +        self.vm.add_args("-display", "dbus,gl=3Don")
>> +        self.vm.add_args("-device", "virtio-blk-device,drive=3Dhd0")
>> +        self.vm.add_args("-blockdev",
>> +                         "driver=3Draw,file.driver=3Dfile,node-name=3Dh=
d0,read-only=3Don,"
>> +                         f"file.filename=3D{image_path}")
>> +        self.vm.add_args("--snapshot")
>
> Any reason for using double dashes just here and not for the other comman=
ds?
>
>> +        try:
>> +            self.vm.launch()
>> +        except VMLaunchFailure as e:
>> +            if "old virglrenderer, blob resources unsupported" in e.out=
put:
>> +                self.skipTest("No blob support for virtio-gpu")
>> +            elif "old virglrenderer, venus unsupported" in e.output:
>> +                self.skipTest("No venus support for virtio-gpu")
>> +            else:
>> +                self.log.info(f"un-handled launch failure: {e.output}")
>
> s/un-handled/unhandled/ ?
>
>  Thomas

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
