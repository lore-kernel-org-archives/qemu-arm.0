Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1653784lfu;
        Thu, 28 Apr 2022 04:26:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRCAU3+GYuEdzBfFgxFNg6C3qE8B1hZamCSECXs1aLVR6WFvBY2m47PIWTd+rzY+jqvwJX
X-Received: by 2002:a05:620a:bcb:b0:67d:1b1c:a988 with SMTP id s11-20020a05620a0bcb00b0067d1b1ca988mr18723629qki.587.1651145203105;
        Thu, 28 Apr 2022 04:26:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651145203; cv=none;
        d=google.com; s=arc-20160816;
        b=D29jMz9z5AqdQyX1kmnwCObK1cUkFyhG9+0FuHA6c7EujcEQrbgR3/NBSLlz9B9IuG
         HzWQKTn7giZwdt/djkcUrqNbFxrN9S1VSNAyiOqdSit18/eyk7b9XEoZO3k1JQTmLMZK
         smfkxYOD3UvtqunEwVADQJs+uOW21KcrcyCuQ3LmobPFClr7C0ZfHyt1qNd4dKyJ1ieR
         HtY8MT5btwGZfrfXNqopyGJlFcHX017wP9g/UyYT+uB7IQ7gCE2V3NTbZLPMFDNd6Fta
         qoNg+R/fxph0m8Ni3Z66cPRI/dy+LvhtxDKUzcC1+GqPoSRM1j6vjQDPx8nfeslowVMu
         04Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g1swU2QWRvH/jTmnfVgrRGpaDz13vnGddtZ6Gypatfc=;
        b=B4folRLKGsGI9qw/Q+YcT3KmwIHG/MUyGudx/uIjHElITS09AB4B5S7nksX+DluQSr
         MweNYdUBjiptLzmLXP/BUIY4PycK2V++otEFYfSFCkW2V2Wu6qmz0GH0RJIG5JoFbCoc
         ORuhTtsyOGz4DBY/zTKTeKLOcgS1OYkhGgoNIL0qe7vxQ1kjzP0EgKrwzC56cD1dg9eY
         fDdHLY1RRa/JGC4RPa5KEPotIt3C9zyhaBfgZICt5z7VUwubLhbDk4s/WwY2/kP12o82
         HO4K5xCL1f+kODfmfanDIBoa1WwIgErT1OCXEI5aaVC4CfNMlRBLBpzaEE+bLOhwl+ML
         zW5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VhTe0XI3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j129-20020a37b987000000b0069f48aae7a8si1563025qkf.485.2022.04.28.04.26.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 04:26:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VhTe0XI3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk2IE-0006Te-Ib
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 07:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1fb-0005Tr-Ff
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:46:49 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:41145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1fZ-0001tJ-OD
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:46:46 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2ebf4b91212so48192487b3.8
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 03:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g1swU2QWRvH/jTmnfVgrRGpaDz13vnGddtZ6Gypatfc=;
 b=VhTe0XI3bK7prnbybItD6lJ4CJhl42DcSGIreSq1zRpoxavnYesMXnqufggAUAXxAh
 gReZ9yfBznPbn13PJEe9o7kB+9GEp/lg09Mj6xHwk+TqDqbffP79UtnMum7IRqcX25pP
 iqducKe/R1klahfbuKLLFKO1kR2QXFa/jrRhGU5OcRgonyZ+ZIe5dwPc1HpzPuQNAlvQ
 Tw0KrD+8ByTL3tcjxaVE6P4TDGnioYBcwuQQOfKX/qS4QHk7igdicfO+NmDH0I3N+94H
 I4ORii3M18tmrfcWx0KtknjQau+COk3b+Un5eJLNlM0E5j9A0zy66C28mSgOg9hGMCI6
 tMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g1swU2QWRvH/jTmnfVgrRGpaDz13vnGddtZ6Gypatfc=;
 b=qVi95Kljcq6lB13OWAEoz6ZG2hnPbfU9oCz8XIHeFk0LlL4iM3/eadyhxE6P5uK9pd
 AJQHLpM2/IbhzCFHOsDq5kibrxjkEnnK9NnwoZB8KkuHGi0HC/kC5OgMkCWcXvYdAAdk
 Rfhb84Y99OehBsv/u4Ehtz3kdp9BpDKLmhCTPQTW5nf4pQ+Yo0spFH3Ql8+SvvExWlAE
 408gcHhvs1hHCemGsnuujL4UKBL1iZuNk9MTdyAxBDwmtpOgwYFwL9BjOay29yhclv5f
 8KknQSntk3hjZYU1+XrgWb31g1M+pvzj+yp1mcZJdISmgUDVHPlYdg18xFb/bfyYWOsS
 ZteA==
X-Gm-Message-State: AOAM533m3faUIMW9T2Az4cGSWgoD1y28PEAuJvPQZu0fwyaFCd6buk5r
 L7njJyA2MLC/qyo47pkc/W7zc9RsSBsYBMxq+c15NQ==
X-Received: by 2002:a81:5584:0:b0:2f7:d7b6:d910 with SMTP id
 j126-20020a815584000000b002f7d7b6d910mr23162145ywb.469.1651142804430; Thu, 28
 Apr 2022 03:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-42-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-42-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:46:33 +0100
Message-ID: <CAFEAcA-xTs8gCHbr95K5OazWOEHCaH62aLP971bZQWzaYzu=ag@mail.gmail.com>
Subject: Re: [PATCH 41/47] target/arm: Use tcg_constant in WHILE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hS9zmNi30ZXz

On Tue, 26 Apr 2022 at 18:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
