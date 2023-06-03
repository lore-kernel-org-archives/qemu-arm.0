Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2003967ejb;
        Sat, 3 Jun 2023 16:06:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5jD4tPArXaP3ciUn8Mbj48OUU8b+m3bfjlQ0qy0TA55Y5kfCWTpGfGQoWogMmo0PElYeJo
X-Received: by 2002:a05:6214:401c:b0:616:7977:2460 with SMTP id kd28-20020a056214401c00b0061679772460mr2422643qvb.24.1685833576431;
        Sat, 03 Jun 2023 16:06:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685833576; cv=none;
        d=google.com; s=arc-20160816;
        b=LMmtf/EhTIZK5CfugnhxRhOwzUq5YQoOih1DnPapAHgOZRD+CNj6HUjAhKr/TGe1mU
         dVyug15dIBMiXK2Gae2CWUOSAm539AXF6YlXwjUv0/D36nby0vhhQPPgIsvudbtVloSB
         jciReF736Vr7/e/TnrRXQb8mWpv30sclpGcuBxPhbNOFvHj5EzdfXG3Pf5QBzzUDwHkH
         HaSP65WCqyUeAJdq78LE6OMGUbxVqj5ZUu2Jj6mkvmexlJLmhV79H37xcVjpIJsL7/Xj
         DBHR38TCET2989hf1PG5ZYUGhtd/CkFGSGkBBtkhDwhMXRHUfXLZCMrLpWewtrwOo9z8
         K77A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=xpQwXi2Qlb2MDi8WtoNb9saG0RJz2uUyMXLjvIiNrSQ=;
        b=gHfqqs1pfgDb36X5km4eg23XEEJn1FTPNH/XRq0cPE8/bOazbXY5VgSAKICPhdE2Qc
         UvYG5ql3jboU2p2TA2S2sNnou89bmPpDyMESLRUVTe3MN+faLXe6tLIBWzKCku9Y3cS7
         eErSLtTm2hMVDixkdCygedAYBm8Aib63tywBtEls02324Ofm73X+ZGYk1DsMLf2HPpN0
         srFvFfRRo/DtH9/KtgdPP7Ek7bL6+rj+MSjwesWTbg2aJSHwCyZdc1+8H5HCGQhy6mKF
         pJrx1T3HP1ZxtCsGYfyH6vm3hNNX1Cjppv2ZLq/nY09Tpn1DkCNkG/P+F21v3sDKCcws
         FgAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rRGOniqX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kj24-20020a056214529800b0062834e0ae69si2827345qvb.75.2023.06.03.16.06.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Jun 2023 16:06:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rRGOniqX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5aJa-0007R5-9Y; Sat, 03 Jun 2023 19:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5aJY-0007QO-8j
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 19:05:40 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5aJW-0005Vy-Oq
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 19:05:39 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-64d44b198baso2547697b3a.0
 for <qemu-arm@nongnu.org>; Sat, 03 Jun 2023 16:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685833537; x=1688425537;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xpQwXi2Qlb2MDi8WtoNb9saG0RJz2uUyMXLjvIiNrSQ=;
 b=rRGOniqXpH1dzhIj/PwMXuwXQAP/kBh0C02o/KGDEEy7vVafKsBY5MXUOiCydim58G
 c8WtQbYkXAeXWwv1opKkXQdLqB2Tv189PofZV/lzQFpfCmzHzQHifjjBKwaMJi/NOdc5
 YC4apg0AvfP2efZpuTd6z3lBRjLKSCEx0o4BdIO50aBswhFXFz7Z7mpWKTxUHqnjRW45
 67CVDH+56c5fWHStDhqbjs5DNc5fQ7qW0hu4dxLGtphRBe7H8gS0ELzhrgOs+K4Uwarg
 tjZi9GMCt3LZRJxluUH9eSpeEif2rihzoWd8+i/YbKw+5Vxr2CkjQQ6fzZ6nZFCq1d8H
 PvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685833537; x=1688425537;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xpQwXi2Qlb2MDi8WtoNb9saG0RJz2uUyMXLjvIiNrSQ=;
 b=fboT9DHkN2tYQwk353niF0vVuDARCUWpab2gkyBoOBROYd1BHSVLdnr+Pn6aGucnJF
 d4HRkxI43u6nXCKgPqdKqF+80s+UPy3C0msol0WKmaKPAI4SfATP9qlD5/Ds9TJ8xDJY
 HHUNKMTH16DNQlTu9Apf1nAGJ+28uj9PdXJopCMe9GBaovuA8mr+DCa2bFb/OD6X83zE
 t/+nMBoRHJEcqXPAFxnnhGnk1EUke/2ukAk+YTYttXrXkAby+X20N4xrl0XWHvKJcinp
 Z5UJp4mFzmNz6jilZ0iAcZp9PlJUfX+SEIxqRxBCtPm++M7ACw4SrkRCQQGYddAJHlKV
 RN5g==
X-Gm-Message-State: AC+VfDzETpXQRG3ije6GRhJhfBzEEzX58aDlerrFU8mNUAU2C+lLTAOO
 qM+mn/LJkOIDGmse3gk9s4v4fw==
X-Received: by 2002:a05:6a00:369b:b0:64d:42b9:6895 with SMTP id
 dw27-20020a056a00369b00b0064d42b96895mr9602418pfb.5.1685833537142; 
 Sat, 03 Jun 2023 16:05:37 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:9a37:84b6:b3f0:f301?
 ([2602:ae:1598:4c01:9a37:84b6:b3f0:f301])
 by smtp.gmail.com with ESMTPSA id
 z6-20020aa785c6000000b0064d2ad04cccsm2924006pfn.175.2023.06.03.16.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 16:05:36 -0700 (PDT)
Message-ID: <daa2b742-7a4c-0bea-c483-1da660ed0dcd@linaro.org>
Date: Sat, 3 Jun 2023 16:05:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 11/20] target/arm: Convert load/store-pair to decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230602155223.2040685-1-peter.maydell@linaro.org>
 <20230602155223.2040685-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230602155223.2040685-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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
X-TUID: TFikNN+bcXi9

On 6/2/23 08:52, Peter Maydell wrote:
> +%imms7          15:s7
> +&ldstpair       rt2 rt rn imm sz sign w p
> +@ldstpair       .. ... . ... . ....... rt2:5 rn:5 rt:5 &ldstpair imm=%imms7

FYI, you don't need to extract imms7 -- imm:s7 inline will do.

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
