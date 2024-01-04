Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp76374ejo;
        Thu, 4 Jan 2024 05:23:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCYf2PGXs2iVYADye+OQJy/2pdUBFnIdqRwvnKWBQ7Gg7C7J+RhCcu3TqwyZVE8kOPdNeR
X-Received: by 2002:a05:6214:1c43:b0:680:c741:6a01 with SMTP id if3-20020a0562141c4300b00680c7416a01mr547627qvb.129.1704374613246;
        Thu, 04 Jan 2024 05:23:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704374613; cv=none;
        d=google.com; s=arc-20160816;
        b=EQpxEXJ+c2A6hwLhYLcDwUTMAX1njS6m83WDusxlAc2iZ9yrk7GhlFOMYIwuLf6o/B
         LjMLJGRqXRurGJYkhE1Rto0QmUtYpMLLY1zUsADFOJmadP8cz3N60OoKNvPBM3KmTn+k
         fQZqX3RujcAozj4SIYA+MHOa4aBMJLD6edpLu7LesemdegkRy57GjOsWZq9LPVmjPRZk
         FWs6l5N84tOk8ReZ4F7M6YQHOA+4N4TvUFEBnCesKSdK0l24f6FCI8lSEbVYBhy1m4c6
         YKENR4ac5upkeaWY3ddNFID+CiR/e07LAaB6OGsN4e9D3DfKVjO/AU39ikwGgmacXCkq
         fllQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xmzCqV5c1vs4p/3DIrUdifQrQShB7IDP72TLYH2EaSA=;
        fh=Y98vLtoQ1R6DuMvmlkazmynPky9qI3IEmfm0XWQMsbI=;
        b=0Kj3MnUmh/ElS4FqjY9Id6gbnPa7gaM17CnGLQmQLZVtrY5+vvKGb4Al1cc7yw1Hod
         /pLO+xpBdpFLsJ+zKBt1oT+CR6atNAScRKHl3cveFzNwKkNXqs5sb9GfB5JQ7VIXMmGI
         jwGuHJA0d8q01y4YqEHZZ+KQK63UWE/phRlNDT1f3KTNOE5z1hlE7NmqDOhvvQPp5cW1
         51+IuvswwP2x+0W2Yo9nmNKfXN9YF8i5GmIybXPyjdxVO5rk9LKO2PC2lsM/LdsncUKj
         wD3LlTaHG7jkoj6dPApQ+rdChAEq6PYm3H73nhjyYr9uOE56Y3dlBnWTkDuxs4KQkiKg
         1xJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y8MF6Lnr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k25-20020a0cb259000000b0067f906859f3si20866848qve.427.2024.01.04.05.23.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jan 2024 05:23:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y8MF6Lnr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLNgu-0007Pk-CZ; Thu, 04 Jan 2024 08:23:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLNgt-0007PP-Lw
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 08:23:19 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLNgq-0006QN-V7
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 08:23:19 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3368ae75082so843336f8f.1
 for <qemu-arm@nongnu.org>; Thu, 04 Jan 2024 05:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704374595; x=1704979395; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xmzCqV5c1vs4p/3DIrUdifQrQShB7IDP72TLYH2EaSA=;
 b=Y8MF6LnrCKswqHu3DqE8IVGyG94ZDpEZY+Ykh1J8eEoZ60wxSQH6jhSCRhKmcoXNdi
 XdtRNbX6jQeFWfcdMXJeyMTalmzY/wZTUHkpi/G9cLs0qvELWvNDM2OzdNl8APnQpzhh
 LXkFo/9ojwNMIdcgd24HDYzIRZc//8JR9ajbdpG4ck5uAfhLXtW6A67KfiIgixIGYfad
 uFsSRNw6We78Ynhfcf9s0IqMEZZ3yGAznrVRSvLFGPty0mayN+NPdYdSZIMXH8Eo7lhS
 cZDHUjaQuUxv8gqOmeZ6D9ucXMM/1p5UnW1I2PD6PayKs0H1HaSzW9uZDXwgyfKq54A0
 EjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704374595; x=1704979395;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xmzCqV5c1vs4p/3DIrUdifQrQShB7IDP72TLYH2EaSA=;
 b=BKR4Z9TcNq2rusuOSdbzhnCq2l9cToCI/pbPkl5uLzlBMdQrM6lx4sNMMAoX9MgZrF
 TzvaN9NxDaoSQLVPGQl/F3n/3/Ixuskqm4AB7lpsP6MIWCfJGZCtJFdUydIXDcKQ/ylD
 c1u7hA9pKyweysomfV4KRDKY3spEnsmWdeTQAu0prc1hS356DWyUN1eBRE4udIUhu/3+
 Va/3dQbIFrL8gONxYWa6uZKc5NNPeM1Gb8MdjQ1vRXFREtqrqd44n0oQdyVHpZhnSuh8
 5+wJXlKA/nMDq9vgN2EoT2aF0X0YaplgpPwz/nTtw3JoT6jR+EZ2gDbjx/hgLyW6488N
 vq9w==
X-Gm-Message-State: AOJu0YxjW+o3wxbUmSe8OVu3zsE+FGxAGDYfwKROgAwdvoP5IwG3FvgF
 RBURHWorLxXHsI5PJMD6QLWOX1VIHq9vfQ==
X-Received: by 2002:a05:600c:c1a:b0:40d:899a:9fb2 with SMTP id
 fm26-20020a05600c0c1a00b0040d899a9fb2mr346205wmb.136.1704374595263; 
 Thu, 04 Jan 2024 05:23:15 -0800 (PST)
Received: from [192.168.69.100] ([176.187.194.232])
 by smtp.gmail.com with ESMTPSA id
 ay10-20020a05600c1e0a00b0040d94b65342sm2502409wmb.48.2024.01.04.05.23.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 05:23:14 -0800 (PST)
Message-ID: <4d6cb918-cf05-445d-b7b3-5d180947774a@linaro.org>
Date: Thu, 4 Jan 2024 14:23:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] tests/qtest: Add STM32L4x5 SYSCFG QTest testcase
Content-Language: en-US
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <20231229164915.133199-1-ines.varhol@telecom-paris.fr>
 <20231229164915.133199-3-ines.varhol@telecom-paris.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231229164915.133199-3-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
X-TUID: 8wwCD5eEoL9s

On 29/12/23 17:47, Inès Varhol wrote:
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> 
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>   tests/qtest/meson.build             |   3 +-
>   tests/qtest/stm32l4x5_syscfg-test.c | 408 ++++++++++++++++++++++++++++
>   2 files changed, 410 insertions(+), 1 deletion(-)
>   create mode 100644 tests/qtest/stm32l4x5_syscfg-test.c

Sitting on this commit, the test fails (because the tested
device is added in the following patch):

▶ 19/36 /arm/stm32l4x5/syscfg/test_reset 
   FAIL
▶ 19/36 /arm/stm32l4x5/syscfg/test_reserved_bits 
   FAIL
▶ 19/36 /arm/stm32l4x5/syscfg/test_set_and_clear 
   FAIL
▶ 19/36 /arm/stm32l4x5/syscfg/test_set_only_bits 
   FAIL
▶ 19/36 /arm/stm32l4x5/syscfg/test_interrupt 
   FAIL
▶ 19/36 /arm/stm32l4x5/syscfg/test_irq_pin_multiplexer 
   FAIL
▶ 19/36 /arm/stm32l4x5/syscfg/test_irq_gpio_multiplexer 
   FAIL
Listing only the last 100 lines from a long log.
**
ERROR:../../tests/qtest/stm32l4x5_syscfg-test.c:140:test_set_and_clear: 
code should not be reached
**
ERROR:../../tests/qtest/stm32l4x5_syscfg-test.c:148:test_set_and_clear: 
assertion failed (cfgr1 == 0xFCFF0101): (0 == 4244570369)
**
ERROR:../../tests/qtest/stm32l4x5_syscfg-test.c:148:test_set_and_clear: 
code should not be reached
**
ERROR:../../tests/qtest/stm32l4x5_syscfg-test.c:151:test_set_and_clear: 
assertion failed (cfgr1 == 0x00000001): (0 == 1)
**
ERROR:../../tests/qtest/stm32l4x5_syscfg-test.c:151:test_set_and_clear: 
code should not be reached
**
ERROR:../../tests/qtest/stm32l4x5_syscfg-test.c:155:test_set_and_clear: 
assertion failed (exticr1 == 0x0000FFFF): (0 == 65535)
**
...

To avoid breaking automatic bisections, first add the device, then the
test (invert patches 2 <-> 3).

Regards,

Phil.
