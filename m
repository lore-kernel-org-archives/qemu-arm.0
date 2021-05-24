Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3752678lfm;
        Mon, 24 May 2021 10:34:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwecKeLj9bp2FlebqvyhugcDV7xT1auK0V1iWm5+9EVf1sqwwS01Qe+IZQ+1K6Br2lhIvx9
X-Received: by 2002:a1f:2006:: with SMTP id g6mr22773941vkg.17.1621877670876;
        Mon, 24 May 2021 10:34:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621877670; cv=none;
        d=google.com; s=arc-20160816;
        b=EZKI3TQtGm0eLH0hNl+a0fhlki3UjSkWxjhWGVj4YON3nDGfd9P3hLQ/CARisitX1p
         7ZCZNtWwYxi4uay5xEDU0VBmR0/2ZCzYgg1f/UMqV9xOyDAL+Hkj85NPK4LYiRJVtHDY
         KXVqD5zaB4XvqZRzAFPpbwz/Xthg1E8N9AYJYoxxg1tLg80OhAjU7BP48y88W96HFSUx
         UFZWYuKLHil18hFTK6iZMzPVtJnmfWpJTe8N1oCBp4EjnRuhX9WFiulq7WP5BS6+Dslq
         /u8hEq1qM28UlK5mUOCMTEXesDC6zxTJzBnvIg8GmGt0a4sMEnUMaHzN20cyXS0GAD/i
         8Syw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=V8iU3nwqiRYYRLGBcsH/TBALO9S/lMXV/2JXfI1uIuU=;
        b=Co2Q5TbjzacEtEnknCwKNrixkQmTTCvibfy0CwFJXPcUVD+qL+Ft6J4aNbcheB5fa8
         Ypye5sp9Wv1kkizSTRFW8DzacM34stfO9qQOof016Yp2+n3fu4cEGxWiBahHL7xGfimT
         1oFV/oUzctuh9+KuGRNlBbR5/SkGBy9hvN1PSEfyD6W00dEWalqc5aysoZUw78We5rDN
         OYq7wS+fP5NDx/wUwuOKdKYswqrVLLbXvFpQHVBPJIWIYo9/hWo7VzVI9KvnVkRwvsiN
         Fws7ri1X/K2zX1MnEUmFW7ozkwsnT6A2Hch+NNdBjcIjsP6kQ7Z5PyPpO1rWzkiBTKhq
         lpoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GnHPBoOu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d22si2808018vso.194.2021.05.24.10.34.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 10:34:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GnHPBoOu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llETG-00086o-8l
	for alex.bennee@linaro.org; Mon, 24 May 2021 13:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llE14-0002gh-Td
 for qemu-arm@nongnu.org; Mon, 24 May 2021 13:05:22 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:41858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llE12-00048W-Vq
 for qemu-arm@nongnu.org; Mon, 24 May 2021 13:05:22 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 b15-20020a17090a550fb029015dad75163dso11516324pji.0
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 10:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=V8iU3nwqiRYYRLGBcsH/TBALO9S/lMXV/2JXfI1uIuU=;
 b=GnHPBoOuDvy1sgHfKAQ8WWu+ndvyC0sMi9WUFPxFnC1zaLqg7EjCsUkqrWjLhi7xgh
 THvpGGxMfTjrgdTAl/LrwrHF8y6CwXps8hwVqnN+oSLA34kHF3cK5qcD+SS2y0eI+SK+
 H2aXilLBfqSNGbZudirLr6zX8rBYTdtSLXGMo+qkz3NzwdIg2gbHLAsUgfkijv1z3U1r
 q78atvVORm5S98at3SAayhk0fvWVz8nvsag9yWivyP9R84wE65vRAwoecFy/I/VGniOC
 GDqTyl2K6Abh7dbP9UlBeg4+icMV7K3SwY/GCOfiUVowtuYKsxXNzUVR5UWXKpYsRSB8
 JE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V8iU3nwqiRYYRLGBcsH/TBALO9S/lMXV/2JXfI1uIuU=;
 b=bDhrSp3WhqqqTrV8VUQA1to0jio3uOoNwoLEw+68wS4wy/9ZdwYx8yKaqqVDQQ61NZ
 WrG4mkZzgK/1edXbaYc7bclBYFUdEpu3BwA7HHpqH4U7pue20KdyPgSWw260ydpHzCtD
 aNPIULdse3VixfneLIXCyz21FAJgfXE+hjdxeF+i9VJioqmopfw6AerTvYMRdrfl718+
 U1g9yyBq+h48RFTURJRLNWlNKZ+a/DlTfP35pyjwU6d+mMo2LinnGDpXnmycRrVgfE6m
 9iazl2HdHzWenODydU6GJZtt7IlXehaUWwiJS5YxLM/u8kP0VHHcfsmfqdqs1ZQq0CJv
 zT4w==
X-Gm-Message-State: AOAM533tzzpm5Y9YoM9qC28wqWAyRFsJVKyNVUY1/CzgJsJT3RLRSW7Q
 +zhevxtlLwzFKXDylR8lAJTttA==
X-Received: by 2002:a17:902:a705:b029:ec:bd14:7825 with SMTP id
 w5-20020a170902a705b02900ecbd147825mr26711605plq.83.1621875919373; 
 Mon, 24 May 2021 10:05:19 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 gz18sm48213pjb.19.2021.05.24.10.05.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 10:05:18 -0700 (PDT)
Subject: Re: [PATCH 9/9] target/arm: Allow board models to specify initial NS
 VTOR
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210520152840.24453-1-peter.maydell@linaro.org>
 <20210520152840.24453-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <263a44a4-a890-31fc-ab51-33c519b704f5@linaro.org>
Date: Mon, 24 May 2021 10:05:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520152840.24453-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FelkgImIQ04G

On 5/20/21 8:28 AM, Peter Maydell wrote:
> Currently we allow board models to specify the initial value of the
> Secure VTOR register, using an init-svtor property on the TYPE_ARMV7M
> object which is plumbed through to the CPU.  Allow board models to
> also specify the initial value of the Non-secure VTOR via a similar
> init-nsvtor property.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> I admit to not having a publicly-visible use for this yet, but
> it does bring the NSVTOR into line with both our handling of the
> SVTOR and also with the hardware, which allows both to be set
> via reset-time config signal inputs, as seen eg on the Cortex-M55:
> https://developer.arm.com/documentation/101051/0002/Signal-descriptions/Reset-configuration-signals?lang=en
> ---
>   include/hw/arm/armv7m.h |  2 ++
>   target/arm/cpu.h        |  2 ++
>   hw/arm/armv7m.c         |  7 +++++++
>   target/arm/cpu.c        | 10 ++++++++++
>   4 files changed, 21 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
