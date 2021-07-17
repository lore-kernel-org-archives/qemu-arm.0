Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp2099165lfc;
        Sat, 17 Jul 2021 03:07:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMRmRbY/cytQ0r+GWAbrsBn4zXrwSuMyDi9ExhMmw8zoXIigpf+NTHKvxAQXeUjVKyR84e
X-Received: by 2002:a67:c88b:: with SMTP id v11mr16794443vsk.7.1626516458781;
        Sat, 17 Jul 2021 03:07:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626516458; cv=none;
        d=google.com; s=arc-20160816;
        b=nDT5hDhmJR8THPKWJfKErC2xXNBNiObknyloBDjdI66Av6pRxypDidL1cGfXiygGSj
         IOqsjmlz84UBP+aUU2uetO9HbGBT7fYlODYBF7GvkMWp8M3VH9UAqL9ZygKsz7j9Ipg0
         6bE0JJNgYknOBjavF1T8XM1vizNMXy6Mh4IzQcVuBiHz0EyYSOU2T9XUAUXaq/xDc2xD
         2jDCZnic0rtOJx+piiuc9ArwR8jO6f0ZFyD9BshKLkd/vnOesnAvJH8F20i8qZBjq5s5
         O97yeX2Qb31o9MOM1gvMNcaN/YaSVhZJ7+Y8Ebb4r2jmpWWykRT15h8vnXQvH726MSQ6
         kXjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lxgv7J2hQCIDbuwwemUSH0cAp5apuA6AMtxTkbp6Exo=;
        b=myhDzuQ1Nu+87POKdl0bPO+nEUIFlBG/GDksaSphTHS3i/KW2kEq/3hdYo9io/rZJG
         FoxVMXU59QXs+frbhabzaUSv7ebXRr7xzJ1JSr79aKWbZzn908bbTdzrdwwtWihB7mtV
         GvGSX/aymkOjQjSN4Sw4o7ThZYMb1PS+wE3fxyS6tQBLmCveCxMWaCBTljA2H32aohJM
         o6T4r85qGAr1XwEHkakPcze7OTyC0RDaU6mI6PziVX1q4PHnAQLBTXVC+e4jBB1QYBq1
         Ky8eu9e2+9epSvxtAwH7U9s6Tc8zuZyPZ79uei9l9TXvOcllb7bJg8E7PwS3uRoJsmsT
         aHDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uZ3OmUG0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h23si9406539vkh.80.2021.07.17.03.07.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Jul 2021 03:07:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uZ3OmUG0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m4hEP-000407-PX
	for alex.bennee@linaro.org; Sat, 17 Jul 2021 06:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4hDi-0003S0-5o
 for qemu-arm@nongnu.org; Sat, 17 Jul 2021 06:06:54 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:36582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4hDf-0005K8-IA
 for qemu-arm@nongnu.org; Sat, 17 Jul 2021 06:06:52 -0400
Received: by mail-ej1-x632.google.com with SMTP id nd37so19199430ejc.3
 for <qemu-arm@nongnu.org>; Sat, 17 Jul 2021 03:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lxgv7J2hQCIDbuwwemUSH0cAp5apuA6AMtxTkbp6Exo=;
 b=uZ3OmUG0QF7NLOeAORW8gEzf9G5yG5Y+WQE6MpdWzcGKe+o1wYIm8CBvMbOgzm2s+M
 Bmsw0JoyewWOHtFRr+f8WQOY8QroA7D+P9+h08svPb70k7QKwC8jrOcGBI12x5omA+kp
 aw5i13xDv4wvVcJZaHD2DFMdYZiFXYl1IlwL6iWV3c5En3L91UzDQ2zsacee9KMUhgSD
 pik+AbJJRP7Dyl3vwp5tntZB4+cJkSd6E/Dyr+Vvapl0ivH24ImcMXX3Vqui4LNoJcis
 GfXXS9d92EG36xOlRleTwVrMDJ/VcqK3QPVdHHPG/4RKjSlr/hJhE3DHdahfm+AJpf4P
 TDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lxgv7J2hQCIDbuwwemUSH0cAp5apuA6AMtxTkbp6Exo=;
 b=VD1cl8gqbEXIMOVUb/cZsZeR+Z+OdKthG8M0c3/V9srDgrwHonNkQ53X3Spo9j3J7R
 /WRj+KYrsx1Dw4bXsIZG3efF1shN7fghE9zqAxUujxdgNyVUKwV1bPNAOk539ql5n6pu
 m5RL4POdM5IifPXT8o7bZ9PHAszbSCZSBQVRizne15QoijFUWkA3eH+k+evd9kLutib8
 j30gOocBIyAbryEQuZnnLr/geJUcVQgb7DFt9QTggwvM4ZkSoPJPeJPtSr1z3+eUVY2A
 X511kkKaPQal8qr7YbiIZEBczOnokq4F1geYiqBpb5Ekvp5yUXm876NU4w6KIyS4Wzeb
 W/7A==
X-Gm-Message-State: AOAM532qNHQOeEnIRQFscAkdz4Gsko5uZzd/F7DBt5wz7fby68GfQ2Iq
 E4IAbEk3LUcj8vCnHG82bjFzY55sMHO4jiRWxmxw7A==
X-Received: by 2002:a17:906:a2d7:: with SMTP id
 by23mr16555511ejb.382.1626516410137; 
 Sat, 17 Jul 2021 03:06:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-18-peter.maydell@linaro.org>
 <e3f557f7-c65d-428e-a0b5-68d1ffc01df4@linaro.org>
In-Reply-To: <e3f557f7-c65d-428e-a0b5-68d1ffc01df4@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Jul 2021 11:06:10 +0100
Message-ID: <CAFEAcA-o=rC1Zm6JyFECZ_uXndbRurrZdYVWTn9aq=dHXsWJSw@mail.gmail.com>
Subject: Re: [PATCH for-6.2 17/34] target/arm: Implement MVE VMLAS
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: sx2YIZygrJaN

On Fri, 16 Jul 2021 at 23:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/13/21 6:37 AM, Peter Maydell wrote:
> > Implement the MVE VMLAS insn, which multiplies a vector by a vector
> > and adds a scalar.
> >
> > Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> > ---
> >   target/arm/helper-mve.h    |  8 ++++++++
> >   target/arm/mve.decode      |  3 +++
> >   target/arm/mve_helper.c    | 31 +++++++++++++++++++++++++++++++
> >   target/arm/translate-mve.c |  2 ++
> >   4 files changed, 44 insertions(+)
> ...
>
> > +/* Vector by vector plus scalar */
> > +#define DO_VMLAS(D, N, M) ((N) * (D) + (M))
> > +
> > +DO_2OP_ACC_SCALAR_S(vmlass, DO_VMLAS)
> > +DO_2OP_ACC_SCALAR_U(vmlasu, DO_VMLAS)
>
> This is confusing.  The ARM says
>
> # Operations that do not perform
> # widening are always unsigned (encoded with U=1),

I have noticed that that text often appears for insns where it doesn't
really apply. I mostly ignore the text in favour of looking at
the pseudocode for working out what is supposed to be done.

-- PMM
