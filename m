Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1574893lfp;
        Thu, 30 Jan 2020 00:16:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqyHPzLA2NuhjnjhbZfH5XCzACPOhhQ89YslhHAk/hXiyjLFy38zzXoNx1gQryk6pzzfZXXg
X-Received: by 2002:a0d:fd47:: with SMTP id n68mr2553506ywf.402.1580372202139;
        Thu, 30 Jan 2020 00:16:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580372202; cv=none;
        d=google.com; s=arc-20160816;
        b=Xhmg3anut7uIYKYeuYSJ37S0Ldllis61bWZlTRou0/l5OCVyFVEiNGYhmYthj2ANa1
         tgoWIHWNNMhMb21GUjflz0dmgysHjMWgQXNbRcgdaH+T3EOU105sXwh1Bx9K7aPPXooR
         0oqCuswlgJK2rG7POsCTEF5lR1uno7dZgkHWDpsVQAYeoEyGqRYrp+vJmVTdDAAKCqdq
         3LTldDJbWTW8GWog6TgANO/uPGNrPuCnUgqgYuUok0qprRATBaPLv4u9r+mut7exEleG
         nQZeXPk+47BemhxqrSlqCQdoidQboG+pT9pudKFGrJweU9VFyhplprb1UiSMu0WNsWgY
         0/Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=55gRiVY249a8gB9tdbRJgB2G1/jbeYVGA9wu95vEH0Y=;
        b=qnXE8l4NiUEEGRPohb7QVLUq7RiDf41LbqxQEaBTHhkGxhnb/TlJ5/zP4zX5hAA6Bi
         bSVQM4Obvq3KL+THxMVjzH5a698108VsSkIjAVKTpJuJV5KpropjyzBWTKA1MB9Q/i8V
         cug2PRLHk/i2y2PXhCfWMFtfCork5/LffC59+T1g/aIhqxZil3Dx2jAvUdxFczLp9Uy3
         xkVFtJxYc651ZlDqp6GNx7g4QfDSW8ADDMFOwxuD1GMyfKDqbxGiCr4bL0mBJjcxf0Xm
         l3yfx+h5pISxDnUIguGcPu46T5/6VUuBCoEjmZsZBlNpC62hJ2cFmHkv8c6byV9V/Het
         1MEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="HU41/xbg";
       spf=pass (google.com: domain of thuth@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id z191si2311037ywz.317.2020.01.30.00.16.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jan 2020 00:16:42 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="HU41/xbg";
       spf=pass (google.com: domain of thuth@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580372201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
	bh=55gRiVY249a8gB9tdbRJgB2G1/jbeYVGA9wu95vEH0Y=;
	b=HU41/xbgZhq0Nd3ezd4yIb7Npn3JwdJksRoXGPRItj/ZW1i0o+abX+DXzSWS4gHZ0wnlvw
	skl45odX+S6g1eoELGtldzAuBL1hzisO0qDzf8/fXWcywSk35LSKmJARqNaYVGWt1y9yGf
	wTrAp7XH/HhH6gBTv+5j54vK12sWvc8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-saG3oYp5N4uvT29pJ-ZbnA-1; Thu, 30 Jan 2020 03:16:39 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 939C2DBAE;
	Thu, 30 Jan 2020 08:16:38 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-117-117.ams2.redhat.com [10.36.117.117])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E31687B00;
	Thu, 30 Jan 2020 08:16:33 +0000 (UTC)
Subject: Re: [PATCH] tests/acceptance: Add boot tests for some of the QEMU
 advent calendar images
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Cleber Rosa <crosa@redhat.com>
References: <20200124170325.30072-1-thuth@redhat.com>
 <555bf60c-0d72-3ea3-f095-8c6c7a621deb@redhat.com>
 <300bbdee-004a-9d1a-3692-f32793d44523@redhat.com>
 <alpine.BSF.2.22.395.2001291841260.40686@zero.eik.bme.hu>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <133b09ed-78f7-e280-f603-18e616a00979@redhat.com>
Date: Thu, 30 Jan 2020 09:16:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.BSF.2.22.395.2001291841260.40686@zero.eik.bme.hu>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: saG3oYp5N4uvT29pJ-ZbnA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ZxBugO/+a8H7

On 29/01/2020 18.48, BALATON Zoltan wrote:
> On Wed, 29 Jan 2020, Thomas Huth wrote:
>> On 27/01/2020 18.31, Wainer dos Santos Moschetta wrote:
>>> On 1/24/20 3:03 PM, Thomas Huth wrote:
>>>> The 2018 edition of the QEMU advent calendar 2018 featured Linux image=
s
>>>> for various non-x86 machines. We can use them for a boot tests in our
>>>> acceptance test suite.
>>>>
>>>> Let's also make sure that we build the corresponding machines in
>>>> Travis,
>>>> and while we're there, drop the superfluous --python parameter (python=
3
>>>> is now the only supported version anyway).
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>> [...]
>>>> +=C2=A0=C2=A0=C2=A0 def test_ppc_g3beige(self):
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :avocado: tags=3Darch:ppc
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :avocado: tags=3Dmachine:g=
3beige
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tar_hash =3D 'e0b872a5eb8f=
dc5bed19bd43ffe863900ebcedfc'
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.vm.add_args('-M', 'gr=
aphics=3Doff')
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.do_test_advcal_2018('=
15', tar_hash, 'invaders.elf')
>>>
>>> Hi Thomas, let me check one thing...
>>>
>>> The VM will be launched as:
>>>
>>> ----
>>>
>>> ppc-softmmu/qemu-system-ppc -display none -vga none -chardev
>>> socket,id=3Dmon,path=3D/tmp/tmpvdokyvs3/qemu-41146-monitor.sock -mon
>>> chardev=3Dmon,mode=3Dcontrol -machine g3beige -chardev
>>> socket,id=3Dconsole,path=3D/tmp/tmpvdokyvs3/qemu-41146-console.sock,ser=
ver,nowait
>>>
>>> -serial chardev:console -M graphics=3Doff -kernel
>>> /tmp/avocado_g3uccfo5/avocado_job_61gglyz3/02-tests_acceptance_boot_lin=
ux_console.py_BootLinuxConsole.test_ppc_g3beige/day15/invaders.elf
>>>
>>>
>>>
>>> ----
>>>
>>> Note that it passes '[..] -machine g3beige [...] -M graphics=3Doff [...=
]'.
>>> I suspect you wanted '-machine g3beige,graphics=3Doff'. am I right?
>>
>> No, the -M graphics=3Doff was intended.
>>
>>> or
>>> QEMU will interpret the -M option as a parameter of the already set
>>> machine type?
>>
>> That's exactly the case.
>>
>>> or the -M overwrites -machine, and because=C2=A0 g3beige is the
>>> default type it just works?
>>
>> No, the default machine of qemu-system-ppc is mac99.
>=20
> I think you're wrong about the default machine type:
>=20
> $ qemu-system-ppc -M help
> Supported machines are:
> 40p=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IBM RS/6000 7020 (40p)
> bamboo=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 bamboo
> g3beige=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 Heathrow based PowerMAC (default)
>=20
> g3beige is marked as default and seems to be created without any -M
> option

Oops, thanks, I stand corrected.

 Thomas
