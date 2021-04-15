Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp779676lfr;
        Thu, 15 Apr 2021 11:33:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAB2GbSE36QOl1u76UlHysRHA3fqFXIelXRxKL9iD0YDsPOTwlq5tElNJynYQt2WdMKHw6
X-Received: by 2002:a05:6602:2294:: with SMTP id d20mr448809iod.59.1618511634297;
        Thu, 15 Apr 2021 11:33:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618511634; cv=none;
        d=google.com; s=arc-20160816;
        b=Q7/Xns/judItQuMI2VnWvQwZ/qAXD/i1T3VtfAMbgMwtG6JhrGbBBmMG1RuCXdom6i
         PmCTBAwxF9B4uk4bsJS9sbwEtF5dpDrUkbk+jw8kEgf9NorMmQlpVEqEM+x12ytyv5vw
         99+xEoQ1S0ypniEYHDjfElFKa+P29sljdZK8eQsyLMFS6wAEXJ81VgELBZNKxagXUaOP
         XVpZZnUnLaocYA6a1cnxmBgVVlrxPx1mBk99OaZundqmM02dAB0NWPAy+2z9PoHlMwFb
         dxrmXklv4DDdF2eVSH9OrKxsbQqGlRxcKj32/3NMUtJ7aymeZxf/4KkEd8o9WnC32wxp
         oc1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MbGNe8xVn4kiM2Wi/WaRgSqabfbhn+M2GR/5aukW1w8=;
        b=Ic42vOforXGe4AyZPaOa4VbTV8/FCDvIYRhQiWH25ZeTCrw+MpVlYEOj2tuYjenExt
         SDiYCcUoVGMeykxVrQ6fB2FKgXNZ2ku1XaKDcrYk0+HN84dTG3wSmLMsZ03RdxTRWMrp
         l0RMhIedwwHhXrWdOiHaiEGH/8eSLcfpjdakn8Vx1elVTtwHBdSD2AZBcpJ74E13XMzS
         Hbpn4FTYhEXelR5iVHbgKkJDykUwgDwpVFxGw40Qz8ZpmSsVWBJUv04U2IcSUECDmUfp
         WOOxn0rTMNEQ5Zg0771+NdPlzjF7puxv3Zb95YzO03y9FGbFteqTNtX/7l1belhdij/P
         qz0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=giclkvwz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6si2986546ilg.136.2021.04.15.11.33.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 11:33:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=giclkvwz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lX6oL-0005Zl-Jb
	for alex.bennee@linaro.org; Thu, 15 Apr 2021 14:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lX6ng-0005Y6-4t
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 14:33:12 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:37787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lX6nd-0005H4-3F
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 14:33:11 -0400
Received: by mail-ed1-x533.google.com with SMTP id s15so29285993edd.4
 for <qemu-arm@nongnu.org>; Thu, 15 Apr 2021 11:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=MbGNe8xVn4kiM2Wi/WaRgSqabfbhn+M2GR/5aukW1w8=;
 b=giclkvwz7f9tnO/v0Vrik4aL0+bEZoDKTFcPy87T7Zo6zKA5KHNByykCK+ruwjRI0R
 pl5ZLkYxoBoT5mniVq8+6jN9tyfHweZ6XUUL7vNK1g8x7OetnNvI4yI2PcxAQOeGM6Wf
 1fmQNsmzR9aDRKjG7fEHjnbhMhDIG4nGIO+MJkESReOUXIg5TrBCLOxmU0uaNrtqX3Eq
 T2aFBXXkQJKdWmXSbyYnmM0mt3ZWOSgMrHtQ6+tFfQgN3qERu2qK3xHYl/nl2D/Cnhav
 2T7TuavKCCoMNxvbm3565INM3dU5hyawbk4O2JVlwOL6iXbonYbp9uyea9SSAJrrGHHt
 NRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=MbGNe8xVn4kiM2Wi/WaRgSqabfbhn+M2GR/5aukW1w8=;
 b=Rzuoh9hXKhVucopUPuF/LbFQs0JSlrkpMUvoa/LldPFrFi1COofhbP2lR5E6JX8vA2
 KJgdhJ/xeb8Ub6lH8bp70RB6E0OLjDfdyuvMspCRA7xRzSeM55bZPf0Zry6DpZEGsa6Y
 Q2axAYbBOhzHlPxHsirchwdnBHggthQoGJs8T2MD7UsGQVBU31Afy/o62zvOHLDRad+j
 qKbddCw9lqZ6hwnR6bhTEdoeuALGLgOANgyq18Z2ndQxDrbi4oXhhjIZy0viwMVIUPfA
 /kv2bDv72DJknfB3Q3za3SYdyatNN6aUGIT8F9die+dPTl5K8hJSUsbn+ds5SC5pMguP
 WaNw==
X-Gm-Message-State: AOAM532rThSO4VImFDo1KEHhKOdST74y5HM9QvXb/7tEE1SwV3Zh3Etd
 bE3FTV5q8BcfJnoNg3ECaBI65SqtFqKRagkRvZfjRL2Omj4=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr5918351edb.204.1618511587491; 
 Thu, 15 Apr 2021 11:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210415182353.8173-1-peter.maydell@linaro.org>
In-Reply-To: <20210415182353.8173-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Apr 2021 19:32:20 +0100
Message-ID: <CAFEAcA-zaAKyXXw5XHQ=zm9nY8GwYWjd-=fYcncNnnF-mqQAKw@mail.gmail.com>
Subject: Re: [PATCH for-6.0?] hw/arm/armsse: Give SSE-300 its own Property
 array
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iA8slqPKi7qU

On Thu, 15 Apr 2021 at 19:23, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> SSE-300 currently shares the SSE-200 Property array. This is
> bad principally because the default values of the CPU0_FPU
> and CPU0_DSP properties disable the FPU and DSP on the CPU.
> That is correct for the SSE-300 but not the SSE-200.

Should read "correct for the SSE-200 but not the SSE-300",
of course.

> Give the SSE-300 its own Property array with the correct
> SSE-300 specific settings:
>  * SSE-300 has only one CPU, so no CPU1* properties
>  * SSE-300 CPU has FPU and DSP
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1923861
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

-- PMM
