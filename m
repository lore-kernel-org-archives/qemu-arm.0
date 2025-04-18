Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp353946njd;
        Fri, 18 Apr 2025 10:08:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXPKcMV/Egzl8e9b6x/8+wCU9XIRIHyoZzRXojK1NolJWIqYTEtR304JJ2mQNuDIDEeY+9qXbIC3ZN5+g==@linaro.org
X-Google-Smtp-Source: AGHT+IG4ZKzT3PfgWFvPmEgK6IdJRtveb3URhQxc3VSCqTndM0FZwdDEyxVDYX1VcYRPU8c3736s
X-Received: by 2002:a05:620a:c50:b0:7c5:57b2:2cb9 with SMTP id af79cd13be357-7c927fac56emr455344185a.26.1744996096813;
        Fri, 18 Apr 2025 10:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744996096; cv=none;
        d=google.com; s=arc-20240605;
        b=fpiotGAQmQhct1znv7XNhC671SKtD3p9kRoRwZ+c8Wa32WJzFFiBSE1nPgyMcWbRxZ
         PweEZ1QxCIgjVrVTmZT6nPT21PVNJVrvuAcGq2+SE1Zw/mvw5nTw0FdIOjujF0gjOmuv
         9tVO53m/TYdtA5+r3AR8RtoKHhygkbTlHAND02AiOXFLRcuuOeYfo40ToeaivKlOQKlr
         LaWgXjSyO5jzz+QeOHWvl04KhYdy2wp5w1C334DzhwQpQpZD10qedsx1xsl6fxTafpzZ
         3tr/zQWSe2lSVqu0DhHMgkWUTMUAO0uiWVxtDlSdcD8VGcQ+xFsm2QxJ1vlO+THTwof6
         dKgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=WQcUR+8DZpToY40YkzrKeJh5gMEQCSz+L8jocvc+Mgc=;
        fh=IkwzomGtCoVf9PTAix13ClNjt3CY4AIMWigQarFB5vc=;
        b=RTPVhyLPSrTOpHJEo5Wz1ZG0DJwJYbhTdZF+f0OfOJZ/vP0dU+phZi8rW0IMHLEF6v
         WZ7peLwVmjdRShhHMzQSfYcQmZa2sJeKlp9HPU1ZXjvpio89ZkcNPWWvESQGj2dI5dqb
         Om1Hy1Ufyd4eoupCWrftFH0VCBiAcUumpJd0R2j710bmA4foEGyykL1A8eUsbkSHsUjg
         sNzC4FRxgC1Pqk9WEpqSAuDIpL3U7IWWlhcn8GNI6Cwp7XNcDzDn9IdJj96O/2rHnNgo
         vgTqscbLr8UzFJXXYJuMETQkNFSE2IV6zian+OTsByTI1vihSs0huPGa3Jm6f7R5kgTs
         yAEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y0b58yTC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-877647ab873si618034241.152.2025.04.18.10.08.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Apr 2025 10:08:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y0b58yTC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u5pC3-0008VV-8v; Fri, 18 Apr 2025 13:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u5pBs-0008Nr-9u
 for qemu-arm@nongnu.org; Fri, 18 Apr 2025 13:07:48 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u5pBq-0005bc-99
 for qemu-arm@nongnu.org; Fri, 18 Apr 2025 13:07:47 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso24649375e9.3
 for <qemu-arm@nongnu.org>; Fri, 18 Apr 2025 10:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744996061; x=1745600861; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WQcUR+8DZpToY40YkzrKeJh5gMEQCSz+L8jocvc+Mgc=;
 b=y0b58yTC6C6VeFTnBgFYupIIvk1Vow5+nJuWAmR2oSeXidptwpxTAsJDh8Qzxa0wJ7
 8MhqdCeQBAFvDBItLFRHBG71FTbGnDDi5kYBQl+Rj4LXK/Mx8V6SePB04sNKdwDhIVSp
 KjPQsbNaJDwMmxsE2ddf/l4BJWt7Br9MNu623iJignU85wZOl9mBFnfytEtkY7SbaVm1
 Bb7hKWU9HoDyEqbPr1SUHQzmCv/4DANycRK/8+tc5GzCHao57UQqCtKvP9e+QXGSncS8
 2anhxiQ2V0hoZX6k+/T3mJE0XYs9dECIPbs0A6ijfMIIPD7ajeVbO1t/0AsgwbiE3AYa
 4VHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744996061; x=1745600861;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WQcUR+8DZpToY40YkzrKeJh5gMEQCSz+L8jocvc+Mgc=;
 b=m/k9fGSKWEmZu8WRwNeznspXVD4GWtWjHhwvQJ3IvBnm4DqTkhz3TyU551hCWsVTA0
 lWUBLLVuWNlaV5GqmzwuxAidOToj7eKtyRPAakONk9CXXqI48PgAJ+NeDkPtqXCtaiQ8
 adKW5slHtrdz8oU4JI2E28rzYmr5MdJ2LMCGsTy0k5AYxYOCVq+my/RAEX9d60uK08Po
 JZEP26uqzNvKnBT9rtYTEl3uUfUKKPB7PBPEcWJ3xl4/NBZLNyH9Mn9TM0XOG/IQAK8b
 pQlxwHgs7YGvkLJZHrtS0Lh/Az1PEO3cnNhgfs8AQMusppafySB4EBRTnAjdXg7DTZ/4
 35nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW83yXhheRZSGyOk03NBZylubnUzypR5Z+eoIac2uqN/i1fTDKbUman4wYDSIhfCY1rhTctrcXjjQ==@nongnu.org
X-Gm-Message-State: AOJu0YwahXlkZJKHCnWxfyuaX4o04wVSb82GxleQJFjP+236UpeJLUFd
 KucmAjkCCQ6//0kQOqKJHnIGYT4T4dZxpzODkbRtimpAj6ZcHnTM5zVEzWbc/sg=
X-Gm-Gg: ASbGncsKJg61NxmysfX8fDzAMSwjNlyY7fu4ks8n8wS48+IZvlj630bM8ImzCFDk/nr
 4s/Vj9o0MCl8VBpRPgbKnGDcOrT4vh8EzCK78LT7bDBITTDWhQWIsvI++gf+AcWJ/onSmSojXry
 m/PjB0SnLBDJnNmLHQM4OtRyfpMotMxz0BiPpDXkXzOBo+NcAquyRvxtQYVn8fLCVOF9ilpPo4g
 Yr3sRguvl39vSmC1VnP/lg0xvV9O3+uc0oRtIj50aqd4nupqJ73qvDFNDxU7Fl/Mt1H4wfarf9X
 d42B8qNsDwvgU2Z3flHo1IPDz0N5LxnjLvnmz4VH25Nj4vSeJ8N9NPrdBbkNhwCUQHjL00xdnnX
 cV2PT7XKp
X-Received: by 2002:a05:600c:1547:b0:439:6118:c188 with SMTP id
 5b1f17b1804b1-4406aba756emr26720995e9.19.1744996061226; 
 Fri, 18 Apr 2025 10:07:41 -0700 (PDT)
Received: from [192.168.69.175] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5a9e0esm29601275e9.5.2025.04.18.10.07.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Apr 2025 10:07:40 -0700 (PDT)
Message-ID: <ee3c9b11-4c4e-41c7-8029-7e5c153215d7@linaro.org>
Date: Fri, 18 Apr 2025 19:07:39 +0200
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
 <26c2b844-dc96-448e-8978-e536ed1e61f6@linaro.org>
 <35ae8633-4195-446b-9a22-0c131b9cab88@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <35ae8633-4195-446b-9a22-0c131b9cab88@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: OoGtC2HZZsZ7

On 18/4/25 19:03, Pierrick Bouvier wrote:
> On 4/18/25 09:59, Philippe Mathieu-Daudé wrote:
>> On 18/4/25 18:33, Pierrick Bouvier wrote:
>>> On 4/18/25 01:53, BALATON Zoltan wrote:
>>>> On Fri, 18 Apr 2025, Philippe Mathieu-Daudé wrote:
>>>>> While DEFINE_MACHINE() is a succinct macro, it doesn't
>>>>> allow registering QOM interfaces to the defined machine.
>>>>> Convert to the generic DEFINE_TYPES() in preparation to
>>>>> register interfaces.
>>>>>
>>>>> Philippe Mathieu-Daudé (11):
>>>>>    hw/core/null-machine: Define machine as generic QOM type
>>>>>    hw/arm/bananapi: Define machine as generic QOM type
>>>>>    hw/arm/cubieboard: Define machine as generic QOM type
>>>>>    hw/arm/digic: Define machine as generic QOM type
>>>>>    hw/arm/imx: Define machines as generic QOM types
>>>>>    hw/arm/integratorcp: Define machine as generic QOM type
>>>>>    hw/arm/kzm: Define machine as generic QOM type
>>>>>    hw/arm/msf2: Define machine as generic QOM type
>>>>>    hw/arm/musicpal: Define machine as generic QOM type
>>>>>    hw/arm/orangepi: Define machine as generic QOM type
>>>>>    hw/arm/stm32: Define machines as generic QOM types
>>>>>
>>>>> hw/arm/bananapi_m2u.c      | 13 +++++++++++--
>>>>> hw/arm/cubieboard.c        | 13 +++++++++++--
>>>>> hw/arm/digic_boards.c      | 14 ++++++++++++--
>>>>> hw/arm/imx25_pdk.c         | 14 ++++++++++++--
>>>>> hw/arm/imx8mp-evk.c        | 15 +++++++++++++--
>>>>> hw/arm/integratorcp.c      | 16 +++++++++++++---
>>>>> hw/arm/kzm.c               | 14 ++++++++++++--
>>>>> hw/arm/mcimx6ul-evk.c      | 15 +++++++++++++--
>>>>> hw/arm/mcimx7d-sabre.c     | 15 +++++++++++++--
>>>>> hw/arm/msf2-som.c          | 13 +++++++++++--
>>>>> hw/arm/musicpal.c          | 16 +++++++++++++---
>>>>> hw/arm/netduino2.c         | 13 +++++++++++--
>>>>> hw/arm/netduinoplus2.c     | 13 +++++++++++--
>>>>> hw/arm/olimex-stm32-h405.c | 13 +++++++++++--
>>>>> hw/arm/orangepi.c          | 13 +++++++++++--
>>>>> hw/arm/sabrelite.c         | 14 ++++++++++++--
>>>>> hw/arm/stm32vldiscovery.c  | 13 +++++++++++--
>>>>> hw/core/null-machine.c     | 14 ++++++++++++--
>>>>> 18 files changed, 213 insertions(+), 38 deletions(-)
>>>>
>>>> This is much longer and exposing boiler plate code. Is it possible
>>>> instead
>>>> to change DEFINE_MACHINE or add another similar macro that allows
>>>> specifying more details such as class state type and interfaces like we
>>>> already have for OBJECT_DEFINE macros to keep the boiler plate code
>>>> hidden
>>>> and not bring it back?
>>>>
>>>
>>> We can eventually modify DEFINE_MACHINES, to take an additional
>>> interfaces parameter, and replace all call sites, with an empty list for
>>> all boards out of hw/arm.
>>>
>>> As long as we avoid something like:
>>> DEFINE_MACHINES_WITH_INTERFACE_1(...)
>>> DEFINE_MACHINES_WITH_INTERFACE_2(...)
>>> DEFINE_MACHINES_WITH_INTERFACE_3(...)
>>> I'm ok with keeping the macro.
>>>
>>> Would that work for you folks?
>>
>> But then we'll want DEFINE_PPC32_MACHINE() ->
>> DEFINE_MACHINES_WITH_INTERFACE_1() etc...
>>
> 
> We can see that later when touching other targets. For now, 
> DEFINE_MACHINE is not used in a lot of places, so replacing call sites 
> should be easy, and it will cover hw/arm, which is our point of interest 
> now.

I concur and share the same goal, but here Zoltan is concerned about
converting DEFINE_MACHINE to DEFINE_TYPES adds 12 lines of boilerplate
code.
