Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1466145lfm;
        Thu, 25 Jun 2020 09:34:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwE2AhgPeEODcZLRLa5Qest0ADnj/X4IyznlfsrDZZHytLKfti6HG29O2Ch4K4zyv/X19CI
X-Received: by 2002:a25:a128:: with SMTP id z37mr55380733ybh.218.1593102849997;
        Thu, 25 Jun 2020 09:34:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593102849; cv=none;
        d=google.com; s=arc-20160816;
        b=BZmCXCJb8vYdMf8XlMRbDl4w3OzvLuDFIoc+jMrXP/UXjlz70rq9l/3fYbG6qrktI7
         SVW9pXnYCc/4vGRZ8flbwHjF6OjXIz4pV73Xrjfho3vTjfSMmD/Lx0bxt87yBazSxnAr
         /rOmyhk6qiyB1B/gxgSryVNlR/h6Ok/lwV1LGeqtYPRX7+wCqtyAqmQ8q2QMaqfaXGuo
         iTwIh/HXy7DNHK4C5qz6IpqwzkFcAs/J2GscLuDF4Xke9yB8WlVfZMZXXR2ggJRGbIwl
         poOnhsL/Xhm2cQMKQP0G0pg5I/tI6XTi9t6wW/Q9+tGKu4M2+ApT7I7czfxOQRYSYlwA
         Nbjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SH5uWQM18zzBJk03lB86wlRTLsFrMGNi4yUPo/BbQA0=;
        b=jfGxuBQnjMqzJsSrhTZanLJFu/Eu7CBxp0YLXJqpwTqY7beFRkQC/4Ik/vYBgasGL7
         EdhmYqYOyMiQbCLG7S19WXAMYY064PE3aHYEW0DRkyFvg0zfFV1wbpRGSVRvQfbokxnd
         OGr2BzUJrKwvYI0nyqB3P+75REP5WbZfWxcrrZkFP47/wKU2aWXmgeowM0hnz2EHhwoC
         rnQUaPGUSVrAQq5GQCyQDPyQYR3t157F/FcZc9QPt90jDs4BxfLojAB/OhmH3NePL/Kr
         BeN3UUUShn419Y0kJiLo0esAoUD1e+VfMl9tn6pDxVxRM8g6B2WswJ0U1CVufc66/VWM
         3vVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BNnl7G5p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g4si23339521ybh.219.2020.06.25.09.34.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 09:34:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BNnl7G5p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joUpF-0008A6-CZ
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 12:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joUln-0003tL-Rw
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 12:30:35 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:39581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joUlm-0002mz-A9
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 12:30:35 -0400
Received: by mail-oi1-x241.google.com with SMTP id w17so4784344oie.6
 for <qemu-devel@nongnu.org>; Thu, 25 Jun 2020 09:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SH5uWQM18zzBJk03lB86wlRTLsFrMGNi4yUPo/BbQA0=;
 b=BNnl7G5p3VN8GrbIktkbS8TYXolmXv+QuvsQVkoy0mjC7qT1t1NLgCJWBnE1J+3GMl
 5WSbBylbuF+i+pGYHQLigdU1zWSri2f4qXb2MHv2yHifFg2BuHm5gfjXkZnO0uXauy3W
 Wxt3zFCNh3c32RZtTytpqqbnOeR7uq5nSYnvBf2ZOhAF92CiCy59i8Do6OxhS8nesvi0
 j8EMZFeMnYUqrAlpJPWz1mWcaGhM4hBJ/ZSfyPDArgvmGCWKm3w2EVs20LM7rsT+ofKB
 epqrTaJR9HqF4j64eVlbiDox5Ia5WHFtr5vcwhhvgihHvIcI3xqMz1I6XF42AjvJ6K+Q
 puvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SH5uWQM18zzBJk03lB86wlRTLsFrMGNi4yUPo/BbQA0=;
 b=gmraG+7R9EC152FZcdF2Y5mQjnKt6bTd1zD/flZlqSdz47q070Gj35ybas5BY7l1VC
 c/NCBq24L/Ig+O7c/je3jz+XeFS6xuRIMRxqTvhxGK7Mih51l9HptERAhX/PrvcOedTK
 RXGIfAn7ysicWt2VOjfrgW+888+pMd4ZJMlvASQthaA/uz8jxCohnKgWLEN5pII3Px4h
 Ok7XiFJmQWmk2AECN+90WuxzgekINrtMwN5k4ojS7GGXKC3XYfUoLQRWAHIQu/GG5s9L
 7p76ehCvRHRhg/5o45GxVomsOvO5SJNV/vnM3kAZ7knPSWAC7XX0n4a2ec1x9hkZFreD
 o3cw==
X-Gm-Message-State: AOAM5302qnpoo6hBzcR4XH3BlA635CjkLR5kHBEkeiM1lx58IDOWcxxA
 jV3MLbdEQP8Qlh3Xx0r8kuD8rdx+/rkBejma8TCr9yKwXQQ=
X-Received: by 2002:a54:4694:: with SMTP id k20mr2865797oic.146.1593102633270; 
 Thu, 25 Jun 2020 09:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200605041733.415188-1-richard.henderson@linaro.org>
 <20200605041733.415188-6-richard.henderson@linaro.org>
In-Reply-To: <20200605041733.415188-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 17:30:22 +0100
Message-ID: <CAFEAcA-T+Vg-3Ruz_8avQrL0KULavP+UoM+RrAF_Y6=t-sZKwg@mail.gmail.com>
Subject: Re: [PATCH v2 05/17] bsd-user: Tidy VERIFY_READ/VERIFY_WRITE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YKmt3ZpWhHnt

On Fri, 5 Jun 2020 at 05:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These constants are only ever used with access_ok, and friends.
> Rather than translating them to PAGE_* bits, let them equal
> the PAGE_* bits to begin.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/qemu.h | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(We really should either get bsd-user up to speed and
maintained or just delete it...)

thanks
-- PMM
