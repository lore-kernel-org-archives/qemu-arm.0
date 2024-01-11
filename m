Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1726290ejs;
        Thu, 11 Jan 2024 06:10:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdZl/QCLNS16BYtPTAqK5L/E3SUnuH2WYVH/YXPUjXcgS4P9p5WYI8w+GRo2IXkWQYteeE
X-Received: by 2002:a05:600c:5013:b0:40e:438e:ef03 with SMTP id n19-20020a05600c501300b0040e438eef03mr439589wmr.152.1704982255947;
        Thu, 11 Jan 2024 06:10:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704982255; cv=none;
        d=google.com; s=arc-20160816;
        b=kZXV9+bqYN7gpoO0jKI4o9Np79G6rFZrw0WjiraXqtdYrjcvZTI+dk6qo0+/XP98wy
         +G/GAJhI+vZOfF/0ZpWtdhLFOoyVQOXbO2urM3JN90YEtG/s6D4tV/NhwPoylOu6muYz
         gYpvr8PZL/tBmdku4Xy/LoaS4AHeb5DkEvl9zTJ3yq7prNfjoWbxiYZpz9u4jA/S0+eh
         pD9bJDJmgNXczBDHl5ZZC27FRB/rEp32Ws8KPkXZmk4TkztmG8hKRV0lCIPee/43UF5L
         AM7YGdlBs/2LPR0sr62ftKORNrUIK1BJms/IG625skmxdBhZEt05fbwWYP3tI6adw+Q6
         67/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=H1b9SXLa97ceEys7f9letDS3GffyVq701k5DahPU7PI=;
        fh=e6yeCIrth9ZFFsPXRGruFXgyGS3Jyb9fcw9w7sczv+o=;
        b=TWW6A1YdrwfUHMOWFZPl5ER4CudTGmzl/APYNcGh7i674v+xpiVtoCy95PmDf8QwEE
         d4wFtIfubyEGvNi7xcuXPQY031xOpDy78UVoJB8ElOLIGC5cjDBkkN6masLVZuoY7Caa
         cWOiiSG3OahI86GvS4bC7JOe3MVZm4XJb+yDxn9oaoZRFEsoMTPynZBtwCOMCff39hhj
         wIQu6JcHKMA9o+KmLQXOb8ENqyaxJdE0sWktaWlKkolIvAIDZ62b6B9wZAO3olztIwAe
         5/B01E0tJ238Fy9W+/G+VknXCKnKfyiOchwhxgutgt3PNn8teLgmkavzfgnjH13NB/bX
         j2qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@univ-grenoble-alpes.fr header.s=2020 header.b=uRM70xEN;
       spf=pass (google.com: domain of frederic.petrot@univ-grenoble-alpes.fr designates 152.77.200.56 as permitted sender) smtp.mailfrom=frederic.petrot@univ-grenoble-alpes.fr;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=univ-grenoble-alpes.fr
Return-Path: <frederic.petrot@univ-grenoble-alpes.fr>
Received: from zm-mta-out-3.u-ga.fr (zm-mta-out-3.u-ga.fr. [152.77.200.56])
        by mx.google.com with ESMTPS id k17-20020a5d6d51000000b00336c43dab84si601450wri.436.2024.01.11.06.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 06:10:55 -0800 (PST)
Received-SPF: pass (google.com: domain of frederic.petrot@univ-grenoble-alpes.fr designates 152.77.200.56 as permitted sender) client-ip=152.77.200.56;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@univ-grenoble-alpes.fr header.s=2020 header.b=uRM70xEN;
       spf=pass (google.com: domain of frederic.petrot@univ-grenoble-alpes.fr designates 152.77.200.56 as permitted sender) smtp.mailfrom=frederic.petrot@univ-grenoble-alpes.fr;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=univ-grenoble-alpes.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=univ-grenoble-alpes.fr; s=2020; t=1704982255;
	bh=x0/ipQPWqSHacSiRBq9fO1VBshIH0+O/MI6pZ6mLI0U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uRM70xENMgTV/yQ6eEl0w02FpOXIAaARMzT/4Z7spRO1DIUK5Onv6y+l3KYEVkkNj
	 SZxRY6idytA5McYZCEOFrEj7L6toItAQwTLSarCMbQ4IQdqgBLogdo927jl6O9rRNT
	 qvecxcD37DDI+Gx/PQUcA7qCslTcr/bnEablYL58JTZKjNsvhukZ0w6SijGRsvUy/V
	 KuRVu6FDmWW4oOgj/WxqlhCpWkfMxj4xGFMj89VyJoMJxG0F4jLZCA3M0e/89nik1T
	 2xHJ2ZqRLP+6XgvNMf8At6oFhmXryXjzewcUAiIYyAqaHU8vPf2GuwSIx9Mf+JX/qd
	 5qyCNxNqEEUtg==
Received: from mailhub.u-ga.fr (mailhub-1.u-ga.fr [129.88.178.98])
	by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id EB31C4021B;
	Thu, 11 Jan 2024 15:10:54 +0100 (CET)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
	by mailhub.u-ga.fr (Postfix) with ESMTP id C814E10005A;
	Thu, 11 Jan 2024 15:10:54 +0100 (CET)
Received: from [192.168.1.62] (35.201.90.79.rev.sfr.net [79.90.201.35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: petrotf@univ-grenoble-alpes.fr)
	by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id D95DB140052;
	Thu, 11 Jan 2024 15:10:50 +0100 (CET)
Message-ID: <e61e8c50-e09c-4d2b-9d24-467018b62e55@univ-grenoble-alpes.fr>
Date: Thu, 11 Jan 2024 15:10:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 40/43] contrib/plugins: extend execlog to track
 register changes
Content-Language: fr, en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, David Woodhouse <dwmw2@infradead.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-41-alex.bennee@linaro.org>
 <9f9b8359-d33b-4c94-8eb1-fc500d8fc2b4@univ-grenoble-alpes.fr>
 <87o7dsf46x.fsf@draig.linaro.org>
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
In-Reply-To: <87o7dsf46x.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr) via submission-587 ACL (42)
X-TUID: +bYhqbp+Ns6Z

Le 11/01/2024 à 13:24, Alex Bennée a écrit :
> Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr> writes:
> 
>> Hello Alex,
>>
>>    just reporting below what might be a riscv only oddity (also applies to
>>    patch 41 but easier to report here).
>>
>> Le 03/01/2024 à 18:33, Alex Bennée a écrit :
>>> With the new plugin register API we can now track changes to register
>>> values. Currently the implementation is fairly dumb which will slow
>>> down if a large number of register values are being tracked. This
>>> could be improved by only instrumenting instructions which mention
>>> registers we are interested in tracking.
>>> Example usage:
>>>     ./qemu-aarch64 -D plugin.log -d plugin \
>>>        -cpu max,sve256=on \
>>>        -plugin contrib/plugins/libexeclog.so,reg=sp,reg=z\* \
>>>        ./tests/tcg/aarch64-linux-user/sha512-sve
>>> will display in the execlog any changes to the stack pointer (sp)
>>> and
>>> the SVE Z registers.
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
>>> Based-On: <20231025093128.33116-19-akihiko.odaki@daynix.com>
>>
>>> +static registers_init(int vcpu_index)
>>> +{
>>> +    GPtrArray *registers = g_ptr_array_new();
>>> +    g_autoptr(GArray) reg_list = qemu_plugin_get_registers(vcpu_index);
>>> +
>>> +    if (reg_list && reg_list->len) {
>>> +        /*
>>> +         * Go through each register in the complete list and
>>> +         * see if we want to track it.
>>> +         */
>>> +        for (int r = 0; r < reg_list->len; r++) {
>>> +            qemu_plugin_reg_descriptor *rd = &g_array_index(
>>> +                reg_list, qemu_plugin_reg_descriptor, r);
>>
>> riscv csrs are not continously numbered and the dynamically generated gdb xml
>> seems to follow that scheme.
>> So the calls to Glib string functions output quite a few assertion
>> warnings because for the non existing csrs rd->name is NULL (and there
>> are a bit less than 4000 such cases for rv64g).
>> Checking for NULL and then continue is a simple way to solve the issue, but
>> I am not sure this is the proper way to proceed, as it might stand in the
>> generation of the riscv xml description for gdb.
> 
> I think in this case it might be easier to not expose it to the plugin
> user at all. Is the lack of names an omission? How does gdb see them?

   Well, info all-registers in gdb dumps only the subset of cs registers
   that are defined for the current parameters of the gdbarch.
   Interestingly enough, riscv_print_registers_info, the function that dumps
   register values for riscv in gdb, contains the following comment :
   1385           /* Registers with no name are not valid on this ISA.  */
   and then a check on the "nullness" of the register name to avoid outputting
   something.
   I guess we could follow the same path in QEMU, as having access to the csrs
   in the plugins is really very useful.

   Thanks,
   Frédéric
