Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1019171lfm;
        Wed, 24 Jun 2020 23:52:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzD3eMQIuaHjO/kyOGvU4z99YsY2ZwoR/1YgzHWgMjMGof2Z5tntXzZgk8olVGJ4pwEQoVs
X-Received: by 2002:adf:e884:: with SMTP id d4mr851571wrm.176.1593067953524;
        Wed, 24 Jun 2020 23:52:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593067953; cv=none;
        d=google.com; s=arc-20160816;
        b=wqK9guP1lgw2GRqrN5YXS/JZha6KmYbDSEHsx+xj08bMgx8a3a8AR4fdhmpDmxLt09
         g21k9xSzQw4oV/VjGwFcIVnNag3SPCSyARwjUFUHSZF6Ugj/Wmwisc5Ke+v4umDglzpJ
         d5COvMbcYS/o30bMsEzC7C2BCKe/FEY8DguGBnOLJVT1yzMZeaC7lQLYe3/9zIhWHC78
         ERExyrDEBZB1E6VOjRM4r3bY/zUgJfzsyivRslFBaWu3iuFquHg804f8bsntTIbb565I
         R1c0y0VorUk4BakZI0ld97dtAbmauDUY5Ys4r4aszgO/4VCVnDw/kq9j78hB/vTaA2UE
         Q8sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=j/tHyiX8nIgYd5aeuvvcmFG0aka/hELVngao0zkF2zk=;
        b=aJQ3x8et51bqOP1qem9rTvSIi9nEqtb/7cFUFpkkJpz0okmqEnpwBLHTsx7UJK07so
         ZiSjxnxVDpRN/saooN+QjpNF4zK3zxwA5pvWOUHE6uiZolpVZGs+2JxziPZtEJBjNC+s
         7rqzjCyjImLABEvxIlHsnn8fYPJ7+aRUjCAt+PUwIVZ9BKSqsy8Jm/w6coTeacxtJXwF
         3gmNwuxpZ1sOX8vWIxRdJtgtT1eBa34h4nrF7XsSSFhVyrEqum7AVxEddbtClYBE4aKT
         jl7CxHPKEqEO9S1iz3FIgO4j0sgOmP1noYPJ698v2RtpN44yIPt6S1NNhsFuXq6z0osQ
         KBNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of v.dupaquis@trusted-objects.com designates 149.202.244.204 as permitted sender) smtp.mailfrom=v.dupaquis@trusted-objects.com
Return-Path: <v.dupaquis@trusted-objects.com>
Received: from mailex.trusted-objects.com (mailex.trusted-objects.com. [149.202.244.204])
        by mx.google.com with ESMTPS id b6si24219646wrs.38.2020.06.24.23.52.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jun 2020 23:52:33 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of v.dupaquis@trusted-objects.com designates 149.202.244.204 as permitted sender) client-ip=149.202.244.204;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of v.dupaquis@trusted-objects.com designates 149.202.244.204 as permitted sender) smtp.mailfrom=v.dupaquis@trusted-objects.com
Received: from [IPv6:2a01:e35:2e98:43c0:22dc:968f:2590:9879]
 (2a01:e35:2e98:43c0:22dc:968f:2590:9879) by S76918.EX76918.lan
 (2001:41d0:117:dd00::95ca:f4cc) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P521) id 15.1.1913.5; Thu, 25
 Jun 2020 08:52:31 +0200
Subject: Re: Role of qemu-arm
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
CC: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-arm
	<qemu-arm@nongnu.org>
References: <20200619170324.12093-1-peter.maydell@linaro.org>
 <879e933c-a65c-3706-afa1-5ede1acb062c@ispras.ru>
 <e0fc64ab-b36e-99d1-90ea-8877c00f8c0f@trusted-objects.com>
 <87o8pba35w.fsf@linaro.org> <7e057989-56b8-195d-247d-9ab0522ff23a@amsat.org>
 <56ffc60e-f458-e9d4-d89e-4ca70b1ed4e2@trusted-objects.com>
 <CAFEAcA8G3ngwUXMSCEN6UVEJ6Na5sBpHqYv1qh7PEn5uMAhGqQ@mail.gmail.com>
 <e9ad4bb6-e8c9-55f5-565a-01c3f35aea92@trusted-objects.com>
 <CAFEAcA9RAXmMeHFWX0La8yLL3M4mjC+mpsW6AvJFfsP8aGnfqQ@mail.gmail.com>
 <be9893b6-f3c2-2e6c-d00e-9d8ce803b946@trusted-objects.com>
 <87mu4s7oth.fsf@linaro.org>
From: vincent Dupaquis <v.dupaquis@trusted-objects.com>
Message-ID: <bee6e254-6f69-109e-2571-4e4370768930@trusted-objects.com>
Date: Thu, 25 Jun 2020 08:52:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <87mu4s7oth.fsf@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: fr-FR
Return-Path: v.dupaquis@trusted-objects.com
X-Originating-IP: [2a01:e35:2e98:43c0:22dc:968f:2590:9879]
X-ClientProxiedBy: S76918.EX76918.lan (2001:41d0:117:dd00::95ca:f4cc) To
 S76918.EX76918.lan (2001:41d0:117:dd00::95ca:f4cc)
X-TUID: rxb2GyxYYHvH

The libraries in this case do not make any interaction with I/O. We take
control over them through GDB to be able to run them & test them.

They can be linked into a ELF binary (indeed this is how we test them,
we link them with a dummy binary and take control over it using the
debug interface).

Regading the priviledged instructions, I do not understand the question,
we only use available core instructions (I do not remember about
priviledged instructions in Cortex-Mx.

Le 24/06/2020 à 12:14, Alex Bennée a écrit :
> vincent Dupaquis <v.dupaquis@trusted-objects.com> writes:
>
>> Indeed, for us it has an interest, as we do libraries running on
>> cortex-Mx cores. We are not linked to any specific board and can run
>> on any.
> Do the libraries use any privileged instructions?
> How do they interact with I/O?
> Can they be linked into an ELF binary?
>
>> Currently, we are using a basic board (the netduino2), and do not make
>> use of any peripherals (that's the goal of our project, being able to be
>> used on any board, with the right core). We do not even use the IT
>> controller.
>>
>> You are right to say that there is no need of having 'plain cpu'
>> emulation, as long as you can use any existing simulated board model.
>> So, as long as there is
>>
>> By the way, my original question was on the usage of qemu-arm, and I
>> have my response now :) It has no interest for cortex-Mx devices.
> So I believe some of the gcc m-profile test suite runs under qemu-arm
> with semihosting for this reason. You may need to wrap a little test
> harness around your libraries to get this to work though.
>
>> Best regards,
>>
>> Vincent.
>>
>> Le 22/06/2020 à 15:43, Peter Maydell a écrit :
>>> On Mon, 22 Jun 2020 at 14:03, vincent Dupaquis
>>> <v.dupaquis@trusted-objects.com> wrote:
>>>>     It is a shame, so I suppose I'll have to stay with my emulation
>>>> using netduino2 or so ...
>>>>
>>>>     That was the reason why I tried to use qem-arm, which is probably
>>>> crashing because what you just suggested.
>>> qemu-arm is for "I'm a linux userspace binary"; if your code is
>>> a userspace binary then you can use it...
>>>
>>>>     Is there a way of pointing-out the interest for the feature ?
>>> I'm afraid we don't support or have any plan to support
>>> "just run a CPU, no peripherals". I don't think there's much
>>> utility in it -- M-profile needs the interrupt controller,
>>> almost any setup wants to have a UART for I/O, and you need
>>> some actual RAM, which then leaves you with the question of
>>> what address to put the RAM at. At that point you're not
>>> really "just a CPU", you're "a minimalist board that doesn't
>>> correspond to any real hardware". We've found from experience
>>> that emulating things which don't correspond to something
>>> in the real world is not really maintainable and supportable
>>> in the long term.
>>>
>>> If your code will genuinely run on any M-profile board,
>>> just pick whichever one seems most useful and ignore
>>> the devices you don't need to use. (I like the mps2-an385,
>>> it has a bit more RAM than most.)
>>>
>>> thanks
>>> -- PMM
>
-- 

*Vincent Dupaquis*
Software security & Cryptography expert
06 24 58 17 05
/Europarc de Pichaury Bâtiment B8 1330 rue Guillibert de la Lauzière
13290 Aix-en-Provence/

www.trusted-objects.com <http://www.trusted-objects.com>
