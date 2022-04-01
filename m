Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp885666lfb;
        Fri, 1 Apr 2022 06:36:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZ5c6DJ26O5D6yuFIqZQIgBOtYD5TscSX8yVwk/6JOycU4qaQJ2xy5+9Oa+uItWcY71rmT
X-Received: by 2002:a05:622a:145:b0:2e1:b932:d019 with SMTP id v5-20020a05622a014500b002e1b932d019mr8550209qtw.46.1648820184920;
        Fri, 01 Apr 2022 06:36:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648820184; cv=none;
        d=google.com; s=arc-20160816;
        b=QWt+N0TPOfSTV0+gncV/Kr3L0C6nytS6cgESCIYcZJtpzocqeRyc+DHK4aJCw1oAtE
         nc72HT/j288w4qZXmtuX7+cl2vvSN7MfhU4/UOFdr+ds8sQ3hmy5jVjFzlHjbWVh6+QB
         8fw495Moc7DIds0AzWj4quGrvLnECbVfwEvSkRCq00KnOrbRK1+ZWk82sBVMptoIOyD2
         a2NmVeHPT4wGq3cRwfpMtPr2Jn0gKOQtbpeNkXUJUGPYMKaYJY7KhXBtSGAyYmaakDMv
         e01hXYNqWAPC0K5yVQefIgRNfHJD091uDp/pV4n8BXLB3X1bXjdO7asRSoCVpwxDy1sy
         tx6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ITyy9MXaeEOsnJnDyxk/ZxSyG8YY0CsdmowKVaSIqWM=;
        b=O5rcgi0ogfui7P5KRDBWfV5UtxQMu4P4Y14IsD+JJrRj7cHBnETI/gMxNChjexvZSW
         WjnlcTFm/ftYVUbhDWvp/G+MJe8cClOiejwg+thM4v3o/GAfdtfxarHHZOr0Y+Jq3tWh
         Z08GHLQCK5+G3EN5PzVxOhBjuaD2LL3W16riGNxiLwG7MNwsFFCr8VvH6DzUHuD5mOSR
         KM725ZWP8WyOSZLidlGqAbI2a1/ZOI8BD0Df1LvtBnS15K3A9BZZ0j0PdL7Y30EtNFlF
         M0OJzW56HQgbQmbCpQE6AHerkVo+D1lz/w0GaIwiwCZ82Gv+H1Yf1SqwP8OBukc7KEGx
         eXyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JiNoNc4n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14-20020ac853ce000000b002e1fbf3be48si947202qtq.57.2022.04.01.06.36.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Apr 2022 06:36:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JiNoNc4n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1naHRw-0002ML-E6
	for alex.bennee@linaro.org; Fri, 01 Apr 2022 09:36:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naHRR-0002Kq-7h
 for qemu-arm@nongnu.org; Fri, 01 Apr 2022 09:35:53 -0400
Received: from [2607:f8b0:4864:20::b35] (port=35514
 helo=mail-yb1-xb35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naHRO-0000kN-6c
 for qemu-arm@nongnu.org; Fri, 01 Apr 2022 09:35:51 -0400
Received: by mail-yb1-xb35.google.com with SMTP id o5so5087503ybe.2
 for <qemu-arm@nongnu.org>; Fri, 01 Apr 2022 06:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ITyy9MXaeEOsnJnDyxk/ZxSyG8YY0CsdmowKVaSIqWM=;
 b=JiNoNc4n4WgapQOJxCS5ypF2GBMG7EMqT4B2jzPyhkgc140/XQSkHpXZ9USPQS0SvH
 F+WVZ1WpK2ecfXKtZYhGtu8BjHxIj2KbUQthSPWupC6brwOBE1J3+hDGBD1wV+3O4dfO
 VOM5sDaPJQPCEWaXG7hLOtXw/y9JfbXekw1M0oJMIm0vJd+o1Hge5K1T73QdHyyWs2uj
 ffSODRDlIGM0BD9pQLfb4xW5IyiSux29GklMzD8KOprOIdlgfe++LQUJ/Rvv48pM9pGB
 8BteRhLEuF0dEEq7/1nAx8pFMhAS3tdraaWHcBcZo67r+LkUA/GhE7ZR5cMYmCxQ+oCz
 8/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ITyy9MXaeEOsnJnDyxk/ZxSyG8YY0CsdmowKVaSIqWM=;
 b=H0w/ZsiZoHo1X5ZZJAP9WDF1avokqY3N1DDqRzKPdCUwlS7AL6s7ZMrwGaatAFV3/P
 vo+gPvFlh73tweWO1S/h8XOxnvbSCwSA8isco4fVxqdL3QmvL5LS8zBekdLeHtqNRcs0
 AlPsJUvsU2n8WO6Ov81A5ZfxNN2q7ITbmueEDYcwsU/sgLL387FHcaco3Q8V61JwkZuE
 jKYF1s6gMB1Q+9mWqNpyQMZPxiFoboD488BE/E7uSpauWwERfAgSsjDKZ4WmyU3zjVN3
 M5XwfdlVul1b9wseYrdSHyTIWN9qefpV3FBcjv/gzGVjspv82TCTECLHmNrgW3hSUaX6
 ArbA==
X-Gm-Message-State: AOAM531Z92zgzSEZ0qIecjriL4ovgwDdYeJjJLvHj05hgz3cmupijH+E
 Cq4kZ/1xQdbOlmdDePrNca1/TBxkUhujcIpWyqlMVQ==
X-Received: by 2002:a05:6902:1502:b0:63d:4d6f:dc1 with SMTP id
 q2-20020a056902150200b0063d4d6f0dc1mr5211374ybu.140.1648820147643; Fri, 01
 Apr 2022 06:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220324181557.203805-1-zongyuan.li@smartx.com>
 <20220324181557.203805-4-zongyuan.li@smartx.com>
In-Reply-To: <20220324181557.203805-4-zongyuan.li@smartx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Apr 2022 14:35:36 +0100
Message-ID: <CAFEAcA_rMuWkobjBoFJdYQqc=qvyUPrq9_-W+TkrNdTf+iBgsw@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] hw/intc/exynos4210: replace 'qemu_split_irq' in
 combiner and gic
To: Zongyuan Li <zongyuan.li@smartx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "open list:Exynos" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: td9GIeOnDApv

On Thu, 24 Mar 2022 at 18:16, Zongyuan Li <zongyuan.li@smartx.com> wrote:
>
> Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
> ---
>  hw/arm/exynos4210.c           | 26 +++++++++++
>  hw/intc/exynos4210_combiner.c | 81 +++++++++++++++++++++++++++--------
>  hw/intc/exynos4210_gic.c      | 36 +++++++++++++---
>  include/hw/arm/exynos4210.h   | 11 ++---
>  include/hw/core/split-irq.h   |  5 +--
>  5 files changed, 126 insertions(+), 33 deletions(-)

Looking at this patch, I think it's ended up quite complicated
because the exynos4210 code as it stands today is doing
some rather odd things with interrupts. I'm going to have a
go at some refactoring patches which try to clean some of that
oddness up into code more like what we'd write today, which
should make getting rid of the use of qemu_split_irq() a bit easier.

thanks
-- PMM
