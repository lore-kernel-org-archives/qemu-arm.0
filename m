Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp887402lfp;
        Thu, 14 Jul 2022 16:23:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s+iS5/QVs7XDAtgjGCKtCgSk+u2RNSgIZxgP5DfxLo+Df/ZNHrheOd5YzITMTVtPKWiLIh
X-Received: by 2002:ae9:eb08:0:b0:6b5:cc8a:a041 with SMTP id b8-20020ae9eb08000000b006b5cc8aa041mr1255139qkg.413.1657841030287;
        Thu, 14 Jul 2022 16:23:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657841030; cv=none;
        d=google.com; s=arc-20160816;
        b=dm6u+4RD1tmHQakCc22+5ot2EhMlrZQki7JdliproMnFdLH2qI6SL+ZiQ0HycFYsYK
         Fm6lR9SjRSHPpZBgKX5IHuP3Sz/Jvybsb3InhW/bJj5ApKTPVdMq1aSFVqqxPXeLexiV
         DZEol0cwuhoK7yqBbzkMogofmrWtzAFUXbfc59XSzUl9u01bc+3a7URn6WE9aDp++m7W
         hWuyohLUmDBVyf8CPqKjXDbp0YUT663JwSuRJPdS2kuWtZ7Mto+LpLaOnoNvEOBJ5Qxg
         EUCY7jxqFeOGV4mp1yUGrhHLi9qj9I+uxX81M3SxQd15QGM0PPr5akgyaQ+3p5b0KGJw
         zTjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=LzvX9q6R52TkTLuhnBqHqW2KLCPqvPUV7UKwMbTEkfE=;
        b=I7V+mqlA8u71Ibgc3p+tb6V9tll5gBxI+2WByqy8CNawkyD6uFaPPADiPSOJvuVILV
         PJ0v1ObOX82761K/OxPJ9iZWa5TbW+775fVAOuRcdGacY5Kor/TK9TabQH442Y7UBYya
         6MN0l6EkXvuh3CHpsjxGUj3gduCXZ71eiJC4bfwtl7CIcx1AmbFxlWeVFeqWpWEpLwtz
         FUB5SC4VX7Z3Sk4vQuUjBm5xluhERcVK4zZqcvHvJaDf4u0W2sGqlCx40XVqdJ/W8qDG
         jA1gpRgZDiThiZgaKS/HyahP2sLn3wMzC1x3ykT4nCH89q0fp2t0/l19yr6mQR0HSJVG
         zPjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BSSqgGpo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e68-20020a37b547000000b006b599512c02si1649077qkf.159.2022.07.14.16.23.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 16:23:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BSSqgGpo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC8BR-0001Z5-QK
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 19:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oC8BF-0001X1-UR
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 19:23:37 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:39753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oC8BE-0007rL-8S
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 19:23:37 -0400
Received: by mail-io1-xd2c.google.com with SMTP id 125so2707171iou.6
 for <qemu-arm@nongnu.org>; Thu, 14 Jul 2022 16:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LzvX9q6R52TkTLuhnBqHqW2KLCPqvPUV7UKwMbTEkfE=;
 b=BSSqgGpo1Slu5Bf36CI1cVaV9qh2Zk0bkbhhlBOdfLQPoae0UhM1T4ygwirzbZJASB
 04vgtWKx/p9vlT3SCZzLAm1LrT5f1rGfEF7hWtxpk8BiCW466VgjQnDHhUtvevQG0jJe
 YUlmT2n/6qJ+iqgM6I0PooPA8h3Rd269vHrUMQ8NqJlCQUBCkhw+17raeU0o0AuHia/3
 XT4g5M97Co2F5DdxrgyVUhJDK6zhQRUhGJTEYfyMZ0cF0ZIUsnDAI5F8ndi2Yx/WVv2u
 Uff1MvCRdJsnJD3jvVbW8ZJFLZPA50zmFtedT6UoMGBOAEDgPM1g3kkNZ+gZIYD1Cqc8
 qXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LzvX9q6R52TkTLuhnBqHqW2KLCPqvPUV7UKwMbTEkfE=;
 b=xkfT5FB0xrKDOEN3ZBh3xAmvPyFO89WqS1EYVr7gmu//GTqYSC7N5NB++QiSHt/uMK
 4KHm069IWNWph1+Yo58ryixBgttdwMtsNWM6VK91E394Jlh9Dl+3UTfkrPb0LbqQDTSo
 RKJ1rnrNe6ts65rqt8nYx4awOa+QOktNWneBtws+AwyHFbL3IV5jhhiHPW8JkDJq1S6l
 oFVpJc82UP9YSaN9jdm9Gcdvj1V9uYhSS6bHsH/qn8VVW6ykrs7QGMn7W6m4t4q3BxLz
 DTRuHRcWroslfxB+Y0F5lhG9ij4TU2fL8QORqHJ+BO1U+uXwVItakbQk66tNVI0lqgYp
 F8SA==
X-Gm-Message-State: AJIora/G1YImUuABzSuc37dIrFhTdY6xn+1g8Oj+Z3lan2idm7bfGVJT
 ZEr/B48EFKiXNlhQobflFsaiXA==
X-Received: by 2002:a6b:3fd6:0:b0:67b:d97f:47d3 with SMTP id
 m205-20020a6b3fd6000000b0067bd97f47d3mr1410339ioa.46.1657841014998; 
 Thu, 14 Jul 2022 16:23:34 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.185])
 by smtp.gmail.com with ESMTPSA id
 bw7-20020a056638460700b00331c58086d8sm1277649jab.147.2022.07.14.16.23.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 16:23:34 -0700 (PDT)
Message-ID: <93eb992a-4619-dbfe-5df1-ad54cfa7d40e@linaro.org>
Date: Fri, 15 Jul 2022 04:53:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 6/7] target/arm: Store TCR_EL* registers as uint64_t
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Idan Horowitz <idan.horowitz@gmail.com>
References: <20220714132303.1287193-1-peter.maydell@linaro.org>
 <20220714132303.1287193-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220714132303.1287193-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lNXQUywzpcAz

On 7/14/22 18:53, Peter Maydell wrote:
> Change the representation of the TCR_EL* registers in the CPU state
> struct from struct TCR to uint64_t.  This allows us to drop the
> custom vmsa_ttbcr_raw_write() function, moving the "enforce RES0"
> checks to their more usual location in the writefn
> vmsa_ttbcr_write().  We also don't need the resetfn any more.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h          |  8 +----
>   target/arm/internals.h    |  6 ++--
>   target/arm/cpu.c          |  2 +-
>   target/arm/debug_helper.c |  2 +-
>   target/arm/helper.c       | 75 +++++++++++----------------------------
>   target/arm/ptw.c          |  2 +-
>   6 files changed, 27 insertions(+), 68 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
