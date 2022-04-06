Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp706453lfu;
        Wed, 6 Apr 2022 06:40:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUN/PqDF1rbi5sXXnvVhutc11N8d+7VKKICSTjr60zfPwxoi9bv2ov69xvKpYvqE96pUiR
X-Received: by 2002:a25:760d:0:b0:637:f4f:eb05 with SMTP id r13-20020a25760d000000b006370f4feb05mr5893562ybc.550.1649252432046;
        Wed, 06 Apr 2022 06:40:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649252432; cv=none;
        d=google.com; s=arc-20160816;
        b=qIdmvqtjaXB6/f+/GQqTTD5czBUHsrSdOtblqMVnp11LDi3gceTl6Vy4d+k7jov5fc
         bXuI5/VUEQnky2I0+MlUgUlFfBgnaVdi5oU7fFDL7v2w6gzSD4chX9ojsgNFCgz4GHLV
         ND/sx6jUfpaWdJluzU6Q3xJbEJkT60d1n33XpG31/T8gmgnX9B1a5RGoFqQMDBlfVGsL
         H/s7jyt7GL+UF+wu97mvcY8dWyTprcwobzE3xCyPoQlC9SWmJUvd2eToigMl9Cr2729V
         nG3nbcpYgT6rcvFXu5yYnagkOW3/S1HDzj2t1mnLYLd40Q3lxGGm8tsBwGoqX5nkQ1Rq
         0qew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=JsIhCE1HfNCOoKQx4sW1hpRr4RYsON+3L+H+2XmG1Sw=;
        b=eq5aijdhIw4hFAyCb8cCh/ll0CQMipGrznXDhzANvFaOcOsNi6T0JOtIz1xBcVJRJ1
         eRyuP0apXkszQ9PhNyb59Xv/Num8i4TbJHxCwqBW+eAyeqF9V8AwRrnktPiZv0REMBnH
         fFJBc8hlUmrsiFyGAZm/bfa3pLG+NOoys3O7deMhYFCQbSuMRIcS05bWpafpY9HmqjDu
         mn91ZArpGrocWQ8tR/JvmybuadNTh9i3Mh/JoXd4HtF6Q7tbwOvg9fNdAVZ38zNRFuWU
         VGDCoMq6UrVBBc1tbkJg4J1SxofhXDgH757x80mVLXyVL1XXMR0RPy1mOiuzWZIlKKYo
         MBLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eMTDcyUq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n123-20020a25d681000000b00633994044fasi11370781ybg.356.2022.04.06.06.40.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Apr 2022 06:40:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eMTDcyUq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nc5tf-0001vu-GG
	for alex.bennee@linaro.org; Wed, 06 Apr 2022 09:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc5tD-0001vf-Oo
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 09:40:03 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:33678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc5tC-0000mu-9H
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 09:40:03 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id i15so2274390qvh.0
 for <qemu-arm@nongnu.org>; Wed, 06 Apr 2022 06:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JsIhCE1HfNCOoKQx4sW1hpRr4RYsON+3L+H+2XmG1Sw=;
 b=eMTDcyUqnKL8mTaHi26ic9OVeN826l0I2t+4bbrBq8o1HtdoxemJB8igORK3hHEOD1
 XDZp94u0S0TfIMN9YjtTdNs7irhnaJnQlx4q8WE/44yV08vytS0JGweNo/sdbXA2VxWU
 zBghkVKbd4mBfPS5gRgrUtSeA82JFJoYb+qFP8iAwEet53+jgWFtoA+GJXb5A7C+x58U
 4j1UlrRhViYq81a5KkK7nUbsUppk0W194WkKi+RWM6JVeAy9iRpQy+qWfdqviRb0dKB5
 MG6mMctU2Sg5iJKk6/1hynxdSKALqnK2R0vfA8TKuRPr6c4MtVelRfojGuiaEcJPfOQM
 eZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JsIhCE1HfNCOoKQx4sW1hpRr4RYsON+3L+H+2XmG1Sw=;
 b=pWSZWTDodg1V2hU3jkQbnKCQ5+XGVauQz9cPy1h1Hnana1/oS4o1f0O6uGoMUhs+Cw
 N10zXU+9HPcOJ/Uar/fFRxV4wLqPsl8i+3NrS6xNpMsxU5bKU1sF1mboxDzSwb8DtiRr
 Ap1cx25hYjiLNP9BfqG/vPEUm2WD11cTvSaLHhfKGOpLCv0YTQcma+RC4IFAh9oEsP3f
 aENojg/vXU73+PW8syqzQX3z3Tb4K/UWEgXHEqTr/459XbMKWcLMAz+6VaFSI2CVtzYT
 bugCAYt+0o6526EcT9PlxAsPq1mq1s4hD+i1iV9iwVVQTyhyY4qUlk3ytchq8zUr/oz5
 8R0g==
X-Gm-Message-State: AOAM532d/YRzhxXErQ1fzw5kDwrOEjM/zrbNb1lgKxsQbyo6F3TM6KKw
 JTd9Wfpo74DAZz5b3axuTBbRkg==
X-Received: by 2002:a05:6214:528b:b0:441:13b4:9523 with SMTP id
 kj11-20020a056214528b00b0044113b49523mr7243774qvb.3.1649252400845; 
 Wed, 06 Apr 2022 06:40:00 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 f19-20020a05620a409300b00680c933fb1csm11502357qko.20.2022.04.06.06.39.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 06:40:00 -0700 (PDT)
Message-ID: <6602d9c2-0f50-6ea0-c84c-786668f9bc64@linaro.org>
Date: Wed, 6 Apr 2022 08:39:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 03/18] hw/arm/exynos4210: Put a9mpcore device into
 state struct
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XyQOyRZMmNhA

On 4/4/22 10:46, Peter Maydell wrote:
> The exynos4210 SoC mostly creates its child devices as if it were
> board code.  This includes the a9mpcore object.  Switch that to a
> new-style "embedded in the state struct" creation, because in the
> next commit we're going to want to refer to the object again further
> down in the exynos4210_realize() function.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> I don't propose to try to do a full conversion of every child
> device; I'm only going to do them where it makes a subsequent
> commit a bit nicer, like this one.
> ---
>   include/hw/arm/exynos4210.h |  2 ++
>   hw/arm/exynos4210.c         | 11 ++++++-----
>   2 files changed, 8 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
