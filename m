Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp576947lff;
        Wed, 8 Jan 2020 02:55:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqxOhrJ4mzb3C6j8iOwKBKbkDCJJWthTPsqtlqrjFf/NV6h6UHShSn3xsu3DGDGQDnt83bet
X-Received: by 2002:a17:906:60c9:: with SMTP id f9mr4125469ejk.273.1578480936733;
        Wed, 08 Jan 2020 02:55:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578480936; cv=none;
        d=google.com; s=arc-20160816;
        b=parZB01pFItShjDeHBt4a+YWDzGIND/4cuiFVFHaQ2U8EG5lSx/G+NWOnLgwR/BfTm
         BT5WuRyBKZyDADCNrgB2X9hpeLbV9cQi7lZBVgEzRPeaJNNxms6AcyDrziYSe/Hqu4Lv
         m2KrBxrltQnAhYUDLqLPF51JeNxOMa0duNZQJTVfK3p09Th/a/fypzB4jwtO50vUYjU2
         ci04Wp24q9tCUfpLCgwkpje784XXCrALOd5jntQ1NuY3hAoBYR9FjA6zNuk3rLSBRkVy
         jEV4e6nWJNmKiKQ3b3/ROEFOdFnC4K7FqB3996wN3VBgBFJ5EDBXpW3qHX9r4yYM+Xmt
         415Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=hdHIjDHFWes/iN6CC2+ZdbXk+OaHyY6NCif2+zwOdu0=;
        b=h+zLtmEZPtXLo3fYMQmXz5GAmAPb4g8LPlrW9TCt23WVyVwn+LUxzKlBWEONcy9MN/
         ld6q/qxh2RzocUkjexh2x7BJc/cHfgh+8DZgE0uagJbLGZ7qJ5r5bF9nsRfFrRwdls+8
         ToTb8ZJayn7mHuGzhuiMZRwqVsuZhK/VZZDq+f33vLURPpzB/PXRIzvnIiAPfMjwrWor
         +MHsD47Oc54p40v7tX5oulutQhppDnjDI5kHDacBjXUVFY3IvCcw9pjIAvbV0lGdCo6B
         WtSoLvTNDnTxCVs/uUu74vlQ07cyvctROYZOLhi5NRttdu4wzs32CSA2XDMoYI59wj41
         XxHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zXMwK1G8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s26si1883584edw.19.2020.01.08.02.55.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2020 02:55:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zXMwK1G8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ip8zv-0004yZ-Hc
	for alex.bennee@linaro.org; Wed, 08 Jan 2020 05:55:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33006)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ip8zm-0004yK-EC
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 05:55:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ip8zk-0008SB-EY
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 05:55:26 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:34424)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ip8zi-0008PF-V8
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 05:55:23 -0500
Received: by mail-oi1-x244.google.com with SMTP id l136so2256861oig.1
 for <qemu-arm@nongnu.org>; Wed, 08 Jan 2020 02:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hdHIjDHFWes/iN6CC2+ZdbXk+OaHyY6NCif2+zwOdu0=;
 b=zXMwK1G8bOpZLD55iCugOu27YxCOCxuKLxCTA+LH8kKG+UzgGtkBO6ucMlUEw21dcj
 shZl5WWkrxmWuNdzHP1SLOe6Ttp1jA2HUMhDd3V5M4Lw86xMJdMjoxmM38veeOZpV5ti
 LFr7mDrEZuytCC40lwd3WuNUnveIyTNtF8B/ygjxyaGEXe+Jc4Kla0EQwtFMeet3FqW5
 UlMiSQ7fui7WF+N76Z2Q+Qa+iQwRf8tONyPBnv8lOLgtv8BNrO1cveLB46ndxpuOxSgA
 KyyoKZQw47Tyd4chvTc6/XQoI1EweWedTg15jeZ2a3P1CmZ0/nbgcgLDqcE5wG6H4wdA
 h7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hdHIjDHFWes/iN6CC2+ZdbXk+OaHyY6NCif2+zwOdu0=;
 b=JolKLqccn39oSAjpXFsm3mWec2Vgv6dOr/XcftKGlfNwUr5kZ1pf4Ym53DkogwyWIE
 CFzLSU6tkag7wNB2L9WX+XylxPxvSE+sE0GdcOgM1JWsgvSA4YNT/kr9Tzybao6f/+Gf
 RKS5ichtkiM2scFciq3mVBtA2A8NuJsDNzv+EsoHJWDyyGsZBsaoIbGb7HtkAe1gJtdQ
 Cbjy3o/71QfNftMvZzlZe+ck5X7I3u+PGqB4xFbqM8AdvJjH8qGobzRKBETP7Hz4ctPt
 HUBvPAtJ7FKn+P3PX5+NgykB3uXq+s7bwgBi+f8+IAPaA9JbNUlecSEIczY8IoJjztMq
 jIFQ==
X-Gm-Message-State: APjAAAW52SEI/mYOpBNq2bloiGfx7yfC0lG1l5YoHFodSSLgLbtqujPn
 QKgCkR4Q6YfZ4748DTqD+3xnmY9C1rRhqFzmVlgOXg==
X-Received: by 2002:aca:3182:: with SMTP id x124mr2620548oix.170.1578480921409; 
 Wed, 08 Jan 2020 02:55:21 -0800 (PST)
MIME-Version: 1.0
References: <20191220202707.30641-1-beata.michalska@linaro.org>
 <20191220202707.30641-2-beata.michalska@linaro.org>
 <CAFEAcA-M=P=-6t5RX0bdO-8fbcd-_Ar_aBNskzs49aspvZ0+7Q@mail.gmail.com>
 <CADSWDzu3jVj7kmcmLwY7D_j2ErN4S2G82ZKMzTsScqanHV=MzQ@mail.gmail.com>
In-Reply-To: <CADSWDzu3jVj7kmcmLwY7D_j2ErN4S2G82ZKMzTsScqanHV=MzQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 8 Jan 2020 10:55:10 +0000
Message-ID: <CAFEAcA88-PYBf5nOpCdtt24SG-CDb4rT06iYzaBou5oiyif_Ww@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] target/arm: kvm: Handle DABT with no valid ISS
To: Beata Michalska <beata.michalska@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Christoffer Dall <Christoffer.Dall@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /mqB1VzWaCAJ

On Tue, 7 Jan 2020 at 21:37, Beata Michalska <beata.michalska@linaro.org> w=
rote:
>
> On Tue, 7 Jan 2020 at 14:28, Peter Maydell <peter.maydell@linaro.org> wro=
te:
> > Another thing that occurred to me last night -- why do we need
> > to do this adjustment of the PC/r15 ? If this is the kernel
> > handing control to userspace to say "this is not an instruction
> > I can handle, maybe you'd like to try" then surely it should
> > do so with the PC pointing at the offending instruction?
> > Similarly, if we ask the kernel to inject a data abort I
> > would expect that the kernel would do the work of adjusting
> > the PC forwards as the architecture requires when taking
> > the exception.
> >
>
> The code here is just for easing debugging from Qemu perspective
> and that is the only reason why we even try to read the value of PC
> - it is not in any way needed by kernel to inject the abort.
> One can use the monitor to decode the instruction, provided it is still
> available at the memory location pointed by PC (handy monitor_disas)
> - that is why logging the address with decoded instruction,
> as it is the only thing that is being done here. Still the address of act=
ually
> executed instruction for ARM would be PC=E2=80=938 (PC=E2=80=934 for Thum=
b)
> that's why the adjustment.

My point is that the kernel hasn't actually executed the instruction,
though -- that's why it's given us control. It seems a bit exposing
of the underlying hw mechanism for the kernel to hand control
back to userspace with the vcpu state in a sort of half-way-through
situation, rather than cleanly rolling it back to "this insn has not
executed at all yet".

thanks
-- PMM
