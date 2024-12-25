Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp5175225njk;
        Wed, 25 Dec 2024 03:28:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW/iyPEfgQrnYPY+yzV2ioPCRbh8QL5yMBHPXNVR319PZYkUD5WFZj2+ddxqVw/TJyxqYOVvmxNvGoHag==@linaro.org
X-Google-Smtp-Source: AGHT+IEGHpQWUR+PO6jR1IT1pe0uLGj5Pyudu8IlAgp/QBnCOYVqYCu17GlKl+HTKNZXKztxydG2
X-Received: by 2002:a05:622a:18a9:b0:467:882d:e7c6 with SMTP id d75a77b69052e-46a4a988dccmr262792251cf.34.1735126105531;
        Wed, 25 Dec 2024 03:28:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735126105; cv=none;
        d=google.com; s=arc-20240605;
        b=Zy39RMB5boEz7BWqoCIjWhZwxKeRMtVwlfc0nOdbLFv2vGxI4Fj2smX8vcxQ3d40L5
         /BpOAALeD+rcaie7E1myZkkAV/O0hy9kliK5N+uxW0qkZ8txRLMW5PYOi61N/8w5WfOy
         UOgoAgoC3/PJoV8EPrhVbT8vDoFXl6s8KceeVXzaBtBUpcz/UyqlsiX0tS/tnW75n00/
         dNKpgubjeowoPwGYykNH0CBXQO8L+mrU2HUW6ajCXaLsvF8QFRc/Oe+Dic3ScNiPhj3Z
         HN357GA3eN7tV2rnKGn9fqO2IPkoJ8QAC58uZZhog+dpbHnEVIU7oESSrYJxhLacTDJk
         qHLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xY3AelCfFa56nMqxO27r1LoFMTGTx90cLHeWano2z54=;
        fh=7psTbjl89xpgM1ee7OkW6c/OyhYAbIiwLVsh/lQ57F0=;
        b=aqkiT3SY/U8oGb4D4zj5kr/NC37pbRuas3YSt08uJLcbIye15lysnE9uBmVQ0Qqps3
         E4P+EBE1ihLpErqimOT2kLQObdf1/hokGKG8HWvBAA5iY1JvpfiJ76UjP2osDvfwW9hH
         ijqtsi8Uv0jbrmYzLSQn7jDKrlmZLIfavPihhB8UDHe+OxU9SiB02GxwILwxPU1/ORlw
         iAI6CiJPU6ZcL8tDEk3xtdXkz5mXHtVw1fSXuDPVZqWl6+Z4ABojIZuFJ5IYl/xzDRrX
         rJMyaKyKJfGObAWU/h5wEK7zpoUw1CVLkarEXMZPkv6SSoY3x0b5D/zs3BcwNB7Jnz6q
         ng+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DgXiQhBP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3eb990a4si171134111cf.282.2024.12.25.03.28.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Dec 2024 03:28:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DgXiQhBP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tQPYj-0005Rw-T5; Wed, 25 Dec 2024 06:28:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tQPYh-0005RK-No
 for qemu-arm@nongnu.org; Wed, 25 Dec 2024 06:28:12 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tQPYg-0008Cf-0T
 for qemu-arm@nongnu.org; Wed, 25 Dec 2024 06:28:11 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so60573905e9.3
 for <qemu-arm@nongnu.org>; Wed, 25 Dec 2024 03:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735126088; x=1735730888; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xY3AelCfFa56nMqxO27r1LoFMTGTx90cLHeWano2z54=;
 b=DgXiQhBP+TGjdoBqKedrtjGK/5/+LVxwHKQmgLG/2ajJE5ILLTFOjfG36zRurbi+Ye
 NdRNMNFMYirQRFNw2GfiRXqmdl9utDhUnwVgNgxj7IPCyJyOu+OrR0vAAVb1Pr6+kw/J
 pjy+mLAu8oKCnJ7OXlAx9O/fj9s6k09uaYX4zgfPmyMCSFT1qXIpzhZo50nwNEU/v/xe
 B/aacLF24T7HpQY4JDs2LFdDw46pHLFNRO365JUZqtIeP37nNHEfD+W8CfpENT++ziwP
 9NCyw14H/bJSL/1S1+4+HdZGXwYlTXNfjL+nSv24CD1b2BpYqkj4pBmRU6j4cBO2DpJq
 Ctmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735126088; x=1735730888;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xY3AelCfFa56nMqxO27r1LoFMTGTx90cLHeWano2z54=;
 b=HVU9fRe4UFIAXlx7Ueav4fjLa2YtCTladYT888aTyHWDHcMka38BUz6SRF+kZDm47/
 KgUChR5WsFcj3LHHUTZC4P5n2oX+8iag9L6Ew8Cjh+ktSV8tNPkUPafKiFc1aARSl7q3
 4n7n0dHQQGSivsUAH1bqjYZV1NMUSbka6HDWMlONEGEV+kSmjC46LZp3PYOVC8iMTvUs
 c8mjZv2BZOedIZ12qxUDmD0JpY4eBAdFniQW7gUZYXPThVvAb3Rk2eR6kPCqHeblKq81
 +G6s649+Ubq6vxOC9K1tpzYJKhzbSMB+iA/KVBNeP2AOlFlO6XLAdiwUfxV+zbWy8eR0
 Gqyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaNxsoxRhmXGW4EcQpByHCrGNwYUwHF3V0ykXXW0ulwoMY2B4RV6wQfqs1Ih08nIhULIaxbwVxNg==@nongnu.org
X-Gm-Message-State: AOJu0YxhY5wnhovVHTRrjquLPFYrZxDHUGVT9QI2fRjR/i53YzUr8FAp
 nQ+SpG/HSX/eO8u0zute4NT4baK5UwLRowUX9o+sM0CNYsJk0uHTTODytpxWfuU=
X-Gm-Gg: ASbGncuBfC5lhYLlrF7W7ntAGb1UrA8rVJt2rFwC6+maIBNHI1G3/t0m9ctSm/nZqfM
 x5JUWBHFipF7tWgThb8WvdpFXizECyunm+ki0NF0vvjN/mbxoFYMv+clSLhfbXJj/tCXaSnID54
 ki4iKhmTeaV0f3jcF5b0VcRaI34dqSF/LLU8/39CIvwv4CuOz+txxw10Qp/mDKzPDhwoS59KZS9
 ftChETaChvi0YKY+/Hm1EAToEuROc7gEeoujTgg9DAYmiiqpXX50mDtGAevV5AVPzg=
X-Received: by 2002:a05:600c:4f8a:b0:436:488f:4d8 with SMTP id
 5b1f17b1804b1-43668643a47mr161523085e9.11.1735126088052; 
 Wed, 25 Dec 2024 03:28:08 -0800 (PST)
Received: from [192.168.1.117] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8288b8sm16594965f8f.11.2024.12.25.03.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Dec 2024 03:28:07 -0800 (PST)
Message-ID: <6ac5dae8-db32-4275-9570-da1696a8764b@linaro.org>
Date: Wed, 25 Dec 2024 12:28:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] aspeed: Make sdhci_attach_drive and write_boot_rom
 public
To: Steven Lee <steven_lee@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20241225020311.3718080-1-steven_lee@aspeedtech.com>
 <20241225020311.3718080-2-steven_lee@aspeedtech.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241225020311.3718080-2-steven_lee@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: m7TZ1+4I+Y9v

On 25/12/24 03:03, Steven Lee via wrote:
> sdhci_attach_drive and write_boot_rom functions may be used by
> the aspeed machine supporting co-processors.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>   hw/arm/aspeed.c         | 4 ++--
>   include/hw/arm/aspeed.h | 6 ++++++
>   2 files changed, 8 insertions(+), 2 deletions(-)


> diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
> index cbeacb214c..bba224c357 100644
> --- a/include/hw/arm/aspeed.h
> +++ b/include/hw/arm/aspeed.h
> @@ -10,7 +10,9 @@
>   #define ARM_ASPEED_H
>   
>   #include "hw/boards.h"
> +#include "hw/sd/sdhci.h"
>   #include "qom/object.h"
> +#include "system/blockdev.h"
>   
>   typedef struct AspeedMachineState AspeedMachineState;
>   
> @@ -41,5 +43,9 @@ struct AspeedMachineClass {
>       uint32_t uart_default;
>   };
>   
> +void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo, bool emmc,
> +                               bool boot_emmc);

Indent is off.

> +void write_boot_rom(BlockBackend *blk, hwaddr addr, size_t rom_size,
> +                           Error **errp);

Ditto.

Pre-existing, functions taking Error as last argument should return a
boolean indicating whether error occurred or not.

Fixing indentation:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

