Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp724460lfr;
        Thu, 15 Apr 2021 10:18:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgxJzQTaagZd0ZDqk8k/GNt/h7YsaJN8nCPH5U1Dt1vw6KrbAmPaX7Dys4hMPfNjZ63qwj
X-Received: by 2002:a1c:b656:: with SMTP id g83mr4212397wmf.163.1618507127989;
        Thu, 15 Apr 2021 10:18:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618507127; cv=none;
        d=google.com; s=arc-20160816;
        b=FG6vfZNl9an+Hye0UfxUVblDzG2q5ktBTZsub8oBAcmE+xFY4FVbCt7spcizC02S59
         1wX/hvOja0grHXhxJZ3m50ypn+EcB+11/gao+Oqwuuq/kV+QBukBwktxeoo7grvM1Rwq
         OX7w9jtBekghswrOjy1+LFQD+vJQxIj35obKSbrFl7R5BgjfOeNuknJFjphTV9j+eHqB
         AIljNq0hHFGnH3+0Cy3UTaaoVtyAttWN2zxRbfs0yS07AFgnxbb5di4pSrqVOlypeFUn
         eKRUExTb0AE6dDCmhuDBA5G5tCwT9cg6fDuFr/xPfolhXLJ1OyB0a2DNZ41mWvUe/Ptt
         U0+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=Qdqd9NnJK8/Q4kR41Ujr754tOtHRjqeJEBjDkGnT/vs=;
        b=Lk6MDcdgpHeaKRgUUvqzsfAKuuYRqThsQL0pWZ/L5tlg62SxfRxPdZdVjhjJ7r3PC2
         UOn3DiSOIvV83AfsGSoHMvEHSRxwnsMavxxkaMOadzJiKe6w70dZSusM1qct1RIcnwVb
         ReYiekHl47tkC7IFU6/GQz+EhQ8ENHNZVZmc40TB+amHmiSWH0fxP39O1wA4HBtE3PfK
         l4RdmJo4NKMggeSXj9oZ0terPQFykKjepku3nEXfn3S6qgDVD1Mw9UA78a3p+OdC/0ol
         QrwsrWjeqsfET8LmnNV+7wHwotfzGLIVgG6KkWGgj279rYyayb0qxOmbA0EdeLs6oUBU
         ZN1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 178.33.254.192 as permitted sender) smtp.mailfrom=clg@kaod.org
Return-Path: <clg@kaod.org>
Received: from 3.mo52.mail-out.ovh.net (3.mo52.mail-out.ovh.net. [178.33.254.192])
        by mx.google.com with ESMTPS id a17si3529122wmd.72.2021.04.15.10.18.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Apr 2021 10:18:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of clg@kaod.org designates 178.33.254.192 as permitted sender) client-ip=178.33.254.192;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 178.33.254.192 as permitted sender) smtp.mailfrom=clg@kaod.org
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.210])
	by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 79F9725C5E9;
	Thu, 15 Apr 2021 19:18:47 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 15 Apr
 2021 19:18:46 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-103G005299d6363-7978-4634-8674-a9eb0ed4637f,
                    223986A87AF8D074E4FEF7B99352A100DDD0E9F0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [EXTERNAL] Re: [PULL 18/23] accel/tcg: re-factor non-RAM
 execution code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Peter Maydell
	<peter.maydell@linaro.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
	<alex.bennee@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
CC: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
	<richard.henderson@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>
References: <20210218094706.23038-1-alex.bennee@linaro.org>
 <20210218094706.23038-19-alex.bennee@linaro.org>
 <CAFEAcA8micdrGgwyS-20mnGkdpJ3mMnq=MEJJFZCh3XGx0uMbg@mail.gmail.com>
 <CAFEAcA9G-WabAM_EdgMzd0Xv6z8xRYjw57DiEqB6Z_Wbj=X1Eg@mail.gmail.com>
 <87blaflit2.fsf@linaro.org>
 <CAFEAcA_Uqvc5zyJs8XHWDGR1B_jUZ9jY5EdgHSmaczuOc02ykg@mail.gmail.com>
 <b989ebfe-1294-5eef-53a2-9599421e0069@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6597cb54-44d9-0798-0786-098286001fe0@kaod.org>
Date: Thu, 15 Apr 2021 19:18:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b989ebfe-1294-5eef-53a2-9599421e0069@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 50e4b46c-3d43-4c0c-a7f2-a452ee3c2f8d
X-Ovh-Tracer-Id: 8464234028943444841
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudelfedgudduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepfhegsghughesrghmshgrthdrohhrgh
X-TUID: kfW/iWpFCbpx

On 4/15/21 5:55 PM, Philippe Mathieu-Daudé wrote:
> On 4/15/21 4:54 PM, Peter Maydell wrote:
>> On Thu, 15 Apr 2021 at 15:32, Alex Bennée <alex.bennee@linaro.org> wrote:
>>> --8<---------------cut here---------------start------------->8---
>>> accel/tcg: avoid re-translating one-shot instructions
>>>
>>> By definition a single instruction is capable of being an IO
>>> instruction. This avoids a problem of triggering a cpu_io_recompile on
>>> a non-cached translation which would only do exactly this anyway.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>> accel/tcg/translate-all.c | 2 +-
>>>
>>> modified   accel/tcg/translate-all.c
>>> @@ -1863,7 +1863,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>>>
>>>      if (phys_pc == -1) {
>>>          /* Generate a one-shot TB with 1 insn in it */
>>> -        cflags = (cflags & ~CF_COUNT_MASK) | 1;
>>> +        cflags = (cflags & ~CF_COUNT_MASK) | CF_LAST_IO | 1;
>>>      }
>>>
>>>      max_insns = cflags & CF_COUNT_MASK;
>>> --8<---------------cut here---------------end--------------->8---
>>
>> Yes, this fixes the problem. Do we want to put this in for 6.0? My
>> feeling is that executing from non-RAM is pretty niche, so maybe
>> if we need an rc4 anyway, but this isn't important enough to cause an
>> rc4 itself.
> 
> Isn't it the default for Aspeed machines (with U-Boot)? (Cc'ing Cédric).

You need to set the 'execute-in-place' machine option to load/execute the
instructions from the AHB window of CE0. It's not on by default because 
boot can be really slow with some recent u-boot which heavily trash the TBs.

But this seems to work fine with -rc3. 

C. 
