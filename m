Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3660198ejy;
        Wed, 5 Jul 2023 08:34:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHTwy06IQ/KrDcY4WI+12WvnaeoFuWZYVJOXakTSNWQfkzP0a8i/lzda4tCFwXuiWziF/Zq
X-Received: by 2002:a05:622a:183:b0:403:3dbd:34bb with SMTP id s3-20020a05622a018300b004033dbd34bbmr20044686qtw.65.1688571263428;
        Wed, 05 Jul 2023 08:34:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688571263; cv=none;
        d=google.com; s=arc-20160816;
        b=XMQXyxfFFKAkgraB9tZM10gAPwXl1VkF9DvfhiBTMfZ3BadYXY9Xew8gjhT0A6p86M
         AVl0q4ETfRouoPwjMwanKZUDjSFk7cTx7JmzaPk34FUtPHDSsouHtB9iH09yyWrlA44Y
         JNewVDGliY5PZdRn/Z11obBx73vXcamKAfyqaGhNsl+osuBYDzzUEFJ0C2IhYZ3NWPln
         i9DVqxnLKg+JyugzPXeG7f9kGbruFCXajUVXJHQuhb8GYdEeG5EvwdYNvKT+0eZte+4B
         n7s1m0+aLgi/OQnWyBF50nDegio6Wi7c6AcKljGRmna/z2lYt9UtP6CEa82mxdQ+hBWR
         ONqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BijOKpxhsL4YdPUFBh/GVdEMhdIcPEMY6+zmB2m8ez8=;
        fh=5V6lsO/XbMWucEL95hDLnujkZS50lEqXaY3oFHinqBs=;
        b=lYLZ4eQ7iVFpTtLLT7bBv9+dfxZOKjpEQXC+DPNqcVp7D9YGSjMjbOl0FyxUDPr0kh
         NFfNn/6bItuy5QEFA9ZLK0pT/IzityueJ2pyEQVynQgdKumqfCVYPr8SLF4/cQM/cv8B
         HQt7Ud5g7DtJlH+pXq8BreH1OO0im6GOVNK4PGBZWiNJ6I/nti7kL7rWFeOGaSF1YsAW
         zQ6+FB34ivnIZaUPnqr5UubynHsJz8NAXhKceDYJYJp71l/p5xBJBJbPDzGAW/QhFb/s
         BGRlQS7fk5L5HLkzRCgrgSWwwub5Uu55RpaIUgYR9mvzk2W29UiCsQiqzanSRsTivtKm
         0yxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FqYylTrX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12-20020ac85c0c000000b004035fb86de8si4081555qti.88.2023.07.05.08.34.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jul 2023 08:34:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FqYylTrX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qH4WH-00014g-B9; Wed, 05 Jul 2023 11:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4WF-000143-Qo
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:34:15 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4WD-0007Am-IO
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:34:15 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f86e6e4038so1160703e87.0
 for <qemu-arm@nongnu.org>; Wed, 05 Jul 2023 08:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688571251; x=1691163251;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BijOKpxhsL4YdPUFBh/GVdEMhdIcPEMY6+zmB2m8ez8=;
 b=FqYylTrXvq/ye1S93mYfjHKced+3BV+XTiRF/hZW0aP8VOVJmqMVpfW1b1XBcPj5Fd
 byiTTzlqKh78X4exMCvicJdj53sBNFM4c9/NlLFCf0awP4Z89gwARUohbhT0pZef2ee8
 hvLxG48EAVpOYN7awhNRbado1lNLdJb6AUPcBCwectjjzOS9Ui4NCmIp4qpTaVHtwxAJ
 ZfysbeCWd9ZgnegDwRUbLuoJ+M+tWcLZ4mUsZcAmdTpa4SDjqN7D4xDd91cQBK4eDuoG
 3oisM1Y+w1QkW9A4DWyXZWHY8CulynVPXiDHgjcfUjGiosF+1cCFKDzKtmaqbItboA9T
 90hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688571251; x=1691163251;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BijOKpxhsL4YdPUFBh/GVdEMhdIcPEMY6+zmB2m8ez8=;
 b=B9c5b9hSy5DpHj+cmeuxbABMXT9uLnN698P4zIZrOZfPqUW4ColLZ/6izSBuvrnyvK
 1A68sQh8k68iy5P5jHD8dJuaQ+rr6kehzYMELS3DtzUUDT+PkAFs2rb9jtXSZVGjKCSk
 PMPCggvGGSKykzcFzQnzl7qvrvOkKQOWblJ9+uDZmjJlxWsDepLG8UvxGmbEuVUa2P+m
 zHUNUD7DxRD2W4iVVO3kQHmAorPvxEJzelZO1Ar8Nf89J7vvHrs+JcJma1i4nLzcsQkV
 IuQb8JSqRvOtcpeOWeGbC7AqilhpBYcFU3zPcME56q9Jq3Z+11S5Tw2uu+qUwVsdEYJP
 KtkA==
X-Gm-Message-State: ABy/qLZHIfJ57n9ZVfW2de5CPTWi60JW70hb892cbEsD/zdsIhvP8CF7
 N3bt0lGYIB9I3zawEe8xz02c4A==
X-Received: by 2002:a05:6512:2509:b0:4f7:6462:e036 with SMTP id
 be9-20020a056512250900b004f76462e036mr1033645lfb.11.1688571251402; 
 Wed, 05 Jul 2023 08:34:11 -0700 (PDT)
Received: from [192.168.82.227] ([91.223.100.51])
 by smtp.gmail.com with ESMTPSA id
 t6-20020ac25486000000b004f8703fbd80sm3915150lfk.57.2023.07.05.08.34.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 08:34:11 -0700 (PDT)
Message-ID: <1e438370-e666-fa33-3cad-a362f8689e06@linaro.org>
Date: Wed, 5 Jul 2023 17:34:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 07/19] hw/timer/arm_timer: Rename TYPE_SP804 ->
 TYPE_SP804_TIMER
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sergey Kambalin <serg.oker@gmail.com>
References: <20230704145012.49870-1-philmd@linaro.org>
 <20230704145012.49870-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230704145012.49870-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-TUID: LyHq7mBcFYfo

On 7/4/23 16:50, Philippe Mathieu-Daudé wrote:
> Having a QOM object using its device type as suffix is
> often helpful.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/timer/arm_timer.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
