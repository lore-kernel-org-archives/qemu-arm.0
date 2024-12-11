Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4225331njb;
        Wed, 11 Dec 2024 09:20:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUgy1iuzjuOmhaf5a2/zazbqNclms8jOPI+BxxPVpOLMVGkad7sLji3TyhbNsE+F2Kqobk0mAREvL8Yug==@linaro.org
X-Google-Smtp-Source: AGHT+IG8nUcECWkJaXkhqT8qAPYiiWPVgMiPK0huD+K04VuqCSoUwKp4QhjFVzCzJMMym28CG/Gn
X-Received: by 2002:a05:620a:1d03:b0:7b6:edd0:d754 with SMTP id af79cd13be357-7b6f251a943mr17927585a.9.1733937605096;
        Wed, 11 Dec 2024 09:20:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733937605; cv=none;
        d=google.com; s=arc-20240605;
        b=C3IDSt7XJEI7JhTkxwl4839qP6dmF/3QHcEVf+fCtexD113h5B8XprAGLH32ckvlqS
         eKM6mlFdaTDcjCAkM4+GQmHC6M7CGfijodd/BPVCbGzdDb9e3GZ1E8J08T70Kr14zz8I
         9EYgG8MbFNiEBgbpc2K4g/Bc+jW0hBSUZeHwhVheLmVgCuDs4UE6ofYWb3dwRBjn2HzM
         JdrAw0yQz4eRrIoTJ/WgibqoCzlJSOOjEOXrVbXtYB2JxsreQ/WBjXCpyuFtXa5cxWpl
         d94V8qatik8LcW1TQfipYyw3rj0jNyeHeKBJv/3v80RgHAKNvAxM+/JHRM6mTXMDqthy
         dcBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=5waepcRG0rE96d3+FTAxo9ZMgSmUAmPYYL6auywoo5k=;
        fh=6kRp3K1jVRJe/0go9qIIcZsa+Wj5WXzmWLQ1QEnOntI=;
        b=SDC+oiZrr9w4WczSDiEonGqHUFVFBkCTmLua1EPEc34X0x3HmvRhyfiKP2eqE2lV7i
         wPhMjbk/FTgKC4dqWqIZdhXuMm77cwnNX/F0Q/IBjzfQLlpWmntm5SZg4LRSMB/sbJFa
         wHEh3hahdPDp/tjYYSGDstfUr+IHcndKdVXJb5EOjSlzQAo+6UDt/A+MdarUd9ChiOEW
         MBaJqquLfe7KOFWPcQtBjxlB65PBH/JYFiLUNA0gc/S5vdhqb5TWReo0e/fi7kg78Um0
         i87D4eN1IseXoNAZBIDlbSnWe/dnyGhjq+wyFUORbFxyikbO8Pq0EXK8nro8IvS+R3jM
         1WYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="y2U6/kJl";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6cc0547a8si1053750185a.430.2024.12.11.09.20.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 09:20:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="y2U6/kJl";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLQN0-0003ZZ-9g; Wed, 11 Dec 2024 12:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tLQMy-0003ZG-Db
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 12:19:28 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tLQMv-0000Px-TA
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 12:19:27 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-434a766b475so66917145e9.1
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 09:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733937563; x=1734542363; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5waepcRG0rE96d3+FTAxo9ZMgSmUAmPYYL6auywoo5k=;
 b=y2U6/kJl02LpnZd3w23Mi8mXzhoRS+MwKdVIR7cq4jh7fK4deMMNBK+nHHyNwr9jrl
 FPVXf0YgSam8guRbzx5xdY9iuYcDjfDlKYpkaSGY1VXZPP9s8+Nc/sUP/LP9EUb3Boxw
 5QIlQu2bpwihpriAghMNMSA4j8MAyEcwPPsXuOcncymStHagN2EumxQ/MOrjKrtLBI7C
 WH1Cr2MxshqNNdtFunLDUApqPar+qh4WCLGC0Vc19JIkXmV5+Xku35IZBXsPMovB8tF0
 thtHWR+NuB+94tVEdHUo9yOiUqb9GjBb1tGTbTCWQHuLAaDhwjqkFCZcR1GPW5PuPQ5G
 P5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733937563; x=1734542363;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5waepcRG0rE96d3+FTAxo9ZMgSmUAmPYYL6auywoo5k=;
 b=c4CwarYdBZxjFVomGmRTmkKQoc74wVOlRhpb8Mq8kzgcOXO5PCdUe9LWkSJjIx9Es/
 M6HQ92v1vNdo5hcukBOqZf3SW/otxebtc48vfSuCgxWiGYpKfESq8rA6VDoO5BEChXO2
 P+4Q+ilyR+oxQ7nlbXSjIjQS151mVQwLtfPQ4FMAzrTsOLBTn+B4/MuPG+/4UXkMLqgV
 LJbTYmzWHYdUEGZVn3iN4MMcgDBSSQGsqCGSzMnEW9drYZ+Dszto4oX0UxcExP/D+F4N
 ewcn52mjPMK+sGl5gnEZ1cjkZP9FRkmhE5OZOQ4u8duaopdGyHCNSyJvCCAJHw0zSC0j
 4thA==
X-Gm-Message-State: AOJu0YyX4iw5pBELR5IjkmnImtWbeWSt10NPjO1NBojrCF24JULDMKUe
 FY/UOdXyD+TZG+3G/iQaiiGYlPmDFqvLiJXrfY8++FjoQF1s7uIGqlAwSrAd0gw=
X-Gm-Gg: ASbGncuf0wYf0PQqoY2/XQ/VkPS5Cu0+feOqET2CHXInHGqYswfyUfvA+FUFGsBTCpP
 rby4yPislWdbGmh7fC9Gej7PhGtcrG/rakSMEvWiUzoCkER8sOe8hS/2KmMnYl08xrj2IPlMQ7S
 YXS5T2nDrWrlxjg0PBxTu1GkyKcO1sDQ2uI37q5zazSDZGsc3eNNAKg/5cYVEto0ayUMW83n4OW
 3yP9pTn+v83VabvvCZ4QSf8X4h4UEyEVX3Wyfxnw6ys7aDvUhn00eS0MX+v8FUdELx2NSrbPuUM
 BSHlr1BJEhRPcgBzQ4qX3BZF
X-Received: by 2002:a05:600c:4e4b:b0:434:a0bf:98ea with SMTP id
 5b1f17b1804b1-4361c35cc4bmr29206985e9.9.1733937562991; 
 Wed, 11 Dec 2024 09:19:22 -0800 (PST)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4361968eed5sm44525915e9.42.2024.12.11.09.19.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 09:19:21 -0800 (PST)
Message-ID: <934e7598-8927-4d35-9784-6d33d7892952@linaro.org>
Date: Wed, 11 Dec 2024 18:19:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 42/69] target/arm: Introduce gen_gvec_rev{16,32,64}
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
 <20241211163036.2297116-43-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241211163036.2297116-43-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: opIbvyeBUB1J

On 11/12/24 17:30, Richard Henderson wrote:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate.h      |  6 +++
>   target/arm/tcg/gengvec.c        | 58 ++++++++++++++++++++++
>   target/arm/tcg/translate-neon.c | 88 +++++++--------------------------
>   3 files changed, 81 insertions(+), 71 deletions(-)
> 
> diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
> index cb8e1b2586..342ebedafc 100644
> --- a/target/arm/tcg/translate.h
> +++ b/target/arm/tcg/translate.h
> @@ -586,6 +586,12 @@ void gen_gvec_cnt(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
>                     uint32_t opr_sz, uint32_t max_sz);
>   void gen_gvec_rbit(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
>                      uint32_t opr_sz, uint32_t max_sz);
> +void gen_gvec_rev16(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
> +                    uint32_t opr_sz, uint32_t max_sz);
> +void gen_gvec_rev32(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
> +                    uint32_t opr_sz, uint32_t max_sz);
> +void gen_gvec_rev64(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
> +                    uint32_t opr_sz, uint32_t max_sz);

Remembering 
https://lore.kernel.org/qemu-devel/20230822124042.54739-1-philmd@linaro.org/, 
these gvec helpers might be useful for other targets.
