Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1088884lfo;
        Sun, 6 Mar 2022 15:57:42 -0800 (PST)
X-Received: by 2002:adf:d0c8:0:b0:1f0:771f:20d8 with SMTP id z8-20020adfd0c8000000b001f0771f20d8mr6400625wrh.210.1646611062834;
        Sun, 06 Mar 2022 15:57:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646611062; cv=none;
        d=google.com; s=arc-20160816;
        b=pYnRrYSqKEDkpXfev2HyIL9gmGDYGlgNNIf2VPr7DpLbnfpFVrX29mN2qQfAZG8KUw
         2NrMPvkYmo9hUTbutnrVicoQw0qlmYr2JCmSJHozkqGt0evRPFHTuJvXdDV6i/cgsH/u
         oPzMpIe0FuhljQuxUiICuHbpHSSqc0M9igC8ZpuAXRr1VSs1HxXx5n7mCG3lVw/1iQqa
         BFcYNwYak/a8IFN1/7iFeh9ssYdMeMQ2ri0Rrzl9w6Y1i6zC7joO+WUB8b9dRgNCHYgd
         7wNGWpSwfX2EDswO/iN1BaUsAeX4nPqsBpEujRmntNGHd9ZvhKR9/FyOjEA5BYd1/1+o
         n6sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=FmGKt5Ps8WkmvlQS52E59Eh5O0glI+V8imZ9k49DHxc=;
        b=lDmthryQojA+v2B5mNdlZi5ujZdHn0BRy/dirUMW8QqImwPH8aWO1jDw1R8h5f896C
         51ICXl8B2wDNhyl2yqqjiOiO9mm6CJ2+mgDE1qq4aSaanHlCIRHpF9WzZDEWuCMGKSBS
         li7lK2y46/vXVBF3VWx0s6IrdRXyIEtwjkrkx7jgs8yETK+5mT8Q96uKTIIFjktq+z+M
         eGu0FjZcVc/Kr+rOADTczUTE3vmIE7EdaGB3jegV/DxqvX2aubKCcLSvfPMyfESpIGSU
         /N1ozgywMcLqcvN6bNi5SeY4ojd1gq8PE3pLl7FBm1S4SAql9hMdOiUOaKAbizbwUDum
         20SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=dj7fDrSb;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a4-20020a05600c348400b0038113e131b8sor3396498wmq.7.2022.03.06.15.57.42
        (Google Transport Security);
        Sun, 06 Mar 2022 15:57:42 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=dj7fDrSb;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FmGKt5Ps8WkmvlQS52E59Eh5O0glI+V8imZ9k49DHxc=;
        b=dj7fDrSbEaeuHyaV9gkz2aKUEgcAgNCyWtYNEq6zt+TT3ytxp6/5ET6pmvM0/icJfL
         UN2bbO8X3WaQD4dAAy/5s/7/lIvemgeiVCfm5rZ7iimqQ207vbLdsDY7NzO4By0qOwGM
         g5UtMcju4adhcZ96R98gDPTHIItu7rV65Q7kUQCyXsRQMjOWTT5l0VBZ30PVAtfg+q7v
         WF0Oz/LuIkD9bOUFaWV2bgBeUPiKawzP8HtU9w0WPXiWw6zMeYd9mTlYPqRuV8ZnB7lQ
         733ZtdDX4rTAVhi5LLWcVI5MCCM5qu3CYf9Sj8bANlJ+2Wl7Y8nV0IGQHcTSUUOZeCoF
         yRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FmGKt5Ps8WkmvlQS52E59Eh5O0glI+V8imZ9k49DHxc=;
        b=TAfJDpYUyg1ttTzcfA57qEGRt9+QP9QO4gioAsAnucylg9giD2xI0iCBQCuZEaYMnF
         aMhkPTOjSyJC/RDhYAkk5+APeZmYhAZGGXPBr/9kzJ7I6TBIj3uzt2y7D/0X7QTfAFYY
         VP6q3t3mHmBv1rYFkv5EUmpKqvhlPd+zF89cKdGUp7Z7oZ3n3U2QlhkxffVVgrxH2thS
         KeZWp/Bqwz61V1Jl5voWMHdfs8r5fQJFQxr5+5Sq03JfkqicDAEIVXNpx/JAmbHngRrA
         eC9j/5Sc+3n7rOCkdeLWH6SYER/7ssnFLzPxSooj+/EES8hI4PVTGwusKP93LPHuBx97
         PzdA==
X-Gm-Message-State: AOAM531SpeHl2A7FcBikYciBx40zQJOiQlXZ/JOfSIssGdMdV8avNAPZ
	7HoLkAEXsQWWsuHhr7WsUhI=
X-Google-Smtp-Source: ABdhPJxdhuQJ4Pq0gW6+ZNM47/OcltWQ4Zp2crQzg/pAlHwLXbif5ugMVm165ljTo5dAZuwo+oFZfA==
X-Received: by 2002:a05:600c:35c2:b0:381:6cbc:7192 with SMTP id r2-20020a05600c35c200b003816cbc7192mr6767816wmq.146.1646611062561;
        Sun, 06 Mar 2022 15:57:42 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id v124-20020a1cac82000000b0037c3d08e0e7sm18143399wme.29.2022.03.06.15.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Mar 2022 15:57:42 -0800 (PST)
Message-ID: <8f7d11b1-528c-e49d-ee5f-ed64ed5c5336@gmail.com>
Date: Mon, 7 Mar 2022 00:57:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 5/9] tests/avocado/linux_ssh_mips_malta.py: add missing
 accel (tcg) tag
Content-Language: en-US
To: Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Fabien Chouteau <chouteau@adacore.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 David Gibson <david@gibson.dropbear.id.au>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Eric Farman <farman@linux.ibm.com>
References: <20220225210156.2032055-1-crosa@redhat.com>
 <20220225210156.2032055-6-crosa@redhat.com>
 <aa0e1eb4-ef43-b386-e7a3-c034f666181b@gmail.com>
 <8735jzmdib.fsf@p50.localhost.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <8735jzmdib.fsf@p50.localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: OuvYZ1BrCVTo

On 3/3/22 13:13, Cleber Rosa wrote:
> 
> Philippe Mathieu-Daudé <philippe.mathieu.daude@gmail.com> writes:
> 
>> On 25/2/22 22:01, Cleber Rosa wrote:
>>> Being explicit about the accelerator used on these tests is a good
>>> thing in itself, but it will also be used in the filtering rules
>>> applied on "make check-avocado".
>>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>>> ---
>>>    tests/avocado/linux_ssh_mips_malta.py | 3 +++
>>>    1 file changed, 3 insertions(+)
>>> diff --git a/tests/avocado/linux_ssh_mips_malta.py
>>> b/tests/avocado/linux_ssh_mips_malta.py
>>> index c0f0be5ade..0179d8a6ca 100644
>>> --- a/tests/avocado/linux_ssh_mips_malta.py
>>> +++ b/tests/avocado/linux_ssh_mips_malta.py
>>> @@ -23,6 +23,9 @@
>>>    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
>>
>> Should we remove this line then? ^^^
>>
> 
> Yes, we definitely should.  But, I thought it should be a next step.

OK.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

And queued to mips-next.
