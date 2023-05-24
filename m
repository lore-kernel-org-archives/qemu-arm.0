Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2761735ejb;
        Wed, 24 May 2023 12:04:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7NYtRd4MrJygDaTY33Hm0uNEM/G5QaRO1dL4X8dnBd/EN3m5xiomLzPkEmd1jr6AMFwIwk
X-Received: by 2002:ac8:7e81:0:b0:3ed:86f6:6ecf with SMTP id w1-20020ac87e81000000b003ed86f66ecfmr26093255qtj.46.1684955094246;
        Wed, 24 May 2023 12:04:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684955094; cv=none;
        d=google.com; s=arc-20160816;
        b=gYzyvDlRW8xOSbmDNmPnR7ewEoAr3R/1fg7FeS6Os3EwBKeW5trluWQnRA9FHCLXAu
         74q6FUhbHqOtPMDWdIPwkikVHH/t82pP7o39HtcsVI9efR6IJGrKSWTo7ZW4xg2333R9
         1Z8B2obTYFCBzNOt5Dx68KkSiEnbzhVs9UNaATxwWMQsciKXaAEpLO0UkAmGbnlHO9sX
         n13Hk82nKCN/V3VPhpyGR942fkB6iXzyAoUv4YdNIifrr/c5P1cVmiaqnQseijiGXHpz
         Pma/2q90h4aFj2JsKiLnDfx42ECAnxy2V0UfiQWk+3HDfitXFm6hlpgRz2v9Oovk3g63
         /UUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=G84ipAdGubOM0FDUyEbPrBlTei+iFwORLXboEFro4U4=;
        b=GDhebGxn5944g1/7EL9s1mR+9zTQHW74LIPBc6BtHZkgKtpxWn2oZOKy42WpiC4jd3
         rEvkgLPF6eQLpqNsycXr3KikB0vU1Hi+u1qWGHmixCtdMgpi0epvj1Z8hDyc4AC/sanP
         FpTw9J6tquBMPbSOHSft+IDv/3+UPTqb15MaP6YLsbsq4jB2/Pp+ikxAzb2fk5RhdzSL
         a/UR4jlbXjgZUj/e6rJO9DvO+gN3Z338+9BQmjQMEpSEtdhvjcn5BEytbztJs1sQgnnT
         b/iFapZlLcIzj0IZ4sp3loUwLhS4y7IqwaUXJ+k0i6ofeHVGOTg5LclLfTeh5eqIiAK1
         HZaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vnnsLnqV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v12-20020a05622a188c00b003f6b18c4746si4470555qtc.78.2023.05.24.12.04.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 12:04:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vnnsLnqV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1tmy-0001r8-Uy; Wed, 24 May 2023 15:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1tmx-0001qh-EQ
 for qemu-arm@nongnu.org; Wed, 24 May 2023 15:04:47 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1tmv-0006jt-Qy
 for qemu-arm@nongnu.org; Wed, 24 May 2023 15:04:47 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-64d41763796so967787b3a.2
 for <qemu-arm@nongnu.org>; Wed, 24 May 2023 12:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684955084; x=1687547084;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G84ipAdGubOM0FDUyEbPrBlTei+iFwORLXboEFro4U4=;
 b=vnnsLnqVuma47edK2cj40r35EXZHcHF8VVd4jl2LMfqXbBioKmmKwdItUJhAXekYfE
 joVbKblREZqLGXa9V8wcLthSE5LUqAkcRP9YtaIaC6KNtWdrizZ4/wrdIMMCmx2o4Bsv
 1qqkGSh9/FVpAjH0vyF/Ucis/pC+mC9DBx84oVgy5UQzUPJ/bfT4zKpluLvuQrW8rfY/
 vgFSjDcZLicWVGKijAHE6mFEZrmMT2Pml45VlEmUj03tqZ5OUlL0xxQT10bMO2Lfj9bJ
 4xhGgOyXK/q/o+MKkrAl2pUv9iMYusI395mg47ZIpilCKsTEANU3q/Moq/jEmMr05kRY
 divA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684955084; x=1687547084;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G84ipAdGubOM0FDUyEbPrBlTei+iFwORLXboEFro4U4=;
 b=bG/KA6vuWpbUZEF7eEuq90pBG+QMbOT5tfHVnABC+xzTh0PUGF5O8Tp8h8h6H/wSas
 1E3pRi5PtP815YZbbefqe8tFgjoMzhuJ2SbjzOT8w/plSeWrdk6+NOkgXJmbAmk9qUFw
 wHrWWZSbWqzv4kvPZslY882bFJnWvhSPTVZPP/AdMCRqXD2R9baNhUays290brJ792hx
 vs9l5Pm/OjTV3/xsvjNrK/Oge99UxSPPl7l/IuorEzoC0dfXX+NHZFED5efr+8nXXxwq
 gRLTLJF0UpMTXmxP8AIJC4TjTYAHkB4GlTQOnfAomuwBnfXE/AkR2kwFQfwqz58Mt7fU
 d8gA==
X-Gm-Message-State: AC+VfDwxF8M3AE3lAttDJNbsRt2GhkB5wydsNatCw4GAYyZVUZdSnmql
 kvvrDYhYutPtB+QgwER0VJf20w==
X-Received: by 2002:a17:902:ea0f:b0:1ac:8062:4f0b with SMTP id
 s15-20020a170902ea0f00b001ac80624f0bmr19574561plg.59.1684955084373; 
 Wed, 24 May 2023 12:04:44 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:6b03:9af2:33c1:3d6b?
 ([2602:ae:1598:4c01:6b03:9af2:33c1:3d6b])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a170902d2c200b001ae3f73b9c1sm9150911plc.101.2023.05.24.12.04.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 12:04:43 -0700 (PDT)
Message-ID: <96867a81-5381-0be3-e28b-3e1a9f561e8e@linaro.org>
Date: Wed, 24 May 2023 12:04:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 03/10] hw/arm/realview: Introduce abstract
 RealviewMachineClass
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>
References: <20230524145906.33156-1-philmd@linaro.org>
 <20230524145906.33156-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230524145906.33156-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
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
X-TUID: dS+NMxWvRShc

On 5/24/23 07:58, Philippe Mathieu-Daudé wrote:
> Introduce the abstract QOM TYPE_REALVIEW_MACHINE to
> handle fields common to all Realview machines.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/realview.c | 22 ++++++++++++++++++----
>   1 file changed, 18 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
