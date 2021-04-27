Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4970661lfb;
        Tue, 27 Apr 2021 10:04:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6/waZZxNg1GaoruaeheTJTQNs2UP5HhFSuHsLnnLuHooq1lAjRC+PxlmIkBrFlbZre/7F
X-Received: by 2002:a92:d2cb:: with SMTP id w11mr18159287ilg.225.1619543058833;
        Tue, 27 Apr 2021 10:04:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619543058; cv=none;
        d=google.com; s=arc-20160816;
        b=H2jdbmF1iD9/wuZk2dwvKsy6XnKgi2OO/orJUDRmNIlJDBrfwQIB2RArPsdowHYJxC
         zhcfRzr5kQj08ECvxXjcmICOTQih5AQEj8MTyGG7yh4l+FTaFDczUH/vsGqrNVPzyugF
         n85ZNW0LrVeM1HkZL46hEdfcHJw7MkoD+ObAC2fJVg+15Fa5Hsqr4Q+OdCibwLkTg+uK
         4yhBG5cTbBBJKQ/jXMsjdmVFH5Lc6HLez8Y+Be+vmpJAwO6zVMeeY9Up9YfSxx1w20dh
         W9aPrI9IG7RbxJ3ZEAJXR32KZB6eH/WWPT6GORzpdYGtEqTUk/YN4VNzaf2jrLLJZMNB
         TyJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=9xvfK/EfOMBgZyRLhIRA54nxYE0bmG2l8H5KcMCGR+4=;
        b=FE8YPuvBASwMgB7LwdkLBQgUmVJ0BFEoW282zJ4X665lh3eE9OobKw1HyrC05JcTbl
         2x1Xpq3UVqS7XxfPmuZ6k1ThNcbw1AUlO22PQSlhRABdbjhXuEZUeT30T2jfYQWcawc9
         lQHiw6YJX1CzYbYah+8KbiAV0FecQjjSkIROColZBxCldvtGEODo3nKg/dB5I512r2GY
         BtAUvI5J14sR1g8R/bauPoGVVVzouI6kloO1XOp35ap5vAgWUuVUCEaDCuEoGW6gSZrD
         HJdRkoXpunYK+wGc2GbiGJjZW0G+IfX43AWgnHc8oidylHOIBjj+NvTtwne160nEFmH+
         xYZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JEIbbzPU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w3si4679183ilo.126.2021.04.27.10.04.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 10:04:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JEIbbzPU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbR8E-0007Ff-6z
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 13:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbR7p-0007FY-KJ
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 13:03:53 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:41578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbR7n-0003hi-17
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 13:03:53 -0400
Received: by mail-pf1-x429.google.com with SMTP id v191so28418pfc.8
 for <qemu-arm@nongnu.org>; Tue, 27 Apr 2021 10:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=9xvfK/EfOMBgZyRLhIRA54nxYE0bmG2l8H5KcMCGR+4=;
 b=JEIbbzPUZ/sbIBTYgq2sHsNBpJakyz4K/QBmZlSGYeLwqrM+3aX+yeTUyDyMsT0JIq
 Biio1sVU9Nk0qreDATt+VbT1u6F6QR/4iwwmM03YGGNk2Y0aBuOtNBn0iogKp4rVeCjZ
 5T/uhVJjTv9KZKOYvmFqqFJJtFyO0pYuRzIQs7ZrA0d7LneMFOcTkeic0fVX6Z2fDCRN
 Dk2tgX/shE4j1GFMSIcSJZX0zQRVlFuv+DdZeRkXjFwLafBNsZqiMj0GFbOkws9p/NIN
 eT4supGTFCYTKL/lG8miWQGhHDXRPWXthv9sA5h25mOwbh3/dY3uZ+VxdDFBJx+6C8xA
 FK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9xvfK/EfOMBgZyRLhIRA54nxYE0bmG2l8H5KcMCGR+4=;
 b=G05AKvR0zePnqufzlGCKahUaOpJPZls7Cjt0jM8pUOAtdm9eT1vgDN8NJ/obqQLk2G
 Yglau0I+2GwqAXyDSeXG6vCzUknFuh9JGm4boyysfqPoC/tWGiXuPDZGa0k//NeinLwX
 L7qJaZ1dBW12g0GE6sN2k5S1eBDb490or/CDtM2C8274wOek+U39kRiPp0U9r1QiyACm
 Iz+I9hBx++djisA6nuqT+j5d9kBOc7AvFgoEYCkUX4/D/9RNbC0E5p/oqZ5oAB+nC6SQ
 ZAnuX5muZAkauY+X5sZRNrkn1c6YzNugfQnv/xQD2j93VstXRGE/0mjw1y+YK3teW+IC
 pmOg==
X-Gm-Message-State: AOAM530O+RMnPwCZxIOj9rjUH7bsQJO2ZmetHVdBZBoDA9n4Z8mkGB5i
 9bheOeVxd4xYc0mOXUQhVJP6dg==
X-Received: by 2002:a62:1c0f:0:b029:25f:ba3c:9cc0 with SMTP id
 c15-20020a621c0f0000b029025fba3c9cc0mr23353458pfc.56.1619543029219; 
 Tue, 27 Apr 2021 10:03:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id i11sm3090598pfa.108.2021.04.27.10.03.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 10:03:48 -0700 (PDT)
Subject: Re: [PATCH 07/13] target/arm: Make functions used by translate-vfp
 global
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a3d25f34-7258-e821-4265-5844d74abfe6@linaro.org>
Date: Tue, 27 Apr 2021 10:03:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: Fs5rwXoAmVv9

On 4/13/21 9:07 AM, Peter Maydell wrote:
> +static inline void gen_set_condexec(DisasContext *s)
> +{
> +    if (s->condexec_mask) {
> +        uint32_t val = (s->condexec_cond << 4) | (s->condexec_mask >> 1);
> +        TCGv_i32 tmp = tcg_temp_new_i32();
> +        tcg_gen_movi_i32(tmp, val);
> +        store_cpu_field(tmp, condexec_bits);
> +    }
> +}
> +
> +static inline void gen_set_cpsr(TCGv_i32 var, uint32_t mask)
> +{
> +    TCGv_i32 tmp_mask = tcg_const_i32(mask);
> +    gen_helper_cpsr_write(cpu_env, var, tmp_mask);
> +    tcg_temp_free_i32(tmp_mask);
> +}

So.. these were marked inline originally, but I don't see why they should be. 
I think you should put declarations here.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
