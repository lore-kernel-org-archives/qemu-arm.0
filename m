Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2151683ejc;
        Tue, 17 Jan 2023 00:09:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt/ZWKl1HApUwJnzI9iMx4m9r/5WovawvPABZafQga029oKxSdaTvc7B5gmj3eXkcQaIKBQ
X-Received: by 2002:a0c:ef49:0:b0:535:272d:2bcd with SMTP id t9-20020a0cef49000000b00535272d2bcdmr2793580qvs.52.1673942958762;
        Tue, 17 Jan 2023 00:09:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673942958; cv=none;
        d=google.com; s=arc-20160816;
        b=WnHjv475PfFvArlFh2ebdRSIOdhRfL6/DNrJelVVP8DCsIMDIUp1aE7C3d2nl8MPnZ
         6nsRMCdyOOL7+r/tWxuQYP0lu+vk5uZOULd1TU4t45NrEs7WLWHCSlhnhlryE0eOrqqd
         tS5iSBgQbfTjHrkVvyjWHkeSu10N5o1M1XmznjUTp2X+BGFi6GTSnpFQW8Zx3Da5pkTI
         r6dY7PtGQfpziLoKEQEkUWRCk+sNUwvCeSp0sq7zgDltYDuAYl8F5N1D7plvP+QZe4yR
         P4KIqV3V+wm7SxhTKlPE7sqh5hpbRzz5FYN1bey4/8blDOMd65+tIIc8/YDHvbTVhgtp
         3UFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=iQN4Xw9lU5M8JPxqVII6WbfWbqs8c4NOLi0YZsWhH0o=;
        b=fyjJyaw1QlYYv88tRUl75bSuABs4I40mVJ4/uZ2t/95Bn+AlPUS3sg+1fU44WLgbRE
         TKbswBle8qAvNa1ERjQxjJZXLFgECjp4pRvjYEsueE4WteVvHN8UOJzT+FjAG67EPDWK
         q4TE2FvfBbuWAi0KwYmq0uMYWXt6ORX3M0Ggx6nPjniLhLKbVEsLouoMJDWjG/Dtj11/
         fiO9jcTm/0ZRW6pf8+MvOCoA+2Z2ea5ZT1hfvVpJTp65hE4WWxD5YEHslV1BiqCva/tB
         WOSKXUCqQZsbrdjg3Ea4tJoGeIex4hmjL5swLrPYBLRyRs4oHZGrGR35P9PNP01oAjEf
         umoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O//LeEGS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2-20020ad45742000000b00531c58053cfsi18635477qvx.253.2023.01.17.00.09.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 00:09:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O//LeEGS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHh1w-0003dO-92; Tue, 17 Jan 2023 03:09:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHh1j-0003LU-ID
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 03:09:07 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHh1g-0000Vc-Hb
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 03:09:03 -0500
Received: by mail-wr1-x433.google.com with SMTP id t5so25282676wrq.1
 for <qemu-arm@nongnu.org>; Tue, 17 Jan 2023 00:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iQN4Xw9lU5M8JPxqVII6WbfWbqs8c4NOLi0YZsWhH0o=;
 b=O//LeEGS25gZbr+f7KjkHYro2JIHzmOc7rBH8kSr5yhKlZ/t7b5l0eEp2ZjVXXMckJ
 iZNtL8BYt5qGvGmedY0VAl5irndbaKrwxNLSTTh9Odkc2VJpNBYqvppwYV4m7HEYVC7i
 a0zKA/tPNO9DJZKN9A9yyXHIgqrR4N4RgAYwJIMxvq9Di62a1/G/dFUF/LDwKlk/gU6Z
 ScGT/x3Zg5CeR7PaQqcuoiyGfaGoMT6WrgTLqbS5fFqft6aB5sUOcZ57DXZhPqlB/X7i
 kBPmAymHYaHPW0ydNFip3VFHSqM7NBnk0Y+JJRqrrxHXmegvCImmSa2lbdSN0VXflQGt
 0yFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iQN4Xw9lU5M8JPxqVII6WbfWbqs8c4NOLi0YZsWhH0o=;
 b=PK2dAW2n6UMUA6uoTTS1MzYoXLIq47fhSXwQAYqyK79AC+20cNVvmWC7LJEwrjo14A
 2/NZOWNa05AANzDhszdSUwqd+pBWeWYT9hy3AoegUaP0ACB4HBiMzS74tN2IpSwgDL1M
 ZlmPg4bMnvYtZD/9aeHf3XOSjKHqFp5GyxIeA/41IM1OTPx/MnPyr8jGm+gdwSK/aY8P
 pDBN+gR4vRtt032oHXp/jljws9SMLmwvaIKz2wSy5KhsAOV7+tGHovA2lgeDhiaAwgfk
 n/mIVx93feaKY0EiMpbwFpCip54McJCiZwY1NdwkVa2s1xRdCKVHVIZJ1iiOb4xydfdI
 AHWg==
X-Gm-Message-State: AFqh2kqKouVuwPF1mKemoXo5O9CFuWfD2zbgavypqUYmYMlvsGgRulHB
 78IGQPjGN4FzFQEfG5TWegzB/A==
X-Received: by 2002:adf:dc91:0:b0:2bc:83d5:6ea4 with SMTP id
 r17-20020adfdc91000000b002bc83d56ea4mr10163097wrj.65.1673942938934; 
 Tue, 17 Jan 2023 00:08:58 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j3-20020adfff83000000b002bddc1ac273sm11215943wrr.87.2023.01.17.00.08.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 00:08:58 -0800 (PST)
Message-ID: <ca4d0954-4d45-ea42-e1c1-efae62e30b1c@linaro.org>
Date: Tue, 17 Jan 2023 09:08:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/5] hw/arm/aspeed: Add aspeed_eeprom.c
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Delevoryas <peter@pjd.dev>
Cc: peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230116235604.55099-1-peter@pjd.dev>
 <20230116235604.55099-5-peter@pjd.dev>
 <d494fe87-d083-cc64-867b-186852a120d7@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <d494fe87-d083-cc64-867b-186852a120d7@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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
X-TUID: oNkWADhjzk+A

On 17/1/23 08:39, Cédric Le Goater wrote:
> On 1/17/23 00:56, Peter Delevoryas wrote:
>> - Create aspeed_eeprom.c and aspeed_eeprom.h
>> - Include aspeed_eeprom.c in CONFIG_ASPEED meson source files
>> - Include aspeed_eeprom.h in aspeed.c
>> - Add fby35_bmc_fruid data
>> - Use new at24c_eeprom_init_rom helper to initialize BMC FRUID EEPROM 
>> with data
>>    from aspeed_eeprom.c
[...]

>> diff --git a/hw/arm/aspeed_eeprom.h b/hw/arm/aspeed_eeprom.h
>> new file mode 100644
>> index 000000000000..89860e37d007
>> --- /dev/null
>> +++ b/hw/arm/aspeed_eeprom.h
>> @@ -0,0 +1,11 @@
>> +/* Copyright (c) Meta Platforms, Inc. and affiliates. */

Missing license.

>> +#ifndef ASPEED_EEPROM_H
>> +#define ASPEED_EEPROM_H
>> +
>> +#include "qemu/osdep.h"
>> +
>> +extern const uint8_t fby35_bmc_fruid[];
> 
> 
> may be define the array with an explicit size to avoid the size variable ?
> I don't see any good solution.
  /* Return rom_size and set rombufptr, or return 0 */
  size_t aspeed_get_default_rom_content(const char *machine_typename,
                                        const void **rombufptr);

?
