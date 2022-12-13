Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4393984ejb;
        Tue, 13 Dec 2022 08:56:10 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5X+WqJc+N5Goid/fUnP+ZvHcuFlF73ZbuIi6Kmh788kmEKMpDThTomfs24bfnF203be2fT
X-Received: by 2002:adf:f743:0:b0:242:659c:dc7 with SMTP id z3-20020adff743000000b00242659c0dc7mr14491392wrp.61.1670950570842;
        Tue, 13 Dec 2022 08:56:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670950570; cv=none;
        d=google.com; s=arc-20160816;
        b=LbSQJiuNxSyoq68Vv1UgVDXvxcZaNjECM3ev1GP4iaVJj92aSTm/o8KvqDjJI1H/iQ
         NOfrTc6dVpuQ0ADkh32/N40T8RC7rKIvAKuGJsyLrzz/h9QNa/h1iPsrR3ryg+lCHc6p
         bT+9Yd3pwqUgWI3QonSRS4S12H4Glj+xPD+egvxvxiSWdXoHWFqtNybHexLjr9hNC51o
         y5fREYdwgK5ZS6s4d0w/VyDXkea3yrxafQdb/DlKPDTF+BnEh/Q4HdCwpNCI6p4HjxCI
         Rh+10AgCEVHiCdAAJXAsLZXyres73y6ApkJX6lsAVtU0W97iSwpHZKB8/XjrpjPVNPzl
         EX6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=KcBcOAnRSdh9g4Xb4ZXbSr7yb6WaL/7cEmhzpVkGRWU=;
        b=aagqfuVww7H79+SSCWR2VMRuIWyKSjmJgc8vl5Di9+IhGjIjvi8Gd6GwHC2M5Lmlv0
         14HkrN33J+i0XNJBJnOTkLKdgY9nfUV5qrRdlpxpbZ2OcMNE2zX7+eZzlLODoSv+tdRX
         F63V3GgG9v5Qg+o79qXhz7ZRzXjYByuDZGfgz/q0QgIZIXQyLOAvO2egbDz8w76aQyyc
         ElI+vUw0vFZW+Nq3ronmhiR5dzLnY3B1KHskdShae9dfOC4CtvNB0yrQrnyfOrBlgYmM
         /NUS8hQvM9ys2XJxnN/Eubk/Pzz7eJT7IF4v4Z242UnKo2YMcup+cezVECPOOQgKQ/e2
         QoXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 79.137.123.220 as permitted sender) smtp.mailfrom=clg@kaod.org
Return-Path: <clg@kaod.org>
Received: from smtpout2.mo529.mail-out.ovh.net (smtpout2.mo529.mail-out.ovh.net. [79.137.123.220])
        by mx.google.com with ESMTPS id o7-20020a5d4747000000b00236702d8c49si127266wrs.818.2022.12.13.08.56.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Dec 2022 08:56:10 -0800 (PST)
Received-SPF: pass (google.com: domain of clg@kaod.org designates 79.137.123.220 as permitted sender) client-ip=79.137.123.220;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 79.137.123.220 as permitted sender) smtp.mailfrom=clg@kaod.org
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.192])
	by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 9D9C914B6B03E;
	Tue, 13 Dec 2022 17:56:09 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 13 Dec
 2022 17:56:08 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-104R005986bb520-a460-41c4-a360-4cc4dea0102a,
                    70F1EFD4CFA2BAC2768C5AFE190B601EEBA8C420) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ccc834cd-0cf7-5a19-58a3-c933e2923834@kaod.org>
Date: Tue, 13 Dec 2022 17:56:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH-for-8.0 0/3] hw/ppc: Remove tswap() calls
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
	<qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, BALATON Zoltan
	<balaton@eik.bme.hu>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair@alistair23.me>, David Gibson
	<david@gibson.dropbear.id.au>, Jason Wang <jasowang@redhat.com>, Greg Kurz
	<groug@kaod.org>, <qemu-arm@nongnu.org>, "Edgar E. Iglesias"
	<edgar.iglesias@gmail.com>, <qemu-ppc@nongnu.org>
References: <20221213125218.39868-1-philmd@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221213125218.39868-1-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 82a7e182-b913-4738-a25b-43c9adfb0cfc
X-Ovh-Tracer-Id: 12585590633924758459
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfedugddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfefgkeetkeegleehueejgefhteekteelieduueffkeetgfekheeuffehveevkeejnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhhihhlmhgusehlihhnrghrohdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdgsrghlrghtohhnsegvihhkrdgsmhgvrdhhuhdprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgpdgrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvgdpuggrvhhiugesghhisghsoh
 hnrdgurhhophgsvggrrhdrihgurdgruhdpjhgrshhofigrnhhgsehrvgguhhgrthdrtghomhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpvggughgrrhdrihhglhgvshhirghssehgmhgrihhlrdgtohhmpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdhgrhhouhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
X-TUID: Dr32Vz8rWzPb

On 12/13/22 13:52, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> I am trying to remove the tswap() API from system
> emulation and replace it by more meaningful calls,
> because tswap depends on the host endianness, and
> this detail should be irrelevant from the system
> emulation PoV.
> 
> In this RFC series I'm trying to convert the PPC
> calls.

Here are some simple images for tests:

   https://github.com/legoater/qemu-ppc-boot/tree/main/buildroot

Cheers,

C.


> 
> Any help in understanding what was the original
> author intention is welcomed :)
> 
> Thanks,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (3):
>    hw/ppc: Replace tswap32() by const_le32()
>    hw/ppc/spapr: Replace tswap64(HPTE) by cpu_to_be64(HPTE)
>    hw/net/xilinx_ethlite: Replace tswap32() by be32_to_cpu()
> 
>   hw/net/xilinx_ethlite.c | 10 +++++-----
>   hw/ppc/sam460ex.c       |  3 ++-
>   hw/ppc/spapr.c          |  9 +++++----
>   hw/ppc/virtex_ml507.c   |  3 ++-
>   4 files changed, 14 insertions(+), 11 deletions(-)
> 
