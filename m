Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1223255lfb;
        Fri, 3 Sep 2021 05:10:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfPNnt28nDsBZFmdPjasqkRZo2z1zhCCZU+3bO3e7o9lOCswwcueX9qPcqchEb0XDie0R/
X-Received: by 2002:adf:f7c2:: with SMTP id a2mr3816816wrq.58.1630671055212;
        Fri, 03 Sep 2021 05:10:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630671055; cv=none;
        d=google.com; s=arc-20160816;
        b=nI2i+VuD50vwGLy/qWIlcaRWSnzsYEGDVqXaHazS5lo83qWUzvOVU0ori+EEBTsS02
         cTFbSbdDls6jDqelenoTLy45KgL7vDfozbiTsqsJOIbT/K4FYdJBhxfBztdD9kCKVPsU
         11YLfzPcBliUXEg4ZmjvVFC+3OIHLbeE2t8RwS/uCOjz6hvXbF8L8d9nZtcpRlwi2j4k
         z2uQYBtliLcK1DxXC97hwEv3B2qwY+y/y5jPdyq/8tekYZXyCWDi0Gviqowq99xuR/y7
         MLVkalVBdS7NTyJe+8tztt3JRqLDnWv8NIBFlOvOePMPH6PzgYDKylOoq9S3yIJwGt6f
         W4Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bqszt8jNx5SH2lt7QhlW3d0HG941S174E5V0+QJAyYk=;
        b=pEIRCoLCaqHSz4OodYC6z2dPI001je8AhrBSc6DH+0AiaP1kY2H8IKnZgs+X0SR0lg
         gDJLGZVNzpRyi4RKMaJZQC8TPKXkGm8MJqJA4I34M3qVJg0uXfXpP+4z4T0b87ta0GBL
         +/Q8aLSq9AEB8w+9gD3ufrr1kwySYZM9iSskpKjEUH62u7uP5JNEms2tBC8Gia9Mu5ll
         VpzZqRJyLb+hLb/RbbSjDMaCOCvCzIJQee3z40RLO8r7jPqHzJHY/i2zpF61YUJ+ZVnh
         Asad8LekR7f8UTEBHFwUGpkSlcTybCZp34WAaaXaVd4zRh8Kcgz+A5TCLXY+YK9eQ4iA
         KA4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="E9cHtOU/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10si4967567wrh.178.2021.09.03.05.10.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 05:10:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="E9cHtOU/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mM822-0007gy-8n
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 08:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mM81e-0007ce-S1
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 08:10:30 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mM81d-0000Xj-Et
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 08:10:30 -0400
Received: by mail-wr1-x436.google.com with SMTP id z4so7923441wrr.6
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 05:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bqszt8jNx5SH2lt7QhlW3d0HG941S174E5V0+QJAyYk=;
 b=E9cHtOU/+lwDaR7+6KJZS45eOTRp5H7WWcVXsBKKKCrcm4Yj1xYTgqoDoyeV7r9jOF
 2W5HR2uuqH3OR8/gmTsCUkx9Zajeo8HzPiWitf4ryXrV6XNNXHu5UhyRt8I1H9LgAfED
 GTC8TRVnqF/Y/7lk07q0JYfQCWNSOKsJ/OakTPbPpmSZCT3yMEDoeH3WCI2eUzFlSzyW
 fOZ7hxiSNs9bU9ZaZDYhUmlZtS+zuM/zzhxt5YXO1F8ktKtp065jS3mwgf2vExV+7Iik
 S4RxlGcZs4ek/T8EQq5UicKC9d/Mx4r0oLEaFxBNr1BV0r9cSpEfwyWqFoF2GiArejyW
 Tvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bqszt8jNx5SH2lt7QhlW3d0HG941S174E5V0+QJAyYk=;
 b=fnDSESTO1v9gD1owaMOg/2Ma4/Vapmr26H48c7SofPufjgAiWZsfqFWJWhZCvrzK8z
 XxkynGODD/1n5i7eeRcCR9OVz+5rcVahaNPfXZOtsEJkFVXEgZYtmLmfSXnvFh44mGnw
 zNb12VeFKtj5PbIKtQIWOAiZ5+6gks1LpglCbfzXJdxKhbgIlj7GdJaFE4Kkcqa8dmS1
 gMcz8iASAeNbsWVNAHZREDmHftNiV3X1DapSSSSvYis0i/Ba6o4z8aznEJkEtTa0FmjB
 2lqFXpIhzE8/wmG5rH1bKH1dzv8V+DqRYzcpLS/DwXEVyw87+Bc4nfDUKC2cFTShHrvS
 jlyQ==
X-Gm-Message-State: AOAM531mjq3UYbpvIkGa6v4ryPNK7dWAmr0+RZwxOJ9hjGNPLS/ZMKhg
 BBYDBurBnxUymR/aG76hEe9uf1pLkqEaErY4Y4KoZg==
X-Received: by 2002:adf:fb91:: with SMTP id a17mr3567787wrr.376.1630671028025; 
 Fri, 03 Sep 2021 05:10:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
 <20210812165341.40784-8-shashi.mallela@linaro.org>
 <CAFEAcA9WVu+kjfCWwfGQV00yKgmdFDCSUpxNOu1BEBM3AZCWXg@mail.gmail.com>
 <20210902124258.mqjhx7lqqvkczf6a@leviathan>
 <CAFEAcA-HC1=arh_4ysPv2L1JyT6sA9n_1aqJv__1Z7+09kYxiA@mail.gmail.com>
 <20210903120125.meyyevqxphhumubp@leviathan>
In-Reply-To: <20210903120125.meyyevqxphhumubp@leviathan>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Sep 2021 13:09:39 +0100
Message-ID: <CAFEAcA_hD2Gw6f6VpKdo+VJF2-uDD=8WK0KOz6Muj14XgyitQg@mail.gmail.com>
Subject: Re: [PATCH v8 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 narmstrong@baylibre.com, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XAimoLZR+OhJ

On Fri, 3 Sept 2021 at 13:01, Leif Lindholm <leif@nuviainc.com> wrote:
> On Thu, Sep 02, 2021 at 13:51:26 +0100, Peter Maydell wrote:
> > How does guest software on this board figure out the memory
> > layout ? Is there a mechanism for telling it "this is version 2
> > of this board" ?
>
> Not currently. Aiming to look like most SBSA platforms, it is
> hard-wired, and firmware passes that information to the os.
>
> This is the kind of thing I eventually want to do using a PV-model
> SCP. As a stop-gap, we could push it through the DT, like we do for
> cpus and memory?

That's up to you, I guess. You could alternatively have some
sort of "board ID" register that the firmware reads ?

-- PMM
