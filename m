Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp976920ejb;
        Tue, 13 Jun 2023 22:06:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7B5oxx0v6o4eat25vvFyhMSKN1rWpSqFU/z95rSX2tG7JxIC+3xvBxM0qV3IpNj5vAdwa/
X-Received: by 2002:a05:6214:21e3:b0:62d:e2cc:91c7 with SMTP id p3-20020a05621421e300b0062de2cc91c7mr382438qvj.24.1686719163533;
        Tue, 13 Jun 2023 22:06:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686719163; cv=none;
        d=google.com; s=arc-20160816;
        b=rC7j+SpaC8c7PDUZlW+E70th4pvVK4ADgg6HlGVVINREy1XUhUqlHmb/rBPAYQhwrb
         9M10A0UbRHI5Ift5IvXKEy6ung6PI5ZCb8O3pZlcQFiiv19nsX7mQdhgZ2ttKarFq5EP
         hVw//EHD2QHiBZMp1Be/7jZS5AtSyPW2ugVZru3wf1XNwGrZuGr7kL+kWQJQSmpigZPf
         5HmakNYSYG6V0rIKISZqJXSDCBoRfGoLOH0TiSjOhN5N3/RBKcgnkHu9FGopCdiuiZaQ
         5NZXEAEawsEa+0Bz+M9E+bBpLfC2YTnVI60khwfwZr/ynOiqqdeUq+kNwPyU9476iw8k
         TEwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DhJSJwGV3IFbi6Z1MspvvxmS71qe7wNlbKUPvr+cxHY=;
        b=aGraX/cbDg0+mAjzwc63QNGvcqTPB1pwkHJFwYIB50QzG72XToV5ok4P1nxDW5nhVg
         FMjqmhCRt2jU+A7bBU7hb6nwHITTQkUmBqBWEUwQIvhB3tIk5i9T3YzbdmQoV3HXYx4H
         cES5SUs8SJNYgjun8oPiG2vNvb33VfWOOLKQYd58iXrYXUwJsR5i2trTPetTOB5a6cv4
         eh17VnpNm29hXen0UuRvFYvVQSwzIsiJRLLFj2B/3KdqpVs6qkmzb5qhH/Ui/V0ccQFY
         hjJv9mja7FBIlE6XifatCgbtTbOvQr08rCyNjqy9zFet/xgQShMyJyGeqnX0aGQ9B8f5
         6RMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=anqae0tU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12-20020a0562141c0c00b0062de1f02defsi5087456qvc.560.2023.06.13.22.06.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jun 2023 22:06:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=anqae0tU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q9IhU-0001bV-G5; Wed, 14 Jun 2023 01:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9IhT-0001bD-GB
 for qemu-devel@nongnu.org; Wed, 14 Jun 2023 01:05:43 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9IhR-0007b4-U4
 for qemu-devel@nongnu.org; Wed, 14 Jun 2023 01:05:43 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3094910b150so6239196f8f.0
 for <qemu-devel@nongnu.org>; Tue, 13 Jun 2023 22:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686719140; x=1689311140;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DhJSJwGV3IFbi6Z1MspvvxmS71qe7wNlbKUPvr+cxHY=;
 b=anqae0tUIJifBO0KaTJOn6GrJfv4aBeL7sLS7QSOo8Ibxa9yzWgiEPIG8seoxaDzBc
 AZuEFnfQVURa8A3WfgU+fwiYTHZByNFVtWPFd30KV4K08ZdFkTuYFiunhdvcGL0vW/NR
 4IwyWQKCCZ8dgQN8rC8m1RAilhpYVtoUhounwktLn8Hc6tz1jDmfOZkGmfWdS/cZadUI
 xE0TWl3oU++HvzEuO/pvZHgI1NbVXRBp4iy1GbU7IL8yhBS9vEgiWq8+I427KX3fAmRS
 1+oW0mzh4MbXY5zfwfnE3eWgwGhzDYSafx7OpAygWym1BPrEwEeBTASbV5rlKbWyNCfV
 MIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686719140; x=1689311140;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DhJSJwGV3IFbi6Z1MspvvxmS71qe7wNlbKUPvr+cxHY=;
 b=BRF2l4w3GACNb5EbKUeXMELIYSKZDppbqwyfvUUvJou5IRtC415bmPtOAf3p4lH4FD
 cdnJLSwd3lHXrCi9uPAfDn55An0FXL21p0F4st26g89S+p55CiuDSQsDU1UKemfB9Kp0
 5kxXlq22twluxgda9PH3D/eZO5w8fCpIc1TjEbIYuBz8CtJ+Yy5E46glnvr5juo/DqLt
 vpHmg7C83I4UOmywpnIKM/WCxwxMdfxh3gUlLAEElV9m220qZp50o2I8y3dEkSVNe0GC
 9nJ3nxKkCClUZzM35qrvxle7ZiIThUNvRCj3qqBHWU2yGf9Jx2K/PQc5VEIT6DHVbV5D
 /7KA==
X-Gm-Message-State: AC+VfDzZx6uJvs36gbVDkOklTQG16GeqO8q3V2S4j8TtoNDKPQeA2oSA
 cycf2hGgQ3H+N+D55L3cRsMMtA==
X-Received: by 2002:a5d:484f:0:b0:30f:ca86:98a2 with SMTP id
 n15-20020a5d484f000000b0030fca8698a2mr3604326wrs.24.1686719140166; 
 Tue, 13 Jun 2023 22:05:40 -0700 (PDT)
Received: from [192.168.4.112] (90-182-62-66.rcp.o2.cz. [90.182.62.66])
 by smtp.gmail.com with ESMTPSA id
 d17-20020adffbd1000000b0030fb4b55c13sm10938676wrs.96.2023.06.13.22.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 22:05:39 -0700 (PDT)
Message-ID: <73b5e09d-b8df-9bf6-55df-15b1fbfb587a@linaro.org>
Date: Wed, 14 Jun 2023 07:05:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 25/26] target/arm/tcg: Rename 'helper.h' ->
 'tcg/helper.h.inc'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230611085846.21415-1-philmd@linaro.org>
 <20230611085846.21415-26-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230611085846.21415-26-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +jbzuAb+a0lo

On 6/11/23 10:58, Philippe Mathieu-Daudé wrote:
> Since commit 139c1837db ("meson: rename included C source files
> to .c.inc"), QEMU standard procedure for included C files is to
> use *.c.inc.
> 
> Besides, since commit 6a0057aa22 ("docs/devel: make a statement
> about includes") this is documented as the Coding Style:
> 
>    If you do use template header files they should be named with
>    the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
>    being included for expansion.
> 
> Therefore rename 'helper.h' as 'helper.h.inc'. Since this file
> is TCG-specific, move it to the tcg/ directory.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/tcg/translate.h                | 2 +-
>   target/arm/{helper.h => tcg/helper.h.inc} | 0
>   target/arm/debug_helper.c                 | 2 +-
>   target/arm/helper.c                       | 2 +-
>   target/arm/tcg/crypto_helper.c            | 2 +-
>   target/arm/tcg/helper-a64.c               | 2 +-
>   target/arm/tcg/hflags.c                   | 2 +-
>   target/arm/tcg/m_helper.c                 | 2 +-
>   target/arm/tcg/op_helper.c                | 2 +-
>   target/arm/tcg/psci.c                     | 2 +-
>   target/arm/tcg/tlb_helper.c               | 2 +-
>   target/arm/tcg/translate.c                | 2 +-
>   target/arm/tcg/vec_helper.c               | 2 +-
>   target/arm/vfp_helper.c                   | 2 +-
>   14 files changed, 13 insertions(+), 13 deletions(-)
>   rename target/arm/{helper.h => tcg/helper.h.inc} (100%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
