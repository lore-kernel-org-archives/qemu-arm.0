Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp423567ejb;
        Fri, 8 Sep 2023 06:28:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdlM3GHIBqBO8RIwPEz6a/tCm3tDcDOo5V2PeS3S1EyLKM66UytjS0Sg/tiYag/nfK+vTQ
X-Received: by 2002:a0c:f049:0:b0:64f:716e:ec0a with SMTP id b9-20020a0cf049000000b0064f716eec0amr4069253qvl.8.1694179691962;
        Fri, 08 Sep 2023 06:28:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694179691; cv=none;
        d=google.com; s=arc-20160816;
        b=evheqlBIM4ryrsPaEHS88D3FTct5yF6MZDfh+g5MY6AOQPsCnFjwbjLB6SQvfasPzH
         TYY9HjD8G26IMQ+BljwsZhbVZEBsdNDAiTsazrRh4A7oSxBxFfMWebB7P2aMzymlw+di
         vEa+aWRXtT85v5LKq27wvwdzjMeDaH6RjJGYRo8oUiWCazLbTDt6fidPJbG+Uinimw3r
         jpLXWCHxz7Jd82MbnXxzFFFfJcUaNwb8gMPLZm8xe8WfLnMg3veBrj3eBDC0/z/ulTjZ
         Ba2LmBUuQJAvdEyyWOKgAPDyxWwWUKXGn8auOcYt6ylyGDEE3WJBSj4TQXg5Ik2fn2LN
         ga9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=oLwjVo8aPSj0C0V/pn0VoLRRNC4xP5+LaC1Z/yxQsmU=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=YUj1YpUrKW08SRAB0aoYuuCEc6SQMNrWT/fyVZegYg7F25tKUUrsEfF7qPVDYa8j7p
         VJgnEdBpOdnqHw5038M5dTYgrJ7+CRNc13S+yi5BKtRe5CXYxsRbOaNEsVH77mmJkfOj
         XaZkFFoxjwttMRkagkIUUIBKEwAsHFac2HilhlBWTo1wpdCi2R0V3joLRjRKBurdLi82
         qhR/valIfCaHuBjgvuUxdhdxxnQNnWcggi52H1l5Akz2ENrg7HxGtEZ3qBRK+kYZayZV
         PF+k5pClojPVAm+tD3Z9s37EEZK0j1PjTXjM9aZh1hwurUbohtvZTVn8pbDo6qHzhcB4
         09jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s7SDuBjd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10-20020a0ce34a000000b0064f9108e360si1076345qvm.535.2023.09.08.06.28.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 06:28:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s7SDuBjd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qebWn-0000tz-Ml; Fri, 08 Sep 2023 09:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qebWm-0000tn-Pu
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 09:28:04 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qebWk-0002C2-Fc
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 09:28:04 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50091b91a83so3369381e87.3
 for <qemu-arm@nongnu.org>; Fri, 08 Sep 2023 06:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694179679; x=1694784479; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oLwjVo8aPSj0C0V/pn0VoLRRNC4xP5+LaC1Z/yxQsmU=;
 b=s7SDuBjdGwYc46hDbQ7PDIo20/wqI7r2HnhLFW7T3DBTCRXAv8vx0f+YSKK5X7KlYR
 XlJdOzaq0oYL0rWTMZahz0wqi+aajrfh189CeeKXBwMuQR3moYkXb8PmZFytFpPKAoMA
 JZVDrW2xpJEYYV/SSwHIbRqXPGwzLKyrEFeu1c09EqfeakBz+yHqrHhKCf99PXwZS17i
 T2qV4QhBtdOHLUJPPhQIMDURgsQnYcDnKlBlF7kmQJ6tXIDB923z5UagiZPjQj/sojWq
 0vdI4NERKfFsCZEjmfJLTW0+algTjHh0zndFe2ebk4S6Sy+t2o/g49EA/K5r0hjKPN4f
 glUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694179679; x=1694784479;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oLwjVo8aPSj0C0V/pn0VoLRRNC4xP5+LaC1Z/yxQsmU=;
 b=WqM20Oi+LQpobyOMuJ5PYDS4qWwht6W4Ly0ciQYr410uknic2sSIVtP/fuPFHZUJgz
 YR7BP95Dxh5OgtM/gF3BDNcTo54GdEz1pSypcA6kf0BLSO9c9gx93U8NMCxalJpz5Kni
 7+W4+yRkMAWDx3R7R1bGAqPjkSSQIPfx7SP4uBv1uqSVUF0MjllGTDL/15044bkEBrRP
 Seavq4OWu6AepQnqZp9jnQIAoeWTMiynYw6oeGKTm7TTg4iuIFR6+/GIsnHLisEkzZzg
 4C45akQndgAG5sOuNCzi4ZEc3rVIhRN120iUrp5n4yM9Yf8Alz01EeKHcaYLA40fw+dH
 qf/w==
X-Gm-Message-State: AOJu0Yz7h/uN7mte9TvWfEFi95gnmB0DURHZAE+Ue++QHFhNOI/tp5Q0
 NLU7qTpciyN2dJxoo8cheAnIDTrjLgVwuDNyy9xbYg==
X-Received: by 2002:a05:6512:3b9e:b0:500:ac3:dd77 with SMTP id
 g30-20020a0565123b9e00b005000ac3dd77mr2162549lfv.10.1694179678953; Fri, 08
 Sep 2023 06:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230831232441.66020-1-richard.henderson@linaro.org>
 <20230831232441.66020-4-richard.henderson@linaro.org>
In-Reply-To: <20230831232441.66020-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Sep 2023 14:27:48 +0100
Message-ID: <CAFEAcA9ZcaHwq+GFT=z2CTw+MLnMxNrz810CzQyTvEznhZbf3A@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] target/arm: Implement HCR_EL2.TIDCP
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x135.google.com
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
X-TUID: UfmBhQjUsQ+W

On Fri, 1 Sept 2023 at 00:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Perform the check for EL2 enabled in the security space and the
> TIDCP bit in an out-of-line helper.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h            |  1 +
>  target/arm/tcg/op_helper.c     | 13 +++++++++++++
>  target/arm/tcg/translate-a64.c | 16 ++++++++++++++--
>  target/arm/tcg/translate.c     | 27 +++++++++++++++++++++++++++
>  4 files changed, 55 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
