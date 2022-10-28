Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1506752ejn;
        Fri, 28 Oct 2022 12:29:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6hC0/6vv+k0bV9qA936DS1MLUU/MutcKurrO8Z1MI85z6C8iPJptH4bPBAlxy2XCEBj2I3
X-Received: by 2002:a05:6214:19cc:b0:4b7:768:aca1 with SMTP id j12-20020a05621419cc00b004b70768aca1mr1106505qvc.40.1666985394634;
        Fri, 28 Oct 2022 12:29:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666985394; cv=none;
        d=google.com; s=arc-20160816;
        b=bT3YfG0K2KiH0UfqDWOzKU9ZWv+ozDTxEkXb50UcAY7BdnlD5CT2Zs6WxCtZ+NxDnB
         pOVnTYGn2BTXkO4N9s2Qm+YIrow923Okt1Z6u0A9XR6EB8vaEYLYzEs1gq5U/jsJc8pb
         EOvUSoF8IocqlKbbzRvL8tQz1bH82mucB7NlNgMQoUmzlFT0b92WWrv/A/3jAjiZ0h1g
         2kqUC0IDJjt/7J+v5k0XFVPjgr0gCnvsT8xDmzSAIMrsHIhdcHsxqepFDmOymolyfntL
         N69WeNvdJAaHjhmF+LLruI6MDobqGa8ROWca/COVo1BYGmwJnJcFcYhufssxAEf+CUvp
         9q8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=3c/wXoG10dQHdfbeEv3PKxbfo1wSzt4UiAO5gTPYV3Y=;
        b=O6pRkwE6ucdHTp/PGHNUYVCsscze5hUtbcpUtMsrqq79SCiKyOlpGGWE6mDdkzKZ+H
         1pYdAO63UBboPcJobTAK045zsOiYP1WiSoNNmTr22QQDjBGS8H8HGtgHr1tKxuB9BtgM
         51mK4hBZCv16/L5muZO42h62Cx+ui4F51/v1XrvXy0FWb0zj6kzVIK1idx0LxxBf3e15
         sCDWkiswZYTAY2FpG0Zq7GnGajDEBi0etmInRnoGTMx9at3nvjNOASrOWGrfu84ogMHy
         vbgRO6cdXSm7cwXuXAj3HPx+WDidDbZfDgYRgCBFvSltkEE6v9RcCRvpdgBYoPYgeEUO
         IQJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tnMXrFkF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e18-20020ac85992000000b00398954ef82dsi3621435qte.113.2022.10.28.12.29.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Oct 2022 12:29:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tnMXrFkF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ooV2v-00040D-R4; Fri, 28 Oct 2022 15:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooV2v-0003zx-2z
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 15:29:37 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooV2s-0004wc-TY
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 15:29:36 -0400
Received: by mail-pf1-x42e.google.com with SMTP id 192so5592440pfx.5
 for <qemu-arm@nongnu.org>; Fri, 28 Oct 2022 12:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3c/wXoG10dQHdfbeEv3PKxbfo1wSzt4UiAO5gTPYV3Y=;
 b=tnMXrFkF2iu46RmsZfFMCLyQzQoarjx2fDdhChcC7dfyVbUaVeVETOnbzlZA0CZQO+
 tEyjHr4r26bqX7yvR8zynbjWyJ2MCNJ1Tzbe5G8PBN/CJufORP4ym0JdqUJ0sw/QVNvP
 l0is3+oXfyPfDa5TtmlJu4Rzt34zVApfWjPnofFqruikYTwSbq5ksosFeySMQUawa+xs
 9B/xZgGKaymEUm4/HSo/tUbsoX002sUuXBzF4lOAYf6D1McE6/xrJYiHvZa7/mxX4DXJ
 o+TgIAQaZaYBDNVT5eO/JdcE/ifYd++apaTKO/QJGB098DCQKLUMPXYfAPY1j/D4Z9OU
 2zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3c/wXoG10dQHdfbeEv3PKxbfo1wSzt4UiAO5gTPYV3Y=;
 b=euSaD5dD4G31zZztjVMvIHlxFtS10E2kW+ZN5ypYQuK944XZjBfmo12ygLB10f5KrK
 cHCx7+DI/biv4BWKVSVen3CXd//uPGUzixGVi4iIORcKq4vBgylpXWTK1R7YHNSiYFwa
 qi119Hz+7N8voVkw+koL7DI4Lmsw8DOj1ShPiUZO3EPkqbIoW/jkxVRVAeVdTWOzL9XP
 y6Yb2K+2U+JNBsYZNBjMTX52ux/vztCevVPf6dYRMbNGGiAnahLm4DXv470No4zGIxas
 yIjnlHC12G1DlTJFAMJXdLsf110zM9S5bdzQD7plj5Fr1Y00G8ycsSvwCNpT0m3u/XUV
 lvCg==
X-Gm-Message-State: ACrzQf0CFNgI3F7W8R0plMWPXvmPazkLEzAc59EZJf2o1AHl7qon7uCJ
 wwiMSbyY7abZkcy8QmGJN5ryNg==
X-Received: by 2002:a63:e04:0:b0:46f:75bc:8bec with SMTP id
 d4-20020a630e04000000b0046f75bc8becmr894807pgl.559.1666985373377; 
 Fri, 28 Oct 2022 12:29:33 -0700 (PDT)
Received: from [10.0.0.64] (180-150-56-70.b49638.mel.static.aussiebb.net.
 [180.150.56.70]) by smtp.gmail.com with ESMTPSA id
 142-20020a621794000000b005636326fdbfsm3190365pfx.78.2022.10.28.12.29.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 12:29:32 -0700 (PDT)
Message-ID: <76b38dcd-9435-8031-feeb-80c8daab63a5@linaro.org>
Date: Sat, 29 Oct 2022 06:29:27 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/7] target/arm: Make TLBIOS and TLBIRANGE ops trap on
 HCR_EL2.TTLB
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221028134002.730598-1-peter.maydell@linaro.org>
 <20221028134002.730598-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221028134002.730598-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PrStIE1gavNQ

On 10/29/22 00:39, Peter Maydell wrote:
> The HCR_EL2.TTLB bit is supposed to trap all EL1 execution of TLB
> maintenance instructions.  However we have added new TLB insns for
> FEAT_TLBIOS and FEAT_TLBIRANGE, and forgot to set their accessfn to
> access_ttlb.  Add the missing accessfns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 36 ++++++++++++++++++------------------
>   1 file changed, 18 insertions(+), 18 deletions(-)

Oops.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
