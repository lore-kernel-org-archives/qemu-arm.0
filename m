Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp230155lfm;
        Fri, 26 Jun 2020 01:39:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxG7+xLFeUvWkX7tJTdkP3FDHcX32kDZu7lSjSlVXX79w6Mc+P6f3IQsr2bBSbKIaASNhV
X-Received: by 2002:a5b:290:: with SMTP id x16mr3120152ybl.75.1593160751163;
        Fri, 26 Jun 2020 01:39:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593160751; cv=none;
        d=google.com; s=arc-20160816;
        b=Tw2fh26iKLUTJhtRalVGUNsJoiYKTQqXdzH/av3rT5yTJF6L7NVA1X+ao5AymL97sQ
         U72Rp4XOMQyiEDm+VE+Tu/HdSSLblBcT+SI+2Tv6rdveR1FP+90SHhv78d/kya5COCHx
         NPQIae5Q4vB8nSqk9ZZ7PK/1glrvhEGNXuwQnV0qpQYPa9pxUrslbRi733Rqhq/YKKlz
         Q/d2kf76CljQ+J1ZXHgMkkrnRd6Hn67EBqf513DuKLa7HW29kQhdyD3Z6Ut5bnejbUTq
         FbTLC1n2zIgUQJ5ombIPb8/dfRHZjtBFFC98Q2ZonEoSQQc/eJmDqActYKNdhCnsjSYI
         QMBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aDuYo2EkjliuBpm8C4Ix6MoXdbPblOzQha1faW5jl/8=;
        b=WwavXnOXUfLH7y7q27W4zAnKhbfmjY19V9LrvvPhgYIjqUxmCJCx6L8yzk+ZamSmWq
         392EhNOMVTCqO9gv7Q7nYRSyjvsHAMlu2QRVS+Ge6uHFauDx4+bZY4NPB0u16LoQ6wbA
         D5rUA0++cGcTc32FxOuic/2esV9zECHLIUw1wfHtS2CKwJMJ2kmHODdEt20r3Xn/yMQ7
         7m+6LfPPjASTzunEkyMrJCVkltrvj0urwUdfKqtmbTNVcIOK2A/4pbs9zadlNs6UfqZY
         tPCFQuYMus3Zn6nHm7fGBbi2ErgoRFbNmRyu8uhPw9Kc0dZ9fmfCX5ex9fnkNE5ZPT/+
         C+Lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g3J6QXkd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7si13477511ybp.191.2020.06.26.01.39.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jun 2020 01:39:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g3J6QXkd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jojt8-0002Q8-HV
	for alex.bennee@linaro.org; Fri, 26 Jun 2020 04:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jojt1-0002Ps-IA
 for qemu-arm@nongnu.org; Fri, 26 Jun 2020 04:39:03 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:40350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jojsz-0001bg-RP
 for qemu-arm@nongnu.org; Fri, 26 Jun 2020 04:39:03 -0400
Received: by mail-ot1-x342.google.com with SMTP id q21so362844otc.7
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2020 01:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aDuYo2EkjliuBpm8C4Ix6MoXdbPblOzQha1faW5jl/8=;
 b=g3J6QXkdwi0EwnTS4hyInYwAbkyTQRtYTNrpez0mxfpBINWMg9BxUPNi0HuiSzfiH4
 TQnnFfptS2JrtWYmnGcr2kE7JDTMnbaIUzCEpcOw1Bijd4RJ30IP2tPtGW3hJJ9VuKbR
 jUy5B+zu6+5sHaBNW4vuNZW8dUWk3WirTXH5dk3I2U0zM6GSWlUlOxUMth8mg8WnhhIP
 7MCYmeaXXsPjjiNmoKZsiT6se0FJG5Fo2IJ8DQ6wRSArs5FWJ8O3fGjXa+2ADJ8NEesS
 itk8jG9F1MDwXSLJ0MEWrYRhLepy1jTeTTrd4HSelK5GSumMcQdMwEIbtG6n+viU3HR3
 1qhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aDuYo2EkjliuBpm8C4Ix6MoXdbPblOzQha1faW5jl/8=;
 b=BmPzBjTxOBcUS5fzaWNfVpRBu2USUMWIUBgtK3bguXvOhftFDBjOgjutbwfliivWw9
 xOnNxMDMMDDMTPhMP7aNQRotdXzDXXw7stuc5azelI08KXGP9YlVJ3iCCtxhOJFi/D8v
 VOCiTOCtP8jTXbd2Km457HE04lYepuzK8VSG8WysVjpbeeq4PEEkiJbeizDEQEk5f/lt
 rkUgUxQe6BFxw6kTPCUkdM2fLDvQ2blMQ/zeYhB8EzCERe2v4WuTiYm4/dywzWucKJk9
 oAc/mgD1heIOqnn9sALVvttqdJDynLbLAaf0qjursPARld7E/qdVNc0nORVc5CPs+cUN
 7zLw==
X-Gm-Message-State: AOAM532xw4348wdceSacKJNEakCO7oiRZvlZ7+56tSGzD5H0IHEQVcXu
 APUNh1s8/83MdjoyWcIWBX/Z+UI74mBLU9oEaunpIA==
X-Received: by 2002:a9d:5786:: with SMTP id q6mr1527643oth.135.1593160740404; 
 Fri, 26 Jun 2020 01:39:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200625230740.549114-1-keithp@keithp.com>
In-Reply-To: <20200625230740.549114-1-keithp@keithp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2020 09:38:49 +0100
Message-ID: <CAFEAcA9ut5CVAgRTP-_BK3WpiDSmitFowZMe549TvgSAjj+Kfg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Add 'virtm' hardware
To: Keith Packard <keithp@keithp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
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
X-TUID: IvJrhIw5lvcl

On Fri, 26 Jun 2020 at 00:07, Keith Packard <keithp@keithp.com> wrote:
>
> 'virtm' is a hardware target that is designed to be used for compiler
> and library testing on Cortex-M processors. It supports all cortex-m
> processors and includes sufficient memory to run even large test
> cases.
>
> Signed-off-by: Keith Packard <keithp@keithp.com>

So, I'm really dubious about adding more "virtual"
not-real-hardware boards. We have "virt" because we
absolutely have to have it for KVM purposes; but otherwise
"emulate real hardware" gives us a concrete specification
of what we're trying to do and tends to lead us into fewer
messy swamps than making up virtual platforms does.

For instance, this board model claims to handle the M33
but makes no attempt to set up any of the TrustZone
related components like the IDAU, so it isn't really
a useful platform for that CPU. You also enable bitband,
which is maybe plausible for Cortex-M3/M4 but not for the
others. This is the kind of area where having a real
hardware system to check against means we make the
right choices about what does or doesn't need to be
present.

thanks
-- PMM
