Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97842CF45C0
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 18:02:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfMEc-0002WS-Ro; Mon, 12 Jan 2026 13:01:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vfMEF-0002IZ-PE
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 13:01:35 -0500
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vfMEB-0007YC-MW
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 13:01:23 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-78f89501423so59845777b3.1
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 10:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768240877; x=1768845677; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xbISUAdfS7mo5moSMKSs2utarK9gYflYXVaNuqHzwhQ=;
 b=G0Qvt3qKp+puPjWWwv2ePg2tPeOagzAqyF2vlY4GQCUtRYwukk3boSEf8dpkBjatAe
 HzBkofi6EhZ4du6xVjTycl11HcoyvtcXYHsVtsLZlBCWNRewafBi1DYPA3gJSxOVVasA
 nmW4TwKRUkaiuqc3CrRmQAVglmegfY4EHZmd4C+8dGqiDTsY3RM+92/ofMN3OQG8hxdA
 IA+n9xaNE7M2RuCU9njZaY1X+aEmzpiMTnNtFgto+txJqkiTOBnHbQZGB3aeS062Zgeb
 zWgqoRP1dN95RZn6qWI93oN09XpV7rzHJiYpTM+w6PE70a32mUCVvvmEig0QoGim9pev
 fbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768240877; x=1768845677;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xbISUAdfS7mo5moSMKSs2utarK9gYflYXVaNuqHzwhQ=;
 b=tKraWMYksQKNVQNQ80P2dujCHSQi968adryXbqgwtfNV+uwDP3dOVnGwBvT9Q92TOJ
 NFpykzjBf16h20R84NfKfwcYtEaomrt20jTq1CP6jJkzrvc8wjHkv++l3UM/BwygErGA
 U5vltMBAN8t4gb35xhpNUbQ74GwD0z8h9ZKgMK7JiW1eaQtk+JgXBReQpeEUwLeKLfd/
 WsS6WC9LjPjgGyOGw/CP7zQkHQS49dbpGfnAOISRf8bcgEkAlmIR319PkB2DL0oaFuPY
 TK2rrRVjPAz3Kt1FlVMJaSkGf5ZPTRUNBZmL1MLbZWsFneGbOoQz88bOCALfTRWAcoa1
 kfNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsu4zuzsXLnchIFKh9pxmbz4HbHMM0CrQlrXsa0CNbtN/gDy6hchqdDrUiBKVpwacNALAOoDZu0Q==@nongnu.org
X-Gm-Message-State: AOJu0Yw9OVQWE2uDSaw0SqWH8gG0SZGRZvz8gDRFiJjVYHSSfXPzVuLh
 bensr15dLmwVIKlx9jHWhPULpk9lHSoxaFzlZfioeQ7BxkJAyh7tYx4Bs25WGC4NZavZqKwFD11
 r07vrTfyaoXt7BKRcTh1BYBnTigZF9/eu+bbauSMphg==
X-Gm-Gg: AY/fxX7POXc8aKCLYSitxVRXrxcd5Luk5UYoSDLF/UAhbbXLOGyppaVLteyyMzR21R7
 F3VrU1YyZRzN+61BiHPoPtq5A3MTSi5AZuJCwXND5KxUcvadgpVF/gdvx5yDL+HKDyt7wbSqtjm
 DUGpuELAVkyEwNoZ8ZsesGFOBk4kdzzqR9bkHB8sXPF4DRZjNScOOLFaDwTKEc3Len9fxdaAxN7
 kurziuhYsvt+2CzmeI6ap7rBt/cS26n0GZkANI7Ka8/mTyJxHHQtDVWrOez37W3P4Kw0xVb037U
 91IZXc5Avss9kOmdB6boBAs=
X-Google-Smtp-Source: AGHT+IEZwWhr9ukILCIAS3V07tnx1/wr9CETCoEksdVTnr2K8KAu5rADCNep8ZeqHC8NARPQ9yGKocowyH0LiAlz4aQ=
X-Received: by 2002:a05:690e:bc7:b0:646:9ddf:5f2 with SMTP id
 956f58d0204a3-648f62abb2emr198964d50.31.1768240877061; Mon, 12 Jan 2026
 10:01:17 -0800 (PST)
MIME-Version: 1.0
References: <20251223223712.17047-1-ruslichenko.r@gmail.com>
 <CAFEAcA_SSnwo0N8j_zz4jRrzcewAiRaVCENj1_gzdBVCthNVFg@mail.gmail.com>
 <CAN-aV1E3Od-ZNy=SFK4XSQfcAFBr=953Vwujne=qmKfxNt5bcw@mail.gmail.com>
In-Reply-To: <CAN-aV1E3Od-ZNy=SFK4XSQfcAFBr=953Vwujne=qmKfxNt5bcw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Jan 2026 18:01:04 +0000
X-Gm-Features: AZwV_Qgc_zhneCjXmwbCq_weyoB6qUou9o2xvMEgTQvuLfDktcytUMecjI4XTeM
Message-ID: <CAFEAcA8eTRjviWfw64Frj7NCred5HRapZALMsq3AfLUaHMj7Tw@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/arm/smmuv3: add support for combined irq
To: Ruslan <ruslichenko.r@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Eric Auger <eric.auger@redhat.com>,
 Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 29 Dec 2025 at 21:21, Ruslan <ruslichenko.r@gmail.com> wrote:
>
> On Sun, Dec 28, 2025 at 6:08=E2=80=AFPM Peter Maydell <peter.maydell@lina=
ro.org> wrote:
> >
> > On Tue, 23 Dec 2025 at 22:37, Ruslan Ruslichenko
> > <ruslichenko.r@gmail.com> wrote:
> > >
> > > From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
> > >
> > > Some platforms use combined irq type, in which case
> > > only single interrupt line is used, instead of 4
> > > different irq's for each type.
> > >
> > > Add emulation support for combined irq mode.
> > >
> > > This mode can be selected by platforms by setting
> > > 'combined_irq' property.
> >
> > Which platforms?
>
> As I can see in ML Linux there is currently at least one platform
> using such mode:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/a=
rch/arm64/boot/dts/xilinx/versal-net.dtsi#n1010
>
> In our case we are working to emulate Renesas R-Car X5H SoC, which may
> also use this configuration.
>
> >
> > The other way to approach this would be to have the
> > relevant SoC/platform models create a TYPE_OR_IRQ
> > or gate to wire the interrupts together.
>
> Thank you for suggestion! We will try to implement this approach instead.

It looks to me as if at least for Arm's SMMU implementations
they only have the multiple-interrupt outputs:
https://developer.arm.com/documentation/101542/0001/Signal-descriptions/TCU=
-signals/TCU-interrupt-signals?lang=3Den

and so an SoC which has a "combined" interrupt is presumably
doing it in the SoC with an OR gate or similar logic.

If the SoC you're modelling uses an SMMU implementation
where the SMMU itself provides the combined interrupt,
and you have the documentation for that, we could look at
whether it makes sense for QEMU's SMMU also to offer that.

Generally I find it works best if in QEMU we follow the
same pattern the hardware is using for where we put
functionality, whatever that is.

thanks
-- PMM

