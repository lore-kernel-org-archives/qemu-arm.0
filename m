Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5855568lfg;
        Wed, 3 Mar 2021 18:03:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBWeRCV7wL+YBSB/vsmpIgGmLI0wVxDKuTwIcXq8Fz0ICE6XWPQ6VdGbMFJpYsjWIfgVS4
X-Received: by 2002:a05:6e02:1787:: with SMTP id y7mr2008672ilu.233.1614823426209;
        Wed, 03 Mar 2021 18:03:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614823426; cv=none;
        d=google.com; s=arc-20160816;
        b=zGkM7v5p8TdTmU5/MhsI2yljneWcTS5vI7FM4dVvzaVQ9NVGtuW5NryarmQ1ea/ah6
         V2ZlV99b+MTpcU807klJWuBUsP2AKOnPDtpYK6kvuEwI1n6UBQtzohnBhVbhs+NcYfrC
         B+3h8fT5jRZQPj+mq6cyD+qR7Xx0QOQtFjVs5A+EzFaZCwy7ho8U3whCUccWJ/fSz7cB
         h/+LGo89EA+kmbFxy8CAQl8lpT5J9GLMEfeZ3/sAtz1is5HGElGLHqUDFcn9CGSPUIfv
         xozMP/LWkFX6+h0+YabGH2XCPRltnz4RKRmwcG41FLWm2C3mJZgpt6A52KAlUh+n3jKq
         6qTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=rkwh4s7pQAfsSrIJ3AM64jjb5p8K54Y0GIiVSIhs1Uk=;
        b=pTSLcPFKEyu+VOheFjinlB+2d8NHbob4oRAzmGdiTlzLG5R2ADC4IY9OvoEBHtHi4B
         yTln4FTJUa9PNSzNr4xr8K0ckCtN6ysZ7PXMP2/IY+Y9MLJqsbt/k7QoRQwfoBMDB2HA
         lHSXJ5Aon58yM2HEsZuLPmXxsoAbVJvHTGo/ftFYfB46+rTl1lEixfsUuhzvvXeuOM39
         /9ECpB3FQvYF/Yv+kRj+P0JvLcU7TL9vL/lkYR5sN6W5e4nOlQCIoMNoWKMUS3S4br5h
         h3CJXoHzdLzQ3DDBfLWIvF0KGTlCuL2rF+WMAzeduqAp3QFiZSyMN12Vthuz/gNGCdbJ
         Rc2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NeICh5se;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z11si27751924ioq.6.2021.03.03.18.03.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 18:03:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NeICh5se;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHdL7-0002iM-Ih
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 21:03:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHdKz-0002hU-2i
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 21:03:37 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:52284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHdKw-00038m-VO
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 21:03:36 -0500
Received: by mail-pj1-x1029.google.com with SMTP id e9so5477378pjs.2
 for <qemu-arm@nongnu.org>; Wed, 03 Mar 2021 18:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rkwh4s7pQAfsSrIJ3AM64jjb5p8K54Y0GIiVSIhs1Uk=;
 b=NeICh5seTvs0+h3eCoToV0G9Ifi85ocdik/ICpg7alVPtMV8vPqL73Gb/dfhRpOV1r
 vfeQrsKMIT5ByVxw74LeBq/e/06sLSvsBYXF7aGXAEZ/poVojaqoEq2Rku9MNNeSqE9e
 ZvQKqaiXKmDcFFt6Zitaba5KsJcpwGo2DueClrIcW5OI4+VYbp2FqDUiyAaMf+Dk+TJm
 peyD7oourvQbymzRq70RcRI7/RSNglIG5qSG+NwfbzBZSjdwLGQgKSFAtv2U1EaRhU85
 1oettoSrH31RmY6D4+3/tq3G9QP+10FT4zUDvUTT0aNBEwctl9Fv+NvYw6/v2aiBUVEB
 QGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rkwh4s7pQAfsSrIJ3AM64jjb5p8K54Y0GIiVSIhs1Uk=;
 b=RfJPFSnJXsfaUPvNh5Ufv6T5fi0ol+A9S8l0+aO9Uyblg5j2ofIxqTVobOgQsa9eee
 EGFjdaDX+YG9ihNo43UXrBFn8uQyhOgJ5Q7C+8HVF4JV/0TulXcS86wrZPeLW18ORYJz
 t0stxsm2pSlPc5r60/gw15bv89/AC0gp3cQLFGv/BYIgs9MqwbWTjwgrYDqs7GAxr/g0
 8gz0Pai+sTWztYKNIBMQA8KPM+5nETwWVvp+QtcgLOHBcB10ofRfkX7F0SgvAe+O2ZGC
 GTuUAr8G5cukU7FAyWrdkdtXIxcxwdSxT/3tXtMGUpjZkF74BfM2fjeQu35Ewfx/sfp/
 LiEQ==
X-Gm-Message-State: AOAM533vQ6S+rrhAyGtEIO3Df+4SWl1ZN0ywD1F/U282/wfjgVCjunos
 nBmWMUaoQkggdzODycVOO4LpxQ==
X-Received: by 2002:a17:902:c14c:b029:e5:cd82:a0b with SMTP id
 12-20020a170902c14cb02900e5cd820a0bmr1908458plj.34.1614823413459; 
 Wed, 03 Mar 2021 18:03:33 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id v126sm24408673pfv.163.2021.03.03.18.03.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 18:03:33 -0800 (PST)
Subject: Re: [PATCH v2 20/24] hw/arm/mps2-tz: Add new mps3-an524 board
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-21-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ccd5a3e6-247e-9d2e-e1ee-c2171c5752fe@linaro.org>
Date: Wed, 3 Mar 2021 18:03:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BEDQhdY8bKH4

On 2/15/21 3:51 AM, Peter Maydell wrote:
> Add support for the mps3-an524 board; this is an SSE-200 based FPGA
> image, like the existing mps2-an521.  It has a usefully larger amount
> of RAM, and a PL031 RTC, as well as some more minor differences.
> 
> In real hardware this image runs on a newer generation of the FPGA
> board, the MPS3 rather than the older MPS2.  Architecturally the two
> boards are similar, so we implement the MPS3 boards in the mps2-tz.c
> file as variations of the existing MPS2 boards.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/mps2-tz.c | 139 +++++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 135 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

