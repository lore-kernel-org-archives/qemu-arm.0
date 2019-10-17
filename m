Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1138222wrm;
        Thu, 17 Oct 2019 08:53:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwJRytI2LEC/Vg23G/8kN7HrjWNSowFEOJWWpvmFFKxbvnudsXWftjxID6A7y14ydiprx1L
X-Received: by 2002:a05:6402:503:: with SMTP id m3mr4542640edv.157.1571327627810;
        Thu, 17 Oct 2019 08:53:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571327627; cv=none;
        d=google.com; s=arc-20160816;
        b=y4B/mBzN0hkwopwNZDRTVe5RK6mjJgA7UzXw+0kX2/a/0DEq2VpfCpLiHh21R3blHY
         pNRn+BjVXQlsexvHoka/Vzr+pwtz9mo/LUceT6j7ODOGcCfJSivOFy0ZAaCQylrr7fZ/
         wDuHPFJnSs54MTGbTuBNRj2Zld5gPVm5l0GyI19qOSd+KX298O7DUmuKvt2N51rvtARG
         BngJZVRY3F7Wpe+GFivPP8XK7PVtFl8gO0BcSzJeR/0/c9dq6Ok5Kn7KQnGfxH99OqJO
         hmaEpUbcKApbVcd4QeadYbR0YuupTWRod76Y6iEqIaVNSberMK22DR5nit78kv8P8Pb8
         DFHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=3FQnecCqLwopkxDYIuZU7fIcstEcAXt9nnbmXFrtXvE=;
        b=iyJYZ7TRr02uMUXqf2pFZlnQiVSAn1KRoqgeWZqy0yZgzvXmjGCsiciH1YNfklqGfC
         2XGGfJX1lzXzWH6jR4Jm7XEHbyUx3CxYgHFYUSrpv8rJpz6DKtWdmtM2tRwDq3ErO19q
         PEHCir4QvcECLrA/vbp1Vo7ONDkG58AbYI/WizXpGFIDfjBMxonvrV0eo5tULf9Fq9Gy
         AjUIRU5VN+U2qSIwiVaa8KMKIcU9tRN0z9NGhGxNWtLthYupyeiGSmH1OGZfKH2lDwwZ
         r/1IHPsZjO7Ct9KCnGWToNQJmG9HPthQ4gLmUjv9Q4TpHDu7FOuETubl3OYOcuTDxCPl
         nD+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EBaPtzoS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n6si1584908ejj.232.2019.10.17.08.53.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 08:53:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EBaPtzoS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iL85y-0000ed-Cs
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 11:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53505)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iL7JZ-0005hd-JH
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 11:03:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iL7JU-0006dh-CI
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 11:03:45 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:42226)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iL7JU-0006dD-6a
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 11:03:40 -0400
Received: by mail-oi1-x242.google.com with SMTP id i185so2407614oif.9
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2019 08:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3FQnecCqLwopkxDYIuZU7fIcstEcAXt9nnbmXFrtXvE=;
 b=EBaPtzoSUc21e1qdbP2MB8MFZ6lMAQgatusOB5VDgx3CCK3LyF2ynUsrgP66A9Syz5
 qnMPVT0/w+wF7HU1WO9piQdeTedejWf5QkCWz3IOUy86Ctmd+BtWZaQLGrxBbkoxKm+f
 2U1O4YlYlydQHa0wBh147jLBUWadIM+gHuNvn3pkJYnB7cYT3aOzjwFtPCEtrX63J5jl
 Z/YxTf9qaDYIDcPRo+T3KiUtGUUgXmsAcmR7oVe4OD/ww4lYFmY5JmUBAHIr2Zrk/zjz
 d20jg+HLFp1mqm9Co7nDv0teEVS/tFQ5wOFJ7NI5mriuARzQgrfbbxZ4saLxvjc+iYk0
 Mazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3FQnecCqLwopkxDYIuZU7fIcstEcAXt9nnbmXFrtXvE=;
 b=kpQwQ6zC277IpR+2yYSwpXeVRKG+rkkoTHjFzdt5hpu/R21wJakKx3K92RWSxffJCI
 uhqhM04QZ/PC7IatbntN7k5AUTnKrEscRusnAPMpA1CAVGfhi/uG6E+JO2FkbfYJPjyv
 gJHWRF6wbO5d+y2bR+BMr6ptx44/+8m/pKHyXh/sYuwtfy9Te3aN95PrdFgExFAciqxz
 QnWwwafLUVUxCdiNf6jGjvdC4ecy3pnl6rtvPQrTmfh8mYuBvZQZG1bUs5m89dG2T/ZL
 rMk9REcE9OFCYjTAPuPAgfjafDx0rfFUmUXS63bxZISKFjYGA9j+/pN8ebYrxIEIf7YL
 uJbg==
X-Gm-Message-State: APjAAAXAhtQ3ShoRLrwcYNqtoKYtzQlORT2ZQOO6dcp9PDfxHCCs2HVD
 eoe6Pn17JmzKaKi3SG/a048FdHnM8aod4m+dyQToyA==
X-Received: by 2002:aca:49c2:: with SMTP id w185mr3660773oia.163.1571324619468; 
 Thu, 17 Oct 2019 08:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <20191017132122.4402-1-peter.maydell@linaro.org>
 <20191017132122.4402-3-peter.maydell@linaro.org>
 <cabcec27-c6a7-6ea7-e933-589f2385c137@redhat.com>
In-Reply-To: <cabcec27-c6a7-6ea7-e933-589f2385c137@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Oct 2019 16:03:27 +0100
Message-ID: <CAFEAcA9dRMu_hauo_PuJyWh03+-Y9ogWmKSBfzu_6GhYCrnDAQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/timer/xilinx_timer.c: Switch to transaction-based
 ptimer API
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yIh7wf8aeCnC

On Thu, 17 Oct 2019 at 15:57, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Hi Peter,
>
> On 10/17/19 3:21 PM, Peter Maydell wrote:
> > +/* Must be called inside ptimer transaction block */
> >   static void timer_enable(struct xlx_timer *xt)
> >   {
> >       uint64_t count;
> > @@ -174,8 +173,11 @@ timer_write(void *opaque, hwaddr addr,
> >                   value &=3D ~TCSR_TINT;
> >
> >               xt->regs[addr] =3D value & 0x7ff;
> > -            if (value & TCSR_ENT)
> > +            if (value & TCSR_ENT) {
> > +                ptimer_transaction_begin(xt->ptimer);
> >                   timer_enable(xt);
> > +                ptimer_transaction_commit(xt->ptimer);
>
> Why not move these inside timer_enable()?

Because timer_enable() is called from the callback
function timer_hit(). Since callback functions are called
from within a begin/commit block, if we called begin
again in timer_enable() it would assert().

thanks
-- PMM
