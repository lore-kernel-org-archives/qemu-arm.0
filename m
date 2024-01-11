Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1717383ejs;
        Thu, 11 Jan 2024 06:01:14 -0800 (PST)
X-Received: by 2002:a17:907:1b1c:b0:a28:9546:f92a with SMTP id mp28-20020a1709071b1c00b00a289546f92amr1216688ejc.67.1704981674028;
        Thu, 11 Jan 2024 06:01:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704981674; cv=none;
        d=google.com; s=arc-20160816;
        b=f/PrBssVn3VrV2LkkD3HgOkf80Rwu8TYSsDoWumvAZPa1L4lJnYES3jQUun4P5rDi8
         mS7DXkQ+HN6EmyorzoshsYGvJNW/bFbzmP4JB3lkhZcFRAoseueS3zQqsNSAr2RJwOWq
         4AkPKaf0YqjWdRj27SHyoX/Qw7USZLBUACDCElPVvKslLZpt3xJ99DEr3HmyfcwTtA7N
         fLq1Ux2ItBTkQxD/NjGzRVYwvoZ7ZUnJ6wFGrwf96B10R+9v3fu08NGDWyHAWmyHn0I/
         3oy5nJoI239cESRyhFNFetttTWtGxPSXrOJYK02Qt0xj7zE2bAbJK5HvL38jqTEJoXmI
         PNcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=h2RpPuGEzbLXO/q/GxO4Zqvt8tldWX4SahttPk2YlGY=;
        fh=JleVenhY0GMfmNwouuIH4nFj7DrXP4BS+eKknaf/j0c=;
        b=kyZSp89AbRNX1P2VyzV4Dl6tyii/+u9KLbfTpg1p4/R7SemyJ8OJNcMeuHRiIEA2Lv
         iVBw3xX5rOdZybTShkv/pV2WdnFtzYVHL4yHRlTqCoAdYuFYSiiSTKQX7IrH42655EJm
         6lSulmH0fCaYWj+J5nyDSQXHivlItePqxF0vIM1cjHNgeU9C1BxoTskQ9emf8bp0XxK0
         aMgg7pBz2B4hidv7sLq8ayDKTKVrBeYrS/bfxUEgptOroooI1G1bp3OVdHPmVKZR0lG7
         hhsvjgU6zVSIM2nO9GtYAvLeJ97ACfucYmsswBh54zHYGwd9XJ9yFwpkmOdhwV+oA6p0
         LDRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xk2WvWWQ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id dn2-20020a17090794c200b00a28d122f2d8sor1678019ejc.9.2024.01.11.06.01.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 11 Jan 2024 06:01:14 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xk2WvWWQ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704981673; x=1705586473; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h2RpPuGEzbLXO/q/GxO4Zqvt8tldWX4SahttPk2YlGY=;
        b=Xk2WvWWQKwWrZ3mcS57fwfw7pFByprKZgHbVsBla0/vTpaMDRZ4Sg0yqpYQlLR03xZ
         X8RGlC75/4h3FygKj3/htEHUQg9RHrOrs4x2IVRZOSGCpNKoiJdWXeTzURJ2lEbxToiR
         aCawzA71ekjcETmCbLiO4/7UZHg7v+gzramEXPJiEw9dNYmAznuJXaT/aOUsYkeTo7aZ
         +EZfc0RMwi53vGSlNCQmzgT/oU7JYhcQ/FKDQiWpRshKctRwRnFMzbyf6Qz35hKMI328
         l3xvh51mxMgEa5Da5iaVUxX+LSiEF2rm+0CcHceN9dgQNHGJshLt0Wc6IzH/M73qaJWx
         04Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704981673; x=1705586473;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2RpPuGEzbLXO/q/GxO4Zqvt8tldWX4SahttPk2YlGY=;
        b=lHsr7BaBQF3ZVcoDzryGJxI1V/6kSss+hHokRY5+ojjBZ9VV1blc5bTOVlO0tULhgR
         l8uKC9zMLYhGU8WNxYkDL173Tz88zE5HcsZuCDACTLj4mX8FvzdhbBEHOp8XbOxlD/2x
         g5ubsroi7sP2JoNLwpZYHO08hgx5sELj6w5qfx0UfT6E4HymPvs3o4tgxSbK3uYZH+sV
         LgeOaupjcq9Z978J8uHeNW5YJYjKHnCaueLxXljeyu+T8lMRyCGGr7ONI+H56VVWWRv+
         MMomN6oW/j92EpvVoZ8ESBWTsAztMpZRvz0vrRRZWGD1La6uVgMv8FMXVpyFLNf7Q1zC
         2KJA==
X-Gm-Message-State: AOJu0YzessFYb70N6EaizvuOHsEBFK/veoA6apfRyY0QNJp5qO8+WBYa
	t+ToTQeivp37w8EwvotEwtTVqBDsBCkOGAW9k3FlnAPpaeyfJY/y
X-Google-Smtp-Source: AGHT+IGcWANbw87s/pDAASQo0NAdJFu8b2B5QcVIq5BEGgMbk6bZ7fUKghDc+/ZCqix/Dq8gHhpb/g==
X-Received: by 2002:a17:907:9488:b0:a28:f6a2:ca7c with SMTP id dm8-20020a170907948800b00a28f6a2ca7cmr1065105ejc.17.1704981673304;
        Thu, 11 Jan 2024 06:01:13 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (vau06-h02-176-184-43-236.dsl.sta.abo.bbox.fr. [176.184.43.236])
        by smtp.gmail.com with ESMTPSA id x17-20020a170906711100b00a2c5ec21e0esm575137ejj.85.2024.01.11.06.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 06:01:12 -0800 (PST)
Message-ID: <00b95fa5-b289-4476-b1eb-e97bc6f9986b@linaro.org>
Date: Thu, 11 Jan 2024 15:01:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 42/43] docs/devel: lift example and plugin API sections
 up
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
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
 Weiwei Li <liwei1518@gmail.com>, John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-43-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240103173349.398526-43-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: azhx90UHXrOf

On 3/1/24 18:33, Alex Bennée wrote:
> This makes them a bit more visible in the TCG emulation menu rather
> than hiding them away bellow the ToC limit.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/devel/tcg-plugins.rst | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
