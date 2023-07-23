Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp1364202ejb;
        Sun, 23 Jul 2023 08:49:11 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE6oCNrC4wbg4BVVoBJYW5qcfYwUYCUVrIEizIvLR+5yjTpLL7Kia4YffTZ7Qds3iO1nZhX
X-Received: by 2002:a05:620a:4107:b0:767:fd59:f642 with SMTP id j7-20020a05620a410700b00767fd59f642mr5573891qko.55.1690127351572;
        Sun, 23 Jul 2023 08:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690127351; cv=none;
        d=google.com; s=arc-20160816;
        b=Ge5ZVYXc7PLBoucYuqeDecaddIEFecRYEb1OEvaIbCYdiVRkTH9cqli7B29Z+gfObz
         Vk0r8ArSwQJ9NrfvJaH3xWt8vyJduKArYANDwPW5CPt25/H12HC5Ky+nwip0vUB3Xfhz
         digLDeJeg8U64qZhUPPJ9URPJbdhPSg7LEP3kXoH0Co6UyuZVi5eg9uyP/6fJnlGA9iI
         tZuyhPwR6r44hl/vVQ9K/ptmW+X/cCyAO8YuCBl7TpbbY8oT9XYssfa66AV5yt0yPums
         e7EAwtv3ERv8cvnTzhY66k+c+WxqEJcVkiaOM8hfn/L9i3sDF3xExZK9TeD7Q277+XmY
         VIcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Q+kr7SLHmjKHPZehm34/UP6SZCQ7koEyHzzD7U3bLCU=;
        fh=7ELSr/5sFo7qZWUWozFMp+B9CMHRnMDW7I5B4MPhJxE=;
        b=XCOfEwxLBlzwIHTiBkWy2bSxR7LeOjv/XGMtD+R+X6xsshvFP8PAmvQBJTkbaj4s1/
         9hz9kIP2MyRpO2M7Q++Fmm0w68gZ88wLxelsR77wp4qv3VLYin/DJMXXn/AM4JDwdLJr
         VrTJspEcZ4L1W5fxdorEbqhQlb8bJowO6hFlUY84Nt9nAMsbmIJGzjBqR4451RyxG8Iq
         6tLEqfMSne+re6DT1Vle6WyIaXSfv2qyh6/Bfiw9jxnIGM3e/ymQ3vrOLSxB50Ks7tYS
         6gGn2cBAaJMYEkTny2OjcAx9Zbyk7xZmcXHhm30TENeicG5Z2aX/eTe6XmGBtwxG4gK5
         YOsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gfc5cFdE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8-20020a05620a0d8800b00766fd88266bsi4151101qkl.502.2023.07.23.08.49.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Jul 2023 08:49:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gfc5cFdE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qNbK3-00083U-RL; Sun, 23 Jul 2023 11:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qNbK2-00082u-F0
 for qemu-arm@nongnu.org; Sun, 23 Jul 2023 11:48:38 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qNbK0-0006qx-Oy
 for qemu-arm@nongnu.org; Sun, 23 Jul 2023 11:48:38 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fbef8ad9bbso33675415e9.0
 for <qemu-arm@nongnu.org>; Sun, 23 Jul 2023 08:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690127315; x=1690732115;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q+kr7SLHmjKHPZehm34/UP6SZCQ7koEyHzzD7U3bLCU=;
 b=Gfc5cFdEf10FitylbTLMLliSD9L3SaV8Buo+dccE11UZfAYhnVblUMbMcQ9Kbn1TzO
 EssrGDv4qXavNCfMEysZePS+Daoc9beW9y/x5mTlLnSMPNswxmW/oylb4wuaiMg/8jGK
 DlYPkBVFC2e+1tUS5FZieTkvMQYd4sWfNuSahPfLnyWGafpr/3cFhScFJbv1vkALp0Sb
 gz/uB2fRxFcyzBEoRRn2kHTqQN2BSUF2OC6vivZsL0nUKfNPQEdymVKrGfmcJLRUv3Wd
 yEguhKusflngfUalNOFmn9Xaop7LWctEd20fzvQ98HlCfW3vw5wfnnQECoXX9Ur0Gzyd
 Yyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690127315; x=1690732115;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q+kr7SLHmjKHPZehm34/UP6SZCQ7koEyHzzD7U3bLCU=;
 b=kXUsfbuJC0ooi4LPNoOUgLOFrMLBC9iY3MjKf2lHokGwaTqV9hE38o3Y3yUdu+8pIE
 tIIwBzGyml1kEkcqfqGVSFlfYiXiSmRo4vN2UaJQytvZIzKppiAQP1O1P/cV5P+fLICY
 WL7/UNxvqYpwjHAVv/40wwCuqEyEuZnl9GUOFwmFTkkGyjaLxqbpC16GcQem7Q+RHElI
 rBYmnRJHplEoQgYARTuqs3XlgzzeFz3rPc3MAe3v5wlva/6TIQdb8qWkWROxJdgnHHXW
 T7DxaHbGHZwowZtvTgDtaE1d9BXWxmtHy1W9cW4s1ruVMNQ4GTjPKfillSZbFB64DCTt
 W5qQ==
X-Gm-Message-State: ABy/qLavTLDKLLPJyy2FB3D+5/izVBad5bBtXR0mWOLYgffpJVr9vTS0
 A5Orugs3lLuEo2t789saemm+YYow/eU35N/VMZYebA==
X-Received: by 2002:a05:600c:c3:b0:3fb:b67b:7f15 with SMTP id
 u3-20020a05600c00c300b003fbb67b7f15mr5718076wmm.21.1690127315101; 
 Sun, 23 Jul 2023 08:48:35 -0700 (PDT)
Received: from [172.20.15.116]
 (179.181-106-213.static.virginmediabusiness.co.uk. [213.106.181.179])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a1c7708000000b003fa74bff02asm7871508wmi.26.2023.07.23.08.48.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jul 2023 08:48:34 -0700 (PDT)
Message-ID: <179ce2a7-a15a-1af9-a4a3-4adfd2b329bc@linaro.org>
Date: Sun, 23 Jul 2023 16:48:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 09/14] target/arm/ptw: Remove S1Translate::in_secure
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230714154648.327466-1-peter.maydell@linaro.org>
 <20230714154648.327466-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230714154648.327466-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
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
X-TUID: 5kO4OATuTOku

On 7/14/23 16:46, Peter Maydell wrote:
> We no longer look at the in_secure field of the S1Translate struct
> anyway, so we can remove it and all the code which sets it.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/ptw.c | 13 -------------
>   1 file changed, 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
