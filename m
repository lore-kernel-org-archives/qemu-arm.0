Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp506035lfp;
        Tue, 28 Jan 2020 06:01:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqzuwIWJYT4n0kidNm2r46y4IlXLVjCNnQVUzXlz8nqH6BAPVSIThdoTzPUR6ze9KAFc8w16
X-Received: by 2002:a81:34c6:: with SMTP id b189mr17061064ywa.106.1580220116855;
        Tue, 28 Jan 2020 06:01:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580220116; cv=none;
        d=google.com; s=arc-20160816;
        b=Hr2JOkLQjmvK7xpqoOvAy+lwBGfxyon33ciaMglZ2Ta/eh+mnaROqvtBTTjElTZxRI
         MgFCM7It/OqN3Y3K/KDm/IEX9Vq4vWAoNsEJAE2go8xa4/jRh3z9TSlXFFAxf3H/9U29
         yOUfpBNEpGYRlKId9dGg3w927PSzyzkalMrwrjG4Ym9/oLfFKMhIVMQJYu+zWyXU/UMV
         /uM9H1lQww34+ENaW/WADPoI/AxL+jleHwpsavHZi+wGkudyVZc9XX1p5YZksTsUzzVf
         8e9GBfxZElnYUZhXxVwk2ejsfQQjVmIyKb5DMy+UBz6jSlsZi2tT9X4zKffYVb3XNvS8
         3GUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=KXg/X3vLFRTWY3nsE39OIA4RzJ5gQ0H3jrsDYrJ6ngs=;
        b=Rgy2wAWyIsiuoUumHvxEXUjj7974He0Y8pUNI/Jo9L4c284ESq3izqRXvPqSFintcV
         GUzqnuU6YiB5Sg8UDbWw7aimgIei/ld/cn1qY1Nv4IF+RuxDclKkG4TGU60T7dLcdJLA
         zFXajpgEBK5E+L/f3W/crt/z5a6qDkLtT3nVKZn6h2hNut2lGXKuWhpphfzxMnCdTjbI
         Hql0n3ya84WtxbWaMrMS6hkcylo8cpM3eIq48fVv00T42aVSpGiVwiaCRSIOGEMus0v7
         bBoGnr7gYuLy45b2eSSlRY/YIpEvmNqksnMFd2ydmDg7pu0B+GRBzxcxh97slOvhEhO1
         urbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MAW5JlG+;
       spf=pass (google.com: domain of wainersm@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=wainersm@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <wainersm@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id p142si9965485ybg.462.2020.01.28.06.01.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jan 2020 06:01:56 -0800 (PST)
Received-SPF: pass (google.com: domain of wainersm@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MAW5JlG+;
       spf=pass (google.com: domain of wainersm@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=wainersm@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580220116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KXg/X3vLFRTWY3nsE39OIA4RzJ5gQ0H3jrsDYrJ6ngs=;
	b=MAW5JlG+mD1iI2EBDRxjuk8Rahn7DEHIrffxqRPP5NKO+mF9tFuu0CtLBrSnvxWdvXMsp0
	EHhgwoyvlLj+uam1H9kFaUjWPQUU8ewMSW9iufINVHsM3YgDsPMjFSGQWxTCh6uImBqZEV
	A5ErAyOo3846mx3hJ2ESh3pcQRiutdw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-yhb9YR8hPGyA8omKbpKG5Q-1; Tue, 28 Jan 2020 09:01:48 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9E4B10071F9;
	Tue, 28 Jan 2020 14:01:46 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-65.gru2.redhat.com [10.97.116.65])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 92FFB1001281;
	Tue, 28 Jan 2020 14:01:40 +0000 (UTC)
Subject: Re: [PATCH] tests/acceptance: Add a test for the canon-a1100 machine
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20200127144126.15515-1-thuth@redhat.com>
 <cd60a444-620e-3366-09e8-e9c8d72894ad@redhat.com>
 <c4976fd4-f1f0-c48b-aad4-4414564f8258@redhat.com>
 <05f7e133-8ad3-8627-79a1-a046e6d42d16@redhat.com>
 <2a303987-ad19-538b-98ce-a2cb83d8fade@redhat.com>
 <9856cc15-2365-4609-5af9-f6582cb20ed8@redhat.com>
 <6b5cba1d-4aba-cd59-74a8-880a8d800a35@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <766805d9-0dbc-eda1-4157-1feb33fc9ea5@redhat.com>
Date: Tue, 28 Jan 2020 12:01:38 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <6b5cba1d-4aba-cd59-74a8-880a8d800a35@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: yhb9YR8hPGyA8omKbpKG5Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: CB9S8/zLAIrC


On 1/28/20 10:16 AM, Thomas Huth wrote:
> On 27/01/2020 21.56, Philippe Mathieu-Daud=C3=A9 wrote:
>> Hey Wainer,
>>
>> On 1/27/20 6:45 PM, Wainer dos Santos Moschetta wrote:
>>> On 1/27/20 1:41 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> On 1/27/20 4:39 PM, Thomas Huth wrote:
>>>>> On 27/01/2020 16.18, Philippe Mathieu-Daud=C3=A9 wrote:
>>>>>> On 1/27/20 3:41 PM, Thomas Huth wrote:
>>>>>>> The canon-a1100 machine can be used with the Barebox firmware. The
>>>>>>> QEMU Advent Calendar 2018 features a pre-compiled image which we
>>>>>>> can use for testing.
>>>>>>>
>>>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>>>> ---
>>>>>>>  =C2=A0=C2=A0 tests/acceptance/machine_arm_canon-a1100.py | 33
>>>>>>> +++++++++++++++++++++
>>>
>>> What is the reason for not adding this case in boot_linux_console suite=
?
>> Because there are too many tests in this file and it became hardly
>> maintainable. Also it is easier to add a 'F:' entry in the MAINTAINERS
>> file to each machine section.


Maybe it reached an inflection point and deserves to be split among=20
files and directories...


> Additionally, this is not a test with a Linux kernel, it uses the
> Barebox firmware instead. So boot_*linux*_console.py sounds like the
> wrong place for this test.

OK, makes complete sense.

One last comment about this new file. To not look like boring I let=20
pylint say that for me :) :

[wainersm@localhost qemu]$ pylint-3=20
tests/acceptance/machine_arm_canon-a1100.py
************* Module machine_arm_canon-a1100
tests/acceptance/machine_arm_canon-a1100.py:1:0: C0103: Module name=20
"machine_arm_canon-a1100" doesn't conform to snake_case naming style=20
(invalid-name)

With that fix:

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

Thanks,

Wainer


>
>   Thomas
