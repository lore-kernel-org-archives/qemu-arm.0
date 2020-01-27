Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3744208lfp;
        Mon, 27 Jan 2020 05:22:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqwHF8JzIxGVoCClbG4DilwCbrYynupVFqYSpnVQsPB9AVNsY0cfH3wp1HsK7arF1lb2R1kw
X-Received: by 2002:a17:906:4b4b:: with SMTP id j11mr12022208ejv.145.1580131335720;
        Mon, 27 Jan 2020 05:22:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580131335; cv=none;
        d=google.com; s=arc-20160816;
        b=pIF08VQUEEJa87Q08JhnzUrlLbDcEyO/nRh2/gkvvdfdITMGCULVXyClOO/qMM+qv0
         LO0NuzjL098xNAsidxijDQpa7QopOjtEQ+79XkcZdSq70UDvFtrmN1Fein5eOS+9ldng
         +AnuEQoYTv8HTfdLpaynFifreCjxK5yZjB4KsM2KSzG8hTckx4i8hnkEDJo/j7VH+Mb4
         AZZgfIDWFmN0r29s5exQ40lG5lJd2toKOB0eiSUJIdfS3/HU6bkTAclwDg0tO9AOav97
         hxNRKL2q7TC1eVvLR1dIaf6HNbRwqeq2icmwadoic9wdWm5zPMyrrEdtpvIXJHr1X/PR
         YdqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=aB9kUk5ctG0RxgHEX2uURz1zw1nvRkSkcTM8skY9h0s=;
        b=NKKYw0gQDBxAI+p3PJ02yG/JTHV1eGopDHxpl+Oaxug1Khy7U1/0LbJGjPcfld8PfR
         GHMIhwktM5NCEQmlMaldOTFivPKSb13FGuF0F1w2iiG1Xiaforem090Cjt1RXAyONr8P
         J6mE72GQo0yjFP5NS32aGoxlmAIEdrRTYgcone1KmuYK7YeaexU+BOi3SBKMxqHDYT1s
         DXxNB14R1sBnX+G8jYGJnyV/aqwFF7mWAXRBH2YJIQaY1K4e4T33+zaHY0lEvQivrHQ8
         fbi/nUOqBVMw5rKzVQ2/KYLg/GqGZJvIK3oz0Cq/DMFjZcQqa7t/CqR+kGd2/qETigU8
         mHNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="TK/0jhJk";
       spf=pass (google.com: domain of wainersm@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=wainersm@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <wainersm@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id l12si539988ejz.412.2020.01.27.05.22.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 05:22:15 -0800 (PST)
Received-SPF: pass (google.com: domain of wainersm@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="TK/0jhJk";
       spf=pass (google.com: domain of wainersm@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=wainersm@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580131334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aB9kUk5ctG0RxgHEX2uURz1zw1nvRkSkcTM8skY9h0s=;
	b=TK/0jhJkcibFCo9t0efU5kb8uZft5jvc+q3IStBAGAjr/bF61WUrA3CPVesQ5QTrOeTQIY
	Pcl7i16qzeNj+mDRN1yCv6V52oGLSf6ptzOR9chZtPf+Qmx3HLbXCrHqr6D5TqLQ5pZTiQ
	IcUcCUvGMu/F3k34wpn1amOIbrjH/PI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-esrO01dtNrCh4ZK5_SzEQA-1; Mon, 27 Jan 2020 08:22:11 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F64B13E2;
	Mon, 27 Jan 2020 13:22:09 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-27.gru2.redhat.com [10.97.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4226360BF4;
	Mon, 27 Jan 2020 13:22:06 +0000 (UTC)
Subject: Re: [PATCH] tests/acceptance: Add boot tests for some of the QEMU
 advent calendar images
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>
References: <20200124170325.30072-1-thuth@redhat.com>
 <8f085a1a-b9df-29d4-db51-eb345a44a971@redhat.com>
 <1f564925-2ee1-ab17-a946-f9bcd656926f@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <37b98a5d-8e96-9961-a230-4ee47d0c3169@redhat.com>
Date: Mon, 27 Jan 2020 11:22:05 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1f564925-2ee1-ab17-a946-f9bcd656926f@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: esrO01dtNrCh4ZK5_SzEQA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: KaK72wOxOwDS


On 1/25/20 2:43 PM, Thomas Huth wrote:
> On 24/01/2020 22.28, Wainer dos Santos Moschetta wrote:
>> On 1/24/20 3:03 PM, Thomas Huth wrote:
>>> The 2018 edition of the QEMU advent calendar 2018 featured Linux images
>>> for various non-x86 machines. We can use them for a boot tests in our
>>> acceptance test suite.
>>>
>>> Let's also make sure that we build the corresponding machines in Travis=
,
>>> and while we're there, drop the superfluous --python parameter (python3
>>> is now the only supported version anyway).
>> Yes, please, removal of --python was in my wish list.
>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>  =C2=A0 .travis.yml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>>>  =C2=A0 tests/acceptance/boot_linux_console.py | 96 +++++++++++++++++++=
+++++++
>>>  =C2=A0 2 files changed, 97 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/.travis.yml b/.travis.yml
>>> index 6c1038a0f1..73ca12c921 100644
>>> --- a/.travis.yml
>>> +++ b/.travis.yml
>>> @@ -268,7 +268,7 @@ matrix:
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Acceptance (Functional) tests
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - env:
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - CONFIG=3D"--python=3D/usr=
/bin/python3
>>> --target-list=3Dx86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-so=
ftmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,ppc-softmmu,ppc64-softmmu,m68=
k-softmmu,sparc-softmmu"
>>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -
>>> CONFIG=3D"--target-list=3Daarch64-softmmu,alpha-softmmu,arm-softmmu,m68=
k-softmmu,microblaze-softmmu,mips-softmmu,mips64el-softmmu,nios2-softmmu,or=
1k-softmmu,ppc-softmmu,ppc64-softmmu,s390x-softmmu,sparc-softmmu,x86_64-sof=
tmmu,xtensa-softmmu"
>>>
>>
>> Perhaps use MAIN_SOFTMMU_TARGETS in only append the other targets, like:
>>
>> --target-list=3D${MAIN_SOFTMMU_TARGETS},alpha-softmmu,sparc-softmmu,....
> Not sure ... while it is a nice way to shorten the line here, it adds a
> dependecy to that variable ... and MAIN_SOFTMMU_TARGETS has been changed
> a couple of times during the course of time, so we might risk to lose
> some testing coverage here in case someone removes a target from
> MAIN_SOFTMMU_TARGETS but forgets to add it here again...? I think we
> should better use the explicit list here instead.

Your reasoning makes sense to me. Feel free to ignore my suggestion.

Thanks,

Wainer

>
>   Thomas
>
>
