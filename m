Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp75567ejb;
        Sat, 28 Jan 2023 15:50:31 -0800 (PST)
X-Google-Smtp-Source: AK7set9XJ38t9aQKeu6FlG27SXdjuartWV+rbTHv3IEkBKmNbOiHB2ppE2iQHEuawsiYZVt16JaR
X-Received: by 2002:a0c:808a:0:b0:539:cee8:1996 with SMTP id 10-20020a0c808a000000b00539cee81996mr6376743qvb.22.1674949830765;
        Sat, 28 Jan 2023 15:50:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674949830; cv=none;
        d=google.com; s=arc-20160816;
        b=HfMBMGFh95188Z0nRlav2ejhxnF3O48mwvPVZvqhqm3Ti+h1WeEZrwAP4TkyaX4OOj
         dCrZBD8xd7bMiqzcldi+DYjCjzgXD//WGb69LzHR8P1B8nyf7ui0hhnYe3RW89SlYCFx
         GIj0mKMMiLLzP6LQuiKbqQtmmojEg3SiZHQPhS9/vWel5FiEeIZrS7VSbj8nhxH5Ho6X
         0DHwwzrPAmbBzYIcx+34Q6Ok9OG9dtHMjTXmc1sODdGzhx2X8ELSxSitVn8RGhpK2lu/
         oNK/725dq+s+m2gLNy4Wbzrbyk2BnVre9FptxnZM72cdi0ps83p3ODkQ2k89CxW/wd3b
         aB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=aa1Dv0jiUu32T3/DHeDJl8vwD1U6nXqk0yICUoGM+WQ=;
        b=RSgeDZFKnkdBPqAlCorfxYit6bwb5CtYEHhKACSlCyASRaxQszLx85M6VSbNBQmYuB
         CRPdEpfcwLPrEwL5/HeVV1cDP6xiGA+aUxF2L1U2S2Aa/D5P5j1rqIdz3M4r+K7sgbZW
         +BUakNunONgtc+oMZ4oRANYtnbYBW9V3QFp0GfD7Co9jKAfw217IDy+z/vjOJjZHVahO
         Osvhj0p+Cxm7L+U5xtvE9VIyQVBY1kSR8zuZK6c9p8NaYPIdllYaYUChTFnpiZ8BUp1B
         KnCozbCokmfUL6+/qaqf40mJltRsT0mOQjLc3lv1SdmQnxPLQFGxCZnZvp/MGWvxUDgz
         Kpvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QKtQWYy9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id lm1-20020a056214568100b0053a1ba1194csi1569528qvb.529.2023.01.28.15.50.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Jan 2023 15:50:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QKtQWYy9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLuxc-0000y6-Sg; Sat, 28 Jan 2023 18:50:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLuxb-0000xZ-AC
 for qemu-arm@nongnu.org; Sat, 28 Jan 2023 18:50:15 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLuxZ-0006sC-HX
 for qemu-arm@nongnu.org; Sat, 28 Jan 2023 18:50:15 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso12140869pjj.1
 for <qemu-arm@nongnu.org>; Sat, 28 Jan 2023 15:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aa1Dv0jiUu32T3/DHeDJl8vwD1U6nXqk0yICUoGM+WQ=;
 b=QKtQWYy99mmOW0Zm6mjIENc4Dvu64MJ9Ujt4PyW0n+Q955fDF61NT65E7Qx0/uVtC+
 5HNCFlQe457HoGS/7qZPDTGeN42Xv8w+wZL9wTm3Fp01urVXwiodQkZwQim4gLLe/eI3
 KJr+PqEpMcs9gWLo8liLQcC4FYdBA+U7rFpJ9QG/NR24IOsa/KbHsnknk1Epbb6Zpb7y
 a2Gk/sSccH7dO/iGHyUL+5J1Cu3aVrISjuGHCBTisHBi1X3qUhztRR4bV5ynMeT+DhBf
 Sf7MQSUWivXCcb2ALVhHs+kPIgMJDZ9CHPK/AMoU511dW2IvWY7tMu2XW7EtK3KwvooI
 Qjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aa1Dv0jiUu32T3/DHeDJl8vwD1U6nXqk0yICUoGM+WQ=;
 b=D82AFkILG3IUDFk3jbUqNM4rLi3rHOTUDV+6LTkCDisdFdwF29BcMSmGcc5SgfOQ3s
 eleDHuAjUWb198VA7iMpDQB9ZutYkLjmA8U7Red0W7l5u+8saFB6OM2Yd5sWTsWQi5j9
 2qjogeMTcmBIp/SojpPYRBff4IEFPOrDDzeFQp/rvJ21kfOQ5z62r8cvX4X4UdMfQPJy
 kpu5sel7hdyCPFlna6EW3z8EorYK0Lc3kiAqU4Gmri/gHwMIDgp9o08TFUaiaBrI1ldK
 uIxnFDYkXrp/zOioHt+lejxLMFhRcafG7mfxMMtC3NFFIgYfPrdxiA2WkZrXTpRj2kKn
 5Ckg==
X-Gm-Message-State: AO0yUKXDozq2M8uud/RIIElK/aJCIdvyymy0xBZwdbVr0nPvmyOYtKnW
 1pswbwgaa3TnqWFSSKu+VI/pZQ==
X-Received: by 2002:a17:902:f682:b0:196:3f75:1e9c with SMTP id
 l2-20020a170902f68200b001963f751e9cmr14236738plg.52.1674949812168; 
 Sat, 28 Jan 2023 15:50:12 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 x10-20020a170902ec8a00b0019488090884sm1581648plg.273.2023.01.28.15.50.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jan 2023 15:50:11 -0800 (PST)
Message-ID: <c616284c-9694-74e7-edc0-f06fed2e540d@linaro.org>
Date: Sat, 28 Jan 2023 13:50:08 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 19/23] target/arm: Mark up sysregs for HFGITR bits 48..63
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: RPsDOx5UFi8f

On 1/27/23 07:55, Peter Maydell wrote:
> Mark up the sysreg definitions for the system instructions
> trapped by HFGITR bits 48..63.
> 
> Some of these bits are for trapping instructions which are
> not in the system instruction encoding (i.e. which are
> not handled by the ARMCPRegInfo mechanism):
>   * ERET, ERETAA, ERETAB
>   * SVC
> 
> We will have to handle those separately and manually.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpregs.h | 4 ++++
>   target/arm/helper.c | 9 +++++++++
>   2 files changed, 13 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
