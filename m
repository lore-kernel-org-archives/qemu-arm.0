Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp3935768lfc;
        Mon, 7 Sep 2020 10:59:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0igtk838U/LBQfdkic88EA9RR9SbOzne1gfis9foqDHgcmU/7ZH1fDqO6EjlWUMvxTzbT
X-Received: by 2002:a25:3416:: with SMTP id b22mr25764771yba.361.1599501575734;
        Mon, 07 Sep 2020 10:59:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599501575; cv=none;
        d=google.com; s=arc-20160816;
        b=MQB3imKLESu+LRlk11SPZEerfeFpWWwq0P3Z9JmhcT73wkVRMpyYgS6ysilQbpg6Vp
         //5cJkyoMnbmYi0Oh40WA82HljGpjnmTp8KVfPMTFtGEeY4GCoYA/OzC+BOhG/9dhS3l
         KeShQN9sAEKAhBIf/kJI+mR64htisW6CJZjUGBj53mSh8nGpwpquxmkbGltsAWIqVuuv
         c+2/imUtmYCtPZ9Ib+vhOlGFK3SxFkd+k7jVXoE/yiKtUMYYmIw+o3Hgd/BQIfBWYmkM
         w8dPdD/8OGrbDgYWZw3NgFiYy49+MoyOytT/Y2pwBze+vQheG538vmEXzk9+jEoRz5fd
         +Jqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=j0UWUFPjLM4MnSQ8H+/sP1y/6evos5PJniyN7PnSmZE=;
        b=dsm37xfqY+UI9B4lzK6Ne+vvMg+/rFrG/nk9+LwqipftfW8iGl8/FAJUN/75MpX9sl
         4xzWPWkmwjOBumTGjToIjCSLfv1PhXbV32Tvh0MGOZZpkHu57uDHDJAu0CZRWcD2sicC
         o55soNDLqpN2a6Gbj4Jtd1iJ5fHwN2YDQEiprLWik3Qn1p59bv8//fwNYtvzZdxQXPxB
         I1L/x33Z4KtC1P7wD5bG4t0+hgboGMzRCMIJwBTa5oRC5sO6eBN0DoM2fJLKyjycyrJF
         oe2XLrKqw6SPIRb1Kyn026Kq2V6ld5hz/KyIebLpKi33TuTZGiJ6faQd5A2H5bUAiamS
         V3Bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=B2qr5LfJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11si4343285ybc.403.2020.09.07.10.59.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Sep 2020 10:59:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=B2qr5LfJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:40850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFLQV-0001Kt-4x
	for alex.bennee@linaro.org; Mon, 07 Sep 2020 13:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1kFLPt-0000u8-Nx
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 13:58:57 -0400
Received: from mail-vk1-xa44.google.com ([2607:f8b0:4864:20::a44]:46823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1kFLPr-0001WM-LG
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 13:58:57 -0400
Received: by mail-vk1-xa44.google.com with SMTP id d2so978352vkd.13
 for <qemu-devel@nongnu.org>; Mon, 07 Sep 2020 10:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=j0UWUFPjLM4MnSQ8H+/sP1y/6evos5PJniyN7PnSmZE=;
 b=B2qr5LfJw22k/9xQLMxCwVV7hq2QWicDtT04aJ7DdxF3auIPvZHSy/Xlno3QEFAeQO
 dTstwj/bC+u0I78Q4hpQHtOgTJxYaD1bWXCGejqUAxmYMMeXJloCRkv9CWykzOXwJ6Ps
 1U+pERQbA7dyj0M8ZQsdh+URoHoZ506kdHG/oVW5HlBWYu5Hi6slUYbkFl5Xa/R7EwCO
 c6Ceahe6zDJIQDpqwKwm1oqacxtjj2QAm0e30PW/czXYomg7tcIM4c9e8eGHlwf8trhE
 hW1GMWlUwh61cp4cZTODKXimHeVhnFvKNiTAyJz1XBqWtcsO4UIez499qL0TpmQ9qOzQ
 reow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=j0UWUFPjLM4MnSQ8H+/sP1y/6evos5PJniyN7PnSmZE=;
 b=nBAEq25F5xQGAsUGXHI4wkvbB+kC8ZvIX8P0pz3G4c7or53GYXn5CYLKdJA2qgs64E
 6YDbmUpPIQlCbOTDKv/tWpukdRmVwIVWdh8+xurMcEY8pTBXPF6r1MdK6qDqBF92M7nh
 FQbFo+K84w/qraHbvJyRgBM1sWw8cMrW15+XbrVNqyEgLmeuzX9sPOZAE3Ga6nBr97jg
 Oyuzs3TlFi/EJFoSArZkg9V3pCEXHThEi74ClMxXMXM6ognY82yaJRJuvEp8pz2ltOI+
 dkTX4FJM0Y415xeSeVGz927+g5Uibr8pUIkSZX8rS/LP7huvknK8fjd93sucYkqeehTI
 vnow==
X-Gm-Message-State: AOAM5337VguEf7MUb+qCfJtmZxgh126rR6VNQfjgaVjUUdVcoWN3qkgf
 o3oaA0jPgs/JMKQrY7k8HVqKt6/OcYaVQrHADkXKAA==
X-Received: by 2002:a1f:3612:: with SMTP id d18mr13193103vka.21.1599501533159; 
 Mon, 07 Sep 2020 10:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200825001711.1340443-1-hskinnemoen@google.com>
 <20200825001711.1340443-3-hskinnemoen@google.com>
 <e6187a7b-afc0-425a-de91-ea4818f7f876@amsat.org>
 <CAFQmdRbirDn4ao-B0UHHn-QFKfdeRzBR1dXTmUx_WZikfSB1tg@mail.gmail.com>
 <CAFQmdRbSgVTGgN2MV98wfxWSicrtokUCKKBU2knvVrimn2FWxA@mail.gmail.com>
 <8bd0d21c-d511-d814-da27-92114c47cfcc@amsat.org>
In-Reply-To: <8bd0d21c-d511-d814-da27-92114c47cfcc@amsat.org>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Mon, 7 Sep 2020 10:58:41 -0700
Message-ID: <CAFQmdRZSP8F1=pLEdt5CM-qVvUWMo+Ap4yWGN96WzUshxikBqQ@mail.gmail.com>
Subject: Re: [PATCH v8 02/14] hw/misc: Add NPCM7xx Clock Controller device
 model
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>, 
 CS20 KFTing <kfting@nuvoton.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a44;
 envelope-from=hskinnemoen@google.com; helo=mail-vk1-xa44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PKqzI7va5cE8

On Mon, Sep 7, 2020 at 6:40 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On 9/5/20 12:38 AM, Havard Skinnemoen wrote:
> > On Fri, Sep 4, 2020 at 3:02 PM Havard Skinnemoen <hskinnemoen@google.co=
m> wrote:
> >>
> >> On Fri, Sep 4, 2020 at 2:32 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org> wrote:
> >>>
> >>> On 8/25/20 2:16 AM, Havard Skinnemoen via wrote:
> >>>> Enough functionality to boot the Linux kernel has been implemented. =
This
> >>>> includes:
> >>>>
> >>>>   - Correct power-on reset values so the various clock rates can be
> >>>>     accurately calculated.
> >>>>   - Clock enables stick around when written.
> >>>>
> >>>> In addition, a best effort attempt to implement SECCNT and CNTR25M w=
as
> >>>> made even though I don't think the kernel needs them.
> >>>>
> >>>> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> >>>> Reviewed-by: Joel Stanley <joel@jms.id.au>
> >>>> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >>>> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
> >>>> ---
> [...]
> >>>> +static void npcm7xx_clk_write(void *opaque, hwaddr offset,
> >>>> +                              uint64_t v, unsigned size)
> >>>> +{
> >>>> +    uint32_t reg =3D offset / sizeof(uint32_t);
> >>>> +    NPCM7xxCLKState *s =3D opaque;
> >>>> +    uint32_t value =3D v;
> >>>> +
> >>>> +    trace_npcm7xx_clk_write(offset, value);
> >>>> +
> >>>> +    if (reg >=3D NPCM7XX_CLK_NR_REGS) {
> >>>> +        qemu_log_mask(LOG_GUEST_ERROR,
> >>>> +                      "%s: offset 0x%04" HWADDR_PRIx " out of range=
\n",
> >>>> +                      __func__, offset);
> >>>> +        return;
> >>>> +    }
> >>>> +
> >>>> +    switch (reg) {
> >>>> +    case NPCM7XX_CLK_SWRSTR:
> >>>> +        qemu_log_mask(LOG_UNIMP, "%s: SW reset not implemented: 0x%=
02x\n",
> >>>> +                      __func__, value);
> >>>
> >>> Isn't this sufficient?
> >>>
> >>>            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> >>
> >> It's not quite that easy; this register holds 4 bits, each of which
> >> maps to a separate register which defines the modules to reset. It's
> >> not that hard, but a little more than I'd like to add to the series at
> >> this point. I'll send a followup patch once the initial series is in.
> >
> > Actually, I'm not sure if this would have any effect on being able to
> > reboot. Running with -d unimp shows:
> >
> > reboot: Restarting system
> > npcm7xx_timer_write: WTCR write not implemented: 0x00000083
> > Reboot failed -- System halted
> >
> > So we need to implement watchdog support, which is something we were
> > planning to do fairly soon.
>
> Well this seems a guest implementation decision to prefer
> wait the watchdog to kick (hard reset?) rather than doing
> a soft reset.
>
> Two different issues IMO. Anyway this is certainly not
> blocking your series to get merged.

I agree, we need to implement both. I just wanted to note that
implementing SWRST alone may not be enough to make reboots work with
the current image. The SW reset registers are actually very similar to
the WD reset registers, so implementing WD reset should make it almost
trivial to add SW reset as well.

It looks like the kernel has a driver that can use SW reset to reboot,
but the DT is missing a property needed to set up the restart handler.

https://elixir.bootlin.com/linux/v5.8.7/source/drivers/reset/reset-npcm.c#L=
269

Havard
