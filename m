Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3050184njk;
        Mon, 2 Dec 2024 09:31:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU6LJKThjyAaCN93/WUFoIZcnqENgRt9HbVATOXI9WqBH9YbwEbu4KEIIdvQJw9mCD7dUt8exmvA5lx5w==@linaro.org
X-Received: by 2002:a17:903:187:b0:215:7dbf:f3de with SMTP id d9443c01a7336-2157dbff8eamr97123205ad.28.1733160686240;
        Mon, 02 Dec 2024 09:31:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733160686; cv=none;
        d=google.com; s=arc-20240605;
        b=Zo/Yt1OylQXe3fjtonianaZr4GvcpHlglFIRt13Cx/L9Xkomn86aAgOLtTp+Su7TPm
         +0qm4BvdAbXvKmv9q1LjPvkYJVd0wD8h8nWxESwDIWy0iUsCOuXZ1dFgCELTr4y/8UuT
         kuAGEaAK7icZOggX/o2TZj07BGLooNuXBjKwvwzuWt89oczLbDvfnUugQXV9zHKWS30M
         OctnJO3dMwLQyP1KbsL7dyTuaB6rmoWn7MxQTXjOAw4ZtUWHpJItEEvOQuPMjw4VL8hY
         Z6pRVZJKPdMVGhi1oTQ5x6ocuC0lWMJLBz0Xt4zemfXN/UxljSreFYfNj/0+ekDkmMdg
         IFig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=e543963Iyk40iaooUTKu+Y2n2X5t7JEguZc6j9uAx+Q=;
        fh=xoCPpKuZwMucgKY9WtKvVOncoiqiXaNfmYBkm5R89ew=;
        b=k7rxO3D7vktnOzIdY/IYgRfznt7vEe40d6Haw8FYnOoTlpouRnwoR5CAozdzcH49W0
         AYtZPLa9pzw9Ngp/7bt4gQqb23wrayAXKRRrcZ+i52XuGyLhIvG747/cQmLjO2MFuTD9
         uNZJMNE6ndG9cHfdmciQUEtEDfJrml00AHgj4FetwdBPCTF/OKP9e5Who8yuZjAl/SAb
         MPWztm0bX/yXUQrL5oyoDBuniMSc2THKYVHFcuwdbp1cP91/HANKV0blDk54hxGeU1HS
         JWmvkIFNSYPyCPaArIVAHX/ZnEwi/Wg/xzfe2UNAKg/QxrmzVpQgAplNWf6qHIWccszQ
         uMxw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZSJGMjwI;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2159eadb92csor16838005ad.7.2024.12.02.09.31.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 09:31:26 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZSJGMjwI;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733160686; x=1733765486; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e543963Iyk40iaooUTKu+Y2n2X5t7JEguZc6j9uAx+Q=;
        b=ZSJGMjwIZ6VtFkDN7JV7QfK18TCnQActIxY3yJQVqAg4bu/4zpgZrhOQf90eElvRu4
         +vN30OM1Zerb3alTOmO03NS5Sw5Gxfxp9XAfgVMoBmmTaN4eABCoR5B/HXo3njN9Npwr
         mSwA8FgTrpN9UbXvsMLO5AarqiIPoRoH36IdUCLy301xRDRX9ZVCXFEhGVeqtscFojx7
         qx1rROZlAiU7s1MJfSOI/WemuJqZHEjFfx1cLaqDipiSCM49t3Sf3yGuNc6rIOmdD6Hu
         3p42cHWGIDHNipQvFJxXJAY++OMGI/udekd3/I6g3ihfE91X4oA14WfdXyDadFLaKMYR
         Fj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733160686; x=1733765486;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e543963Iyk40iaooUTKu+Y2n2X5t7JEguZc6j9uAx+Q=;
        b=rjg+dvmt9GwCr3PwFGWwz6URdbvBzREZkNmrd98rGu1oibwQlQbFNedSV4aYeb01Hz
         d+g4IKCwT7W/jcQ0zXQYzGxr7u44Vhcv0rqdqOkIB9gsensJgeNPezOCh3DccejNyvq1
         11UhLXrz1H4WAO+IgXwU9fajHlAHOoZyQF6geKJTUhkxGcqsOSY4CHcNBbKfOnVlj9EF
         cV2yM4++DU0odAscC5yzUPexazS2MPUtusMzDxK8qFeJfgZahjxW3ZEyaRPbLH9sFA14
         aRTY3VMkIzHv7Y1pdl/RSDR6y9RcuepPgTv/9Uu92g6p7bxrYBz+0H/8EzLATL3jkgiz
         Y/Rg==
X-Forwarded-Encrypted: i=1; AJvYcCV9qYrhvkhXDGNNqbW1yzriu3s8Y7gvfvQ99nRaHUfn/IVHw3A5C32Lz5FyEZniDvQt7X3HU5I12FJA8g==@linaro.org
X-Gm-Message-State: AOJu0YxCAYV2UhbGju7/wDmD9QcYK/zKrWxzYLG4iCTc7gZ6MBeW0x0w
	JeV6CAjLcTjxrPujOYV2SKdHMypl7WC4aXrXTsUGaIxrSjdDdHi2JI1WdSDqpSNhRA==
X-Gm-Gg: ASbGncsEG22RAkFR/cOaiUHZ/jSDToxk/1wPjcKe4avwoH7tWeIl90BgV7Apc5fbzGy
	dpSNAiIn/bgijD0DRvbN6EIu9FJIMlfIiB7MpnM78NA/ofmA5rGCsR7cQoYST1GJ3kGax+PgpMs
	pnj3KiMumTA3BDK0LdDPekOt2uGAwOeapCYoH4hZ5EvwJ35Z67wlW3gWg0qGe71WPl3c3xAR++X
	mAVHa7LHO2yE1fI3HKbH6Wyhos99Rf0mMzpQTDlbjXRLg+LrN+JMkVe6O2kb/SQuCsy1zuQke3O
	yc5ykGu0jOUkOGWV2vYeIA==
X-Google-Smtp-Source: AGHT+IH5HS+3cVvUEDx40H4OBjMUtQn35Ws6+8Xss5JvJ4eXhh35qNriFf4JcL7hLS9OJLvhr9+D0Q==
X-Received: by 2002:a17:902:f68c:b0:215:a3e3:c868 with SMTP id d9443c01a7336-215a3e3cfbfmr40054965ad.30.1733160685693;
        Mon, 02 Dec 2024 09:31:25 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2154e1c34a4sm54262065ad.260.2024.12.02.09.31.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 09:31:25 -0800 (PST)
Message-ID: <fd7ad48e-1e72-4735-8064-7039eedc00ae@linaro.org>
Date: Mon, 2 Dec 2024 09:31:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/functional/aarch64: add tests for FEAT_RME
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
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
 <CAFEAcA-xa1AKf2GAv7go5wdu+Td=4jf7Nriin-Oe3S6qEV6X0g@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA-xa1AKf2GAv7go5wdu+Td=4jf7Nriin-Oe3S6qEV6X0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: +zOyCiNnccKl

On 12/2/24 02:57, Peter Maydell wrote:
> On Sun, 1 Dec 2024 at 18:09, Pierrick Bouvier
> <pierrick.bouvier@linaro.org> wrote:
>>
>> Hi Marcin,
>>
>> On 12/1/24 05:34, Marcin Juszkiewicz wrote:
>>> W dniu 28.11.2024 o 22:37, Pierrick Bouvier pisze:
>>>> This boot an OP-TEE environment, and launch a nested guest VM inside it
>>>> using the Realms feature. We do it for virt and sbsa-ref platforms.
>>>>
>>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>>
>>>> diff --git a/tests/functional/meson.build b/tests/functional/meson.build
>>>> index 5c048cfac6d..b975a1560df 100644
>>>> --- a/tests/functional/meson.build
>>>> +++ b/tests/functional/meson.build
>>>> @@ -13,6 +13,8 @@ endif
>>>>     test_timeouts = {
>>>>       'aarch64_aspeed' : 600,
>>>>       'aarch64_raspi4' : 480,
>>>
>>>> +  'aarch64_rme_virt' : 720,
>>>
>>> Took 2974.95s on M1 Pro macbook.
>>>
>>>> +  'aarch64_rme_sbsaref' : 720,
>>>
>>> This one needed 2288.29s.
>>>
>>>>       'aarch64_sbsaref_alpine' : 720,
>>>
>>> Have to check cause timed out.
>>>
>>>>       'aarch64_sbsaref_freebsd' : 720,
>>>
>>> 331.65s
>>>
>>> So RME tests probably need longer timeouts or would not run at all.
>>>
>>
>> By any chance, are you running those tests in debug mode?
>> It seems to me that CI is running functional tests with optimized
>> builds, so I'm not sure we want to support debug "times" here.
> 
> We do need to support debug times, because a common developer
> use case is "doing a debug build, run 'make check-functional'
> to check whether anything is broken. The debug times also
> are useful because the CI runners can have highly variable
> performance -- if a test is slow enough to hit the timeout
> for a debug build locally, it's probably going to also hit
> the timeout at least sometimes in CI.
> 

I understand the scenario, but given how slow debug builds are, it would 
probably be faster to advise developer to recompile in release mode.
The overall time of compile + test is slower than waiting for debug.

Beyond using a debugger, what is the advantage to compile with -O0?

> thanks
> -- PMM
