Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp298565ejb;
        Fri, 9 Jun 2023 04:07:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ763vo6Go+ba4zua+AdSCQAwgERIs50lxl24u2Nc8T3HuM2XGIjVu+CMDbaWld4RwMFibla
X-Received: by 2002:a05:6214:252d:b0:626:31ad:f875 with SMTP id gg13-20020a056214252d00b0062631adf875mr1351347qvb.44.1686308821292;
        Fri, 09 Jun 2023 04:07:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686308821; cv=none;
        d=google.com; s=arc-20160816;
        b=Z53fMoh23TqV2vwUAW2pR8qG2NP86mbqyM0Z46fGQSdmKyFtJ3jtY+mYF/6hWxkBB2
         HRnXtU/MNAbel/VkL/2f3n749du7I80qo0dj15Na7NJUO7baYg5VxoUIAUPd7wrrGJZj
         EYLepB7Ah42XiyRvO+nhLJrdtzzvRWYAFAa0OoUcrYpqTAlF7kKPvFdO+32qDSlM1ZbL
         k9y0n1ptb6jqm3u6/QHit4BcMhzEgrJ7I0yQ11SBXtc2wcccQVxywZJSvbtHZygOAkPZ
         9RIAAMatxCvP/O0AGVSKbykF7P3Idj/sZ+vkde4srv2dKPkr6jT9ZL90KeL42y6aZoEE
         dxRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0x5RkekOKaQzjq74QOJJSHShIn0DszZlo1yndNssGxA=;
        b=V0RKfWHaHrXAc2fUzmbaK9uwSKSfq9qNVhpHNagCk1doIAmbC0pUYnlKh3oWj0TVzY
         wnpqeP617rjCIkmXl3FMVtEGoJVzAvnZf2cBf1RleTKvotpPE8mN5N+0m5D2pJKn+YhO
         ZBGy8QNhEIDFCXqEF6LBCq12ueqFNO9F3ziLKGL5lpoKa6sCwmIQmX0n95bSb2xI58s4
         Du4iPSAYu6Ks1ffHtmctQOamV9/3J0jzf/TEcfRl+9Zp0HubrqfairuZSsarrfsejN+h
         dVw9KvPAHw2SCbNyr5zrNr9yof417cNfDSyoDGWn6ipgSH8jixk3AU8AGU+lDe2ZOl/7
         0c/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QCTxdq0q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gu15-20020a056214260f00b0061b5862a2a7si2048226qvb.595.2023.06.09.04.07.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jun 2023 04:07:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QCTxdq0q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7Zwj-0004fy-8U; Fri, 09 Jun 2023 07:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7Zwh-0004eu-5Z
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 07:06:19 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7Zwe-0005xM-PW
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 07:06:18 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f620583bc2so1997490e87.1
 for <qemu-arm@nongnu.org>; Fri, 09 Jun 2023 04:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686308774; x=1688900774;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0x5RkekOKaQzjq74QOJJSHShIn0DszZlo1yndNssGxA=;
 b=QCTxdq0q/Qj+vWiwGVoWQKyHg7sq3gRxK6fWXUljLmkP1kGs+Q1hmX5kPcA3WSN/L/
 31zj2Y28b8rwamuWNx5sK3Vel+QxciDwVxNvgRy8+uxajDi6P318gEEebyzdSOt2PlTm
 svmlWNHS1e2yxxCS4BBLD8gr0fmMqyhS4gHZKvec9aei2QLWGPQFFf4yzseAVGY2lpW2
 B5x7qMyPy2JwGdERW2Y4eQ+rX2b8QfUpxCrL5gOmkL8YlVM22GZ5kFx60BLBNkDvz5KJ
 C+BMYGrcbN/EPRHJsgk29s9o6hWNDQ48QEdbCPojf4vNZQV683KiXc8D+bnTFSPb6Qpc
 GJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686308774; x=1688900774;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0x5RkekOKaQzjq74QOJJSHShIn0DszZlo1yndNssGxA=;
 b=LrlrsfRYc1f4nlejCn1N5CPfQGgBPWymG2LG6SifgNftqnWk+dbDkeJHiJ+Z+W/NaP
 F/g/AdjpZsolDTVsqXL62nxIhcJoDXabEG15Rr50nI062MBU5/CRk5dmeVG2TDgPrnaj
 Y4DrvPN2pOFGgE8SNUcQtrhOSFP9JjRWg6JakwXewMkP1psk/XH7tpfFYAQ7kgV3NQMX
 EijNLBdqpRzJfBNDcw5OfmqoQhGfTMLytB6IXNoLazjT+JQUaQbBZfZhy6Fd9K/hlHKB
 0p2URkc1dnq8f359Pls0YoVCc1L+KdVKwiaahnke26wacZqBBlmkPsdc00WjZ3Q3HIqG
 imlA==
X-Gm-Message-State: AC+VfDwTYOdjoo51X89XFz9ziNGkT+9eaNEM9kDjq5+/uQqQx9x3J4Lv
 gpCx4JDQiM8R9pANHnI/5tbhBQ==
X-Received: by 2002:ac2:4db2:0:b0:4f4:d83e:4140 with SMTP id
 h18-20020ac24db2000000b004f4d83e4140mr672628lfe.34.1686308774436; 
 Fri, 09 Jun 2023 04:06:14 -0700 (PDT)
Received: from [192.168.192.175] (23.171.88.92.rev.sfr.net. [92.88.171.23])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a05600c211a00b003f42314832fsm2356751wml.18.2023.06.09.04.06.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 04:06:14 -0700 (PDT)
Message-ID: <cbfc9573-736a-2f2b-9bd3-f69c7575b171@linaro.org>
Date: Fri, 9 Jun 2023 13:06:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH 08/22] target/arm/tcg: Extract iwmmxt code to
 translate-iwmmxt.c
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230609104717.95555-1-philmd@linaro.org>
 <20230609104717.95555-9-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230609104717.95555-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x131.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: mvoh3vStKul6

On 9/6/23 12:47, Philippe Mathieu-Daudé wrote:
> Extract 1300 lines from the big enough translate.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/tcg/translate-iwmmxt.c | 1334 +++++++++++++++++++++++++++++
>   target/arm/tcg/translate.c        | 1312 ----------------------------
>   target/arm/tcg/meson.build        |    1 +
>   3 files changed, 1335 insertions(+), 1312 deletions(-)
>   create mode 100644 target/arm/tcg/translate-iwmmxt.c
> 
> diff --git a/target/arm/tcg/translate-iwmmxt.c b/target/arm/tcg/translate-iwmmxt.c
> new file mode 100644
> index 0000000000..a054064c98
> --- /dev/null
> +++ b/target/arm/tcg/translate-iwmmxt.c
> @@ -0,0 +1,1334 @@
> +/*
> + * AArch64 SVE translation
> + *
> + * Copyright (c) 2018 Linaro, Ltd

Argh, wrong copy/paste!

> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + */

