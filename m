Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp980414lfo;
        Thu, 17 Mar 2022 12:15:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2QM5G9JFa1hbEThPlcLpk/zAwD8bM8DBexGTZbcI6L0++U038hGJsZiASYAC26DDJobmg
X-Received: by 2002:a37:946:0:b0:67d:9d27:3c1 with SMTP id 67-20020a370946000000b0067d9d2703c1mr3910901qkj.476.1647544537914;
        Thu, 17 Mar 2022 12:15:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647544537; cv=none;
        d=google.com; s=arc-20160816;
        b=keTHBdEz5/LO9BIeZadZBK/Q/WIaan0JK5plD6OjBhUJwhW/4l+Zcq9bGcIVxW48SI
         EaUnAO0QZTMc/D61x1ZQhecmqRCsv6ILI4qbzuvyvZZaUB237Em1DHAo+CGWfgtjAjBl
         ERMfbio9p3jC43ykcn/n2XIot4LxA25BZ9Lu9czrqJC6GDD9zVRzMvB30aIyF21vsm6G
         wZLzaniBuRD762/2L/wdDQO0yeyRxw1S1P78C80lLkHtGmK4GpxwxJQTH8hs/uuAVE1o
         R+A8rr7Z9QmgVzmPOwl7v+p/mW/Fctb3SQOegVyOoAEoFSuUlbMKG0qGvKwRK+V0r96D
         47yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s742sJVnpGTicITXqnxkcIBl5qdfknCkT9D7WCzqXHk=;
        b=lZcFIUT714nCC+Y/o0Kw88vSp8hnTZpqyxOxSPc0bdgajdNtfFvwmgI9DFKq7SDha3
         t00HxWuZNJzN3oR8g0ZWrUg5GRaivxfy8RyRZ7OziPbeBelsUpEM1HNCH7YRiLfw/64q
         hV6lAI25Yc0kpOInjHJ2v7nGMMk56MLpAE2YPrY/DVBEQv6NsDVyJgk1/XeXOXpRKR1A
         V/3QIrcrvmcPXX+KGSco2w30LVIbTtW1xLOkjP262OMQUCSWR34HapKMzpMYtpf65yg8
         l8o2ODjYi8EAa+Yci5Ca/vlCSZuR5UasaY0GJpYYt7xHEaNda8/eNgY4wpuR8mrF1AfX
         fjGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Eg+B9y9U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r7-20020ad45767000000b004386a0cfcc0si1906616qvx.417.2022.03.17.12.15.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Mar 2022 12:15:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Eg+B9y9U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nUvaz-0004yb-Cq
	for alex.bennee@linaro.org; Thu, 17 Mar 2022 15:15:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUvaq-0004y0-79
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 15:15:28 -0400
Received: from [2607:f8b0:4864:20::b32] (port=42638
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUvan-0005UU-Nz
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 15:15:27 -0400
Received: by mail-yb1-xb32.google.com with SMTP id u103so11991036ybi.9
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 12:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s742sJVnpGTicITXqnxkcIBl5qdfknCkT9D7WCzqXHk=;
 b=Eg+B9y9U5mRhDAGBmZ35MPPnx40ne7+bsKguxFVP4Vb7RX2pTeotw0u457OXDGZLRs
 VMJA5e3Q6GQj7L3MaCyyw6I0MSE/dpJDiqH5tn0Fdn7yacNSxB+SVbC704FFDVxMU3TZ
 HbVhOEUbkEWwbaZlz9c/nuyvnugOsH/IwZqn1ZajMt2o7oO7Zobpf32Dv795icIrMIyw
 3hPGaosxjXngzJU1avQ/EZKTmoBabZukjjdLivwgItSc72IgwjSo4VHbOr7vwsXasuH4
 1kT5vzKiPAqZwj1qvlYhTWncg2B17HPGj59/6XxWIIeVWsGtPLzosEF8E5o3JesEQXYy
 kZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s742sJVnpGTicITXqnxkcIBl5qdfknCkT9D7WCzqXHk=;
 b=RQQlQrDBcytrC5yDW034IoZYR1mlXxVcs9EKMi7lpsAUUOS0qP3Lp0l56gnR2CsCpz
 Ajy5RwpjxCllxq5L3+H3/RpUTx3rOXJty2AAhHTEK85FQz1vA2pc33R8Y26xvjwRHT34
 DO+CnxPUjRBSrontawZxHAThHtjFmarlsWlHVSEIQG4vnUqhFJj84jZ9PbBch3jc26zj
 rf+Xsdt3GAn9GhjPgX9lj8YJZ4/hOUaxFzfcZJNjHpzjnU1q9y1X+TiQuRS8iysysvJZ
 jsuk5F2hhPezxPai1QdZSRUGCgf0+CQLOugSgOvlfULFnQmirtPfvDBggDLbOFwlFrsx
 uR3A==
X-Gm-Message-State: AOAM5317XYbVO0THUDYQx4T/OPoaGmu5onf2zu3LGjza849VzOKm/UO9
 6pdGYAM38JtjxvDJXK2QVXmR9ADq2g9f1rz/oMyHYA==
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr1827466ybq.67.1647544524668; Thu, 17 Mar
 2022 12:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220316164645.2303510-1-edgar.iglesias@gmail.com>
In-Reply-To: <20220316164645.2303510-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2022 19:15:13 +0000
Message-ID: <CAFEAcA9EYK7gS4bDToAXXD23uzhEazVeP--UGOrOX4wF3P-Fug@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] hw/arm: zynqmp: Add CRF and APU control to support
 PSCI
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@xilinx.com, luc@lmichel.fr, edgar.iglesias@amd.com,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: go5cpW11RdLJ

On Wed, 16 Mar 2022 at 16:46, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> This adds the necessary modeling to support some of our firmware
> tests at EL3 implementing PSCI (TBM). These are the test-cases
> that were previously relying on QEMU's builtin PSCI emulation.

I wouldn't usually take patches new devices after softfreeze, but
on the other hand this is addressing a regression, and it only
affects the xilinx boards. Do you have a view on whether we should put
this into 7.0 or defer to 7.1 ?

thanks
-- PMM
