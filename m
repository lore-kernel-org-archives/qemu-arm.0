Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp12668169lfc;
        Mon, 2 Dec 2019 04:33:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqywKpzZmUU1MgAoA5EJYbxclX6RzIyYT1RKshyq89EJLrB/QysGO/wo/IuaU7hDpVYB0av8
X-Received: by 2002:ac8:2898:: with SMTP id i24mr10511627qti.259.1575290018937;
        Mon, 02 Dec 2019 04:33:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575290018; cv=none;
        d=google.com; s=arc-20160816;
        b=mGmw0+RSjvc63yJGIiAlHAMA9cKScbtVscUkV31mP1UAweCYsKLQwgJ/CnTaOk2U8P
         CydqqfeAaPaVuUL6YGBP7+kXO8pkBBDJCJKeT2efzC4uec+kI/cGgJzeZXXTrmpr8FEA
         AZxVfGaYdsd1RRglenwkw2JOHaGfOfqt7971lgauagKllINQfR4zKW2MoNB5sm2aRJ6b
         mRyNgtrfr1VK01NrJYLgzDdX5HniGCBOTm0cvVFDbJ73j04yPSv+2jMZa1TC0NyjBy57
         TG/Tz0MX5tmL7MtXbN2ymCYocrpa3uTd7UDM7ZnjpYshpULGjk2wXmCAgdliD/PM9Nq1
         Mkcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w3QJs8joDrXvkLAs2T6oYNfyRbXCuGP1b67uc8VXb3g=;
        b=J8lZnu/7z2mT5blXSHYvVz6Gqkg9oDxGtGsiGv9uPszzKMVEODc6JVUKtS7Y2/LnHn
         QNWUyoN54fVonzQc8+tPFljJiqAJEGXiTWYa/1GydwdrlOOCiSaR6zxiI6DBfYnHMIHg
         nGLCZOovpp6sJwZZD0m73wCnF3h0FRM/YbTpKzFY3om6G6LBxdo29Su1sM+OQgHX/fe6
         zOZJ2Ua/Xv+l3swoI5QN3mMp9XQ71tEggji1MkjDOsO+iOFUEGAic7kKjRtMMUtdW2Lo
         RoAD+mwMimxmV+RZ47SYJ5D2MsLj9YiAlpCug8rZ9iJ3fbuzug/lbJmvy8zawXgbzX+B
         Ecaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bmUTo7y+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 70si20798977qki.95.2019.12.02.04.33.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 04:33:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bmUTo7y+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ibktW-0002Eg-0t
	for alex.bennee@linaro.org; Mon, 02 Dec 2019 07:33:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51733)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ibktG-00025l-TR
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 07:33:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ibktF-0003bq-Hb
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 07:33:22 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:45354)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ibktF-0003bL-B7
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 07:33:21 -0500
Received: by mail-ot1-x343.google.com with SMTP id 59so92644otp.12
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2019 04:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w3QJs8joDrXvkLAs2T6oYNfyRbXCuGP1b67uc8VXb3g=;
 b=bmUTo7y+WXT3jeoZnZzhuDLmZGLKL5qvE7VeN9OUKBdZzN5t16bkgVgCtPaP0pmnBJ
 SoOEWn1YKZkRvpRydhy8N/zJGwII3CzOoN8cw2zL5efw2bSfpRi0BuaMqmdi9tK5MIK/
 sfH8CIVTePqAUKgr0npKbPgVPh+qx34xHd7yIvoVm899+7L8wgzgl9Ok4sY4a2dtKFBs
 ILrD5mT30mCzLGGhaXDZjL00Fo8NBkwNnFveWyLua1ZIsHRSDK/bOj+uSz83qLSSaDT+
 HVNdj4BvE2Kv6DajnaZ/11yqbADmpY1+ItJABt2SIN8EmTgp4HsgV2/lflwobaQjhJ0j
 x6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w3QJs8joDrXvkLAs2T6oYNfyRbXCuGP1b67uc8VXb3g=;
 b=CbITEfgDHGmq1sXz3k6g7ZfZe91Nys0lPt8k8GCYcRpf7h296AAT/0lhuf2ZGrjsTE
 m/Fa1vLaGBejvawBW2sK9PtntFFiYgnkVSxMjv6IYlBTBJb6dqZzQjZos00u8uoPP0sN
 /wJJY9QXhfZ3lILEJKcDRzED4g2nrY3W3VMDJTouecIemDTcAd5ks88xpWElrrf4PD32
 ryp9NSpkBsruNgzhz+JjDocFtccLpZu3FvNICx3jPhlC9M8X4c1kn2G5j32Q2I01yxRP
 kV5UIQB7T98/XlxRJYU2HiU3LIiruI7qWSzHbCZJSE6YyK6AI2M9isfV0azg9HbK4gSt
 6Kjg==
X-Gm-Message-State: APjAAAXxkJQfM6C2+ei060u4WXdZsxPAvLixGR2ztwKkeKHnYLwo5v20
 JjulhcCU76qc+aZRt+pixUkREfIbP/RVZTFlFv4EZA==
X-Received: by 2002:a05:6830:2001:: with SMTP id
 e1mr2540872otp.97.1575290000501; 
 Mon, 02 Dec 2019 04:33:20 -0800 (PST)
MIME-Version: 1.0
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <20191018150630.31099-13-damien.hedde@greensocs.com>
 <CAFEAcA-YiD6B1wMTrOvj5=QbYY3uuqdbJbSP57zg3S86nU=k-Q@mail.gmail.com>
 <1ae3a4d3-26e6-fe6d-87a3-d5dcce1fd64c@greensocs.com>
In-Reply-To: <1ae3a4d3-26e6-fe6d-87a3-d5dcce1fd64c@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Dec 2019 12:33:09 +0000
Message-ID: <CAFEAcA89bbvd0Zi44GZrCDc8e-AEKqGkJ3SA3e=Sz6xVHNbfEw@mail.gmail.com>
Subject: Re: [PATCH v5 12/13] hw/gpio/bcm2835_gpio: Isolate sdbus reparenting
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Edgar Iglesias <edgari@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uamDwD4zqaVH

On Mon, 2 Dec 2019 at 12:27, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
>
>
> On 11/29/19 8:05 PM, Peter Maydell wrote:
> > On Fri, 18 Oct 2019 at 16:07, Damien Hedde <damien.hedde@greensocs.com> wrote:
> >> @@ -97,6 +101,7 @@ static void gpfsel_set(BCM2835GpioState *s, uint8_t reg, uint32_t value)
> >>              && (s->fsel[53] == 4) /* SD_DATA3_R */
> >>              ) {
> >>          /* SDHost controller selected */
> >> +        sdbus_reparent_card(&s->sdbus, s->sdbus_sdhost);
> >>          sdbus_reparent_card(s->sdbus_sdhci, s->sdbus_sdhost);
> >
> > The commit message says it's just splitting the function in two,
> > but these two hunks are adding extra calls to sdbus_reparent_card().
> > Why do we need to call it twice ?
>
> You're right. I forgot to update the commit message. The patch also
> refactor a little the reset procedure and move the call to
> sdbus_reparent_card(&s->sdbus, s->sdbus_sdhci)
> which was in there to this part of the code.
>
> raspi machines create the sd in &s->sdbus. So there is need for a first
> reparenting from this bus.
>
> With this addition "gpfsel_update_sdbus" always do the expected effect
> of putting the sd card onto the right bus.
>
> sdbus_reparent_card(src,dst) only do something if the _src_ bus has a
> card. So only one of the 2 sdbus_reparent_card will have an effect. If
> the card is already onto the _dst_, both calls will be nop-op

The intention of sdbus_reparent_card() is that it moves
something from the 'src' bus to the 'dst' bus. So one
call is supposed to do the whole job of the move. If
it doesn't, then that's a bug.

I thought the raspi machines had an sd card that could
either be connected to one of the controllers, or the
other. Why would the sd card ever be somewhere else
than on one of those two buses? If the machine creation
puts the sdcard somewhere wrong then we should probably
just fix that.

thanks
-- PMM
