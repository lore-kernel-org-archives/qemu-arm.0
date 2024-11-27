Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp696976njb;
        Wed, 27 Nov 2024 03:23:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW7IXLCPkwiETYf3fUd368uIwzvgCdctddE1vcjDPrKpYoH6xhlkrPmkfv8epKgbPjJ2cllU7tGRTwV9A==@linaro.org
X-Google-Smtp-Source: AGHT+IE6mwPJDoL0GirA2MxtJM1eCNBqlsuvCVN2mgyVP9lTH28YXeE0A/937zu6i6ueuFDz9mX4
X-Received: by 2002:a05:6102:38d1:b0:4ad:b85c:e6c with SMTP id ada2fe7eead31-4af446f8fa5mr3748158137.0.1732706639176;
        Wed, 27 Nov 2024 03:23:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732706639; cv=none;
        d=google.com; s=arc-20240605;
        b=jpg1Oybwn8ZXbnPG/xFKo0ZJSdyL8iDAbZfCN4pvdKLTy6bOoBDElvOj7txuQluO+i
         N/bP75ploj1GE5hFq7OEUk1keb8rdbDjzcVcjx+pDZvmV6pBcPzJoEI29J2tQNDyk9ZV
         wL+56Z1gDvAJ1cmHV48ekgtcUb4EghIsc25bpEeXw3oJwx6yEN0k7JaHGMDdNXfGf6LV
         D3QkeJDhEKLVb6q2ypS9btC+KUVp5nwRL/h+SS60mCH92tQd0VR0wo2qV2InZUqf2gne
         aoSEodOUrMga16a8QzmmrKhbsCWYvLW+r+/V3YQ1pLYH64p+d6/e5czmDGlTQbTEHqEU
         atcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=D85e/9sSN7VtTqiuPNUfHF2+WXR3ZSp+4nYaf+WMPLA=;
        fh=YXJQ1CkfcC4+5xGOZyoabjxqJoOCVKFcLd2pF6Fo3fg=;
        b=OB8dq0uAJb9Ztkdv4stzTeRZzm70zSXf7U46VSIk8KVpBGqx5UZmBxa9rg/xdQBK1n
         S/eY58He+2ApErp1ZK307r07IyRJ0nvDjGZHALfSKW/WjnXhY4qJVTZM7BGWynIWMgGN
         WO9dpmVUS5sZBpyOpjk4XNmMxuS3ZtSpQAsdNgLsq5fEjp9TXzwhQNAW9IvKutLtZmGM
         pqpcIQt/wVg+lDLBK84q6PzVlFixodE+oqZnhd91z1/o7Tr2dRO9oAaQNNzx0F9BUeTp
         NbzCYkTAuONr9EGtpyfcXEDxQuLkY+SCcQUzsj5Kd6MRPysp/pQihC12j3R3Ex3BkODG
         B32Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qqyP8FHe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466781e8e9dsi104070771cf.672.2024.11.27.03.23.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2024 03:23:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qqyP8FHe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tGG92-0001m5-0G; Wed, 27 Nov 2024 06:23:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tGG90-0001le-LJ
 for qemu-arm@nongnu.org; Wed, 27 Nov 2024 06:23:42 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tGG8x-0004hE-I2
 for qemu-arm@nongnu.org; Wed, 27 Nov 2024 06:23:42 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-434a736518eso16830695e9.1
 for <qemu-arm@nongnu.org>; Wed, 27 Nov 2024 03:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732706618; x=1733311418; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D85e/9sSN7VtTqiuPNUfHF2+WXR3ZSp+4nYaf+WMPLA=;
 b=qqyP8FHeRtw9NXM+JP7mWE3kNHDqdXnp6a2cfR4/ALPLUh4BBasVvPvOFZrGViyEP4
 EuwGFPEUWPlRK1Ap966/tkjyMau6iviRU2ZOfYPYtOsy/viGx23VfHwKD0kcgSmybmk4
 4g7DnX8TSwqBWjV+tcFI+R+YteJTSRmQZe5DtmVSTmHBthiophc/C9Cga347iRv3xUt9
 ZhY9vjxMsajGdXY9fIBBS6OaXNtttEo0rznwA3MmFJZO5+OX7SCkI1BA2p1xuU2YdZl+
 kbbam7jYgkWcJhTMkXMzvCL7Frd/dW/aA4p2Kkr6DihA7lt/xL0HgNOHpjdWrwEXKTmj
 m0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732706618; x=1733311418;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D85e/9sSN7VtTqiuPNUfHF2+WXR3ZSp+4nYaf+WMPLA=;
 b=PT9PkUzG1I06836bwUvFaiosUO/ORiCF69qCAKykJhJXg5WyJxf4U+OsoFp1gKCvyJ
 5X1UW9vmkMH3IzeuoMAxM5y/I7OiDvirMT4Qn0cSg3XhCbm0UsT7HskMAZ2AwED+31hE
 LD1s6VKqEX+IlnZj30nE9CiaV9YNLvRE1ndwKF0CaNN3wNfmhQ8JxOV8yAGgdDe3uR0m
 pj19a5YJom/639jHHAWLQwN3R0eGBaUN+d+waDldfXyfOu0XWCG0y827OK034bFyFtFY
 xdICLtB3pnnRKFSCKapWvgHUWcEwHox5aQsNwv0JIgDAfS0x74FIT9dqNaYcSbZ8zZS1
 NpSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeDyNK5ER23jDX5cdOoZ2vYirXNgmEKWa9RdqtbwTSOu/MrJB2t9yCxG4tFdtQLELvtjf86pMF3g==@nongnu.org
X-Gm-Message-State: AOJu0YwdZuCNJ5EqNa9MLs7RuU9L79f3PZ8OK3bhtNQ+1IIiWQuYiZ6O
 SJ0ZtjN1PzOKPPoES6dNUoxtZl4rQDoj95uu8Yv75L7Nq9earRD9MUcOL8cNMj4=
X-Gm-Gg: ASbGncsmBTKD9GwS06oJ2YXEeKpkB4Vh5evgWDfpxfppYeB7eb8jv9StEjxn37Oh3a/
 V8o485NuTuKbSZWCpFR7x+rb1HqijkaD67o4BeNEsXvqvQJz94YiZkkmOI+H4zRaMgcyScwDP3f
 DTmX9seB1ynm/7hNVjgKFNP9TRpV6i484YNdC96hkdIljyXldv3zXVjCYs5doFgW/fEYO5rs8Hx
 WNKn/v9mg4GV1wOBkA+3aykJ15W7Ud48mbNKGJdqunUNtdf4eDfoKSfXV6xoyotSfPwvwGMZ7cu
 8sdTHrKj3B2bnT6jQmjp3BQepV3zkY3LlyeC
X-Received: by 2002:a05:600c:4747:b0:434:9ec0:9e4e with SMTP id
 5b1f17b1804b1-434a9dfbb21mr28528965e9.30.1732706617659; 
 Wed, 27 Nov 2024 03:23:37 -0800 (PST)
Received: from [192.168.69.146] (plb95-h02-176-184-14-96.dsl.sta.abo.bbox.fr.
 [176.184.14.96]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa7a4e85sm18253945e9.5.2024.11.27.03.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2024 03:23:37 -0800 (PST)
Message-ID: <b520adf4-12f1-4261-a48f-bb74589bb31d@linaro.org>
Date: Wed, 27 Nov 2024 12:23:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Introduce a new Write Protected pin inverted
 property
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Bin Meng <bmeng.cn@gmail.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:SD (Secure Card)" <qemu-block@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20241114094839.4128404-1-jamin_lin@aspeedtech.com>
 <2e956389-289a-4806-8985-ab846d808736@kaod.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <2e956389-289a-4806-8985-ab846d808736@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: tGZyeBaM44Ia

On 27/11/24 10:44, Cédric Le Goater wrote:
> On 11/14/24 10:48, Jamin Lin wrote:
>> change from v1:
>> 1. Support RTC for AST2700.
>> 2. Support SDHCI write protected pin inverted for AST2500 and AST2600.
>> 3. Introduce Capabilities Register 2 for SD slot 0 and 1.
>> 4. Support create flash devices via command line for AST1030.
>>
>> change from v2:
>> replace wp-invert with wp-inverted and fix review issues.
>>
>> change from v3:
>> 1. add reviewer suggestion about wp_inverted comment
>> 2. AST2500 EVB does not need to set wp-inverted property of sdhci model
>>     
>> https://github.com/AspeedTech-BMC/linux/blob/aspeed-master-v6.6/arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dts#L110
>>
>> Jamin Lin (3):
>>    hw/sd/sdhci: Fix coding style
>>    hw/sd/sdhci: Introduce a new Write Protected pin inverted property
>>    hw/arm/aspeed: Invert sdhci write protected pin for AST2600 EVB
>>
>>   hw/arm/aspeed.c         |  7 +++++
>>   hw/sd/sdhci.c           | 70 ++++++++++++++++++++++++++++-------------
>>   include/hw/arm/aspeed.h |  1 +
>>   include/hw/sd/sdhci.h   |  5 +++
>>   4 files changed, 61 insertions(+), 22 deletions(-)
>>
> 
> Philippe,
> 
> I plan to queue patch 2-3 for QEMU 10.0. Is that ok for you ?

Having to modify sdhci.c internals is dubious, since inversion
occurs out of this block. If this is the soc/board layer, isn't
better to model at this level? Smth like:

-- >8 --
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index be3eb70cdd7..aad9be66b75 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -559,8 +559,9 @@ static void aspeed_soc_ast2600_realize(DeviceState 
*dev, Error **errp)
      }
      aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sdhci), 0,
                      sc->memmap[ASPEED_DEV_SDHCI]);
+    irq = aspeed_soc_get_irq(s, ASPEED_DEV_SDHCI);
      sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
-                       aspeed_soc_get_irq(s, ASPEED_DEV_SDHCI));
+                       sc->sdhci_wp_inverted ? qemu_irq_invert(irq) : irq);

      /* eMMC */
      if (!sysbus_realize(SYS_BUS_DEVICE(&s->emmc), errp)) {
---
