Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp22440ejq;
        Wed, 17 May 2023 12:52:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7uAeNlkg+yg7vvMjOMLHgpGnMpF3vVtLnR8FsiLCRzCTL6RUch/lbRmGQvw4nnlUh6vrAB
X-Received: by 2002:ac8:5811:0:b0:3f3:6708:c7bf with SMTP id g17-20020ac85811000000b003f36708c7bfmr1743635qtg.0.1684353128012;
        Wed, 17 May 2023 12:52:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684353127; cv=none;
        d=google.com; s=arc-20160816;
        b=fxmU3ufEV7CXM1+136jvXWWWSm8W2GloNTrducTcQW/3ABgpAEMUBr0IFq7ObKuzDk
         QWF4bVrMiepOAclBaNbfsgJH2PnwPbexz1pFFZqw9sKyQQqX/KWdHkbuPcB+onK6EFhC
         WeuQWTGJzBlp59jiNErcipnLDtfg1eanQ5hPTRYu8EMeDHyvTV/5/GQ+xGYEYfkP35Bf
         Eq5SntSwgZBZnNAA7xXhZ53NG2esS2Xk0H5ff2FCV3x47kZGqI4M0E/alOC9RMjPcWQd
         0rLw5uDRIaVELEEdI6lIHFa3f7PerL0LOVXzO9YUJAeQdCR2K9ethtWuGoOgP3xkTvdY
         WDzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=yzUH8Amofmfhyh3Wcz52s6RgYf1r66fh6ErhQdgGoOs=;
        b=wmviBRu+zL6PpgGFhMEikcyl4qy8a7CPAgV1hcnlfB4N78pgVJ85Bxx6z9/PXkbMlk
         nII4+cl9WnLvWpnb1joGJlaZ9hfRMXJKpsxtcolqIETZDn8XNQKw/c5RFiRVTVsq6jVX
         sRFiQsNk2yQYw7Ucngq4V15pksMtw/ix0LvqR2EJzkF/un9z8wGNfEQe4z6gg1N8TQ+7
         jorj6rxXYDAL7mTSXrQuD3zuWJZJXPHUcBx2OFAR8PqqaJXDGIZfeAUVG3j8jic7o3Go
         wSCFCDLWNQpmCjKLp+P3z/Q3EsDmwPd80cAph9/8kWViNZSrktfP2v1/yhhdABt9FWwG
         4Nbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YQge4Xwo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pj32-20020a05620a1da000b0075947ef3256si1843520qkn.719.2023.05.17.12.52.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 May 2023 12:52:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YQge4Xwo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pzNBe-0008SW-AC; Wed, 17 May 2023 15:51:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pzNBb-0008S6-5L
 for qemu-arm@nongnu.org; Wed, 17 May 2023 15:51:49 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pzNBZ-00088y-GF
 for qemu-arm@nongnu.org; Wed, 17 May 2023 15:51:46 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-52160f75920so795763a12.2
 for <qemu-arm@nongnu.org>; Wed, 17 May 2023 12:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684353103; x=1686945103;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yzUH8Amofmfhyh3Wcz52s6RgYf1r66fh6ErhQdgGoOs=;
 b=YQge4Xwoe0wnVVGpxN3VuhBPwFu6RhEBSMs4+wGdIf/dkaaHSTqe1Zmc8kiKE7TH6P
 6RIz7VkYg/kc7hMquXiJWkunr96PIiG1XIfKVNJgBCEOmiBsVuYBRhVhIB0J7jhN2Tki
 hKt7zLLQcwfocZo67+k2kLfPaS+gX0n9JBjnDOx+q3CKLoYrpbkGZc3Exccww/L251Re
 eKIwIU57od5MPkdLW4qVV7l1nit4juA8PBTpoI3vQqU4xrmNCeVq+P+1uwWg/TUXcLIW
 LW5zGYUsx9xQ8keFgdwwkgzuY2TJsSe+7iN4/1kjeiuR2KAyNp8z1npuOL9VJMIaDgAh
 WWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684353103; x=1686945103;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yzUH8Amofmfhyh3Wcz52s6RgYf1r66fh6ErhQdgGoOs=;
 b=UX/Ifmmmq3Zbf0jVxQKJOTbL164Zd5Rim5+0CEdzCRqbkI1Cus+1U2AkstfAcjXk4k
 m5wNOWpHQZFESu7wIYZg8mfmxEByYOE+1VvLIBEJe/2d4qlt3WmfrML/hRcDuk5iEbe8
 bJzhjP+8zEoQotkhnkbZuXU3vXeUYi02Q1+8UbppObwOXv6U/NPtnOglj4wNjHIzsP5k
 UJQxtU5+3p6MK80NJ6kDqopXjdPmTEgHH77j2tGDNaddHKEELy0z3UlJw11mfOWmXfrH
 DsYpwZ0a0pueNVj2HKlA9M4X+JRRDSrAeuaNG9xT4JSQtfU5ynyQuC05heKltlnkFurA
 Y2Pg==
X-Gm-Message-State: AC+VfDxerSowfGH7MibeNvz7iwYA4j+XD5h9JrKL19puzZjE/YlA/XyK
 1yxYtQpSQjZvvvX6yPd4T6UHxA==
X-Received: by 2002:a05:6a20:7f8b:b0:f0:c858:2d68 with SMTP id
 d11-20020a056a207f8b00b000f0c8582d68mr54223424pzj.35.1684353103289; 
 Wed, 17 May 2023 12:51:43 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:17a4:1aa0:c49d:e8f7?
 ([2602:ae:1598:4c01:17a4:1aa0:c49d:e8f7])
 by smtp.gmail.com with ESMTPSA id
 f23-20020aa782d7000000b0063d63d48215sm15654529pfn.3.2023.05.17.12.51.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 May 2023 12:51:42 -0700 (PDT)
Message-ID: <6051fefc-a5b0-0c45-b1a9-ebdf2717caa7@linaro.org>
Date: Wed, 17 May 2023 12:51:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] target/arm: allow DC CVA[D]P in user mode emulation
Content-Language: en-US
To: Zhuojia Shen <chaosdefinition@hotmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beata Michalska <beata.michalska@linaro.org>, qemu-arm@nongnu.org
References: <DS7PR12MB6309A0F097FA4FB9D7CACB5BAC7E9@DS7PR12MB6309.namprd12.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <DS7PR12MB6309A0F097FA4FB9D7CACB5BAC7E9@DS7PR12MB6309.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.412,
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
X-TUID: 7GawgtqgBlnO

On 5/17/23 10:31, Zhuojia Shen wrote:
> DC CVAP and DC CVADP instructions can be executed in EL0 on Linux,
> either directly when SCTLR_EL1.UCI == 1 or emulated by the kernel (see
> user_cache_maint_handler() in arch/arm64/kernel/traps.c).
> 
> This patch enables execution of the two instructions in user mode
> emulation.
> 
> Signed-off-by: Zhuojia Shen <chaosdefinition@hotmail.com>
> ---
>   target/arm/helper.c               |  6 ++--
>   tests/tcg/aarch64/Makefile.target | 11 ++++++++
>   tests/tcg/aarch64/dcpodp-1.c      | 47 +++++++++++++++++++++++++++++++
>   tests/tcg/aarch64/dcpodp-2.c      | 47 +++++++++++++++++++++++++++++++
>   tests/tcg/aarch64/dcpop-1.c       | 47 +++++++++++++++++++++++++++++++
>   tests/tcg/aarch64/dcpop-2.c       | 47 +++++++++++++++++++++++++++++++
>   6 files changed, 201 insertions(+), 4 deletions(-)
>   create mode 100644 tests/tcg/aarch64/dcpodp-1.c
>   create mode 100644 tests/tcg/aarch64/dcpodp-2.c
>   create mode 100644 tests/tcg/aarch64/dcpop-1.c
>   create mode 100644 tests/tcg/aarch64/dcpop-2.c

I recommend splitting the tests to a second patch.

  +++ b/tests/tcg/aarch64/dcpodp-1.c
> @@ -0,0 +1,47 @@
> +/* Test execution of DC CVADP instruction */
> +
> +#include <asm/hwcap.h>
> +#include <sys/auxv.h>
> +
> +#include <signal.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +
> +#ifndef HWCAP2_DCPODP
> +#define HWCAP2_DCPODP (1 << 0)
> +#endif
> +
> +static void signal_handler(int sig)
> +{
> +    exit(EXIT_FAILURE);
> +}
> +
> +static int do_dc_cvadp(void)
> +{
> +    struct sigaction sa = {
> +        .sa_handler = signal_handler,
> +    };
> +
> +    if (sigaction(SIGILL, &sa, NULL) < 0) {
> +        perror("sigaction");
> +        return EXIT_FAILURE;
> +    }
> +    if (sigaction(SIGSEGV, &sa, NULL) < 0) {
> +        perror("sigaction");
> +        return EXIT_FAILURE;
> +    }
> +
> +    asm volatile("dc cvadp, %0\n\t" :: "r"(&sa));
> +
> +    return EXIT_SUCCESS;
> +}

...

> diff --git a/tests/tcg/aarch64/dcpodp-2.c b/tests/tcg/aarch64/dcpodp-2.c
> new file mode 100644
> index 0000000000..3245d7883d
> --- /dev/null
> +++ b/tests/tcg/aarch64/dcpodp-2.c
> @@ -0,0 +1,47 @@
> +/* Test execution of DC CVADP instruction on unmapped address */
> +
> +#include <asm/hwcap.h>
> +#include <sys/auxv.h>
> +
> +#include <signal.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +
> +#ifndef HWCAP2_DCPODP
> +#define HWCAP2_DCPODP (1 << 0)
> +#endif
> +
> +static void signal_handler(int sig)
> +{
> +    exit(EXIT_SUCCESS);
> +}
> +
> +static int do_dc_cvadp(void)
> +{
> +    struct sigaction sa = {
> +        .sa_handler = signal_handler,
> +    };
> +
> +    if (sigaction(SIGILL, &sa, NULL) < 0) {
> +        perror("sigaction");
> +        return EXIT_FAILURE;
> +    }

This isn't: if SIGILL, exit with success.

You don't actually need to register anything for SIGILL, in either test, because SIGILL is 
a fine exit for failure.  So is SIGSEGV for test 1.

Also, you could merge all 4 tests and save some CI time.


r~

