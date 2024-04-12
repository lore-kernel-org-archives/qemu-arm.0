Received: by 2002:a17:906:4a51:b0:a52:fc6:5c40 with SMTP id a17csp503128ejv;
        Fri, 12 Apr 2024 04:37:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVxk57hakGFiuJD4dMhKJs751C6bFo1EoyMCJ0AlZh+ZayOJe4+udL4OzCMGnS9cfqKnClbWfMh2FIelTo4PYF7KDNx85a/
X-Google-Smtp-Source: AGHT+IE4AYoCUZ9hH6cz5xIee21azYLttn1t953sUdnL9HNl+NjFTqWkfeVmjyquP+19pyB3NJAM
X-Received: by 2002:a0c:c303:0:b0:69b:5db8:112 with SMTP id f3-20020a0cc303000000b0069b5db80112mr617336qvi.17.1712921820159;
        Fri, 12 Apr 2024 04:37:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712921820; cv=none;
        d=google.com; s=arc-20160816;
        b=0dWj+QxOMOX1zuZk5ISs07U9Jlc8h+6MQtZXCyUlQV8840Hz2fHz7O6VVlf0a3X2jN
         HayILxeB+bINhOL7WKbgpSkDFZ+l2gC4Jln/II+DhQ7MdzNruHN0++pjTHo0UB5H6+2e
         AAw8OnSUZWkPROZ29zj4sqYgzgJHfUV1UvWELOWrXaXs7UPJrZd4QIDmN7AV3Zb8ZTRJ
         p+7A8GLSZO36VO6Yt2VLkc5QoETSVRdWOAdQIYk8INrTeeV11KI8jT0my3lYFrY+EvDf
         zdkmRgu33r3ovk/tuYEsVBRviKyEUh4CjFOmilTw4cI92U5vDKl+EG6FpdvQeB7j+k1s
         lPGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=xlMSl6AZxnSBBoc0mH7VbIptvRJGyRHmkjbLnzCBIa8=;
        fh=URim2PeQnZ4LvID5rdBNUOZB58WuU9cNamev4pCKuNQ=;
        b=TfbZngN4JVIx9lTJ7LFbgoafrN96ob/K2YlJw4zXZMHG4p7jWN17/jz8OjzcII4EfF
         tNg7OpcNngJamDx97wh8X2q1jQpjFCxodUHd7clyB+A7B0ouqEfDXw7QKMPDZZbF11Ui
         kJ6gM+hMYrSl5GO5krEkvWpivyXkIjPfjfYikyreSnkE1Jmn/0PYcLcnnuVemv1gbiGt
         5enxhL/Bk0ApgRpTGYWvXWEEdKrk6yVUz7eylXYRkNNm1jPT1bZZCzbioMvEGSWdTpQ1
         nK1kgzJpwDq0LDVsCc8hS6B1BsDVDR9Xop+2mkx+7XnvwL+NZ+6oAN+JJXQSk7ePw4fh
         ZafA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EYb1HF4A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g13-20020a0cd7cd000000b0069b2a1128ffsi3311296qvj.590.2024.04.12.04.36.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Apr 2024 04:37:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EYb1HF4A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rvFDA-0001jK-9e; Fri, 12 Apr 2024 07:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rvFD8-0001iK-BE
 for qemu-arm@nongnu.org; Fri, 12 Apr 2024 07:36:50 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rvFD6-0002aj-MG
 for qemu-arm@nongnu.org; Fri, 12 Apr 2024 07:36:50 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56e346224bdso713691a12.1
 for <qemu-arm@nongnu.org>; Fri, 12 Apr 2024 04:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712921806; x=1713526606; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xlMSl6AZxnSBBoc0mH7VbIptvRJGyRHmkjbLnzCBIa8=;
 b=EYb1HF4Aev5dHJG6evPa+DTfPRjjg+eac4fcU9XRC/YFBnRXU1KBe5ctT9uZmraGD0
 Zxc9CsFop6QscdL4LKVKSXNNr/Dny42b26ZyKZPPqQBKvTLi9nq6PkBxde2yMd2HscAE
 Cl4AH9Y7yOR600iZjbTO0Xr/iQGfPmN02MsnHpsunQ4eQQooCz4RHkhBZavtPezpCJPL
 l2ZDSofrwesJeN4+0+jojLmHjU9P/EKYpz5xKR6RJKVcSKsbfXgenLYT3mHKB6yho/6g
 pGxSd3xYwfF8OG/4l+2np2Dj4PfKL47q18TA8S6V1zlK67lYYMiMb1Yr7Nf8oFUw/XCe
 WH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712921806; x=1713526606;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xlMSl6AZxnSBBoc0mH7VbIptvRJGyRHmkjbLnzCBIa8=;
 b=EDNvr2jPu+24I1fyXGjtg8duta+wCHjwjVwMGJSaEcV14F9ONImWdPTBR3kujgFYKC
 k59JWl4iFlR4hE59Uo4khlATYNlDfrUdJMLWBpSWMvyC69pgEML1+UOY4ByZDolOK1UE
 3YhC2lRhawfsPTmFKUWSZwwpbHon979pXk4U0v/YDvb9YYYatQU1x1ZOgUof5Eal9aUS
 PUNtvxvWuzfY1uBV2hadaVLLw++y49hXNWlH+LxQy6LkWPoxXMpmuuv0F1XL2SvdcHU6
 amxeWux0hh0pwiYl5wOCSz7TrCqDX9FxLbpG+rINmtRc3Xpi4KUzaxuRMcIO62aaC7zW
 pKew==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/SDQxtEmPAzaB8YTJzlRLRi2395DvBI6ugStBj27GhG79VnOFlKPq3ua72Ci+PvYovfYtdyLppzFFWT/DOx3jV3fo
X-Gm-Message-State: AOJu0Yxr14hr6P6Oxb7P5Nw0yMz6lG/e4aw6yJyqIHsIUMy8SnXZ4Ca5
 lbiVSdhzhwmy4CeHCPmHxqA0vRZVf/4xgYnXb+la7pn+16A+u81k9vqkSzIHd4i6MqUdVN5k58p
 GAmRz+NxPFzx5PzZXUXcrM4StpYEZEOtVeanrsQ==
X-Received: by 2002:a50:9e84:0:b0:56d:f979:8d82 with SMTP id
 a4-20020a509e84000000b0056df9798d82mr1586037edf.25.1712921806372; Fri, 12 Apr
 2024 04:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-18-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Apr 2024 12:36:35 +0100
Message-ID: <CAFEAcA8pQ9dZXh1sghqGmuVRubFkn2HQpRnzDSGQpkUSKGg+jA@mail.gmail.com>
Subject: Re: [PATCH v3 17/51] target/arm: Add cpu properties for SME
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aqyrmYm1gH5T

On Mon, 20 Jun 2022 at 19:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mirror the properties for SVE.  The main difference is
> that any arbitrary set of powers of 2 may be supported,
> and not the stricter constraints that apply to SVE.

> +SME CPU Property Examples
> +-------------------------
> +
> +  1) Disable SME::
> +
> +     $ qemu-system-aarch64 -M virt -cpu max,sme=off
> +
> +  2) Implicitly enable all vector lengths for the ``max`` CPU type::
> +
> +     $ qemu-system-aarch64 -M virt -cpu max
> +
> +  3) Only enable the 256-bit vector length::
> +
> +     $ qemu-system-aarch64 -M virt -cpu max,sme256=on
> +
> +  3) Enable the 256-bit and 1024-bit vector lengths::
> +
> +     $ qemu-system-aarch64 -M virt -cpu max,sme256=on,sme1024=on
> +
> +  4) Disable the 512-bit vector length.  This results in all the other
> +     lengths supported by ``max`` defaulting to enabled
> +     (128, 256, 1024 and 2048)::
> +
> +     $ qemu-system-aarch64 -M virt -cpu max,sve512=off
> +

I just noticed this while I was trying to understand the
SME and SVE property documentation -- the example 4 here
is in the SME property examples section, but it's changing
sve512, not sme512. Is that an error, or intentional? (If the
latter, the explanation could be enlarged upon to say that
it's changing behaviour of the SME vector length by adjusting
the SVE vector length.)

Also, the documentation for the SVE properties uses this
same command line, but it describes the effects differently:

# Disable the 512-bit vector length and all larger vector lengths,
# since 512 is a power-of-two. This results in all the smaller,
# uninitialized lengths (128, 256, and 384) defaulting to enabled:
#
# $ qemu-system-aarch64 -M virt -cpu max,sve512=off

In the SME section we say that all other lengths default
to enabled, but in the SVE section we say that the
smaller lengths default to enabled but the longer
lengths are disabled. Is:
 * the SVE part wrong?
 * the SME part wrong?
 * the behaviour deliberately different for SVE and SME
   vector lengths? (If so, we should say so explicitly to
   highlight that to users).

thanks
-- PMM
