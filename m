Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2899890lfm;
        Tue, 16 Jun 2020 12:33:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzweEYGt27SdZpOEkeMqYuKLNmaKtzRYQoK6Ec9HBG01oQNwkNH7iE6lOhmpYkTVIRtqVd
X-Received: by 2002:a25:7a81:: with SMTP id v123mr6970680ybc.512.1592336012549;
        Tue, 16 Jun 2020 12:33:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592336012; cv=none;
        d=google.com; s=arc-20160816;
        b=AXPZu0cI3kicuCkg1azRpwtmY1bdyJrC6AAQ+6UFOCX+4o2MDEDng5KWtGl71a946b
         u5FIiwY13CWhe5c62FmgmzfQGWr/EVYqZhOT2lcUh7pGJgZYl5pl6+iM993Akbudg9dI
         kv/Uus8bYBbsBMhjHhpw95iTrzwyQ8lPrUHFyqri9c+zFDGeuN+aoqzxAg1HLkDTFW9A
         Py9Nj9cZeiry+oJPJHSbp2FQ3fr3Iujo8i8WZ/itufhfURPCCsPjyUaRGalfGHDEw7DB
         PPUmLuB9E45kFJuO/9GNy0fvIL9oDp9DZHMKncIBMaC2USkjLqZxqT5CRDKhU99tjcOJ
         NSFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ORlOaA2PbQqGiX0GiDqPOxc8JkZBiYTofpEQOQjS2Pc=;
        b=CsOK59uJXnwDlGtBfagXnoAP4QmRN7iEC/PnN8ev98EuTSf05uufvwC5/8tT2HvCpy
         CTHA0Ro9FnBRPMCANGTVbPbvgAsYA4kUNZfm+mKfzC9LAhsunUoUf0FPVwRE8BwIDAmN
         3io0UMWQPxiwDTuRFzBb9W5WcxEuophQfIwLSUaozgeybJUdQt/ZudhI/Z5ijL1L7LWD
         NASGdevX2wVz7SDGN8hNDqltHT8sE1zY0kbzD/JN6sz8c3RCFowlSHrQCmnFQhDOmM5S
         ME9CTmIdgwGtTsdt4YI6UVc0XFVZVBHPTGhisrns0/qBu4MteUwykVAPhbw6rekF0D7b
         2fzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mi2lsQiL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 136si18160121ybf.378.2020.06.16.12.33.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 12:33:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mi2lsQiL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlHKt-0002RS-VO
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 15:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlHKj-0002R5-EP
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 15:33:22 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:36437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlHKh-00070r-1P
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 15:33:21 -0400
Received: by mail-pg1-x543.google.com with SMTP id t7so23846pgt.3
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2020 12:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ORlOaA2PbQqGiX0GiDqPOxc8JkZBiYTofpEQOQjS2Pc=;
 b=mi2lsQiLpyJhhn/qaEgNKoSB4BfygWFLr/iDE48Ht55jhhpX6sqerwyZmQWJzgc0F/
 4YDmpIzzSiGO3ggP3UZP8rwJNNnwJiJwPddqPbuWx8Ee1R+L54XB8uOP1HeCHzZarwwR
 HPgxihUCdtDY03Q93xrrq8/gnoDnoB6xFeEsJcUPJS/Ki8uDKM1+fI9HcXJjMow0Ea6B
 3qHEV4WYqua0tU7Rup9Oxh1Jg2MNYtJ0rmwgFvf6go22pYhYX4dFu9z3mYD/3B2s0pHx
 8CiyV9rMzrOnrKHySWFOGGufA42cpQJcp3eBDf3huCQ+MHfLnwEsz1/Gs3gH8Pm5JaRq
 1qcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ORlOaA2PbQqGiX0GiDqPOxc8JkZBiYTofpEQOQjS2Pc=;
 b=afygGP8M7D3pqbZQ1MoapZt4qamNym9mRYPcUhKbRYwKoSOaceiNNczACeFPZ6zBfu
 D88TQ1HH483OlhumzbDeu7rdbh8Zc203ODd/emLIC2QLUSdQKkpQsc0FwwRNOGHNZM1e
 Hl86PmCkXWxUzw6Uo9YSs3EZWNnzPESKs+gWu5J+q8gTJPM4xhnhubZlABYFIGgn2aRp
 96OXF5JdpytUGoRqNwhvxeaZNjmQP6Dmrm2oYommCNHK3fbaIHOzLjTW+zP9CeXCuhFT
 GpNF+43tUgaIyFetXNiwS/XDgvibgSAcBF25qh8oMpju7In8WNOxrNrNCAJeA3hKcWQp
 HhtQ==
X-Gm-Message-State: AOAM532xcR0yhbBhlPcGyewINf5PzTct4zfHmDR5mtheGxepPIbxuPjy
 cCeKqYrX5e9OuTgsTZiOeJqrRQ==
X-Received: by 2002:a63:1305:: with SMTP id i5mr3195238pgl.140.1592335997315; 
 Tue, 16 Jun 2020 12:33:17 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id d5sm3207964pjo.20.2020.06.16.12.33.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 12:33:16 -0700 (PDT)
Subject: Re: [PATCH RFC v2] target/arm: Implement SVE2 FLOGB
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200430191405.21641-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7e1a5f0f-fed1-781b-7c38-7eade05e16f7@linaro.org>
Date: Tue, 16 Jun 2020 12:33:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200430191405.21641-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r/jAdVIOvFQR

On 4/30/20 12:14 PM, Stephen Long wrote:
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> ---
> 
> I made the changes Richard requested. I took out the status field for
> the helper function.
> 
>  include/fpu/softfloat.h    |  5 +++
>  target/arm/helper-sve.h    |  4 +++
>  target/arm/sve.decode      |  4 +++
>  target/arm/sve_helper.c    | 63 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c |  9 ++++++
>  5 files changed, 85 insertions(+)
> 
> diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
> index ecb8ba0114..275d138145 100644
> --- a/include/fpu/softfloat.h
> +++ b/include/fpu/softfloat.h
> @@ -260,6 +260,11 @@ static inline int float16_is_zero_or_denormal(float16 a)
>      return (float16_val(a) & 0x7c00) == 0;
>  }
>  
> +static inline bool float16_is_normal(float16 a)
> +{
> +    return (((float16_val(a) >> 10) + 1) & 0x1f) >= 2;
> +}

I split this out to its own patch.

> +static int16_t do_float16_logb_as_int(float16 a)
> +{
> +    if (float16_is_normal(a)) {
> +        return extract16(a, 10, 5) - 15;
> +    } else if (float16_is_infinity(a)) {
> +        return INT16_MAX;
> +    } else if (float16_is_any_nan(a) || float16_is_zero(a)) {
> +        return INT16_MIN;
> +    }
> +    // denormal

CODING_STYLE prohibits c++ comments.  Fixed.

> +static bool trans_FLOGB(DisasContext *s, arg_rpr_esz *a)
> +{
> +    static gen_helper_gvec_3 * const fns[] = {
> +        NULL,               gen_helper_flogb_h,
> +        gen_helper_flogb_s, gen_helper_flogb_d
> +    };
> +    return do_sve2_zpz_ool(s, a, fns[a->esz - 1]);

Incorrect subtract in the indexing.  Fixed.

Queued with the above changes.


r~
