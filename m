Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp361521lfm;
        Tue, 18 May 2021 05:23:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNPrJlxjML7ITNiec7seJOsk5jEHfstlc5nypUYelXVsK9w+Psf4YQe3K/9aAFYJHdpDpy
X-Received: by 2002:a67:fe54:: with SMTP id m20mr6139715vsr.37.1621340584042;
        Tue, 18 May 2021 05:23:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621340584; cv=none;
        d=google.com; s=arc-20160816;
        b=aem0QzjnFLknTgHW1BQ8ncwmF9eVMR5xeXcRf7bkCw52UjDe9iE3R7gAg0YIb1xAYg
         JwKFT9QxAaSWWGsGNvOvm2oGU6TsSvhpLSvxPVO2Yu/QjMdjHtFlixMD7J/+vSNIuEpG
         r6Fp2gx/CZMgoCuaDN4nFMIMDw5FZ9vEr/Nf1j9goPCsSI7dcas7wAHvgZgdLuTM8lCI
         VsBIJm+p93kbILWL89+ZlgsinPr4/dkC/KXA2PVSVUc3SranVLHUIN1IhaxFNV3F8B5S
         Mtn/LDiXvBrSi/uInQ41pjO+jtVmiIZ+rEwgrvaWWVVr81ahylWRGAEzEIP+bfWZI/+l
         4c1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RRiX8c+8Oblbd5EcQiUjJ5u34Sy+NqJSfyKAwhrntws=;
        b=yH2aGSPwq9ZLd5or3/o360HywNNnxGbF5UzstMfww4sXwyfY1xKCIGRWCzdhYKi05j
         XyPkTFXma/lU65/t+p/O+YLafmGa+586L3uEW5U+CZwBFuDfTbqWYzcKXPBuh9yZx5GR
         c7YjTd+LVIjh1D+acjM33LYi3XQ2l/kpb6jpvt7RdvDSlEVwJNC+3VEIKwHiI/215zRG
         bQIdjTY7rA1bvlC2JZF8XIl2ohmG+jcT8xCYkwvrcN+49OzW0F63Y4ncafs6OxULJP4f
         2vOnP/XzP9UBJ7AniZ/Dh0w/kKyQ6JZg0IoYQGtfHjXWfnIHc6gkolPiOLmBgE/0vca1
         RGwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NE1KhUea;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n21si8666119vkl.35.2021.05.18.05.23.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 05:23:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NE1KhUea;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liykZ-0006aj-Az
	for alex.bennee@linaro.org; Tue, 18 May 2021 08:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liydO-0002T0-5d
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:15:42 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:47026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liydG-0006xn-0f
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:15:36 -0400
Received: by mail-ed1-x532.google.com with SMTP id r11so10786290edt.13
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 05:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RRiX8c+8Oblbd5EcQiUjJ5u34Sy+NqJSfyKAwhrntws=;
 b=NE1KhUeaw9V0J4Dl7eI/msi3kwounv8XL5UQ6SPPYanSozi0NRgEeT+cXsrFvtVEAR
 Z2kpdI2lP7GqDohC3gvCI6Ybw/Ifl93Oms1XiRDmWlrQpWuES5sq/kpqUSbwMEoMlV1T
 LhlEuwMRmAk/EyJCcH8PfPKHOHfyhQpgx+Y7Pvp/vq7WjEKG65hHtS192/0wq7yFMwo0
 xUmh1rREcxUXhSjJuF09zG+AghaOddiZVl2+UijRC5wti+054IbaIE0wZMg7JsKTDAYV
 zNNGaM5NHAD1hJj2XKbOSEhj/ILJvJpEnmzlMrhu5ahMMI0xwDPPXHmqfvl7xcaw7Ybe
 nKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RRiX8c+8Oblbd5EcQiUjJ5u34Sy+NqJSfyKAwhrntws=;
 b=hQXYwroox6VTCtU7YTOP8qEUBsTU869I35zMOkaL0VsHrjat8q4ajXs0DAHuUEhdBG
 zV4XFSp2MGg1NSZMl47B5I5qpfjNFtbXKLCnchjHyJHOJt17wqzSkRraHZYpETjZykzL
 4OkGvzkf5DHoxl3ksSszervSfG0Q2yAbUI9bu//hFUKcXW+RFGazVB+v1wClQgpA0ZD/
 5tmbWrZf88MJBSU6tl05GYQO188pbTYdhxzAHjBOjF80EHWVFLQcGm+ATCs7nBcSbMty
 UfRLHypf83hNZddTZ6YTJ9KBAG29pWM3Zfm7noduV/7cpNP6HixEUBiMavInpV06KKhw
 dJVg==
X-Gm-Message-State: AOAM533/aY1JT/2wftZQWZVvuYOxuqWJAnSbtC1TgP4ys4dmwas+cy2E
 OyK9L4dt6YDdRqN9Rd5S1D+JxkiaXQNpuPqZwGBEvA==
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr6603496edt.36.1621340127713; 
 Tue, 18 May 2021 05:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-7-richard.henderson@linaro.org>
In-Reply-To: <20210416235928.1631788-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 13:15:11 +0100
Message-ID: <CAFEAcA8xEJrECb9+nb_8Xn+ZHigJPQKP6pQgp=PqJsqT4tyrmg@mail.gmail.com>
Subject: Re: [PATCH v1 06/11] target/arm: Implement bfloat16 dot product
 (vector)
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: abW1rnKqUhzv

On Sat, 17 Apr 2021 at 01:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is BFDOT for both AArch64 AdvSIMD and SVE,
> and VDOT.BF16 for AArch32 NEON.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> @@ -12326,6 +12336,16 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
>          }
>          return;
>
> +    case 0xf: /* BFDOT */
> +        switch (size) {
> +        case 1:
> +            gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, 0, gen_helper_gvec_bfdot);
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
> +        return;

The switch on size here seems unnecessary to me given we've already
decoded size earlier in the function.

> +
>      default:
>          g_assert_not_reached();
>      }
> diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
> index 8cc53892d6..aed8a565e0 100644
> --- a/target/arm/translate-neon.c.inc
> +++ b/target/arm/translate-neon.c.inc
> @@ -287,6 +287,15 @@ static bool trans_VUSDOT(DisasContext *s, arg_VUSDOT *a)
>                          gen_helper_gvec_usdot_b);
>  }
>
> +static bool trans_VDOT_b16(DisasContext *s, arg_VDOT_b16 *a)
> +{
> +    if (!dc_isar_feature(aa32_bf16, s)) {
> +        return false;
> +    }

Again, not sure if we need a FEATURE_NEON check ?


> +    return do_neon_ddda(s, a->q * 7, a->vd, a->vn, a->vm, 0,
> +                        gen_helper_gvec_bfdot);
> +}
> +
>  static bool trans_VFML(DisasContext *s, arg_VFML *a)
>  {
>      int opr_sz;

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
