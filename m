Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2570917lfm;
        Tue, 16 Jun 2020 05:30:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDfvUZLJ5IJr3pnRV8P6zvTCFTGiG4Vsyuj989gyHJ0iL1ujkaMbONI24i2QoEM8Er+nEs
X-Received: by 2002:a37:9f09:: with SMTP id i9mr20367690qke.60.1592310616274;
        Tue, 16 Jun 2020 05:30:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592310616; cv=none;
        d=google.com; s=arc-20160816;
        b=vSQYUnUinUMvklOXbgMA/ISFNE9IXab4R6SP90AP9OshJo4TXMQZiEifCNWoNhYEck
         a0YX+CZKeISXcDXGkndK6R/Nl/0rxzTf5eQrjCG0xAU3cSqh0DsSBL8/R1TeDG9Oobl0
         NPAoqmwclMaJR9iwXfGaLIIp+E7VR6ZbCRo5DmcPFc5ILOKFWV9DXq1q2UimWU+ThO/r
         y/FX6m9NtWvCX5SRUdtJ8FeUPrVWRUFtym8258AmkadXbEuZtH2R7oNYRGoWzIwdB+Di
         xG43mEh/49FD1NqACBvjs5NaST19WFlCdI6tsj71FLMaJZaMaUy+pxDQt0Dw3rmhMjLo
         mdRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Ghojns6lHjJyX0GLkkBuC1xLxAtJ6P64NWuKrqAH86c=;
        b=r1iEHtNeVbgWeejKnfmE7x+k8LYGIPqG0AdmKYdXuvZb6enAKTE2GPxZCykiCdOlZz
         4OJXbpEfzhuU/PAw5VNqiIhaQWMqrCmCkGDtCp+4iquTjL+wgehcBQFleATwkkvWop/V
         1V2cdV969uf5oFWBmUHTsXouc0CU1Bm3+p8OpctG5YP2V9sFO+HJAvst5bEmPhqemwnZ
         zi5UhqwmPjKldcGmiNLYaMl2/7r61/A9i/zzo2r+je0DkRbPpyWrHFY7poLDbNw3nTAM
         XtagoUwJhawEE6BFrVwUoab0cNQzGeJPogtULB2hG+rKgScyl35g+pNnaOgyqW4aG4Z5
         fqYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TFrXlGuT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g1si9658568qtp.280.2020.06.16.05.30.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 05:30:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TFrXlGuT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlAjH-0008LN-Ke
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 08:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlAj2-0008JY-Rr
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 08:30:00 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:39339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlAj0-0004VH-FO
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 08:30:00 -0400
Received: by mail-oi1-x243.google.com with SMTP id d67so19029591oig.6
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2020 05:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ghojns6lHjJyX0GLkkBuC1xLxAtJ6P64NWuKrqAH86c=;
 b=TFrXlGuTJ8P1eqbXmekuumISBs8R/F+RT/Whs/V0dVrMxrnDS4RfOULCYda12x/sHw
 ZUJsTxq8jNGcKtQLYjHU42h4Z58Jqxl7yTuKqfgU6w/sluvQVgolguAclT8rCZTEzTlw
 KcLhGIMubahzTdUvcXP9L3vWwiRNkm4SQk4C7n5TkOy0ckd6LvLdz6p9QyubLK8A5AW/
 3MdTQly8xjeivxU6Re0oDzbf7KBqAcbTjRnTIB7rKgA/RLhq6Hga0C0LpxRsUbKYY6/5
 iKLjjJyLhUK0HjM1yRROwEMk6D04cBAHPwiZG7nBfBcioUIqe1Xq9yf0NgTlf1JdwXaD
 HCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ghojns6lHjJyX0GLkkBuC1xLxAtJ6P64NWuKrqAH86c=;
 b=q9wSOO3BAhI5XNxvl1SyC59cbKhcEVEubJbuSW2cvuBSyOcamWlcX6NDuaZlTf7eSM
 yNugupCCxUu65/16OfkqXw09iM7Avgl/xh1XSRL0zTku0LX4C6Vhk1qTjBxfP/xvTAy9
 bxoDNscgRO5mog5n8emXrIDUedAxcyVieKOAlZCVw8YJugq9ryuITSBbGofv5h4p4RBg
 wucUlgRKEZ+AqRdrmO4m0Dc7oah+JMM75bD9ES1sO0F+o83KID57oRtIsRPuNq9qZ0cN
 ZPleQQQWalvmAnBNDzMnDMOfHetr29G7LdFxkb+M4Hjievv7/o6i0wzhgTbcc8EaKDnz
 xGGw==
X-Gm-Message-State: AOAM532TDn22Il5dU2CCetOa+3+RbDzY4Ms7xsRoan8a/adI7JX2hb9T
 Y51xQ32WRnSHdFSnWs7XVO+hM0biKGPW9gBCOSTgzQ==
X-Received: by 2002:aca:568c:: with SMTP id k134mr2911722oib.48.1592310596963; 
 Tue, 16 Jun 2020 05:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200616063157.16389-1-f4bug@amsat.org>
 <20200616063157.16389-8-f4bug@amsat.org>
 <CAFEAcA8c3QVD=PcfMOXn720E0ExSdV+mb3qoA61AFrFVstFHHw@mail.gmail.com>
 <84c3ce87-fefd-5741-7588-7a8ca12fde4c@amsat.org>
In-Reply-To: <84c3ce87-fefd-5741-7588-7a8ca12fde4c@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2020 13:29:45 +0100
Message-ID: <CAFEAcA_GuCQRuwAgbQfHRKh732Kfzwj-zxX48tjBBnWCBjKLnQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] hw/misc/mps2-fpgaio: Implement push-buttons
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
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
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LiBGbIaBP/4y

On Tue, 16 Jun 2020 at 11:40, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> On 6/16/20 12:27 PM, Peter Maydell wrote:
> > This change seems kind of pointless unless these GPIO lines are
> > actually wired up to something.
>
> Yes, I should have kept it out of this series, or documented
> better the goal in the cover.
>
> I'm setting the roots to motivate a team of developers to
> work on a visualization of the MPS2 board. The push-button is
> supported by Zephyr, so the the idea is the visualizer generates
> QMP GPIO event to be processed such in pca9552_set_led(), and
> interact with the guest firmware.

I think that having a framework so we can better model this kind
of push button / LED / similar thing is definitely good. I just
think we need to review it at the framework level first -- it
might turn out that actually the right way to wire up the push
button to the UI framework isn't with a GPIO wire at all.
Similarly with the other patchset that sends QMP events for
LEDs -- that also seems like it's half of a design and a bit
awkward to review without the context for what it connects to.

thanks
-- PMM
