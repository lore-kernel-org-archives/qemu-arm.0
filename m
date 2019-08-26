Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4303773wrs;
        Mon, 26 Aug 2019 12:28:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxB02ewdjL2czT9+AJ3F7FC/BGvC7N1NcQSRSEdwzBaFqOYhgTfjcVx+ZlzRlfVFyyQrBXt
X-Received: by 2002:aa7:c454:: with SMTP id n20mr20360022edr.289.1566847694766;
        Mon, 26 Aug 2019 12:28:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566847694; cv=none;
        d=google.com; s=arc-20160816;
        b=s0v20IkgVFpu3wtUAu6em2m0tEhARbfjnHQ3ahvYZCU7nzpR7LjthIMlaNjhR+55Xd
         I74MEsFr2GJps1tyJUf1h23SVusiKkLO2wheQav4zGvv4NyW0j3RJGGnwtWL0lIhLJJB
         ZeS3ozDhsKMemHS9lqPb5F4gd5ydLc84k02ExMHhl6I1XMfoRUcPxs2v/q59D+E7UKkN
         Swohmo1Zde+1/vGrfq/CxrXq2fgmQuCRsX2ibO/G5P7sSU15RBjxUb8aW4IV+vjF2TUy
         JfL4iaNX75phkGLYHxQDXel9UoBiZpojvkQCxTAAjrOoRcsSR8hhAqeOmjrJfOuf7VDP
         0O8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0zxdry1BkfHAqau/H/9feepTNjFxh/DYdr86EaL4hL4=;
        b=wzjyoVGcGv16siRWfZXgtILbV+li4U1aFo6bsMl9MHFp82vm74JfOoyAe9E+Du9eUr
         BPPqEnvy4MufUvsgbLDkOgwRL1J2mSq71eUhtnXYsmiW7h/sVd6q1ehAuXoM31UaZ8mv
         G8ZcSs216k/cHc52K64h9AJg/L7FHY06dI6oGh3OhPHbpHAcabB+zmowXbLk5l9on/EQ
         vHA4X2LPneIxkfIuUMH/HD2DtwUeCH3NsObWwuqKATfE9BLrTiTTC/raCmaEgLlaeuEI
         pJ1l6oxxJF6Yaa5lRkoZZmgItPj4Ke3KSVcYet3qi1rcl1oAQhpxWowlANa6jdE4cq7P
         LBqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wYLgeuOg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f17si7684649eda.242.2019.08.26.12.28.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2019 12:28:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wYLgeuOg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2Kez-0004oc-DN
	for alex.bennee@linaro.org; Mon, 26 Aug 2019 15:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39586)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2KcR-0001YQ-Ea
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 15:25:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2KcQ-00012J-51
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 15:25:35 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:32951)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2KcQ-0000yD-0X
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 15:25:34 -0400
Received: by mail-oi1-x244.google.com with SMTP id l2so13042346oil.0
 for <qemu-arm@nongnu.org>; Mon, 26 Aug 2019 12:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0zxdry1BkfHAqau/H/9feepTNjFxh/DYdr86EaL4hL4=;
 b=wYLgeuOgNwUBEs80yhYdzEJlrAL0AFCvpWHnH440DavpwdpKxO7IKTJIlYaW6MV2Co
 pz+wm1y58HJ8mgKirsG1PiRNMYEu/9Dx7HhrE+ucAPJoGg+eaM2mks8eq9bWxs1ybhAf
 sZNwUInTwIQvk9CZIveMxovLHQN7i7518R9fCUoIa+6KUAZYrhmbf4HXiv0SoTPptG6K
 JtK1NHyqT+qffiXZXZSyWoAztAoEvhWlybY1USgg8s2BxJml8r/Pp+krbOENKpNeNvjA
 mYo08V/eYQFhkSt9h16Ucn7m9D1UXmfYfd46GvOVRPrNcGhlv0B38Wd8IbvfNBEFIiLs
 eKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0zxdry1BkfHAqau/H/9feepTNjFxh/DYdr86EaL4hL4=;
 b=X6WiL6PiW/wjo3TzrN6Weo5ZooNnZWqH0zJdBfP4988J968O51hsNW1uFP9kqFK4k5
 w4z5XiGoEuSFHHU5dj4RUIqSssI2rE6AI6fQpRjhWsPae5GxdDgBxbLKkrHuuCx+bBBz
 rqUMns3x0brOsHv7FNP5NL2ElfLhD+zIU2o8bjVZlmswRvSk9YL0ySMdnSV+Pzc0sqwO
 o59+zOkVb4QRGyxOf4qtmeh8s0l+tywZB0tMv8lzc7aa7fUe+fSSEwqStcQK8PHl/EKI
 VRMRZKgEeS7FgBY0pDuAJMTIVGStWdPGLNBCpfN9iL6ire+zGbnuXgW8hlY6HMN3ZBOK
 PkWQ==
X-Gm-Message-State: APjAAAUIIEUNG4HZNJ80DEKfh7z36+J9Z0reGtzeAR/JC5lmFYvYOocC
 D3BvBhdnstniQ4XB7a/W9JqwQJTm6zJwV9xIX7zjRg==
X-Received: by 2002:a54:4718:: with SMTP id k24mr13106294oik.146.1566847532685; 
 Mon, 26 Aug 2019 12:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-57-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-57-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Aug 2019 20:25:21 +0100
Message-ID: <CAFEAcA-9JAhPA44_PuoOgNFfhHZHTSxkCLbizN00GtaDKt=sxQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH v2 56/68] target/arm: Convert T16,
 Change processor state
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
X-TUID: 7PneLj4eUCeI

On Mon, 19 Aug 2019 at 22:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 85 ++++++++++++++++++++----------------------
>  target/arm/t16.decode  | 12 ++++++
>  2 files changed, 52 insertions(+), 45 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 414c562fb3..368f0ab147 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -7474,6 +7474,11 @@ static int negate(DisasContext *s, int x)
>      return -x;
>  }
>
> +static int plus_2(DisasContext *s, int x)
> +{
> +    return x + 2;
> +}
> +
>  static int times_2(DisasContext *s, int x)
>  {
>      return x * 2;
> @@ -10152,6 +10157,9 @@ static bool trans_CPS(DisasContext *s, arg_CPS *a)
>  {
>      uint32_t mask, val;
>
> +    if (ENABLE_ARCH_6 && arm_dc_feature(s, ARM_FEATURE_M)) {
> +        return false;
> +    }

I don't think this condition is quite right. We want to
do two things:
 (1) this is the A/R-profile CPS, so it shouldn't
be decoded for any ARM_FEATURE_M CPU
 (2) for A/R-profile, all the CPS instructions are v6-or-better

(All M-profile CPUs are at v6-or-better, which is why the
legacy decoder gets away with doing its ARCH(6) check
up front rather than only in the A/R-profile arm of its
if statement.)

>      if (IS_USER(s)) {>          /* Implemented as NOP in user mode.  */
>          return true;
> @@ -10182,6 +10190,36 @@ static bool trans_CPS(DisasContext *s, arg_CPS *a)
>      return true;
>  }
>
> +static bool trans_CPS_v6m(DisasContext *s, arg_CPS_v6m *a)
> +{
> +    TCGv_i32 tmp, addr;
> +
> +    if (!(ENABLE_ARCH_6 && arm_dc_feature(s, ARM_FEATURE_M))) {
> +        return false;
> +    }

Similarly, this one need not check ENABLE_ARCH_6.
That is, this is the generic M-profile CPS, it's
not specific to v6M, and FEATURE_M always implies
ARCH_6 anyway. Usually we name M-profile specific
functions _v7m, not _v6m, for mostly historical
reasons relating to our having implemented v7m first,
so maybe we should follow that here. I have made
a bit of an inconsistent hash of this with the v8M
support, where sometimes I use _v8m because the
function is only in v8M and not v7M, and sometimes
_v7m because it's an M-profile function even if it
happens that it only kicks in or is called for
v8M CPUs. But we do not curretly have any functions
with a _v6m suffix so we should probably go with _v7m here.

> +    if (IS_USER(s)) {
> +        /* Implemented as NOP in user mode.  */
> +        return true;
> +    }
> +
> +    tmp = tcg_const_i32(a->im);
> +    /* FAULTMASK */
> +    if (a->F) {
> +        addr = tcg_const_i32(19);
> +        gen_helper_v7m_msr(cpu_env, addr, tmp);
> +        tcg_temp_free_i32(addr);
> +    }
> +    /* PRIMASK */
> +    if (a->I) {
> +        addr = tcg_const_i32(16);
> +        gen_helper_v7m_msr(cpu_env, addr, tmp);
> +        tcg_temp_free_i32(addr);
> +    }
> +    tcg_temp_free_i32(tmp);
> +    gen_lookup_tb(s);
> +    return true;
> +}

thanks
-- PMM
