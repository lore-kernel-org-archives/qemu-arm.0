Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp3727112njc;
        Sun, 25 May 2025 08:18:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU6REvAheqO8MbYwYwQPbOHnvD4H9jP5fEoCxmSNaHuvCMufpbBJZfVxfTitAxtfcC5sp7Up5OlG4zyFQ==@linaro.org
X-Received: by 2002:a05:6000:2281:b0:3a3:6cf9:9b63 with SMTP id ffacd0b85a97d-3a4cb4635eemr5229033f8f.31.1748186300911;
        Sun, 25 May 2025 08:18:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748186300; cv=none;
        d=google.com; s=arc-20240605;
        b=CiluNvzBKhTAxB7oNTK6ZUQt1TRm+kVYGiVOmT3f8ayrA0xxR4cvCFN0jhr6Dszk1j
         mtAK0unoW2kllyKc94wF8onMDHG6a7eofJTPaBczBlXSIxfycXrR6qpr10TV7e28TJpb
         OikCLPzT2R1fevlxLx5hEc2R/4mRJg5Oa8QAFJIYwclY39kGaAjTJOTPgIUoD5oIrW2f
         /hiYe0oNVX6ytIbwG7AerI8QqXVFr6sx0Yuid2Q1AQof+wRgYncZPctD+R6M8GoRy1tp
         /K7kDQkkYbCbeAxuEHAbUVmJegxtaJ2EuBcG4a+HWhwwODghuJlL6LPCuaEugRDj9tzP
         QQNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Vr/pbhByActHs1ar2a+X+XNZlO98ZE1daapFhpfPLRo=;
        fh=TW5t0tKqlsAmCadc6SrAAmhN8EIs4eBJ+EReoZPskZs=;
        b=ElkZuz2uC4NDZ9ZG8tvLMHq8ll1YwsWPKOInh3JohxWfucSSkag2GU4AYCuxzaUUxM
         gAbMsm8bmPYuAHDlya7IEmPaBrhygcHB6C+jAFnmpiMRvfgWN4eSKg9dsAGg4zSxyOMx
         NkVf2EJkvCF8uDPC4PGgME0JWstW+R7FiCVJHPoPeysrYz4FNhfbDx5pG9eNee/UV+vk
         wQlTtYU0t65ZL9sa+/KDMBgraoeMugPGuuL1+qRGZ4tGG69jMMoUN3ymdWYsDlZ2Ruqh
         i0DHuiKZYY7krIQFKKrVe0iCnzLJ68yg7iCaxrVmG4+Hi5drLanWO/VT8gCJ1C1pymCt
         SWog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=omv7ygl2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a35ca89960sor8218966f8f.7.2025.05.25.08.18.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 25 May 2025 08:18:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=omv7ygl2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748186300; x=1748791100; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vr/pbhByActHs1ar2a+X+XNZlO98ZE1daapFhpfPLRo=;
        b=omv7ygl2yUyi6VpiQZKBepso1vL//iuIhDHwCZxu5vTp7LWmFSAYbbkE1N64aR2LiX
         XULfmZ1laQgQFmVD7wkCifLJ6h/9uW1WRz6EXN0xLArr14b+cW5OwJvVV3TATbf69Lhn
         k20SNoOdwfYMgPQ3Qj9AP27w28X9N+8AtBZZBB8Uj3U/htr/R7I7glZGS33iJ1llAhVw
         zVaKqD6sldQc6PYJWU7l/6fnbMZ7jU6y5cwxESVUqomxdEFaWX86gcfm2JI4MGdAkvZw
         ZRVSgMMfcFvZAm3LfLnk1OPSvzPsumnKdAg/bUPXFrCJzh5/A2V35IcaVvdu7s1teKlN
         CEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748186300; x=1748791100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vr/pbhByActHs1ar2a+X+XNZlO98ZE1daapFhpfPLRo=;
        b=H07GgxiouBkxG+x56ZnK9PNSEKBUxnKzFJW41ut97qMbsoRr2daenaKrpfAqAYensb
         yOG6OIVlbaHMQDbLZBqZBzjvspTxdb6bnDV9hFlY33B4yacErLOall4Y1EYIffvCC/Eu
         +ULBF1LRyazi3mh+hwJBajiLfvilT64tyCwv+x4pX1Rcm4uvq1TwcN3Rcx/HjBH8N+FA
         nAKySBWYeuzyR18PxBPP7g/93NUEoCVdaoSymzlKtFw2MrGW5R8xmKCKfbzGQFwiP15f
         uLnExGsckADTW2JC7AY7jqHqSrV8TEUwO61SEX+RRYu/i5CzJAn/4nkAQxW3juGEWzRt
         J+4g==
X-Forwarded-Encrypted: i=1; AJvYcCXnT4pObVdJPQKL8GCGIajA1fylXxmPQRE+cZ5cqJB8DnNxA7Gk2kuHMPqiRJWGaUELeBQky3m2SqQwAw==@linaro.org
X-Gm-Message-State: AOJu0YwAdqBQwBiniD+aKtu3FaoWXhpyb+wAuRsOAL2kbK1n0l5TwqXu
	5sTgXmfYqf1jlm/HY5tS964CmO/a58xf9O3JTRD8F+avLaMCgWXPLP7lyRWEgcSOWe6spQ==
X-Gm-Gg: ASbGncs+r4GrQlCYmGm1J0nEL6XK4iVseV1FRCce5/uGSGx9mdlLEBbwgrZAl0qEWM2
	+7EypJ4z8H9o4fB8z9QpO2vf5JPDICrLCtXBJKdwBIb44eZjn1mDT7If5bWuU0A6vOc0EOz8dbm
	dfvjngCfajHKi2Ip9fPlLimAiv2bvIgZTde4/K/JUWSz/HHaIi5e/uZvUvoj5u4K+FQvRW/IEFo
	uV3fpSuNQFqkMhyos1lLwRBUCFbsMGXXaCexlfVJYXo3n/ngU9hoXdQ9raksmb9QO/tO7DwJ409
	YlJPVtbFIiPOAW0AuLIh+TuNsTUPM0/g1qJxXWRUbBYZ3gert1Uedekmj40sE8T3uD9819S9wOQ
	/7FADoyxA+r8TjBOmQ+WifCAswEU=
X-Google-Smtp-Source: AGHT+IGyuAiJfDtlqmc+S2wZPDOgMF9AVZEuWH32nIsxuPwYIQU0kga/d/mPrOnThrsXgfVqaMl/hA==
X-Received: by 2002:a05:6000:2503:b0:3a4:d048:125c with SMTP id ffacd0b85a97d-3a4d04813ffmr3831852f8f.35.1748186300377;
        Sun, 25 May 2025 08:18:20 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.132.0.213] (17.red-95-127-33.staticip.rima-tde.net. [95.127.33.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4ccc2c88dsm5076314f8f.69.2025.05.25.08.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 May 2025 08:18:19 -0700 (PDT)
Message-ID: <41694d45-fac3-425c-bef9-7ea0ec1cb773@linaro.org>
Date: Sun, 25 May 2025 17:18:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/20] tests/qtest: fix igb test failure under
 --enable-ubsan
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Nabih Estefan <nabihestefan@google.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250521164250.135776-1-alex.bennee@linaro.org>
 <20250521164250.135776-5-alex.bennee@linaro.org>
 <acc76a26-d6b5-4ff4-a8d6-3595873157ea@daynix.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <acc76a26-d6b5-4ff4-a8d6-3595873157ea@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: x8nSszWi3NGk

On 22/5/25 06:19, Akihiko Odaki wrote:
> On 2025/05/22 1:42, Alex Bennée wrote:
>> From: Nabih Estefan <nabihestefan@google.com>
>>
>>    ../tests/qtest/libqos/igb.c:106:5: runtime error: load of 
>> misaligned address 0x562040be8e33 for type 'uint32_t', which requires 
>> 4 byte alignment
>>
>> Instead of straight casting the uint8_t array, we can use ldl_le_p and
>> lduw_l_p to assure the unaligned access working properly against
>> uint32_t and uint16_t.
> 
> I think the subject should mention the problem (the unaligned access) 
> instead of the method used to detect it (UBSan).

"tests/qtest: Avoid unaligned access in IGB test"

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
