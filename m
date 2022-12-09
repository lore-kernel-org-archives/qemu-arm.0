Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1287168ejb;
        Fri, 9 Dec 2022 07:20:04 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5KrrqjDebKdZjDARBtzaExTfdEjmNvjaNMjsaPqKgDBVxu4b4d2F06sXG0YIKpBOJDQsrt
X-Received: by 2002:a05:6214:564a:b0:4c7:5d35:21bb with SMTP id mh10-20020a056214564a00b004c75d3521bbmr7869360qvb.12.1670599203936;
        Fri, 09 Dec 2022 07:20:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670599203; cv=none;
        d=google.com; s=arc-20160816;
        b=RnRP8fv+2SnLnOTPUjjng20aNSYBn/dywYqD8cL8l5nHyLb12DgPAMgKscv+nfA0Vt
         PJDRiEKjdMDH2w4MmDI4lvlf7Gpk3EzGGBSTEkMTj/NvmfHCsIc6TrOop3ZuoKAB2Oq5
         RGqeUTFAQuhf0BCZOeY6fo/VFz27OK5TVb+/ZSoJVgZZaSNgOLNJsWrNaiwGSZQ5vBQ+
         XiY6n1WrBNEcxbuiLu7wVtaHT+1QpadJTjF4ldpF3zZMsAB5qsoGAXhJdz1VCF347F9Y
         pqI7TRnOXG4nnZOfmyFiexYeTVB+3c3YaI1ERNCSD91dML1qPHLasdzFAkjclKU9lr+E
         IMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=oAlmrgspxyBB/or+Ml3T+A2YBMWVU6KN57bmFAhRCJw=;
        b=i/S/AWQWa7x8p1g1m71ePz3xNwIrU4UCYQmAjTthXxTG5nDIufMcx/OrLurOvvwJ5M
         ftkEGa0F0xY6UOimhE/+8UJXlkTfLu8gZRdi1FRVNNNXLu8Coj20BtYEwGCg2PFlrRt9
         9YRrPsP0DSMpKitDXniLqRSb0rUWRGU3SQJ2p2wXIf0YG1mL7y0P0HuUCn+Fz9WnKKmx
         Dq8/sUupItxrwpUQajJYo0CwJboyxS8AA87cZY2gHcegUJgGO1ZissCwIwE91jxzzNzA
         m97DYD/1Wps3EosUM2C79dbsuc2doVF0Sa0RF2hZXwXhA1dYCrxC4lsjXjQL7ludQPJf
         PMuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pKRnSBE1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a27-20020a0cb35b000000b004b3f3b63bd2si911135qvf.181.2022.12.09.07.20.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Dec 2022 07:20:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pKRnSBE1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p3fAN-0007xM-V1; Fri, 09 Dec 2022 10:19:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3fAD-0007uL-La
 for qemu-arm@nongnu.org; Fri, 09 Dec 2022 10:19:51 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3fAA-0000TY-8o
 for qemu-arm@nongnu.org; Fri, 09 Dec 2022 10:19:49 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1445ca00781so122058fac.1
 for <qemu-arm@nongnu.org>; Fri, 09 Dec 2022 07:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oAlmrgspxyBB/or+Ml3T+A2YBMWVU6KN57bmFAhRCJw=;
 b=pKRnSBE1h4i57vatDEfJLpQU5PvvIPTffm/cAXwtZC3s5VZBBOpgoD27IWrlCrKFXS
 hUnxNQXnVk8DTlvkIkQ1FMPI84LrcJ/dCSXXpAHSfXnOSfNo76MSPWdMuT5fjhPG97UN
 qZkCf8GlypqL2hm4nkboOi5/GEV1PkNBwpWfG9HZHgOfq3OJZotItmMwUiszgv+eXfH+
 c6P2PR66zSawpHUmfKYhcTX0QodvHOU7FTRD4a6ma0quG0YgpW3YDJuBz2Y6oSZqN/em
 VBscFVJDPDGwddnb7I3q9SCN2nEOOK59cOiEUjwqQZ31awojutvbiKGdvu+MURfm5oe9
 BpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oAlmrgspxyBB/or+Ml3T+A2YBMWVU6KN57bmFAhRCJw=;
 b=SZW7YJRF4rMdMUa/iWi0un7S1zSB9+tjDm3mNBCze7ykLLyvGOqUrwA9Py+oDrb4X9
 dzZCsg2pBaJHJYP7CVR6JlGDNW4TQtTnpexYxxE5EigvnGzXAAOslny35Yu12kb29V0B
 0xToIMIkvxN7TaTfn4WR080qmqDGZ+YFvlcEVKI1Sq18vqfNKoAUftPk92AhX+xcN23I
 m1tw4dYAs1MDFuK5oL3sTLrbXFiv+YTWmAUhO8ys7VFIUwARqTqnqfthpkwdCW38K7ku
 uuFKzSCfmR2Fa2WYEGlmmAw0ALboiJaft6ybbYvUhQEixUf3RSNgAYwPp8pzmLfTvZro
 pqyw==
X-Gm-Message-State: ANoB5pmlJzr3JhHRvbc6Y91rDmys2MLl139ozEciaJc3/agZBVLMhYiP
 0iI8m8ZGbCEqXljpwnw31hc+ig==
X-Received: by 2002:a05:6870:4b87:b0:144:a3c3:ad52 with SMTP id
 lx7-20020a0568704b8700b00144a3c3ad52mr2761821oab.9.1670599183329; 
 Fri, 09 Dec 2022 07:19:43 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:e9d4:8f23:13a5:7d87?
 ([2806:102e:18:2efc:e9d4:8f23:13a5:7d87])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a05687061c800b00144da40cee5sm982574oah.10.2022.12.09.07.19.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 07:19:42 -0800 (PST)
Message-ID: <5f838c11-765b-72a3-0d40-5dd46994fd8e@linaro.org>
Date: Fri, 9 Dec 2022 09:19:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH-for-8.0] target/arm: Keep "internals.h" internal to
 target/arm/
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
References: <20221209111736.59796-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221209111736.59796-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.288,
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
X-TUID: 9s+1t57zVG26

On 12/9/22 05:17, Philippe Mathieu-Daudé wrote:
> +++ b/target/arm/machine.c
> @@ -6,6 +6,45 @@
>   #include "internals.h"
>   #include "migration/cpu.h"
>   
> +/* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
> +static const uint8_t pamax_map[] = {
> +    [0] = 32,
> +    [1] = 36,
> +    [2] = 40,
> +    [3] = 42,
> +    [4] = 44,
> +    [5] = 48,
> +    [6] = 52,
> +};
...
> +++ b/target/arm/ptw.c
> @@ -42,45 +42,6 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
>                                         ARMMMUFaultInfo *fi)
>       __attribute__((nonnull));
>   
> -/* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
> -static const uint8_t pamax_map[] = {
> -    [0] = 32,
> -    [1] = 36,
> -    [2] = 40,
> -    [3] = 42,
> -    [4] = 44,
> -    [5] = 48,
> -    [6] = 52,
> -};

How does this even compile with the remaining usage of pamax_map in get_phys_addr_lpae?


r~
