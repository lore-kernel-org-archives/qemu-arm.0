Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4870290lfb;
        Tue, 27 Apr 2021 08:07:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiA47QWwR7Y2exkAwRD34JbsK4QWROLHiUzZnOKE4EQwQSOX8mzGI+nZIkxFLcK6hG2P07
X-Received: by 2002:a19:ec13:: with SMTP id b19mr16526755lfa.649.1619536051596;
        Tue, 27 Apr 2021 08:07:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619536051; cv=none;
        d=google.com; s=arc-20160816;
        b=hkdsXOLGR/d606yax8wlYxOP2nhT+XL9TpEanmXBwj8eI655iEF+qsP1gYU7voiHIX
         m7Z1bSMj9ejqQ5fJKezH+uG8Ct2Goi3aKBZFHTs9FD1Mlz9PpGld6gTYTXqRSFUg8pXn
         tzvIJ29cJKSRXhvH9OX0o3ylk7xBK80XmuyPs9j+wd7X1WgOFnq3ZlvJJcEnTzG8SdRo
         lgvEufd2vZDBGiryYpEstMx6xHXmSTZ71AC5skISvsjewRmOefC8a0SDa51kEmHvixZJ
         Vd7JBlqtGOKoFjpyNWBS3zVYiIX9KOJrIXYWhaeu4hiGnSgUsViZxgnUpOhDuWIcTW8Z
         Ilpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jMQA7MQFqdIqSePnm1Lm8XKO8WRx/PB1IoBI0gZbtag=;
        b=noL36owT2sosMXiFOgZoXLiqf338bJcLXoB8ollEIqIo2LC7573E1jzVdywtRu9z6F
         1vMAIHhHKyDFdTW8SB9lGYQsv/Yh1IR1zuEDjcb3GPfEFZTcfuh2VWdrXqliwqHQ18fJ
         3b5ehHE3bRZHppMRHWBcUGjZZ/EALVl/fgEVXY5K0eOgCLmmYL1XtmlkgyY+APgaLoaQ
         Nh4hVwnTNuh8JGuxivVlR1PVj+68oE5P0A8CrYMofyR3TdGCVgAF9wKcX8XgWIkVuDeU
         oBZWpyoT8CWRXO2CpPoIoqZMyb3tYCh+uoCJOtB6rdBwNol+/hk6+URcEyhe8jCDTFrB
         80Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="aP0GH/Lp";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i16si51557lfv.455.2021.04.27.08.07.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 08:07:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="aP0GH/Lp";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbPJC-0000AT-Dz
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 11:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbPBK-0003oT-Dx
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 10:59:22 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:45001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbPBH-00058O-Ax
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 10:59:22 -0400
Received: by mail-ed1-x535.google.com with SMTP id z5so33826245edr.11
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 07:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jMQA7MQFqdIqSePnm1Lm8XKO8WRx/PB1IoBI0gZbtag=;
 b=aP0GH/LpZw0gJXd7Nt8vXgSrhGhKNBORYMQtFjHVZ0rmHDNijkrOkqR0uBEq+FRxQx
 MYR5G/bLOtMFFTv2fHcrJU8MIPPVDzPO3UI9CJUNzVSbtwlqdhlcTbOKec3g6W9d41/M
 Ub6yZg8303pE/BUfAZ/LSFIPsJQhKSxDOEx1SQWa7x/tgTzGK5LQ53FjKasrsfRsD0oM
 8QiZHILymOa2IC/0noIccw/L65YSL49UIrQNlYAhIixX/UyP4lrPHD+s+EGZUJTJmcdi
 uM8p6aPbGZvw7ER1BODMGpu0tMdx/3+AvDir/lw34y/U66UIXgoHzjYT685iM77b3wBn
 FyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jMQA7MQFqdIqSePnm1Lm8XKO8WRx/PB1IoBI0gZbtag=;
 b=RpzekiDds31FqOCcGlLgfWm0QX2cGmq+q+olzXK2unDyHeIvz51iy3LBd2EwQ2sstx
 Oj/HzWaDCH1ofIMueW2FcBLPA2f/IJJFG6BfwzCh4gQJCoI8TDAlG/6QDg1/ncQKD6mE
 DG+nvANRUOZ6FbKr+pvXiCJY8Q92AZPfC2cplnhoCZll/+UTqClPSP7W+y9jicVzxhvy
 M5PvnT/M7iZfaJYa239c/kgi+CGawgpjGSQ+7UsbvA6FO4E9sgYpDc1kkN8/Lr6UW4UE
 JaplDrJtwmoMf/bab2GlH80Z7eQ1uLtHRklOEZNFb46c9zmdZn36CMvOR+AS2oQplars
 sN+g==
X-Gm-Message-State: AOAM532huPySxF+IvGuIVs3HRFYQZgZ+UlQBbWu1HoBljJK9v4tkrWsz
 aklExnpRQUeCvSJJBXM3tBQQK3VxfT+ODiRpo0oRLzm0g1Q=
X-Received: by 2002:a05:6402:51d0:: with SMTP id
 r16mr4920320edd.52.1619535557501; 
 Tue, 27 Apr 2021 07:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617281290.git.haibo.xu@linaro.org>
 <CAFEAcA8a53rCGBGVr_mb0fVJPXFaCShGTJE0bh=L5Nvw6ATz6A@mail.gmail.com>
 <20210427095458.3hbckyqbmfztcmge@gator.home>
 <CAFEAcA82VJqgD+B4gCr1M0n5oV869rBdoTzNS6xSs0f2f8iFvw@mail.gmail.com>
 <20210427144819.fiecdpdgre7tznvq@gator.home>
In-Reply-To: <20210427144819.fiecdpdgre7tznvq@gator.home>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Apr 2021 15:58:18 +0100
Message-ID: <CAFEAcA_hvxAmodWKdEUQH4as4vMuaDVGDK7C6KeZ3-TBbPxEFA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 0/6] target/arm: Add nested virtualization
 support
To: Andrew Jones <drjones@redhat.com>
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrea Bolognani <abologna@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Haibo Xu <haibo.xu@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7UXj8idI7xYb

On Tue, 27 Apr 2021 at 15:48, Andrew Jones <drjones@redhat.com> wrote:

> Since these types of features seem to blur the line between being a CPU
> and board property, then I think I'd prefer we call them CPU properties,
> as they come from the CPU manual.

Conversely, I prefer to call them board properties, because that's
the way it works in hardware: the hardware board has the necessary
support for the system-level feature, and part of that is that it
has an SoC or CPU which has been configured to have the properties
that are needed for the board to support the feature. Having a CPU
that nominally supports a feature is useless if the system as a whole
doesn't handle it.

thanks
-- PMM
