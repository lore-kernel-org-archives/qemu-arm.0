Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp3066567lfc;
        Mon, 26 Jul 2021 10:16:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKh46MEzCM3QyfUOkoQQw8BLf/fOIH7cgyIedcaSsF7huHhTXawWAO1Wz3LycR8QCGGsJu
X-Received: by 2002:a05:6102:38cc:: with SMTP id k12mr13392930vst.8.1627319787538;
        Mon, 26 Jul 2021 10:16:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627319787; cv=none;
        d=google.com; s=arc-20160816;
        b=gSQTKPP5bUB3Q0UkeK2qVVFIva9o2f0oEr/stJxAnAzd+G5WXaZGvV2UR8/8SN0kYi
         FfVJs+pUp+d4JEvXele7ZT7FTyB1EU9nQflCR3ipvz7FaWIi5N0CNjbYP5yHWpHXUrbH
         je0YqEKBC79/dO366tDs/DLzZba+Fq6vgIrsLPxsPtKfE46qBgJ0s9dXyMbFC6oh8qum
         7X6kyyvptWBz8wMscKT1yi08TjHPVUknspMAbKmw3KUeam4rlDc83GvQ3ziGxQv4QNmx
         +p0qDY604NmuZLa9+4BGmyNma+g6kwHHLezPJGRbLsncjXr0zv/i1psLarkSfNJGDgMZ
         +DTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=TIwcmFJ8ftLQSfMD7wCrH93sIomORdxm1KxXckz3UGg=;
        b=sl0/UxTkgRTtpeAUG4xQmH8NRsgu2b/pXA4tp7d+652osgbdQl93hRp+t5Di3KrldP
         3IcTyAoH6G4eHEMV1aku4k2a+gB1yeuES9FY89yIp9h/c4ZKtl61O/C6yHsgBvUh6zrZ
         q0xm5nK+/BXaRXcmoQWSCteKuVtfJyGmlEbnzCUzfwwnj7P+F7uiyUncvYJ+6Cy1TD30
         mQ1fGg7mMswVsfQmdxORzSiti2RudGYlzJlnyrzHfIL55Pevu4vE6NEQCUrT/Sc//iFO
         qYP+qKKcw4adVtBN9Iok1IFaCAsv0i7PIUgJeES+jZnfWdPZ6Fznal7dOVNKG6kL/ceV
         jJHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HYlmDuUx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g15si301193vsj.412.2021.07.26.10.16.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Jul 2021 10:16:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HYlmDuUx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m84DK-00009Z-Ry
	for alex.bennee@linaro.org; Mon, 26 Jul 2021 13:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m84Cy-00005E-Uz
 for qemu-arm@nongnu.org; Mon, 26 Jul 2021 13:16:04 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:53229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m84Cw-00087Q-VW
 for qemu-arm@nongnu.org; Mon, 26 Jul 2021 13:16:04 -0400
Received: by mail-pj1-x1030.google.com with SMTP id m1so13812647pjv.2
 for <qemu-arm@nongnu.org>; Mon, 26 Jul 2021 10:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TIwcmFJ8ftLQSfMD7wCrH93sIomORdxm1KxXckz3UGg=;
 b=HYlmDuUxZRkA1e6CmjvE8O4ybV5HvRixIiLUp1v800hl/rUyqg/v5Z6bfujSxdTr4l
 ax6CrcJ+77/9nMOzXiEc2XfKadm+TO2no5+8woi6u7yMcrMA6ssnWetku+GibiY6/EAW
 Vgjbvz5iL4+WgvxFkKIK0JsUE0GSH6mWGtrsuTc2gwsgbIXwowwDenehhlmdPj0G7Ass
 62XVI2ySQaq324Pbcn2Y8qNnvDDZhXNoKhdKDl3PI4yOUv8RTiHFEIa67QUOC1HH4KeP
 6hXvvmFxiFpDAaLf0w5n5H13IuDiT21BjAbZsqOr4c+tEyqR/bFQqnov7dCtmSp27nnt
 pDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TIwcmFJ8ftLQSfMD7wCrH93sIomORdxm1KxXckz3UGg=;
 b=J71zn/jVrQp7zwkGy8VIAc9WcilRHtc7iMtfbp/lN1dgIvQA9nFRzGcC5pG/7xhZDB
 5bb7EiraqosmLdLJTZpu9iyOdbSEQfydTKZ1CEdtYoJLl2r3jaWilWMB0dgRgIQk6p/1
 NznzhO3vt0KjCIfDFSivGnG9YpUsVlTEjOcWii4JfZyTyuLlNJDoFFYeXyKmSetY1Q5w
 5LKx9dW7gI8RuQcmZTv4I9aWvWAOyIX6h50zi+oWcZI+wZbMUWdfCHENuT0utEbb0ZiH
 L2MGgBxaHM+PhmvHlQv1nalD3x9m3loa4BLlrEa0KUIcSU4ZFKQe6lo73wbiqoBiFl4s
 J9Qg==
X-Gm-Message-State: AOAM530BZaXaPM6+nidtZJXl/I0pXTNLRluDygv6FpsdjDZPWLu05dKt
 gMnvs3+G4ShCTdFtm4d24bfDmlw4bshrIg==
X-Received: by 2002:a17:90a:fef:: with SMTP id 102mr46905pjz.148.1627319761363; 
 Mon, 26 Jul 2021 10:16:01 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id i14sm268451pgh.79.2021.07.26.10.16.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 10:16:01 -0700 (PDT)
Subject: Re: [PATCH] hw/arm/nseries: Display hexadecimal value with '0x' prefix
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210726150953.1218690-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <96e9e3a8-e643-deb2-f3ed-9cea98bccc11@linaro.org>
Date: Mon, 26 Jul 2021 07:15:58 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726150953.1218690-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.438,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QuCNbG/VMrZL

On 7/26/21 5:09 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/arm/nseries.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
