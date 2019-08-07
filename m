Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6863509wrv;
        Wed, 7 Aug 2019 11:16:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxqJICbHw99i8HVOrs96HVsQowaVPZVTK79TkG0Vjvr3d1cd9UCLOKNovElAtl78dQtnN6j
X-Received: by 2002:a50:eb8b:: with SMTP id y11mr11395804edr.154.1565201817779;
        Wed, 07 Aug 2019 11:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565201817; cv=none;
        d=google.com; s=arc-20160816;
        b=g7x3kFHMEMoYnyz2Oynwq8Y9R61+kd1cMZ162XQXU/ZvSYSUSz0B4XUZrj4EqBS/+6
         o9dEA40k/Qth1WCP86bwE0YG4DRgQWcTlWt3JSHtfK6J++Nwh14qktEdMBC0kHK7PksX
         2QUWreXLwjE/6DcoVM/ctT6u4QZngw2LugN6yLOMxrZnFUNQAmtQqLIKNwU5FSDX0IU5
         O/2dweFDHg+RVVUPpd4TT/K9NUCQUEkQYb76YQB8b19USkfLFjKUlpGis4nd7M5n/Kyy
         WNG7AP0gjUc0KkCICjBZigOcWyIFeDN3BEhjaT/2ju+UjQv99CoMzW5XBvAtrsx2pRWz
         7Tqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1NHsKJO7D2MJzWRTGF95uuoJZ5g7HBLubckVRHO3rys=;
        b=Y2o1UR3jLoZf+qXbJN44JXi5WmcOY+7piEnq38R6eecwNWTMdS55rremN0xli72CiC
         sOu2wZtKkzGvJCjH4wKhsM0fSJnp5SMdvk9rWp1UBwTcIYZL2sWPnCtejBAQW2teCuay
         h90jAzKlPNkvusjm7OX3ChOlMnNWhjZP75DNf6RE4WWpafmMDDIdxxTpzHpQ42YQdc3Y
         b/RCf7vzhnK4vQeiDC57w1JhoeTrR1dyl2KBrFCzTcJyofmTn8etqJP5EKiIDhjPRBsQ
         Jypi9GJWL8riGxaBSTcszIoCA6HXOAYG/DE/4I/90fZ26ubX0l1Gb/Z7bwxp/9PPvAsa
         35Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eiFitDSz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f25si30105318ejb.150.2019.08.07.11.16.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 11:16:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eiFitDSz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvQUa-00042y-T2
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 14:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36122)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hvQUI-00042c-AB
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 14:16:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hvQUD-0002KM-LG
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 14:16:35 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46317)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hvQUD-0002Hd-76
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 14:16:33 -0400
Received: by mail-ot1-x344.google.com with SMTP id z23so79694852ote.13
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 11:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1NHsKJO7D2MJzWRTGF95uuoJZ5g7HBLubckVRHO3rys=;
 b=eiFitDSzHjsHRQY+BIhi64E4z8aP94vvImqhcEo8wox+h5Vfo+yW9FmxsSwNH/sdMH
 PzbFzz7owk/Q/qLLJrgFOAyQ2o+G8MIienLSbaqkXDtEiKi+G4jYbaiNn4o0+G9G9VOd
 Cmlt2GbVn1YgmtFSS55UKxkPb/EXXe9PlUo+PAuMsFPcwBvqCAxxzI+VKrAnMehRMK50
 vem32PxqKrsICec3Axay+d++8ZhETcnlerX1oyZABypT/GZyDOAUWESNZT8AF4r8nXYQ
 tuTZT1+iBRkxDBqzTKaERqmvJ6R3UNM5PXXzL36UjefIeqxwA/zZWplS9j9Sr4We7kju
 4Fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1NHsKJO7D2MJzWRTGF95uuoJZ5g7HBLubckVRHO3rys=;
 b=aw42+eoki8HlO6IDL6VBXdWFIWN6kwnk+jrx4B7mLQp4Lw0ll951Vm1cFI6CX0IMmI
 1lvWku/7wab5XlV6xvhk/FQP194m2ENDJqipCrcW1DsYwwBXbGwCB5bR1uLNS6Yln13z
 pQ7elu/9x+2mn9C6n2PVAWRRQrrCFcjg6X/KG+jB0XnFfeasStxtCca+Ahqsz+wV2Lk5
 KT0o7+ajDN5WCdEG1TF8hcEfRmOdcDIN6EqmrCwkjQos+b6sWAMtlSCg5aAlL8ricfTD
 Ea9yidms90wy0AbQmGxVbaPftnAPq/XB+EQvG4JZLlGH8D6WeubokJUvyZcO01Whk0KA
 y7fQ==
X-Gm-Message-State: APjAAAV6311i0TrBhoRIQvRm0k+XhE1Vs07T2NuMSKUxM9g68gO2GVrm
 MKGQNRVVMHezGPP1HgtESLdE+BdlL1KAMP7TzLhZiQ==
X-Received: by 2002:a9d:711e:: with SMTP id n30mr8299729otj.97.1565201792249; 
 Wed, 07 Aug 2019 11:16:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190807045335.1361-1-richard.henderson@linaro.org>
 <20190807045335.1361-4-richard.henderson@linaro.org>
 <CAFEAcA_MFg1_gpaT5+X71s8r5SYZFTizdXs2vQ_6mLooP7E+kg@mail.gmail.com>
 <061145be-4cd4-b8e6-ae5c-562a59e8088f@linaro.org>
In-Reply-To: <061145be-4cd4-b8e6-ae5c-562a59e8088f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Aug 2019 19:16:21 +0100
Message-ID: <CAFEAcA8fCL4VTJYdWGbDySzT9zkgmjcMGqBj0fo9gN4x4B-WcQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH 03/11] target/arm: Introduce read_pc
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 81ap6VhQnHh5

On Wed, 7 Aug 2019 at 19:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/7/19 10:27 AM, Peter Maydell wrote:
> >> +/* The architectural value of PC.  */
> >> +static uint32_t read_pc(DisasContext *s)
> >> +{
> >> +    return s->pc_curr + (s->thumb ? 4 : 8);
> >> +}
> >> +
> >>  /* Set a variable to the value of a CPU register.  */
> >>  static void load_reg_var(DisasContext *s, TCGv_i32 var, int reg)
> >>  {
> >>      if (reg == 15) {
> >> -        uint32_t addr;
> >> -        /* normally, since we updated PC, we need only to add one insn */
> >> -        if (s->thumb)
> >> -            addr = (long)s->pc + 2;
> >> -        else
> >> -            addr = (long)s->pc + 4;
> >> -        tcg_gen_movi_i32(var, addr);
> >> +        tcg_gen_movi_i32(var, read_pc(s));
> >
> > So previously:
> >  * for A32 we would return s->pc + 4, which is the same as s->pc_curr + 8
> >  * for T16 we would return s->pc + 2, which is the same as s->pc_curr + 4
> >  * for T32 we would return s->pc + 2 -- but that's not the same as
> >    s->pc_curr + 4, it's s->pc_curr + 6...
> >
> > Since s->pc_curr + 4 is the right architectural answer, are we
> > fixing a bug here? Or are all the places where T32 code calls
> > this function UNPREDICTABLE for the reg == 15 case ?
>
> I believe that this is UNPREDICTABLE.
>
> The T32 cases that reference the PC that are not UNPREDICTABLE, literal memory
> references and adr, are all of the form (s->pc & ~3) and do not come through
> load_reg_var().  Those will be unified by add_reg_for_lit() in the next patch.

Yeah, that was my assumption -- at some previous point rather
than making load_reg/load_reg_var do the right thing for 32-bit
Thumb insns we just fixed up all the callsites to specialcase 15...

How about we add this to the commit message?

This changes the behaviour for load_reg() and load_reg_var()
when called with reg==15 from a 32-bit Thumb instruction:
previously they would have returned the incorrect value
of pc_curr + 6, and now they will return the architecturally
correct value of PC, which is pc_curr + 4. This will not
affect well-behaved guest software, because all of the places
we call these functions from T32 code are instructions where
using r15 is UNPREDICTABLE. Using the architectural PC value
here is more consistent with the T16 and A32 behaviour.

thanks
-- PMM
