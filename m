Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp1510815ejm;
        Fri, 22 Sep 2023 11:23:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIOBWtc+Bziy2Y+A2FSOOqGGKgB13+lX/RMMGd5tWd9egAwBHqhfrhvNfqeMZJaYPIHjxw
X-Received: by 2002:a05:6870:c691:b0:1bf:4f5e:55e2 with SMTP id cv17-20020a056870c69100b001bf4f5e55e2mr271425oab.53.1695407039505;
        Fri, 22 Sep 2023 11:23:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695407039; cv=none;
        d=google.com; s=arc-20160816;
        b=AJg+8DmQJdJthEHsepP95uGF3SjR6+KadNU5ONu6wnZGiQP1688QTaIujSLGJuj/8C
         OOLpy2kNjSVppGXEcI1kRBpxvtugBzphSUa8NwwWBRsQaNpLAVCAW3A5kGpyam6FNtdW
         5osVW9wHo35S00K7iVuNDBotrqiex4X95JMHi3g1IASH+0gwfPQ4wwuzZspPIqAh7Mws
         HOXKyayzte1tkCUo3EQhJ4xWE2TfIHhoSisFTZzReOZBMfZuVTgB+qaDBi4Z7fxcHq/i
         cWPJ6wFSTrT6MU8zxSPF3W65+iN9C5bfU43uaypBIebDE2lQcsXy+3lB2HAH0b3xEwMa
         6L9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=IaVutyAwfwZZbfy1I7/I3UWY7YNzk9NYg8AD4SguaAg=;
        fh=MKvEl5Dqf0X3NpnYvSQYgJcpLJkVvhv54SSWkojjKxU=;
        b=c+NrX+F1R5sKXgVm6IfnhiYp5WpkVWBwy8CSWOJ/iLoyXBJCE8I4+gx6jw1toRw+th
         EczQRtYY9s7n2S5EBunT1FGeEHVaQ97O/yE5aKSmmTMUl4TTSUVXMk4KsUnTVngbsnhN
         uPAdAmV3QyHx7pLVAIEjU+FlY2BJY+sZvvy/ocqxHYbrrw1fbmxgspAo/3aap8u6cDjY
         jF/Yz5+ceh6Dl+GngEKi0FLdvW9bqb6JkoooQGTv4Qrg6tbBlGsll8aOgmbALT4CASVl
         qQ+S8/oBS+JFxLzC7onI16TctXdsOa4kTnJDsTshrdUwzcsCOpAThEAK32LFVGMRO6i7
         dedg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wF58YHUC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5-20020a05620a298500b0076dad09277asi2760592qkp.408.2023.09.22.11.23.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Sep 2023 11:23:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wF58YHUC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qjkoY-0005IW-EO; Fri, 22 Sep 2023 14:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qjkoW-0005Hv-Jk
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 14:23:40 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qjkoV-00015l-3E
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 14:23:40 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-32172f8a5dbso2318693f8f.3
 for <qemu-arm@nongnu.org>; Fri, 22 Sep 2023 11:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695407017; x=1696011817; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IaVutyAwfwZZbfy1I7/I3UWY7YNzk9NYg8AD4SguaAg=;
 b=wF58YHUCatIVm+Y5pWZFxcsIV6ZY7hwAsu6Yd+u20M+dDWqBg0Ogv6hgEkWDNwmqY0
 sAbQkzFc1uHon2cXOJJm2RIvoO1cPGILGymjriwn9caeiK07NlWTXzhmGXrSnLqyF5Xu
 Gq7lKcfUPg4TQboU4crhAFwPF7XZPGH4F1p1EFF3uZzzPx+nPGZd6xNbiobwp+azXsNb
 lmtp5bBSVRg4SBhPKBGqDQuAJfKaicGu5WjZpYLAbKkDVT/z1Tx0Afcjvle4AYwbEQsa
 wSCwQvmdR3czcvXRbGmtnRLqRsS8XCKVb7L96uEh6hO7KDmLIUS8BI452Lx7XKsmxaxi
 GTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695407017; x=1696011817;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IaVutyAwfwZZbfy1I7/I3UWY7YNzk9NYg8AD4SguaAg=;
 b=FVVVX/aN8kgT1jw1RrZ0WNBQCtZ/qQcxu1NAwkzw2cdXzANpex7aBHTFbkUI+bCWlt
 yJze3k4CjHwie+8aIsqsGd58rbvMBMGqa025jbooeOxKmqlzRj3bs12lcIIiLmb2/hI+
 oELMutBEqeso2CFCZHMm7vHljWa8YpC0eYc+rooEaRaafSiQLTTRnJOwGjsSmrXsZhwS
 rk9KHhBQ8QVVdyaXoWu4tLxOGXRDI3oNLyRaJKmXEoecrV0q5zuF2tJJ8bIJ2ZdBC4MI
 ClmYSPcqBDHcO+WB8ElF+Q3w24+xmgMnxjzLHcGj6kVSXVxrv0Yx29XqfUur8N3KN6gd
 5Qtg==
X-Gm-Message-State: AOJu0YwmiUuSg7FffvDMbniIQOKfM6P1CNiE3poirQlhVT749nFxHyxO
 8c54WEHfu72GIEXSUQHPXkTKgQ==
X-Received: by 2002:adf:f58a:0:b0:313:f463:9d40 with SMTP id
 f10-20020adff58a000000b00313f4639d40mr351218wro.65.1695407017460; 
 Fri, 22 Sep 2023 11:23:37 -0700 (PDT)
Received: from [192.168.192.175] (181.red-88-28-23.dynamicip.rima-tde.net.
 [88.28.23.181]) by smtp.gmail.com with ESMTPSA id
 e10-20020a5d594a000000b003180fdf5589sm5107382wri.6.2023.09.22.11.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Sep 2023 11:23:37 -0700 (PDT)
Message-ID: <bbea6e2c-d6a9-7b7e-13fc-a76ad31775b6@linaro.org>
Date: Fri, 22 Sep 2023 20:23:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 2/4] aspeed: Clean up local variable shadowing
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>
References: <20230922155924.1172019-1-clg@kaod.org>
 <20230922155924.1172019-3-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230922155924.1172019-3-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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
X-TUID: m08VeP6JZv31

On 22/9/23 17:59, Cédric Le Goater wrote:
> Remove superfluous local 'irq' variables and use the one define at the
> top of the routine. This fixes warnings in aspeed_soc_ast2600_realize()
> such as :
> 
>    ../hw/arm/aspeed_ast2600.c: In function ‘aspeed_soc_ast2600_realize’:
>    ../hw/arm/aspeed_ast2600.c:420:18: warning: declaration of ‘irq’ shadows a previous local [-Wshadow=compatible-local]
>      420 |         qemu_irq irq = aspeed_soc_get_irq(s, ASPEED_DEV_TIMER1 + i);
>          |                  ^~~
>    ../hw/arm/aspeed_ast2600.c:312:14: note: shadowed declaration is here
>      312 |     qemu_irq irq;
>          |              ^~~
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/arm/aspeed_ast2600.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

