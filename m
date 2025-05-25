Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp3727711njc;
        Sun, 25 May 2025 08:19:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVMWELIXQejy0jNLk4P8scVoz/RP23djGO3aYOuUQ8Cl8B5N2pY/dNpZ52Eh6pcxbMMMTlZBCesDzgsVg==@linaro.org
X-Received: by 2002:a05:600c:35d3:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-44c92f21eafmr48245065e9.25.1748186397739;
        Sun, 25 May 2025 08:19:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748186397; cv=none;
        d=google.com; s=arc-20240605;
        b=iN9iMq3zTXj1k0Avq0YFZ04Tbf6SZoMQLPBzq5firMObqc23+phiHATZV/tuk+xtf7
         LtIQUSTfM2m1mtTnAmGGtpFV51mFGQdrVmXYgxap6HSEe2V31TGRbPkbtVgWnQqqnP6C
         QwPk/r98s4MnsRvmZgYYvQ9s3hUVa13bf0UVLW6RE/2jSQs74wKn4Mtb9CLgQlCoCNQu
         A/eiPbelBTqqNHXBDd63MYwFa3ECJbPHhHG/YkR3FQUqx1vlWuIaRkyp8+KkoFc0nMDF
         38+LNicR3Y+DyXe4wsYFrBbL0PA1jKNdnO6Wqxqikcb8aRnRVNhLIZuGHb86AJpbB1yq
         UvWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=sUcRthyO7NQK7sZA75EGL4Oasjz/aYc7VVal8xGYmY0=;
        fh=H1oJNPQFA4f/DM9vMBmknFaPbYSxEoqbHG1Ip2sdtTA=;
        b=ZcwlwQuX8Q10bb5NQp58Mh02Bt/b/Y+R/1KUhuQ92ODG9Ac3S9fQbTd69DNA2RcsLo
         do3pRVGzVntSOhvp+FEZaJ8nZ5BM3VH5vwcC5IBtue3eJwH5aqK+Jrvm90ajjJkJ2lpP
         q2WzB07d7XDd5OeJ3GzRGcRLLxYrnmRqpMbog4clQUpdwxHzJv9t6iajqxjYZlhdoYrm
         wSkIlT3aQnbxm8Am1BTaSotdWbKn9XC08A3hTbo2uccH6JQkthSk3skWOQWZiEkpiejx
         +7ptH/F0XV288Vp3gATfQDYlDzLjcFBR7Eo3fG4U9zeJtUkuP/QiPBUViYERHON6wDr4
         f/Sg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n9CHAhrY;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-44a930fdfe8sor18442025e9.1.2025.05.25.08.19.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 25 May 2025 08:19:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n9CHAhrY;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748186397; x=1748791197; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sUcRthyO7NQK7sZA75EGL4Oasjz/aYc7VVal8xGYmY0=;
        b=n9CHAhrYzGx8C83T7ciT4dvBRILr+0TYAdF2OcjYUA5eFLI0ceDSVKtg+F70O1OyaR
         7Qr1iWoyaO7/U5rgn9XnAOU3N7cIbA03S1jr3UpiF6aJoKpLD5S5qkG4q3NxfvpVpKj4
         N9sg+HJcVT+2vQBc/q63rFIa2wNpBIffBNLzNHVfKPGzbgVAGe7pCNWkLoeGaOpYzPde
         yIm8S/Y8Zep6tFq3+02MVPQTiRLRk2OyQtbr5O0FhrlQQb8XpfrIy5GctO5qujs0CCYv
         ljNFWfovrtv/FSd/vInVnCHNuXsCjVPuPzj4IYN4ce2gXCgiCWW76z0lxZFqXpJV6eNF
         td+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748186397; x=1748791197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sUcRthyO7NQK7sZA75EGL4Oasjz/aYc7VVal8xGYmY0=;
        b=cvEo8c8zhgLpE2MhAcRPuw9dExbxtK+g7SWpW20//y3XDqIGe7p1oWOcjnUtBtTDLG
         fJuzBeaTtUyfjzuNAP23kHnHmu0f0rwLcqtDg+++OoNu3P3thQ83tsEnNgxN8EIvlh0u
         8MECnn/aKoyXrEOMDNZmSXnh4FUh925Lg2V2XyqAiIgNPii62w/l2FIWFOjmqDTcFPcv
         HdxOjmaXyYDiByKKQGXo26y4Xp/6y+37fXVwgynmAn/AW/uXPs4KJ2HYZUgONc5bRP3h
         ZSwwOrCEd4dE0bYoNtSyRFDMcss/RXGVJ/oGXuYcdF76IdTdXk/Fcrgr1fA8BOtVeDZl
         jutg==
X-Forwarded-Encrypted: i=1; AJvYcCUEFAyyWrgSuYw2Wv8zpiFsap7G9X66RAon194UBucZc8K0cYHOEq6iZzoe4bYHm1hRr4NfhdyIe1V0sw==@linaro.org
X-Gm-Message-State: AOJu0YxUcPexQt4Oi4ir/omAwch0rgLgrfTVZleWCTg7RU6tSj9IiEug
	scBHnMMA8RQ5sD8ETAQSdV8nzUQmNFh4TCnlgNt5zvSZFLeiV9oCu1fiF3gq94RhQGozOrUt9MF
	SfajhynU=
X-Gm-Gg: ASbGncsnM4V5j+6oftWv7g5yEhczW6i5U1BXX+miTnmEocSOgTMMX2LtYZvFmJf/UZP
	pVFqYUcKvaoXfOTMoeAPXBBFEQ0bGhUk9qREn+Vh7U2NYF7PFevwX9cqwrTBPsWcmx7a8lufWMi
	Nox0XP4HwYqnMg7o4fG2jrK5tFz9jB8EBYqb1kd7qCGtGSRzdF4uEvzStHxgvsbymG2/p1O8peP
	iCxa9LqqoA5sDCLXhwanm2cFYxMxRgmJVcb+4Xhlroi6KHIM2WVsUHXlsigRux5o/STcQWknUUY
	p66KkiYrQANOJtdfukiuJPLhsW/6GwxeqY8XLL1S4mgFeWarWDjdJTG02fBV1/tJnjXY0/DTxcx
	zsx4Lavt/e5faDqdxXyiofHDtyV2FtrVqnI9JtA==
X-Google-Smtp-Source: AGHT+IFlT5i5kKk3Z0SM0a41dpKM6/SUmh8tZRBXgiz7PPSaXTpz+AAwwxzsDzMQnnTRJv/bi4kwdg==
X-Received: by 2002:a05:6000:2389:b0:3a4:d238:682b with SMTP id ffacd0b85a97d-3a4d2386cbamr2446821f8f.51.1748186397110;
        Sun, 25 May 2025 08:19:57 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.132.0.213] (17.red-95-127-33.staticip.rima-tde.net. [95.127.33.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebd6fe86sm301311865e9.0.2025.05.25.08.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 May 2025 08:19:56 -0700 (PDT)
Message-ID: <25d9fac2-66c2-4a55-b41c-d932c8a33dee@linaro.org>
Date: Sun, 25 May 2025 17:19:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/20] contrib/plugins: add a scaling factor to the ips
 arg
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
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20250521164250.135776-1-alex.bennee@linaro.org>
 <20250521164250.135776-8-alex.bennee@linaro.org>
 <2aece273-04e9-48ee-aa97-dfe1d8c0d6d8@daynix.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <2aece273-04e9-48ee-aa97-dfe1d8c0d6d8@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 0Wt8yKIMuObi

On 22/5/25 06:45, Akihiko Odaki wrote:
> On 2025/05/22 1:42, Alex Bennée wrote:
>> It's easy to get lost in zeros while setting the numbers of
>> instructions per second. Add a scaling suffix to make things simpler.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>
>> ---
>> v2
>>    - normalise the suffix before a full strcmp0
>>    - check endptr actually set
>>    - fix checkpatch
>>    - scale_entry -> ScaleEntry
>>    - drop hz from suffix
>> ---
>>   contrib/plugins/ips.c | 34 +++++++++++++++++++++++++++++++++-
>>   1 file changed, 33 insertions(+), 1 deletion(-)
>>
>> diff --git a/contrib/plugins/ips.c b/contrib/plugins/ips.c
>> index e5297dbb01..eb4418c25b 100644
>> --- a/contrib/plugins/ips.c
>> +++ b/contrib/plugins/ips.c
>> @@ -129,6 +129,18 @@ static void plugin_exit(qemu_plugin_id_t id, void 
>> *udata)
>>       qemu_plugin_scoreboard_free(vcpus);
>>   }
>> +typedef struct {
>> +    const char *suffix;
>> +    unsigned long multipler;
> 
> As I suggested for the previous version, let's use uint32_t or uint64_t.
> 
>> +} ScaleEntry;
>> +
>> +/* a bit like units.h but not binary */
>> +static 

const

>> ScaleEntry scales[] = {
>> +    { "k", 1000 },
>> +    { "m", 1000 * 1000 },
>> +    { "g", 1000 * 1000 * 1000 },
>> +};
