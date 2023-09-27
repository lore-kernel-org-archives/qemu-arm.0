Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1611021ejc;
        Tue, 26 Sep 2023 22:44:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7UXkgmxMjx7GHwDxLtmNYzm7sP1bAfFwZL0ES+C/i+U7GKp3MI3tYPxPDnSJs0ar6NTOT
X-Received: by 2002:a0c:aadd:0:b0:658:243e:3084 with SMTP id g29-20020a0caadd000000b00658243e3084mr876720qvb.55.1695793494877;
        Tue, 26 Sep 2023 22:44:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695793494; cv=none;
        d=google.com; s=arc-20160816;
        b=Lj8/XML24OAvx/dLjxVUhe02pVxWphD/sUZkisrX/L8JamPqpqoCGtioHfeZO4ht5m
         EtSuGZ5MgqLtNM+Xd7J9ppLQsOOgZybIAlXWFDUBBQ7Sn7lm8nHXMi7CZTbA3tdLn/Ir
         uQEjR35z8pK3o1SLXIAjGlFh5ieI3pMGQt1lVg+IxOgiFhH17jU6FdhWG8bOtwFYYILD
         hW+aBS15AWp2T3q/UyREKJ9gWwlWKb3X0tPYjNq+y6IW/Cb8+Ybr7JoBJ3qmgQssVrcx
         9FitZcSisZV5rMTVFFCW9Yf6q9kyO8r91NtAwlvz+YP7gvnns1W68eB5/P6YbFSGn0Y6
         Q1BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=Fu1NiApmiDLx2WR20X+meE43cMIU59izGfoUx77En5I=;
        fh=H7EBcgh/fXRUG9PaHnf09A9+wWhnNNe7Y3xVxuiG3uE=;
        b=chw/S/AyIwEnPFyoXbsi4TJRgs1UvNlQhh0DzqsQXESQqMxByIIWzJbQi46x5MMs7h
         Nj3T33t+KGmsKpCIJ2Rp6FvRcENt1YhG2padTkiZg6OP0xXc4g6EavGRZ6QVFuTEa+VH
         OG29xTK0w/oUp5A5TW1QIfnxEZZCDh479oKiy841jamO6XOC+XoH6OQcazbARRpUokBk
         hVjFQPISp1R9xQQr301UxGf/XqF6Z2pt1r7+ty2Rh76JNAEu0CCZ8yaHbT4nvjkHTPB7
         B3ysma6HlyEHv7/fGpDxtjoBbNW1/BxUjMiCK60T5PaAN+nQqvvVW5sy/x/m0gIrnFHb
         jKYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e16-20020ad44190000000b006589f216161si7608972qvp.442.2023.09.26.22.44.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Sep 2023 22:44:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qlNLk-00042b-09; Wed, 27 Sep 2023 01:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=wvUH=FL=kaod.org=clg@ozlabs.org>)
 id 1qlNLi-00042D-D5; Wed, 27 Sep 2023 01:44:38 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=wvUH=FL=kaod.org=clg@ozlabs.org>)
 id 1qlNLg-0001sc-6H; Wed, 27 Sep 2023 01:44:38 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RwQXl4R77z4xPc;
 Wed, 27 Sep 2023 15:44:23 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RwQXj4kfLz4xGR;
 Wed, 27 Sep 2023 15:44:21 +1000 (AEST)
Message-ID: <bf0703cb-3626-a3e9-efda-842cd0393f37@kaod.org>
Date: Wed, 27 Sep 2023 07:44:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Qemu-devel] [PATCH 08/19] aspeed/timer: Fix behaviour running
 Linux
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190525151241.5017-1-clg@kaod.org>
 <20190525151241.5017-9-clg@kaod.org>
 <a4a62040-0127-4f39-4fc3-a1795e4daad8@kaod.org>
 <CACPK8XcCn4hK5Lu-6o7LUyUFVH-dkbjJ-1_fHr4_90_4cZf_+Q@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8XcCn4hK5Lu-6o7LUyUFVH-dkbjJ-1_fHr4_90_4cZf_+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=wvUH=FL=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.473, SPF_HELO_PASS=-0.001,
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
X-TUID: UPYHsX795FRz

On 9/27/23 04:12, Joel Stanley wrote:
> On Fri, 22 Sept 2023 at 13:21, Cédric Le Goater <clg@kaod.org> wrote:
> 
>>> +    t->start = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>>> +    return calculate_time(t, MAX(MAX(t->match[0], t->match[1]), 0));
>>
>> This MAX(MAX(x, y), 0) looks strange to me. Would you remember where it comes
>> from ? Thanks,
> 
> That looks very strange. I think you've sorted it, so I wanted to
> bring up the MAX macros themselves. It's unfortunate that they create
> a non-unique local variable. Are we allowed to borrow the kernels
> macros? They have some infrastructure for creating a unique local
> variable name, as well as handling the const and non-const variants
> with the one macro.
> 
> https://elixir.bootlin.com/linux/v6.5/source/include/linux/minmax.h

I believe that's what Markus does in its own way :

   https://lore.kernel.org/qemu-devel/20230921121312.1301864-8-armbru@redhat.com/

Thanks,

C.
