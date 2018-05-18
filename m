Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp435939wme;
        Fri, 18 May 2018 07:53:52 -0700 (PDT)
X-Received: by 2002:aed:21d1:: with SMTP id m17-v6mr9442837qtc.351.1526655232728;
        Fri, 18 May 2018 07:53:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526655232; cv=none;
        d=google.com; s=arc-20160816;
        b=ItRHiVmk0I9G6wTNzZSQjyPupJON8DmPdeefYx43UdmVYLKCE3Gi09TjaizSGVHC0d
         /HoKv1aEi+jPDd2KjsAJ931xuN7BxwP4BSa4cXQMC/uwZot5mvhXYrod9u/geU9kRS06
         hKqlUkyoIYNKrCR/rGU6+XBv55LdWU0t9oIdloC2OaJ1qF/8sxOoz/OvqUAzGTX4caEG
         uXa1Tk2FOKGSCYg94wCmZpQ8CcbhQNXFLjcMbnUk6QFrizCw5LNuQEC5w3V+kBN+oc6V
         OajPIJnjrfGCWS/K6vQ0JlV02viiu3asb2MnutnNxrI3PZ4P6q9peC7/47+LxNK3N/+g
         2SZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :sender:dkim-signature:arc-authentication-results;
        bh=ohJksjvj+vTJJ/UGT6KcU0so/NbUA9/YveYn7Ly0vC8=;
        b=j9FlH9lY7OrCobKrytdP1LaXUnd+ACmTjrfUFRDVCsJGclsjzlbBcKYOAjFiM8YDYq
         kAEGNK1+iUj4uVwAc//JVV5cMs2npZHOMeugidQ8pnbbAaTszM77gbFNW/VGRZaNFiUP
         3YFYDxw5n1gesIr0Lp+XLIM/hX/mr+rmVBlOcTOpqlaQWzb0MHW5o/Gzrzpp4yY5IN2L
         1/OAfngTSYup9iOd5+1LluQ/xy5hpQFKpOegsWBUiYPtcsgDQlSVTUCoYwgWn7ougUmB
         lSt6JhsvewA+J+KSs6FV2gwPRiUJDVFC88zv/zbHnOxiJyIPxngibhX6CiefAwtoK5u8
         dj1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=fgAazM6A;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id k53-v6sor6154220qtc.79.2018.05.18.07.53.52
        (Google Transport Security);
        Fri, 18 May 2018 07:53:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=fgAazM6A;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ohJksjvj+vTJJ/UGT6KcU0so/NbUA9/YveYn7Ly0vC8=;
        b=fgAazM6Ar6BtKpwtzaZgrrq1OozaL19B4Xzyh5zNGZtQL+7RfU7fTfw7pM3udSPsJa
         N0Ur3sD5vkQY6gVpIn7DjiDFO3xjbPjCijwa5kLLMjxWi0a0qamLv1CSIgUYcHXjTp1z
         NSnLpYTBBihzABs/V5LB8gTzk03srDO3+fGiIk9VFcRcdd2Yb7o3i94gAjuvxSpzBU4K
         c5Gebilmd6kq/JU9nP/Yy61byIC0PkfRZlNKQwhitkuUfiHHDOdJzbLAtWzdRNQ9EHP/
         Hnm9UjNcsvxo5Q3l99rm7pMSPyHYjGSEj90I3YMWJ4j7413c70QrTRWx2dc1ZiSVD1es
         tyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ohJksjvj+vTJJ/UGT6KcU0so/NbUA9/YveYn7Ly0vC8=;
        b=SgRK+89+PO71D2WryjnLr/7QkylPRPd3Wo4mTZtKIWhLEUcZ3ybFFHQD4N6qfhjZ8y
         edH2GCMPDkr+SkVBPG/p/8uRGsjvsCrU+uMUcG9J39KTChpSNhuJ6naQu4GaK53I6gc4
         4MmAfamXNRVEHBL7ULc7Z6VTqDxitWwQstofL62GAB4s7n8PWSzsVldj/eNQIApAb6uv
         ddTI/rxorPtLMJP2sQCEQ7qK8AnQj6Q9v5qftcDiahWk8riSO0txSTvy09efSwM4fgx5
         /9jd13GxFedje+tGnKbEJ+H1rx7dGKbc4Q2NC5bBNVuzWpRgtix+APPZN97GoHpSUT/G
         ab3w==
X-Gm-Message-State: ALKqPweBhHqZFd6iugqrIBKel/Gb9rUwcL0ahgdmEQTJYPUmk67RwmeZ
	UN1urlpZMNRnDyMJO4MXtA0=
X-Google-Smtp-Source: AB8JxZqiqpeOw/hEhGs9axakbEKrjs9hj2Af0313rOjerLbTCrVVn4PgdVgh74lvoWJFhe0prfcBlQ==
X-Received: by 2002:ac8:668c:: with SMTP id d12-v6mr9520089qtp.344.1526655232393;
        Fri, 18 May 2018 07:53:52 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.11] ([138.117.48.222])
        by smtp.gmail.com with ESMTPSA id w70-v6sm6765539qkg.13.2018.05.18.07.53.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 May 2018 07:53:51 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v4 32/49] tests/tcg/arm: add fcvt test cases for
 AArch32/64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, cota@braap.org,
 famz@redhat.com, berrange@redhat.com, balrogg@gmail.com,
 aurelien@aurel32.net, agraf@suse.de, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, "open list:ARM"
 <qemu-arm@nongnu.org>
References: <20180517174718.10107-1-alex.bennee@linaro.org>
 <20180517174718.10107-33-alex.bennee@linaro.org>
 <9ef2bc85-cead-080c-8313-bf0113d5019e@linaro.org>
 <927cd32b-6de1-3702-5125-e682fb2ffcd4@amsat.org> <87k1s1e5vd.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <80c70a91-5071-7784-f3cf-d175f4d7fffb@amsat.org>
Date: Fri, 18 May 2018 11:53:47 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <87k1s1e5vd.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 120vM/gg+gpp

On 05/18/2018 05:16 AM, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> On 05/17/2018 05:30 PM, Richard Henderson wrote:
>>> On 05/17/2018 10:47 AM, Alex Bennée wrote:
>>>> This runs through the usual float to float conversions and crucially
>>>> also runs with ARM Alternative Half Precision Format.
>>>>
>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>> [rth: tweak vcvtb.f16.f32/vctb.f32.f16 code and regen]
>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>>
>>>> ---
>>>> v4
>>>>   - add fcvt.ref and check results against it
>>>>   - fix single_to_half, single_to_double conversions
>>>>   - properly toggle AHP mode (fpsr->fpcr)
>>>>   - more values around the AHP margins
>>>>   - add INF/NAN/SNAN inputs
>>>>   - build for ARM and AArch64
>>>>   - fix bug for hex literals
>>>>   - add float-to-int
>>>>   - checkpatch fix
>>>> ---
>>>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> Thanks Richard, I was not very motivated to review each line of the
>> fcvt.ref files =)
>>
>>> diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
>>> index 9d2b551732..7bb777f442 100644
>>> --- a/tests/tcg/arm/Makefile.target
>>> +++ b/tests/tcg/arm/Makefile.target
>>> @@ -8,7 +8,9 @@ ARM_SRC=$(SRC_PATH)/tests/tcg/arm
>>>  # Set search path for all sources
>>>  VPATH 		+= $(ARM_SRC)
>>>
>>> -TESTS += hello-arm test-arm-iwmmxt
>>> +ARM_TESTS=hello-arm test-arm-iwmmxt
>>> +
>>> +TESTS += $(ARM_TESTS) fcvt
>>>
>>>  hello-arm: CFLAGS+=-marm -ffreestanding
>>>  hello-arm: LDFLAGS+=-nostdlib
>>> @@ -24,3 +26,14 @@ run-test-mmap: test-mmap
>>>  	$(call quiet-command, $(QEMU) -p 8192 $< 8192 > test-mmap-8192.out,
>> "TEST", "$< (8k pages) on $(TARGET_NAME)")
>>>  	$(call quiet-command, $(QEMU) -p 16384 $< 16384 >
>> test-mmap-16384.out, "TEST", "$< (16k pages) on $(TARGET_NAME)")
>>>  endif
>>> +
>>> +ifeq ($(TARGET_NAME), arm)
>>> +fcvt: LDFLAGS+=-lm
>>> +# fcvt: CFLAGS+=-march=armv8.2-a+fp16 -mfpu=neon-fp-armv8
>>
>> Alex, What is your idea here, enable this later?
>> Maybe add some TODO comment around..
> 
> How about:
> 
> # AArch32 doesn't support all combinations of FP16<->FOO in it's base
> # profile. Once the AArch32 profile is caught up we should build an
> # additional binary and reference to test the additional combinations.
> 
> I backed the change out when I realised the stretch compiler didn't
> support the same range as my local (18.04) gcc's.

Fine by me, thanks.

>>
>> Except this nit, for both Makefile.target:
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
