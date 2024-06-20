Received: by 2002:a05:7022:f201:b0:7e:eb73:5b3b with SMTP id rf1csp1653364dlb;
        Thu, 20 Jun 2024 07:20:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+YiN8dv+oMAD9z+ss23QQnQAuggCNt6UcQHhafoIUzaS6As9iWDn7A2Mb4KQ2j4nZqzDXL/TmBM0Q1pQ1aMV6bhLbH46c
X-Google-Smtp-Source: AGHT+IGvqV1mU14IFtwktIP3wN+p5V8fCMao6udJz9quf+/AinmWzMRTam6U5/QsrwuwZyYE0n4R
X-Received: by 2002:a05:6830:2002:b0:6f9:c46e:af77 with SMTP id 46e09a7af769-700752aaf80mr6625034a34.17.1718893249985;
        Thu, 20 Jun 2024 07:20:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718893249; cv=none;
        d=google.com; s=arc-20160816;
        b=RbPruppzg5Rqpjsm3BiClChZsJyykO1Vf8pIf31XSkiY6xBQMSuyb+gsVZRHe36HMf
         UOkcvKOjgvjtHXiyTJ7Jkl8MPxF2G8d2YMMY7H1v7JwHxwnPZ6av5HjetyR7YCow/bZc
         X7rDPOw9HeHTGfUVCl6u7bZIuHweyNPNWsheIVLJUhdyuUhoUPdgW7fWtCsb56PR4lZz
         xM12D1bTPWjuYB+DuOa6pwvoiYDzoTYaqzBl8wAv4+KGSwRgG9MYVDldy2xAjwQ5tg8i
         7XVdQWNquJ7r/+gk5t3VJZDUzbaTuDxirIq9H7lXaUw8D3vrMBP2fy9drVdm4biVBAC8
         enqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=mVya9DJzD9bylNtCQPe8SLuSJyriwTot/7zJT0BCCqw=;
        fh=xEkqWc1LPeWdYd8kTmAjrOsAlWFBIfM1C+lkKJIBcJ4=;
        b=n16zjiGg12HCIeyNErB4l2IsJrfXwrfQ/pT4CFfJAr+/V8YOr2pkAu1v8wzwwX6W19
         I4M5d+gSaLGL9gwaZnYbNl5Uo9iYpenUfvVojqDlcjz7GzgjP1XSdaffATkVBMPaCqD6
         oLolhlnNeGw8VfnyrY8JYAmPtZo2/E/EdU/+w+z17tOySYsIs8Qu1YHtFIHwejuYMjWo
         jUxfALSqwR+EvdIA5tsZrz9Qu38ylJA+WOWZP7aSReM3Fv0h4YPusi4ml0DSgQAS/2kq
         2i2KulZqRbyRk9V1VETtC/3DsAmu7ySCfQjvCsP8HTLDj0JcnooDRSK/ewA/Bq7SkhGY
         1c8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ylOuzOM0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b506c7a5b2si6987876d6.247.2024.06.20.07.20.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2024 07:20:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ylOuzOM0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKIeS-0001NC-M0; Thu, 20 Jun 2024 10:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sKIeR-0001Mu-CC
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 10:20:35 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sKIeP-0004iA-OE
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 10:20:35 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3629c517da9so1026882f8f.2
 for <qemu-arm@nongnu.org>; Thu, 20 Jun 2024 07:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718893232; x=1719498032; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mVya9DJzD9bylNtCQPe8SLuSJyriwTot/7zJT0BCCqw=;
 b=ylOuzOM08MmY+DL6gPdsOjmGdG3ELZx6p09KyHLRGSPG7Cc2313d9BotD+KMfhfVfz
 N85Cd2NWy99GoQW5Xe08gled1YTFZToMWw+w4wHuWK91RrD9iUYvUWIQQKYuspnmBwew
 DXReC4TZz8SOdF+Vh/hmbN/3E3i2fIYZPnBM5TEv5WXSw9l2BHOmE6rIklnFPg/8YW1w
 mavSxFB2ASWPJsejX//dn6r0nRT50NzQZGAeH3s75qNjOsgP2KO6p6iQkLJsk0yjWfuN
 vynBXM/0/JVBtD+gN2g8xyZ4xFnpnc9veUy+1RWj7aJ4Q98ac9zyp+2zqivupbv8EmJm
 pJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718893232; x=1719498032;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mVya9DJzD9bylNtCQPe8SLuSJyriwTot/7zJT0BCCqw=;
 b=fuKM0A3wDzTjn6WMhk+gS8OpHbtCzNHBRuMez36bZHY0F6/Dm4Icc/nZEj6Iib8umk
 6DTOTblFgs35Wurp5MNo55RTsN9t+NABD8UwH7DZm+W/U0b/UBgWogKq2iJcw1FtpPCP
 y2Fy9Muku3oiNKhzHCLM3KpdWa7V+yZHb/FECHdFoNy3E6rXhUiD5Si7+aHv3rOif4JP
 DIy7wJC0NXE/ySFdUKSVnKvEtTUUWkbUPguBjehVz4LhqXItyYmec5cYx/SOfl2Ca3JM
 JBPU6FyXTRsZFghl5YQu1HW/Q9aK3jSue0tbYAJN13Rsf1jKiSl6jKD52MC72eCx3qwT
 r77Q==
X-Gm-Message-State: AOJu0YzVcKqu7K2Oo/C5Myk7sl1PrsMO+GnShmcVeA3yPrKqeSfXKQW2
 refMjUM94vkvD3XeVfkmWIoDyH9GFfK1SL1gA1PLQdSg16ljonXrKsLEOfN6Jss=
X-Received: by 2002:a5d:444f:0:b0:35f:1ed7:f1fd with SMTP id
 ffacd0b85a97d-363175b8fb7mr4542885f8f.19.1718893232055; 
 Thu, 20 Jun 2024 07:20:32 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.151.40])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-364774423d5sm2453703f8f.70.2024.06.20.07.20.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 07:20:30 -0700 (PDT)
Message-ID: <6a817f44-27fe-432a-8118-bbcec790535f@linaro.org>
Date: Thu, 20 Jun 2024 16:20:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] hw/gpio/aspeed: Add reg_table_count to AspeedGPIOClass
To: Zheyu Ma <zheyuma97@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240620140239.375338-1-zheyuma97@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240620140239.375338-1-zheyuma97@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
X-TUID: 28Oi5E4UAZ/0

On 20/6/24 16:02, Zheyu Ma wrote:
> ASan detected a global-buffer-overflow error in the aspeed_gpio_read()
> function. This issue occurred when reading beyond the bounds of the
> reg_table.
> 
> To enhance the safety and maintainability of the Aspeed GPIO code, this commit
> introduces a reg_table_count member to the AspeedGPIOClass structure. This
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
> ---
> Changes in v4:
> - Change the variable name to 'reg_table_count'
> - Change the 'reg_table_count' type to unsigned

Thanks,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Changes in v3:
> - Add the reproducer
> ---
>   hw/gpio/aspeed_gpio.c         | 17 +++++++++++++++++
>   include/hw/gpio/aspeed_gpio.h |  1 +
>   2 files changed, 18 insertions(+)

