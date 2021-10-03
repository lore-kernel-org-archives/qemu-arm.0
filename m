Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3067709lfp;
        Sun, 3 Oct 2021 08:43:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqJFlzX/v7ByrID4Gi3SdmEhaGom2mwCbD0slvQ+c2RVi1ZhxPp8c4Os5wWPXEsUUAaoXG
X-Received: by 2002:a0c:aa97:: with SMTP id f23mr12342077qvb.49.1633275791330;
        Sun, 03 Oct 2021 08:43:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633275791; cv=none;
        d=google.com; s=arc-20160816;
        b=jedzNKrPAAG1JIy1W9NlMTXURofhPC6BNw790N2uo1HoCgW0AMcnP/hB/iwjxerTRc
         dazvK9NDYpBotn0hVIdCu/JEgLeovz72O/pzvUI0wKsa+ta5p438K2HxdLa7CqhkVD/w
         O5Mrd7nnqsAK4cGC21ry3alvGhHwoncs/LZ7q8s2bqp2mBU2xSibwpKuFZ8gbhV2EqMI
         n58f9JqSVsNdToLx0YzI9Ca14V/Va72G6cNHDBW+6o7c2JVsjqEHyRitB3ubdDBGB8BM
         /Zzp7XyULLJpKY/sG2E+RIbBDVq8qerosmB1iV/6m+xdUdY5L3ZGX8vjFx51CDLUvtdV
         s3MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=4mrd9sx9SL5FfEhQRI2Gj3kmjz1HWrwhmueP+IS1rk4=;
        b=ODfF4uA2ynT/Ymjv5OefvYsJGlFXS8/frljOi4SI11W67ByOaT70U3fMHgb7qWLqN9
         BvdargjOdQbIZ25shqKZHZU9OXdsxHxlT8lgDKcuP53Zlm1zGw5Vri10is8vSq3vZqbg
         RGD1YOegU1YSpYWnRw2JSsDCGBUs1F2Qq2qgUwFIWhFPGRBx9vWG1ld8os+E9StkZ5YR
         UEJonGbdsJoNR49F8M4ZTsdYTlgA79jOyDk9fRxIhWyfXCkeKtkkKggPNCxoikdfnjpJ
         XHLICMH5+NvbKYggXDGmKfeN5/+4Qq9V7tIiF00Gi3Su6hwbtfmccTennI1Im6uQa3WM
         21ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w3iBz6Iv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z24si6228424qkj.47.2021.10.03.08.43.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Oct 2021 08:43:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w3iBz6Iv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mX3du-0007sR-Lc
	for alex.bennee@linaro.org; Sun, 03 Oct 2021 11:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX3dj-0007mj-A6
 for qemu-arm@nongnu.org; Sun, 03 Oct 2021 11:42:59 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:35666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX3df-0002q2-Cm
 for qemu-arm@nongnu.org; Sun, 03 Oct 2021 11:42:58 -0400
Received: by mail-qk1-x72f.google.com with SMTP id c7so14157024qka.2
 for <qemu-arm@nongnu.org>; Sun, 03 Oct 2021 08:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4mrd9sx9SL5FfEhQRI2Gj3kmjz1HWrwhmueP+IS1rk4=;
 b=w3iBz6IvJPv1L8kS/1ex57Cdg19caU05OrSkeAPqJob+GJ3cYeYwUTndbrCf7Zal7p
 CdoIwA173i9n4zaf+MDh1jzK+Me8aeorqkf1C610XBjbTw/WstQDiNny41g4Q92Vj87P
 zzHx9JJZKQTesJ+zg+7lYWR40W52DktC07kFKgoLHwp7EuwtF6N1EhcJQI1vLGrUbm7r
 nkqr2MIx/lIlOWd1Q6XepuSm9pMRu38qfQuLzwlDXaWOGSw4UeFEGSlluS2Wyh0elBJO
 kO/pJRmyRil9veoQTl/6h6BeUuvKYAMX9C66IfYP6Vh+kbghBLxdx12zzPAzLdXc5oAh
 lXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4mrd9sx9SL5FfEhQRI2Gj3kmjz1HWrwhmueP+IS1rk4=;
 b=LFlkx9o1+6BXXoziv3kVfTZLqauJ4+b93lClnCMObF7v6TSoJzJ3uVJVQMwa0maOt4
 nyGOcbwoEef1JCwQ/N3aNlkG/UtpYvLMaaeMgo+YTfOK8RiOqLCy8IMQiIRriaia40vn
 pTV79esvIjjR2OtWtqReRdr0CXocQ8uBowGgxHlQ8TpRJI0vcHsyLpjWx4yLCxkr/5mi
 LDN38LDtuq6TlLPEnE6hDo8hUbVLhABO1wWh/lCg3BjYGVMsZTuenbW3svJdjIPXvjTv
 c+YFSaDvlml8bpgxVCPCrubg3XQY3HXsbUalCu2tfUiEAY2cJUi053ktx5A2LYR3WH28
 g3qA==
X-Gm-Message-State: AOAM531Iq3h/LQd6/VV9Qb7a/ycD1OZmxAuJdYWsBV480f40UKgA9DYA
 HfaBUdbkhyE/ekKHjAoaTaoPcA23hQ7Dqw==
X-Received: by 2002:a05:620a:550:: with SMTP id
 o16mr6630250qko.146.1633275774453; 
 Sun, 03 Oct 2021 08:42:54 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id l1sm7120637qti.94.2021.10.03.08.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 08:42:54 -0700 (PDT)
Subject: Re: [PATCH 2/3] target/arm: Introduce store_cpu_field_constant()
 helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211003143901.3681356-1-f4bug@amsat.org>
 <20211003143901.3681356-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bf1c7cfa-6a0a-586c-58a2-8886402952a2@linaro.org>
Date: Sun, 3 Oct 2021 11:35:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003143901.3681356-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4ROv3qo5/mp8

On 10/3/21 10:39 AM, Philippe Mathieu-Daudé wrote:
> -static inline void store_cpu_offset(TCGv_i32 var, int offset)
> +static inline void store_cpu_offset(TCGv_i32 var, int offset, bool is_temp)
>   {
>       tcg_gen_st_i32(var, cpu_env, offset);
> -    tcg_temp_free_i32(var);
> +    if (is_temp) {
> +        tcg_temp_free_i32(var);
> +    }
>   }
>   
>   #define store_cpu_field(var, name) \
> -    store_cpu_offset(var, offsetof(CPUARMState, name))
> +    store_cpu_offset(var, offsetof(CPUARMState, name), true)
> +
> +#define store_cpu_field_constant(val, name) \
> +    store_cpu_offset(tcg_const_i32(val), offsetof(CPUARMState, name), false)
>   

You missed out on using tcg_constant_i32 in the end.

r~
