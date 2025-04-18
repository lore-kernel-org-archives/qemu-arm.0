Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp402134njd;
        Fri, 18 Apr 2025 11:49:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVH5pH8ra4+EbX7hRB+vw13YNFKV67uJItFhtGyse21TFbR9Chw7T0LcPxLm2p5Hp6VbtLO58SIzmNsKg==@linaro.org
X-Google-Smtp-Source: AGHT+IH6x6D5vVtfmNep3JoqlowJaUMlsuEbjBG1E7hBf4sFWWOJ1AXfEH+KRtJ0K4mXwLKm8TmB
X-Received: by 2002:a05:620a:4628:b0:7c5:5d4b:e63b with SMTP id af79cd13be357-7c928018eafmr538128385a.38.1745002157576;
        Fri, 18 Apr 2025 11:49:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745002157; cv=none;
        d=google.com; s=arc-20240605;
        b=MTd/OZeT4SZikl6bwP7IWY+bPUK52VBZnA6Cx7iSTwzjiEdzUc4ix7A0ZJAskgvddE
         K3ThoIonml6790yfGCL5j4Ts3pmU6jm4jw4v4cIJ+94RyciLQWDxHhFD5Sp9xeE/u4Ef
         18fQy+XcBfEZ7S74JQuYwu6D0hjK9tgjRr8cG6KkZRuuKDFjFZFIPgR+Q014Unvx3c4c
         DA0wvej2jgczWxQquCVFN07H5S1X8uHypGuk/edSHLbvr8rCD3WQs1895seRNlaeXttB
         CmvI2ZEnGfDQdm4zzem9V4aqjWJ/tJy24h3V+zvSkmeWj7emlVhdL65J+2M5IvxPe5Ql
         LZSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=CIn6WWtKxkcdV5uyu7hPYqR5Ct9TYhfVuln60V0T088=;
        fh=THiHCh7XPJmN/nUj6URkPTxxAqR4hu57l5hyaF2wa+0=;
        b=WQ2u4QmYypLOm5KjHMQTNE7O1X0OkaiAzL1jXXOS4DB6jznmyXizMmwjSYO9sfU9uS
         ngD+9bC8IWSy6k2Dqn0v8VCVPmekq/4WtEo5VaJALdEM89YKGaD0mHfId4r1GpNmY4hj
         PLmHWBSvw7VNVkPPWYA+UskUOMxRP7UqVowungJ4Ahjwru65ooMQR00XmGGXXGaOh8x0
         g2kO5PRxPjRkHpz+ZXMtyMue0INqCeQxXJadC5RsiTiPJ9DrId5YEn7LpMXVnMIrPxEo
         cmS39xNODERMMMUgmeha75ul5ylrvAtttpWONBLE8+eH+IZm9e9qC4sODZq9eqeXSNe5
         6OGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c925bc7a75si273805685a.459.2025.04.18.11.49.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Apr 2025 11:49:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u5qlf-0003tt-9Y; Fri, 18 Apr 2025 14:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1u5qlW-0003rX-9O; Fri, 18 Apr 2025 14:48:43 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1u5qlT-0001mw-Se; Fri, 18 Apr 2025 14:48:42 -0400
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id AC99755D22A;
 Fri, 18 Apr 2025 20:48:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id m-6VrXyoGHbY; Fri, 18 Apr 2025 20:48:30 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A326F55C592; Fri, 18 Apr 2025 20:48:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 9EF40745682;
 Fri, 18 Apr 2025 20:48:30 +0200 (CEST)
Date: Fri, 18 Apr 2025 20:48:30 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, 
 Antony Pavlov <antonynpavlov@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, 
 Beniamino Galvani <b.galvani@gmail.com>, 
 Eduardo Habkost <eduardo@habkost.net>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Felipe Balbi <balbi@kernel.org>, Bernhard Beschow <shentey@gmail.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
 Jan Kiszka <jan.kiszka@web.de>, Alistair Francis <alistair@alistair23.me>, 
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 Alexandre Iooss <erdnaxe@crans.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH 00/11] hw/arm: Define machines as generic QOM types
In-Reply-To: <26c2b844-dc96-448e-8978-e536ed1e61f6@linaro.org>
Message-ID: <401c58d2-adda-81ec-eeec-0ddbcf3e4926@eik.bme.hu>
References: <20250417235814.98677-1-philmd@linaro.org>
 <a302fb91-e2d8-ef36-ac53-5e460476c2d0@eik.bme.hu>
 <25a82a76-cd63-4a42-bb68-5dcf826bd948@linaro.org>
 <26c2b844-dc96-448e-8978-e536ed1e61f6@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1779484340-1745002110=:55441"
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: BPBg2uxM09v+

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1779484340-1745002110=:55441
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 18 Apr 2025, Philippe Mathieu-Daudé wrote:
> On 18/4/25 18:33, Pierrick Bouvier wrote:
>> On 4/18/25 01:53, BALATON Zoltan wrote:
>>> On Fri, 18 Apr 2025, Philippe Mathieu-Daudé wrote:
>>>> While DEFINE_MACHINE() is a succinct macro, it doesn't
>>>> allow registering QOM interfaces to the defined machine.
>>>> Convert to the generic DEFINE_TYPES() in preparation to
>>>> register interfaces.
>>>> 
>>>> Philippe Mathieu-Daudé (11):
>>>>   hw/core/null-machine: Define machine as generic QOM type
>>>>   hw/arm/bananapi: Define machine as generic QOM type
>>>>   hw/arm/cubieboard: Define machine as generic QOM type
>>>>   hw/arm/digic: Define machine as generic QOM type
>>>>   hw/arm/imx: Define machines as generic QOM types
>>>>   hw/arm/integratorcp: Define machine as generic QOM type
>>>>   hw/arm/kzm: Define machine as generic QOM type
>>>>   hw/arm/msf2: Define machine as generic QOM type
>>>>   hw/arm/musicpal: Define machine as generic QOM type
>>>>   hw/arm/orangepi: Define machine as generic QOM type
>>>>   hw/arm/stm32: Define machines as generic QOM types
>>>> 
>>>> hw/arm/bananapi_m2u.c      | 13 +++++++++++--
>>>> hw/arm/cubieboard.c        | 13 +++++++++++--
>>>> hw/arm/digic_boards.c      | 14 ++++++++++++--
>>>> hw/arm/imx25_pdk.c         | 14 ++++++++++++--
>>>> hw/arm/imx8mp-evk.c        | 15 +++++++++++++--
>>>> hw/arm/integratorcp.c      | 16 +++++++++++++---
>>>> hw/arm/kzm.c               | 14 ++++++++++++--
>>>> hw/arm/mcimx6ul-evk.c      | 15 +++++++++++++--
>>>> hw/arm/mcimx7d-sabre.c     | 15 +++++++++++++--
>>>> hw/arm/msf2-som.c          | 13 +++++++++++--
>>>> hw/arm/musicpal.c          | 16 +++++++++++++---
>>>> hw/arm/netduino2.c         | 13 +++++++++++--
>>>> hw/arm/netduinoplus2.c     | 13 +++++++++++--
>>>> hw/arm/olimex-stm32-h405.c | 13 +++++++++++--
>>>> hw/arm/orangepi.c          | 13 +++++++++++--
>>>> hw/arm/sabrelite.c         | 14 ++++++++++++--
>>>> hw/arm/stm32vldiscovery.c  | 13 +++++++++++--
>>>> hw/core/null-machine.c     | 14 ++++++++++++--
>>>> 18 files changed, 213 insertions(+), 38 deletions(-)
>>> 
>>> This is much longer and exposing boiler plate code. Is it possible instead
>>> to change DEFINE_MACHINE or add another similar macro that allows
>>> specifying more details such as class state type and interfaces like we
>>> already have for OBJECT_DEFINE macros to keep the boiler plate code hidden
>>> and not bring it back?
>>> 
>> 
>> We can eventually modify DEFINE_MACHINES, to take an additional interfaces 
>> parameter, and replace all call sites, with an empty list for all boards 
>> out of hw/arm.
>> 
>> As long as we avoid something like:
>> DEFINE_MACHINES_WITH_INTERFACE_1(...)
>> DEFINE_MACHINES_WITH_INTERFACE_2(...)
>> DEFINE_MACHINES_WITH_INTERFACE_3(...)
>> I'm ok with keeping the macro.
>> 
>> Would that work for you folks?
>
> But then we'll want DEFINE_PPC32_MACHINE() -> 
> DEFINE_MACHINES_WITH_INTERFACE_1() etc...
>
> We want to eventually use declarative file to structure most of the
> machine boiler plate code. Maybe being momentarily verbose is
> acceptable...

Moments in QEMU can last years... I was thinking about similar to 
OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES. Would something like that be 
possible for DEFINE_MACHINE too?

Regards,
BALATON Zoltan
--3866299591-1779484340-1745002110=:55441--
