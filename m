Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4153319lfg;
        Mon, 28 Jun 2021 09:31:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYKJpwN3otj17KIH4UMm5wemkDgeWh5G6eUtQ9FMfNyE35OZye0mFLbX9f/f3bFznWw1WH
X-Received: by 2002:a25:cb53:: with SMTP id b80mr30490532ybg.481.1624897884077;
        Mon, 28 Jun 2021 09:31:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624897884; cv=none;
        d=google.com; s=arc-20160816;
        b=lQaditG2K7lAnAq/yqfn1jxRQj1j8mYi1We2cz/H0f6CP26YNj8F54/Wfv4Toy59me
         gSWLV+xJlTYJ0Ifgg/M97K1WxPSsnFJUXjm+536nJn9nzj6BwCXXXDUw2bb4TCT5oGfY
         CvTcL+RN2dhvK1ZzZd4IkFQ3QuooukORzl0ha7IGRqZCtRZS8p+8EENjFiH7wZZtTEQC
         m2g0gTpMf06nQIic8aPRVm1ICWAg/QivT62D7XI9xLvxbwYP4LNfBSZogI6zfMtHyDLO
         6yv/Pr2LQD81zTu700j4zszrWoNoiF9P56IgIl0M7bertjhvlFA21bZJu8NwRRQSwYCz
         rDCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=vNSjbU8THh4t8aSdMIn1hsK6nV9QeKdPFes3OCG6L5A=;
        b=LySinqD93vKNyAY5XjesC9kafCeGMYWFjfRVersAn0A3WBcKEEXLhrJWeo+Xz6j3K+
         OI98WKsmIWXMbRTeSBzUaCzZGJRr6CqZYv8sHKWicf9t98GlW9x8KN3oL5txNPd4EsnT
         bsGFBUCqeohFPl1vtSQiLsKu+MBThgOFotPrwN4DHVOGE7qJM2lkz5Ujmj5D12VL1r4j
         pla3ZSPvFvTBiIbKxq9NredztXSNPsI542X+fehaZStBB0F5KSJQyRU5YIojDzNWh1Lg
         IMF73WwwsUOhTpZgXbqcxQn/yO3SHtm5uw8atoMpdmbAPNWikoRTKICnfBij5GXlkltE
         kvHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NZkLf2m3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l39si9182709ybj.135.2021.06.28.09.31.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 09:31:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NZkLf2m3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxuAN-0001vS-ET
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 12:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxu9z-0001vB-Rt
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 12:30:59 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:40755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxu9x-000773-Vv
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 12:30:59 -0400
Received: by mail-pg1-x52c.google.com with SMTP id m2so15889875pgk.7
 for <qemu-arm@nongnu.org>; Mon, 28 Jun 2021 09:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=vNSjbU8THh4t8aSdMIn1hsK6nV9QeKdPFes3OCG6L5A=;
 b=NZkLf2m3En2ihN7RoJuM6YgvZyYRIhJgc1cbhxGC5L89IqnytFSMBVHr2x6wRjmvwg
 8qfuxEGA0+dzhD8Njy6aFM/QGUBtDFQszpTwUXUmzKWDY4VJWDhmnV3y7yNVazGICTwo
 4D5JmM50qJAZK1OLmby2JJ2wSIzejChFMMwk5BouWcF6w+KnrTN4cT/GNzqll4ygz1Lk
 nBWDxq1HLaq74tZAiA8a0yeVaGYNEZqdi3ObeoZ6fc7CuLShhNGLyCRfKLSTTcSrt0jh
 EedV0ZvWnPknZyotQaDoqajbotnX6aZK5eXPE2VEouuciF0CIQI88RQENJvlnSZdQjdd
 fpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vNSjbU8THh4t8aSdMIn1hsK6nV9QeKdPFes3OCG6L5A=;
 b=a1EfDBjpAHyG9kF899frOl6BYR0p8xUE13Qt1/marJ7S9quQOtxa9Dn0WzK9KXSPF5
 CX9q1VP97TQ0I49TdG9ZOiQ/imFUkjSLaYR6232fOeL5o3olirD4QUxaTHF/6VmhlFLT
 QET+8DEHcF39kY6ImEaOnGPcor2qnmzV1/p/S8TwHzfv/D6f8VDUtz6YjfNTBagKyx+h
 aihadgtGQYJbbunOOADwGUGOJqjtHyZo/dIaZzq17VYxbdXnON0QOVvNgBZZlDNUBWNe
 oD4YBJXJRqQNShdGQTKAF2e2Ow0f98gO4nTBZ8CQIEcXXmSYwzbhduH1EXwcMM8i7Ej9
 JUYg==
X-Gm-Message-State: AOAM532BUQOkimFDK2rXV6FRnT/8w1Io9ILeuq+9cCXYOXpCN0OGGzXO
 LQhrnkhq4nb2qR/Q1fkHz1XcUg==
X-Received: by 2002:a05:6a00:17a5:b029:305:d4e8:7391 with SMTP id
 s37-20020a056a0017a5b0290305d4e87391mr26253209pfg.0.1624897856606; 
 Mon, 28 Jun 2021 09:30:56 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id p24sm15528928pfh.17.2021.06.28.09.30.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 09:30:56 -0700 (PDT)
Subject: Re: [PATCH 11/18] target/arm: Implement MVE VSHRN, VRSHRN
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5951e05a-373e-c6e7-abcb-67638b3cd626@linaro.org>
Date: Mon, 28 Jun 2021 09:30:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
X-TUID: CVCrvgV3bmsm

On 6/28/21 6:58 AM, Peter Maydell wrote:
> Implement the MVE shift-right-and-narrow insn VSHRN and VRSHRN.
> 
> do_urshr() is borrowed from sve_helper.c.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 10 ++++++++++
>   target/arm/mve.decode      | 11 +++++++++++
>   target/arm/mve_helper.c    | 40 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 15 ++++++++++++++
>   4 files changed, 76 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
