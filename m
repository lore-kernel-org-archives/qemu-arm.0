Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp242251lfr;
        Fri, 16 Apr 2021 03:14:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQ135sgzZZBzzPd3U132L5XYzz9dZyPj9x4Ce7A5dF84bbHxH1ajXbIoz4Mlc4K9H2Q2T8
X-Received: by 2002:a1c:ed0d:: with SMTP id l13mr7500245wmh.78.1618568056348;
        Fri, 16 Apr 2021 03:14:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618568056; cv=none;
        d=google.com; s=arc-20160816;
        b=HuJGB63mAh78Y3qc/4liaxHoCEoJUN/STnGPA8fzDh1YZ+Lt3H8T7dq/a0rTn5l386
         MN5tDabUmWIHu3vQull947LIV2dERbpk38BdnEEqGC/4xtHuz2Zsa4EPV1/vmTC/RE+O
         N5DMQu1TmikF0+SF0LIs39eLLLbB48wzDNyd8ss+cNL5EruJuaTKuGYpfjCz3Mf671pN
         MOntW/FDOwKApzYs5TdoWdrs/hwPHgLsckJ9a0b/B/SvBnVL5D6CDaTLvxXJzBMKcJRf
         r++S5gl3cLlbqqyoLgY5rF7R8xSGmFGOjJ687VCw2v3FD5XJsVRoqN3R8FUynoaMgCqQ
         pJmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=vrTYVkh+H8gPMCT4m/1XpX+XRW4aFg6098IWVDIWSYM=;
        b=pJLlDNGglncBVABeXJ6SKq+kuXjDUF8TLINF4UsTyHtLTftZxyLfHU5G5ZokX98Xvs
         SfODbgpnisZfSxzPOvmCC9HqSFBtDfdKiVAPWXwodllx9EWH7f5X9T0UQy3ssWSoA13B
         cz9AQYDfMqR14qoBJpAWzYJ5qblUleIXr8+SbIrDFjSzQMpS5ZzA7pa6UWsLexau9bZJ
         uyEQCH5S7b1xB46c8jW4Lbxi/tLH2DBq55Bfkflw1Zf3oyjrmyVPgIzIpQUWwWfnZ634
         pMR+qR0mUA1Rl0ViOrGS2B8f1gzqw4LFxKqt2st/nNsAVFxPLbSdMrppY3+WKWBE+2pD
         E7vg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 178.33.255.19 as permitted sender) smtp.mailfrom=clg@kaod.org
Return-Path: <clg@kaod.org>
Received: from 2.mo51.mail-out.ovh.net (2.mo51.mail-out.ovh.net. [178.33.255.19])
        by mx.google.com with ESMTPS id a5si5713031wrp.475.2021.04.16.03.14.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Apr 2021 03:14:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of clg@kaod.org designates 178.33.255.19 as permitted sender) client-ip=178.33.255.19;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 178.33.255.19 as permitted sender) smtp.mailfrom=clg@kaod.org
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.3])
	by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 69BC828188D;
	Fri, 16 Apr 2021 12:14:15 +0200 (CEST)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Apr
 2021 12:14:14 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-99G003e4ebc384-c693-41be-b8a3-d9bc6f3e22b6,
                    98643AE5B40D77660504470F9E4DE59E1F602129) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [EXTERNAL] Re: [PULL 18/23] accel/tcg: re-factor non-RAM
 execution code
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
CC: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-arm
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
 <959e497c-7873-f449-c3d8-546479cccace@kaod.org> <8735vqlhdm.fsf@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9c14e634-cd3e-d984-b24f-2abc99536aa0@kaod.org>
Date: Fri, 16 Apr 2021 12:14:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8735vqlhdm.fsf@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 680aa972-0ea7-4df2-ae35-9db0e4586151
X-Ovh-Tracer-Id: 7166915861118880617
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudelhedgvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhg
X-TUID: qxuJZTYS8grP

On 4/16/21 11:14 AM, Alex Bennée wrote:
> 
> Cédric Le Goater <clg@kaod.org> writes:
> 
>> On 4/15/21 7:34 PM, Peter Maydell wrote:
>>> On Thu, 15 Apr 2021 at 18:18, Cédric Le Goater <clg@kaod.org> wrote:
>>>>
>>>> On 4/15/21 5:55 PM, Philippe Mathieu-Daudé wrote:
>>>>> On 4/15/21 4:54 PM, Peter Maydell wrote:
>>>>>> On Thu, 15 Apr 2021 at 15:32, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>>>>> --8<---------------cut here---------------start------------->8---
>>>>>>> accel/tcg: avoid re-translating one-shot instructions
>>>>>>>
>>>>>>> By definition a single instruction is capable of being an IO
>>>>>>> instruction. This avoids a problem of triggering a cpu_io_recompile on
>>>>>>> a non-cached translation which would only do exactly this anyway.
>>>>>>>
>>>>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>>>>>
>>>>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>> accel/tcg/translate-all.c | 2 +-
>>>>>>>
>>>>>>> modified   accel/tcg/translate-all.c
>>>>>>> @@ -1863,7 +1863,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>>>>>>>
>>>>>>>      if (phys_pc == -1) {
>>>>>>>          /* Generate a one-shot TB with 1 insn in it */
>>>>>>> -        cflags = (cflags & ~CF_COUNT_MASK) | 1;
>>>>>>> +        cflags = (cflags & ~CF_COUNT_MASK) | CF_LAST_IO | 1;
>>>>>>>      }
>>>>>>>
>>>>>>>      max_insns = cflags & CF_COUNT_MASK;
>>>>>>> --8<---------------cut here---------------end--------------->8---
>>>>>>
>>>>>> Yes, this fixes the problem. Do we want to put this in for 6.0? My
>>>>>> feeling is that executing from non-RAM is pretty niche, so maybe
>>>>>> if we need an rc4 anyway, but this isn't important enough to cause an
>>>>>> rc4 itself.
>>>>>
>>>>> Isn't it the default for Aspeed machines (with U-Boot)? (Cc'ing Cédric).
>>>>
>>>> You need to set the 'execute-in-place' machine option to load/execute the
>>>> instructions from the AHB window of CE0. It's not on by default because
>>>> boot can be really slow with some recent u-boot which heavily trash the TBs.
>>>>
>>>> But this seems to work fine with -rc3.
>>>
>>> Triggering the bug requires both execute-in-place and -icount -- did
>>> you test with -icount enabled?
>>
>> It crashes.
> 
> 
> Without the above patch? I've re-posted as a proper patch here:
> 
>   Subject: [RFC PATCH] accel/tcg: avoid re-translating one-shot instructions
>   Date: Thu, 15 Apr 2021 17:24:53 +0100
>   Message-Id: <20210415162454.22056-1-alex.bennee@linaro.org>
> 


This patch does not fix the crash for the aspeed machines.

C.
