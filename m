Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp529357lff;
        Fri, 30 Jul 2021 12:56:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRop1KyeCHmSrkQWLjv6cenJAe0MLkfV3XClNfeQBElG630mUNIHnhuwG4jOBWLtMNjF2Z
X-Received: by 2002:a05:6402:3128:: with SMTP id dd8mr5151636edb.367.1627674993583;
        Fri, 30 Jul 2021 12:56:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627674993; cv=none;
        d=google.com; s=arc-20160816;
        b=reLhET5kE+UOqR488GEJceTrff21f6cvSz1c6+Hpzmn2sRUOgvhErcu1Rvx6KZNH4P
         bB3gWkYPuJUgFo8iM4FGrTQnqt9EbJEsiSsUTSUFUy+6vNQ66UVBiSpaWExBK3u2cBEe
         29SC06CAEgNZkU8JDMKKQ36C+4p30zgXgi/da9vyMSMKTN4uvxQt9hcmd9yqc3kFls0k
         PCw6PYkWBHDFI54IJP7goqKtXZrNsFfR2VmqvrUARuCZD7x5cillgf8KclU0jsjbT5kJ
         yAnaxaPMGovTW0voZIrS5KUH351mWiGEgeZGRuwfWukrB1z+d01Zg0zEp0hgRkGDvaAi
         Vu7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=YQE3Wfquu1SWYjujRssERskWh9d7byGGS8GgPP7liIM=;
        b=TZEUriHPlveK/lba93NSUPruzqDbGKqXXyd3A4GRUPe3mm/S4vOfkn6p42QajtScLp
         PmBhHUxtVluxzwJjgt26xbE99YWZZkTQGF5laL34nGsSI1YmMGZ4sjoYIm+bLevqTAP4
         ME1Pb+/10OI8uOFVoX7kYgkpmeNElP7kmis/4S+seTtqAdT4y+IQoVHxF7nXBOEK7fIp
         OoH4DPZpedJqLq0zv+ZwQ6qX1Z5fz0wIMvqZ2Ox12G/hYrWzX1axiD96JxN2DwhU3IVf
         B8GTQmL3tCW76yBE+bAR42mQpkkk13GKi2vZyJIbJIvKXWYaa3UlB6cJmbimh4U+vPLv
         TywA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hobZt9cQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v22si2561498ejq.683.2021.07.30.12.56.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Jul 2021 12:56:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hobZt9cQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9YcS-0006yl-NJ
	for alex.bennee@linaro.org; Fri, 30 Jul 2021 15:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Yc2-0006sz-I7
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 15:56:07 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:41510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Yc0-0001zQ-Hq
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 15:56:06 -0400
Received: by mail-pl1-x631.google.com with SMTP id z3so11033614plg.8
 for <qemu-arm@nongnu.org>; Fri, 30 Jul 2021 12:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=YQE3Wfquu1SWYjujRssERskWh9d7byGGS8GgPP7liIM=;
 b=hobZt9cQXGdtFapw+QZdtyPMf16lJCdjLr88MJRm/snDAfUKw3SYduniBZ1rW5Y0Vl
 9Dy4fEAr8u0nsN2Ctq9yMYopruF1i1xNF7H2ZGIcqccuZQKYrlPi7+mO6gMemv96NefU
 3jp0gHpJTGjwoXyOtft6MJ4n8JnHuC/85QFKlQ7S1vHyJW4PXb3lguPO3RhmjYY0mYgi
 fR9vdJYEvshFRY7wCCl1gBloSUlihH4vqpx+m3QFJzb+0p3JAC9HsFVb9baqERdgaxR+
 9bWeaMNmY37l7WopDdnB2gnGlm8v+G4fOJgK1zyvAF8O1MKzoxuiNqqkBxsW1HEzXqzn
 qc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YQE3Wfquu1SWYjujRssERskWh9d7byGGS8GgPP7liIM=;
 b=WzxAbq1FX+ysA9VE2YF1f/QZcwULmaod8UW3kpBAdl1aUTn+FtIR7fHDR5U+Le8uKy
 JXeZ8vFmfeEZKdTLMg09juWiWWn9uq2SrWe0oqtp7xitUTQbjHy/PqAoJN1XnF4/jhU6
 D+fTvFu9jnovA8VXh3lpSpD57sIX15y2xCgRYHFy3XdinmP7GnbsN7kPOVBbZqL2lIIk
 YXbcpH+wlBDHAqSqkUVopk/Yi9CV9ZVzoN/JKaiANLTXIWPcjNK1L9L11vLZ6qRYwP7U
 A1WUJTEl+nMtiKbKzijPwMkjmcONdkIq+/Jbi5NJ1qlzdodZ6MHCizq40cdwi8KYsRUK
 5tDA==
X-Gm-Message-State: AOAM530zoHoJo52jManzARgPcF++S3C5gQz6SzJ9mbow4LsPuT9s42i2
 Gcb8josogyi/1hABzetSUDu2qw==
X-Received: by 2002:a05:6a00:1627:b029:333:323:2c04 with SMTP id
 e7-20020a056a001627b029033303232c04mr4443495pfc.78.1627674963211; 
 Fri, 30 Jul 2021 12:56:03 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id y9sm3731688pgr.10.2021.07.30.12.56.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 12:56:02 -0700 (PDT)
Subject: Re: [PATCH for-6.2 42/53] target/arm: Implement MVE scalar fp insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-43-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <11bbd4fb-869b-120a-f431-7b3910b9900c@linaro.org>
Date: Fri, 30 Jul 2021 09:55:59 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-43-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
X-TUID: MrHkzt/EJml0

On 7/29/21 1:15 AM, Peter Maydell wrote:
> Implement the MVE scalar floating point insns VADD, VSUB and VMUL.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  9 +++++++++
>   target/arm/mve.decode      | 27 +++++++++++++++++++++------
>   target/arm/mve_helper.c    | 34 ++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 20 ++++++++++++++++++++
>   4 files changed, 84 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
