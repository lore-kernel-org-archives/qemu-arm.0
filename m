Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp761107njb;
        Fri, 6 Sep 2024 00:49:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWe+8AV9D7VTYfh47KfS3NBgmAPPR2QeM092PiCi5gn+Rzat9ztRMDZ0THAfv/6jBABb1Evtx5azl89ZQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFoUUrnTDUeo6jNnwn8uqA8OpVvHB4gbFJFRvM4egOj70ZBjNxhq92uhLPT3d4+GIvyNBRQ
X-Received: by 2002:a05:620a:424a:b0:7a8:325:5309 with SMTP id af79cd13be357-7a99731e33dmr187506585a.12.1725608998851;
        Fri, 06 Sep 2024 00:49:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725608998; cv=none;
        d=google.com; s=arc-20240605;
        b=H41CGGKirC+B4U3By7hc1TeVVRVZgjzKQN5Jlxd5qIjUrdY8JWtys2E0vRmwXEDat/
         p4hDUppXVV1WZ9ijtqoROtQ2gDPItOxOW5Bv+Xj2UK5UuFAL8VgS3WX8CcFcr2YO45ic
         EFFtFmXI+2ppqdHxoAQMyz12ASsNsFGFO84E14EuWQP2/HACZHmMgn1b124RUs0yr/hD
         JSWfLddd9LQyHBNt35Zr3X1LyFGVlMxrqC2zq+OALkjBFd02V3g5SdnLQm79xhaigk3F
         zU/t7Nyb6xpgAfrzBhAvh6t07iRVQnfH4tx3qPeC3cesU24gOGUsF4JxDe1aVWvLYfHh
         aAAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=5kuyjbA4NGJ6/GkJNzULBitdfwivpZIKlkNXmQITNLA=;
        fh=xde4RztPxS75EYq3tRm9hzFj1q3vkWnyous7srlSAL8=;
        b=gdKjPEOXXQKZOxo9h5GbWhbnGU+Wr5SI2L4MDQJ9TppHOZxlmGHF49f8o6p3BJiYBH
         8wZj+CR46zuTSK9FKGQWQrdh9oTsiN5GvjEOLQV7Nk2MsJvX4svWij1ZjxeWRq1p+Nyr
         2yp1ZuySm4s6smVEg2/AR6+Pd0LJf0g+hpHDiK2xA0m8oqJq0ZApBdHkFb8I7jLGmfrN
         EfsLK+6ZCa4tizL24h64wzjX4cpAqbiaCOG/oZMjZKYLBrRyXG8sv37g4a4AuPHzWBze
         hvIt7mgvrwy7eBlp/WPAZAxWYZKe365aZYe4e+OJhe4SZhp8ZlfapkGCRRDb1tHx+RD+
         ILbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9959b7d84si185925985a.403.2024.09.06.00.49.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Sep 2024 00:49:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1smTiw-0000l8-KX; Fri, 06 Sep 2024 03:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=ncBN=QE=kaod.org=clg@ozlabs.org>)
 id 1smTiv-0000fG-AS; Fri, 06 Sep 2024 03:49:41 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=ncBN=QE=kaod.org=clg@ozlabs.org>)
 id 1smTit-0001io-6Q; Fri, 06 Sep 2024 03:49:41 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4X0Szv1bsWz4x8c;
 Fri,  6 Sep 2024 17:49:31 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0Szk4TzQz4x7F;
 Fri,  6 Sep 2024 17:49:22 +1000 (AEST)
Message-ID: <73b7ffba-f2ae-415e-9aa6-793480c08f67@kaod.org>
Date: Fri, 6 Sep 2024 09:49:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SPAM] [PATCH v3 00/11] support I2C for AST2700
To: Troy Lee <leetroy@gmail.com>
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, Troy Lee <troy_lee@aspeedtech.com>,
 Yunlin Tang <yunlin.tang@aspeedtech.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20240903083528.2182190-1-jamin_lin@aspeedtech.com>
 <00aac81e-ff43-4526-960c-782e27ae043f@kaod.org>
 <SI2PR06MB50418DD956AC152E4E0911CDFC9C2@SI2PR06MB5041.apcprd06.prod.outlook.com>
 <c418168b-eb5c-459c-85b1-c7766102e558@kaod.org>
 <CAN9Jwz0cRRb308_ZOuwOsJsPLiKp3sugGJ-YzhvALv3-f+yaCQ@mail.gmail.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAN9Jwz0cRRb308_ZOuwOsJsPLiKp3sugGJ-YzhvALv3-f+yaCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=ncBN=QE=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
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
X-TUID: l8QNulCzcEIa

Hello,


On 9/4/24 11:01, Troy Lee wrote:
> Hi Cédric,
> 
> On Wed, Sep 4, 2024 at 3:29 PM Cédric Le Goater <clg@kaod.org> wrote:
>>
>> Hello Jamin,
>>
>>> Just want you to know that I and Troy are working on the following tasks for AST2700.
>>> 1. Support boot from bootmcu(riscv32) instead of u-boot(Cortex-A35)
>>
>> Oh nice. This is a good topic for heterogeneous machines !
> 
> The basic model for bootmcu(risc-v) is working now, 

May be send that first.

> but we're looking for a way
> to integrate sram/mmio/dram together.  
Unfortunately, QEMU is not yet ready for heterogeneous architectures.

> The ivshmem requires PCI, it might be
> too complicate for our use case.  There is an ivshmem-flat probably more
> sutiable for us.
> 
> [PATCH 0/4] Add ivshmem-flat device - Gustavo Romero (kernel.org)
> https://lore.kernel.org/qemu-devel/20231127052024.435743-1-gustavo.romero@linaro.org/

I lack expertise in that area. Adding Gustavo.

Thanks,

C.

