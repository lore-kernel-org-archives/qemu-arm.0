Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1924241lfb;
        Tue, 20 Apr 2021 02:09:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjZAzR9/om4NRJNhGHJHg2uyfYpAXI9QfVsRnL3663OzzVeB4o0+ExcJBcxSaq1h8ylyBZ
X-Received: by 2002:a17:906:68da:: with SMTP id y26mr27036805ejr.442.1618909751680;
        Tue, 20 Apr 2021 02:09:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618909751; cv=none;
        d=google.com; s=arc-20160816;
        b=u3cW1JETtePgo9FhFXbT6F9DqlsjImCy9Hk+zhKYUJf6iODyIMTagSpsqvHzzDKcFZ
         OntnG4S+GAYP+JKIIm+Gxw/PxjMBJh6cJhq64Vg9oOHz919N2Z8uTp5/35SzLPFekZhw
         aksiPIkHlsFCZPkm7duVoItaZbnrkCyBp8GZgPbmIK3eTgx19LqR8K8Mhbr6rgECkDZg
         LV4nM6HG+2oyZ2pqdSvRYqrSFI88BNH+5djvlJoFd42tk8gLtB3Ac20KHr2QIgoGdAIs
         7KxCybOYFhPH2BFUVjeEfugk3hv5Gj4+0OtqdV7H67FbIsBRoCJtlRVVo7GYmZuW4kP3
         +tDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DwBa+lwo/ny02GX3VwG6hW3qHxMAV4pZTFThzWnEbb4=;
        b=rnAAx3Vv3tWxnAwHCKTZnpADwySXWJgTJgXM/br8R+ls+FSYTqqjhnorHSM7vL24d9
         AtsE4HgD7sOsQOWpamc6LilSUqCT6YQjzOz3aLykAZfhjlz5ZOY3Z1fZ8jiZ6YLQJoaq
         Ysji7KtzqZatP5SU7dJPapb9rsVUB2orRzSyqiIqo/juHl5Pgv/16PEi3GW1lrFf4MJT
         qEa0GkSz3SEvXiGJREaIVAMgezRzjjQu3DSR9NrrytEs4ANbXgaPPJKIzdbs9T2lVdsp
         V0T7IbkaQQIN/EK95TXqM48yBl2MeHNyfjMFsk7Ng4LlL1d7jXsrIzHLaM9PSZxaz2Ep
         Kw1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=loQPlSH4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ds10si17688146ejc.719.2021.04.20.02.09.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Apr 2021 02:09:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=loQPlSH4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYmNa-0007HK-R4
	for alex.bennee@linaro.org; Tue, 20 Apr 2021 05:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYmN2-0007Fc-JW
 for qemu-arm@nongnu.org; Tue, 20 Apr 2021 05:08:36 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:44661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYmN0-0001Qh-WE
 for qemu-arm@nongnu.org; Tue, 20 Apr 2021 05:08:36 -0400
Received: by mail-ej1-x629.google.com with SMTP id r20so7376631ejo.11
 for <qemu-arm@nongnu.org>; Tue, 20 Apr 2021 02:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DwBa+lwo/ny02GX3VwG6hW3qHxMAV4pZTFThzWnEbb4=;
 b=loQPlSH4ehmnAda3upuQxnm+bdUKEGyF7ormpMMA67WzvzZT+fWfqM/LibLpaPjc7i
 HQc8CUFFe5h6KTSe8Ql+6MIjHOpAacSAIRdqdaHDjR13imfCkSHevKlZd/oi8qscW5fy
 7ZdnJ04v8cEw1O9dwYJlcd3l3Rutb65T4Ds169hUOLwQwRQJxRCxghEIubgoXco8gNSj
 28NBuGNUlfQBFv9MleTRPZUkutpnOXoJsmmk3DjHd4Xm3m81g7Gfex2QW/Sgd4IFXAFw
 ooMB4kvPTh4u9OVx5WzKFCkKA82XUwaHLxIlKfduh/I1zADdhDGLtC8rn3pgSFoo8O9L
 Ug7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DwBa+lwo/ny02GX3VwG6hW3qHxMAV4pZTFThzWnEbb4=;
 b=BvNeybs8KqTTlBkG8OGFAShw+JaBt9ZIcvEt/au7O+685nh/iBvJIUQRJdFc2iywuN
 KNfVaBeFcuvxjLnnaSyxOOGytON1jsen8J/y0ESZUF20fuZ11/HEJwn52JSxJMyUpXOG
 bq3CwW8wdUmzdp1TP+sHymLHUvWdcJVK/VDZg44MrtEkBAAgvE24w1RP9KKqLX7kkaPp
 K/pDaysaf8FBXnCSNKRqu3dU8KgCqlsPBCT5zNf6DpehEHAHl8JcLUwtYbEhVth+Uf2A
 JrYbY7wo5p9co0HfMRyOFo492a6eSD7Pt21boEV0duR2KqAsEclFFPJXjIFHhUBeEnEp
 oJ2Q==
X-Gm-Message-State: AOAM5320vWRggfHyzdTJT4tF14icm1M5qCGmIPiWsfiDwpF9JzWjKKZY
 QvQUNpdlEr0CWnxs0kbtDFYdaJ8rBJsjH8pguTXeng==
X-Received: by 2002:a17:906:6d41:: with SMTP id
 a1mr19406437ejt.482.1618909712203; 
 Tue, 20 Apr 2021 02:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210419202257.161730-1-richard.henderson@linaro.org>
 <20210419202257.161730-8-richard.henderson@linaro.org>
In-Reply-To: <20210419202257.161730-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Apr 2021 10:07:40 +0100
Message-ID: <CAFEAcA9zQ8qCWJw7smVRK-z0wZtmxY1r-9SdSUOpn=B+YhAKWw@mail.gmail.com>
Subject: Re: [PATCH v5 07/31] target/arm: Use cpu_abort in
 assert_hflags_rebuild_correctly
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
X-TUID: Cxoe6U+PCNS1

On Mon, 19 Apr 2021 at 21:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Using cpu_abort takes care of things like unregistering a
> SIGABRT handler for user-only.

I would find this argument more persuasive if we didn't have a
ton of other places where we call abort() or assert() or
g_assert_not_reached(). Either we should have a consistent
mechanism for assertions in linux-user turning off the SIGABRT
handler, or we should just not worry about it on the basis that it's
a "can't happen" error anyway...

thanks
-- PMM
