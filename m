Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1860240lfc;
        Fri, 28 Aug 2020 16:24:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSxHR7x3QlgnnHvtxaTS59NdZPtivHIYyNET7D2KXmGiVRpD0rk3cIhtwJe63QYDvgG8gF
X-Received: by 2002:a25:1fd5:: with SMTP id f204mr6026106ybf.236.1598657097205;
        Fri, 28 Aug 2020 16:24:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598657097; cv=none;
        d=google.com; s=arc-20160816;
        b=j5MOJM/QsVtZ9q/yZ+1F5JcCjsrfTaHP35UzQ3gur+Gw98rOVats6TpBMq91ac0mh2
         tK+Vp2f1OqZ7l6uldqv/+RC0N5RaSPNy47u/BZvhet3a1nv8EoIebZpjZizkpJZv02aX
         B2NOk4d6CGbt65JcTUFnPvYRKkC4Q8Cx+Ae8fzKrV21sWdVsY7IhQxolFrGeDhM3sRXL
         s/OIADMda/+qAjG7MmxLoN+9sbtrlRfnBRGw+OFB8J/ewQhYhHVUglxCpQeWl4bhFQUZ
         aWheEu/6OomsmSF21306l1W4y2k0DT+VoodUqrOCBUcxs7VaUFhWumIx7dw2VBe94yzC
         Hn2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=q+pP85zdMcUhyvw6vFDHSObf7McM1ef8XS7oy20daaw=;
        b=YY+if2F19xWO4tEYrQEpSpIhkAnyoMWLCClbeisg/9QiNWKFvoOmPb39wVhlZliu8n
         pqSzETkwj1SaokfI+6DyWL4zpabF2qqCcHw0bHZTn1GvlFCtDsV+3H1ls7uPttDV2XDY
         xIPa9Ua9dhA+tIO/hLq7F+c+sNh7twK2ZTbACjzQMz/RRNRe/YG9SVAgEsuOg7PA2vSk
         pdxRb6ykGdOCZzW20iBPv+xoS8nDZvZi2b9uS9c2B3mcLsdorJa9/d9eU26E2kpnjSJy
         Pg1b4In4/xcwqWWRTGyT/whrEFlT/DNiXu5BORqvRV/cUwT30pN+B6Of5QQ7nSJ0ldU3
         39qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JZGjG6Wa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d129si707945ybc.333.2020.08.28.16.24.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 16:24:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JZGjG6Wa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBnjs-0004uk-Hs
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 19:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnjZ-0004sm-AU
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 19:24:37 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:32776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnjX-0006ZN-5z
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 19:24:36 -0400
Received: by mail-pf1-x436.google.com with SMTP id u20so1415513pfn.0
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 16:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=q+pP85zdMcUhyvw6vFDHSObf7McM1ef8XS7oy20daaw=;
 b=JZGjG6WaXZJDQ+b2nDF47ndUWsV8yW+q2ECYei/hTMxXKuWI9t4aoFuHHZgEz17tad
 30t9Q5ycWMvIqLRZ9DB1XOCOte0c958tLFpg9j+KB9s6NdRz1F1kcdkaKGq9PXRlzi0I
 ItKofLgOoMoizwovHNcCtaUGqqHdCayUZtClnytyLx3CGEDGCnwUi7YDAV2CyaKc3+1h
 iI6I9He3x9Mec8YrVl/s2CLvpK13pBEiJ2AddIKMStzmbSOnu+TfDioO8RRSor4q0fuu
 0QVBAOP1L/9GSkjcwlwdIhRHXi8uzZBVWXNYN0SWkoZNVM1+gUmTB1kOdjbPSVsxHiSb
 aLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q+pP85zdMcUhyvw6vFDHSObf7McM1ef8XS7oy20daaw=;
 b=Uj9+TTb8MEulbXrVRxCJ3Ts8bU9cyy+FxA7AcxTTifyERzDC5eu/P4UrXsZmvoG8aU
 23TZlZlNDt1BI22bUSsfTnC6b/MTjhMoNOuClQIlxUS+L9DPi0rd6qAsFJaSDzKVd9+f
 pJPtwWXfvbGu8PAaeUle38JhCENxVQf+IqvGcz7g35s8mU5rtZEsLkXB2Ec0QB/7OqJa
 DPgpM2hvQiRggGtChq/YRDU2uy3Scnm23KwyM10hXgLI01QYfzEqbVZxiTy+rnMJVVHk
 fHqDu6I3C+802blPpzWyN7UH1Z39wIr8o0dVXdPqJXfWJ0kxNeJDfszxitl9oUn0q3jp
 xs3g==
X-Gm-Message-State: AOAM532pe8KfkW7HaPZZknj3r8U9a+08pBgBFQmI74NmnT2ANJOtUiAf
 LzmVlSq4+u5pQvj+0Ao2kVgJ5w==
X-Received: by 2002:aa7:850b:: with SMTP id v11mr1078907pfn.240.1598657073314; 
 Fri, 28 Aug 2020 16:24:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id w10sm346435pjq.46.2020.08.28.16.24.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 16:24:32 -0700 (PDT)
Subject: Re: [PATCH v2 43/45] target/arm/vec_helper: Add gvec fp indexed
 multiply-and-add operations
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-44-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a9995eb6-6cb6-f041-ea09-9104e9dc293e@linaro.org>
Date: Fri, 28 Aug 2020 16:24:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-44-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-TUID: h6iP95Ixcen+

On 8/28/20 11:33 AM, Peter Maydell wrote:
> +#define float16_nop(N, M, S) (M)
> +#define float32_nop(N, M, S) (M)
> +#define float64_nop(N, M, S) (M)
>  
> +DO_FMUL_IDX(gvec_fmul_idx_h, nop, float16, H2)
> +DO_FMUL_IDX(gvec_fmul_idx_s, nop, float32, H4)
> +DO_FMUL_IDX(gvec_fmul_idx_d, nop, float64, )
> +
> +/*
> + * Non-fused multiply-accumulate operations, for Neon. NB that unlike
> + * the fused ops below they assume accumulate both from and into Vd.
> + */
> +DO_FMUL_IDX(gvec_fmla_nf_idx_h, add, float16, H2)
> +DO_FMUL_IDX(gvec_fmla_nf_idx_s, add, float32, H4)
> +DO_FMUL_IDX(gvec_fmls_nf_idx_h, sub, float16, H2)
> +DO_FMUL_IDX(gvec_fmls_nf_idx_s, sub, float32, H4)
> +
> +#undef float16_nop
> +#undef float32_nop
> +#undef float64_nop

This floatN_nop stuff is pretty ugly.

Better to pass in either floatN_mul, or the floatN_muladd_nf helpers that you
added earlier.  Although I guess you're missing float64_muladd_nf so far.


r~
