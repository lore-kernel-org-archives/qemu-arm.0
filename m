Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3052583njk;
        Mon, 2 Dec 2024 09:33:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUnvycAYVFrkBGtovbMR0k+FXJ7Dyh99AkBllPHe4MyQdlfBS6zcyXcnSo8UShXLIVzw8updfwsYrBdyQ==@linaro.org
X-Received: by 2002:a17:902:c945:b0:215:773a:c168 with SMTP id d9443c01a7336-215773ac308mr133906075ad.1.1733160833812;
        Mon, 02 Dec 2024 09:33:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733160833; cv=none;
        d=google.com; s=arc-20240605;
        b=ffFX2JmEbbluTS4ISsu4fNti6vLwVop4NTFSRBO3j3OmoCZ6YHj6CB1dxF7n5WKmM6
         iko4aVmWoLXhQP0PGJbySJLxdJxREC+LZvCVZUj+b0X9qnnBxRhgz6a9J7EPoQig9zen
         +ACjW7gjj5HRKfewNmd/ENe8FXcfxOaRomFlIkr1RYE9fpX2sjNKUpoKc9px2pvwRWT/
         Uwkb83msn5cgLR2Ns1hbshOZpG48vILJM22ge6w3c17rj4QqYPxRQjs80wLEER4heh+/
         PUBPGCtwboCzCPNEIdHnopw1qZjSCV/7KpaPLWhXWcglNYL4/Ek5vOubnmQqznio1SGF
         sKVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Xtg3i1AVd58qb/9RHgv2gvLH1lXXGrGHzc3ZJoeIZf8=;
        fh=fp/FtJrK0S78PKCWhPV74OZCEXxuUDF1/AYPOf3rSNE=;
        b=WuIiwRivT6L82p4cwsb2UC+uzM5uazdpPqcOHHnl/Ig9FC9j8EI9CNMLSDmZmUn7eA
         lYy4T0sHE2s9D+Aeo313JY59T246330hpUlZuq0TK2W4rQaS/XTOYxYirHa6S+JkmNeJ
         vDJVkNgf44uMNlXmer5vH/CHI+iRslVmVgADIrb2L+dA0Ain5vj0MIq1rVwP1AjhygY2
         9Iv3CH1ohndWR8a9/zWh9wbgBmpsDp6HgGsnMekrCC7Cwz6AoxuVv4ObiREBY8cmN+z4
         nN6rdXyLUtFzrdYc19Xi4cq/k6O6i2w5ZlpICS3EiMgH+Oxskunx5QjC81uwT/31QZ5B
         OUnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="x/HRYRtL";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-215a7f51fddsor12585435ad.15.2024.12.02.09.33.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 09:33:53 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="x/HRYRtL";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733160833; x=1733765633; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xtg3i1AVd58qb/9RHgv2gvLH1lXXGrGHzc3ZJoeIZf8=;
        b=x/HRYRtLrg6GIcnQ0G4/dEpilSWBJjFDx6po40/FnFlI0PabixESPQEnYzCyxGUPtf
         Y/MzoLL0MpOVp2fBCB4r5nuk6vEU5MrMDJDCC4CM9wNkxEEBBEqsAyIos1ekh7x322T5
         r+2wM17qFLp3wDS9GT6t4qsVx6KiqWm5A+KO37cOntgglPfQxRTD7hY0BBIdtbaZKWRu
         1z1pv2j8LWR/bJ+DFLFIOkBa2uUNEoCqbPDNRDuqWJKQBmEAUxxGm84dOoevr7Vn8pYa
         KXZvODhx6NZBTjl1W/9ZHQJWAgK6q4js3WB7u8T/yzDz9G7zzWRxTMUO5Schp1YP3Dwa
         1KVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733160833; x=1733765633;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xtg3i1AVd58qb/9RHgv2gvLH1lXXGrGHzc3ZJoeIZf8=;
        b=XeNFjJBtvMZPEPNYqNz8yqnZq0YNNCWOnrGSX6a/kCpM02a2UMDDS1HH6aJv9GyRTm
         ztZJRGWuU1MItCW0wy7dxVQwakMtPtyXECeFqlUU/RvwyW5LZJvwtEInBiAwuVCGvNKa
         72N3xe1w1k0eXv+L7+sVH9Qzw6ILmi4hfIwDnNgNycMrB7BQCBdY50hUCaHVitUVOlMo
         nsy2+n49CLOedGJnxJEprkbUlZTtOifI2DRPuR1EQqNicYfNBmJaOJWr0h0i04FSwA9b
         bBbywofZfRWa0//Wb3Xz/Fmu1pxNHeMNp+cDwC8vomA3IbyB8ROvllEsEpMxjuT5Hv4W
         eIcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjmRXs3Kh8/EYoUWu/51u6i/nlw7iiCRkip5cPe/FDnF0KEZ/CQuHo1kjM/RdwwDV2e4Uh53crXVTm2g==@linaro.org
X-Gm-Message-State: AOJu0YxLjOW84EfAKxdtkChtuResd/NDCL0QBsmFnj7PYWvFhTAjGdrJ
	D4fCWNxMbvcmBmDvzCWB3aPvE8OJLrtf0McAqcmmCLiYDz2+8WsJbqB5ekKQnmdWzA==
X-Gm-Gg: ASbGncuWDnb88MeNbNALFo/TLg3W5dFWTEa7YeqpVL4YTziWh+yZcjfJzl+LkLdMKCm
	oIEq1SMd3NwrgTWBg9YgKRchAF7OHSLN1USzTh7xPpjQza+/wC/dCRZIGZOje02o++tiUoPvDyv
	l6rRQvGcKXQL8WnqDxL/CD6xp/ic0MMoA+GCIIne5tdDAwgN2Buf1xR+p1BD9ITrIXAjMnvZ6rS
	I/b8Ic4zJ/Z40tCNJqt/SoKuoNwLtUG9r6AyrD+cS1iWcNZs4TFN/8//LA0dwfz2bzrMPJnNa2I
	lsk1oUZZUL3fzXIdiAiTOg==
X-Google-Smtp-Source: AGHT+IFmNMZT/3DIWt22rznR4CoBP51jtbDXLLhy9SbzCGhIclEDiQEDmeCdu+vXwyiAiG5Vlqj0XQ==
X-Received: by 2002:a17:902:e54f:b0:215:9a6a:63cb with SMTP id d9443c01a7336-2159a6a6775mr55650265ad.28.1733160833376;
        Mon, 02 Dec 2024 09:33:53 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215219c5533sm79437925ad.256.2024.12.02.09.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 09:33:52 -0800 (PST)
Message-ID: <6cd6b3fd-8362-4fa8-b6e5-e0e3aded3215@linaro.org>
Date: Mon, 2 Dec 2024 09:33:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/functional/aarch64: add tests for FEAT_RME
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Troy Lee <leetroy@gmail.com>, Alistair Francis <alistair@alistair23.me>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, alex.bennee@linaro.org,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20241128213729.1021961-1-pierrick.bouvier@linaro.org>
 <4b3180bd-8054-4431-a594-0445ce4837aa@linaro.org>
 <5620efa2-98c6-4613-b866-67e91ac6acf8@linaro.org>
 <21d8399a-91bf-4599-a73d-351f9f0c147c@linaro.org>
 <CAFEAcA-4_tnm9iPCf_3E4HKKXJ9h6w9oMiYaN0Y4s9wmpji3Jg@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA-4_tnm9iPCf_3E4HKKXJ9h6w9oMiYaN0Y4s9wmpji3Jg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 6V+yyXYlVIlx

On 12/2/24 03:04, Peter Maydell wrote:
> On Mon, 2 Dec 2024 at 10:58, Marcin Juszkiewicz
> <marcin.juszkiewicz@linaro.org> wrote:
>>
>> W dniu 1.12.2024 o 19:09, Pierrick Bouvier pisze:
>>> Hi Marcin,
>>>
>>> On 12/1/24 05:34, Marcin Juszkiewicz wrote:
>>
>>>> So RME tests probably need longer timeouts or would not run at all.
>>>>
>>>
>>> By any chance, are you running those tests in debug mode?
>>
>> zOMG, thanks! Turned out that I left "--enable-debug" in my local build
>> and forgot to remove it.
>>
>> 90s vs 2974s is a difference ;D
> 
> That is a particularly awful debug-to-non-debug performance
> difference; it might be worth looking into what exactly
> is causing it.
> 

Indeed.

This test boots a nested VM (using kvm, not tcg), do you any idea why 
such use case could be so slow with QEMU?

> -- PMM
