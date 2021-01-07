Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp597679lfq;
        Thu, 7 Jan 2021 12:40:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJziBT5OtgHGAYZfZl4PLYzf3LoWZCUeHCKtj/Y542H4C8L/knYfgkR3Cain6J0srj7L0RiY
X-Received: by 2002:a25:5685:: with SMTP id k127mr1023485ybb.255.1610052008573;
        Thu, 07 Jan 2021 12:40:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610052008; cv=none;
        d=google.com; s=arc-20160816;
        b=sAEoTGkm6epSgMPqcYoBU//B2ObJqWIzBXA9Z8rUCjR/AdkhhpkPYtZLUuJ8ug+t4I
         MKN5HdrhFhoylaClynde+BWRtC/3ppqPHfxkb7QWK6Q784VIoza38XHnyk7PhlDlfhJo
         wlGi05Q2zAMP/RJ4YRE2EstFISwzqUjVYSj7XomzJs0J54iZE/p8RK+GmYJrR+GjijzE
         yGdgg5etxE8immsjbLqT6Isd6kZ3VPS+2MryinxAwUIm5r1kz62SsOfIIEpB0yyoYMCJ
         WjgmTaHEMEPFbNHvwkvmUbvzI6i+nH4hcYCaZpOVGeOuDnVcp8LoDZyuoPwdiNCVmGbR
         YG1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0tOad4p4g9xxCxz+2A1NsHx49ZOrVhPXaqsHUq1scno=;
        b=1HFJIYBprwRqCDhmJDSMz/FTCIVoyU6cXXzA5Fk5rsyRN6t89UZlMiyKjGsKB/DCxJ
         IclUwhreGXeQmAaZrkiv9ats5z5mjy8QVFMLpGC+EHnHUhNiQGDSxuYnbiiS61DSEu+s
         Pt43+nbfhrH6PxgJy9z+MKpwhO4PsaGKc5kuG0yD7SKeapLQNwXWeUY5TvHL5YZQdMhx
         tAd9KA6jqpYAxKzTmcjG0o5Sb2tcMLuGtLD7Occ8pDtAcx8vETd6nNJjMeBaHIPv8QW2
         7rouiw+HiVC3Rm2dk8z3pYG1urzqnAPK/5mnIrm4c3COCleLPyYzG/zeCtb3ww3Cr8bH
         2ICQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aZcqVUW2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19si6962774ybj.479.2021.01.07.12.40.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 12:40:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aZcqVUW2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxc4l-0007hk-Tf
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 15:40:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxc4P-0007gC-KF
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 15:39:49 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:37622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxc4M-00019d-FV
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 15:39:45 -0500
Received: by mail-ed1-x529.google.com with SMTP id cm17so9059864edb.4
 for <qemu-arm@nongnu.org>; Thu, 07 Jan 2021 12:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0tOad4p4g9xxCxz+2A1NsHx49ZOrVhPXaqsHUq1scno=;
 b=aZcqVUW2PFjQgWmUQwjQiWKLnei/9GaTYb5HZ4bAiLsjR5RpkW/dpLJM31yw+Dj+nJ
 Qa6fajhBBQN05E90wGwkFIEclx4FuLhPOK7F+z6BEfo96dm1sbUynRV7svHZTy1l/MhK
 QCWCIv6fwrmn3ikyVSFyvzQEIEhZsjJDnA7vmhUsG+DUcEOCzQK0bhS+79TngaoxZoRC
 nOX0om1zzsHRGGk7Bo81IoIyIVLnaUSkuAwN1A6NuwkypXWfLQPv8/6xVYWxA7DptxwU
 82Y6ytBusGyTmx/DijWQjMrdJJgykweg4KK0uZSrH7hE0LGOk6BKYrtD6zyqV0ECJ2vc
 iiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0tOad4p4g9xxCxz+2A1NsHx49ZOrVhPXaqsHUq1scno=;
 b=H913zri5/5pj8SVrLCw5Lq87lhnHhgCv85g9islUjeFD0gySr5F5odsWzU6xQ+8kxB
 3Xjb9vWTMcI8MyquYpaR2z+zkeEatAbt8iYcwTIDQqdeMDT496CSjT0/LKrLxb9gOAxR
 OHdX6jtt3knuX80DoKee8mwbNk0zh0fhrzIrYsNSG7E+UIhWV5v/q7nTAt+Ak89zsU3x
 bOFEl369tO/RnAkArFSc9Mw7bBJ02sBdf5zbj1ECxRKcyGfB+BoZTkxKCQap4rukIH6r
 ZfTkgzocpzyIIfC+fZlWtfTWpNzA/CpaaPkt2ThDgwi2I7HjD/QccFn4bZeJ88JnXaHs
 ea7A==
X-Gm-Message-State: AOAM5323yh3YNMCHHWZLtroDKPCfB9Yh57gdvc+U6wWnd1Y8hc6dq/+l
 UZYBYbu5xyUYZkyd0Aoo4ehPJS/jHslYxK+jO6Gr0w==
X-Received: by 2002:aa7:c353:: with SMTP id j19mr2960208edr.204.1610051979194; 
 Thu, 07 Jan 2021 12:39:39 -0800 (PST)
MIME-Version: 1.0
References: <20201217004349.3740927-1-wuhaotsh@google.com>
 <20201217004349.3740927-2-wuhaotsh@google.com>
In-Reply-To: <20201217004349.3740927-2-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 20:39:28 +0000
Message-ID: <CAFEAcA_EfWw796RvMsKouo5w4JegwN8ZtUXYNgonVrW6+Y36TQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] hw/misc: Add clock converter in NPCM7XX CLK module
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Corey Minyard <minyard@acm.org>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E0GrndBdxe5b

On Thu, 17 Dec 2020 at 00:45, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch allows NPCM7XX CLK module to compute clocks that are used by
> other NPCM7XX modules.
>
> Add a new struct NPCM7xxClockConverterState which represents a
> single converter.  Each clock converter in CLK module represents one
> converter in NPCM7XX CLK Module(PLL, SEL or Divider). Each converter
> takes one or more input clocks and converts them into one output clock.
> They form a clock hierarchy in the CLK module and are responsible for
> outputing clocks for various other modules in an NPCM7XX SoC.
>
> Each converter has a function pointer called "convert" which represents
> the unique logic for that converter.
>
> The clock contains two initialization information: ConverterInitInfo and
> ConverterConnectionInfo. They represent the vertices and edges in the
> clock diagram respectively.
>
> Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
