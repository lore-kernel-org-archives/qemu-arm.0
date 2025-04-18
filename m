Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp347887njd;
        Fri, 18 Apr 2025 10:00:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVYpQcS5X9yDOvLUqVYcoF+cdBF212e4EKK+rlaxB7nNaeT/65yExoGd4gK/Sz1z8Yo1uod+b71KyMkIA==@linaro.org
X-Google-Smtp-Source: AGHT+IGJYuelPwTSsnHv3dVj85hNhiidH6U3Dr3+owMwNPJqgQb+bBEGfVKg/fyKca2c1CMVpCc7
X-Received: by 2002:a05:622a:14f:b0:476:6189:4f2b with SMTP id d75a77b69052e-47aec4dbdccmr57006701cf.46.1744995622736;
        Fri, 18 Apr 2025 10:00:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744995622; cv=none;
        d=google.com; s=arc-20240605;
        b=dlKOVAxH3iwrGGoPSpMss6s/3ypRkaG5jahYJ9PdXjfLEKDA+AQSSQQErJdbk/CGz5
         KGCcfjBdNuFQ3bfNNh4K2OTKn86ZRaB7UBV+QRUUtXZOkIz8uq+IlwIQ1C7sUxe7yp5I
         6KSJcHq1wZGdcnwXkgGNR4/BwFtovKzHXYoHHdmqMJkQg2fx4bUSrcKdFRYQS2wFMcwW
         jzCu+EnvlAGq7BZNaSxg1NLlMNiGFjEJNIAjrEMSuZbPhQIQ3vdYzr0QX+2L1377EvIv
         6ZmvY37iOQ1AYTv2xVyprLn/TeocJQYs3K2AVNllVt6TboI9VkWUF/uM2zjpPe0xNkXv
         EPcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=6c7AkqTlQOlOV9iHN9LCbSUaTJnfsYNhSEPhHBD4h/w=;
        fh=RQef2wRCJ2XXV6Z449cZFUP1wUFBojdIwUTtJyczD/g=;
        b=CjsJEngwSdwPkqbIs+4Kp2W1xcfffzTowzQc0vALdhMs/CHQI1vEkMCRP2hh+NfHFW
         GD7TClXiR8yZKA9SHEhdpbx99JTltZPr57tw+QowrBTOY3QyWdn5V9VoBpk+bxSK819o
         80EdiWJPQ2uz2o6rnU2erligHyDS2FJ0+k9sLSUweAdsQkQLi9yS4LxYtSsnan39IhKF
         ToqIgQywLfEA7m/iOsvaPzI+/epuiu33jm8Qey3E6jWYpzO4qewbhmpqmWtypDk3rrgf
         O9ysUaIv3prWkBNQrkYp7rLqLaF3gSC5W0uq/3RH4tkrs8aByxwVGe52QFAH0DBMqRyL
         wabg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="oxsSO/jv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ae9cb805csi26121281cf.438.2025.04.18.10.00.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Apr 2025 10:00:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="oxsSO/jv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u5p48-00048w-1z; Fri, 18 Apr 2025 12:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u5p46-00048M-0u
 for qemu-arm@nongnu.org; Fri, 18 Apr 2025 12:59:46 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u5p43-0004Hc-9i
 for qemu-arm@nongnu.org; Fri, 18 Apr 2025 12:59:45 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39c1ef4ae3aso1317346f8f.1
 for <qemu-arm@nongnu.org>; Fri, 18 Apr 2025 09:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744995581; x=1745600381; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6c7AkqTlQOlOV9iHN9LCbSUaTJnfsYNhSEPhHBD4h/w=;
 b=oxsSO/jvq8EE1hy9flWRYJjCYx6RGgQVCFMPdAt8qDMUfhIP6j8L4cXL0jtjX6HxEW
 EQrty97FlgcOu4nnbOkpKyMCy0TXqfLNJZlB8buNaNBQaMtP3dLGbvZaYu+WhgbYqD2U
 EzwqwUD6Fs+dJFjrKS1MWeCRlVQUntv1y4NdGRQsGkJIiNchyXLXvRpNji4GdXssHTV3
 at/RjWVYhIBdQSJDDdzWcag1/F9YhfeshxnlpEz+mIwuRFLtMzCblZsVSZJDDVDLIOtO
 OQII9YJcw8yKrhkQb9ZCgULgnerp1/1gdE5NqUZsjthDZ8RvTiLUGQldEsBw+e9ixgT3
 ILfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744995581; x=1745600381;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6c7AkqTlQOlOV9iHN9LCbSUaTJnfsYNhSEPhHBD4h/w=;
 b=GH0ASCkKtW+v57lVzb0VoYEDqODfOL0o3s0aSDqSLu68mekNrRvGZ0rVYORCqPZeq2
 1CLCXVw9HMCngPSIZNYI693iht+kA/Yog784URxK6pL9OL6YewShVdIq01kB/IjyzFnv
 y6lgwgz+P+yuuY7GXiBniPpHdtEpi3pRUdJVrPYQ/ebAX07NGIotwRBCVVikEaAngcN+
 rwDb0SHar8b6E/UzZAo5SIU92hdDDsUy1Reg5u6pDE1tN2AfI/Tjc5fRXuqPzmtFfIm1
 zHiHPi7ZN7JyhqVnj6xmsGR8Lhi2Cao0Sr7asN4XMhwYHRPvyl+cmSsxq996pPByneOt
 JWvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVCcmTL6oV6/De6c+U65sBskFzrEm5kXxYaCqiCQ4T9fVQTK6WwZOoDbS7oH/mYWj3fz39zLsMEQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz9ROZ78SKpBbkwxAFCCnp9SuTGbDdOGKcXFNMmERmb17L+1go4
 4cFtHj1l6CZosi4KjMZ2LhtW6HFbEskNXLkFLwa/hwTcAUnxJwjXe/a5qG2BFbc=
X-Gm-Gg: ASbGncusmKNyNgq2jURk5aHU/yYwFmx2eX3aUkIfqiAo2wZ5RDSDgctDBevcA9OHN1w
 NYzZa7KkzEq+i1tgd3qx78TfwPAdbgsLfneSOVn27OCrGgvvckUYYu2xCHB/O6gcbY+xHmeYllw
 dXUrnEOBPDaFlcQrZdVxsvCAe9OmClNwLZj4a61D8+csABarSYTKY9Vx2oJbEzg8MOxOtgI7MR/
 6xLsXxdIlNvqbDzZSt+MroywXhF4sgQEHuR5LEj/bjVcqvEIhURoWze3u9NOJ7zHv8YE8c+hJPJ
 dpVII3dV4xbXdBaFf06sbNWE+eu4p64lRUTMnPsI/UwSRAdiapbSI04YDVhjOZFJLwOqTad7EQX
 zIs4VoXmk9rol5olRx6s=
X-Received: by 2002:a05:6000:2481:b0:390:e535:8750 with SMTP id
 ffacd0b85a97d-39efbd60d22mr2946285f8f.9.1744995580691; 
 Fri, 18 Apr 2025 09:59:40 -0700 (PDT)
Received: from [192.168.69.175] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4330bfsm3250187f8f.23.2025.04.18.09.59.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Apr 2025 09:59:40 -0700 (PDT)
Message-ID: <26c2b844-dc96-448e-8978-e536ed1e61f6@linaro.org>
Date: Fri, 18 Apr 2025 18:59:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] hw/arm: Define machines as generic QOM types
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Felipe Balbi
 <balbi@kernel.org>, Bernhard Beschow <shentey@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Peter Maydell
 <peter.maydell@linaro.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20250417235814.98677-1-philmd@linaro.org>
 <a302fb91-e2d8-ef36-ac53-5e460476c2d0@eik.bme.hu>
 <25a82a76-cd63-4a42-bb68-5dcf826bd948@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <25a82a76-cd63-4a42-bb68-5dcf826bd948@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: oKReXFlmCS5e

On 18/4/25 18:33, Pierrick Bouvier wrote:
> On 4/18/25 01:53, BALATON Zoltan wrote:
>> On Fri, 18 Apr 2025, Philippe Mathieu-Daudé wrote:
>>> While DEFINE_MACHINE() is a succinct macro, it doesn't
>>> allow registering QOM interfaces to the defined machine.
>>> Convert to the generic DEFINE_TYPES() in preparation to
>>> register interfaces.
>>>
>>> Philippe Mathieu-Daudé (11):
>>>   hw/core/null-machine: Define machine as generic QOM type
>>>   hw/arm/bananapi: Define machine as generic QOM type
>>>   hw/arm/cubieboard: Define machine as generic QOM type
>>>   hw/arm/digic: Define machine as generic QOM type
>>>   hw/arm/imx: Define machines as generic QOM types
>>>   hw/arm/integratorcp: Define machine as generic QOM type
>>>   hw/arm/kzm: Define machine as generic QOM type
>>>   hw/arm/msf2: Define machine as generic QOM type
>>>   hw/arm/musicpal: Define machine as generic QOM type
>>>   hw/arm/orangepi: Define machine as generic QOM type
>>>   hw/arm/stm32: Define machines as generic QOM types
>>>
>>> hw/arm/bananapi_m2u.c      | 13 +++++++++++--
>>> hw/arm/cubieboard.c        | 13 +++++++++++--
>>> hw/arm/digic_boards.c      | 14 ++++++++++++--
>>> hw/arm/imx25_pdk.c         | 14 ++++++++++++--
>>> hw/arm/imx8mp-evk.c        | 15 +++++++++++++--
>>> hw/arm/integratorcp.c      | 16 +++++++++++++---
>>> hw/arm/kzm.c               | 14 ++++++++++++--
>>> hw/arm/mcimx6ul-evk.c      | 15 +++++++++++++--
>>> hw/arm/mcimx7d-sabre.c     | 15 +++++++++++++--
>>> hw/arm/msf2-som.c          | 13 +++++++++++--
>>> hw/arm/musicpal.c          | 16 +++++++++++++---
>>> hw/arm/netduino2.c         | 13 +++++++++++--
>>> hw/arm/netduinoplus2.c     | 13 +++++++++++--
>>> hw/arm/olimex-stm32-h405.c | 13 +++++++++++--
>>> hw/arm/orangepi.c          | 13 +++++++++++--
>>> hw/arm/sabrelite.c         | 14 ++++++++++++--
>>> hw/arm/stm32vldiscovery.c  | 13 +++++++++++--
>>> hw/core/null-machine.c     | 14 ++++++++++++--
>>> 18 files changed, 213 insertions(+), 38 deletions(-)
>>
>> This is much longer and exposing boiler plate code. Is it possible 
>> instead
>> to change DEFINE_MACHINE or add another similar macro that allows
>> specifying more details such as class state type and interfaces like we
>> already have for OBJECT_DEFINE macros to keep the boiler plate code 
>> hidden
>> and not bring it back?
>>
> 
> We can eventually modify DEFINE_MACHINES, to take an additional 
> interfaces parameter, and replace all call sites, with an empty list for 
> all boards out of hw/arm.
> 
> As long as we avoid something like:
> DEFINE_MACHINES_WITH_INTERFACE_1(...)
> DEFINE_MACHINES_WITH_INTERFACE_2(...)
> DEFINE_MACHINES_WITH_INTERFACE_3(...)
> I'm ok with keeping the macro.
> 
> Would that work for you folks?

But then we'll want DEFINE_PPC32_MACHINE() -> 
DEFINE_MACHINES_WITH_INTERFACE_1() etc...

We want to eventually use declarative file to structure most of the
machine boiler plate code. Maybe being momentarily verbose is
acceptable...
