Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3860279dye;
        Wed, 2 Jul 2025 07:42:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVM90Mfg5SYmUYckAEkRKfwkJKLeEW7FsQhOVHg377t+4UaHgEWhVT142Jn8xlyoXDCReqCs4KHLBUVkg==@linaro.org
X-Google-Smtp-Source: AGHT+IFwa5nz5nEbtzi087QdnSZRGeOAAIdaEnHFlrofCmumY3FUxx+QeYZSD0fcbl2grnDNFEqN
X-Received: by 2002:ad4:5c8a:0:b0:6ea:d6e1:f3f8 with SMTP id 6a1803df08f44-702b20b872dmr39748756d6.45.1751467331538;
        Wed, 02 Jul 2025 07:42:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751467331; cv=none;
        d=google.com; s=arc-20240605;
        b=ZJe8es2YQ7Jy2oKmIOEe9ElIb7d2lnccz7kTw3IpQf97nK+MRIyPAIaMm18jKrvg3a
         HGoHhVyFJb8YqBWC+UJrLpmjBbhVWHiUKwh0zXBUhxVLiSCiHBwYSx6IE3tXlqZU3svM
         cJpYqKGmKy9mBCVJhu7lbeD7X02vyIbl0Cf3P1e5jZ2jBQ7V/AvdkfCY232SkMqJAklW
         bcbtSsMgzIONmWjo5xeMVCG3sN9rZc7uR78SbvoXeglUVBWH9B0/wVRuAxXxnLy4RUb0
         BxgdFF1qyc1s17dbxh4UbIoPvl2MFly+UUwizZVC+O7MozOdewHKMjDMz0N5bN+MGmuL
         tKZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fJMbZzyuCjKMp2mBYkZ6K5DWbXj8hlCLm1I3s7QFSXc=;
        fh=V0+w6jqIy3FBmTmAFmJj5HFywc5yfVEc37SdtFBBcdE=;
        b=PhGDMdDFSabW1IBEgTk24wZzxORcqDnvPmI0xA97OP8xbBW9xz2tikhJKAGs6EJnt0
         1rvVgT2H3SbVlUs75ocMug5MxzS4xNuCPywQsL1bYbTGuU1x/nC0D0rDD2nO0Xm8K18X
         UXNArtrMy/Y9eV4ZNHbyVXKz/56Ma1eOcORWZoGqHznrWjtehqTXNvZ9jqwvP+nOTOdT
         R6YSNGg82lGRG576JhHzZI7GkfSVtlSYoHOni1g8MIrkzVC31jNl3ISKE3OHivDIHNpo
         rNHA9nO9cWKgzBNc9u4dxcTJ9F2tK9wrSRP4My/xlAtrfbC0/e8RrWgWxLfaSC0jL/zW
         KxOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WoNNXQ4d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd773aea14si140622186d6.469.2025.07.02.07.42.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 07:42:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WoNNXQ4d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWyew-0000YL-Di; Wed, 02 Jul 2025 10:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWyev-0000Wr-2G
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 10:42:01 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWyen-0006Ja-Vo
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 10:42:00 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-2ef60dbaefbso3135443fac.1
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 07:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751467311; x=1752072111; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fJMbZzyuCjKMp2mBYkZ6K5DWbXj8hlCLm1I3s7QFSXc=;
 b=WoNNXQ4dY/XuOt6ZABz8BU6qIacdlCS4ggZ7eX3C9Lj36DjX4s3IhaM6hEHj7lGYmC
 o/9Jl46oEdL/FWRhAf3Oo0URGOzPIAXtFjFDmNrdUc+anOkk229sASoX8krOl13wMc6S
 k1O3xWEYTAgbGSPgUp8hrxFztOlTHY1nShUCu0tevAAFc39A0Yhkr13jHHb2QGw/9PbZ
 MWB5SGY3hW0jbBYcM6p786MjBWcqjygKfu7TAIuvyuyn2UMTlS/w7HX7lAtAO9awM9zK
 JHY2u6raeuosOtx8ru4T5MwAzpQTNUGA8MqX/rckbJlHpQCt/Q28PKS5exPb7UPTJjwq
 t5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751467311; x=1752072111;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fJMbZzyuCjKMp2mBYkZ6K5DWbXj8hlCLm1I3s7QFSXc=;
 b=xS6Cc7rCQD8rp9QECNn5EJuGO9UA27vmC/5eG22dd4hDAKEv3GEGwtJOB4arrZjceU
 1BbG+fNleE+P/cCI7opfuy88KzwjWZ+rENWFdpQl0h9LPZpB3CKw/uJZUrWbVkoY7+95
 2jcw15/pSLntML9UQDeMsrI+42qjTmxCotG3dxbKDDSj72FXpsMKEJc8H1DKLVr25Ggn
 MJHGwRiyP9s9ByDecx/Nu802DRICQPBb8sfGYVlz06ilGLsl/HijPzfd5outnb/ynTqW
 wZvBvNVTvQSc46nqCWhBDfFXHuiqhlJEdyIb+t97Fhh8h5Um4sN3MgDMxlagdll8z1yP
 9PFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWICN4GTrRpy8xowdrk56OEJ4sBs/82+fBkg7tCti+YEJobu/a2bR5XJCXFztMEyk1NI+K6ZwK5uQ==@nongnu.org
X-Gm-Message-State: AOJu0YzhmpA/deXcH393yiLlBYUqA+lZuheKUYEDOSn1J82foa1JVb70
 Mk3TVXBIAfe5wAdYImNSSiLDiyciXNg6LjugopVgEQ1FxDJ9JCT3xhXwtUVPL+HhZvI=
X-Gm-Gg: ASbGncvo7epBMMGn//VBVW16CtF8hReWdA2m+TUzkrKGSi+xnptkxRWjwgW+p5pivjj
 /6GyvTSEHlylqH/VPYUkrU9LLIDugO+rccFwNgixSdKqTcTcL45fVhkjLkgZn6aI9NdEZPPnU7k
 GFgH5BYRdaug61h81XxnHClPvBKaE53eL8HbIPrcFt5xJQTbIj/9bW7mZoTKWPG6nX12wBCJShK
 EzezMNaHrCUOONGORjShyYz8kn4IoBOjwiOE0o4pFf9G5PHNruM/2kAdyEIQykhDrOUckDriLYU
 s0Y/a4xwJ5+S1LzAPpkPesaYDSDrQgqEiECGlIyCJWZunAViNxXoJCXSKDrnvnp8ktVPgKK9gAi
 h
X-Received: by 2002:a05:6870:5a4:b0:2ea:736c:2b08 with SMTP id
 586e51a60fabf-2f5c7a9111bmr2567299fac.29.1751467310889; 
 Wed, 02 Jul 2025 07:41:50 -0700 (PDT)
Received: from [10.25.7.74] ([187.210.107.185])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b4d84sm3859002fac.23.2025.07.02.07.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 07:41:50 -0700 (PDT)
Message-ID: <96fb3575-726c-4637-8223-f4948200567d@linaro.org>
Date: Wed, 2 Jul 2025 08:41:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] target/arm: Fix VSTR helper store alignment
 checks
To: William Kosasih <kosasihwilliam4@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20250702111954.128563-1-kosasihwilliam4@gmail.com>
 <20250702111954.128563-6-kosasihwilliam4@gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250702111954.128563-6-kosasihwilliam4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: IQXNp1zHVmFE

On 7/2/25 05:19, William Kosasih wrote:
> This patch adds alignment checks in the store operations in the VSTR
> instruction.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1154
> Signed-off-by: William Kosasih <kosasihwilliam4@gmail.com>
> ---
>   target/arm/tcg/mve_helper.c | 18 ++++++++++--------
>   1 file changed, 10 insertions(+), 8 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

