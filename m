Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp976367ejb;
        Tue, 13 Jun 2023 22:04:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7w3EbUyeGy+ekfF5Ysxj6jk0qBA1kNmcWBhYlUL3LKyOszDXN1vPXFShshXLZgn2uK+ZK/
X-Received: by 2002:a05:6214:b61:b0:62d:f169:8fd5 with SMTP id ey1-20020a0562140b6100b0062df1698fd5mr8599255qvb.12.1686719068169;
        Tue, 13 Jun 2023 22:04:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686719068; cv=none;
        d=google.com; s=arc-20160816;
        b=PCff8jCylUb7uMOe2HxegJtA1cOavsdT0dBlX3y/muvENMBK7yUKfcsEoku2itSoFn
         qoAM4jfW+zOAWjbeP9d5u/wEKgRLYVxMi8Jg5v4spTyyIuMJ9Oy7/Wx9UfvsD/p8e/od
         LLlyqmFG9W6/x6bv6+hAt2W/tDvecPrGbSlO6Nin69f2l3RFZ5w9pHukP4pmW5cbucwf
         4F2Zmx/7JU5w9DEUMfn+EpgzmnByl6caYGs9Dwsf2GRrKtNMtkAjiwPU9AL2jtlGR1S9
         1Jx0a9/tAGGN6voTGe6JM12bZT/Jtfqy+iqPpn7EikaSDkWZgtNf3zG6Myog6CymQRZQ
         IqBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=hd8QRgYY2pVZnoDUQbeBSkxa5UNfOvL49ZU82uCk5Fs=;
        b=cYjaEE3PbNKmH0OY5BPA6nPLIIAsjlUXl/SOhN1xydmShSK/qrvxuOsDZTj+ZeGy6J
         2SjyFLsLeZ3ivRZ2jihbw6i7L9wG+za7M0rRf7PDWZg6ky9UR6KxbpYUBbwCRf8Z/rUb
         JcVmU4MoMXXRUHimr3hTZxJBqqJfFgWTa/EtcD+5W842JMJxPhPZwP0tM4lYkaDFslxl
         bR932JbRFiIdo139d+no66CVgOOQuaPJ6dWWt4322Q4Ukld6FqhdQxrXJ4HRzSNj+roM
         9h/mGf8C/XWN7wdTpHS+510oC7iu+k0jZjpmxzgSzCMbABtddARuTj4umqIRhGK5AGF0
         Nn+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fwWXuKfM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12-20020a05621420ac00b005eda1d1d9aasi8504700qvd.598.2023.06.13.22.04.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jun 2023 22:04:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fwWXuKfM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q9Ifq-0000dI-7f; Wed, 14 Jun 2023 01:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9Ifp-0000cx-5b
 for qemu-devel@nongnu.org; Wed, 14 Jun 2023 01:04:01 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9Ifn-00072V-IK
 for qemu-devel@nongnu.org; Wed, 14 Jun 2023 01:04:00 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-30fa23e106bso3479713f8f.3
 for <qemu-devel@nongnu.org>; Tue, 13 Jun 2023 22:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686719038; x=1689311038;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hd8QRgYY2pVZnoDUQbeBSkxa5UNfOvL49ZU82uCk5Fs=;
 b=fwWXuKfMU43FSfxXX6vhbWrPovzb4eiC7ujozw2yeG3FnFWsIsfWhOLESD0D+nejUL
 q6WzWCcDS+RNifP2yOO+hmg5MsOZpr3aieuNrqSYX1jXlZ7dJgqZP2qzUgRwGscjEAVM
 QAuvk1GUVequ9+dGQR7S9SK9WsqufyP0MTOKyiMNVbWigrTpKsYTMgCbK83HJ7n6674d
 WJBkvEnDpaXJjD1qWVqRTPug+rEPPJr7YANak3gHJ/mYoDXHh37gloZitK/rBxZIfEBE
 iIB82OjXGnLfkKjgBEwZHvRsGgpU9Hs/uCemoU/2i9ieMAkvLXdSGUvtCxEzmlQVYnJi
 V7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686719038; x=1689311038;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hd8QRgYY2pVZnoDUQbeBSkxa5UNfOvL49ZU82uCk5Fs=;
 b=Fve9HZKtRZd9RRR7pv66oAenMEkzBPgYjYCeaLA2ESrOas+DE0DKX4OtL5YCHUvLzs
 lEqChlBXqO3NnLyFCGxiXBnvf6ntUdYrI34mQUmovFNr53VRogoJOX10+a8aHvbTbVjO
 n5nL1NSaiwcADn4RwYLHX6piMNQaeAsbNeEbPiiqoechdiktuXfSPpSTICuaMteLc/8W
 AcPRqmU5sqmg/zjP5i5jN5Al4cNOz0EBk3xPBMWVHv1x37o+OUJw8ZPUCsxD0RPCup0S
 ZQ1LzLA/oR3pQAzN/Ete6ejQLBir93Eo6mGHWDk2TMcYFdPfOiYOSIGmUXgBB4hlA9Xm
 YE7w==
X-Gm-Message-State: AC+VfDyr/XHCeVhOZdyf5ZuYJ3as++ePDjjJTniCe8Z8X8R/0ghgIvdM
 ORdK4mULouarO1fcvz8bXVxyjg==
X-Received: by 2002:a5d:4b48:0:b0:30e:59e9:5e1f with SMTP id
 w8-20020a5d4b48000000b0030e59e95e1fmr6660776wrs.65.1686719037816; 
 Tue, 13 Jun 2023 22:03:57 -0700 (PDT)
Received: from [192.168.4.112] (90-182-62-66.rcp.o2.cz. [90.182.62.66])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a05600018d200b0030af54c5f33sm17013076wrq.113.2023.06.13.22.03.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 22:03:57 -0700 (PDT)
Message-ID: <d4fddb7c-b0a1-6a52-b15d-e86f025c72ee@linaro.org>
Date: Wed, 14 Jun 2023 07:03:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 24/26] target/arm/tcg: Inline 'exec/helper-proto.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230611085846.21415-1-philmd@linaro.org>
 <20230611085846.21415-25-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230611085846.21415-25-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 8X1kjDOpZuHU

On 6/11/23 10:58, Philippe Mathieu-Daudé wrote:
> +++ b/target/arm/tcg/vec_helper.c
> @@ -19,12 +19,15 @@
>   
>   #include "qemu/osdep.h"
>   #include "cpu.h"
> -#include "exec/helper-proto.h"
>   #include "tcg/tcg-gvec-desc.h"
>   #include "fpu/softfloat.h"
>   #include "qemu/int128.h"
>   #include "vec_internal.h"
>   
> +#define HELPER_H "helper.h"
> +#include "exec/helper-proto.h.inc"
> +#undef  HELPER_H
> +
>   #define HELPER_H "tcg/helper-vfp.h.inc"
>   #include "exec/helper-proto.h.inc"
>   #undef  HELPER_H
> diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
> index cbd78cc810..51f8e92ff7 100644
> --- a/target/arm/vfp_helper.c
> +++ b/target/arm/vfp_helper.c
> @@ -19,7 +19,6 @@
>   
>   #include "qemu/osdep.h"
>   #include "cpu.h"
> -#include "exec/helper-proto.h"
>   #include "internals.h"
>   #ifdef CONFIG_TCG
>   #include "qemu/log.h"
> @@ -32,6 +31,10 @@
>   
>   #ifdef CONFIG_TCG
>   
> +#define HELPER_H "helper.h"
> +#include "exec/helper-proto.h.inc"
> +#undef  HELPER_H
> +
>   #define HELPER_H "tcg/helper-vfp.h.inc"
>   #include "exec/helper-proto.h.inc"
>   #undef  HELPER_H

Are these really required, or are you simply replacing what you removed?

r~
