Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id y94sm5405234wrc.41.2017.09.11.02.07.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Sep 2017 02:07:30 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 4B6773E0142;
	Mon, 11 Sep 2017 10:07:30 +0100 (BST)
References: <20170817230114.3655-1-richard.henderson@linaro.org> <20170817230114.3655-9-richard.henderson@linaro.org> <87377xijkt.fsf@linaro.org> <871snhibdr.fsf@linaro.org> <889b3e05-64f6-8eb6-0c22-87b09b86b7b8@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 8/8] tcg/i386: Add vector operations
In-reply-to: <889b3e05-64f6-8eb6-0c22-87b09b86b7b8@linaro.org>
Date: Mon, 11 Sep 2017 10:07:30 +0100
Message-ID: <877ex5bo31.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: vY80KNZ5XvBG


Richard Henderson <richard.henderson@linaro.org> writes:

> On 09/08/2017 06:10 AM, Alex Bennée wrote:
>> Also this commit breaks RISU:
>>
>>  qemu-aarch64 build/aarch64-linux-gnu/risu
>>     testcases.aarch64/insn_ANDSi_RES8_ANDS_RES_ANDv_ASRV__INC.risu.bin \
>>     -t testcases.aarch64/insn_ANDSi_RES8_ANDS_RES_ANDv_ASRV__INC.risu.bin.trace
>>
>> Gives:
>>
>> mismatch detail (master : apprentice):
>>   V29   : 000000000000000005388083c1444242 vs 00000000000000002a000e0416a30018
>>
>> The insn is:
>>
>>   37c:       6f56a29d        umull2  v29.4s, v20.8h, v6.h[1]
>>
>> Which is odd because I didn't think we'd touched that.
>
> Indeed we didn't.  Still, I'll check it out next week.

OK it would help if I had objdumped the right file:

     36c:       0e781fdd        bic     v29.8b, v30.8b, v24.8b
     370:       00005af0        .inst   0x00005af0 ; undefined

--
Alex Bennée
