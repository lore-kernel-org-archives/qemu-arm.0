Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1765339ejb;
        Wed, 19 Jun 2024 22:45:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUFIJREGDNXpUKiOBd4aYn844zYVB82zVbL6IPXq883wPNhy1IXodebjRAKobmU6eTT98kt3r3/bpOzh7FHzLboJaPM4paU
X-Google-Smtp-Source: AGHT+IGAN8WAgASUDKV6ulfU0ZdyO380ha9dtdgrAchk7ycoUivpIMgwYb19E4EaJsUeZqEY/2Gw
X-Received: by 2002:ac8:7f0a:0:b0:43f:f361:1b22 with SMTP id d75a77b69052e-444a79cfe59mr47430041cf.36.1718862331578;
        Wed, 19 Jun 2024 22:45:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718862331; cv=none;
        d=google.com; s=arc-20160816;
        b=AihlirjscRpzLcS8ib1j4K56N+HHfX/AX86FTdGhRoSKk56gkQs7Dl8xeBAa1IYs1N
         QwZeA+9L67gFuDMO8iNnMCbKTbzfYVE8TMGoUxnbLnlww1A/YiWnzvtGvNHraebH1kRa
         Jj0nIEJg162vbRyf55jLKY8jnIqPS2oxab5WKKuzSxS2EKPFfczFJb4jE2Cp+F1n39M6
         gXcoJ3Sr/ESMKTb0YG0pYCML+DTBB4Z3hYluObjUmCw4Xqv9enGa28XyCsFwlFgESzuy
         hoe3APMvcaOliDfTIvdKpA82u8aaeZopVRF1yUPlgU7a2oj8kHjfyddAmWAT5UjkrnOr
         Tmgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=e6W9a+2GRszxthEeE1wKqGTlVICMfjGLkwiU71EthfA=;
        fh=L8M9OuGVmbNJrDIPS4yoODPWkaGwVPKOMzYqjU69lMA=;
        b=pNgRDi5XTPrdeVKectqjxqW/oyz+aDWYV1+laWo81DlynWPmTVhFxU4Z/XD4BixvUr
         BNq19t/J1/N8tXV50/f+2yDf4QJpmctJ27NTxMLZrxfKtdEBvTO+l4eEE/gc8ujykCXZ
         EWuThIfdzx3P7oFJ8BNcA7AT+X40GDmtDEOQnGJLOWfMkzcxMXO3Aw9fqptJkUlZzaw0
         /Ttd56V/3f3iKRkuvqwpXXz7eXhKC401MIRI+dklAw9VBLHUzuz0H1Hbw0NpK2rX3Bg3
         yEC86fymCcOfTEpeVD8nFHYEfiWNYk4xZcD2MLELjsMoZM+WiXNnXpArC6J8d8WYL9vA
         kRcw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-441f2fe8534si173705081cf.578.2024.06.19.22.45.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2024 22:45:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKAbi-0006Sw-V3; Thu, 20 Jun 2024 01:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=7F4n=NW=kaod.org=clg@ozlabs.org>)
 id 1sKAbh-0006Si-I0; Thu, 20 Jun 2024 01:45:13 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=7F4n=NW=kaod.org=clg@ozlabs.org>)
 id 1sKAbf-0001cG-IJ; Thu, 20 Jun 2024 01:45:13 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4W4TwD0W6bz4wyj;
 Thu, 20 Jun 2024 15:45:00 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4W4Tw91Pwjz4w2S;
 Thu, 20 Jun 2024 15:44:56 +1000 (AEST)
Message-ID: <c6510e3f-9a28-463e-abed-3cff44c328c4@kaod.org>
Date: Thu, 20 Jun 2024 07:44:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hw/gpio/aspeed: Add reg_table_size to AspeedGPIOClass
To: Zheyu Ma <zheyuma97@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240619183638.4073070-1-zheyuma97@gmail.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240619183638.4073070-1-zheyuma97@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=7F4n=NW=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
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
X-TUID: 2oeWqPPznIZr

On 6/19/24 8:36 PM, Zheyu Ma wrote:
> ASan detected a global-buffer-overflow error in the aspeed_gpio_read()
> function. This issue occurred when reading beyond the bounds of the
> reg_table.
> 
> To enhance the safety and maintainability of the Aspeed GPIO code, this commit
> introduces a reg_table_size member to the AspeedGPIOClass structure. This
> change ensures that the size of the GPIO register table is explicitly tracked
> and initialized, reducing the risk of errors if new register tables are
> introduced in the future.
> 
> Reproducer:
> cat << EOF | qemu-system-aarch64 -display none \
> -machine accel=qtest, -m 512M -machine ast1030-evb -qtest stdio
> readq 0x7e780272
> EOF
> 
> ASAN log indicating the issue:
> ==2602930==ERROR: AddressSanitizer: global-buffer-overflow on address 0x55a5da29e128 at pc 0x55a5d700dc62 bp 0x7fff096c4e90 sp 0x7fff096c4e88
> READ of size 2 at 0x55a5da29e128 thread T0
>      #0 0x55a5d700dc61 in aspeed_gpio_read hw/gpio/aspeed_gpio.c:564:14
>      #1 0x55a5d933f3ab in memory_region_read_accessor system/memory.c:445:11
>      #2 0x55a5d92fba40 in access_with_adjusted_size system/memory.c:573:18
>      #3 0x55a5d92f842c in memory_region_dispatch_read1 system/memory.c:1426:16
>      #4 0x55a5d92f7b68 in memory_region_dispatch_read system/memory.c:1459:9
>      #5 0x55a5d9376ad1 in flatview_read_continue_step system/physmem.c:2836:18
>      #6 0x55a5d9376399 in flatview_read_continue system/physmem.c:2877:19
>      #7 0x55a5d93775b8 in flatview_read system/physmem.c:2907:12
> 
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>


Applied to aspeed-next.

Thanks,

C.

