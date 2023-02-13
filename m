Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp380811ejb;
        Mon, 13 Feb 2023 09:08:21 -0800 (PST)
X-Received: by 2002:a05:6a20:12cd:b0:bc:c663:41be with SMTP id v13-20020a056a2012cd00b000bcc66341bemr30412895pzg.30.1676308101195;
        Mon, 13 Feb 2023 09:08:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676308101; cv=none;
        d=google.com; s=arc-20160816;
        b=Lb4P7MBcIYENov46i2kJJ0v3bZwGL7ClzPQWbt/Zcmvka2WVBKowhyRfydGy/4A98O
         E15v1EmAYWZ2e5w8q+KxtoQXAqeDiuyFlZglliUblKpZua2rK+Lj/tsgk1mLVxxBmMW4
         eT7BNGHmfSKBBebIGPcEUuaZG2I1XzzlhU0okZc7Od+WkqMI6tuVFSZ0YblEWzOX2I2O
         vjK9it5jvIto5k0xncMnHpxiMwDWVTb9tUOtPn0L/sntQCDqfX08ig/fEZovY/vqwbOg
         /kpk8ZFDyOgwsJx1dttZqgqPH45KqVdIc3sXzvDM30wG6t7S++EcxF90uN5aflPcynVJ
         G7cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zBgQ2Kv70clb7onBellHSuQSnMxfuFif80PLTHE/VNQ=;
        b=i9CbPeOqEvTBEZLVqj5/+jn7g57Te4WXn0IyTc4o9aXmG49zBgo7+Ij4qC58uPWk1D
         MMX8YU0dxzxIdEQP4LXNbhauHhwPjrR1ea7gcLQDn7oNt8GaI56QjuLgpRrNsvU6D5fy
         BZU5SKsd1rB5A07En6RMfrwevyQCF3X0sXoXlUbOTvVivkPfV8/anh5JaDvEv6h8dCXi
         yHnjGchq3kNdJgmCq+IyXyuNX3Wnet0T76cov5Sco9YAjAWOr/28zxm3fhhA5Ko5ykNM
         SmfJ+v2pN1SeSm2sq6PEJnWYx0197wE0uY+p0LSd35xnQg0ScJgJVSYuGsCwbrZGIHmV
         FnhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZCKsUyVU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l13-20020a63be0d000000b004daabcf4794sor5887204pgf.78.2023.02.13.09.08.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Feb 2023 09:08:21 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZCKsUyVU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1676308101;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zBgQ2Kv70clb7onBellHSuQSnMxfuFif80PLTHE/VNQ=;
        b=ZCKsUyVUONtykARlsZC9DHmdAJQM2zjOr2nFRBmUTRkSzmkvSH/AFxabQBYwwMdHTl
         Jvy/dnThkfG+GIXXN0XON+LzhhBFQBh5Jvka/dhY3dYi31LZpdpoC6njUBgGSR8w+4r1
         d//SNPDu/Ko9X2nYwke+QwHKcbIPhxG5yfBJvdFtfBnT3GDKkNO2QVGT4BjRd8wbw2mh
         AxMI+QMoeXj8Dnl/Si6N2U0fQCZYkZ8oUHEGE8Tj8yZBacAOmFulN48OUMCS4o8ANEk7
         A5JYyunz+EmrdqaPUQmPihhLFsNoGcdW4Twk/IArfm89QF7vUumE1uK1RSjL6j4F3k4N
         CC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676308101;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBgQ2Kv70clb7onBellHSuQSnMxfuFif80PLTHE/VNQ=;
        b=myU3QjUQ1jxQpbXV1DaF17UFUsKahaMCNO88+RhY9TSpSMt5rdkGQ2a5/02TrFuYK0
         4dV9UtfjHXhAWhgUemvI0kEglxXaDouQvCN8LeeaDr2/tfJdTsAnAY+pTNquLlwfB3oX
         79/0GtCSAFBC+0yMmiGU4vmYn8eee3V4erYZeAkjOmZtUDIRWmkgZeTkD4Dj6OGAalX4
         Mi9EuFPNshU7uZUzKJdPZL85D1Yjr8t+0kg/ngVG+ELBpBg6gwYkRxpa9qeU361UHxwI
         TOhu9xCY0QHcix7ixLuZHTFXRAc8YOoGgYUcksXvucjiTTdBiIYhb9kf+O7jVVoAw3ax
         hyNQ==
X-Gm-Message-State: AO0yUKV6Y+M92xxAdVR0ffNmbvQCO+sQ4N4/9jy2xqDBFSnr3cSGpggM
	y4ZBHXWX4QsSPrQMbObLGpRaIGqVeM61Y/U3B8T7T82c
X-Google-Smtp-Source: AK7set9jUoQvPc1yTd2cDigZ2Pt5mQddG3AyzrotGx7NyzVUSNAb0DfT9o3Dl1y4huvUYKF6SIQamt2wNX4M4GOMNmc=
X-Received: by 2002:aa7:9ec5:0:b0:5a8:beb3:d561 with SMTP id
 r5-20020aa79ec5000000b005a8beb3d561mr591920pfq.17.1676308100717; Mon, 13 Feb
 2023 09:08:20 -0800 (PST)
MIME-Version: 1.0
References: <20230202211129.984060-1-aaron@os.amperecomputing.com> <20230202211129.984060-6-aaron@os.amperecomputing.com>
In-Reply-To: <20230202211129.984060-6-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2023 17:08:09 +0000
Message-ID: <CAFEAcA_VM_nCp0rC9PxZ=VT+PpXtuom0Tb6FvtrRMcRC4FArEg@mail.gmail.com>
Subject: Re: [PATCH 5/7] targer/arm: Inform helpers whether a PAC instruction
 is 'combined'
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, Vincent Dehors <vincent.dehors@smile.fr>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: dIOSGXG+ygZc

On Thu, 2 Feb 2023 at 21:12, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> An instruction is a 'combined' Pointer Authentication instruction if it
> does something in addition to PAC - for instance, branching to or
> loading an address from the authenticated pointer. Knowing whether a PAC
> operation is 'combined' is needed to implement the FPACCOMBINE feature
> for ARMv8.3.
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---


> -uint64_t HELPER(autia)(CPUARMState *env, uint64_t x, uint64_t y)
> +static uint64_t pauth_autia(CPUARMState *env, uint64_t x, uint64_t y,
> +                            bool is_combined)
>  {
>      int el = arm_current_el(env);
>      if (!pauth_key_enabled(env, el, SCTLR_EnIA)) {
>          return x;
>      }
>      pauth_check_trap(env, el, GETPC());

You can't move a GETPC() into a sub-function like this : it has
to remain in the top level helper function. If you need the
value in a sub-function, you need to pass it down. This is why
pauth_check_trap() has its 'ra' argument. (See patch 6 review
comment for more explanation.)

> -    return pauth_auth(env, x, y, &env->keys.apia, false, 0);
> +    return pauth_auth(env, x, y, &env->keys.apia, false, 0, is_combined);
>  }

thanks
-- PMM
