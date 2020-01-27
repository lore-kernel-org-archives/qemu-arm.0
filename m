Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3795240lfp;
        Mon, 27 Jan 2020 06:10:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqyp2/Vc01fwXS4LCx6zuZHBJEQ92yYqTLEJP/13FCm+1Ki4pE88/OLIAMznXRKBV+DgkT08
X-Received: by 2002:a5b:c52:: with SMTP id d18mr12868071ybr.59.1580134238115;
        Mon, 27 Jan 2020 06:10:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580134238; cv=none;
        d=google.com; s=arc-20160816;
        b=IoakbQTcNSr+ZivaY90+vFE+dNKHRVXAjVMQYNu6AmYrzQNBhAGsGL2vWJ6ZnlvYNl
         q8WNNjp0ZTVfa76/1kyIW01nDRGP1QZFPjbF3UQLu9z/Z2KqEt/4m6jyV/WbJAbHn/1t
         rD2YoSvvzZ3+R95MsfXFLBipeU2hZ1c33KEUsixdZ3QWmPmT9ijzi2Z2J4sVp4wbYLjl
         AkCcS6feKw5gUCzQYQHrWiw+Jvie44btyo5Zyw3meaaNaLq7zpkvsomM0SMdATE8ifKG
         UStWNmUlk9NwVWl3DSWWrqihpfhGpqBj1l40c2I4am4DTiLqKzRIFivmhuw6DFHUrrcp
         zpPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=jvsNbVnhd8C08Ijlbdr2orKptDdBe0k63SMZuu0eEtI=;
        b=c7jcoYJAPck5zkhrombxeRWksO1M79UT2gfdabrDbR9DKR21zrtUkAIGCsqI0Lm2JB
         g5nTVQBgEG7RrmiOuYxd4u7MJyf1J3PJU9zfpPnoFn64QT+2Ov+NzizLIEtuJq8fvmt5
         iMAUaCMdBNk1SYf1U7lWkXFz12EoE4s2dIgt66+xE/9EFXnW7pT71n+U5zA5N3H2gxKg
         DJ2RjQVbU+k3W4ah6elQ/Q+k4D4Ah47yLkXbHpAepfbMAZ1B7CBmQl+i3UAfA5JYf4um
         3tZWrKZEANuPetlh66ZOQbcHohi9i7GntU7MvKBqbvKQ9TQFNT/fjfYhU6z80JiiqRCi
         xQaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZNejec3y;
       spf=pass (google.com: domain of thuth@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id k124si2230164ywd.144.2020.01.27.06.10.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 06:10:38 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZNejec3y;
       spf=pass (google.com: domain of thuth@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580134237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
	bh=jvsNbVnhd8C08Ijlbdr2orKptDdBe0k63SMZuu0eEtI=;
	b=ZNejec3yBeS7SXcPrQJb7RCsS9IxtfDon5KkiBUC/Jiz1kFX8NBdw8n74HhZOaYOalYIWM
	IA6zlK+Y2clb2VJtQVed1TAln5cFgCL2EQ4QQZYSutLiQxwHHzITfljTota0exxYiFyK8U
	Dhh8OkN4DY9vzVi97CULOWfBURLoiXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-73QhI0hKMsuYu87xMOTBVQ-1; Mon, 27 Jan 2020 09:10:33 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A9131922960;
	Mon, 27 Jan 2020 14:10:32 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-117-94.ams2.redhat.com [10.36.117.94])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E7A760BF4;
	Mon, 27 Jan 2020 14:10:28 +0000 (UTC)
Subject: Re: [PATCH] tests/acceptance: Add boot tests for some of the QEMU
 advent calendar images
To: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>
References: <20200124170325.30072-1-thuth@redhat.com>
 <8f085a1a-b9df-29d4-db51-eb345a44a971@redhat.com>
 <1f564925-2ee1-ab17-a946-f9bcd656926f@redhat.com>
 <4d5fe645-0652-893f-4e6b-2929849d3cdc@amsat.org>
 <168c4f7b-fda5-2d9f-15b8-7100d5b0974d@redhat.com>
 <a7b33bbd-677b-b2e1-ec8b-aa0289510a8d@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <3446f836-6f07-c56e-fb18-181d159199f8@redhat.com>
Date: Mon, 27 Jan 2020 15:10:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a7b33bbd-677b-b2e1-ec8b-aa0289510a8d@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 73QhI0hKMsuYu87xMOTBVQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: iNFtfz6lOTQl

On 27/01/2020 15.05, Wainer dos Santos Moschetta wrote:
>=20
> On 1/27/20 8:38 AM, Thomas Huth wrote:
>> On 25/01/2020 19.38, Philippe Mathieu-Daud=C3=A9 wrote:
>>> On 1/25/20 5:43 PM, Thomas Huth wrote:
>>>> On 24/01/2020 22.28, Wainer dos Santos Moschetta wrote:
>>>>> On 1/24/20 3:03 PM, Thomas Huth wrote:
>>>>>> The 2018 edition of the QEMU advent calendar 2018 featured Linux
>>>>>> images
>>>>>> for various non-x86 machines. We can use them for a boot tests in ou=
r
>>>>>> acceptance test suite.
>>> Excellent idea!
>>>
>>>>>> Let's also make sure that we build the corresponding machines in
>>>>>> Travis,
>>>>>> and while we're there, drop the superfluous --python parameter
>>>>>> (python3
>>>>>> is now the only supported version anyway).
>>> I'd rather see this change as another commit.
>> I thought so, too, often it is good to separate stuff into separate
>> commits, but in this case, it's not source code but just the CI yml
>> file, and the change is really trivial, so it rather sounds like
>> superfluous churn to me in this case to do it in a separate patch...
>>
>>>>> Yes, please, removal of --python was in my wish list.
>>>>>
>>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>>> ---
>>>>>> =C2=A0=C2=A0 .travis.yml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>>>>>> =C2=A0=C2=A0 tests/acceptance/boot_linux_console.py | 96
>>>>>> ++++++++++++++++++++++++++
>>>>>> =C2=A0=C2=A0 2 files changed, 97 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/.travis.yml b/.travis.yml
>>>>>> index 6c1038a0f1..73ca12c921 100644
>>>>>> --- a/.travis.yml
>>>>>> +++ b/.travis.yml
>>>>>> @@ -268,7 +268,7 @@ matrix:
>>>>>> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Acceptance (Functional=
) tests
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - env:
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - CONFIG=3D"--python=3D/=
usr/bin/python3
>>>>>> --target-list=3Dx86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64=
-softmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,ppc-softmmu,ppc64-softmmu,=
m68k-softmmu,sparc-softmmu"
>>>>>>
>>>>>>
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -
>>>>>> CONFIG=3D"--target-list=3Daarch64-softmmu,alpha-softmmu,arm-softmmu,=
m68k-softmmu,microblaze-softmmu,mips-softmmu,mips64el-softmmu,nios2-softmmu=
,or1k-softmmu,ppc-softmmu,ppc64-softmmu,s390x-softmmu,sparc-softmmu,x86_64-=
softmmu,xtensa-softmmu"
>>>>>>
>>>>>>
>>>>>
>>>>> Perhaps use MAIN_SOFTMMU_TARGETS in only append the other targets,
>>>>> like:
>>>>>
>>>>> --target-list=3D${MAIN_SOFTMMU_TARGETS},alpha-softmmu,sparc-softmmu,.=
...
>>>> Not sure ... while it is a nice way to shorten the line here, it adds =
a
>>>> dependency to that variable ... and MAIN_SOFTMMU_TARGETS has been
>>>> changed
>>>> a couple of times during the course of time, so we might risk to lose
>>>> some testing coverage here in case someone removes a target from
>>>> MAIN_SOFTMMU_TARGETS but forgets to add it here again...? I think we
>>>> should better use the explicit list here instead.
>>> Maybe related: "Split enterprise vs. hobbyist acceptance test job"
>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg644683.html
>> I guess naming/splitting is hard in this case ... many targets contain
>> both, "enterprise" and "hobbyist" machines ... and as long as the Travis
>> job runs reasonably fast, it's also not really necessary to split it.
>> The only real ugliness is the very long line - I haven't found a way yet
>> to correctly wrap this in the YML file to multiple lines .... does
>> anybody know how to do this in YML?
>=20
>=20
> Try to break the lines with '\' (note: next line should not be
> indented). It worked out on following code:
>=20
> [wainersm@localhost ~]$ cat /tmp/foo.py
> import yaml
>=20
> yml=3D"""
> matrix:
> =C2=A0 include:
> =C2=A0=C2=A0=C2=A0 - env:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - CONFIG=3D"-target-list=3Dx86_64-softmmu,=
\
> mips-softmmu,mips64el-softmmu"
> """

Ok, thanks ... but without indentation, it looks somewhat ugly, too.
... hmm, maybe we should just keep adding acceptance tests until we've
got all targets covered, then we can simply replace --target-list with
--disable-user instead :-)

 Thomas
