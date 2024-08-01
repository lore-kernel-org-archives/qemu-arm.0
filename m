Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac63d4720dsm10348802a12.58.2024.08.01.07.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 07:26:03 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 6CEA45F80C;
	Thu,  1 Aug 2024 15:26:02 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Daniel P." =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Cleber
 Rosa
 <crosa@redhat.com>,  qemu-devel@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  Thomas Huth <thuth@redhat.com>,  Beraldo Leal
 <bleal@redhat.com>,  Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Leif
 Lindholm
 <quic_llindhol@quicinc.com>,  Jiaxun Yang <jiaxun.yang@flygoat.com>,
  kvm@vger.kernel.org,  Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
  Wainer dos Santos Moschetta <wainersm@redhat.com>,  qemu-arm@nongnu.org,
  Radoslaw Biernacki <rad@semihalf.com>,  Paul Durrant <paul@xen.org>,
  Paolo Bonzini <pbonzini@redhat.com>,  Akihiko Odaki
 <akihiko.odaki@daynix.com>
Subject: Re: [PATCH 07/13] tests/avocado/kvm_xen_guest.py: cope with asset
 RW requirements
In-Reply-To: <63ef2c5b9ab213f544173df027abf5b056d59e8a.camel@infradead.org>
	(David Woodhouse's message of "Mon, 29 Jul 2024 13:03:46 +0100")
References: <20240726134438.14720-1-crosa@redhat.com>
	<20240726134438.14720-8-crosa@redhat.com>
	<Zqd10nIix4gXKtDw@redhat.com>
	<63ef2c5b9ab213f544173df027abf5b056d59e8a.camel@infradead.org>
Date: Thu, 01 Aug 2024 15:26:02 +0100
Message-ID: <87wml0coat.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: zJxkwxNbJ8UD

David Woodhouse <dwmw2@infradead.org> writes:

> On Mon, 2024-07-29 at 11:58 +0100, Daniel P. Berrang=C3=A9 wrote:
>> On Fri, Jul 26, 2024 at 09:44:32AM -0400, Cleber Rosa wrote:
>> > Some of these tests actually require the root filesystem image,
>> > obtained through Avocado's asset feature and kept in a common cache
>> > location, to be writable.
>
> Hm, I'm not sure *why* they require a writable image. Mostly they're
> just testing the interrupt routing. What's the failure mode for a read-
> only image?

There are no real failures with readonly=3Don although you do see init
complain a bit about not being able to mount /dev and open log files.
snapshot allows that to happen but doesn't change the underlying
storage.

>
>> > @@ -56,11 +57,19 @@ def common_vm_setup(self):
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "367962983d0d32109998a70b45dcee4672d0b045=
")
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.rootfs =3D self.=
get_asset("rootfs.ext4",
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "f1478401ea4b3fa2ea196396be44315bab2bb5e4")
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if readwrite:
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de=
st =3D os.path.join(self.workdir, os.path.basename(self.rootfs))
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sh=
util.copy(self.rootfs, dest)
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 se=
lf.rootfs =3D dest
>>=20
>> This is a very expensive way of creating a writable disk. Better to
>> avoid adding this 'readwrite' parameter at all, and instead create
>> a throwaway qcow2 overlay for the image for all tests. That ensures
>> writability for everything in a cheap manner.
>
> Or just use -snapshot?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
