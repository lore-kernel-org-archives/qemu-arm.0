Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3198299lft;
        Thu, 23 Jun 2022 12:31:02 -0700 (PDT)
X-Received: by 2002:a25:a401:0:b0:664:7d19:5fc6 with SMTP id f1-20020a25a401000000b006647d195fc6mr10802457ybi.400.1656012662038;
        Thu, 23 Jun 2022 12:31:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656012662; cv=none;
        d=google.com; s=arc-20160816;
        b=TZ5U7vuY+Kp711xF9ZF+O2OEnbZScuGIiUHYIswNwljHryjfqTEmE8M8Si55SxZm5D
         nOWY5zYAg8tc+Hx5+3YsSypn93HcOljmdkxHkAKa7orBSV19JIJ+E87RabbkOZMfQ16g
         UtUc5Ua3hKPXR7CzdlU6l72fnoDNhteWsTWOSlwej/1w6LjNCEgApsA1MTe8zAdKpj2k
         rfageAGP8TWxB50Q2c9ftzMS4sq9yAqv8Zk+KkaBgZ2lqfxua5EE1OBJ70JzqmMaTclR
         DU75k86BddNHH6vzCK3DiS7pq8fW/q1oPWROVT4YkpVEjCVALELcjuYFz/fncRFECr0B
         u66Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WwePLIT928gsV+QuavVvVXgXAJxXenGkNsUer6Z5uho=;
        b=VwHAkQ9i0K6gAJOdVaE7fCdzLYG+0ERNEL5EAYhV+x57zVt9tdlun2XGUIpGkapOSo
         C6XgKYB3RFdlR69hfIzEEZDzlfapKG6QZvLoM0e3fbsdE1ofYBZoE9F0vc8JVRppLxVg
         u/kO2i8nHD8LZRqkqgjCKIHnuQIcMIQDOjRgpDJjHMAMZCb7xaREuBiHQg9hAcRnkW5c
         utPvlMjmn9QW6BnCwnKlGWbiGHRj/yhHvPZVcMpsZ6yCo0+S6zZg+tb2hJ71OZcjy8nl
         W3Y77H1oJc+5JtOJCh7X+SSiIzXwW9Hf78qtqHhNKn+fMElkOcB+QOhvsM1uKHUJRuUm
         puyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZtfbC0N0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u186-20020a2560c3000000b00664444ed646sor143050ybb.67.2022.06.23.12.31.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Jun 2022 12:31:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZtfbC0N0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WwePLIT928gsV+QuavVvVXgXAJxXenGkNsUer6Z5uho=;
        b=ZtfbC0N0iLgmzbxkqtMF7KoIqtabuklCxTDaZ3FIbHgfys3Aqv/34qMyKT52IPe8Nx
         IZ5ZV2EY38EzdS+q+SHZV7SmN0jhjC79qTD1+s20/aVtv5I1i+o9YLWd9O07XuqHCz/l
         vAM0cfIGj1i+lAl2Gv2TVbwXU1oTtYWKw7HCA8tCPlRN2nqphU719BfEYo6S6SrtQngm
         c8jbbSAMBtvDObsyqxoPvI5ITbFDyGAyu+YUGI1rrMBYaOsMt8/6Sq/KIQ6XaZr5G13n
         PbZkyYEmzw7KRlAEe4h4mSjeC5cRNh8c+5PEbik1Pd7VKbipbCPk58KnvyNP6sFjEDUW
         Dkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WwePLIT928gsV+QuavVvVXgXAJxXenGkNsUer6Z5uho=;
        b=uCbIlBf8gqOKltIR7piX7dpK8+SqENBYLP3rpb4AhhXq2d1RHrCxw2duCixxyGZE+e
         3OU3zr42S5adyul9wfvx/dqb4Shysq6bCEwyzaT/91A/R0egALqzwWtuawkwxa9AjFNK
         SJtd6S+4RlHxpy0eu4kX/hiAhlflbFf7bZ1RDIYdutDn2vHdjkehGihxX/eFlLglsQAT
         Mz5Jfgq6+OylQjuSqpq0Tc5Gl1zQ2oO0ucRB0ntZXMYR/MFnFlyXgCmaCJTwCCponeDj
         4R1TKyGyLOqN3iDF1JkVi47gtg7A60HTBr3y+lpmZrQx+lCMI8G8Qh9MXiXNOaCG5139
         33ig==
X-Gm-Message-State: AJIora+0up3gFNC4WwU80DyIB5RlkZ7FY4b0yxS/0M0DUSkOU37ZuYBh
	XdpmRFlugJgW511HNxh2yylh23+eWccwsdHFCHwEfYev
X-Google-Smtp-Source: AGRyM1vbAdW3v05gSqkTHU2bd9L7ijpqHW0yCkgvW93U1HiGHLkGhoI3cnSldNjkXhfpjuPls32XkwnsNRDvX1G1N2I=
X-Received: by 2002:a5b:dd2:0:b0:668:fc4a:9403 with SMTP id
 t18-20020a5b0dd2000000b00668fc4a9403mr11147925ybr.39.1656012661642; Thu, 23
 Jun 2022 12:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220623164051.506316-1-thuth@redhat.com>
In-Reply-To: <20220623164051.506316-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2022 20:30:24 +0100
Message-ID: <CAFEAcA-k73D5fPfp5XnD2gtRO0pTXpAt_xTG51dGnzji+=NGqA@mail.gmail.com>
Subject: Re: [RFC PATCH] include/qemu/host-utils: Remove the *_overflow wrappers
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 58igXbfT11Bx

On Thu, 23 Jun 2022 at 17:41, Thomas Huth <thuth@redhat.com> wrote:
>
> According to commit cec07c0b612975 these wrappers were required
> for GCC < 5.0 and Clang < 3.8. We don't support such old compilers
> at all anymore, so we can remove the wrappers now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Not sure whether it's nicer to remove these to get rid of some lines
>  of code, or whether it's nicer to keep them for the more explicit names...
>
>  include/qemu/host-utils.h    | 235 +----------------------------------
>  accel/tcg/tcg-runtime-gvec.c |  16 +--
>  fpu/softfloat.c              |  10 +-
>  libdecnumber/decNumber.c     |   4 +-
>  target/arm/mve_helper.c      |  18 +--
>  5 files changed, 29 insertions(+), 254 deletions(-)
>
> diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
> index bc743f5e32..6224815629 100644
> --- a/include/qemu/host-utils.h
> +++ b/include/qemu/host-utils.h
> @@ -366,231 +366,6 @@ static inline uint64_t uabs64(int64_t v)
>      return v < 0 ? -v : v;
>  }
>
> -/**
> - * sadd32_overflow - addition with overflow indication
> - * @x, @y: addends
> - * @ret: Output for sum
> - *
> - * Computes *@ret = @x + @y, and returns true if and only if that
> - * value has been truncated.
> - */
> -static inline bool sadd32_overflow(int32_t x, int32_t y, int32_t *ret)
> -{
> -#if __has_builtin(__builtin_add_overflow) || __GNUC__ >= 5
> -    return __builtin_add_overflow(x, y, ret);
> -#else
> -    *ret = x + y;
> -    return ((*ret ^ x) & ~(x ^ y)) < 0;
> -#endif
> -}

I think I'd prefer to keep the wrapper functions and just delete
the fallback ifdeffery, but I guess I don't feel really strongly
about it. Richard, do you have an opinion?

-- PMM
