Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp1509347ejm;
        Fri, 22 Sep 2023 11:21:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHorXvxhB/v91kedEHa3v4Zfs6XgiReJuHH8f+up5nYAOrlDd2gXhgfIVRWtUKivH0Yc/Br
X-Received: by 2002:a0c:e349:0:b0:655:fac7:19c0 with SMTP id a9-20020a0ce349000000b00655fac719c0mr33919qvm.19.1695406874909;
        Fri, 22 Sep 2023 11:21:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695406874; cv=none;
        d=google.com; s=arc-20160816;
        b=i7ak/gy5MbYPSjw9NKXob1iyenv0v08msdw6r3KRVns+vQLG592BzFlvLf1iQqyGv/
         jCGBb/NrEo7l7hy7dqpTrXgGUMRAO/LzObFcBEyxZrCusIQHdOiEN/KYd4TjLCYPF2sw
         +dAgazUKaMZ2ObvdItYQJ6jIFXZYE1Fg02JOhuSBZpRUz0MkAwfAyYi2SQpAhEwGEoiK
         LyO5JkGxzUgl+iDE7/n4DepiBw5B4crKOsv5hIimLrEn+eX7uabBtNZfI2nwRUFYns37
         WpGMODsPtJdIya+Pp2VWZhRgxDZXP1KNcbliUDVA9lrHaTfJ7H4cTMTvocKc004Dy+k2
         d0nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BQwwpk6zDcYTAWtN8tfhLcRVuhh1lD1yqRmaGfSeR+w=;
        fh=MKvEl5Dqf0X3NpnYvSQYgJcpLJkVvhv54SSWkojjKxU=;
        b=EQLfz6viE84S1zMoJX2eWqX4bB7ChwtDgtATdcJZXu4s1PC5D2zW62G3DOCSTGSZXi
         sNNgRuZoFvXopFosCYKm8cdyZUg12PBw67KCTsFmpi+VMAEtIwy4/GUaZYJQ8gnlhwDK
         VgufnN+QBQkjDbq+zhcTYQv0wK7//YHAqTIEXah8X4/4Mn8/vuDc+vW4ACVGvPRSaqCH
         Sf5taNf9+wHFpLtspg+PU9Zb1Pt5AvEKm9mM4lWRSZX5OFPWJzckyuVQOcgQEqFndRBi
         PGhrBDLvTvwpLsx7zkg56+Lh80mf5AT9o8T87wXpV6DuEwmb4PHnjHikQobNgnas7hQm
         AdVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AUrpIos0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id om26-20020a0562143d9a00b0065895240278si2695763qvb.537.2023.09.22.11.21.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Sep 2023 11:21:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AUrpIos0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qjkm1-0003o2-SS; Fri, 22 Sep 2023 14:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qjkm0-0003ni-9w
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 14:21:04 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qjkly-0000kv-It
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 14:21:03 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32164a6af64so2211054f8f.2
 for <qemu-arm@nongnu.org>; Fri, 22 Sep 2023 11:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695406860; x=1696011660; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BQwwpk6zDcYTAWtN8tfhLcRVuhh1lD1yqRmaGfSeR+w=;
 b=AUrpIos0atcJETl8lA8sjJxAHkkT+rUZYAyzIlYwyRF5O/s02tm2doSVNzaxixeDOG
 ey+7YCI5Db/7AH0SX8mS76ZL6vs/d3QUNMEPVCZ9ZzM+s7mWtZaQ28sV0qI063gMVq6g
 MhGNgQrJa5vNX27OLbbVU9bt6dffEdHBfaMM+HqvLW2HItz7GAwhnUhlDMXPqq4wRYD0
 sQxCJnkZwwmvpf0GmOoJw34kwbrRERP2O6MJalFaufE8YDbBkcoHkH4Om6fSGb4tSu78
 fPAlCRhYIam5LdWn6qBzlvQ7JAgtGK/2qpDi2BBewO9vCmZdKydf+08VTfq/B4nYYpf0
 9XLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695406860; x=1696011660;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BQwwpk6zDcYTAWtN8tfhLcRVuhh1lD1yqRmaGfSeR+w=;
 b=oXFDGAybUi5JZInesSiEeFjUUQ/RebGtNMFQ8IJKujNmVSYcA7DVbiLmjUx5Uo4GmA
 TMueT5KRtcGZYvvh/auzoN7iXXcyOE8MlmaQeGNNjpE7z5AirKSJ/RiiW2FabpXDZfCa
 VpLyK5EhfBbB0CLTOudWjNijcqz6f/dMrRuzrfrt1KxtDHEwgwSyAxfEivAeKyngW95S
 azr1c4+EyyWtsG33bbicaIvquhtEV/q93voDb0n7iaa3SYQj8y4hwWN4vvs14jPSl9TW
 k602pTIfxDwhKKz01dinMbqEWP5yn5e05zxKT5pjTBUF5MXIKypyzyjVltqa9qINkHX/
 takw==
X-Gm-Message-State: AOJu0Yz1tHpE32W4bH7bgPNk8lwECyc0FVwP9pXEYp8+nbEyTTtQW287
 hL55WvMw9oOODityHMiluuN8Pw==
X-Received: by 2002:a5d:4fc9:0:b0:320:7272:8fbe with SMTP id
 h9-20020a5d4fc9000000b0032072728fbemr507330wrw.17.1695406860611; 
 Fri, 22 Sep 2023 11:21:00 -0700 (PDT)
Received: from [192.168.192.175] (181.red-88-28-23.dynamicip.rima-tde.net.
 [88.28.23.181]) by smtp.gmail.com with ESMTPSA id
 a4-20020adff7c4000000b0031fc9402b47sm5115531wrq.4.2023.09.22.11.20.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Sep 2023 11:21:00 -0700 (PDT)
Message-ID: <f7cdbd47-1833-af1a-ae09-363c86c2e74e@linaro.org>
Date: Fri, 22 Sep 2023 20:20:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 0/4] aspeed: Clean up local variable shadowing
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>
References: <20230922155924.1172019-1-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230922155924.1172019-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: I1kOnRIvswVK

On 22/9/23 17:59, Cédric Le Goater wrote:
> Hello,
> 
> Here are cleanups for local variable shadowing warnings in aspeed models.
> 
> Joel, Andrew,
> 
> Could you please double check patch 4 ?

Could Markus' MAKE_IDENTFIER() help there?

> 
> Thanks,
> 
> C.
> 
> Cédric Le Goater (4):
>    aspeed/i2c: Clean up local variable shadowing
>    aspeed: Clean up local variable shadowing
>    aspeed/i3c: Rename variable shadowing a local
>    aspeed/timer: Clean up local variable shadowing
> 
>   hw/arm/aspeed_ast2600.c | 10 +++++-----
>   hw/i2c/aspeed_i2c.c     |  1 -
>   hw/misc/aspeed_i3c.c    |  6 +++---
>   hw/timer/aspeed_timer.c |  2 +-
>   4 files changed, 9 insertions(+), 10 deletions(-)
> 

