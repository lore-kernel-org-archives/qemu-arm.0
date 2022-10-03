Received: by 2002:a8a:84:0:0:0:0:0 with SMTP id s4csp428352ocq;
        Mon, 3 Oct 2022 03:29:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Puy7QKRVIhyZuxHExejkuxFKcNc+2ixhWzIIOleA2Idf2JxScVA6knrFXDZwI+eqRUSOc
X-Received: by 2002:a05:6214:4118:b0:4ac:ae43:4074 with SMTP id kc24-20020a056214411800b004acae434074mr15135289qvb.13.1664792972983;
        Mon, 03 Oct 2022 03:29:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664792972; cv=none;
        d=google.com; s=arc-20160816;
        b=I08Lkj/cBck0nz9ACheQs7J+2BlH/RH4Q/EGe0jgHA35Y/X+BbD4HlN4nfth79cd2v
         fj0nutN5ZhQughegX2b+51KfG2EUypdG8kNAXQ1PeNQC68DS3Lt6YOYp+RBf1G6FdANU
         FGgwTO1wJnWNFjbMvWaBjIprV+nV4xmRaj/VX+M5sY+QVOhI1i/G0c3RlfQ7mVNb6sLU
         SsqeAJaGAGduZTi71jrFAhr18S5EC3tgkYzZy1TwoUReR7RKxcA4J3qNjK5Gss+qS3is
         4JlA0aK+UA7TgJ8r8TuWknp+LeLGV3WMlyJ1m44bu+6HYMzbxB2w+ZkuzZBI3RTo75Hi
         n64A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=iYWPdbX0XJJ/cmLOGry3A7D88+6pMlRTxl6D1mZ+wuM=;
        b=ubNzsb8f6BPVypJls2z0zKxR25TutQsbWQxo1fT/XF9E30NLxHntnvWd4Ogyh3xL2Z
         /L7Wl5yUfK8CFdZkekVFBDBxnFcE70DVkuTvJOmoo0kevm66SvTdg65BuD1Q4wyXpuxj
         xjOw+aMU0GQpAXdXA1e1WFLj9WpkSRpOYyiQrPW+UV7cA4seGq1LY0qQrVZlGVnwuQIt
         Iv1FoNKUUggLhj5F5ddSm1XqDYbE3Tk/PmXtIASJekyX5kQSNibMNh6Bp4n0+zAdVRxH
         uCHndTvsMH80Ule/LBGwpiKKirmh7E9hDgqz629hqorMHknIXrcy9gB+F/8Ju/cV8i26
         Fm5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z1JNLswh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c27-20020a05620a269b00b006cf03b4c696si4248686qkp.257.2022.10.03.03.29.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Oct 2022 03:29:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z1JNLswh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ofIhY-0004Jt-HM
	for alex.bennee@linaro.org; Mon, 03 Oct 2022 06:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofIgx-0004GM-Kq
 for qemu-arm@nongnu.org; Mon, 03 Oct 2022 06:28:55 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:36520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofIgv-0001Ly-0g
 for qemu-arm@nongnu.org; Mon, 03 Oct 2022 06:28:54 -0400
Received: by mail-ed1-x535.google.com with SMTP id e18so13922728edj.3
 for <qemu-arm@nongnu.org>; Mon, 03 Oct 2022 03:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=iYWPdbX0XJJ/cmLOGry3A7D88+6pMlRTxl6D1mZ+wuM=;
 b=Z1JNLswhngiP6nCTJTZJlsudDnhQRdQ19+1Vq7GVMpnY0LQ+OB/FqO/FfsI02DuYoK
 t1gYzXCoomFKB/v967xGL1K3+dBedT7ZqT+Q7b8EO6afN9iV3LBRiVAbJeaR3rJM4gy9
 BI0bYmq3jmme+Ejg6+vfS9/OJO68u/ZhWF6Knd9pHkNofrPU6HYzHXCojLoeN7knthN5
 A88IApBY2RQleRwKqtBKBBI8G1wMpHmF0n/1oz8qsdo7DBghQXzFL9NV8BzxZ2AOVTxM
 I6je3BJpmC/le22ebHh0GJr5zDEYcFO24tRWUtmJzOpl9dwoRBJIfC9JI3ffaG8i9pS/
 zSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=iYWPdbX0XJJ/cmLOGry3A7D88+6pMlRTxl6D1mZ+wuM=;
 b=Qd04iyG1O7biBFgMfqO69YOaGj5TkjJFqc+FGM9gLxfUXoyOaqjf8pKwkVn37KOdFK
 Z8gwQnrMrhp8OMc0aCB7ME7klLre7hxeG2mrzJsjJoSMF+gZa+JUWDkFBUOoM7n/RIsm
 cy95ffpkD5gCV9oDyShD+HFfOjcJcB6TwoPeAYrCKjIDzjaU0nw0kPy/OUzy3AqvPGKX
 0xd9rLjd1CBlV+OXAGdTZAHvSg3XDZpZtsS0Vb19dOAeo8CY7qKi0+mce82G4wmYDEjT
 S+zdz3XXuGDqRih0xPlpLqryV0KQ2/pjOhDbHFbXeAMozLDR3q2uddCzBKhMT2oHZ5ks
 psgQ==
X-Gm-Message-State: ACrzQf0P4dGTnk98KH8XGOGmhYfvfZ+5Rq0Q4SvZYFK03uohTDdJlyvl
 zD6TQ4GEgId/ucq/pLY7ADb+Vc1/3L3FkHC9sC57NA==
X-Received: by 2002:a05:6402:2787:b0:451:d655:9269 with SMTP id
 b7-20020a056402278700b00451d6559269mr18152712ede.375.1664792931593; Mon, 03
 Oct 2022 03:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220930174853.2233633-1-peter.maydell@linaro.org>
 <20220930174853.2233633-2-peter.maydell@linaro.org>
 <3ebee616-2a99-10b5-0902-d41eccbec1f2@linaro.org>
In-Reply-To: <3ebee616-2a99-10b5-0902-d41eccbec1f2@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Oct 2022 11:28:40 +0100
Message-ID: <CAFEAcA9SzEge=PUKJ4gW71gF14NS8aH3JwHwmpVeDXnd18XvFA@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm: Don't allow guest to use unimplemented
 granule sizes
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EOFdSIQVMYRD

On Fri, 30 Sept 2022 at 22:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/30/22 10:48, Peter Maydell wrote:
> > @@ -10289,20 +10289,113 @@ static int aa64_va_parameter_tcma(uint64_t tcr, ARMMMUIdx mmu_idx)
> >       }
> >   }
> >
> > +typedef enum GranuleSize {
> > +    /* Same order as TG0 encoding */
> > +    Gran4K,
> > +    Gran64K,
> > +    Gran16K,
> > +    GranInvalid,
> > +} GranuleSize;
>
> It might be worth using this in ARMVAParameters. Even if you don't do that now, it would
> be worth putting this typedef in internals.h.

I'd assumed you had a reason for using two bools rather than
an enum in ARMVAParameters, so I left that alone :-) But it would
make more sense to consistently use GranuleSize. (I guess for
putting it in internals.h it ought to be named ARMGranSize.)

Putting GranuleSize into ARMVAParameters brings us into the
area of enums in bitfields, where I'm not sure exactly what
the standard says or our supported compilers allow as an
impdef extension.
 GranuleSize gsize : 2;
seems to work, but is it portable? Or should I just put
 GranuleSize gsize;
and accept that that means the ARMVAParameters goes from
4 bytes to 8 bytes in size?

thanks
-- PMM
