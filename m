Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1987324lfj;
        Fri, 6 May 2022 11:24:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbKUnWMDVRGU1UneIR3ImE88T4CyfA47AZFWE5l+d9OKxszkeglvEkGsdvHBQFkxh+gzXU
X-Received: by 2002:a05:622a:38a:b0:2e2:2fdf:246e with SMTP id j10-20020a05622a038a00b002e22fdf246emr4126142qtx.482.1651861472116;
        Fri, 06 May 2022 11:24:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651861472; cv=none;
        d=google.com; s=arc-20160816;
        b=CLWOlKmdj5Y3LGph44SYuvQGedwzkSEqCnYaaT7Exb9biYUa+P14Ic4Rui9tLl5bs9
         5+xTfKByl6fOI/sv1eMrTLNoC9Qg4BzxSvUBvcBfZI/IGWYkiwue1PdicoAALBarJqJx
         NQ+JkuFaSxHM1UitZtjBS6LOdhlhLDSUq3VDtFRVDFNeiHq7CBwcMsxQnlzH43cFz0HN
         A9ntpYg1IveUhYrj0Obp7jl0kAKzJisI9x4Ve/9XLQatSgJjG6A2kbJzbJ+ZJIUZRd3t
         DrgBlEwDU/FNG5Bc1tBYWm51Wt42qWeyijlCw/0uQpMb7mtc2/T+Ch/7lJwOU1s7GrL1
         wEFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Amt3S1iohugZ8K2mdODjMgH/bnRr1ue0EBc80EXJw00=;
        b=OxEgb9U2+t5aZAmL4BS1ao9VGYz+fMp3MN5Me8/2QhYUO6fq3Svm/UksJBHGTZNW7y
         1Aob7Bz4EA05iNlNq+TrVT/8pygeCnAqraR9kDfcjCAQyHXySlCf6WFI8mGBlUBVlrWo
         F6AGp14A3Pynb4dAJPILDzJaj5S3GjNLZjPVSuITDmuzD2hUOgW35Wm6nF+5TSThq4lI
         UbDNFwSwaFwBUFvxFVtsqVntWnv8za1xNDPxB4sb3vtqqYv8eTCVcr8sdYjg5BhExNew
         vp3JkcOkShGYsffjpEbHy8e5CUgKSbmTtswmzpKcimvRxatnfDSQV6MR5e/AfQELm5hn
         WLWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RVtrQYXs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12-20020a05620a40cc00b006a03f6de2a1si2456952qko.622.2022.05.06.11.24.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 May 2022 11:24:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RVtrQYXs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nn2cx-0004kM-KJ
	for alex.bennee@linaro.org; Fri, 06 May 2022 14:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2V8-0004UZ-PI
 for qemu-arm@nongnu.org; Fri, 06 May 2022 14:16:28 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:34563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2V7-0006VL-1v
 for qemu-arm@nongnu.org; Fri, 06 May 2022 14:16:26 -0400
Received: by mail-oi1-x230.google.com with SMTP id j12so3409019oie.1
 for <qemu-arm@nongnu.org>; Fri, 06 May 2022 11:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=Amt3S1iohugZ8K2mdODjMgH/bnRr1ue0EBc80EXJw00=;
 b=RVtrQYXsMXd3PxGUYyA5UHZKOpCpczQ6R5gyua1+MMhX6rxonVQUxR/X8ccX/PNiGs
 78/ooEShF+6MB6/97PpgLTdeQZwGuapA88ur/AhgLYP9SCe/QrMoeRep2O2ZyauycOU8
 UDEu07fGTCJCl5uIOIbmieHiaMGwYhOI/UWzBF0WyO3WnYLhE/n3jkDCcbq21bWAymgP
 UBmxyQwD1cBFWw9V5lclxftQ5nn4hPJSulJ6mbD/MWt5hJmcict4CFmosSVl4igmS/ZH
 OJV4AK1TJd7lSzc3yEKwYL2ezU5CnUd++T6mn264mlZHhRl7x25haYfEyyFUS0msXKgV
 WWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Amt3S1iohugZ8K2mdODjMgH/bnRr1ue0EBc80EXJw00=;
 b=w2ghLdDIf7qazwkjHVEPGWJvPnl5yxOBxTWE6vB+k5HM6vJbxeXrjkDhdQIQnojDmh
 bWTsefvF6FD/61ceFrdmfuer37Rrjk2OXn9dqskNx7kN42hZcqoy1blNkpIFg9lPwZaN
 ovWx53eTxVW2KWOvqWoSO25C5HkFMfPbT6xfqR4y8OSRMWuQopUgy9ExRb14pbEp4LiZ
 3R3OZ3vsKg3ho7fhGtRoxABtnaTSLg6WDOIjrYN18UMMARlJlWRzZROoFRwo2SbD1RP+
 +tvNr9rwAMhWJlTRx4reRU94eZxoYrp8lW41S1NhskCj3g985us2cXRx5SwnWgwG6LzG
 G0Cw==
X-Gm-Message-State: AOAM533GORMrtOHyB4ULjqVBYcQrL1v7dql8qew7GTXfcatIDPU9++m7
 Q52bbK03UFJDxASqG4YRagooGA==
X-Received: by 2002:a05:6808:1309:b0:324:f014:80c0 with SMTP id
 y9-20020a056808130900b00324f01480c0mr2144596oiv.190.1651860983930; 
 Fri, 06 May 2022 11:16:23 -0700 (PDT)
Received: from ?IPV6:2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2?
 ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 eh4-20020a056870f58400b000e686d1387csm1811790oab.22.2022.05.06.11.16.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 11:16:23 -0700 (PDT)
Message-ID: <17fb75e1-b159-1021-061e-43e003dcd9f9@linaro.org>
Date: Fri, 6 May 2022 13:16:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/4] target/arm: Factor out FWB=0 specific part of
 combine_cacheattrs()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220505183950.2781801-1-peter.maydell@linaro.org>
 <20220505183950.2781801-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220505183950.2781801-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YYs2UiZmLn4m

On 5/5/22 13:39, Peter Maydell wrote:
> Factor out the part of combine_cacheattrs() that is specific to
> handling HCR_EL2.FWB == 0.  This is the part where we combine the
> memory type and cacheability attributes.
> 
> The "force Outer Shareable for Device or Normal Inner-NC Outer-NC"
> logic remains in combine_cacheattrs() because it holds regardless
> (this is the equivalent of the pseudocode EffectiveShareability()
> function).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 88 +++++++++++++++++++++++++--------------------
>   1 file changed, 50 insertions(+), 38 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
