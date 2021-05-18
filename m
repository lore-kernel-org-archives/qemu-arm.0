Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp313218lfm;
        Tue, 18 May 2021 04:21:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYw2EK79MgqAPLAbLzjftS6TkWfZ0fhoYdNvMsFrg6HXGWeBMPh7uIluI9CKKQQejAnKGJ
X-Received: by 2002:a67:e91a:: with SMTP id c26mr5869974vso.19.1621336886279;
        Tue, 18 May 2021 04:21:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621336886; cv=none;
        d=google.com; s=arc-20160816;
        b=EMzVbfKzSogrCFhYp4PgipPsMrzq1z7Mx8nyO6QnxlOP7OmUYDB/bX0lgb+Hpw96Fv
         tSyljbqddPu3O+/piOm5IZVNPkVsoogWaFSV6AT4wfLFvKq9NjPRO/3ZieJz4Xy9ghAe
         iPIiuOTs8m07vmtrivfNqnrSi9z4sdeeET/RRuzSVfBdnnerMRTLkNjhMmAzO+1ckFjr
         zkfVtPQ8WPtAT450+wqKWLugl5BBLkf37N1myo9FERgIqXc/URl3VZYg41LpDC/vfY9q
         YRd2psgFhm7gm4eGQV2Myosn6o/hCQUX3atzVV0KXRwfHDonsPTewYAKF4bchBIVC+gG
         V9Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uu9i0a/38AEEDUVbTIUBlUl8u+zu5P7q5jVqaw0Vi40=;
        b=eJeuweD+ByarNyRhCx8aVlI45p7rqQW0iLviVXQArnBGDLv39zYRrE2XAGp3Q157SC
         ICVNCrqXdu7chRNTpeXHkB7LTSMsQkVP+E/k3PX+oQ9TwyuWD6VkBteVWgGn4X9DKBB/
         ZTaoHu4TVni64LHEqzZNd2K5F0SeavJbyY8I+7wk0Qe1L5WkrHRERkHBn5gb7PeYg7Ip
         CIhEFaaIAIcX+dnnHu9T1SB/5HFlwt7NrsIWwWWBsY/8VcjWZCm4t2xz0F/PKxVanOFn
         Gt5itf7Ir5qTyfTVGJ/GZaeogX2jw5g7E71TExvaUrn6vnUtiTgWW0JuCqCQ2ClpNRXM
         flDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="I7WcCv/I";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18si5009704vsi.157.2021.05.18.04.21.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 04:21:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="I7WcCv/I";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lixmv-0002Vn-Ki
	for alex.bennee@linaro.org; Tue, 18 May 2021 07:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lixmc-0002Ul-L4
 for qemu-arm@nongnu.org; Tue, 18 May 2021 07:21:06 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:33458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lixmZ-000096-O2
 for qemu-arm@nongnu.org; Tue, 18 May 2021 07:21:06 -0400
Received: by mail-ed1-x532.google.com with SMTP id b17so10697039ede.0
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 04:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uu9i0a/38AEEDUVbTIUBlUl8u+zu5P7q5jVqaw0Vi40=;
 b=I7WcCv/IBHlKSEVBgDKrRGnnvVJpwOW2m2zPiEYycRYM25gR3b6LClpvJnGlT32Y/5
 sS+F0zbSyZN+veg9VnwiXPCYleeWcvvsIFBdGrDR9aWKe2d7kIGUkWzyxEk82DRU5xVT
 yLm8dBbx+gvLjy1/gj0HXUME0cXowGD3FDe/gk1A35pvNRMy6U4YJznkWmAGBLIq5jro
 77bdMCF/jaPt1iGrf7x4e9b+/wOKhg+tBxZdKi4UkfFeUsSq2q1dew2M6NY7pZBFjVyc
 WfqGj3ybKAaX5TLyjE2N0rF8S8xV19RbYUbV4+40mpKajA5bMrOxT0XRgIgNiporx9d7
 UW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uu9i0a/38AEEDUVbTIUBlUl8u+zu5P7q5jVqaw0Vi40=;
 b=hdwYUh/vMz4l7o4XCsr+tyjYQT4c0kep2sZDgROyGa5a+qxAVHTb3rPYbXWmeGgSwj
 tKKUVEVC9sKue6fji80hYSNMt5VCZO4fI464ILhq1cIvKRnEXdPbPtVzwF6mNAXe5Tdy
 W/11EaBpq8OnCkDSwXFLf8NhRj/9GkxNh41H7c94UIpNzKIZoNEyiY7tVWlVXxZKlX8y
 vFblsPZF1236bV/FS7ws5aXPpvRnDJuQkskdSKCw2YG4I7jR4Eo9x95Y/vlOVD8ujmPY
 Zht/NnAu8SaJzW0Xwxd6q2U68GIKj1TYv6tqLxqzXD/V926i8k+dfdNEOIN490Z00cpc
 PV2A==
X-Gm-Message-State: AOAM532liHdbD/tJGRlNS3JKRsl8998ZFWJl6dCmRwPKUzTliptGZSit
 Lsrqve8kP5i/+ryH4V/OmYUPp9dHzKNuvUbM9wKp0A==
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr6274177edd.251.1621336859118; 
 Tue, 18 May 2021 04:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-6-richard.henderson@linaro.org>
In-Reply-To: <20210416235928.1631788-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 12:20:42 +0100
Message-ID: <CAFEAcA9_gDgL=QJASxS8ysDbFaNXYbMXAqg7X4jkYyM_5JTo2w@mail.gmail.com>
Subject: Re: [PATCH v1 05/11] fpu: Add float_round_to_odd_inf
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KwTn4J+LWbry

On Sat, 17 Apr 2021 at 01:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For Arm BFDOT and BFMMLA, we need a version of round-to-odd
> that overflows to infinity, instead of the max normal number.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/fpu/softfloat-types.h | 4 +++-
>  fpu/softfloat.c               | 8 ++++++--
>  2 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
> index 8a3f20fae9..3b757c3d6a 100644
> --- a/include/fpu/softfloat-types.h
> +++ b/include/fpu/softfloat-types.h
> @@ -134,8 +134,10 @@ typedef enum __attribute__((__packed__)) {
>      float_round_up           = 2,
>      float_round_to_zero      = 3,
>      float_round_ties_away    = 4,
> -    /* Not an IEEE rounding mode: round to the closest odd mantissa value */
> +    /* Not an IEEE rounding mode: round to closest odd, overflow to max */
>      float_round_to_odd       = 5,
> +    /* Not an IEEE rounding mode: round to closest odd, overflow to inf */
> +    float_round_to_odd_inf   = 6,
>  } FloatRoundMode;
>
>  /*
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index 67cfa0fd82..76097679b0 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -694,13 +694,12 @@ static FloatParts round_canonical(FloatParts p, float_status *s,
>
>      switch (p.cls) {
>      case float_class_normal:
> +        overflow_norm = false;
>          switch (s->float_rounding_mode) {
>          case float_round_nearest_even:
> -            overflow_norm = false;
>              inc = ((frac & roundeven_mask) != frac_lsbm1 ? frac_lsbm1 : 0);
>              break;
>          case float_round_ties_away:
> -            overflow_norm = false;
>              inc = frac_lsbm1;
>              break;
>          case float_round_to_zero:
> @@ -717,6 +716,8 @@ static FloatParts round_canonical(FloatParts p, float_status *s,
>              break;
>          case float_round_to_odd:
>              overflow_norm = true;
> +            /* fall through */
> +        case float_round_to_odd_inf:
>              inc = frac & frac_lsb ? 0 : round_mask;
>              break;
>          default:
> @@ -771,6 +772,7 @@ static FloatParts round_canonical(FloatParts p, float_status *s,
>                             ? frac_lsbm1 : 0);
>                      break;
>                  case float_round_to_odd:
> +                case float_round_to_odd_inf:
>                      inc = frac & frac_lsb ? 0 : round_mask;
>                      break;
>                  default:
> @@ -6860,6 +6862,8 @@ float128 float128_round_to_int(float128 a, float_status *status)
>
>              case float_round_to_zero:
>                  break;
> +            default:
> +                g_assert_not_reached();
>              }
>              return packFloat128( aSign, 0, 0, 0 );
>          }

This code change looks OK as far as it goes, but there are a bunch
of other places in softfloat.c which switch on the float rounding mode.
If this rounding mode is only supported for a particular subset of
operations we should at least document that in the comment.

thanks
-- PMM
