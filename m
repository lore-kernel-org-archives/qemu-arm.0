Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp582618ejb;
        Fri, 9 Jun 2023 12:00:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5SxJFMhwGq3cE8SaKmV7QDdoStt+1uvwoeYh9cz4u9bMB8MMHOHyvfUZLHL2OnY4sAxARS
X-Received: by 2002:a05:6214:2428:b0:62a:f634:882a with SMTP id gy8-20020a056214242800b0062af634882amr2825892qvb.33.1686337204720;
        Fri, 09 Jun 2023 12:00:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686337204; cv=none;
        d=google.com; s=arc-20160816;
        b=FB84zqIXq7DnVVVvvoizUwr1vKOB32gxW6BGlBlwkMR/Pl+IcP+0GYdfHVx4h0zzpv
         2654e3NKemPnZMYzX4niDvjSGKJoNmmYaOSsveyEFfRpHC0ZR56UTksjbh0D8pEu8fYD
         bB9T/1rhF52cF6iaHjZOsGFs4Jy1YTZt2EfHDW9Gkfq6rGBBTraQBBb1xYRVe3qsh00Y
         pQqx0tRv5MI1gadE3fwD32geNrrPszmdQM9ob0SnmusousIbCCvaSnMZ1mRQy2m/iQa0
         0n8jRB/uVHeSf6OjtQNW+Oexq5jVquC3VzKSVkhu3xajOT/TKrCQJkmNJFyTyJGruQgV
         vopg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QI+tiuhPeVZrW0nLn35iWBDTOQ+amXGe6PjfU62NhSM=;
        b=AVKrhwq4uCDnDvoHK7uUyYnh4XU4p0bmu6T9X7mc1deyjBUGt4miysnYXjfOmqkCKM
         yP0G1i9zedjdWEOgbgaFez8Q/r3ux/LHDNQ2EfmrsckOqKFrM9I+UULBJwaSKiEJS/aS
         0HPQmt0JEvA+Z30bcPoqKVjwAmlmzdyNW2pI9vM/rHpeg0ahvTNB3AfpH9b5nvdId7d8
         ALiJoITFcOP6IzHyxuefW6zk2x1nbD2TA5AGkzM1TJt3hpnYnD6ki0RuXQd7lUJU65Ah
         J/jEwwKJuTbW+DR9OTEGkmwWIqg5Lg+BciHobSjySU7bukiqOTfAZKD1fqVea81ChXL7
         D7vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xJqRRaO7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2-20020a056214062200b005ef482db809si2632556qvx.526.2023.06.09.12.00.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jun 2023 12:00:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xJqRRaO7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7hL0-0000WZ-Ny; Fri, 09 Jun 2023 14:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7hKz-0000WE-RK
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 14:59:53 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7hKy-0005Qm-56
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 14:59:53 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-651ffcc1d3dso1721587b3a.3
 for <qemu-arm@nongnu.org>; Fri, 09 Jun 2023 11:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686337190; x=1688929190;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QI+tiuhPeVZrW0nLn35iWBDTOQ+amXGe6PjfU62NhSM=;
 b=xJqRRaO7WTzUJUSJURbu8L/gUZpN0lk7yCdhHbOfmkpjwXgQLkV39FMqcyleE/Kxqo
 eBe2rHHZXmauRdy3R9YYcbmb1Jb9ezNqEHkVh6msJjKIt30LMX10n/OjY8MaADybHfTB
 Kb3yb4qv8LnCP5IN/nqpMKyLeDVn8/ibKJmX2065ZD5Fg4kyiAVtmQbnMJfyozpWFjbR
 x4uFFa6F4TALOuFl5Mnd1vr7rzH6YqYfMOJx1E1LToc8y4OcsX9k1iev8L+WOBf6FoKH
 MBh11+4j49C8Tju4AQXejHv+jWW5XIaqxt3fszAvBZEF0PfIHWdhViM5Sg+DK92EOxTE
 aXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686337190; x=1688929190;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QI+tiuhPeVZrW0nLn35iWBDTOQ+amXGe6PjfU62NhSM=;
 b=CcULrhTXwtr7oOTuC+lJWOhCrIVY0t+smFFNPeXhBXUPBSF6K8c4gjxpvnUCeSzgS6
 gK9YMWrhpMtIKx+io+2ICVDlFrxINIyKlLd30t/v8ZrbzFpOFKvVFkaHNs4xNf6kEVI4
 C93/tOQL5HT2KektJb3rWjaOcHmSiN7umO/+vMnarVelRlkWl81XBe63cFmKvU8YWKas
 tPMo+fGXXjLxDRIG4X/rYWhpmVUY7nX/C6Zt/jUhFyuVBTLgGNB++1km35uzbmrZUbni
 /aqGHlHjsHobUB2CZAfrFpFDF5YlQsPaAWahcrZe/fm7BqTZtUd7S0HJIMk2TBygQgWF
 VlEg==
X-Gm-Message-State: AC+VfDxTWPLL6OoIFkPedXqSuOApEGs2c7VgBzzQvOJwW0M/BTUEQwFh
 9SnWGAEOuT6WBnOpq19coRUUD1bzW4DjNIEiVe0=
X-Received: by 2002:a05:6a20:a10b:b0:116:fc1b:fa3b with SMTP id
 q11-20020a056a20a10b00b00116fc1bfa3bmr2087107pzk.9.1686337190608; 
 Fri, 09 Jun 2023 11:59:50 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:20be:c4cb:f609:8cca?
 ([2602:ae:1598:4c01:20be:c4cb:f609:8cca])
 by smtp.gmail.com with ESMTPSA id
 u22-20020aa78496000000b0064ff643f954sm2967345pfn.88.2023.06.09.11.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 11:59:50 -0700 (PDT)
Message-ID: <5624531a-48ca-9d78-1046-108b8e4df603@linaro.org>
Date: Fri, 9 Jun 2023 11:59:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 09/22] target/arm/tcg: Reduce 'helper-iwmmxt.h.inc'
 inclusion
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230609104717.95555-1-philmd@linaro.org>
 <20230609104717.95555-10-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230609104717.95555-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: QpqgRlhRYHr8

On 6/9/23 03:47, Philippe Mathieu-Daudé wrote:
> Instead of including helper-iwmmxt.h.inc via helper.h which
> is included by all TCG files, restrict it to the few files
> that require it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/helper.h               | 1 -
>   target/arm/tcg/iwmmxt_helper.c    | 6 +++++-
>   target/arm/tcg/translate-iwmmxt.c | 6 ++++++
>   3 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/helper.h b/target/arm/helper.h
> index c4a321c0ea..dd12fee107 100644
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -949,5 +949,4 @@ DEF_HELPER_FLAGS_5(gvec_uclamp_d, TCG_CALL_NO_RWG,
>   #include "tcg/helper-sme.h.inc"
>   #endif
>   
> -#include "tcg/helper-iwmmxt.h.inc"
>   #include "tcg/helper-mve.h.inc"
> diff --git a/target/arm/tcg/iwmmxt_helper.c b/target/arm/tcg/iwmmxt_helper.c
> index 610b1b2103..fa84b5f672 100644
> --- a/target/arm/tcg/iwmmxt_helper.c
> +++ b/target/arm/tcg/iwmmxt_helper.c
> @@ -22,7 +22,11 @@
>   #include "qemu/osdep.h"
>   
>   #include "cpu.h"
> -#include "exec/helper-proto.h"
> +
> +#define HELPER_H "tcg/helper-iwmmxt.h.inc"
> +#include "exec/helper-proto.h.inc"
> +#include "exec/helper-gen.h.inc"
> +#undef  HELPER_H

You should only require helper-proto.h.inc here.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

This was exactly the sort of thing that I had in mind.


r~
