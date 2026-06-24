Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E79CDB479
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Jun 2026 15:34:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcPcc-0006ks-Pe; Wed, 24 Jun 2026 11:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcPcV-0006YO-VG
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 11:34:32 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcPcT-00066Z-Av
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 11:34:31 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-8452a597afcso898899b3a.1
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 08:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782315267; x=1782920067; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R0Pj1hqE0m1Rh9djYkM4GnP5bV55XrC3Am6L+pR13BE=;
 b=YKXJrXzGJ3IbWhaKrR3NNRczHdY7iVeCC5l9HoO+syy+HK9ImUr/E44kDM/lz5iOoj
 rMdYIiLCqaFV9qaPZDTxdHwnW7dkw/rqGuHjCvpnzh2HSWfiBLr6EwzjFGjA71TMMGAh
 00W87dnhS5NYP5NEGHb2JaQxzDRQbILbl9iePO09YdU6ROKGdUNzwYcA7kjFN++e0JnM
 BVxOejcsCaxXC7gUbBjqjpPLPS047GpkdSQXx3ZBiRsRVEFrX6kzxtRdjnYNcIu46ywn
 YOnpFY023qLaYiAIajXlpYtkULDJ7TpfmI/8C3MrSZL2do9FIFmvRea2CLTTsVbrbz7a
 O61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782315267; x=1782920067;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R0Pj1hqE0m1Rh9djYkM4GnP5bV55XrC3Am6L+pR13BE=;
 b=QwWoJsNsM31miEQodA73sitJzdJB0eL2ggxS3zlcyJ3IoS5ntQ1qeDajcrYMclD4lk
 v1dqXqnRNXk2XQzxZikNCZkVCv/y3KoddJ9gciZCpnIPXbeomrn8L70prkpcGQEfnUv4
 8djkWtyU2Ghr1rhIoPpnRJ6GtMGlOtHnneNbtXwqqPxIf/yVBqn/SOO2DtHcqC0oAKhT
 TkBDojF3kcsEBk8hTFertcbfvfEEeb/+e8IvKP3qhy4vEdnT+JBRzr+OPOpVhG1VlQx7
 IoL/VDUpRUJMBOU7bQIEfX86iIJKXE0ZvQEGZwEuYucg4v2N6/eCJVCl+MppUZKCA4EN
 TJcg==
X-Forwarded-Encrypted: i=1;
 AHgh+RonolNWDb7M5LEdtjIiLCqdzXLm1VukYB0qfWfPBDDf6JcNxT0koXAHC20ILhfRmgItb37So52Bxw==@nongnu.org
X-Gm-Message-State: AOJu0YwrvN0pcJniIfXS1hhmlF5uDHpAIZsgz1wZnc/xM7W8VtBaLEEd
 9h5KenYkJlGmGhgKmWZXnFDBnmgEpQjzVuN6VZZR+rtYgnc5GHqWcQtc4o2/L2RFnlI=
X-Gm-Gg: AfdE7clXQFzv/kjRqeQKh2UQXAyeemmAjZRZj5RDYLrIqRTwvCZ1UdTug/62qXTE15u
 7nLbpa62izU4ZedPKyBgPfu1OxTeOEyrFTzk6YP9ifyv9GF5Zoyk4kSu4JiegcBQ+DJJpNmxTcY
 8YBv5QQdj/TLMBIv7hRHeEzMulNXHj6qBPTa5UzXFuxCBzNsNRCGX5by9xeB5I3DvxmZPPZlEod
 tgPrVbIuRGyFPgopGo4lov8bZvGvaMQSwCVT7Y6ToLFAgdwzrfe5+5sXbQeG+uv5UVlYnR5Pe2Q
 xMqOXQ4LJeWDxUCW2IYZeZJEypTMQxjl4swdwOf+E5tlFtIP94+izj2MYamRbOW/MwNabuHfAw2
 tEhC1mwTlpNx0rdFmDlbwhx6C8QgAtYBpFYc5v72yeuvqT3t4bpmA7pN53TcFAP3JlW7eZi/VTb
 FtBg8KUVLNq0h5948TEpLKfqKFw2tZ/gLIo3dUf7PMztkMTPPGjwUUje6JXQ==
X-Received: by 2002:a05:6a00:2992:b0:841:dc85:1638 with SMTP id
 d2e1a72fcca58-845625b5631mr27929730b3a.42.1782315266485; 
 Wed, 24 Jun 2026 08:34:26 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-845a413d2aasm3009283b3a.59.2026.06.24.08.34.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 08:34:25 -0700 (PDT)
Message-ID: <4c5c2c64-34a5-4d60-a199-c31a837e38d1@linaro.org>
Date: Wed, 24 Jun 2026 08:34:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] target/arm/tcg: Implement new instructions for
 FPRCVT
To: Jim MacArthur <jim.macarthur@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Alex Bennee <alex.bennee@linaro.org>
References: <20260624-jmac-fprcvt-v2-0-dc6cf8e512b6@linaro.org>
 <20260624-jmac-fprcvt-v2-1-dc6cf8e512b6@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260624-jmac-fprcvt-v2-1-dc6cf8e512b6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 6/24/26 06:37, Jim MacArthur wrote:
>   /*
> - * [US]CVTF (vector), scalar version.
> - * Which sounds weird, but really just means input from fp register
> + * [US]CVTF (vector), scalar or SIMD version.
> + * Which sounds weird, but really just means input from FP/SIMD register
>    * instead of input from general register.  Input and output element
> - * size are always equal.
> + * size are always equal for the scalar version and different for the
> + * SIMD version.
>    */
> -static bool do_cvtf_f(DisasContext *s, arg_fcvt *a, bool is_signed)
> +static bool do_cvtf_f(DisasContext *s, arg_fcvt *a, MemOp src_mop_int,
> +                      bool is_signed)
>   {
>       TCGv_i64 tcg_int;
>       int check = fp_access_check_scalar_hsd(s, a->esz);
> @@ -9918,14 +9920,18 @@ static bool do_cvtf_f(DisasContext *s, arg_fcvt *a, bool is_signed)
>       if (check <= 0) {
>           return check == 0;
>       }
> -
>       tcg_int = tcg_temp_new_i64();
> -    read_vec_element(s, tcg_int, a->rn, 0, a->esz | (is_signed ? MO_SIGN : 0));
> +    read_vec_element(s, tcg_int, a->rn, 0,
> +                     src_mop_int | (is_signed ? MO_SIGN : 0));
>       return do_cvtf_scalar(s, a->esz, a->rd, a->shift, tcg_int, is_signed);
>   }
>   
> -TRANS(SCVTF_f, do_cvtf_f, a, true)
> -TRANS(UCVTF_f, do_cvtf_f, a, false)
> +TRANS(SCVTF_f, do_cvtf_f, a, a->esz, true)
> +TRANS(UCVTF_f, do_cvtf_f, a, a->esz, false)
> +TRANS_FEAT(SCVTF_simd, aa64_fprcvt, do_cvtf_f, a,
> +           a->sf ? MO_64 : MO_32, true)
> +TRANS_FEAT(UCVTF_simd, aa64_fprcvt, do_cvtf_f, a,
> +           a->sf ? MO_64 : MO_32, false)

Good, thanks.

> +/*
> + * Floating point to int conversion, but puts the result
> + * in a SIMD register.
> + */
> +static bool do_fcvt_simd(DisasContext *s, arg_fcvt *a,
> +                      ARMFPRounding rmode, bool is_signed)
> +{
> +    TCGv_i64 tcg_int;
> +    int check = fp_access_check_scalar_hsd(s, a->esz);
> +
> +    if (check <= 0) {
> +        return check == 0;
> +    }
> +    /*
> +     * a->sf should specify destination size (64 bit or 32 bit)
> +     * a->esz specifies source size
> +     */
> +    tcg_int = tcg_temp_new_i64();
> +    do_fcvt_scalar(s, (a->sf ? MO_64 : MO_32) | (is_signed ? MO_SIGN : 0),
> +                   a->esz, tcg_int, a->shift, a->rn, rmode);
> +
> +    if (!s->fpcr_nep) {
> +        clear_vec(s, a->rd);
> +    }
> +    write_vec_element(s, tcg_int, a->rd, 0, (a->sf ? MO_64 : MO_32));
> +    return true;
> +}

I had suggested that the same MemOp change be done to do_fcvt_f, for the destination.


r~

