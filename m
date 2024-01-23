Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp617892ejc;
        Tue, 23 Jan 2024 14:51:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGm9bdYC7iD4IML5hBk/Msyx9LOnrZeKA4nOQbgyx16/2G6/ADIMUMDdkB2lfBr3N0G56xa
X-Received: by 2002:ac8:5dc9:0:b0:42a:4e5e:c99a with SMTP id e9-20020ac85dc9000000b0042a4e5ec99amr496574qtx.29.1706050284443;
        Tue, 23 Jan 2024 14:51:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706050284; cv=none;
        d=google.com; s=arc-20160816;
        b=hFrlNc7eqU4+bE0fpcHIE3c/VxiLqLOc61lhZ/mrSBm4SLA+IlTRK2ZMLu6hpp1ZEJ
         CDRyJz5iEkZRNMoQy1YmNo5VLCMpo9v+SVKNsP3PryqtvG1tmDVY6Aey+s0rgQNhGNgw
         Qqdh99JL5IJBpuLtxP0cZvBlhJH5W/yUgekA61jDikWxu9uB4R4S0sptn+3snopeZW8h
         6veA+hGItJ0jvj9DDGIj/9gtyoO6VJt6tgfI1ojQJS7UAqSDLPHNiHlabQ2sAU/mny61
         1mvNuSxSpcpmBy6x20n3L5v7aItgzso3LlExC1YARnNJ1a1JSNxiXsjoZHdluxnIvfK0
         8/5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=s1GQ6gQkNHmdyIztcc/OZaeE+FdOD5+FKIj80DpHp+c=;
        fh=Bm17Hff6DA8sVJ8pbt7eoqICiW7OMPMGH1guDL3Jk6I=;
        b=G8eRZrkWJSrAgA1y7dlPsKevc74l2NT3oBqoWosorhyzkvnP97isl1H62KXns2eHsr
         OrBRqrJcfKQpPKmxwZ6swV3NBf1ZergNv4TxTiVUJ7Qs1rSmqfRb2GK0JXrJ61VmWlRP
         /wYJWAo7nihi0yecdEuqDEs8geyuwhdBe/T+9RCU9rozuhid8vDOZlR/sT0YB+ve4JS2
         bNFbakxoChUq/PDoZqKgk59W3qWQV0MJ/FPfF8Y08F3RlcVKpTIQdzpIudY7w/uFjZA1
         Fsxunirk6dKchw6DNL7zAqOztS3RVBvIVEo0AlfjYBUIsj3tU8coNIGjK1QE4YiDzOTU
         uEGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k4v8Mumu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11-20020a05622a134b00b0042a5cae47c4si112675qtk.666.2024.01.23.14.51.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jan 2024 14:51:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k4v8Mumu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSPbn-0002aX-43; Tue, 23 Jan 2024 17:51:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSPbm-0002aP-H9
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 17:51:06 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSPbi-0004qo-Jo
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 17:51:05 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-55a45a453eeso6181600a12.0
 for <qemu-arm@nongnu.org>; Tue, 23 Jan 2024 14:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706050261; x=1706655061; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s1GQ6gQkNHmdyIztcc/OZaeE+FdOD5+FKIj80DpHp+c=;
 b=k4v8MumuC2Id8LuRUEcinJiVAnCioh6c8ocmvWKB2zMHhyWuYmuCIWFyjJJxT4gPVv
 rs8ITVKu+R1cPGtcZppUSdS0pmXkcbGIrt7Z9hVYHcJkfuXD+b1P/SJrwTy/QzIRfw6t
 6W8U852U+HYlklcNSRvLUcqrthh2MrvYqJUZ1CuUB1Bow1bDEe76liGr+0S5PXDAb8rX
 Z5vcO2n5nfQ9CfpXrV+onmMNUuAar8Qk8Pl2cKuB1ZjxRVxzV3C4FLJCPxqT48+F/ekW
 w1kvjxumncU4Hlv5dulm1f8cUAKxvGn8JdunLocl8mZ31Dvt3PsoC03WNSKQ9IN0C6vs
 nPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706050261; x=1706655061;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s1GQ6gQkNHmdyIztcc/OZaeE+FdOD5+FKIj80DpHp+c=;
 b=kGpA76iE548X5/m92JTiZ6aKQc42LrBAtqRxG9kk7d4znl9CyJkjTkCl/mSDejBNS+
 WYEUq0cS81ebp9i3MZL59i4exGarVVLc8v2LdshkDDz5xGF2P+De2/gwREKN/UQ2bHuo
 MRWtdfeeH1XLKhTNCh1TUKFa53i2BMlk04KKXd+oA7CVxgSuCW81qDKpKR2T3k/MXZLh
 UhQ49vVdNCVYokFRUe6SYqCNcm5CbUz0UD/QREfbtOXU+kkIFu+YGVJIF8I9Kq6b0e53
 8XPV+ROauxfL+ZC+w4AsW6tlE9nFbNoutitRbwPiHkg9lokpdrlRK9lHIBkUY+9nbQxX
 RqfQ==
X-Gm-Message-State: AOJu0YymQ43lTd0Ic3/GQPvER6GFmuncXjf7z56Su+MYx5Tg/Ka+xarE
 lVhBBkdX7YSsyTzsppY/YP/C/7P9Qs05BSHUwU528E/S3hQ85yBQErNFWVeh5yQ=
X-Received: by 2002:a17:906:5387:b0:a29:3c2b:c911 with SMTP id
 g7-20020a170906538700b00a293c2bc911mr288361ejo.63.1706050261030; 
 Tue, 23 Jan 2024 14:51:01 -0800 (PST)
Received: from [192.168.69.100] ([176.187.194.78])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a17090608d100b00a27c463fbdesm14786608eje.211.2024.01.23.14.51.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 14:51:00 -0800 (PST)
Message-ID: <f45b4746-99f7-4cd5-a806-f9a9aa269d08@linaro.org>
Date: Tue, 23 Jan 2024 23:50:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] hw/arm/aspeed: Check for CPU types in
 machine_run_board_init()
Content-Language: en-US
To: qemu-devel@nongnu.org, Gavin Shan <gshan@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
References: <20240123224842.18485-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240123224842.18485-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: yX9i0BgLvxyC

+Gavin

On 23/1/24 23:48, Philippe Mathieu-Daudé wrote:
> Since v1:
> - Follow suggestions from Cédric from [*]
> 
> [*] https://lore.kernel.org/qemu-devel/e13c655b-7904-4e47-a673-4efd13c26b3d@kaod.org/
> 
> Based-on: <20240123222508.13826-1-philmd@linaro.org>
> 
> Philippe Mathieu-Daudé (5):
>    hw/arm/aspeed: Remove dead code
>    hw/arm/aspeed: Set default CPU count using aspeed_soc_num_cpus()
>    hw/arm/aspeed: Init CPU defaults in a common helper
>    hw/arm/aspeed: Introduce aspeed_soc_cpu_type() helper
>    hw/arm/aspeed: Check for CPU types in machine_run_board_init()
> 
>   include/hw/arm/aspeed_soc.h |  4 ++-
>   hw/arm/aspeed.c             | 70 +++++++++++++++----------------------
>   hw/arm/aspeed_ast10x0.c     |  8 +++--
>   hw/arm/aspeed_ast2400.c     | 15 ++++++--
>   hw/arm/aspeed_ast2600.c     |  9 +++--
>   hw/arm/aspeed_soc_common.c  |  8 +++++
>   6 files changed, 65 insertions(+), 49 deletions(-)
> 

