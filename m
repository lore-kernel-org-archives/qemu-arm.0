Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2055735lfk;
        Sun, 30 Jan 2022 23:28:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVLHYWzdcJFhkJX9RG4jpG1jyl9sqgK+59jZ3rY5CL3IziOyhfnpQ2GQu2zOf9ZjhAyOPv
X-Received: by 2002:a05:6902:1201:: with SMTP id s1mr28152705ybu.626.1643614134687;
        Sun, 30 Jan 2022 23:28:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643614134; cv=none;
        d=google.com; s=arc-20160816;
        b=qlSDAVO9dJgI5gEuUMXZ8nQy4KMDgDV696Ja0ItF16QRNcOwuK5IfJhx4LOvErNOSD
         Juf7SC9bWJBT0COBC+zhkoQf3F2VF1wOURpNoUIq62HUFaHIYIz2pq/I/6nrshAO8Rk4
         8LUKO1ayMEwmd6NEjEicMdrPfQ8+wiyqm6VDTHKzzqmrwNuN9yGqSXm8nf9twRnfMIKv
         M8U8LFFupOrQm81W/i8zJ4Xr38ImM0ozquCCz57UQIOrmf8oT3rfKZBTVumGhgGxxa6k
         vHfNLQqNy2tDCEcN/0JKqMv7WHe9OKeyr0pyOj11u9YsjPkBL+nH47jAt0hvWBGn/vHB
         uzxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=qrEDFwiz8QhdUfRrjtkOtw3C5xSdw7ffc9iqNqm/z3o=;
        b=nmJ0X+EPu/xPrsb2cwI30/EI4PgbeyJEpVABvytKjqKsKE7A8MVs9xyhtpgBFxDQ6j
         RWlcUu9sTeJ1/9OfU1BuTKgP8959zq6PiSKFWUXuJsyHDDVBq1eZPwxHiG292h1Ku81y
         2HwL8lPA72SBlDEJZ+lJ9rHW8EY0M8t+fyHVSHfr3tq82fcfKnodp+ChyZjXGUt8i/j9
         k7eTfD7OAGFCK/JKo1ocr0uj6S1JHInnn8/0ICcjyjSZwPYqgSdHI7pq2aXdKr6kXRQ5
         xXb9ggReMx55c9MB5rCNomH2dZg0UpyjU7i40DCeQRhCf3gVewf0QCNKTGwKJl25P4Ye
         0YjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pul53IyM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si10257482ybj.736.2022.01.30.23.28.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Jan 2022 23:28:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pul53IyM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nER7O-0002lp-0t
	for alex.bennee@linaro.org; Mon, 31 Jan 2022 02:28:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEQdY-0000h6-KY
 for qemu-arm@nongnu.org; Mon, 31 Jan 2022 01:58:06 -0500
Received: from [2607:f8b0:4864:20::42c] (port=37407
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEQdV-0002xH-BW
 for qemu-arm@nongnu.org; Mon, 31 Jan 2022 01:58:03 -0500
Received: by mail-pf1-x42c.google.com with SMTP id a19so6153329pfx.4
 for <qemu-arm@nongnu.org>; Sun, 30 Jan 2022 22:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qrEDFwiz8QhdUfRrjtkOtw3C5xSdw7ffc9iqNqm/z3o=;
 b=pul53IyMQsLnM8BMw2vlJc3dgOxD5vrsylYQ+ikEpoHLFFV2fnSTnpttJ7JEbmXe1N
 Nyej72NIkSS++j8IR/AKY2QW2S9mZ/8bY2pk1cGR7Q1A1lnBHv3SQGewGQI5LLFXIF9p
 SHUW2Sb3G46bAYalDStRen7Pl0zUsuAUaBUqcM6xSKCeKz4cwmCsC25VLdkc1lVpbkZ6
 Cb4+4W6nHyu4fCQkgDnrXz7OzDHElNpbSyL+uGSS3UUyMR4wIZAPL8qA+MNr7JlOPn0V
 3kqytqs7vI3kOFkKfut0H2jel3/umGF6Pb1XMn80uxGOe+06pRzrce/n8jO8srEBop0w
 moYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qrEDFwiz8QhdUfRrjtkOtw3C5xSdw7ffc9iqNqm/z3o=;
 b=kxsqCS/K+5+Cb6235ED0jb/nqrXhtOGVVybTTV7y8MsD4oQmkgF7dEpefEfneyZkXk
 tnwnZN2pro+9XmTx96c6cjjUe85AUCV+I/PGeUdM1+ChZF0Q3W9KAQoPQPQy4YM8dLj9
 dk68wczH4idHluIqR0hlZ7f9ZPaTqWOshZAjcJbdWcdttz8n0U+Ub/NihoM2+KNFocPj
 N9C7OVTJEwXXfLgWVU8FH0DQuBz6rEXvbn0Ev5Im8Z6BdT/GM/ehiD4ZpiQszuR+Jawi
 TZDXoM8QV/W1V3ZQEuUo01pObKRFag59eiYzoDzz4/z0KW/NnfCKqLgKLAfoJaiDxRRS
 OWgA==
X-Gm-Message-State: AOAM533z7WrBBTBbsGcRyUfqBEwOfgARt8Y78w/fXkuVWyXicG6XE/4e
 yXuNdydTyJ/reCECTOaVgIJLhg==
X-Received: by 2002:a63:88c6:: with SMTP id
 l189mr15704850pgd.229.1643612276491; 
 Sun, 30 Jan 2022 22:57:56 -0800 (PST)
Received: from [192.168.15.130] ([60.231.85.5])
 by smtp.gmail.com with ESMTPSA id a14sm18302437pfv.212.2022.01.30.22.57.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 22:57:56 -0800 (PST)
Message-ID: <9497e12c-2400-b864-733d-5469fc63efcc@linaro.org>
Date: Mon, 31 Jan 2022 17:57:46 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 10/16] Revert "Revert "arm: tcg: Adhere to SMCCC 1.3
 section 5.2""
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220127154639.2090164-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>, Tyrone Ting <kfting@nuvoton.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Yanan Wang <wangyanan55@huawei.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ly8KkyqdayGD

On 1/28/22 02:46, Peter Maydell wrote:
> Now that we have arranged for all the affected board models
> to not enable the PSCI emulation if they are running guest code
> at EL3, we can revert commit 4825eaae4fdd56fba0f, thus
> reinstating commit 9fcd15b9193e819b, without bringing back the
> regressions that caused us to revert it.
> 
> For clarity, here is the original commit message of 9fcd15b9193e819b:
> 
> The SMCCC 1.3 spec section 5.2 says
> 
>    The Unknown SMC Function Identifier is a sign-extended value of (-1)
>    that is returned in the R0, W0 or X0 registers. An implementation must
>    return this error code when it receives:
> 
>      * An SMC or HVC call with an unknown Function Identifier
>      * An SMC or HVC call for a removed Function Identifier
>      * An SMC64/HVC64 call from AArch32 state
> 
> To comply with these statements, let's always return -1 when we encounter
> an unknown HVC or SMC call.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/psci.c | 35 ++++++-----------------------------
>   1 file changed, 6 insertions(+), 29 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
