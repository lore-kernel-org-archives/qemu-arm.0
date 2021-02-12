Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp3453954lfc;
        Fri, 12 Feb 2021 10:43:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXkNV6YUJMAYAN5ux2rek1clBoGxSfduD5chzoWqhNy5w6H/jcOo7vvxQaUJ8o4C1e4JjQ
X-Received: by 2002:a25:5014:: with SMTP id e20mr5741608ybb.396.1613155401994;
        Fri, 12 Feb 2021 10:43:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613155401; cv=none;
        d=google.com; s=arc-20160816;
        b=dTkLXh5X9Wk01hBAj8y5MiaiQQbphLM+euwo3rKqNY7F0yonebk/CzxXCXH4pmPl4C
         Ey9kJXuMcLzDXiUKWTA+e+CQ9GFMKrkRlj5UKgfASRU3qAx0YeOy+0Wewz29gA72HNQr
         RPeHOioFaZ6dxSv3eNAxB77E1FMenJZR+U6zP1mFZXSXuflNyOVGMvCrhNbuKJ1xSzi3
         NsqMYA6OgpFBMvSaFofOpmgeSYsp9lYgJX5ysW3srhp9mzSXi7F+GJdW/zNGmJ9jCnPf
         Jj/yZNcUbMLY3bpuODGn4QOAQ1Vs1dSBrZXkZ5AOOTuQJyKhd8Tb36gEVYfP07d74zU8
         upmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=yJWuqeu0wF0I/l8nntKgnMOOjcdOuX2jD3WstrhprB0=;
        b=QUgP0nmFM2rUFeGAowVN96nZEidRudOesplkTMkF1IRnmSRas75dyXvJIqZ4TnfIYy
         Oyaaaj1cBtXExFugZ7qFZ8rbHXFjOz4XmeiwADYmbS+S4UV/xLtK1fYExOIjCq7tmmk3
         WRi2zCO4ItSC+0FEuSmG2SB3yCRx9+BkwfP29UoDXfR1iqvGbWOFpSG7hw2KKnGkTQ9W
         eVJWQy0xfEPBamfkrD/QLg1+F08pk2jp2IG+E03Xqpm31GWVCiEyOOksdI7ZeRtNeFUT
         EQFLTBuUgWM4mggs98XsVsgBdeOoOzsWwmO2dmJUeT6uEP+8FteaDxI+gPm8xWOi7BJj
         bIdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Au7jKZdH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7si9432851ybi.4.2021.02.12.10.43.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Feb 2021 10:43:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Au7jKZdH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:55570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lAdPU-00033I-LM
	for alex.bennee@linaro.org; Fri, 12 Feb 2021 13:43:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAdJC-0006CP-3P; Fri, 12 Feb 2021 13:36:50 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAdJA-0002Q5-N2; Fri, 12 Feb 2021 13:36:49 -0500
Received: by mail-wr1-x433.google.com with SMTP id g10so385804wrx.1;
 Fri, 12 Feb 2021 10:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yJWuqeu0wF0I/l8nntKgnMOOjcdOuX2jD3WstrhprB0=;
 b=Au7jKZdHU/PaQsNHmbSOMxj94CVFOWLkLV4GZ6/y4lub72fG5D4H5Y9mAiSXjp6vXa
 1TVII51bCtyGFxYEcteF/wbYw9NNs5wGimT7acchqVv9B8F3/CKNmHhoE2Tip6bVurjR
 TtQLblOhlyaxOTlFRLCiAgSGFJNAxObDi+skLr/sSmRWKikYeYj86z5mGViJj1jrSF34
 qlk90EhvRCKQ2CjtakGMdgAD07usOm1FpI13VoVugeejWqdiw3lFHafQY4cJzWBg6NnT
 0iNEVN68jHrXPkcx+myN/wOq2gax/RHjkWY2XZj+cgAT4WhbVAd2kWciVFkFaBfy25KH
 4roA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yJWuqeu0wF0I/l8nntKgnMOOjcdOuX2jD3WstrhprB0=;
 b=UIspbt9ra0War5gSmkE6WA1TuuUZCV5rUr39z5LqfltG1M7xZt417w9966nonAGCtT
 vGRt/BvPQpoYPYRM8oRqcOHITzNYqaepTIE89alo0fUOStICjmnncJOJNp+NrJUL1hCO
 OHpDM/zlWGbhfN4lXKvqUXAKhZ6CBtSN+cCkyolFU9CpJcEfr5gXjXWee49Wja6DuABC
 c9Hh/DDIKw1lYMXOryygzZejDFOzCCxa9q0QqxxiOQkQ+4rLRgQS33T/vBOToZB5u228
 5yMrGkAmKvJTRxmmbg8GneKi8gUGBaudVAb0dPoqzyhi4p6eA2bbqYgffAWFR5TVc4+H
 ac2Q==
X-Gm-Message-State: AOAM532LeoXlke3t3H4cfiYW0M5FC9H4/48z1kO9GZVcmRaTscqN5LHY
 Xxj1XPvgmJfB/Jl6RgEUqca1ipEu66w=
X-Received: by 2002:adf:db41:: with SMTP id f1mr5077648wrj.123.1613155004596; 
 Fri, 12 Feb 2021 10:36:44 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a21sm16388860wmb.5.2021.02.12.10.36.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 10:36:43 -0800 (PST)
Subject: Re: [PATCH 23/24] docs/system/arm/mps2.rst: Document the new
 mps3-an524 board
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <20210205170019.25319-24-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3fac284a-0681-c6e2-b76d-486b04bfea4b@amsat.org>
Date: Fri, 12 Feb 2021 19:36:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205170019.25319-24-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HtzxSIWqU/Yz

On 2/5/21 6:00 PM, Peter Maydell wrote:
> Add brief documentation of the new mps3-an524 board.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/arm/mps2.rst | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
