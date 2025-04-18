Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp92975njd;
        Fri, 18 Apr 2025 01:53:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWS7CSvkB/kh6dhYjedJlTkP2JyZ6HX6yiz7jFpQeph0TVB2k0tNR8zBJN0GYwn0dvoOqtuP4vB3N0O1Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGhjcYfaCzFAEjFn+VSOoUjWXTOtK70D1frTe29EvMNELPrwYU6q0KZdnR8b5hvMnPzwLQ7
X-Received: by 2002:a05:620a:44cf:b0:7c0:af6d:a52a with SMTP id af79cd13be357-7c928304baemr319721085a.26.1744966418685;
        Fri, 18 Apr 2025 01:53:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744966418; cv=none;
        d=google.com; s=arc-20240605;
        b=SONR5zlRuqh4dibjQXvWxZDYBIhzn3vUEFRfx4xqBT2CmijgLx7vQlrLFOyOEOXsTF
         P0v0SGsi4jOHbg9K9Te2fAkOqYsN2v9aj89YCHrQgHYkhGXlf+Gxq5T2JI52oLVzIhAs
         qX5qYj8x1E5V2lM+yfAEJStN7Pr/E5zFGtkACfHw5iWNGprq1MnLNerSOKDt3toA/z8M
         4MqlkmcS370/bpdxNlQjkX47nwlt//cFp+/bABXK3bavy3R2UIVNFtsHuWt/ecgu/2gP
         0RvMmjNdSDEJp3g/yImr8fHxVY+ZdVi/lg+dQB4pwJYrYl/YrIyHLiRHXhMHYuwQiNlU
         3XJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=UTxo2r63s8nMA9EJ74pimRl/vGbNsR+WagpHss1ZUhw=;
        fh=P8Kwi9NCHXtdPJ+JJ1ttwmPHrLPAjEFK4TEhpaLFAMs=;
        b=Ph3My0d8yaB3uR2e/tOTaGzScStm2NW+zi0pfcZpYRgyA4bZ94ymGlTSzwSrfOwblI
         Fb2BEWTBz1Eixc4R9wLnasMOT7cm3IHkaPDFBACDxazWqPaPkiKwUe5fAlwgmlN107Ng
         2HYr7j/6u/Q2Lnb9H3EqC25xVMqK6qCZmlbOw6TnDj/h4kyjgQ43gFbLEnff6XK4gvKC
         E5mozoj9opI/BNs/RapxbW/zs3h8AHBSZY22ekBSAti/mwzS2J328W5uFN/vyrblGsyv
         QYBDsb/BUTDAU76QFL03YDN73XRaHREwoLQXfq6QBfNWTbW43RyaH+nbYhVSqK5upKAv
         USGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c925aaffabsi182648885a.25.2025.04.18.01.53.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Apr 2025 01:53:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u5hTR-0004Rx-8J; Fri, 18 Apr 2025 04:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1u5hTP-0004RJ-GZ; Fri, 18 Apr 2025 04:53:23 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1u5hTN-0001NZ-22; Fri, 18 Apr 2025 04:53:23 -0400
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 6C8FA55D21A;
 Fri, 18 Apr 2025 10:53:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id kjrGb1OLwGkb; Fri, 18 Apr 2025 10:53:13 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 745DA55C592; Fri, 18 Apr 2025 10:53:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7185F745682;
 Fri, 18 Apr 2025 10:53:13 +0200 (CEST)
Date: Fri, 18 Apr 2025 10:53:13 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, Andrey Smirnov <andrew.smirnov@gmail.com>, 
 Antony Pavlov <antonynpavlov@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, 
 Beniamino Galvani <b.galvani@gmail.com>, 
 Eduardo Habkost <eduardo@habkost.net>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Felipe Balbi <balbi@kernel.org>, Bernhard Beschow <shentey@gmail.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
 Jan Kiszka <jan.kiszka@web.de>, Alistair Francis <alistair@alistair23.me>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 Alexandre Iooss <erdnaxe@crans.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH 00/11] hw/arm: Define machines as generic QOM types
In-Reply-To: <20250417235814.98677-1-philmd@linaro.org>
Message-ID: <a302fb91-e2d8-ef36-ac53-5e460476c2d0@eik.bme.hu>
References: <20250417235814.98677-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-674896605-1744966393=:81771"
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
X-TUID: LXhntJeWvWyq

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-674896605-1744966393=:81771
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 18 Apr 2025, Philippe Mathieu-Daudé wrote:
> While DEFINE_MACHINE() is a succinct macro, it doesn't
> allow registering QOM interfaces to the defined machine.
> Convert to the generic DEFINE_TYPES() in preparation to
> register interfaces.
>
> Philippe Mathieu-Daudé (11):
>  hw/core/null-machine: Define machine as generic QOM type
>  hw/arm/bananapi: Define machine as generic QOM type
>  hw/arm/cubieboard: Define machine as generic QOM type
>  hw/arm/digic: Define machine as generic QOM type
>  hw/arm/imx: Define machines as generic QOM types
>  hw/arm/integratorcp: Define machine as generic QOM type
>  hw/arm/kzm: Define machine as generic QOM type
>  hw/arm/msf2: Define machine as generic QOM type
>  hw/arm/musicpal: Define machine as generic QOM type
>  hw/arm/orangepi: Define machine as generic QOM type
>  hw/arm/stm32: Define machines as generic QOM types
>
> hw/arm/bananapi_m2u.c      | 13 +++++++++++--
> hw/arm/cubieboard.c        | 13 +++++++++++--
> hw/arm/digic_boards.c      | 14 ++++++++++++--
> hw/arm/imx25_pdk.c         | 14 ++++++++++++--
> hw/arm/imx8mp-evk.c        | 15 +++++++++++++--
> hw/arm/integratorcp.c      | 16 +++++++++++++---
> hw/arm/kzm.c               | 14 ++++++++++++--
> hw/arm/mcimx6ul-evk.c      | 15 +++++++++++++--
> hw/arm/mcimx7d-sabre.c     | 15 +++++++++++++--
> hw/arm/msf2-som.c          | 13 +++++++++++--
> hw/arm/musicpal.c          | 16 +++++++++++++---
> hw/arm/netduino2.c         | 13 +++++++++++--
> hw/arm/netduinoplus2.c     | 13 +++++++++++--
> hw/arm/olimex-stm32-h405.c | 13 +++++++++++--
> hw/arm/orangepi.c          | 13 +++++++++++--
> hw/arm/sabrelite.c         | 14 ++++++++++++--
> hw/arm/stm32vldiscovery.c  | 13 +++++++++++--
> hw/core/null-machine.c     | 14 ++++++++++++--
> 18 files changed, 213 insertions(+), 38 deletions(-)

This is much longer and exposing boiler plate code. Is it possible instead 
to change DEFINE_MACHINE or add another similar macro that allows 
specifying more details such as class state type and interfaces like we 
already have for OBJECT_DEFINE macros to keep the boiler plate code hidden 
and not bring it back?

Regards,
BALATON Zoltan
--3866299591-674896605-1744966393=:81771--
