Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5708286ejb;
        Tue, 7 Feb 2023 11:43:24 -0800 (PST)
X-Google-Smtp-Source: AK7set979eiRr1XKA58vqVH4CdT7hcsHTLtS/BcHTkTG4G3wzzCYIC+ifN2cqsni48P4YFfh5Laj
X-Received: by 2002:a05:6214:767:b0:53a:bf63:b053 with SMTP id f7-20020a056214076700b0053abf63b053mr6033671qvz.45.1675799004632;
        Tue, 07 Feb 2023 11:43:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675799004; cv=none;
        d=google.com; s=arc-20160816;
        b=uXKvla99Vm6D02hfHVyWIopWkSkQkb87Uz0mfsyle6WtIhydvO+AvgF1mCccmTkeUh
         TP+itOdydFvZc2Qtc6b3CBsxkCCuNyUHnRbUC+CLVffjZMfgO9ZE8h2XctnBqpsdu0oF
         H5ARyqrqUF/b1br0Upy9fFIvt20fL7a3ecYgL3tXG275dj3TfmO/jdOOx4pvY+SZOgFc
         mF9Jwps3t1MoroLt5uN1LHkyeQccgLnj72Sf/EjT4yOUoNR6uYOrWgNGXr5VVI2hw212
         CXjt3hCBufYW/ScaVaKZe/iPUnLq3ngafhQHhT6lCmEJ0pf9g0aeBELwa/bfhAoJiDnW
         fF5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=PBl23SJtD0He1rajRLfKvwJP8z0dTyipsxVSTlScZSU=;
        b=M+UEQMJgx+lSH5ixfqjhBPXTy0B7WTwczRljSTHfSw+pA+jFCiOfDOPx8A9CEgEUme
         vegjZe9FEIGNyP7vMS51IRoF6Fq47kP28B/aBEblfEK5PPtAvGeEap2W8W9cHCBGk+Hl
         8ytFEhC55suEb9vgp7l3sGzRTX1gWpWcjYNxozU9CqKXtBs0z2EreN0/33TqgtS0FR9C
         +K4VYgSEDOgTTI5PfzGXlRRcro2LgamRo+IgAbxfz5id9iXwfYcGZA78UP59waFTfAcm
         Kx/jbndVi7l+rmNaN/TxVIEQbfeV7clZ66ObdYwr/KiVoh/9i3/neORgZ2TK4rXo57qL
         KMSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C243ZE5a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u16-20020a05620a455000b0073128e8f63esi9277838qkp.534.2023.02.07.11.43.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 11:43:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C243ZE5a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPTrz-0001Tf-OR; Tue, 07 Feb 2023 14:43:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPTry-0001TN-QO
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 14:43:10 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPTrx-0002Eg-Dl
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 14:43:10 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso19727923pjj.1
 for <qemu-arm@nongnu.org>; Tue, 07 Feb 2023 11:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PBl23SJtD0He1rajRLfKvwJP8z0dTyipsxVSTlScZSU=;
 b=C243ZE5ajpmUgSaIb/+JpznWQm9JlXkoLvfgfSCWKSYoV8w9shpsRTenvSlGtji0iG
 4ii4x2lF5T05kNYBWbioz6CyYx0nXzsA3u96paZjI2hXUmqPuZiTBLEV0LaDW1XFvP6g
 WjFRlz+lX297t0mJdZJ0ZYCuB/lG/geRDNUqyaVzxCvP9utIkagZjXwEGi2qrvxWyzGJ
 2HddIY8xMHo5KcrwW8GioL3yKGUqcpV/K1GqCKjUMRpeZR47uymSl6pvZQOt6K6PQwR+
 ziAR8IX6NIWZeEGhjYXEg1dXli6m+SH/VnOphNW5FZOmOEk7nzAX6VGxsOaouZCM0wsL
 BfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PBl23SJtD0He1rajRLfKvwJP8z0dTyipsxVSTlScZSU=;
 b=2trDxN337Iint8lrxpHqsLvPPI7oDE355OZ+t0T+o9gJveIqotV8WjaAzHckXXJs2p
 CxLT293QlpvjlDrEWwI62XzxQnSIZrYp5foArQnsBm8On17zvJfWf/xYzRSH86Keu9oz
 XO4cY2wRSEQnCL3EwP0Mzz5EjQnNPl2WXLgMLlhtOgF8gchz8f93xwTe2OAIlYn72yCq
 zjy3UFhkUwBhnGxDnoUJQgtCiD0USzTv+eksGGppT24B/peYgEcFeJty/X318V9qEDgh
 N5+TIhYACrJKaZtiJSFxdBVJ7wIu0RQM0qhBKmZNgVdSoGp/RHG/DYKQf7uvwMgbRYWF
 dwuw==
X-Gm-Message-State: AO0yUKWOPClzSk9GfylY/lmY2P8T8hYjTE0/PF4Ut99EGnS4LPovLsCK
 JAK2q0Z8KzbjHzE8i8Wyib4jiA==
X-Received: by 2002:a17:903:1389:b0:199:3d76:bc22 with SMTP id
 jx9-20020a170903138900b001993d76bc22mr644826plb.26.1675798987404; 
 Tue, 07 Feb 2023 11:43:07 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 20-20020a170902ee5400b0019900a6de6dsm5957710plo.88.2023.02.07.11.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 11:43:06 -0800 (PST)
Message-ID: <206df5ca-15e5-32e3-086a-40d333410d39@linaro.org>
Date: Tue, 7 Feb 2023 09:43:02 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 05/22] target/arm: SCR_EL3.NS may be RES1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com,
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-6-richard.henderson@linaro.org>
 <CAFEAcA-Ehp0NFqM3m8m_G1E22THR0ojTmRrnoJ7dB9vUsRvx2A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-Ehp0NFqM3m8m_G1E22THR0ojTmRrnoJ7dB9vUsRvx2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-TUID: VXuHsePcu/f8

On 2/7/23 04:39, Peter Maydell wrote:
> On Tue, 24 Jan 2023 at 00:05, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> With RME, SEL2 must also be present to support secure state.
>> The NS bit is RES1 if SEL2 is not present.
> 
> I couldn't find the bit of the spec that says this --
> could you give me a page reference?

DDI0615D.a RME Supplement, R_GSWWH.
and the bit about secure state is I_DJJQJ.


r~

