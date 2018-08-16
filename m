Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1806388wru;
        Thu, 16 Aug 2018 05:44:05 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzjr1+WvKFj/hwwTGkLyvOlQqTWJetJygiIX/2iom1YcuDgwL8ThLylwAkOt35ZeqgJHr70
X-Received: by 2002:ac8:2d61:: with SMTP id o30-v6mr30649009qta.345.1534423445337;
        Thu, 16 Aug 2018 05:44:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534423445; cv=none;
        d=google.com; s=arc-20160816;
        b=br8GX5rLBrWhoD0Xu0yvR/+B4bZjAgDFgYfDmwtJd/C9I6QjNXJp58zB+I1M7Fg3Gc
         V5780oMOgES82ixMZ+rFKVamgVuIl8AdrPRnrDVC+wWa01fx681coBGbFfEFzxooYoZO
         JcloooEQ2i4qjKGsJwHrKgBdCi0zqc5kdh9c5BbMyfIdCl1Qbe6Sg0bzI5Q6md9XvsmB
         CnGxLrK/FTCS66kJO/JCW1eNwipy2l8YIcadrcOq+JdIxDhz4Px73FMGNy8Xs5Vd5Co1
         Ciub/xyvc4kWm59qb2rJ3XpjDzUodC13uW+T5A9ivFOWwCjbEYkmEGAZDV9QcloWFc6R
         CRVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=mrwdM/oZnb9EXqVs/PSNaqiCIUO0V6SuSA7HKSyiyrw=;
        b=lA8t7sPs/ppC3Gbdk/RJeDBBKxx+xr6aETE2NrHQH5h7kFNYER6Kz1Mo3UYkYu79eQ
         RMPdW2LMEv3p86UN72K2dMrou8oYZ3LLd52UlD1XGuVuKrDqNvbcYmlQFo3zB421N3JS
         h26KSkb598DEuJs/prNc7jqCq/UDdUvZ6FcgMR7IRAU0z4/tw8L1beoRxcuBwmTNloAE
         7Y+G9jvwss+dsNTNQGZLgfEIn5kCJsNytoRkd5h9y5RiI9b3m4TNz1yoPiW0T4LRf1sn
         +Np4bjTAatlAtSNBQ3xj712GddSHrtgHRRubxP/575h1mSNTwoh7QzGKND68zmhiuLmy
         CCpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dmv91mX5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i125-v6si14376717qkd.227.2018.08.16.05.44.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 05:44:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dmv91mX5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55369 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqHdE-0006Nz-Tx
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 08:44:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45158)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqHd7-0006Lv-Su
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 08:43:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqHcy-0000mH-72
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 08:43:50 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:45016)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqHcw-0000kG-9M
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 08:43:48 -0400
Received: by mail-oi0-x241.google.com with SMTP id s198-v6so7693048oih.11
	for <qemu-arm@nongnu.org>; Thu, 16 Aug 2018 05:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=mrwdM/oZnb9EXqVs/PSNaqiCIUO0V6SuSA7HKSyiyrw=;
	b=dmv91mX5QshkCviuw4teTnbD7WBLuje5Cy/XtSVY48xy2PVGegDZ15hX1fQQxTRtyc
	0Qy+1Sdb1UhN6NI1DvTw3n40P2XEevKLFc640dacViIlrogjh7iwc+Flybf8PqocMOOw
	yCJ5767wL5phfh8FnMh0nk05ZRmCX7C3eMpD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=mrwdM/oZnb9EXqVs/PSNaqiCIUO0V6SuSA7HKSyiyrw=;
	b=nECASujBdJvd0lzC5MZkkhIlSZTJK/AUOaXBWV3Hsc9Oaa0QK1e+FmPnFzPhqfJGzK
	G4EWwAppxh1G7SlGIEV/yFvRGkzMcYJLPxWY4e1oJ92J2fhE+3iwKU7imBO8gfNjy5Qp
	NeaycQfLr8EOxhOazGxYHsno/0Lo37fxIBwX6JMOlIZmuV08lrHwa9bPkJShX90dPz4b
	+LH508QM/I4IJng7nqtmORsNjSv/tc3rs3nbAS2/pBpfGVfKEWd9K20LhUY1Rb+fKfmT
	YccYBMFeMP3EcphW8z4lTxGrbFy+8nslEhVAEOnbsIY7AKQ3VQV2qiApwioktmnK1+NH
	LUbA==
X-Gm-Message-State: AOUpUlHF3va8Q2IOgjIE5Y3gbxSoM7olwv1KYWb+E5Rj4w97MfBTK/0V
	JGyfvwng7tLhi/xMrCAGKr87K3QEn+yf5Q6gJg5ZmXPKnXCSLQ==
X-Received: by 2002:aca:ac54:: with SMTP id
	v81-v6mr29329416oie.1.1534423423468; 
	Thu, 16 Aug 2018 05:43:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 05:43:23
	-0700 (PDT)
In-Reply-To: <20180731201056.29257-1-tpiepho@impinj.com>
References: <20180731201056.29257-1-tpiepho@impinj.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 13:43:23 +0100
Message-ID: <CAFEAcA_8zRtZJ060+6k0tG95Q0vvEz4=TwL3gMt5ATdcLvMNmQ@mail.gmail.com>
To: Trent Piepho <tpiepho@impinj.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH] imx_spi: Unset XCH when TX FIFO becomes empty
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, Peter Chubb <peter.chubb@nicta.com.au>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p9VZtRlZzN7R

On 31 July 2018 at 21:10, Trent Piepho via Qemu-arm <qemu-arm@nongnu.org> w=
rote:
> The current emulation will clear the XCH bit when a burst finishes.
> This is not quite correct.  According to the i.MX7d referemce manual,
> Rev 0.1, =C2=A710.1.7.3:
>
>     This bit [XCH] is cleared automatically when all data in the TXFIFO
>     and the shift register has been shifted out.
>
> So XCH should be cleared when the FIFO empties, not on completion of a
> burst.  The FIFO is 64 x 32 bits =3D 2048 bits, while the max burst size
> is larger at 4096 bits.  So it's possible that the burst is not finished
> after the TXFIFO empties.
>
> Sending a large block (> 2048 bits) with the Linux driver will use a
> burst that is larger than the TXFIFO.  After the TXFIFO has emptied XCH
> does not become unset, as the burst is not yet finished.
>
> What should happen after the TXFIFO empties is the driver will refill it
> and set XCH.  The rising edge of XCH will trigger another transfer to
> begin.  However, since the emulation does not set XCH to 0, there is no
> rising edge and the next trasfer never begins.
>
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>

Applied to target-arm.next. Thanks for the detailed commit message,
it made the patch much easier to review.

-- PMM
