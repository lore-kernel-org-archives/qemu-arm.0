Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4977437lfb;
        Tue, 27 Apr 2021 10:11:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwX6DXBXmgwZt57hMCsLxp3ce/kouwOiU1KUGagd9ZMWhog8RjbXnFvhhhxDPlUb7CV0gU+
X-Received: by 2002:a5e:930d:: with SMTP id k13mr20500286iom.61.1619543463190;
        Tue, 27 Apr 2021 10:11:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619543463; cv=none;
        d=google.com; s=arc-20160816;
        b=mydJNQghlCYgr6ogMoISOfh1onSFgBvmqcewdgT1fzVtJswVR/lSZMtk5a5Q6eIrXH
         4H1zo6XbjvsVTOqzAxR3SlfY3HG805FrAIcw0+sulKXgN3MeuCNXSLyLOoehma3cHppc
         2ulA78FLikHPhuOQr9njE9fvary6EEgWDMcDcPrPjciLYTDX1PGOMNRea/DumBiuj9iy
         r0t1afuHXv9hAbW2Ma/8FdW5AxA9m5dFJWO5dJGiG3eefQIHtj//2yhFB+Yi44gLRa3Y
         3iPqvTngAr4DgSO1UOS8KxsALayU48DbornGU0MyqxCCosRXwkklqtZqehgzxhmdtqim
         xhNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fLaBQj31xl74jxr7ut/cO7FC0BHc16En/d1dIqyqIKU=;
        b=eXm178QXy194ZD0aMNfrF3kGpD2Ma1JjsMPr4E215fLIgeUKAswXzBbzCBKnU/hrEJ
         WtoZh4L9o5kBd3izGYcQwXOi9E5Lxr37NvJ3PrFZzuP76vzSde2qIBcGutvsMZX3tE4y
         4Ktiky2czXGtOH3hu8yTq2GeB2v/Oow5licC4ELAz7n8ISYkPyjg+EB62s13Cbx4nq5u
         bpFhivuykq2KlpbFa+2/0P2kgSVrSgDC/YarFm4Uo3IhqYp7FqN3NEM0Zh/+tpS0nlVZ
         qsLSoc/2Xne2FRCbfu8zAg8ZxYj9IukJa6QnZUtjyZvCzZ6gQ9LTrUH/L4o1573ZvOz8
         9KZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="R5tdT0/Y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x5si5002370ilu.59.2021.04.27.10.11.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 10:11:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="R5tdT0/Y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbREk-0003ZW-FT
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 13:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbRBs-0001FU-AA
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 13:08:04 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:41584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbRBq-0005Cy-SZ
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 13:08:04 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 y22-20020a17090a8b16b0290150ae1a6d2bso7620340pjn.0
 for <qemu-arm@nongnu.org>; Tue, 27 Apr 2021 10:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=fLaBQj31xl74jxr7ut/cO7FC0BHc16En/d1dIqyqIKU=;
 b=R5tdT0/YIA7JhAtKtpW7it/c46fS856L0MTdbU2wtyt8+HcFKs3EmzSDR3zI/DDZsW
 53c6GAvoXD5bSeAlCoHjMHrJ2khi1A1H0sZu8JoZNL27hGE5DLgoJsfPmrI9NSlXKLJ3
 Lqhm6zrngOSw86pGbIy+HKpnumbGW5qu3ktjkFfY2TFo5HXz4+e3+0y1QIqCUDCEhM8d
 BxyICQVpBas/sqtbgXPqPm7IMsxbbl/54AMkopY7TikQjp2CIGkfAMkD0ArSgHWsSWrx
 clYtSNwDOS8E+ERt1604A3nFQ54C4cgHEYXSL++7UQvKxb0LGU4ymdFgxx7oMFvB5DSi
 bTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fLaBQj31xl74jxr7ut/cO7FC0BHc16En/d1dIqyqIKU=;
 b=KrAEHBQUCU/1EG3JYbzMEkx86rWFsG6ap8rjhBmIPBP4O9ctSuwrVzv0ophU/YUdJ3
 AtMy40of3zXPkkRy+l8MF68hQjqHYlQ2s/HqfaaNW3BkCXrLn4LS0TXI4v1QCdMi3Rty
 Ln8kDJD9awLi5mYlCA/3niD5oi8HOKF5PWszombHqCA0Idw6eDrwR5GUh5tKIM0H1cxr
 uA1bZgkSHsWM4WFtqAwXCB9ufiPtfiXByK8SmxAWoIY5uJd19XweDeKKEtJAQxIobyc0
 gwkNiUVELSnsph097cgc8jl+Btz2yB49arL42/kxDFeDPxF/ciRXIlKOytqgibAik5K1
 nPaQ==
X-Gm-Message-State: AOAM533LASMWe7mqdypNJK01Lm2d7yojZIpg3boz/CrfOmbRTRqwbI7c
 AdjkKBIcN8LebIhppaFOi+nA/kdNZFCqmA==
X-Received: by 2002:a17:902:b582:b029:ed:562a:6f52 with SMTP id
 a2-20020a170902b582b02900ed562a6f52mr5448628pls.73.1619543281685; 
 Tue, 27 Apr 2021 10:08:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id h11sm2754205pjs.52.2021.04.27.10.08.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 10:08:01 -0700 (PDT)
Subject: Re: [PATCH 12/13] target/arm: Make functions used by translate-neon
 global
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <49dd69b6-b012-769a-423d-bf031e9470ba@linaro.org>
Date: Tue, 27 Apr 2021 10:07:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AYG4ikYN3+7C

On 4/13/21 9:07 AM, Peter Maydell wrote:
> Make the remaining functions needed by the translate-neon code
> global.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-a32.h |  8 ++++++++
>   target/arm/translate.c     | 10 ++--------
>   2 files changed, 10 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
