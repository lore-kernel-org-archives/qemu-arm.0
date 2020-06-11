Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1590814lfc;
        Thu, 11 Jun 2020 09:46:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxixcK9i8bD+i10EGh+6CObZBTKcKhIPCExLxsRO17ipSlvVx050Oze9xjHQ0ACheghxNdo
X-Received: by 2002:a05:6902:52b:: with SMTP id y11mr15344930ybs.465.1591893979237;
        Thu, 11 Jun 2020 09:46:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591893979; cv=none;
        d=google.com; s=arc-20160816;
        b=NlQUH8Ix8kUmaupjjAPSFXta5ibXz2nlnGlkwgKeQfk7jfRtB+jNy4z214/nrqJNF4
         316UFpMaFo5x9FhQJ3kRIwUaV2GgAxFyxqLVWpincgBxDAL4NaiC8SrEzAd2/+r8puv/
         mvabMaX0DzotB3wWGn361Kl659ArBqy7QpEc+H/v6nB5TDpU/I6XOdhC971/mLbTzZpQ
         EJojIBV/mV2/gb0mgZuLQ1jKfgj5d3ugJMflchygqP/eJjzWJyvBWs0fIfXNFl+IFW5i
         ZYcQ4zD/DYU8bjOt/GDj67wOExodfcj2qHrIpNiOXLrf+SbivSnJDWyriRXk8gu5FHF9
         DdvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=YJqzyYWnUHVekweupt/NqEBdOYNCkIHVXtWmiR0uVIo=;
        b=qYF3YfUhnEJX7BDE08VzRBL55X9gNEsMVEya7inE0VNtZBKcldb0KgeBDII8Bdc4i0
         2EWl9Q+5jSHiP3eqDZPF/GW2U+PPFihTp5cj80osdt8xkDKye8ar7Vkg5TJitPpp5i8C
         i/bMXM5PwNXMdfIHX2QNkgI+lLA5x19rt/qUPQ8/MLr7O897vmD1062Xa03y+waoJJSs
         usbbe57tFcsxhleKcpzCUewPrb+mDGad2GbOTT1DcyQHVko6HM6ij2xMtUM0n5aU2Grr
         0nl2rez+jD2fLxkkpjeliA0JrKNCp9WOPBTd6UZAcZ9Zwm8xV/65XOvyEeMdruOcK8s6
         ye7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vkkBPKid;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s20si3337698ybc.436.2020.06.11.09.46.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 09:46:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vkkBPKid;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjQLK-0001HK-5q
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 12:46:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jjQL5-0001CY-QQ
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 12:46:03 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:39648)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jjQL3-0003PF-Qq
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 12:46:03 -0400
Received: by mail-pf1-x441.google.com with SMTP id d66so2909416pfd.6
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2020 09:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=YJqzyYWnUHVekweupt/NqEBdOYNCkIHVXtWmiR0uVIo=;
 b=vkkBPKidzdQ1pc3aTqSL7Yqo4rSeODaj1AswlMpYGxzLgjXVssD+fA6IryLuo66ocz
 DYfE+/eoch3bXWc/5m5n7oD8fSlihc/+HauMbNDYXJeORA0eAivnXvzSQccLHawCo+IT
 +YLmFLzlRcFDuivaYAHf1vj/KnhjvlTwLqR9BzObSnufhh7UBpTkT74ZB73c0Lqe8XC2
 3Wg6CpRf+Yr00y7jY7ARwx+1TkSczewyP8McaVkU/gK+3BghrUBc5rzenuQMFfJp72rJ
 gSiLVfpbQIWw2o0kzGK34P5qMqrSaKvnJZT3x3EnQPaJn/adgsgdfIff9cuEZy4ncahr
 O2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YJqzyYWnUHVekweupt/NqEBdOYNCkIHVXtWmiR0uVIo=;
 b=c5nd3vJgt0pI1QG56S7Vk94k9Hy8BrdQX7RX1k0f4pK9Lk0DDG7WeORxPpzX9aF++C
 98CDFRbrcvlrlcC9s+jkW5Nq59r2KnTW/3QHY/uDLMrefH+2HqV4Z6fRHbmpGizvvNcM
 UxoZody0yj4AwVfskFlppBuO7n+7rlr+jq2x82E4rqd4wZx/HUo7KxeFUZ4KxwiMZKtK
 qlCuReuluAjD5se92d5PIePlW2Wpf2T5KJTVgVdZCbWFMGnyapgKD0g/mIS917rtNfrS
 Vx3MY9Ol7mdRLvAooTXEqOCxL5+hgSusPb+QI8/2v13QWzYrj4iBvQ4sLGHhXWL+urbQ
 GAXA==
X-Gm-Message-State: AOAM530/+M3F816TxwY7OP4N0gZeRkl9p5UmdK1IaL8n6q2+vMAb/Ks7
 Y6m7+y6z3PledNfn9PxJNE9uatuY9EE=
X-Received: by 2002:a63:b252:: with SMTP id t18mr7439760pgo.133.1591893953164; 
 Thu, 11 Jun 2020 09:45:53 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id v129sm3629236pfv.18.2020.06.11.09.45.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2020 09:45:52 -0700 (PDT)
Subject: Re: [PATCH 09/10] target/arm: Convert Neon VTBL, VTBX to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200611144529.8873-1-peter.maydell@linaro.org>
 <20200611144529.8873-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4e7b0959-0f0f-d523-cd1d-87bcd50c9628@linaro.org>
Date: Thu, 11 Jun 2020 09:45:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611144529.8873-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nxI/W4+77Zmt

On 6/11/20 7:45 AM, Peter Maydell wrote:
> +static bool trans_VTBL(DisasContext *s, arg_VTBL *a)
> +{
> +    int n;
> +    TCGv_i32 tmp, tmp2, tmp3, tmp4;
> +    TCGv_ptr ptr1;
> +
> +    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
> +        return false;
> +    }
> +
> +    /* UNDEF accesses to D16-D31 if they don't exist. */
> +    if (!dc_isar_feature(aa32_simd_r32, s) &&
> +        ((a->vd | a->vn | a->vm) & 0x10)) {
> +        return false;
> +    }
> +
> +    if (!vfp_access_check(s)) {
> +        return true;
> +    }
> +
> +    n = a->len + 1;
> +    if ((a->vn + n) > 32) {
> +        /*
> +         * This is UNPREDICTABLE; we choose to UNDEF to avoid the
> +         * helper function running off the end of the register file.
> +         */
> +        return 1;
> +    }

Oops, meant to point out: return false.


r~
