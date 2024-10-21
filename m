Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2316491njb;
        Mon, 21 Oct 2024 05:03:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVqhFkmsmLQuXBSjyb9Lk3+vvQAUVfC36WJUVczlUbwG0vt3AF2c76eVx9myWfOG0c2AJvMUG6ApVXgnA==@linaro.org
X-Google-Smtp-Source: AGHT+IEIKXGZsQQNBkYEtDaEXkn68U4xYX/rO4wTuUTzkBuuZTNaBDTyZ6H8vKDX4YZPO/nDcMO6
X-Received: by 2002:a05:6102:549f:b0:4a4:8a11:a3b9 with SMTP id ada2fe7eead31-4a5c48ea442mr9664635137.1.1729512211000;
        Mon, 21 Oct 2024 05:03:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729512210; cv=none;
        d=google.com; s=arc-20240605;
        b=KqfKVVwAVLUbbfn5qrmHUM8F5Mu6/9+ejT9GYo3VjbWdG51LTMFN1x6WsKXVNLW/tz
         ImJiC2gVXSEBy/CPP8bf4XeG37o2/AC8wttNSn66nO5OGJagGVKgrTWd1HAvkQmPVw7s
         HcVDba0XO4TWVVSc20EhIgp+LqXNDk+0m/QtJturqRKZ2EBvYwWoqkoD/Mrta8DDiu1A
         7i7oj3XAcqet8cGt8kGUwWpTwyvEgsx6k4bt1jJi9kiM6WINCHhn/nQIMzyRRMqzT60x
         RijA8kwNqifwXlgTOA1kQ7Bax2RwcmHqXgh5fGm1N+Z6txm2Imtr3gmnzW/uciscejy2
         vJvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id;
        bh=EXelHJLcTsNJe4/71FIe+Q0T/Wj49ZEnTFUxrNzYwvs=;
        fh=4mlnkPeqTwuu2Qx8qreMlJHQU0w7aOUfwVS+XUkOkGE=;
        b=YMWeXfK1NesYuYW11wD9iI8KaPBIryhN99wv30VkoXsFrRDgR8XDuYPip/18MukZrb
         njG4Um/Xxv2AVO1eB9C3j4Eg6QKpPwwHHiTfKjRaJR2cm6UM1ypnKClW4EXG8kXD9rvB
         BbjcxNkihg4EcUV1FdxGfQBYuOX2G9VR9UOauVLrm55JajJ1C6zskOdXZ9qG48a3UBwZ
         aO/bqBw9YdQtm1pq6f2BrIXxdBahxQopxjl/BJK+3P22RStu4VPfhXPrEvIVDPpxws2i
         h55RrWFDNubQVe3L0wx2F5jcEaCSgXwFcK2rznchcwPF/Lmt9rS97bufxde3c5VW1a/D
         J3sA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a5f0e2330bsi462911137.719.2024.10.21.05.03.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2024 05:03:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t2r87-0008ET-U7; Mon, 21 Oct 2024 08:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=cGEO=RR=kaod.org=clg@ozlabs.org>)
 id 1t2r86-0008EG-BG; Mon, 21 Oct 2024 08:03:22 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=cGEO=RR=kaod.org=clg@ozlabs.org>)
 id 1t2r84-0004TO-2m; Mon, 21 Oct 2024 08:03:22 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XXDTr5nynz4wxx;
 Mon, 21 Oct 2024 23:03:12 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XXDTl3lq6z4wb7;
 Mon, 21 Oct 2024 23:02:47 +1100 (AEDT)
Message-ID: <e9b148f5-df87-45d2-8e20-532ce9d3fe07@kaod.org>
Date: Mon, 21 Oct 2024 14:02:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [SPAM] [PATCH v1 07/16] test/qtest/aspeed_smc-test: Fix coding
 style
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20241018053112.1886173-1-jamin_lin@aspeedtech.com>
 <20241018053112.1886173-8-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
In-Reply-To: <20241018053112.1886173-8-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=cGEO=RR=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.171, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: DUYF0w18jy15

On 10/18/24 07:31, Jamin Lin wrote:
> Fix coding style issues from checkpatch.pl
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   tests/qtest/aspeed_smc-test.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
> index c713a3700b..4673371d95 100644
> --- a/tests/qtest/aspeed_smc-test.c
> +++ b/tests/qtest/aspeed_smc-test.c
> @@ -353,7 +353,8 @@ static void test_read_page_mem(void)
>       uint32_t page[FLASH_PAGE_SIZE / 4];
>       int i;
>   
> -    /* Enable 4BYTE mode for controller. This is should be strapped by
> +    /*
> +     * Enable 4BYTE mode for controller. This is should be strapped by
>        * HW for CE0 anyhow.
>        */
>       spi_ce_ctrl(1 << CRTL_EXTENDED0);
> @@ -394,7 +395,8 @@ static void test_write_page_mem(void)
>       uint32_t page[FLASH_PAGE_SIZE / 4];
>       int i;
>   
> -    /* Enable 4BYTE mode for controller. This is should be strapped by
> +    /*
> +     * Enable 4BYTE mode for controller. This is should be strapped by
>        * HW for CE0 anyhow.
>        */
>       spi_ce_ctrl(1 << CRTL_EXTENDED0);

