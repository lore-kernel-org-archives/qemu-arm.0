Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp1510130ejm;
        Fri, 22 Sep 2023 11:22:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKlpJE1DJu1BaSM2iWEDKSoyfs64RRnrh75jB0xNuwFCwSRVBD33CHI9Z9tAd50erx3ZH6
X-Received: by 2002:a05:620a:3186:b0:765:9391:13e7 with SMTP id bi6-20020a05620a318600b00765939113e7mr315837qkb.49.1695406961320;
        Fri, 22 Sep 2023 11:22:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695406961; cv=none;
        d=google.com; s=arc-20160816;
        b=pUqyTRF92J3PHEQzMKmyVm0wSLvHXDfhCptKbCJKL6GNYu/h01bgJiqIl/+o6tRSvt
         1h0oS0dWM8rbxkfmQ7q9+L380rfgguIupVAZoCCasw55H/vjGHIR3/UEj2fUofxYwNVL
         Jp6CXR0Jmz5cB1c5Cu8RUp0iXt57vEMW08W6i3Xo6vOOZYpsBVcOZMHhza2wCf+NQmtc
         aL2K3CxbXE8YdpPrxdD/bGuHcHjgp6Y+s/Awk331H292OLf3yQfaRVE6EflqyLFMfIqf
         206Ojq9wwqXpYgEH7WND5LLWwG7mkLGs5/uB9Wwo0GfElDQrEJkQ0KeRlB6DRlBN27Fg
         vAqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TzcTfdX9aeSr7V6aiUD55g2o2awpIPFdj+aa3CZBmT4=;
        fh=MKvEl5Dqf0X3NpnYvSQYgJcpLJkVvhv54SSWkojjKxU=;
        b=fC2LvZehnAunnqjEZoaZ+7WggnFlzdVuULjluK6Se8QPic8XzniYSgj+HOeClm+wkD
         vmkmvsA/h7bTiiEFa27bpQ4clSqObKfwx72vrZzHPBtX3KkBWG0yC/sBpQX+x2BCfo3u
         LWlrV8DL/sLDqp5nTA0iHJRa3RzheMNzv4z4FHUGGdi6fLVs9utyYc6wJ0E9nPJr+qsg
         +5n/IU/OmtdUQM3pt7Jy4kcrBQC2vUvjCL6keJgY/BZ9Fh9gywCByrZ3xEFwfETLmhSC
         AvRzCCQx+KHWFkOh0MQeqP3hkGtbjYU3+GXqyNsgyfW7Yg9fNA+FtxPccsk94qFr9+Zz
         jlLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c4xPqcFz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq20-20020a05620a469400b007742059b2c9si446770qkb.482.2023.09.22.11.22.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Sep 2023 11:22:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c4xPqcFz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qjknV-0004Zu-PZ; Fri, 22 Sep 2023 14:22:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qjknQ-0004ZM-VT
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 14:22:33 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qjknE-0000tc-1P
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 14:22:30 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-31c8321c48fso2823373f8f.1
 for <qemu-arm@nongnu.org>; Fri, 22 Sep 2023 11:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695406938; x=1696011738; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TzcTfdX9aeSr7V6aiUD55g2o2awpIPFdj+aa3CZBmT4=;
 b=c4xPqcFzGNhkqBx2pruCzd/yuc9ltEFoned+MEL1I+ZjGH1t/3Szbvicu79yiKKw07
 m6Vs2qoMxgfDMgZOZ5MJdFKOXCit31S7IM2dYlFyLf79dJWDLyZnJpNTSIUtXNWX1F19
 6ZptMnChPcKNa11T2DpcZ0H4C3eTCyAH7zxgLZFazHJHgon/ELkihswrQEK/eAr0zhVz
 /UBvexkSzX7ODqeQ7ux2UeQpa3krvyTMHF4NDR7bWULuOmTVQiDwa3i9JRHg2pcOWrv8
 iX6IrEC9TstNJ+Rs25ODlGichurlbfUjN6PxqqG0WsVyPKGX8uHUcVnv8C1mkrxevyYK
 6vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695406938; x=1696011738;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TzcTfdX9aeSr7V6aiUD55g2o2awpIPFdj+aa3CZBmT4=;
 b=t/66Ze3nFjBEqrIZYMQIPhH4JVhfwizBIpZyABY3fZtzNLCk9LEW+dlxu6zDo3us1N
 nNAIfrhtZOq8BCQph+qUg3XNiIUvl8gcDyj6zUoYKsyXWCFO/qL48XVFXf4Q3qe4yo0P
 zxIyb0r2UdW86daXIdnJt3ALu3by8h2j5dhhwHw7kzxl+IDv/m3W1BB1KjpzhXkpvvWs
 lTB0uqJPULt+qgjSYuJezDeYLSEyPHFHDvejL+v7clKMkSX4lLXlKSsNbk3/gMdz2Dqf
 8zuyfHMBVuiS4YegPAIkcz8ROcHwjx9FuOWtxNGkaUpiiGP5PxqyZUhJAeMNzlwgJRdK
 D5ZA==
X-Gm-Message-State: AOJu0YyJJhx5FJ/UVIyg57ReaMe/ZU+qiBAku4O7Oq+PWGv3HftadJoD
 64sZDzVZbujuYH9EoQpCofnk5w==
X-Received: by 2002:a5d:4852:0:b0:31f:f710:a943 with SMTP id
 n18-20020a5d4852000000b0031ff710a943mr2435415wrs.15.1695406938459; 
 Fri, 22 Sep 2023 11:22:18 -0700 (PDT)
Received: from [192.168.192.175] (181.red-88-28-23.dynamicip.rima-tde.net.
 [88.28.23.181]) by smtp.gmail.com with ESMTPSA id
 b12-20020a5d634c000000b0031ad2f9269dsm5043110wrw.40.2023.09.22.11.22.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Sep 2023 11:22:18 -0700 (PDT)
Message-ID: <b96eed12-c2a7-9d56-19db-6118730ac26b@linaro.org>
Date: Fri, 22 Sep 2023 20:22:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 1/4] aspeed/i2c: Clean up local variable shadowing
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>
References: <20230922155924.1172019-1-clg@kaod.org>
 <20230922155924.1172019-2-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230922155924.1172019-2-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: tRLdMwhVUfzf

On 22/9/23 17:59, Cédric Le Goater wrote:
> Remove superfluous local 'data' variable and use the one define at the
> top of the routine. This fixes :
> 
>    ../hw/i2c/aspeed_i2c.c: In function ‘aspeed_i2c_bus_recv’:
>    ../hw/i2c/aspeed_i2c.c:315:17: warning: declaration of ‘data’ shadows a previous local [-Wshadow=compatible-local]
>      315 |         uint8_t data;
>          |                 ^~~~
>    ../hw/i2c/aspeed_i2c.c:288:13: note: shadowed declaration is here
>      288 |     uint8_t data;
>          |             ^~~~
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/i2c/aspeed_i2c.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

