Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1542668njk;
        Thu, 18 Jul 2024 09:19:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2OZcmLYpj0SQVegWZ8MTG+Arze+t5LIXJD9dQhj30lhxL8NedbL/H885rEmhm9FDIpt8aFtHMOubjpOj9EP3K4nReHevj
X-Google-Smtp-Source: AGHT+IHbkS02GrJePVM2qvY/nIZlVXbSBYcWxRxnS9KIchcmJvi6IyDLbCNXWHs6B1EFNkU6kTRy
X-Received: by 2002:a05:6808:1492:b0:3d6:3450:7fed with SMTP id 5614622812f47-3dad9a2d492mr2333211b6e.39.1721319585313;
        Thu, 18 Jul 2024 09:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721319585; cv=none;
        d=google.com; s=arc-20160816;
        b=RckJX1fpRyZ2ybuUeemSB3tKGUosFnACQTdH367P33mg3sd56k0IQuz/rcNKkw7N3B
         SGFr3OfqGyOixV4MgvZaDUsJ3BmlZxs3BuLCATH0O1ag4jbNeY8uAdTwc7C+INefQGbI
         Aaufupii2ATb3idtmCNSQlyg3T6HgCVUF6wji9Ypc6hqZpLUI3yjNZp6W6HAV18v/W9e
         npXq0rjQVRf54L1w9Bkg7XV3sq/abFkyKnEC3BS7ojV+z11LYPD9ChQf/vZVGMIAoW92
         19aLyOUJupo0CsmBs3nU4H00o31Td0Rjq0DWrS4ve7er8w/rDzkauiplo84kacYdVHAv
         zNCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=fVm4i5ghdp1onyv8s/zR2n0u1dH4KT1LaOkzuvhbx48=;
        fh=RH326lsL91O6tq6SvzXDCOepARNhIW7j4JvNZpUzKmc=;
        b=uXC0aVOPbseqa6xTcBS0uZ+29dSTaa6cemtStGhmAC/uE8WcvfSTHJAuOTX8T4Yo4U
         hoemqia4yFbrtt+qx30CF6gmBaW4Ov+GYGWgRVanwzT71M3vMvGqz2jP20qcGpNgDMN/
         3l6jYqmkTg8FpbR+5xKx5qx9QX4N0Irj5kekjmJhrAi6zW9sXV4mBowlEI76EUwqBpPU
         IFF0RmTEghCu+/2moV0/WC/Z2gHNAfu8nHknM3okt30rYxvIwnbu/IOsvmJqJWBY7y4f
         ZBffJI6gZSFj88TrclzQjzDw0lhZevz8bKCSZOZoTUyct4XQQPeFibJiVelu9g0qKumQ
         SWKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-822caebb1besi349335241.211.2024.07.18.09.19.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jul 2024 09:19:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sUTql-0005If-QW; Thu, 18 Jul 2024 12:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=3riu=OS=kaod.org=clg@ozlabs.org>)
 id 1sUTqk-0005Hk-11; Thu, 18 Jul 2024 12:19:22 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=3riu=OS=kaod.org=clg@ozlabs.org>)
 id 1sUTqi-00086c-99; Thu, 18 Jul 2024 12:19:21 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WPyg84Cvpz4x3p;
 Fri, 19 Jul 2024 02:19:16 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WPyg51tSQz4x3J;
 Fri, 19 Jul 2024 02:19:12 +1000 (AEST)
Message-ID: <e5d6df99-da45-40c4-b75c-cb6a1e9a57b6@kaod.org>
Date: Thu, 18 Jul 2024 18:19:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] aspeed/smc: Fix possible integer overflow
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>
References: <20240712163619.1734214-1-clg@redhat.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240712163619.1734214-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=3riu=OS=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: C611uLaBk8zF

On 7/12/24 18:36, Cédric Le Goater wrote:
> Coverity reports a possible integer overflow because routine
> aspeeed_smc_hclk_divisor() has a codepath returning 0, which could
> lead to an integer overflow when computing variable 'hclk_shift' in
> the caller aspeed_smc_dma_calibration().
> 
> The value passed to aspeed_smc_hclk_divisor() is always between 0 and
> 15 and, in this case, there is always a matching hclk divisor. Remove
> the return 0 and use g_assert_not_reached() instead.
> 
> Fixes: Coverity CID 1547822
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/ssi/aspeed_smc.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index b79815c2b8aa..7fd63669c10e 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -842,8 +842,7 @@ static uint8_t aspeed_smc_hclk_divisor(uint8_t hclk_mask)
>           }
>       }
>   
> -    aspeed_smc_error("invalid HCLK mask %x", hclk_mask);
> -    return 0;
> +    g_assert_not_reached();
>   }
>   
>   /*


Applied to aspeed-next.

Thanks,

C.


