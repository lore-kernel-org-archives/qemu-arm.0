Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp82096ejc;
        Thu, 25 Jan 2024 00:21:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbvXqFGBvIYcoDDnIGbEXnW8XFSrn2yM+DSnkmDRjv7gJeNqt9CCXDqJqCT8qc5YKYm0C2
X-Received: by 2002:a0c:e34e:0:b0:686:aa86:9530 with SMTP id a14-20020a0ce34e000000b00686aa869530mr1358072qvm.41.1706170887842;
        Thu, 25 Jan 2024 00:21:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706170887; cv=none;
        d=google.com; s=arc-20160816;
        b=Mz55LvvO064IXaMD6L5p94MF+aFCqFydN2GJkLeapf4s5LcU4NSodDE0q6lceLMtf3
         3sQrjQZ2kZYrHh3VmAl0WOtW+im8njtLkouRuo8NiAPuu7T6CmH6Zh5zXXCsc1IYKxmn
         j8kf9BMgGSQrjWBANBsUZj8ifuyLG1G70KwwGbz24PckBz+wGsMj15g49ODKOgEffA64
         EDDOIg/8+dNDejKy1ySF0UOscOqqeH6oDwi+GJlU/20SDmKGLAf7ANJZKBAAOa8oIBe2
         nMtHIKDp6jocwduGcPDkRp/a4SVN/iPREnWh1eoxsTcFOEKVi9lM7O0liVKntPjZd4yu
         qNSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id;
        bh=V6Ok58jPUJDUHj/f296oMKHDgKm9OQAhaRdIhFQNmGc=;
        fh=K9WsCv8h82pmodHf0S4GDGHRhj9ScsCKQK4fsbzi8Ss=;
        b=YrMQbYQj7TYc1l/eZASL7wyITrQM9ZdHy3o7YGN9z6jbOFhWIBgORW8O4xerF1cJys
         RaQoiCoFEXa+snZriYeLI1wmkUusVeQOHPZzz5qx89Ctdo6g3AoQLzpeRUPHHHzvnR2l
         uc8mLGcRX12RLSy+8zrOYL3xYTnypyYpqzD9Zm3TWYF1HZKOrN1V5ia8Oxeih7Jwb0VT
         2KW2ppVLGdHcakZ+9OhpUIorFrRUHJJb3LY81szgNMH5IlCHo2zMf7w6E+KsI1T/NShx
         A7TmCEuo+gWNydn3JgbGZrdsICclGSgrC+vJUm/gtqmM6VY3GAv6iFSWK9wHzbpFGu3B
         LuDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3-20020ac85843000000b0042a450e0fa9si7551779qth.332.2024.01.25.00.21.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jan 2024 00:21:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSuz5-0004KH-9u; Thu, 25 Jan 2024 03:21:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Usek=JD=kaod.org=clg@ozlabs.org>)
 id 1rSuz3-0004K0-TI; Thu, 25 Jan 2024 03:21:13 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Usek=JD=kaod.org=clg@ozlabs.org>)
 id 1rSuz2-0000pM-4A; Thu, 25 Jan 2024 03:21:13 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TLDL24gv7z4x3D;
 Thu, 25 Jan 2024 19:20:58 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TLDL04pt5z4x23;
 Thu, 25 Jan 2024 19:20:56 +1100 (AEDT)
Message-ID: <f5b7972e-1c13-46f7-b5e2-842112394821@kaod.org>
Date: Thu, 25 Jan 2024 09:20:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH v3 0/5] hw/arm/aspeed: Check for CPU types in
 machine_run_board_init()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
References: <20240125055544.79405-1-philmd@linaro.org>
Content-Language: en-US
In-Reply-To: <20240125055544.79405-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=Usek=JD=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: HZaO+QKixLwZ

On 1/25/24 06:55, Philippe Mathieu-Daudé wrote:
> Series fully reviewed.

There is not much in the aspeed queue apart from [1]. I will consider
sending a PR after a review (Reviewers please ?). Anyhow, if you need
this series soon, feel free to take it.

Thanks,

C.


[1] https://lore.kernel.org/qemu-devel/20240109173538.435781-1-clg@kaod.org/


> Since v2:
> - Addressed Gavin & Richard review comments.
> - Collected R-b tags
> 
> Since v1:
> - Follow suggestions from Cédric from [*]
> 
> [*] https://lore.kernel.org/qemu-devel/e13c655b-7904-4e47-a673-4efd13c26b3d@kaod.org/
> 
> Based-on: <20240123222508.13826-1-philmd@linaro.org>
> 
> Philippe Mathieu-Daudé (5):
>    hw/arm/aspeed: Remove dead code
>    hw/arm/aspeed: Set default CPU count using aspeed_soc_num_cpus()
>    hw/arm/aspeed: Init CPU defaults in a common helper
>    hw/arm/aspeed: Introduce aspeed_soc_cpu_type() helper
>    hw/arm/aspeed: Check for CPU types in machine_run_board_init()
> 
>   include/hw/arm/aspeed_soc.h |  4 ++-
>   hw/arm/aspeed.c             | 70 +++++++++++++++----------------------
>   hw/arm/aspeed_ast10x0.c     |  8 +++--
>   hw/arm/aspeed_ast2400.c     | 15 ++++++--
>   hw/arm/aspeed_ast2600.c     |  9 +++--
>   hw/arm/aspeed_soc_common.c  |  8 +++++
>   6 files changed, 65 insertions(+), 49 deletions(-)
> 

