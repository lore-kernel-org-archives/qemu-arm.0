Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp652651lfp;
        Wed, 29 Jan 2020 06:50:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqw+Usw3Ry6zvKYQekFr0bqvZrvigqkfnN6wEpEPHV0kypkuMCj2mbzn9X/tZ8U5ze1fQ04a
X-Received: by 2002:a17:906:51d0:: with SMTP id v16mr7862009ejk.50.1580309400979;
        Wed, 29 Jan 2020 06:50:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580309400; cv=none;
        d=google.com; s=arc-20160816;
        b=QWSlWv6HGME0ipZKiI20Y4bjlnKW9LkDXnTiV/TsOblJUzjmObYmrEv6XOHLoRIthz
         8LKgKjPXz73+nDS6yv19r8kGQ8aPyXwgjwMT1qEyuiDVJc1zITmOO3NY7tMVhhjstVYl
         WQFakPqR7AdWNgxTXMiGBJL1uo5PgEoAHr++g3IH7rNPh8nXATvZH+CyMZLKna4alemp
         MNn99xm3LBc7EnBTi+mUX4AsynRSKLJj2CzhBY42ZcsI2DOmyyxQlssg5K7QgkJ1oYcI
         5IVwKGjBAwZJGmNw9d5yV747YN551jGbT7yBWhnboNCMGGH0eTeH690bvT+ggywYaobf
         rLFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=1QRuEfeMGsBpUXzLPpobVgCXhvt97OcpaxvHkpqgh7Y=;
        b=UpDSIXUXqPLK8mMvbHmwiGaRDDmPlG4vzH1VzjfEdoJkUwYBbd50W6LZgtJkHIsy8G
         twT7asiEs9HkMee0B0HdDBHMQvScYWejXwFRjMOGFrRQrGiE/lEFfWiNyIzFPySbcVeA
         IclKS1si9ubR2YHfI7VqcEvmO1ckkhd6cSrMeNtO4gNKIxb61hk6nXsL9csNpRGGEVbV
         /ka5zaCGd+0XEayKmx0gpQEn/RKofoXR7rq6omBak/oIMpX8FTZ7RK7A0cHbkqVKGOuZ
         gFJcsVhWMEy2iXmDBGGkNEomQxwDYA4Aixzz2neki7ORPdIH4nGsiQrUWrU+FlmeceFs
         993A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z219UOik;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id h8si1326225edf.346.2020.01.29.06.50.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jan 2020 06:50:00 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z219UOik;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580309399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
	bh=1QRuEfeMGsBpUXzLPpobVgCXhvt97OcpaxvHkpqgh7Y=;
	b=Z219UOikVbfV2jgbGgC9jtSF+QB7+1dRgNcoCAyStz3RE/F+blGJSNRJx3W/7w6XXkNX4b
	ZDq/eYbYxarl4D9prKLo1GBQpBBPstV/PV2pTSOSyiESM4BdX67D4PhwrfuPgw/1+KJtdZ
	EpAzk9uetLU9JKE6IhJdvYGEpRPAQFA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-qWug86llO52lUpmqqBkjjw-1; Wed, 29 Jan 2020 09:49:57 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 307638A2437;
	Wed, 29 Jan 2020 14:49:56 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-210.ams2.redhat.com [10.36.116.210])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 398B019756;
	Wed, 29 Jan 2020 14:49:54 +0000 (UTC)
Subject: Re: [PATCH] tests/acceptance: Add boot tests for some of the QEMU
 advent calendar images
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200124170325.30072-1-thuth@redhat.com>
 <555bf60c-0d72-3ea3-f095-8c6c7a621deb@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <300bbdee-004a-9d1a-3692-f32793d44523@redhat.com>
Date: Wed, 29 Jan 2020 15:49:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <555bf60c-0d72-3ea3-f095-8c6c7a621deb@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: qWug86llO52lUpmqqBkjjw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Dh2WQIlACede

On 27/01/2020 18.31, Wainer dos Santos Moschetta wrote:
>=20
> On 1/24/20 3:03 PM, Thomas Huth wrote:
>> The 2018 edition of the QEMU advent calendar 2018 featured Linux images
>> for various non-x86 machines. We can use them for a boot tests in our
>> acceptance test suite.
>>
>> Let's also make sure that we build the corresponding machines in Travis,
>> and while we're there, drop the superfluous --python parameter (python3
>> is now the only supported version anyway).
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
[...]
>> +=C2=A0=C2=A0=C2=A0 def test_ppc_g3beige(self):
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :avocado: tags=3Darch:ppc
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :avocado: tags=3Dmachine:g3b=
eige
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tar_hash =3D 'e0b872a5eb8fdc=
5bed19bd43ffe863900ebcedfc'
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.vm.add_args('-M', 'grap=
hics=3Doff')
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.do_test_advcal_2018('15=
', tar_hash, 'invaders.elf')
>=20
> Hi Thomas, let me check one thing...
>=20
> The VM will be launched as:
>=20
> ----
>=20
> ppc-softmmu/qemu-system-ppc -display none -vga none -chardev
> socket,id=3Dmon,path=3D/tmp/tmpvdokyvs3/qemu-41146-monitor.sock -mon
> chardev=3Dmon,mode=3Dcontrol -machine g3beige -chardev
> socket,id=3Dconsole,path=3D/tmp/tmpvdokyvs3/qemu-41146-console.sock,serve=
r,nowait
> -serial chardev:console -M graphics=3Doff -kernel
> /tmp/avocado_g3uccfo5/avocado_job_61gglyz3/02-tests_acceptance_boot_linux=
_console.py_BootLinuxConsole.test_ppc_g3beige/day15/invaders.elf
>=20
>=20
> ----
>=20
> Note that it passes '[..] -machine g3beige [...] -M graphics=3Doff [...]'=
.
> I suspect you wanted '-machine g3beige,graphics=3Doff'. am I right?

No, the -M graphics=3Doff was intended.

> or
> QEMU will interpret the -M option as a parameter of the already set
> machine type?

That's exactly the case.

> or the -M overwrites -machine, and because=C2=A0 g3beige is the
> default type it just works?

No, the default machine of qemu-system-ppc is mac99.

And just to make sure that the g3beige test is really running with a G3
and not a G4 (i.e. mac99):

$ avocado --show=3Dconsole run
tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_ppc_g3beige
| grep motherboard
console: PowerMac motherboard: PowerMac G3 (Silk)

 Thomas
