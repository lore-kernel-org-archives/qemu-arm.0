Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4858075lfa;
        Tue, 8 Jun 2021 15:40:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNHXAyKR85PvgvmwwKp3UUXpasRvoKOQz/zpaXfH+h5zl3AbPo2aibCaJNglE+B19CZeFK
X-Received: by 2002:a05:6902:726:: with SMTP id l6mr22470774ybt.68.1623192027044;
        Tue, 08 Jun 2021 15:40:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623192027; cv=none;
        d=google.com; s=arc-20160816;
        b=m1d5W4V+zZgNAFWIJZKeRYAJ35fXA2bxgDhNWRRlPaJQDUueF7J1oDc7B/fpJlC/+X
         6PyjZbmL7fPXoncTvwa2ts6KAWgNAuEXzHbxPBkLDwNybr1dKHoN9zhNRywIN24GuqdM
         sbYJf9wCvQiJxZ79ePxEAu5nI+mHCTOF5UtTQrbWJaUp598zR+ZnEQ0E63R9mxgEwJNd
         9YDj9Cki4PKlQwlgQ8aGv0/iAOaL+FGmcR3XrIqOZW4GA0kTh7v4BSEGZm254PtRlLFI
         t7iMKRH3FvdSlepgPt+bgya3hFa/1aVmLJYYEbl2194xUCdF5WDNhVcpTcbpUbo0RBXD
         yF8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=BAlczLpcZLY5g25RcbL32zRn8w2rKKFFVu6N9I0TimY=;
        b=E0cEQN2aZPZJy9fmzZTJoqdvDhYzhFV32AHkD5qk8h5WyktWb47etOHvfLhUYYvnD3
         CXjQNEYgM/y2OYgsTQhn7OB0j4OHaif8Rw6Dr4X61eNkwgqwVOjOO9xnhVnVFOh1zXwJ
         9fgpz77e0g2A7OhJvpXLlD41VnIp53K6Th+gEs4BClJ99RUl06b8ayQFnKlfzEsIQpok
         8nnri5T7WaDp1i1BwICOBkW+VoQW19SC+Gt8solpyxJNDFYJTI8yL7Fc8p3aY8vXaWfF
         gCNdfpngrz9oKUAVYIB2/96p9iZowDEDOXHLZ73AvCsJUzqFXG+u7yF9jolHKUeqrMRj
         L3Rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JkX7X1Kf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9si21237031yba.207.2021.06.08.15.40.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 15:40:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JkX7X1Kf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqkOY-00060R-CY
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 18:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqkOO-00060D-0l
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 18:40:16 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:36652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqkOL-0000Eo-Ma
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 18:40:15 -0400
Received: by mail-pl1-x633.google.com with SMTP id x10so11492409plg.3
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 15:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=BAlczLpcZLY5g25RcbL32zRn8w2rKKFFVu6N9I0TimY=;
 b=JkX7X1KfPdFY09WwqJDbSjBbCESPe05GyhmQdY85P2WLuqtxSK/01VVJlsEzfP840i
 6hAXyGNvUA/5noOeVmo7gcjPLsCHzUfgPXtXRiJwCmxhDFDcrsKwgwTvizgFwNGW8ByH
 Sfv4hp3CdvXoXWJOYPvNBDS2bhjD3f7nYNh/KnzIxzr23JqRnRKTKdhVyYuG1kuVgi2b
 IwMBbpTq5wb+hUWRKpoR2kU8HF3bvdHSNNpY9VVuuJ/7JBy0aybm82w7hJPP+cPwa3nK
 L6nNuhEl92tqNz76Rp++C9NNdfAj0mBp89VJVT5TbqQYdWtALJ3OByTynBmi55kCf0Ap
 l1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BAlczLpcZLY5g25RcbL32zRn8w2rKKFFVu6N9I0TimY=;
 b=dbSIwkSK5dKvZuvuofnGIf+l3r1LaBPVKfNpZhN9p5d3KMMnLx++9bwqDWFphrTBz0
 DFvVnHH9ikuDaOGM7eFKIcoZCio1+raUxDpmor6DrytaxeahC78NGhVo2xr9jcV+xZRd
 jsv92qEe5h/ocVnb4RYWcYuG2VtMRgdBYifEEpnCp0HOO1g7hWOkjDzeGNkVC6Xbeuqk
 tVSahltGIa5CYIuYqplX4wpyIMLXq5kRY3wf6akRmY77ijemo+JUpxko50dCSGMItsYY
 xU5qMMQnLGtksW2j7LIlAUDdQ2Ja94G1VCDuTadI5aSzXqJG+xFBEJy05iWjv/7OZ/qO
 0mrg==
X-Gm-Message-State: AOAM532SzVH04oJgmFV4zIx9aBlg5c9IKO0Vm5glJmmxcyjQbVkENL6b
 GIsEEz3ic/v3cV/XCYiPWYuSKw==
X-Received: by 2002:a17:90a:d0c5:: with SMTP id
 y5mr8969490pjw.37.1623192010016; 
 Tue, 08 Jun 2021 15:40:10 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 z18sm9128114pfn.37.2021.06.08.15.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 15:40:09 -0700 (PDT)
Subject: Re: [PATCH 19/55] target/arm: Implement MVE VNEG
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b8caf6a9-33de-4f0b-4fc8-71a32c5e62e4@linaro.org>
Date: Tue, 8 Jun 2021 15:40:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: C65LBKfBjxSc

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +#define DO_NEG(N)    (-(N))
> +#define DO_FNEG(N)    ((N) ^ ~((__typeof(N))-1 >> 1))
> +
> +DO_1OP(vnegb, 1, int8_t, H1, DO_NEG)
> +DO_1OP(vnegh, 2, int16_t, H2, DO_NEG)
> +DO_1OP(vnegw, 4, int32_t, H4, DO_NEG)
> +
> +DO_1OP(vfnegh, 2, uint16_t, H2, DO_FNEG)
> +DO_1OP(vfnegs, 4, uint32_t, H4, DO_FNEG)

Similar comments to abs.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
