Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp5270145ejb;
        Wed, 21 Dec 2022 08:03:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtWudeS3ljKnEg/lwbFd01GVI9RPOMdLYqwuVf58rIPhUG24LSPU3Y3lh8dgayMNIVPPQnn
X-Received: by 2002:a5d:54d0:0:b0:242:1926:ea3d with SMTP id x16-20020a5d54d0000000b002421926ea3dmr1613266wrv.35.1671638636531;
        Wed, 21 Dec 2022 08:03:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671638636; cv=none;
        d=google.com; s=arc-20160816;
        b=OqzjC4ZZaQxxsVLTrXIFhpRzjRk1Iy/eQVtMhjwf2n3D7QhuVYXbSFmZx7yYC/QrlA
         4/FxIoSWijaMjcAHUJhhg9DHPaj9Rb5ler/VJd+HAMiyKLO2BWTEf95ipBOSn0EvsE9C
         UCA7ZB0tnc7NtfrWGhepF3ifFFi6kfceK1EOxIKAy5teQmGscYlUeIczG4rbsmIZvH6g
         /yjKLbDSbrn2ZIhJjj1Gk7nOTk6lG7KbYTpiFrQCq70PSLFju3/TyylExJMCqwaI0ttS
         2z9ZSXowCgybuIK7wbpswJyTzVSn8Kjdqg9ObrljKfFIlJOalw+hCvjNo7/s3nF7RCzo
         9aGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=SZzkwzjkvKf2MGwRruqkhXrqbuCo225z6fitd2d+/+M=;
        b=kMSMUFNhahGm/XSR7wX2klQ8mx9rf6LFODkPjRP21MFL2qJxBWAfS5XrA2PLn6isTx
         mzroP4SJEP9vj8zMCnErNwbmjYHIPEyzQyTJkX8eBvOm3V35csIr3LOoPYiAvu++q+oY
         fSzpZVWcoA214FB/uJYXSeSqlB/5UQX2JItxbOXYid6c5T6/lwXB0vXJfyk/IYuQ/O4x
         xSKsreG8oJPewitnptlIWt7CUAD4DP7FblpW4lLHWZY6Z7Ghna2ed7JYVmhfPd5jIASx
         ptra5cgOkzR85D1BNTVZa0fPpNEiQknXxQfpBxpEnGnovuJLeQYr8DE01FbtISxGFP9f
         A79g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 79.137.123.220 as permitted sender) smtp.mailfrom=clg@kaod.org
Return-Path: <clg@kaod.org>
Received: from smtpout2.mo529.mail-out.ovh.net (smtpout2.mo529.mail-out.ovh.net. [79.137.123.220])
        by mx.google.com with ESMTPS id a18-20020adfed12000000b00242508406bfsi8881244wro.1058.2022.12.21.08.03.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Dec 2022 08:03:56 -0800 (PST)
Received-SPF: pass (google.com: domain of clg@kaod.org designates 79.137.123.220 as permitted sender) client-ip=79.137.123.220;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 79.137.123.220 as permitted sender) smtp.mailfrom=clg@kaod.org
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.217])
	by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 00A7F14E0516D;
	Wed, 21 Dec 2022 17:03:54 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Wed, 21 Dec
 2022 17:03:54 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-97G00263c2dcef-50e1-4f61-99bd-b8a90ba0fce9,
                    78B451B26E434E63100236457A08FF51A4610C03) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7ababaf9-9c00-37e8-a2d0-565b8de57010@kaod.org>
Date: Wed, 21 Dec 2022 17:03:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH-for-8.0 2/3] hw/ppc/spapr: Replace tswap64(HPTE) by
 cpu_to_be64(HPTE)
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, David Gibson
	<david@gibson.dropbear.id.au>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
	<qemu-devel@nongnu.org>, BALATON Zoltan <balaton@eik.bme.hu>,
	=?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, Alistair Francis
	<alistair@alistair23.me>, Jason Wang <jasowang@redhat.com>, Greg Kurz
	<groug@kaod.org>, <qemu-arm@nongnu.org>, "Edgar E. Iglesias"
	<edgar.iglesias@gmail.com>, <qemu-ppc@nongnu.org>
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-3-philmd@linaro.org>
 <CAFEAcA96ncqvN9iXybCd2SrVKJ9CKsu5t3_GtdNt1ZEDAkFt0w@mail.gmail.com>
 <e8c3fdcb-81f1-7067-217c-c49e8748b84a@gmail.com>
 <CAFEAcA_jH3Zn1cFfnvsd_GhiBj1bNKscs7S7cwFa+FnTC9QC=g@mail.gmail.com>
 <Y6AFLpDEkpS+muSJ@yekko>
 <CAFEAcA9CUtdLXKPOqC0uRCyA0xQFZ_SrJ62SSDvPKESaxL3X2A@mail.gmail.com>
 <Y6JeXJn1qCkeIzuz@yekko>
 <CAFEAcA96faOvyo9cqpTZm+U1iMpRphnxvXfUuqStonzGGcMTLQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA96faOvyo9cqpTZm+U1iMpRphnxvXfUuqStonzGGcMTLQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 7b888b27-5647-4c99-90f3-b7d95290d9c2
X-Ovh-Tracer-Id: 3344485675587046331
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgeekgdekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuedutdetleegjefhieekgeffkefhleevgfefjeevffejieevgeefhefgtdfgiedtnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdgurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgsrghlrghtohhnsegvihhkrdgsmhgvrdhhuhdprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgpdgrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvgdpjhgrsh
 hofigrnhhgsehrvgguhhgrthdrtghomhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpvggughgrrhdrihhglhgvshhirghssehgmhgrihhlrdgtohhmpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdhgrhhouhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
X-TUID: 9zfG8ludsib0

On 12/21/22 13:33, Peter Maydell wrote:
> On Wed, 21 Dec 2022 at 01:35, David Gibson <david@gibson.dropbear.id.au> wrote:
>> On Mon, Dec 19, 2022 at 10:39:40AM +0000, Peter Maydell wrote:
>>> OK. I still think we should consistently change all the places that are
>>> accessing this data structure, though, not just half of them.
>>
>> Yes, that makes sense.  Although what exactly constitutes "this data
>> structure" is a bit complex here.  If we mean just the spapr specific
>> "external HPT", then there are only a few more references to it.  If
>> we mean all instances of a powerpc hashed page table, then there are a
>> bunch more in the cpu target code.
> 
> I had in mind "places where we write this specific array of bytes
> spapr->htab".


spapr_store_hpte() seems to be the most annoying part. It is used
by hcalls h_enter, h_remove, h_protect. Reworking the interface
to present pte0/pte1 as BE variables means reworking the whole
hw/ppc/spapr_softmmu.c file. That's feasible but not a small task
since the changes will root down in the target hash mmu code which
is shared by all platforms ... :/

spapr_hpte_set_c() are spapr_hpte_set_r() are of a different kind.

C.
