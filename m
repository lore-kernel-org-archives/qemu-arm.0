Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1926237ejb;
        Tue, 6 Feb 2024 08:48:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7p2mAk96OXBg2MPDkcpzFbDqFEGDel11ARFhmclWY3WIumSUrSY2QinHVAwnIiwikcTOc
X-Received: by 2002:a37:c24b:0:b0:783:f51b:f887 with SMTP id j11-20020a37c24b000000b00783f51bf887mr3221707qkm.50.1707238103317;
        Tue, 06 Feb 2024 08:48:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707238103; cv=none;
        d=google.com; s=arc-20160816;
        b=zUtrNfRvogqxlKxAHOik1oafbJ6r553CMVSQIp1paC4OxB9JfH9KF4/qAQlIY5exrt
         PWFPskdg65Q5g7kFezllDPoCUgT+oae6qvO6n1I6PckbrLUGur08tNpwDTzY8Vn1XXK1
         jyyM0ckO/pOqhH+4jpgWZkdMcUC3PoZsP4b5nbd+gG1nsOLGXdlmijpBs90rcBBAn7ml
         bdl7VSiJMP3i16cClsdliTsTRTMj1OkbKm5pPCqiMrEehFwihyaNZzxSI0JXVO3FvOuP
         PtTUUXLU3nm8iwcGijgWIARKzH+An/4Bn9sBBSabnxZOrumlIHJN4yMiOV3zm3HXqTHY
         DeFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=tFGEhhwfFyD53+O8TFczDTVLD7xNzVO/ScjVfIO4JoM=;
        fh=M9ZvVo1TmnGSWfWr/8rAEfBckv6EhErNLEMTiaIeRBg=;
        b=KtXwgHT2494QAEgquknTl0nljEqXrTvOiRShUbTdwBhXY6dizKs1ypxcIFDj+zt468
         /yzCJe21BhPO+SNe+UvSXWBPrJbZTdMcDNjJkFbd8trtxMRsG9IbiYIYWQeBLcZXp7pm
         Q988cfS0B1O6VSa1tlOgVdsZwa50uZUsXECmWTo6e2t4j/Gx8RCZs+OTKNC1j/QkUXWX
         LjO0jV/2k9xYRzDqdhDeKg1jf9yMQCSsT3IujlvnDuEAiN9LfWtMQqobcJFV7wtKdLef
         tjQ79Im/EsY8Avx0m2zSzDZ1lW/sIJwV86Wkshx0thUkRxNYgBr6SlcW2B1ngrU3SJrr
         7iaQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
X-Forwarded-Encrypted: i=0; AJvYcCVKC1qTq89+C6Gfne3+aeL4AeWbuJI4irTSuQcGk6CiG0Ajzjp66dQENXyIyLLoFitHe//2wjLCC/PWyDQWuHP4/6HCrs5k
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dw11-20020a05620a600b00b007858abd8533si2931989qkb.35.2024.02.06.08.48.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 08:48:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXOc3-0005R0-At; Tue, 06 Feb 2024 11:48:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=f3tV=JP=kaod.org=clg@ozlabs.org>)
 id 1rXOby-0005JD-Bu; Tue, 06 Feb 2024 11:47:54 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=f3tV=JP=kaod.org=clg@ozlabs.org>)
 id 1rXObw-0006ZT-Na; Tue, 06 Feb 2024 11:47:53 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TTq1L17j1z4wyq;
 Wed,  7 Feb 2024 03:47:50 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TTq1J0GYSz4wcC;
 Wed,  7 Feb 2024 03:47:47 +1100 (AEDT)
Message-ID: <29131068-f8ef-4e78-8c42-89b6377b5d09@kaod.org>
Date: Tue, 6 Feb 2024 17:47:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v0 0/2] uart base and hardcode boot address 0
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com
References: <20240205091415.935686-1-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240205091415.935686-1-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=f3tV=JP=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
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
X-TUID: SiGZ93Roiy3J

On 2/5/24 10:14, Jamin Lin wrote:
> v0:

usually we start at v1, so the next version would be a v2. Indexing again :)


Thanks,

C.



> 1. support uart controller both 0 and 1 base
> 2. fix hardcode boot address 0
> 
> Jamin Lin (2):
>    aspeed: support uart controller both 0 and 1 base
>    aspeed: fix hardcode boot address 0
> 
>   hw/arm/aspeed.c             | 12 ++++++++----
>   hw/arm/aspeed_ast10x0.c     |  1 +
>   hw/arm/aspeed_ast2400.c     |  2 ++
>   hw/arm/aspeed_ast2600.c     |  1 +
>   hw/arm/aspeed_soc_common.c  |  4 ++--
>   include/hw/arm/aspeed_soc.h |  1 +
>   6 files changed, 15 insertions(+), 6 deletions(-)
> 

