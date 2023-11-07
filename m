Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp251502ejv;
        Tue, 7 Nov 2023 03:44:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFU1t9daTh4x/bWzOEwD54iLeandkMsn7mH1DX5zSZMRpTcaIqedlXeIYIMezAOl3iPn6K1
X-Received: by 2002:a2e:8847:0:b0:2bb:78ad:56cb with SMTP id z7-20020a2e8847000000b002bb78ad56cbmr24877922ljj.37.1699357488230;
        Tue, 07 Nov 2023 03:44:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699357488; cv=none;
        d=google.com; s=arc-20160816;
        b=ryUMCYtg5oE+0e0sZFLSvwxszYIXcrRFLjSq5gsYR9+gWFJGijxmw+MYgLiKBKLhJ7
         hxOE3UK+DaeiX5TWfnA5R2lzFb5kpvDitEFnyytbl4Rsn8u1w8aAOHA5gtOQr7pMsmbY
         ti2NBqHbOdGx2U855TNCpbZv5+v1caggCYkoagqxNChw+5qsgDwzYRDqbKFxaTs62dPv
         UvDobSYOVxrBwU0a0MKuuyoXocvAsW7uJMEJpLZxgOobElsS47O6qsjmAUmIH7AWKfDa
         G71/jToXb66+17x1NnA8YLl6nMHPUQgYZWZlKGs2lpNkIYxc2YaQQ5IqPFm7cnVCEETw
         kMuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=t/gfhSsIeRXnUkS8wxno0Ibfi+PSirwob2p7ClPraEY=;
        fh=6zRgobqNVuRl0B+ExdNpK7iru4mjCezrd/LgB4GYg+U=;
        b=lkLRUc/5ZEoMdz+rrTEYDcN6Qr4CTbuS4E/3IxSGp3m0nYmYTnFnt9NPKnKAbRz8/O
         TziU2+QIYZKL20zGjL3XqSCL2MIX+Ev3EddelrwL2TYiRJfybi4gUmqoAhLF7OmYlbf3
         xxgABumT4sqR1d1BInPifLLY68Is4mkEuIF3sgtNJVvDOSHiRFXmC+SsKHeNGATwKwin
         Hih3iBFTt51co450lR4XCJuAHr4JmbqN0rMXIKBMcVNc0Q569Jg+gr0RBbmKr2ZL6+0x
         qzWZAo+4t4DUjlHcNKvGBCV3zN1Tn84aaYPz81PykFHsyIt+rBoOp0jAz9P7Y+YXSV2c
         oPcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@univ-grenoble-alpes.fr header.s=2020 header.b=Mh3Fuw1E;
       spf=pass (google.com: domain of frederic.petrot@univ-grenoble-alpes.fr designates 152.77.200.56 as permitted sender) smtp.mailfrom=frederic.petrot@univ-grenoble-alpes.fr;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=univ-grenoble-alpes.fr
Return-Path: <frederic.petrot@univ-grenoble-alpes.fr>
Received: from zm-mta-out-3.u-ga.fr (zm-mta-out-3.u-ga.fr. [152.77.200.56])
        by mx.google.com with ESMTPS id p6-20020a05600c358600b0040653405aa7si10141980wmq.224.2023.11.07.03.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 03:44:48 -0800 (PST)
Received-SPF: pass (google.com: domain of frederic.petrot@univ-grenoble-alpes.fr designates 152.77.200.56 as permitted sender) client-ip=152.77.200.56;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@univ-grenoble-alpes.fr header.s=2020 header.b=Mh3Fuw1E;
       spf=pass (google.com: domain of frederic.petrot@univ-grenoble-alpes.fr designates 152.77.200.56 as permitted sender) smtp.mailfrom=frederic.petrot@univ-grenoble-alpes.fr;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=univ-grenoble-alpes.fr
Received: from mailhub.u-ga.fr (mailhub-1.u-ga.fr [129.88.178.98])
	by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id BC3A340211;
	Tue,  7 Nov 2023 12:44:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=univ-grenoble-alpes.fr; s=2020; t=1699357487;
	bh=x7EhVDmRcBFlb6BGd2UVVKCSGGpZ8mKqHBLxeLz46/w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Mh3Fuw1E8vPkdyTCJdhlIDrkubClTp+2k9L9IdoAyRMgPImTJJyaDa34AKTXW7kCD
	 bPvSrxh1qoDmzhkfZcYEFKgGSXQvbxUlm7DyOo88O5jgb+Zq15wDnkoKPjiERwZ5yF
	 D017Ke/madH/1QLt0AZtxzXyovBxDPx0bUWnqEgsfMRAIRxOxK7gcIY35/u9ICnB4k
	 0uiMGlstgcxxm/hieWyqBdEYdrvAn/FsNF5dBlfvo16EgXxUER2+JeGfCY/TiIJG5x
	 oLgHFQX5CxXM62Cve0Y/Q9bEW7LhEykTjkk/+bP4OcpK5MuTVvyAEV8Af01RpXsDex
	 SR9/dOSHPrAzA==
Received: from smtps.univ-grenoble-alpes.fr (smtps3.u-ga.fr [195.83.24.62])
	by mailhub.u-ga.fr (Postfix) with ESMTP id B628D10005A;
	Tue,  7 Nov 2023 12:44:47 +0100 (CET)
Received: from [130.190.92.56] (eduroam-092056.grenet.fr [130.190.92.56])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: petrotf@univ-grenoble-alpes.fr)
	by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id F1AEE40053;
	Tue,  7 Nov 2023 12:44:43 +0100 (CET)
Message-ID: <75ab4daa-0c1d-4b80-9399-31f1c78ea219@univ-grenoble-alpes.fr>
Date: Tue, 7 Nov 2023 12:46:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/29] gdbstub: Simplify XML lookup
Content-Language: fr
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, Brian Cain <bcain@quicinc.com>,
 qemu-ppc@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-s390x@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
 <20231103195956.1998255-18-alex.bennee@linaro.org>
 <4659ec99-9b86-4c91-8ee8-116bff8b48c4@univ-grenoble-alpes.fr>
 <8734xh7t3i.fsf@draig.linaro.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Autocrypt: addr=frederic.petrot@univ-grenoble-alpes.fr; keydata=
 xsDiBEzGfDQRBACnR+QhOOA6gstLMoL8vexXgQ/shw+w6zEsACrydiwCrAXMOQfyozlXyGYf
 XBO0cf4RKMh51NLdgntJbYlOoFalY7iGRwo8U64iy8kHBcXlfdFYGrYFbFYervlMwXoY89D6
 02uMzWK/UossWWWX2PkqfBenmYd0zk+JwghTwY8MVwCgtr1Z52ZRv8vPA7ZLn4WSJLC/qv0D
 /1hBIaSsCAT/nO78oFZq9hzY51GsmiBT88hTofCma2PIotJT9qocJglgqzA9B+2ja4bgXJ1f
 0WFlvxyLTjga8jJ/lcdNpAGi13sFEhP6nyi2Zh2hFhrXlTPH+VtdnjTHSnzK23eLphZJv031
 SxCqEYT6pgJPwwHIWOHyeDZq0ORdA/4+2U4eYUhCGfi9u60L3zRDzUVULScq3vXah1ak1yBs
 Nxz/F1iMYVBUmp4SGSM6XFxVwvJxvSRPD+4zXIkr7+MfIheiXbiSzNoZdH3AwaAK6jGxhfWb
 f8Jm8KuLvGkR2QaS7QT+rhhv0OLEhVBMmm8EXZpsrOV3ZVmE934+WoRDd807RnLDqWTDqXJp
 YyBQw6l0cm90IDxmcmVkZXJpYy5wZXRyb3RAdW5pdi1ncmVub2JsZS1hbHBlcy5mcj7CeAQT
 EQIAOBYhBGyr6EloIPZXrmtYU0QWC1i+uhtgBQJa/b5sAhsDBQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEEQWC1i+uhtgNooAnjAwrIMPDJ+mQr1svgh9+NFFZBUWAJwONXxE5DrxP9OV
 R0tsDROd3EbvXs7BTQRMxnw0EAgA8XI4FU6LH2NryyrydYoopZfixTvfS3rra8Q3UN+eHvuG
 jM4+oebZO+ZZ6KtdGj/RDpXtn0KW6SdFynKuLS5obLx8GGfq1tj5KGep14kr1/BRp3xTqKE+
 rleeWvR1fGXryJhxIV/AQ/tY2Le1ExsgLbD5dbPQKJhpQUlScz6Y1U2UsyxnMV4c7PlCNNb9
 1ZWfxPN8c/w8XBSZDaE5UcBmxYxH9959yte9hsczuzqbMgiGa0DCN+iIgsQOYtD2csDxVQUL
 vxtD530vdTB32tdlmcumIgZCH4X7RyLhdbv1Xj6gcZ9InGf2tRLHbnd0/uPY6qTX/5teXQ7g
 0xzVlvcWQwADBggAvXpFpXACegDPqglkroyA8+LQWNyumsFtcrlAc9mcC5WwDBqNsSeCbGcx
 TXsUckRAC3DpJkzKLbBsFki4fcYEx3tjfJGkknxInPYmOIlKRinSnIMS0qFqXdy37w7vPhqv
 KMLwbeHYronnGUAW0Z//ZXZZTl1KbEeKOEXK2dyE0aLUtoWj/aLwM1c2zuJCctI38GENtRC6
 qaqFzCHKTqxjl7aL1LILSvKQ1sZGKdKjApw5KLoKnk6WbspFIfgIirXoC2gRo/lhhd1ctVZK
 IptiyHp7dw2Rr6TEzjy+Z/rDHVf9lGCzUkMDJHm5XQB8+f/Va5kddgZ9gznRo17IPvR0jcJJ
 BBgRAgAJBQJMxnw0AhsMAAoJEEQWC1i+uhtgg90An139WxG/GTGPRFVQCaxQRkycFiI3AJ40
 aR3/xWYMOEUWfcXpCS8dzPbdDA==
In-Reply-To: <8734xh7t3i.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr) via submission-587 ACL (41)
X-TUID: b0j21g49g2Ls

Le 07/11/2023 à 11:31, Alex Bennée a écrit :
> Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr> writes:
> 
>> Hello Alex and Akihiko,
>>
>> this patch introduces a regression for riscv.
>> When connecting to gdb, gdb issues the infamous "Architecture rejected
>> target-supplied description" warning.
> 
> I tracked it down to 13/29 when bisecting which I dropped from:
> 
>    Message-Id: <20231106185112.2755262-1-alex.bennee@linaro.org>
>    Date: Mon,  6 Nov 2023 18:50:50 +0000
>    Subject: [PATCH 00/22] Maintainer updates for 8.2 (gdbstub, tests, plugins) pre-PR
>    From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
> 
> So if you can check that series doesn't regress RiscV (it passes the
> tests) then we can at least get some of the stuff merged during freeze.

   I do confirm that this fixes the issue with gdb, thanks !
-- 
+---------------------------------------------------------------------------+
| Frédéric Pétrot,                            Pr. Grenoble INP-Ensimag/TIMA |
| Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angusta |
| http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.fr |
+---------------------------------------------------------------------------+
