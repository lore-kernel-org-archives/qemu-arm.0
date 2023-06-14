Received: by 2002:a05:7022:1189:b0:66:6ee3:fed6 with SMTP id ov9csp396173dlb;
        Wed, 14 Jun 2023 05:51:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5FbfYXkQaNDvs5/iPH+l0Yoh/TWP9ddmiOgRqhVBhu9GOprU8PF5DxmHqvG/XCnrFKYxnj
X-Received: by 2002:a05:620a:44ca:b0:760:6d77:d118 with SMTP id y10-20020a05620a44ca00b007606d77d118mr13983139qkp.16.1686747095878;
        Wed, 14 Jun 2023 05:51:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686747095; cv=none;
        d=google.com; s=arc-20160816;
        b=icrxAP7sMcwDzk9NLE+0HtSA3288169fk4fR7x8t+XqJl4VifpmFdeAyBrFZ2DyOHq
         i+zFGYBsNlnT2tjoFuIiIWxZbASBx8aN6BDExn+8Qoe9pgPHj97Lgi9OTi68Ixo5GN5M
         PgsEUUIsdgifiDdD95vV8l59pBqeNLVi/yDRxKHihmvyr7FIDa3QdJp/6ao8a98p25PM
         Wa8x+Nwlsrt7ytneuIDOoHrlJ/SgY8+wHtgbP1J4FfajhCtoAZslUxfqTQZHZ9ps9UG3
         ox+zLH1Z8OFykzYmBP468xDpDcrcylt9VpU5JMKOyOuukHziVhTwsT/xiu8xXA+yMBSd
         smTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=WTQ4+XrrgT/Son3X70uGLDpyWXK6q5H7kXhp8853/cw=;
        b=zoVr9wE3kthCfgaJE4pQdRG2BedmYYbkgLrBK095zXebR2DsaoWNXkpS7AHrPNJGyw
         rdHHx+obBMUyBIxx6UyArjK5fXZHfecUAaIbO5nDVlQwV/D/+7YP6isTmU+/hD8V4h36
         ihKuObhVygLXaaJ+VnvLLMXnR04FlBmdMqPA8KBksvzpqz2FukFq6ZDs6/ULL/4ZBi2O
         VvV+Wi5VjraaX9TxDVJUZEIrKrz2/SfmkFMA2pQfYfV+lTdNBVeNScmNrMO2OFARC+er
         8rTMcknRBV7Juasj2Ww3unYcCipoanhtseWsAwefD6j6a0K0FtuViwjKy6adiGiLPF3w
         o1fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yV2A9K4f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a21-20020a05620a103500b0075947ef3253si8316111qkk.166.2023.06.14.05.51.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Jun 2023 05:51:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yV2A9K4f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9Pxu-0007Hy-E1; Wed, 14 Jun 2023 08:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q9Pxg-00072Y-Tu
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 08:50:58 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q9Pxd-0005FF-2L
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 08:50:54 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-977d55ac17bso111254866b.3
 for <qemu-arm@nongnu.org>; Wed, 14 Jun 2023 05:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686747051; x=1689339051;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WTQ4+XrrgT/Son3X70uGLDpyWXK6q5H7kXhp8853/cw=;
 b=yV2A9K4fraQ0EVx5Fw/W4ckN1VPa58fuCe9NR9SDhjnjZdBxbyf34XXzGbprH55G1q
 uMehKE6G5AQfu7I9Fxqks0NpqPE0XNyVSEX9fZ4/RXh/6Ik4cAyEpjjgLkaP5zOlcLcK
 /oCIP+fNs3aq2od7PDKIQ0OU1KFTfMJay2CYWxumqUhGGVi/tdMPWx7hCMwJ+IqK0iAk
 nqSsnt2tiqaCMMCYwdqdB5GHrzPOzfozgQUvTgnZL9o/SMgg06Oy0zv2T4sOh+gzGSbF
 mNXqH2jofIBmz7siiS0p2xr7zOvVb5Xt+YMC1kVdne1UGTgENubmAtBrPOo1iYdeio0Q
 rrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686747051; x=1689339051;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WTQ4+XrrgT/Son3X70uGLDpyWXK6q5H7kXhp8853/cw=;
 b=NbTht660kNr7lVBqHfwwL/UVV5weQCzyAe3tnrL1NdfPI2gbvUPRvzEEwmSh/VA+/x
 LUd3mRh0SczEX32N+QhnqBZpc9WzIIN+8bEf58As1f34sttrQDRmOy3X13eeJvoJ6rET
 RsXxJZwP73zf+1WogubAhU4ZqnVO7/djiZeRVwmUvtmNrZJwPagAPdXPtHINgEmispBM
 5vAL1S3wufARPU4FF49TfWb01uCDLShUbzhnTktuNFfUl/Qr2e/QNUAKGF/+aQZlWHGm
 vwzuAwc8aWevOpzcMhEXqnCaQwtaph7pjf8OLGjszt3SVfBEXSmGhyGW1vsESSLSSG6x
 iDAg==
X-Gm-Message-State: AC+VfDxjzZ02+1IrlGAyS01mdW6Dg/VqBqezwIk3OD9M+qf6yN3HlghE
 FgUD7pcoU54vKbXyoKuVsW4AAw==
X-Received: by 2002:a17:906:730b:b0:973:bcf6:1d4 with SMTP id
 di11-20020a170906730b00b00973bcf601d4mr18599294ejc.76.1686747051664; 
 Wed, 14 Jun 2023 05:50:51 -0700 (PDT)
Received: from [10.14.201.118] ([213.175.39.66])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a1709061c9200b00965a4350411sm675112ejh.9.2023.06.14.05.50.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 05:50:51 -0700 (PDT)
Message-ID: <b17b304a-3613-41aa-dbb5-7ce6a1902d76@linaro.org>
Date: Wed, 14 Jun 2023 14:50:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH v2 23/26] target/arm/tcg: Inline 'exec/helper-gen.h'
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230611085846.21415-1-philmd@linaro.org>
 <20230611085846.21415-24-philmd@linaro.org>
 <82a922ac-2c1f-97c1-2949-565add323688@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <82a922ac-2c1f-97c1-2949-565add323688@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
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
X-TUID: ZAr/lAUA6O5z

On 14/6/23 07:01, Richard Henderson wrote:
> On 6/11/23 10:58, Philippe Mathieu-Daudé wrote:
>> +++ b/target/arm/helper.c
>> @@ -26,6 +26,11 @@
>>   #include "qapi/error.h"
>>   #include "qemu/guest-random.h"
>>   #ifdef CONFIG_TCG
>> +
>> +#define HELPER_H "helper.h"
>> +#include "exec/helper-gen.h.inc"
>> +#undef  HELPER_H
> 
> 
> Why is this here?  helper-gen is for tcg code generation, which should 
> not be required at all in this file.  I can't see how the modification 
> to translate.h affects this.

Indeed this is not needed.

