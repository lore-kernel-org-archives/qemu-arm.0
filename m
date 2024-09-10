Received: by 2002:a05:7022:6591:b0:89:eff1:5568 with SMTP id bd17csp1236263dlb;
        Tue, 10 Sep 2024 07:20:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJ4TwBrq6Qq2Bmad2UQ+3V+DbmfAwoJSnfBcozvQ/bPG9rs4+B++E6k5nxAl259RwtZixvfpTjB6RVhw==@linaro.org
X-Google-Smtp-Source: AGHT+IGh+9lKHbkpQbXkgwcwbysKwm2Q0g153hV8okMybJYRweNSuoEqKoKJtLXmzXnXfsWjXE2U
X-Received: by 2002:a05:6808:22a2:b0:3e0:4f79:8426 with SMTP id 5614622812f47-3e04f798eebmr1628856b6e.32.1725978024946;
        Tue, 10 Sep 2024 07:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725978024; cv=none;
        d=google.com; s=arc-20240605;
        b=U4atGqgOjykaRxDI+Jjuo2XbeHUYghwbpyD1mjwWYpE05vK0EOB1yTMGp3AXhlc3U9
         Hm0dkMLXJfRZrcj9U2/R+MLDV5qiNWaAVD61AszT05xTZO/c06aYV2ohB5so7RKHIwgI
         pjbu3NgkvcSJpARAXFPC1nTPPYIFfOyu+2Ws4Cq3u/tOB/0IT5KbIPk/wEtmfpWBKH84
         cvQDv06Lut1QZ0bQbWTMEHfWT3uALGJn316TlD3y5LMiUUpY2fUkkQWs1J067IcsQRzd
         m3I53TlJZJCN+0YYBV0AN+2yd63jK3RhjxpksJSfHWmOPVCAqdkDHHHaMQqvB9a/QfBo
         N3Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1FREOUDCx1VLyhPhrv1zXf/ZT0CjpOXI1qZs1mxDi4w=;
        fh=2P/OYZFUs5hZpwVfAErcD7iYN4gs6rWU34SVi3uRgFI=;
        b=GRc6APnCq0E0MWpWZ/diyrTK6at8u2Ph1JN7F4D0ChWTJKQDJmp3mDSZW+35D33P71
         lgys1qhpYV+k+VPRv5V0+e0tVPY9ij28Ra9dx32qu7hqL3O15TXWf3DvrZNuZ7hyvOVI
         6kMJ+WqsDcw6WewSmDWlC7gJ2cqiJw0SCIcgR/Lpswx8h8ydC5lyV6gzl/iP4gjXaCop
         X+evdnP0GN/WsnKCNbzIdGyUxuW7vq2+I8uDY4yGKy1IATVCnbUEmgD0z9s7h7GgmYT6
         +lHOQFxMHPmDv2NO94uUQCPK+C0MEA7OyO0JqccB85MvqFJ18+nGFD1gWGApuiIiSFh9
         Ydxg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jt5vGjDY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-8489ad76fa4si1320023241.157.2024.09.10.07.20.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2024 07:20:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jt5vGjDY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1so1iV-0004ON-1u; Tue, 10 Sep 2024 10:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1so1iT-0004I8-JC
 for qemu-arm@nongnu.org; Tue, 10 Sep 2024 10:19:37 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1so1iR-0008DC-Up
 for qemu-arm@nongnu.org; Tue, 10 Sep 2024 10:19:37 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c3c30e663fso932183a12.1
 for <qemu-arm@nongnu.org>; Tue, 10 Sep 2024 07:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725977974; x=1726582774; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1FREOUDCx1VLyhPhrv1zXf/ZT0CjpOXI1qZs1mxDi4w=;
 b=jt5vGjDYecgBROxTYNJh41S4m/USeT0ALbpGy3ebdWYa+AoVDmW8ZmrSlXOnd8NM/B
 iX8OCHMAyaCF03t2/RauzpE74sqYBqjei9HRzICcsdNwN8aru6pxXnpoceGLNUvK4GZ+
 czh7cHioV1L99cAcuaGcwLfRe8rZOdh02w7hoRN3KhwMQvhFh+V25UvRl8m+OjkNS9Ed
 HUJVPeKAAovLO1ouJc5CB+AJ6IDpNcW5dceP91tj7iVQ/9wVcFBPL/PPRgQenoAUuNSZ
 SvyzEH0mCskN1L63QlwPpB7Zya2NUDTAEvdJViPwYnxsjNNwsHVjmOReS7C/RUQGcP9b
 IQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725977974; x=1726582774;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1FREOUDCx1VLyhPhrv1zXf/ZT0CjpOXI1qZs1mxDi4w=;
 b=DX1yUbWkk5u4k3LcTIJ1+HrAK/vDDBCUbzqKbOBy/1UozkIFgUByXon20BC1kPci6O
 sWn009DyGsPU1KEFO3PwAsYk+hI1CgQvtkIfJI7qxSndtxn1BNXkue9+JD6uP1NW4FIH
 gO7wR0257d4+eyAVHYdYuX/RCWOytAqfyZXYZ0CiVTwhptrevG6kRiaaheFrR1ueNa3T
 vaaiJhHwhHJuz6lcVENDgE9kvlx1QaSoiusPq5q+7X28HmevC/Yu4GWMkARd6TY72Fa7
 e+1uoqvbYydksRWJFXXpBA4BVUB8JIURHd9cZgaDVAwNV1fNOn8TTM8VG8Juof9sH0Bp
 eHug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqXxBrV0YNXWtxQ9AiMhhlXTr28K26hHTHVryqGoA1ozm8rETpBiXw53CEt9G6Jkf0qrIfqLnsTw==@nongnu.org
X-Gm-Message-State: AOJu0YzDZaxJZQu0kiZXcBnEvylWHntSG3BuLfRqeKs605TWmqMQ2NF5
 Jm+ygHQ8nPEYjonsPeebeCjZFrg/We7k779h+XqUlgq0FSPHBPjyMUGxZWs3TNEaRA7DJnyJA3H
 nyOFCMA9GclcTmFlG71iKF5O6K9Um6NjwWfmSYt3b6L+DCeoe
X-Received: by 2002:a05:6402:4312:b0:5c2:18fd:8a27 with SMTP id
 4fb4d7f45d1cf-5c3dc7b8016mr11653356a12.25.1725977974156; Tue, 10 Sep 2024
 07:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240909162240.647173-1-richard.henderson@linaro.org>
 <20240909162240.647173-27-richard.henderson@linaro.org>
In-Reply-To: <20240909162240.647173-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Sep 2024 15:19:23 +0100
Message-ID: <CAFEAcA_L06h8M1fUSs1aoOzvyuF4Qb94bzTYT9Ohkr=kY4Jqvg@mail.gmail.com>
Subject: Re: [PATCH v2 26/29] target/arm: Widen NeonGenNarrowEnvFn return to
 64 bits
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
X-TUID: t6AKRuFZlHYL

On Mon, 9 Sept 2024 at 17:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> While these functions really do return a 32-bit value,
> widening the return type means that we need do less
> marshalling between TCG types.
>
> Remove NeonGenNarrowEnvFn typedef; add NeonGenOne64OpEnvFn.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> --- a/target/arm/tcg/neon_helper.c
> +++ b/target/arm/tcg/neon_helper.c
> @@ -598,13 +598,13 @@ NEON_VOP_ENV(qrdmulh_s32, neon_s32, 1)
>  #undef NEON_FN
>  #undef NEON_QDMULH32
>
> -uint32_t HELPER(neon_narrow_u8)(uint64_t x)
> +uint64_t HELPER(neon_narrow_u8)(uint64_t x)
>  {
>      return (x & 0xffu) | ((x >> 8) & 0xff00u) | ((x >> 16) & 0xff0000u)
>             | ((x >> 24) & 0xff000000u);
>  }

For almost all of these helper functions where we change the return
type, we return the same value we used to return, but zero extended
from 32 to 64 bits.

> -uint32_t HELPER(neon_narrow_sat_s32)(CPUARMState *env, uint64_t x)
> +uint64_t HELPER(neon_narrow_sat_s32)(CPUARMState *env, uint64_t x)
>  {
>      if ((int64_t)x != (int32_t)x) {
>          SET_QC();

But for this one we don't. e.g. if the input is 0xffff0000ffff0000
then the old output was 0x80000000 and the new output is
0xffffffff80000000.

Presumably we're effectively ignoring the high 32 bits in
the caller, but this seems inconsistent.

It might also be helpful to have a comment describing what
the semantics of the return value is for this class of helpers.

I suspect also that coverity may complain about the
    return (uint16_t)low | (high << 16);
in neon_unarrow_sat16, neon_narrow_sat_u16 and neon_narrow_sat_s16,
which have the desired semantics but look suspiciously like
somebody forgot to do the shift of 'high' as a 64-bit shift.
I guess we could write them as
    return deposit32(low, 16, 16, high);
or maybe
    return (uint16_t)low | (uint32_t)(high << 16);
to avoid that.

thanks
-- PMM
