Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4392526ejb;
        Tue, 13 Dec 2022 08:53:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4XenvR9d3KodGpPR5ZOGMUa2rCPL6r95adBHA/Fnm9dUBMVwzo6jWDAgGHW4/2O7Nz8Tx0
X-Received: by 2002:a05:600c:348e:b0:3d2:2a72:2577 with SMTP id a14-20020a05600c348e00b003d22a722577mr5177802wmq.27.1670950436878;
        Tue, 13 Dec 2022 08:53:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670950436; cv=none;
        d=google.com; s=arc-20160816;
        b=bapp9Elbzgco14bbRp6utsrrz7+4lRmImUOGnoO1Ek++CBOK2wBFr+yzVxxqunt/4n
         jMgnfOIsBFAnAZ9kvbU+jFkuFMya5e66bR6RoVIKb3RAyO1xL3yg5u8exH6HUaujxv5g
         C8pnNy5EFrSQBUeQZR9561b/O8JLq7I+x49Y4f8tq11Ncsq74wticeVjUB5OxloJvWDx
         +gaTVxfaWDF2RlNsJepwY9ZWwP2qFkzQfKy5yHKPiN+0VvbQ04qvZCO/XMG07csWyWg4
         Zb3Qy/i7iSJjiDxgPc1XsUMzTVVfBwUI6vPor6Hj0nNxNmuygx+uH6RNO+jjfmIgnEdm
         eiSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=nTMa8v+80yjEhsvuC59i8zGLUMVEV86Kkl66yrEDAGI=;
        b=n6wqHghAa2jS/sYllzKbnwVZG3ZcHjgiAUUXrQqII6GaN7AuOchOYw4zyEPV9So546
         yYVWgOnGLsorsRt6P63xtsbTxFOpZOsMKq7MKcm1Ui+4GS/2h5/hy3fz/HLgi1+d1xMT
         UqdpAPfOw45WfpVcCyMUm6TG1hqKDQ4A1UdBD/Hv8dSwaTmlLIQa3HmkGcHuj5XDOd5e
         qR4tRqJUhyFOo/c4jdbxYo+OtZ+YnLNEK+T/wfqD7MBaGkwMYIFap5O+B3HsIh1pFT3x
         blttPoWyEP/MiT04gHB6Ui44G+5ZyThNrc3UuFTSq43G6ln3JqFOhWRWHNwB3sc/nW/4
         e8BA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 87.98.180.222 as permitted sender) smtp.mailfrom=clg@kaod.org
Return-Path: <clg@kaod.org>
Received: from 9.mo552.mail-out.ovh.net (9.mo552.mail-out.ovh.net. [87.98.180.222])
        by mx.google.com with ESMTPS id o8-20020a05600c510800b003cf77477634si1812110wms.112.2022.12.13.08.53.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 08:53:56 -0800 (PST)
Received-SPF: pass (google.com: domain of clg@kaod.org designates 87.98.180.222 as permitted sender) client-ip=87.98.180.222;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 87.98.180.222 as permitted sender) smtp.mailfrom=clg@kaod.org
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.19])
	by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 1056726A57;
	Tue, 13 Dec 2022 16:53:55 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 13 Dec
 2022 17:53:54 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-103G00523356e20-8a11-4916-b4c2-f93a06f4e123,
                    70F1EFD4CFA2BAC2768C5AFE190B601EEBA8C420) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <10186d7a-2df0-2fcf-8eef-8e34bcc2d8cc@kaod.org>
Date: Tue, 13 Dec 2022 17:53:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH-for-8.0 1/3] hw/ppc: Replace tswap32() by const_le32()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, Peter Maydell
	<peter.maydell@linaro.org>
CC: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
	<qemu-devel@nongnu.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
	BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
	<alex.bennee@linaro.org>, Alistair Francis <alistair@alistair23.me>, David
 Gibson <david@gibson.dropbear.id.au>, Jason Wang <jasowang@redhat.com>, Greg
 Kurz <groug@kaod.org>, <qemu-arm@nongnu.org>, "Edgar E. Iglesias"
	<edgar.iglesias@gmail.com>, <qemu-ppc@nongnu.org>
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-2-philmd@linaro.org>
 <8d47b826-2011-3203-c682-aa32a76b8dc2@linaro.org>
 <d73fe725-565e-7fcb-e7d3-846189459545@linaro.org>
 <a1f4b5a6-0a8a-5a04-8ab6-f3f08b9d36aa@linaro.org>
 <CAFEAcA_F3Z+UPW-wHs8xedYX3TiV8CRQAom0DhefKLFH_Ejgog@mail.gmail.com>
 <b46e4c40-257f-8a89-85b8-8c2806f395be@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <b46e4c40-257f-8a89-85b8-8c2806f395be@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 8f7c01ff-bff5-40a3-9427-ab6b74539159
X-Ovh-Tracer-Id: 12547591513020074814
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfedugddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdgsrghlrghtohhnsegvihhkrdgsmhgvrdhhuhdprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgpdgrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvgdpug
 grvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruhdpjhgrshhofigrnhhgsehrvgguhhgrthdrtghomhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpvggughgrrhdrihhglhgvshhirghssehgmhgrihhlrdgtohhmpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdhgrhhouhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
X-TUID: 6+UDVxRT5zSE

On 12/13/22 17:27, Richard Henderson wrote:
> On 12/13/22 10:21, Peter Maydell wrote:
>> On Tue, 13 Dec 2022 at 16:14, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>>
>>> On 12/13/22 10:10, Philippe Mathieu-Daudé wrote:
>>>> On 13/12/22 17:00, Richard Henderson wrote:
>>>>> On 12/13/22 06:52, Philippe Mathieu-Daudé wrote:
>>>>>> Assuming the developers of commits 2c50e26efd ("powerpc: Add
>>>>>> a virtex5 ml507 refdesign board") and 4b387f9ee1 ("ppc: Add
>>>>>> aCube Sam460ex board") were testing on a little-endian setup,
>>>>>> they meant to use const_le32() instead of tswap32() here,
>>>>>> since tswap32() depends on the host endianness.
>>>>>
>>>>> tswap depends on target endianness.
>>>>
>>>> Yes, it depends on both host/target endianness. What I meant
>>>> is we shouldn't have system code depending on host endianness.
>>>
>>> It compares host vs target endianness, to determine if a swap is needed.  But the real
>>> dependency is target endianness.
>>
>> It does seem odd, though. We have a value in host endianness
>> (the EPAPR_MAGIC constant, which is host-endian by virtue of
>> being a C constant). But we're storing it to env->gpr[], which
>> is to say the CPUPPCState general purpose register array. Isn't
>> that array *also* kept in host endianness order?
> 
> Yes indeed.
> 
>> If so, then the right thing here is "don't swap at all",
> 
> So it would seem...
> 
>> i.e. just "env->gpr[6] = EPAPR_MAGIC;". But that would imply
>> that the current code is setting the wrong value for the GPR
>> on little-endian hosts, which seems a bit unlikely...
> 
> ... unless this board has only been tested on matching hosts.

But these are register default values. Endianness doesn't apply
there. Doesn't it ?

C.
