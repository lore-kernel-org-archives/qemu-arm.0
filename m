Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp155063lfr;
        Fri, 16 Apr 2021 00:55:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTH16o4M3KunnqvwTcPbxV2pEK1nJecE4J7oPDYIoU0AwIrb1z0tt8KcbU4tuvGWduHsN7
X-Received: by 2002:a5d:4707:: with SMTP id y7mr7883581wrq.396.1618559725957;
        Fri, 16 Apr 2021 00:55:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618559725; cv=none;
        d=google.com; s=arc-20160816;
        b=v3NsayBq5xTCRswLlBkeKqF0G/+IV/NdY8wDFdVWE/7nvDpX0ULIGlJ+sk1sjg/dQd
         LZVLDSdyEdRR/zoe1kxtq8QsNloQS05ono8L9IzhOcSWUm/4tXFDtCGqbT+b9sPeORpI
         m4iYztfpuqPR+lGxnSygfzrc0VuLPKSsr0zdoco8BWCloeubCsdvlR3BT5I0nzmFqtbA
         HPrw7dcoY9R2dpcZrwUo4fZL8976QpxEswV4SAZChQjoAK/iPQSzLZSBYK/b4iyNqEfS
         pbVHiVsILOyzfH7yiOmidJfai8WmnuWl76dnq8+mOsPxfjNqUFz+KvxVEoYXaDXlfjfO
         21pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=K4JGBp5HlJT64zFEt+T65fif7iXKzxmL1nZRN3i7AeY=;
        b=j/wrN1YAhwluwpcnbnL7qSYHQCZxzELCcA0wKQIyRaaGTz1tLUVdvNvcXWbyk1kv5F
         4yWj+CcR9wk86KswwqKYYurHW8pTGXzh0uifJjv8PR0vc7H5TQgUWUm+iIPEC7cM35Gu
         vhcXdaaojO1u/WzsPJiiFwwzoJRPNqSK/He41fwXnM/URg8IZo65rUp+3z1LX9ubkanq
         OYF4jDwiSghStwtKDMr0M6xqjj1jeUAGqSNCNsc58BHZYq8Pw6wHr4oXbW+uXAGWlpdd
         XHvPiXrMmtMLF2nyQEeJ/ZpIPQ8jBFGV8uQveCzG4udj7qTC52kEJsbnj9hjE/izbupX
         O7aw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 46.105.77.235 as permitted sender) smtp.mailfrom=clg@kaod.org
Return-Path: <clg@kaod.org>
Received: from 10.mo51.mail-out.ovh.net (10.mo51.mail-out.ovh.net. [46.105.77.235])
        by mx.google.com with ESMTPS id b12si5102335wri.80.2021.04.16.00.55.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Apr 2021 00:55:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of clg@kaod.org designates 46.105.77.235 as permitted sender) client-ip=46.105.77.235;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 46.105.77.235 as permitted sender) smtp.mailfrom=clg@kaod.org
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.141])
	by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 1DB4F278181;
	Fri, 16 Apr 2021 09:55:23 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Apr
 2021 09:55:22 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-95G001abd74327-f1ae-4712-bcbd-30c04eed69b0,
                    98643AE5B40D77660504470F9E4DE59E1F602129) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [EXTERNAL] Re: [PULL 18/23] accel/tcg: re-factor non-RAM
 execution code
To: Peter Maydell <peter.maydell@linaro.org>
CC: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	=?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm
	<qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
	<richard.henderson@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>
References: <20210218094706.23038-1-alex.bennee@linaro.org>
 <20210218094706.23038-19-alex.bennee@linaro.org>
 <CAFEAcA8micdrGgwyS-20mnGkdpJ3mMnq=MEJJFZCh3XGx0uMbg@mail.gmail.com>
 <CAFEAcA9G-WabAM_EdgMzd0Xv6z8xRYjw57DiEqB6Z_Wbj=X1Eg@mail.gmail.com>
 <87blaflit2.fsf@linaro.org>
 <CAFEAcA_Uqvc5zyJs8XHWDGR1B_jUZ9jY5EdgHSmaczuOc02ykg@mail.gmail.com>
 <b989ebfe-1294-5eef-53a2-9599421e0069@amsat.org>
 <6597cb54-44d9-0798-0786-098286001fe0@kaod.org>
 <CAFEAcA-x-eNaH=JROoSgF-ruWJDC2++qLNxz3ZEtziyUO-3aEQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <959e497c-7873-f449-c3d8-546479cccace@kaod.org>
Date: Fri, 16 Apr 2021 09:55:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-x-eNaH=JROoSgF-ruWJDC2++qLNxz3ZEtziyUO-3aEQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 273d0e23-ca36-4178-ad91-255a9d141f3f
X-Ovh-Tracer-Id: 4821947828536642409
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudelgedguddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrgh
X-TUID: 9vYgfJMJ3K7Q

On 4/15/21 7:34 PM, Peter Maydell wrote:
> On Thu, 15 Apr 2021 at 18:18, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> On 4/15/21 5:55 PM, Philippe Mathieu-Daudé wrote:
>>> On 4/15/21 4:54 PM, Peter Maydell wrote:
>>>> On Thu, 15 Apr 2021 at 15:32, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>>> --8<---------------cut here---------------start------------->8---
>>>>> accel/tcg: avoid re-translating one-shot instructions
>>>>>
>>>>> By definition a single instruction is capable of being an IO
>>>>> instruction. This avoids a problem of triggering a cpu_io_recompile on
>>>>> a non-cached translation which would only do exactly this anyway.
>>>>>
>>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>>>
>>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>> accel/tcg/translate-all.c | 2 +-
>>>>>
>>>>> modified   accel/tcg/translate-all.c
>>>>> @@ -1863,7 +1863,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>>>>>
>>>>>      if (phys_pc == -1) {
>>>>>          /* Generate a one-shot TB with 1 insn in it */
>>>>> -        cflags = (cflags & ~CF_COUNT_MASK) | 1;
>>>>> +        cflags = (cflags & ~CF_COUNT_MASK) | CF_LAST_IO | 1;
>>>>>      }
>>>>>
>>>>>      max_insns = cflags & CF_COUNT_MASK;
>>>>> --8<---------------cut here---------------end--------------->8---
>>>>
>>>> Yes, this fixes the problem. Do we want to put this in for 6.0? My
>>>> feeling is that executing from non-RAM is pretty niche, so maybe
>>>> if we need an rc4 anyway, but this isn't important enough to cause an
>>>> rc4 itself.
>>>
>>> Isn't it the default for Aspeed machines (with U-Boot)? (Cc'ing Cédric).
>>
>> You need to set the 'execute-in-place' machine option to load/execute the
>> instructions from the AHB window of CE0. It's not on by default because
>> boot can be really slow with some recent u-boot which heavily trash the TBs.
>>
>> But this seems to work fine with -rc3.
> 
> Triggering the bug requires both execute-in-place and -icount -- did
> you test with -icount enabled?

It crashes.

Thanks,

C. 

$ qemu-system-arm -M romulus-bmc,execute-in-place=true -icount auto -drive file=./flash-romulus,format=raw,if=mtd  -serial mon:stdio
qemu: fatal: cpu_io_recompile: could not find TB for pc=0x7efbcc001992
R00=0005107a R01=00000000 R02=00000000 R03=00000000
R04=00000350 R05=00000000 R06=00000000 R07=00000000
R08=00000000 R09=00000000 R10=00000000 R11=00000000
R12=00000000 R13=00000000 R14=00000350 R15=00000c70
PSR=400001d3 -Z-- A S svc32
s00=00000000 s01=00000000 d00=0000000000000000
s02=00000000 s03=00000000 d01=0000000000000000
s04=00000000 s05=00000000 d02=0000000000000000
s06=00000000 s07=00000000 d03=0000000000000000
s08=00000000 s09=00000000 d04=0000000000000000
s10=00000000 s11=00000000 d05=0000000000000000
s12=00000000 s13=00000000 d06=0000000000000000
s14=00000000 s15=00000000 d07=0000000000000000
s16=00000000 s17=00000000 d08=0000000000000000
s18=00000000 s19=00000000 d09=0000000000000000
s20=00000000 s21=00000000 d10=0000000000000000
s22=00000000 s23=00000000 d11=0000000000000000
s24=00000000 s25=00000000 d12=0000000000000000
s26=00000000 s27=00000000 d13=0000000000000000
s28=00000000 s29=00000000 d14=0000000000000000
s30=00000000 s31=00000000 d15=0000000000000000
FPSCR: 00000000
Aborted (core dumped)
