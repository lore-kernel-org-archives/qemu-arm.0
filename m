Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2759616ejb;
        Wed, 24 May 2023 12:01:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ymjW9UTBfJ61UQVyYWYy5+zVqYBY/fEv2/T7beL19FhIaJ734n9VdLRnby71UJ6o0GCHW
X-Received: by 2002:a05:622a:1755:b0:3f6:b9af:51eb with SMTP id l21-20020a05622a175500b003f6b9af51ebmr7899874qtk.38.1684954916753;
        Wed, 24 May 2023 12:01:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684954916; cv=none;
        d=google.com; s=arc-20160816;
        b=mTlrqMH3tugQJxRun5IqaSAHxYRB3Bw6+bc3O93aQxsSRGKqjwGYcL30pkuFBzig/M
         pAJ4Ruk6YE3UgyXv0iCKSNYxtsVLF/I1IVcDhvFhjqq8XK5d98oCls1y3Rf2Zdvw2peR
         dtpN8poA7ssSIdXRoD2MMKtjXmVKCd9t9U4RBWYOH7rsuVxnVVU13eqCtHpFUfNi0kgG
         kiSsl/H4fkS1XqPu3gWhh0m75zIkc+7pqR9roq9wechSLKXy66RTJFT5z1Fw3Aaw/m4r
         wjppocNY999rvX5eFlpHSNaDAJ6OWbJ+zt97+UuUIFbNMEiSefhePTwJOFp1xKi3gMAq
         aXmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TwI8HsnLZZVW+eBChZJLSW4iUg6kKWsOAoR+HeGruLE=;
        b=dKKD1tDf4MGqtzqhejhIOFFj7AUTPVdFgEbifQcbGngw0qN8YOe9MXJCBGAb+wHlLq
         tTGDKrqCZn1OBiYUmP0cL0VouWhr0PnAgaYhTHrujPDyRNQ0DLnJVuaVU5XXMb1lhO45
         Q9letPwV62TbsTXZNyY/QHy1e7aR4kSqoZXkAes1amkpITm8+Vf0U+o30NCbttt0OtBn
         KAgylS++OgEbmy8A9bjwuPcdRuxV2H6WuxyACS0icrG6D/Rt1EdHmFYA8a6uqlY55rQI
         2neMRkB15APQuE7r26KVOG1wmyG2SxM7Kn0aaYSAx3iZ7KSBooqj8bCTdFjGhHblgfeO
         RkgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hoj3dKfx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jr9-20020a0562142a8900b005ef5593eb45si6880414qvb.187.2023.05.24.12.01.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 12:01:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hoj3dKfx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1tk7-0007Tg-IC; Wed, 24 May 2023 15:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1tk3-0007Q4-Jp
 for qemu-arm@nongnu.org; Wed, 24 May 2023 15:01:48 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1tk2-00061U-1r
 for qemu-arm@nongnu.org; Wed, 24 May 2023 15:01:47 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-5304d0d1eddso426459a12.2
 for <qemu-arm@nongnu.org>; Wed, 24 May 2023 12:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684954904; x=1687546904;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TwI8HsnLZZVW+eBChZJLSW4iUg6kKWsOAoR+HeGruLE=;
 b=Hoj3dKfxgKweRIEFnvZTXS4GVLhSjxMc6UMkEz5YwoUd2f2pTKn43Qa3R67Tqzl13h
 v5TJvxgSbfOrfscO/Gm4VAYu2SaWKL0fLXs3jfo5A+sBcs5IXjP7Hq3I+2kkEsbZ2Nuk
 ih2I+hA84Ygj1zqbBlMMoGyX7TsNDo3dG2QeAFnHpU1t0OucACoR/NS4I4XHl4H/W6tu
 kx0gx4Gyn2dB6FT6Ncx+8WhEQgQAdI7tv9HSeveMnswemn5U1cwvI06zPk2TEoGA0k8e
 TvLl5MPgDYha+JdtRdEEGsqbglCr9a5G33qKBi4p1kKUFPtxj8s/5DCeJJQhIO8EZsY6
 c92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684954904; x=1687546904;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TwI8HsnLZZVW+eBChZJLSW4iUg6kKWsOAoR+HeGruLE=;
 b=ZFdxYU0RKWmTBvs+re4vp+jcwZyN0vPDBcz008rPhBgM4EIyxPEGLsYwnfGiArlm39
 Xl34A5abvRWSsRGC+SE5kMk16XkmCsFZAFkGJPSMCA1VN85EuRXQ6HkTdQhKkZqJ4Voy
 /C1OcI/9I0QrNZvgpYRSs2nna2JKLh1mpBchXoatj30qD/Qb4tG8pyM4SAPlNOipabip
 DM40AFQ8IaKqcj1vTeQUMoIvQ2xcwUTpVZD0gZjutUOYMz7MSVSrCwai9v5MQJweLONy
 bTlM/DZka6PQstEFQmos4MB5MTWMt7vLQoRod2Mf9T5v05AA1Xmnb/gEOXmzJ5g29p3z
 CAWw==
X-Gm-Message-State: AC+VfDwcgj2YhTJ0V+FqD5ajtRqolFa+g7jRJkGFATQfzpcjMeigLJVT
 NO3XYVPc1PtrOorEmxYqopM3uw==
X-Received: by 2002:a17:902:ea84:b0:1a1:a800:96a7 with SMTP id
 x4-20020a170902ea8400b001a1a80096a7mr18789734plb.8.1684954904377; 
 Wed, 24 May 2023 12:01:44 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:6b03:9af2:33c1:3d6b?
 ([2602:ae:1598:4c01:6b03:9af2:33c1:3d6b])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a170902b78c00b001993a1fce7bsm9030560pls.196.2023.05.24.12.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 12:01:43 -0700 (PDT)
Message-ID: <ea76efaa-f298-9f29-1474-68c01bf3dc03@linaro.org>
Date: Wed, 24 May 2023 12:01:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 02/10] hw/arm/realview: Declare QOM types using
 DEFINE_TYPES() macro
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>
References: <20230524145906.33156-1-philmd@linaro.org>
 <20230524145906.33156-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230524145906.33156-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FlSE88Yr+nZw

On 5/24/23 07:58, Philippe Mathieu-Daudé wrote:
> When multiple QOM types are registered in the same file,
> it is simpler to use the the DEFINE_TYPES() macro. Replace
> the type_init() / type_register_static() combination.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/realview.c | 50 ++++++++++++++++++-----------------------------
>   1 file changed, 19 insertions(+), 31 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
