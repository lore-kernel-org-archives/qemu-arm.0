Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp623108lfg;
        Thu, 18 Mar 2021 11:49:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsZtYlemL3nBlfjolkp8LK/R0CrK8SJpQK82aV45e5wkT/+mqJrts7xLP/LziBwwZ7rPnd
X-Received: by 2002:a92:c541:: with SMTP id a1mr12152089ilj.249.1616093375702;
        Thu, 18 Mar 2021 11:49:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616093375; cv=none;
        d=google.com; s=arc-20160816;
        b=LqPTascTf04JLCdrLnZ8FD/Zna9r+F353KHY421OLARJg06DZrsd6nkRBcqQArMtEm
         qEjVr4UL5s/3DAcPTNK0V/AqM/f8ycwtvHwF4EYmegwCOGU2WB4AyUxDfmGxjirKZFfX
         R0ANmGHv+HNXDslF8IjHI99qot90fbiLm9TfLo+IvqFcmJX3gl/Ghdd5j/tz19rvK4a7
         bve6C3MgBKm7hgxl8000DHOvT/ZfUeE1Sn8gCv4QCAHvq7iNsCe3FzwfpPoJoMJd9Sp2
         uLa7OekMdYN8JtI8jlCQfMcoFhYNePo9ztnj3nuvyB4Hu8YOwZWUBJYhJESDxR+K4EYN
         fpAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=S+VSVrp3YsMqmu2uBUuVXa0j96Blp1FfeLNvci+x28Q=;
        b=koqIUSQgpCvzq3STZfYRns4pcqas9vCZ0g9smN/3liS7gV+jEv5DSFRRYPmlU/Farx
         t7B9WGOOjqq3jXnnhTwSpF3PSNEtF7hgc+1w7EBSzEW3TgnLyWQjvOO6a80+8l9015Se
         /t2q6ZOg8S/gRJS6Nv6XXtqcL8P3fadrPEC7ZJfAfJAlZgps2PK/qttVBz36xz7SOWFW
         sqMjrcju8y3Hne47Oj80BWExgL2vrW6nQDfFYi40VM0oDQi7Qb0qtb4JsLPydzWNQ5lq
         dL0+8YXT/ty+iarJLr4EM5I1ewLWL4yvmyUL+NI1CmzP4UhuGIhlTn7hUwNK2QsEF2x8
         0Xww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KrYnltzl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a16si1938203iow.42.2021.03.18.11.49.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Mar 2021 11:49:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KrYnltzl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMxi7-0005fU-5b
	for alex.bennee@linaro.org; Thu, 18 Mar 2021 14:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMxda-0002bs-A1
 for qemu-arm@nongnu.org; Thu, 18 Mar 2021 14:44:50 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:35751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMxdU-0005Zk-Us
 for qemu-arm@nongnu.org; Thu, 18 Mar 2021 14:44:50 -0400
Received: by mail-oi1-x236.google.com with SMTP id x2so2010013oiv.2
 for <qemu-arm@nongnu.org>; Thu, 18 Mar 2021 11:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S+VSVrp3YsMqmu2uBUuVXa0j96Blp1FfeLNvci+x28Q=;
 b=KrYnltzltxjZhDm9N3UxWMLb2qIGUtTynwwWrIm2b242qKTcuXKx2mEFtJ4kjuQr1J
 xZZWjcdk4vV5MNku1he+cf4r9qvWFfPno9KXFgeTi2alKU+tcaJgK/quFqckDvlJwVLn
 yBhml78d4T9Ozq6NE4A9dG5nyDqf0AIClIjkdV1BjfhKDj4IgcVN02dFK3Z2FQC1dNe7
 DI9yPwRTgMtqZ2T3IfdVT76RWRIaTn+XHICR36E3C5cP5pLAuiq0aYm8bncqACpDEe4m
 Qskkf5QL+7aJnRneyPrJbW+Iq4zi6LIwmuiAu+ilCzBnPpIolJL3NMyu4PHEBIm/m714
 vbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S+VSVrp3YsMqmu2uBUuVXa0j96Blp1FfeLNvci+x28Q=;
 b=JEr/b2bv1ucvwN+DmzIC7ZUyg7CJ1cAF7xNucpN45f6oyEXsdgVD5MSTE9VFhlvwzy
 EGk0uoz7/0XhpersoEtUj0nC4gI9sQ05fDQ9ETgkpWUrWtZAHeCvDg2DqqL1PlgDTD5X
 uMi7bgnAMj0UFpMJWgXzZvDXYgP1lM+vCu6ESVJ6MY2PVn93Ux/nRUjRukODIRM8Jd+t
 Idw+xv5G25kMpeuoHZunVV0IJdMbHhWLMJ6ifF3QE2StmDOeIaRWALTXVOQKQF97mfbn
 is+Lb724u5nyXFNgYyW9GKP9lUowL2MU9Vyufa9OYAq2pbdJQzn5RvSb9nteyfkWa1pB
 DjVg==
X-Gm-Message-State: AOAM530/zIsAzje2hY7ncdMdhGannrzBU6uC/lK278BtvhbLbT43EDBP
 d6BTMHdUbjycmW3ZZAbKefqIFA==
X-Received: by 2002:aca:1e16:: with SMTP id m22mr4013601oic.153.1616093083910; 
 Thu, 18 Mar 2021 11:44:43 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id 64sm708006oob.12.2021.03.18.11.44.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 11:44:43 -0700 (PDT)
Subject: Re: [PATCH for-6.0 v2 5/5] target/arm: Make M-profile VTOR loads on
 reset handle memory aliasing
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210318174823.18066-1-peter.maydell@linaro.org>
 <20210318174823.18066-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e9f44dba-bfc5-41b2-e60e-6101e96c8f63@linaro.org>
Date: Thu, 18 Mar 2021 12:44:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210318174823.18066-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
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
X-TUID: 6B8ZKzdMGqQ2

On 3/18/21 11:48 AM, Peter Maydell wrote:
> For Arm M-profile CPUs, on reset the CPU must load its initial PC and
> SP from a vector table in guest memory.  Because we can't guarantee
> reset ordering, we have to handle the possibility that the ROM blob
> loader's reset function has not yet run when the CPU resets, in which
> case the data in an ELF file specified by the user won't be in guest
> memory to be read yet.
> 
> We work around the reset ordering problem by checking whether the ROM
> blob loader has any data for the address where the vector table is,
> using rom_ptr().  Unfortunately this does not handle the possibility
> of memory aliasing.  For many M-profile boards, memory can be
> accessed via multiple possible physical addresses; if the board has
> the vector table at address X but the user's ELF file loads data via
> a different address Y which is an alias to the same underlying guest
> RAM then rom_ptr() will not find it.
> 
> Use the new rom_ptr_for_as() function, which deals with memory
> aliasing when locating a relevant ROM blob.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

