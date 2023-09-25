Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp512259ejc;
        Mon, 25 Sep 2023 09:29:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEV7c2RTYGHRkEg9RXaQm+17/ZRMwWvzHXpKWozKeHtsQE7NwKIlDmchbf3o9p04fFJ6M4Y
X-Received: by 2002:a0c:d98b:0:b0:658:1eec:408a with SMTP id y11-20020a0cd98b000000b006581eec408amr6728350qvj.40.1695659367979;
        Mon, 25 Sep 2023 09:29:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695659367; cv=none;
        d=google.com; s=arc-20160816;
        b=CWupdusGnC3+iW62r7B654qXXlFTcp/oT9MTUho6rRrdWEa0vjQ0GvVchfWSYyv5rT
         f9Kusg1/z0/uqFc4fp8Hq/DnFLydhy4e+dsnRIcv3afVivQj2KYCOrk5hy5SDfXFAsuy
         3Tqwd264/2oX9vPsoO2kKRz29THtib+HX9qRYkRn/rtRe+gjhfAaEVHak3WqEeFAs3ki
         3kH+0oES3QnTe3+xfXSDmw48vS2lTEiueOOK7fxM9jnsKU0YQHluaiB5oe+wB+wEfx9s
         bepiRY09eUA/ZH5EQlCUhU2i4MPbJKIGw/lSLQbZ2u5lamyN9G2d57En2W9wB5AeZmeT
         YFtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=PmFEjZkTCdgZOEGMgmklc7SrMzaWlSOLVc193zpFlD8=;
        fh=ojn6UO66R7/n4EAe4edBUNJTjOLd4lCcUiOSn8dLjlc=;
        b=mW/uADzG3HjbaryRg7bfHA5F6Ub7EGQGEcCS8/WZbs2X003AFOZHMxPxwWbm7AYmIG
         2LRSQWmT/nn/AvKr9HB/uvAk3TRNMQ9FUEk0yFRtCRWnd9prjAj8D5+zHbW8CZUX6Mb6
         ethon55y6LCSJfqp8G8+SCaAegsmSM2zIvZceYVHxtFtmm0hBvG+xLWGdZyAEy6S/cB8
         3cJkldZNgSKN+K1ksJimBuHj/LKB901y6Z2/wBq3CC9KxW6ef0mUBIv7axAck+IomTfM
         XDxdcLiujjkQSCzHXjezkyzHRPJYCm6vtwKk8EdDAIqnqteY+uvNRP2/RKHtLHQNxl2P
         tl+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d26-20020a0cb2da000000b0065af1fabaf8si3792703qvf.286.2023.09.25.09.29.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Sep 2023 09:29:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qkoSN-0002Ua-Oz; Mon, 25 Sep 2023 12:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=n5Cv=FJ=kaod.org=clg@ozlabs.org>)
 id 1qkoSM-0002UJ-9O; Mon, 25 Sep 2023 12:29:10 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=n5Cv=FJ=kaod.org=clg@ozlabs.org>)
 id 1qkoSK-0003Ft-2f; Mon, 25 Sep 2023 12:29:10 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RvSxS2KFYz4xPM;
 Tue, 26 Sep 2023 02:29:00 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RvSxQ09JJz4xQ1;
 Tue, 26 Sep 2023 02:28:57 +1000 (AEST)
Message-ID: <6e17b750-8e07-874d-05ae-fae05b2cd804@kaod.org>
Date: Mon, 25 Sep 2023 18:28:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/4] aspeed: Clean up local variable shadowing
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20230922155924.1172019-1-clg@kaod.org>
 <f7cdbd47-1833-af1a-ae09-363c86c2e74e@linaro.org>
 <838837dc-0d95-1d6c-3cfc-e321c9c01a7d@kaod.org> <87msxdmkeq.fsf@pond.sub.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87msxdmkeq.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=n5Cv=FJ=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: DMC6XWrvfdFG

On 9/23/23 09:13, Markus Armbruster wrote:
> Cédric Le Goater <clg@kaod.org> writes:
> 
>> On 9/22/23 20:20, Philippe Mathieu-Daudé wrote:
>>> On 22/9/23 17:59, Cédric Le Goater wrote:
>>>> Hello,
>>>>
>>>> Here are cleanups for local variable shadowing warnings in aspeed models.
>>>>
>>>> Joel, Andrew,
>>>>
>>>> Could you please double check patch 4 ?
>>> Could Markus' MAKE_IDENTFIER() help there?
>>
>> ah ! you typed too fast and I also read too fast, as :
>>
>>    MARKUS_IDENTIFIER()
>>
>> and I liked it :)
> 
> LOL
> 
>>                    but what is MAKE_IDENTIFIER  ? really, please explain.
> 
> Philippe is referring to
> 
>      [PATCH v3 7/7] qobject atomics osdep: Make a few macros more hygienic
>      Message-ID: <20230921121312.1301864-8-armbru@redhat.com>
> 
> which tweaks MAX() to permit nesting without shadowing.  Your PATCH 4
> may not be needed if you base on it.

We don't need the nested MAX(). PATCH 4 is a cleanup which happens
to remove the shadowing. Let's keep it the way it is.

> MAKE_IDENTIFIER() is a helper macro introduced in that patch.
> 
> You can fetch the patch from https://repo.or.cz/qemu/armbru.git branch
> shadow-next, along with collected other shadowing patches.

OK.

Would you prefer maintainers to include the shadowing changes in a
potential PR they would send or would you rather take care of it in
a PR of your own ?

Thanks,

C.


