Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3693810lfb;
        Mon, 13 Sep 2021 06:53:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXL30YCuzFksQrQmygRaNzyvxi8946iRL5l2GTVN3mbbrQ659rwHqUpvvNPfI5ASrrPT+N
X-Received: by 2002:a92:d107:: with SMTP id a7mr8310793ilb.199.1631541228382;
        Mon, 13 Sep 2021 06:53:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631541228; cv=none;
        d=google.com; s=arc-20160816;
        b=CuE/Tc//scVrrZqdN3SMKRhArLNsu9RgPXEtSwd6kSVboKcAqNs2gY2bKjNc5miKPz
         OieOKli29x1OtkKbBEkwsL+wtkx/hjShPraJfYAdkKpTPvvqaJ0Ht5Djizx9FFOD24/S
         3cX4esfqRfrcG7vyEiR2Ij3Av+p3PfHVq5ckqqonG33KweT1xGK/N9V5LGpX77rw9Msj
         6nYm4rfavjQKaFHAfAzuWxcCYNivXWsmOnZgxruYNgI06J2tWaySA9jSm7E2+ClJ5h38
         vX5/yI2AvWGiZasbsdy7Ua2IohJZp7OEZqjnA8rChnXdgUcj5g4GAhOmbow3XLMzU+Zl
         hUJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=BHslPN/KfJNjiZ49+y3A0L2Q7DRo7u5qJTsKLsXmLTw=;
        b=mXvm5tJkgUH/8BFPR/lgev+7nDIBQGIl3EsodbFPzJTErIbW56ti8Xdtg6THNT2bbI
         dFdWh9q5hPUlKPfRw4HLiNNyylpzj5MBZsCGOxXS3ZKBa4HfFIXgPY3VWtfHf7JgEXKi
         T3ml/m3PavhovuZaiX7/fZdiEPN/xBadvJZ77M/JbTe+8RJ26CSNn0yTOV3W+lq1liqk
         Pj5wbS1IDnjxY3GzjNb+rd9r2ECwRPcOLpC3qn5BasenDGkWiUJr3HKuQPHIeY6sOVEy
         mYeCqgTF6SuN8CRRxCCqHA0ts+JLTmK814zgf145/yckPP4OcTrbvg70peRLqdscKpm/
         EGtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=urSBxWL8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b11si6913569ilj.89.2021.09.13.06.53.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 06:53:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=urSBxWL8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPmP5-0003sU-Kp
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 09:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPmIN-0001mU-JY
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:46:51 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:37532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPmIM-00073m-4l
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:46:51 -0400
Received: by mail-pl1-x62b.google.com with SMTP id f21so3611681plb.4
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 06:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BHslPN/KfJNjiZ49+y3A0L2Q7DRo7u5qJTsKLsXmLTw=;
 b=urSBxWL8m3VBLuEcLwCBXFOJk3rLtcvMEubXTLvSw7t8chcNX1DUSoyWL9yQFEht/q
 IU7EiMV+IvT8PQrixfbymavPu/YJ9MN9P+2IqtVm2uswGOPnXX4XZNMS+3v8dMGYwKYN
 5LuA72o9VMvv4cgRXUiywt7NPwBTI7Ac7rOGpciT2ZM0LeSLOFwiNjaoRVvyvKb9VdwJ
 GMXaelW2xLWzCPR9Aqup8ffEGa8yg9/zjjiw+HGOyjdn4p0ztppIQTpWdrnR874QNCsd
 Gndct2/qJb5KMKz9Elz71RFywstM6tozDmGrtJCihZwbxllgb/PllyEpU8WCeD+huXi0
 azYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BHslPN/KfJNjiZ49+y3A0L2Q7DRo7u5qJTsKLsXmLTw=;
 b=tiShRIt2V2BCmetSwOCEh9r495ZmCP9g58pCAWBqJZhAvAzqEOZTDWj2hqTWmFk4/J
 u92NU1Mvfi3Dk9ea+0LeYF4D1jZ7QD+7lI9LwuENuJBa2kkm6GeTclppCe+2J+jq7XCl
 TkRUEwmejJU5hTKSPx+mwt1m8s0kmPmMwUvmyKnuvk+/isO2WpHdJwW+0Ve4KdIbI6KT
 lKDfDv2QBqIgZXt+MwUd1gmP32Ip5J0c2LKNmjccW+vn9LBXunW2KgM7rkyxucggfCwu
 WOUoRMDBmrWMI6NGGCi1ae9boobsZ+Z0QCuHgEWOD2QYoUJTRsQ0yA+hdKlqERHFOAN6
 RaiQ==
X-Gm-Message-State: AOAM531q+zDTFwlZS9F6Q8RRC6sA7G9I0E5PuBpXEzarLKs47Oqw1dfT
 JnKdbcqirVkA07hBhmMhJOQp5A==
X-Received: by 2002:a17:90a:9289:: with SMTP id
 n9mr13029765pjo.27.1631540808470; 
 Mon, 13 Sep 2021 06:46:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 21sm7099251pfh.103.2021.09.13.06.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 06:46:48 -0700 (PDT)
Subject: Re: [PATCH v2 07/12] target/arm: Optimize MVE VDUP
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210913095440.13462-1-peter.maydell@linaro.org>
 <20210913095440.13462-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d957619e-0985-b637-8a3f-ce54bc946fb8@linaro.org>
Date: Mon, 13 Sep 2021 06:46:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913095440.13462-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WD9NmgX3UxEX

On 9/13/21 2:54 AM, Peter Maydell wrote:
> Optimize the MVE VDUP insns by using TCG vector ops when possible.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-mve.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
