Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp323458lfg;
        Wed, 5 May 2021 06:58:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyB0BtIR2WDi0KaSJTxKwfJyhpNdZAtimFL5zT7wCNuI5RahGHUzI8RWj2lST3SeBuTIJE+
X-Received: by 2002:a6b:8b48:: with SMTP id n69mr2854414iod.165.1620223083109;
        Wed, 05 May 2021 06:58:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620223083; cv=none;
        d=google.com; s=arc-20160816;
        b=Dp6VdOV0+FXisZ2hO9aKV6wyVmuYbfA0QhpliSUqfUtIJU5xBz8fR97HJ1kOiRsBtI
         iNEdmuHPnI+goqtdygFdYELuliM3SDq7GTzlLyULYlRrmuT/2GdIrS0oAR90iixuZnT6
         b6h0q7iJfS9w09Bf9hXDZMewF0L++N2skdwnrq8ijbxxePUWiz03uwUzdcD8BBZQm8JA
         5Ni8DPyl0ZGDTdj13dCv3eIuHeP0d7kObf2V1xdKKCowdZLyaEMGO02gzpu1PRL0O3Vg
         1dxfdiOV6dTdu5QvvERvJuGYpKqbABFds7bCTxlTCE+VD0+6x7mVZb9ubtsFsSJXBadZ
         MqqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=/ieaP3xhV9TC3KxDXZX73SbAm73rENQBnFDyXwS4i3k=;
        b=rdEwiWtPfm5HrnaJjzrYDhxCkDOTx2QpRCEWY/7aqH9WaTF8EN5LlW7wSzeBj9rq1s
         Bv8ijkMhWWrAQRmPjeXWsi/zfr/REJHAN7qAXWuh4w7JXni2tJiPPwh/bQFh2Kj/6GRl
         Li3APiqyA3ihBHLqsGqEeQzZJwx8/Uf/t/5w/o77/qH7106urg1f37+5Vcfrednsyk0m
         jve1LA/s1LVvoT42+o2mRkahHJOHgyZ8H5UBet8350xi5iOPoQBHxMZvhyBkFFo5OEMX
         QxSdUbkVxeCVxLNlrThKgkjm0VwwpYeafyqrlctCG281PRan51oT21CknQ/hnvgDEwcN
         EAsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="THZgE/r5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k11si1931992jap.38.2021.05.05.06.58.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 May 2021 06:58:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="THZgE/r5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1leI2M-0001xm-Gn
	for alex.bennee@linaro.org; Wed, 05 May 2021 09:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1leI2E-0001xb-AE
 for qemu-arm@nongnu.org; Wed, 05 May 2021 09:57:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1leI28-00056W-Uk
 for qemu-arm@nongnu.org; Wed, 05 May 2021 09:57:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620223068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ieaP3xhV9TC3KxDXZX73SbAm73rENQBnFDyXwS4i3k=;
 b=THZgE/r5EKpskubXgkDwKudOzPJygA6e2CqJCYeLIdlnHbNC2XKvDLXZkOawGGvY9HFcaa
 C1yVFaAu/9jdXSax+Vzdkr4xhibNW6W9tPVtOkbC/W2WWpwbX7JWbFOf5DN7vUTj3fjPeR
 tb6hx3hUrwwAT8onxZ/n8PjJgHXm6FY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-393MtImyPpWfJVr-atqA5w-1; Wed, 05 May 2021 09:57:44 -0400
X-MC-Unique: 393MtImyPpWfJVr-atqA5w-1
Received: by mail-wr1-f72.google.com with SMTP id
 q18-20020adfc5120000b029010c2bdd72adso732322wrf.16
 for <qemu-arm@nongnu.org>; Wed, 05 May 2021 06:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/ieaP3xhV9TC3KxDXZX73SbAm73rENQBnFDyXwS4i3k=;
 b=GlLIPUHiUW7+DVr1fA2FhSty2MVa/bt+pLinJWCu20tJ70YyUOP2gs3HLHYOnscGvZ
 vOI+O1gIoY83e6kI3wRBSFeMTefFn3sgLN7b6oamByVWgeJSWfeGwQ1OS0mXQHRw7QP6
 YF0nFrAp1/Msr1XU0OxlZgieb2UB2hDgAQcG3iwtBDW4BIHVmVQa6fo3RhpvBAwfrV9S
 xLUAr9cSB5SCjgwCllDsOMP22BaEcVgLBaLeDjYRIVnLCp9uU0ILe8M4BH3xB9DtBglG
 CJLDlhcsKnt+idiwcv1R+YpAeNbf2TGcY3gMtu03m2ftCZVeltZsO/YdMiBWLR2nrHIU
 YXyg==
X-Gm-Message-State: AOAM5327WPHVc10i4u90xxXdwwXMl7EuS1HeaP9yvyiOgGz8LyjQs3+j
 TPOxTGzZTgtWW8lboicP36uWMcaCblYEmCEsYlAx2zGmrK01HqpCJ9K5rXMhQRSVkkdj4JXBkDy
 SaDssQyEkvk96
X-Received: by 2002:a5d:6a52:: with SMTP id t18mr21156364wrw.361.1620223063263; 
 Wed, 05 May 2021 06:57:43 -0700 (PDT)
X-Received: by 2002:a5d:6a52:: with SMTP id t18mr21156349wrw.361.1620223063114; 
 Wed, 05 May 2021 06:57:43 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83394.dip0.t-ipconnect.de.
 [217.232.51.148])
 by smtp.gmail.com with ESMTPSA id r36sm6312675wmp.18.2021.05.05.06.57.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 06:57:42 -0700 (PDT)
Subject: Re: [PATCH] tests/qtest/npcm7xx_pwm-test.c: Avoid g_assert_true() for
 non-test assertions
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210505135516.21097-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <43132be3-eae3-9dee-f93a-375fb5737634@redhat.com>
Date: Wed, 5 May 2021 15:57:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210505135516.21097-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3ltNeMLomjSj

On 05/05/2021 15.55, Peter Maydell wrote:
> In the glib API, the distinction between g_assert() and
> g_assert_true() is that the former is for "bug, terminate the
> application" and the latter is for "test check, on failure either
> terminate or just mark the testcase as failed".  For QEMU, g_assert()
> is always fatal, so code can assume that if the assertion fails
> execution does not proceed, but this is not true of g_assert_true().
> 
> In npcm7xx_pwm-test, the pwm_index() and pwm_module_index() functions
> include some assertions that are just guarding against possible bugs
> in the test code that might lead us to out-of-bounds array accesses.
> These should use g_assert() because they aren't part of what the test
> is testing and the code does not correctly handle the case where the
> condition was false.
> 
> This fixes some Coverity issues where Coverity knows that
> g_assert_true() can continue when the condition is false and
> complains about the possible array overrun at various callsites.
> 
> Fixes: Coverity CID 1442340, 1442341, 1442343, 1442344, 1442345, 1442346
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/qtest/npcm7xx_pwm-test.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.c
> index bd15a1c294b..a54fd70d273 100644
> --- a/tests/qtest/npcm7xx_pwm-test.c
> +++ b/tests/qtest/npcm7xx_pwm-test.c
> @@ -201,7 +201,7 @@ static int pwm_module_index(const PWMModule *module)
>   {
>       ptrdiff_t diff = module - pwm_module_list;
>   
> -    g_assert_true(diff >= 0 && diff < ARRAY_SIZE(pwm_module_list));
> +    g_assert(diff >= 0 && diff < ARRAY_SIZE(pwm_module_list));
>   
>       return diff;
>   }
> @@ -211,7 +211,7 @@ static int pwm_index(const PWM *pwm)
>   {
>       ptrdiff_t diff = pwm - pwm_list;
>   
> -    g_assert_true(diff >= 0 && diff < ARRAY_SIZE(pwm_list));
> +    g_assert(diff >= 0 && diff < ARRAY_SIZE(pwm_list));
>   
>       return diff;
>   }
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>

