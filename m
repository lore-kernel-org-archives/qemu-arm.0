Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1249844ejc;
        Wed, 27 Dec 2023 16:58:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRE/xzwHu1mdUFeuYMM8H2E/PHEUIBARge1zu0gwZbhWjaeeasO+ar+GVeGDBr3X2BmQUD
X-Received: by 2002:a05:620a:126a:b0:781:149f:4e65 with SMTP id b10-20020a05620a126a00b00781149f4e65mr12295219qkl.39.1703725110357;
        Wed, 27 Dec 2023 16:58:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703725110; cv=none;
        d=google.com; s=arc-20160816;
        b=Od/01qHMjaASjHgEC3mUAkxud8FSXnZf5O/L5/7lNz5dZmA8tZk5Gjybvpf21ahOWA
         dAefzWZLPACXA5udchEtYisYOBGi4RFFMlON6XgHpV/D83kgiC3B97Dp6hIFzU3URFEh
         YpDJP5d5greUnRvp1KG7DdPXGfmigMulMu8tIh5nOwycKNXHCAjw3m7KLa1I1s1iK6+b
         Ms1ONAXcaMemmLGMsDEMmGkkVDfIaCkTofvhnv937NOzXojuxUiNIgxeaczN9c8ZpiOC
         2NqWJ6kWk+9fz3+/tcSVpsnzAtuJqSdrnnYk7pQoQtlun1dBoPKdXAl88z0XkH0kTWde
         KewQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=mnEAOwfXzrlKK0lUl3roWBrEHcVSedn2aQKv5mBA+Ro=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=0qm+dlqPUdjM9Xz30d84HFEY1rdEDGqP0AnJ0QHnIeOpB/UFwd4SheJP+A5RM8I9rR
         JynWjrhEPMl9rhZ3//czFoRVfjq76O0k8I8DjTwR/i6axWrknF+sGyfNVY1nQK+sTeqH
         EIax+PUP42Dj4EacxBfN+lGOrv+Pm2vj8RFmS/dN8NS2pyGHUaL26mkeSxNrBTbJb4kG
         9umo2/bUBbo3Ra+lU/o7XMbgeKz/G64k/KAhyyJQ5hdu23I6hiRyfVdjLLDERZ/feB46
         ltKN+f3VIu2ZYS+UnJ5Qi4SgKdsh/RgP5ODpVJC9/6r1ESqrLx+26JtQBOubDVAlxCf7
         Lj3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UtmHPmZf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2-20020a05620a240200b0077d7b05742fsi16961356qkn.33.2023.12.27.16.58.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 16:58:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UtmHPmZf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rIej5-0002Ft-K7; Wed, 27 Dec 2023 19:58:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIej4-0002Fl-LO
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 19:58:18 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIej3-0001VD-5E
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 19:58:18 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1d4006b251aso46369645ad.0
 for <qemu-arm@nongnu.org>; Wed, 27 Dec 2023 16:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703725095; x=1704329895; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mnEAOwfXzrlKK0lUl3roWBrEHcVSedn2aQKv5mBA+Ro=;
 b=UtmHPmZf83q+Yj0HmwD58nG8ziCalTchCWENl9IwkNjdyGir70OviCLbfKMQ3D6NCh
 5CnA/D2rpbjAzyXC2oyR3FB6OtCZ+3FziTb0br1JLddTFiQW7qei1evqxCB3K2zuNUHw
 eqRG6op573gOJawAHqasecP5tM9HmBojLLDqToPz8LKTFPuzuRnhULVtkcfhGKsJ5tP4
 BPqZ4ABsteDKMRLtviMS1LKunqTU0iz+wzJCQOh/qYTbuClgLfAQ4NVX2n/42uZhpH66
 LfzLXbEFP+fe6sStYbd7BVoYyZvodcLVVIV+jUJtbmm7Xr9WtTxIGaLMdU6GUxc827El
 9SZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703725095; x=1704329895;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mnEAOwfXzrlKK0lUl3roWBrEHcVSedn2aQKv5mBA+Ro=;
 b=diIM8jvL2P0PxIgxbTC1S7CI7W3977LpOc7t87Jq4BNvH9AttISl++Zo5rXsLrphSB
 U60zVLpYRiw06frKKOqmYolTwtN85YLPMa98KwNHnLd+K1+ji+GnWjIlWaJ1wQyeTCtg
 TjKjwdUN5WyN98Ru5oZ2pseNxtrgvChs6qF/Waj7yrUW/6PHh9ed1EW+b9dIW6W34qWR
 UN6GO0bnGndmNod9tfwxNssISbP8A5nmuq9mZLj35iCbzih8N/nIJR61Gu5xkYr/aIki
 yvmv9ZQF5o65KDpIdFbCSCxNXPmu6O8cTVGFh3AVq/B2fbaOVgzUq6fG3UVa2VD89r06
 9oyw==
X-Gm-Message-State: AOJu0Yy/U+EzhdSutHrPHdCMqwUdc3pE15oyudql1yvqFN5zcjXmZopq
 /1pcM8v2xynf2Pm917328tuMi4hGyl0/BQ==
X-Received: by 2002:a17:902:7ed0:b0:1d4:691e:817f with SMTP id
 p16-20020a1709027ed000b001d4691e817fmr3673440plb.126.1703725095370; 
 Wed, 27 Dec 2023 16:58:15 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a170902ea4400b001d3f285157dsm12580343plg.124.2023.12.27.16.58.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 16:58:15 -0800 (PST)
Message-ID: <cf50d75a-6191-4946-bf08-db3a31ae64c6@linaro.org>
Date: Thu, 28 Dec 2023 11:58:10 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 35/35] target/arm: Add FEAT_NV2 to max, neoverse-n2,
 neoverse-v1 CPUs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-36-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-36-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: HoTKp0+JO2eE

On 12/18/23 22:33, Peter Maydell wrote:
> Enable FEAT_NV2 on the 'max' CPU, and stop filtering it out for
> the Neoverse N2 and Neoverse V1 CPUs.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   docs/system/arm/emulation.rst | 1 +
>   target/arm/cpu.c              | 5 -----
>   target/arm/tcg/cpu64.c        | 2 +-
>   3 files changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
