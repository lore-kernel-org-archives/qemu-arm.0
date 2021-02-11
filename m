Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp2180468lfc;
        Thu, 11 Feb 2021 03:37:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0SG2xsVLcSGsUX1c40a/th6+RhVebspg/fPLRehG1KLg2nXcJS1ltcZh4EvnA66N1ooTW
X-Received: by 2002:a25:25d8:: with SMTP id l207mr11481351ybl.68.1613043457945;
        Thu, 11 Feb 2021 03:37:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613043457; cv=none;
        d=google.com; s=arc-20160816;
        b=M/84wL5RKuwSR1DMWDpldwcNEXNk4zkEXEGYQTp+gf1Kzfv88xW/OSEf41XqAtAdTE
         Tz1+vRSCZfGGz+TiNbWW7WcZyzPIdpUrUUyH4HWTPWiz6AU3tzGNw/d4BhgSMvJ5Tgke
         BZz7QWPPQDYzc2lJR9mw5u7n+dSnGQNls1sb19g3pfkC78E6Cw60UNSUqMnOoOXpgFBY
         DZ8kmzXczc0DmC9SRdh+W+lLe3h9OH0GzRGvxlDNZmydNjjX33e2owBI2EUORRK6pICX
         N0+bi724cDf0qt3L6nLOOyyhoGOy/KHRj9vJt1NyvHxRbP6T2CalW3eKkQWhDSHdScic
         BSAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xyRTWz4qZDobwfeQvAdCQPdHz6p1m+56zbWZnrK8PDE=;
        b=XcxO4vxjUm8yxVXbL9e8yJm3hVtLASml3mLcNRqzu7OSpX3sT1YkgresQ9dD11MucJ
         vpmAaWamBaCFSZGApWZ5U8/XvzCSe1wElzKnjTxCiy1dUYGcWygqShod4ORK+IrmgmH/
         iu0wwFt90+lcuhVgn6c04jAtk1+GIJC0/24okfMfoHaTa8af8QMTAVnQ4Xf+JrOoCtpA
         OHGT+u3LHUSIlCigsGPAaUp7ek/xZp8BNE1ih4xaAXrWUuPxAFirbEhwWfFYh6rgLOTo
         crk0IhzBNLIP69n2ZZe0Qs88uyMzj9XT2YLnr9Jwfr32PFNTfE91NpCJoZQ9rcabZ2fQ
         LSyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d+swLS7W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f71si4728880yba.398.2021.02.11.03.37.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Feb 2021 03:37:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d+swLS7W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lAAHx-0005xE-Av
	for alex.bennee@linaro.org; Thu, 11 Feb 2021 06:37:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAAHL-0005fn-Si
 for qemu-arm@nongnu.org; Thu, 11 Feb 2021 06:36:59 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:35328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAAHF-0007F7-CU
 for qemu-arm@nongnu.org; Thu, 11 Feb 2021 06:36:59 -0500
Received: by mail-ed1-x52b.google.com with SMTP id g10so6623456eds.2
 for <qemu-arm@nongnu.org>; Thu, 11 Feb 2021 03:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xyRTWz4qZDobwfeQvAdCQPdHz6p1m+56zbWZnrK8PDE=;
 b=d+swLS7W/iJM897yQ59PM10M+PnbYLHlvV2ctftY5dhajV0UGxkZL5+I4ObYdIBccO
 E7ri66CCw5DDT0QmuOgIS3KqfUDLRVA18h8yR3j1mbGSraZQCrfaF7Wzn0svbnnKERTt
 6BzX5baUGIqcwxuZGDJ6V1Yg+9gq6/igfy9ltAnCw38W6F3MC74pLmpY740SAP7y2het
 57bff6DoQkQo7B9ScPLn4j8ZU0k5dpHyjbNGSqtuQ5AyrTnPM4zy6ShK5LB9FFMLasDg
 81CYibzLFdNAu3jdUReeIprVh+jYcP/ZIxLsBYkynKCqxoSFGG0MvT6sATMrv8gTlTAz
 Q7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xyRTWz4qZDobwfeQvAdCQPdHz6p1m+56zbWZnrK8PDE=;
 b=pM9A23d9KJP+dcG4rjUB9aWDhrmJrezKgkSLjCB3amHFkxshbkTXM0yczqT2qar+Ib
 0R9ANMd0QzLKiOq5sU9qoYcShBgy2hZ8ak69HFdB7HlhjNvaOkWDeZ/1KIrQeau5tV3g
 4WaK+DkO3zVIbHzxFhFe7gX5eG5NSM0KWGBT+tKx6SvvxuMYe0rn30p1k5rMTVP5kjmU
 0UL4SE5FEW94DV1hSNpgCU/NOY6s8LuJxoAwnn2A2YfhSoMgusm5p5t6w+dMfHuCumJ6
 V1nSBsME6FwKtP6mtAb1K+G1ONiulbiriHbZmZq72SQzcZct2QtV6n4Q9ccRaEAB3PV7
 kI1w==
X-Gm-Message-State: AOAM532SCKpSkboqpejUUHfqSV7yzOwCsQY7F1JnGfrcCelvCulSyt39
 5FslzBQDHDgEwHketN+su48LAexuh4L/UvDxwtN6RA==
X-Received: by 2002:a50:e80d:: with SMTP id e13mr7758253edn.251.1613043412018; 
 Thu, 11 Feb 2021 03:36:52 -0800 (PST)
MIME-Version: 1.0
References: <20210210142048.3125878-1-edgar.iglesias@gmail.com>
In-Reply-To: <20210210142048.3125878-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Feb 2021 11:36:40 +0000
Message-ID: <CAFEAcA-EPLtmx1-x3BJYVFzQWJqW5uznZVXYi-3JJMb5FmM3fQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] hw/arm: versal: Use nr_apu_cpus in favor of hard
 coding 2
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: Francisco Eduardo Iglesias <figlesia@xilinx.com>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joe Komlodi <komlodi@xilinx.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fizmFHChCQCz

On Wed, 10 Feb 2021 at 14:20, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> This is a minor clean-up making it a little easier to play around
> with different CPU configurations.
>
> Cheers,
> Edgar
>
> Edgar E. Iglesias (1):
>   hw/arm: versal: Use nr_apu_cpus in favor of hard coding 2

Applied to target-arm.next, thanks.
PS: you don't really need a cover letter for single patches...

-- PMM
