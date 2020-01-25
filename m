Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1939395lfp;
        Sat, 25 Jan 2020 08:43:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqyygltJZvcO/DBQxIQMjsERCVziuv0DibbN1vDJnHETeFCG/0mHH6STktJRxRwqbxaFLnkn
X-Received: by 2002:aa7:c3c2:: with SMTP id l2mr6480233edr.120.1579970613544;
        Sat, 25 Jan 2020 08:43:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579970613; cv=none;
        d=google.com; s=arc-20160816;
        b=Kg15zDP2FngfUMlYv4wEnL1xiQFphSoE5opOIABLxjtPFGBTn3cK+kzys57D2GuLVp
         veFkoM4pnzx43Czmm+rW2GTrjJPtSNWNiTMndf6NOkvXd5R9YUT3jz0MQQGNlAuCXPwo
         ajUp2vhSoeXPHiheJt7rBHzCAkCilFFclq0WSltoADIxicNjHmZLdXJKaI14IF8cYwtz
         9JQyi6gnkg8Vms2GGKkowlAur2ih7uz8hpT/V6VjA7c2Df1SHELvg5Zr4Q60gNUXvunw
         jbR1RqCef7Cba50yC0FmLatfBiQElD3LZXOmriBpCt1wkbYjGsBzC/6zzsqn/58oNsXG
         RLsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=jXg3gy8idxtbMe3z1X4AlsIInvp9LQQzBBdoww9+aWI=;
        b=mthaoUUovP2pX/hAhP0Wypy7jWYihR4DZx9s7sgfBwbeizWEjAPqeh+ZbJbV/zOn/t
         558b19c1cR0aPq0CNOA5u+g1VqkgWUuq5dRljkdouTNFO4EzY3WDfczuSjKO10NraTYE
         Qd79eqf5cn4eg60O6N3gxI8br8EuM2SEcb0Mr1uwzqHZ6GDukeonmO96PTXfpdO3uwjw
         9zcAOASfvNADG/ydJkiTIf+gE6wSEQK39eOzgRZ6wh7olN6JC5tP+7E4IidpG73wKrT0
         6sYLfkDdbO4POlFOp8iFewN5+JLvh+aC04Sa2RhTVQeHEbUA2Vz0sn3UWwq72J2JP/4r
         yAdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c8H9ayzA;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id c8si3199895ejb.114.2020.01.25.08.43.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 Jan 2020 08:43:33 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c8H9ayzA;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579970612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
	bh=jXg3gy8idxtbMe3z1X4AlsIInvp9LQQzBBdoww9+aWI=;
	b=c8H9ayzA9IvaT+FIRs1bp/C7d7x2+Nh38Y9SIiOYSQE4bPbaIht8HFbqNjxkVjZso/xvaq
	y/A0p12zEczHkMoeYEuUumdlUECT8MLnNmv63yscA1nfVIKIwTCtY6aavK8TWF4lH2aIYD
	vKDqx0X6R9uGbPJ6p7VDJwpqZ49koL0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-p4dPon5mMmChpfZiIgFKTQ-1; Sat, 25 Jan 2020 11:43:30 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6750B1005512;
	Sat, 25 Jan 2020 16:43:29 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-42.ams2.redhat.com [10.36.116.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2738E10013A1;
	Sat, 25 Jan 2020 16:43:24 +0000 (UTC)
Subject: Re: [PATCH] tests/acceptance: Add boot tests for some of the QEMU
 advent calendar images
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>
References: <20200124170325.30072-1-thuth@redhat.com>
 <8f085a1a-b9df-29d4-db51-eb345a44a971@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <1f564925-2ee1-ab17-a946-f9bcd656926f@redhat.com>
Date: Sat, 25 Jan 2020 17:43:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8f085a1a-b9df-29d4-db51-eb345a44a971@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: p4dPon5mMmChpfZiIgFKTQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: qugrL98UCdfF

On 24/01/2020 22.28, Wainer dos Santos Moschetta wrote:
>=20
> On 1/24/20 3:03 PM, Thomas Huth wrote:
>> The 2018 edition of the QEMU advent calendar 2018 featured Linux images
>> for various non-x86 machines. We can use them for a boot tests in our
>> acceptance test suite.
>>
>> Let's also make sure that we build the corresponding machines in Travis,
>> and while we're there, drop the superfluous --python parameter (python3
>> is now the only supported version anyway).
>=20
> Yes, please, removal of --python was in my wish list.
>=20
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>> =C2=A0 .travis.yml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>> =C2=A0 tests/acceptance/boot_linux_console.py | 96 +++++++++++++++++++++=
+++++
>> =C2=A0 2 files changed, 97 insertions(+), 1 deletion(-)
>>
>> diff --git a/.travis.yml b/.travis.yml
>> index 6c1038a0f1..73ca12c921 100644
>> --- a/.travis.yml
>> +++ b/.travis.yml
>> @@ -268,7 +268,7 @@ matrix:
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Acceptance (Functional) tests
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - env:
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - CONFIG=3D"--python=3D/usr/=
bin/python3
>> --target-list=3Dx86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-sof=
tmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,ppc-softmmu,ppc64-softmmu,m68k=
-softmmu,sparc-softmmu"
>>
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -
>> CONFIG=3D"--target-list=3Daarch64-softmmu,alpha-softmmu,arm-softmmu,m68k=
-softmmu,microblaze-softmmu,mips-softmmu,mips64el-softmmu,nios2-softmmu,or1=
k-softmmu,ppc-softmmu,ppc64-softmmu,s390x-softmmu,sparc-softmmu,x86_64-soft=
mmu,xtensa-softmmu"
>>
>=20
>=20
> Perhaps use MAIN_SOFTMMU_TARGETS in only append the other targets, like:
>=20
> --target-list=3D${MAIN_SOFTMMU_TARGETS},alpha-softmmu,sparc-softmmu,....

Not sure ... while it is a nice way to shorten the line here, it adds a
dependecy to that variable ... and MAIN_SOFTMMU_TARGETS has been changed
a couple of times during the course of time, so we might risk to lose
some testing coverage here in case someone removes a target from
MAIN_SOFTMMU_TARGETS but forgets to add it here again...? I think we
should better use the explicit list here instead.

 Thomas
