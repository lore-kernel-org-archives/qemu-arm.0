Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp1229969ejb;
        Sun, 23 Jul 2023 03:26:32 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGab9z72XTsCESfhlws7BukU945WFjiz3H/2Ky1GeD5cXvT0A4v5YRcOI0jgWy85t41N4I7
X-Received: by 2002:a05:6808:2381:b0:3a3:9965:19c5 with SMTP id bp1-20020a056808238100b003a3996519c5mr6989690oib.27.1690107991979;
        Sun, 23 Jul 2023 03:26:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690107991; cv=none;
        d=google.com; s=arc-20160816;
        b=CDJ4biioN3BvKaVMt/04rdoiORhPFUJXr0q3SL4K29jDlCPaz/G8mFVpBBp4QJoi0Y
         6hnh9ShR8Y9rWHEVHdunFHofhtbM/AwcjXiUMOvf90VKUXltwW1Md0RUY6vVwYKxjBN2
         OLmRFprDaU/U2Wm7GiyIwLYpFZlUbkPT6jqVwRBmpml9Mr++ujBfClA2K0e75k3sbEhA
         coUPQYx/iiAheAdqQjG1uGhHIxK4QXl5UNzu+YGM+TGLdS6Xyi6kwcwnCts1GHB1sdsT
         Y6Mo+j0ZHsMMpmNqmrhFx7xnR1GRvB+M7uaVy2cD++1j9wkSVzaAtAjdxM4qpazCWcZv
         ZakA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=YxY36NOADPqaOYhhk6ngsMwJtVzS0Ybl+eCyW2my0tM=;
        fh=7ELSr/5sFo7qZWUWozFMp+B9CMHRnMDW7I5B4MPhJxE=;
        b=kBc+Z8qfjmH4aHC7ieawX1ozQT6Y9LRIU4U54OVaxteVjT3tnzWm14bInlxoB/ZzLc
         oCYNnoe5PPG3URP9qdhFiRVay+g6N2Iv9utQCHhhNv2k/v7kGB8hGrx0sPYj5NgXbWQi
         IQFv5G5SGDyYm7W+wi+jkg/Ecs3TbSiRcEaua540D0tR2PGguNRAbrcKhyBQgyPm0446
         qti/FZ0VNE245YcFQ7SjRtZ/FD4MQ+mQpWHpgn+2OoXyefIJ+FDiGliZJl7FVJudEHDE
         WmgHnVeS6e3qvL5+qHKNnPIPKHLm9iT90/OvVJtMkhK8desqzzE6CXDf3IkMii5kju0h
         Xppg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iOxfd2c4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2-20020a05620a24c200b00767b08c7a30si3853572qkn.420.2023.07.23.03.26.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Jul 2023 03:26:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iOxfd2c4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qNWI9-00010O-1W; Sun, 23 Jul 2023 06:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qNWH5-00008A-QC
 for qemu-arm@nongnu.org; Sun, 23 Jul 2023 06:25:18 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qNWH2-00027U-CH
 for qemu-arm@nongnu.org; Sun, 23 Jul 2023 06:25:13 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fbea14700bso25165685e9.3
 for <qemu-arm@nongnu.org>; Sun, 23 Jul 2023 03:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690107908; x=1690712708;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YxY36NOADPqaOYhhk6ngsMwJtVzS0Ybl+eCyW2my0tM=;
 b=iOxfd2c43d/q9wqcw925c503B4GiLUh4KPdVd0aX84+2wzL0Pyg9qXx8RfbkaxaTaa
 WFGHW2mBjzxdvOEjUraKuSlUMq4/nFhdQ74/enUuVw2eyqtKcuwUtSnTER2EVdSQNJMS
 Y9VVkd9WGtzF7DcfKdftMC73ovwsCQzYzOotrv9h+xiXQdnOqdUW3hPn4+/YVmX4PAww
 x9JkkqcL9AMeveSmm5i17iHet+SWFmO+aACam/y/PXgxQNAgapfLB+9zvl/MEltpNsDM
 FIeI/7AIp5d3aABMLIa8IaK7U2vmSdUphqEgf07UqD5ogE6ZTw7gHrIKshkJIGUURj90
 Tz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690107908; x=1690712708;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YxY36NOADPqaOYhhk6ngsMwJtVzS0Ybl+eCyW2my0tM=;
 b=XpmbKrNwMyjP3I1bSah9ec+xh+7FR9aZ9Tt0MNbKDpGPgAHuc/PrQx4HN6ZCK822iO
 A/MyXuQOCBhFLPPZNrH2Px81uMDHPh2V3JqAoilpbj1cYTCWmMyE9j0Bd8Cv5vjGj7T+
 +CKTLCQs2NwGVYBtYMsv0wD3AHJGgd2JeGcyR4PWaAEoaTJX8FU6V7zmy7Kmr+10gjY4
 uT3D0W7st+IqD3ObYdTQA6XaVYhx7GKmovrCxVWzqjQofUKThGAoMvuF/39dyau+cfZq
 xaT2x2OWfj45j4ZGe6hHQifcca6wYc7qbN9zBIuGRqNFYnGjtQU5huXcdyJ6fGfHR/KY
 BAJg==
X-Gm-Message-State: ABy/qLYyX1T6aOXlsVuVZLd30EehRhx252nVeGGTXZ8OXyJuorp2qTx+
 kQqjWXNwYskr51tId/7D0Hn6+w==
X-Received: by 2002:a05:600c:2198:b0:3fd:30f1:94fd with SMTP id
 e24-20020a05600c219800b003fd30f194fdmr1436106wme.26.1690107908283; 
 Sun, 23 Jul 2023 03:25:08 -0700 (PDT)
Received: from [172.20.6.117]
 (179.181-106-213.static.virginmediabusiness.co.uk. [213.106.181.179])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a7bc010000000b003fbe36a4ce6sm10193994wmb.10.2023.07.23.03.25.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jul 2023 03:25:07 -0700 (PDT)
Message-ID: <557e0d94-a11e-f42c-213a-4260cfa66beb@linaro.org>
Date: Sun, 23 Jul 2023 11:25:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 04/14] target/arm/ptw: Pass ptw into get_phys_addr_pmsa*()
 and get_phys_addr_disabled()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230714154648.327466-1-peter.maydell@linaro.org>
 <20230714154648.327466-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230714154648.327466-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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
X-TUID: KisQkJm3ozPk

On 7/14/23 16:46, Peter Maydell wrote:
> In commit 6d2654ffacea813916176 we created the S1Translate struct and
> used it to plumb through various arguments that we were previously
> passing one-at-a-time to get_phys_addr_v5(), get_phys_addr_v6(), and
> get_phys_addr_lpae().  Extend that pattern to get_phys_addr_pmsav5(),
> get_phys_addr_pmsav7(), get_phys_addr_pmsav8() and
> get_phys_addr_disabled(), so that all the get_phys_addr_* functions
> we call from get_phys_addr_nogpc() take the S1Translate struct rather
> than the mmu_idx and is_secure bool.
> 
> (This refactoring is a prelude to having the called functions look
> at ptw->is_space rather than using an is_secure boolean.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/ptw.c | 57 ++++++++++++++++++++++++++++++------------------
>   1 file changed, 36 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
