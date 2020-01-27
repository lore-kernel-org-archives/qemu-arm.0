Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3789474lfp;
        Mon, 27 Jan 2020 06:06:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqwRanyFcY0Q1P4I5k62pS9+awF0cglKTOpZBUJ8SwnuU9CBLHU7JGBciQ/PTglgZiuHtU90
X-Received: by 2002:a25:446:: with SMTP id 67mr12044862ybe.350.1580133969529;
        Mon, 27 Jan 2020 06:06:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580133969; cv=none;
        d=google.com; s=arc-20160816;
        b=f02IN6ji0MsQ+7qmF3Xfq+YChw8NJxOrY1H+FTnM2nMj7Xz2wTgefFRXGlj2280GcW
         nMH3C8LFLssHyZ6pzk4ZtotSZkNgAEt4uOlUVk58Uv+sNcPulax1NZBtA50MEm3/6So8
         YNmIhN+Fyh89tpl3tetjdYIhzZZUy/nXACpkTqa9qeLAohbzBHrbyB8zW1B25kIF3UgJ
         7vi7s703icu7VNDfGKtHtmVYr2lE+eD2n5TgamGKZJYloVrwXX1GmbV0ivvdHP8ul90b
         rrkfPq5tfP3HHgGdLWEU8afM5+muVXzVV8aJo2NVhusPqrgzuTQyw3A4DsLzFbmTm0cK
         DWKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=RKpx2tERluPKbOBPaJjvyC/oGqoJkXkMPjh5U9IeBtk=;
        b=LzRGR2CHZaDAksAb9bk8WM0A0ed0xIz0tuLDtpqyDVaB6F6yO+jgP4PGtBbD8SSuKa
         8dBxxFsfMmSu2BFAV5abHBbcGRYcF/jz0sjkRXV02XdK11dXL9Dz6Cu9GG7R6WJ4iGTb
         +kNWVE2OuPOGr/5e2qOzVf9Ij+kvjkLP1b94A3ssxKV1Qa9HB6LT9ajj7RaW4vFgi7VP
         3hCdd+sNv/04Iwlxk3XkL7DeuBlK51hEtHyMVw7ooq2q/jtWMYHaKgIi9qyR+j9oybZ2
         3WL5Jko2nMVwPAnrT55hBwGohdotHcQ0LX8EA46Ku1gRtuXcIbbi6pHLNhbWxRdDVA+3
         S8qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MyHzTPk1;
       spf=pass (google.com: domain of wainersm@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=wainersm@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <wainersm@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id c139si8145967ywb.181.2020.01.27.06.06.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 06:06:09 -0800 (PST)
Received-SPF: pass (google.com: domain of wainersm@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MyHzTPk1;
       spf=pass (google.com: domain of wainersm@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=wainersm@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580133969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RKpx2tERluPKbOBPaJjvyC/oGqoJkXkMPjh5U9IeBtk=;
	b=MyHzTPk1fhvJIRITvrxkHRjG4K9WZm7KGYbWeR5JehVWCnD+mh4G0z1djGnhwGw9imYL72
	2X9yu9CPWvWNxOiOS967NsZz7xd11bXT/e3OEWXNyLudn3kYiVfjwxxnIzlbxp/Yryi4Sx
	bIIXXme3uCPvlR0ki1/Q2fmYw++jFOg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-ea3GnvWPPLyPO4Rd2jgukQ-1; Mon, 27 Jan 2020 09:06:05 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5CA018A8CAE;
	Mon, 27 Jan 2020 14:06:03 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-27.gru2.redhat.com [10.97.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 288D88705B;
	Mon, 27 Jan 2020 14:05:58 +0000 (UTC)
Subject: Re: [PATCH] tests/acceptance: Add boot tests for some of the QEMU
 advent calendar images
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Cleber Rosa <crosa@redhat.com>
References: <20200124170325.30072-1-thuth@redhat.com>
 <8f085a1a-b9df-29d4-db51-eb345a44a971@redhat.com>
 <1f564925-2ee1-ab17-a946-f9bcd656926f@redhat.com>
 <4d5fe645-0652-893f-4e6b-2929849d3cdc@amsat.org>
 <168c4f7b-fda5-2d9f-15b8-7100d5b0974d@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <a7b33bbd-677b-b2e1-ec8b-aa0289510a8d@redhat.com>
Date: Mon, 27 Jan 2020 12:05:57 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <168c4f7b-fda5-2d9f-15b8-7100d5b0974d@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: ea3GnvWPPLyPO4Rd2jgukQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: RDA7VVy1QyH0


On 1/27/20 8:38 AM, Thomas Huth wrote:
> On 25/01/2020 19.38, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 1/25/20 5:43 PM, Thomas Huth wrote:
>>> On 24/01/2020 22.28, Wainer dos Santos Moschetta wrote:
>>>> On 1/24/20 3:03 PM, Thomas Huth wrote:
>>>>> The 2018 edition of the QEMU advent calendar 2018 featured Linux imag=
es
>>>>> for various non-x86 machines. We can use them for a boot tests in our
>>>>> acceptance test suite.
>> Excellent idea!
>>
>>>>> Let's also make sure that we build the corresponding machines in Trav=
is,
>>>>> and while we're there, drop the superfluous --python parameter (pytho=
n3
>>>>> is now the only supported version anyway).
>> I'd rather see this change as another commit.
> I thought so, too, often it is good to separate stuff into separate
> commits, but in this case, it's not source code but just the CI yml
> file, and the change is really trivial, so it rather sounds like
> superfluous churn to me in this case to do it in a separate patch...
>
>>>> Yes, please, removal of --python was in my wish list.
>>>>
>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>> ---
>>>>>  =C2=A0 .travis.yml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>>>>>  =C2=A0 tests/acceptance/boot_linux_console.py | 96 +++++++++++++++++=
+++++++++
>>>>>  =C2=A0 2 files changed, 97 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/.travis.yml b/.travis.yml
>>>>> index 6c1038a0f1..73ca12c921 100644
>>>>> --- a/.travis.yml
>>>>> +++ b/.travis.yml
>>>>> @@ -268,7 +268,7 @@ matrix:
>>>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Acceptance (Functional) test=
s
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - env:
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - CONFIG=3D"--python=3D/u=
sr/bin/python3
>>>>> --target-list=3Dx86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-=
softmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,ppc-softmmu,ppc64-softmmu,m=
68k-softmmu,sparc-softmmu"
>>>>>
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -
>>>>> CONFIG=3D"--target-list=3Daarch64-softmmu,alpha-softmmu,arm-softmmu,m=
68k-softmmu,microblaze-softmmu,mips-softmmu,mips64el-softmmu,nios2-softmmu,=
or1k-softmmu,ppc-softmmu,ppc64-softmmu,s390x-softmmu,sparc-softmmu,x86_64-s=
oftmmu,xtensa-softmmu"
>>>>>
>>>>
>>>> Perhaps use MAIN_SOFTMMU_TARGETS in only append the other targets, lik=
e:
>>>>
>>>> --target-list=3D${MAIN_SOFTMMU_TARGETS},alpha-softmmu,sparc-softmmu,..=
..
>>> Not sure ... while it is a nice way to shorten the line here, it adds a
>>> dependency to that variable ... and MAIN_SOFTMMU_TARGETS has been chang=
ed
>>> a couple of times during the course of time, so we might risk to lose
>>> some testing coverage here in case someone removes a target from
>>> MAIN_SOFTMMU_TARGETS but forgets to add it here again...? I think we
>>> should better use the explicit list here instead.
>> Maybe related: "Split enterprise vs. hobbyist acceptance test job"
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg644683.html
> I guess naming/splitting is hard in this case ... many targets contain
> both, "enterprise" and "hobbyist" machines ... and as long as the Travis
> job runs reasonably fast, it's also not really necessary to split it.
> The only real ugliness is the very long line - I haven't found a way yet
> to correctly wrap this in the YML file to multiple lines .... does
> anybody know how to do this in YML?


Try to break the lines with '\' (note: next line should not be=20
indented). It worked out on following code:

[wainersm@localhost ~]$ cat /tmp/foo.py
import yaml

yml=3D"""
matrix:
 =C2=A0 include:
 =C2=A0=C2=A0=C2=A0 - env:
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - CONFIG=3D"-target-list=3Dx86_64-softmmu,\
mips-softmmu,mips64el-softmmu"
"""
print(yaml.safe_load(yml))
[wainersm@localhost ~]$ python3 /tmp/foo.py
{'matrix': {'include': [{'env':=20
['CONFIG=3D"-target-list=3Dx86_64-softmmu,mips-softmmu,mips64el-softmmu"']}=
]}}

>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Thanks!
>
>   Thomas
