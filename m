Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1611178ejb;
        Fri, 2 Jun 2023 23:02:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7mukXdTi7Ha6HklKY4gT+6k+MghwrjZcV/3GJy09ceeVEtgmAxiNVOgp3dSCd7+HzQhH4z
X-Received: by 2002:ad4:4ee3:0:b0:628:335a:173d with SMTP id dv3-20020ad44ee3000000b00628335a173dmr891819qvb.43.1685772152869;
        Fri, 02 Jun 2023 23:02:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685772152; cv=none;
        d=google.com; s=arc-20160816;
        b=bnBcp19c0dBsNsPhUMRF8nS+m9I8yqPR0ehT68t9fjGGb3EciHjPHYd4/RlTYGs/ts
         CgtOnJrDj9fMalwkjaBJFwtYz+yE2GIAw1NXkQ8kFTM4S1Dr0YL40N5unQdIFZber4BN
         dIjNqv2PpWVxCOYnkZQi3rzXBHNC/pCigC34rZzhbQSjeDf2fI+fG6LgAp/OI0/ZXj8B
         dOT9aLuFGIurVe6ktHRcYVsFzC7tQSHU2otN4oCo2hqeKbtLCVPpxmCZ42F5vCkYsM0b
         HyG4eR86K/xb3e1yGiKn7TjnhtPTYu+S3yyXD6YWSX9mogG5N268jqCgu/m9J2memBxm
         1ePg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=41UMxF+TJoQxJEqn7N3JrXAFDVLQsj1C/nICBtpCnTg=;
        b=SQaE7ReRlIfOsTHwdL17zIplCGi5TaYRap9gweWfvrp/oSk1vMDn3Pdz9W/nUGwI2z
         I9Oy6rc2+iP0vM0bUUZ0UZ1B7Rrbf4I31y9siHSVFH95slP/4qZaO/bQbG4ZzyTPWbt8
         Yie0+mb1xXfZkAu/RD5l6PsYOlh39OgZxTopfVSNgQ7XMdCbIZk3DVV9f2R3QvkaXnJo
         QRmmVsivZltF85oaQkbaU7Fn4ai/400H9kldAl6hNmGEACsb2Q8gErnaIBOIDF14IqdD
         9WgkcoeV8L5ZF/pq426hdaeziQ4Rm8iXIY4MiOzXCUjTqi2DNMsANFTMISGH6ykUdXl5
         xD0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ECe/47jA";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gc11-20020a056214230b00b0061face6e93fsi1927615qvb.404.2023.06.02.23.02.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 23:02:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ECe/47jA";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5KL0-00085J-2k; Sat, 03 Jun 2023 02:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5KKy-00084v-6Z
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 02:02:04 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5KKw-0001zS-L7
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 02:02:03 -0400
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-3f8177f9a7bso26454501cf.2
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 23:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685772121; x=1688364121;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=41UMxF+TJoQxJEqn7N3JrXAFDVLQsj1C/nICBtpCnTg=;
 b=ECe/47jA/aqnSDVlHmZXLz6jT/RWOQUjeMXggFd/pk8ZBe1wNVqvsY/Hntxw2nEB55
 My9i00nXCEEtfZSIdvTkl4UuC/evJtpfUYbysFFclCqsCIeDZMPM0Bxovv6WzxABxgve
 uEx3T4+FFar8jZGioC+n6EWldC+3JzHtIFQf3FYJs/RYC9uVn2YRGU/5Mlv7j2CCTZsA
 JPLKVeg7LXnoxQxXMSs4BRfkyoDaudllfe/4mMdB97iOruOfUKnppeNF4teCTKOfH48k
 gYcuWapsGklgnwY5PscOIJUGq6/BBRB6bW8LIzC8kLWPVBa4p3efFE6DKt3o/9HCV9za
 LdNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685772121; x=1688364121;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=41UMxF+TJoQxJEqn7N3JrXAFDVLQsj1C/nICBtpCnTg=;
 b=WAd7oW5OGaFj/cPJTZGxajhauvsIiaXcU8ry7JSPJa5Jtu9wrFock7rUhBwrAF2Py/
 fA821SZTsD8vSV6IGIGLYeq4x5IzZg7ZM95ZPGk/AUY9iOG+UFmIrtvKeYJXWJ3fgH+1
 VplE17T4NfUA5hu0DwA/EyfUOdhQqaFD4URwHyfHnjfg2/6twqBTlcI/5yk9skHqCsgB
 GbEqY8egA9l1X/ZUf6SXwxPNhu4zlk4rKkTDjxn3CQLrBBlIG6qX5xWtmTFmmgrJRbXZ
 Yq43w1sYRhJHWg02sWooXP8+q9HHeuGidOKSZ1Jy7Z8OTBt+RBwzyIExkRvogJYtBGwl
 SBeQ==
X-Gm-Message-State: AC+VfDzv/cIzCLth5cNETX1fq5aMY6kuLoODvrZGSzLCMGLR3Ct43Lnz
 qims3v2zgl9KC1wkg/RtU5vT1A==
X-Received: by 2002:a05:622a:164f:b0:3f7:fe24:d8a4 with SMTP id
 y15-20020a05622a164f00b003f7fe24d8a4mr737072qtj.33.1685772121462; 
 Fri, 02 Jun 2023 23:02:01 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:66a6:82c2:d794:68f6?
 ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e70-20020a636949000000b0053efb8fae02sm2162518pgc.24.2023.06.02.23.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jun 2023 23:02:00 -0700 (PDT)
Message-ID: <3ed71d98-7c55-c282-0f67-10da44582a5e@linaro.org>
Date: Fri, 2 Jun 2023 23:01:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 05/20] target/arm: Convert MSR (immediate) to decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230602155223.2040685-1-peter.maydell@linaro.org>
 <20230602155223.2040685-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230602155223.2040685-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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
X-TUID: AXXSE6F46dNh

On 6/2/23 08:52, Peter Maydell wrote:
> Convert the MSR (immediate) insn to decodetree. Our implementation
> has basically no commonality between the different destinations,
> so we decode the destination register in a64.decode.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode      |  13 ++
>   target/arm/tcg/translate-a64.c | 251 ++++++++++++++++-----------------
>   2 files changed, 136 insertions(+), 128 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
