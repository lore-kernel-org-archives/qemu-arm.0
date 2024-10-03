Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp60775njb;
        Thu, 3 Oct 2024 13:50:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVX2dvUYQClwaft4M5tckfSI8TjF86IZpd4of0qHpYo4LEwNPJew+mp3EuGGVC2KG58OlE7ZzbEO9Gqtw==@linaro.org
X-Received: by 2002:a5d:452b:0:b0:37c:c4a9:4e3 with SMTP id ffacd0b85a97d-37d049e2267mr2777017f8f.11.1727988659044;
        Thu, 03 Oct 2024 13:50:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727988659; cv=none;
        d=google.com; s=arc-20160816;
        b=f171cNH4wOnNNjg9mm0j+ThXAeIfFRLnk0z6Xf3aZaG1fwOReOSbUBSUhMMl6zt5/2
         EM/Stf3gXeJnwvkBwTGqK7HXTNvCKB8tbSACornV9QNyVQSCNb+HcjpImpfavwSzEA5Y
         ivHEFZWS5/osR3qIsa0mC6mOv4jwNXfmyj16KUoP+ErVMU6fq4Ao/jl/cI/AGYzoQwFC
         fZg7CxUJKxhuyqJELdl2H7AvFji2tLwDA65bUbl1jDrpwifpggho5Vf28UiDOYR2v1Mp
         0KlGYcl6SexWKC1yOA57tYxQPkgGjQy67OD4Z7y+uiWFQUz0HYW19AwvdAiTkKwAG2uJ
         FMjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=I8KwwV6cPoYlAXm1UCsfz3UXPAIlrMmYqtEhYKNa01M=;
        fh=b0VPP8NG1DFxZz+7HHRUdMBB1SdeWJLi0DHNMdFmCYg=;
        b=U0VGqJ+nV1t4R1hVTwGdyYFBOul3hW7lLPo/nbhzyO45sO3SA5nqPhwzwz5ZrNc13M
         PSWU/1Ru6/NImpfAswtl+F0mF2WsG46yyO4QkGEFFdgj1D8aFsj76E408S+o/RTvLZfo
         Bjx/d43mSDE76X6VoKfJcEs6Nvoy39YiTbnfHCqI0tMaJrisW3fYSm98cYuUBWLCc2pR
         W5KQmROtI1CLBSGGNCWM7I9WprXvwzhlfFaWSTYKULNOiQ/9SAITXjRYH7ovGJazBA0e
         4uAVeJd+OKQzmFvGD7UXQO4W5GOpa/8Q9xd+UPQjuWRoQM7XugFdIO51krhKO7q174/b
         JY4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s4uMjpTm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42f79c66385sor12015345e9.0.2024.10.03.13.50.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Oct 2024 13:50:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s4uMjpTm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727988658; x=1728593458; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I8KwwV6cPoYlAXm1UCsfz3UXPAIlrMmYqtEhYKNa01M=;
        b=s4uMjpTmysCw5nzOpjSLZ5wpHWEnCpel6NxRn7i5x4PvoiN5Oo96fx0XK8EWPEaS0T
         mKk/tt9Xxx/Wt6QtHnX1HBLc8eKpC1UjNQXk7PA0qfh6ytJOtpBJHo+QdwvyJY5F2ky8
         fxeLh2cTA8jLoypDS7CbVYYr9CXpuRBwCdqViIMcmhOgKHx5FJ+hTwelyOMiZtJs0kG0
         7lUu3HEfR1OcxerlXPwf2Y6s84Pt1+2dyfTP3PDMgLwkDcVKpSt/2QVRX5NVN76/bEZt
         UQG/MiFuIDjRaMEWcatEQIQ3yDBIZKAXMe83EvpPa927IcZmVobBRyyj2gQaNpJUoZyX
         dsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727988658; x=1728593458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I8KwwV6cPoYlAXm1UCsfz3UXPAIlrMmYqtEhYKNa01M=;
        b=mY+INcEOcyqDackO/nrXIQrekc0k3yoXfwxH4jqvChu8zyT58DYTKoRHVe5hpl4phO
         gXG02frAK+pbO2J71cH+k+kZSd1Bf0fuLYJQ6jDw0M6SWuzh9KmWvZCpWHoHSi4Ou3Bf
         u2H9HziL13QWnEvY/HfnB+fQ1nbOgYOK6ETnL+lgnUOJLg+uTHb0HF50zudIRkbH+cX6
         qZuRBr2rzUNH6iUwl+9h5iRf+whsk4FcTbu49I7TEJouZ0EVMHleN3UgDZPvDW12grBl
         ecR3aTeIihbxmIBgy6jJtEflJRbRbbFVeDpJ7TPYWfEFO6x8NELWmz+9DnKI09b9dNG/
         E5tA==
X-Forwarded-Encrypted: i=1; AJvYcCW3HD4wpK6T4Fl9xErGXMaBPO08cJYDnsyiN+LDQ26vPQcneYzgl3GEPHvTZCvHSno6H1PfzcVVklN8Iw==@linaro.org
X-Gm-Message-State: AOJu0YwPLx0yI2RIaVGQg+1eGZXk5j5SrKNMseRTiOmIToKyaITGnMkP
	Yk7vs7Yuc5deqg0fejr6kWkcODs1CxTyvip53vdWewhPd9vGf/QYnYpS2y8fEOjYtw==
X-Google-Smtp-Source: AGHT+IH1mo7DalbKvkLgigXtYyVJZR9IxRNksPSeOcbziKjzHtfV0KQN28K7ltFU0fIsRKgZRNYolA==
X-Received: by 2002:a5d:538d:0:b0:378:c6d5:e2b3 with SMTP id ffacd0b85a97d-37d04a57a45mr2626299f8f.23.1727988658462;
        Thu, 03 Oct 2024 13:50:58 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [172.33.27.23] (134.pool62-36-43.static.orange.es. [62.36.43.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f8025b3d6sm23484715e9.18.2024.10.03.13.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 13:50:57 -0700 (PDT)
Message-ID: <4c8e6941-e73d-4504-b289-987ddf49582d@linaro.org>
Date: Thu, 3 Oct 2024 22:50:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] qemu/bswap: Introduce ld/st_endian_p() API
To: qemu-devel@nongnu.org
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas Huth
 <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Jason Wang <jasowang@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>, Huacai Chen
 <chenhuacai@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Sven Schnelle <svens@stackframe.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-arm@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Burton <paulburton@kernel.org>
References: <20240930073450.33195-1-philmd@linaro.org>
 <20240930073450.33195-2-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240930073450.33195-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ScuKKXKosl+I

On 30/9/24 09:34, Philippe Mathieu-Daudé wrote:
> Introduce the ld/st_endian_p() API, which takes an extra

Alternatively we could use ld/st_te_p() since we already
have ld/st_he_p() for host endianness.

> boolean argument to dispatch to ld/st_{be,le}_p() methods.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> TODO: Update docstring regexp
> ---
>   include/qemu/bswap.h | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
> index ad22910a5d..ec813a756d 100644
> --- a/include/qemu/bswap.h
> +++ b/include/qemu/bswap.h
> @@ -433,4 +433,23 @@ DO_STN_LDN_P(be)
>   #undef le_bswaps
>   #undef be_bswaps
>   
> +#define lduw_endian_p(big_endian, p) \
> +                     (big_endian) ? lduw_be_p(p) : lduw_le_p(p)
> +#define ldsw_endian_p(big_endian, p) \
> +                     (big_endian) ? ldsw_be_p(p) : ldsw_be_p(p)
> +#define ldl_endian_p(big_endian, p) \
> +                    (big_endian) ? ldl_be_p(p) : ldl_le_p(p)
> +#define ldq_endian_p(big_endian, p) \
> +                    (big_endian) ? ldq_be_p(p) : ldq_le_p(p)
> +#define stw_endian_p(big_endian, p, v) \
> +                    (big_endian) ? stw_be_p(p, v) : stw_le_p(p, v)
> +#define stl_endian_p(big_endian, p, v) \
> +                    (big_endian) ? stl_be_p(p, v) : stl_le_p(p, v)
> +#define stq_endian_p(big_endian, p, v) \
> +                    (big_endian) ? stq_be_p(p, v) : stq_le_p(p, v)
> +#define ldn_endian_p(big_endian, p, sz) \
> +                     (big_endian) ? ldn_be_p(p, sz) : ldn_le_p(p, sz)
> +#define stn_endian_p(big_endian, p, sz, v) \
> +                    (big_endian) ? stn_be_p(p, sz, v) : stn_le_p(p, sz, v)
> +
>   #endif /* BSWAP_H */
