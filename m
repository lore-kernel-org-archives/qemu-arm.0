Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3583441wru;
        Tue, 2 Jul 2019 02:19:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxotvVqJxA1RuGMWYauJdbyzd3TLg4BSd+9cmWpxaxYRSbFz0oLotbyoIGqkujDtSmLQ5OQ
X-Received: by 2002:aa7:d845:: with SMTP id f5mr34434280eds.78.1562059173416;
        Tue, 02 Jul 2019 02:19:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562059173; cv=none;
        d=google.com; s=arc-20160816;
        b=LBuVGl24NVKJ9mPmd5bJBq2rhGKCExyxfTUcUynqeVRugW1vo960Q3c3CiLX+lFAuR
         qB2kfFwSKUJLwNwcML+H6WqIfMbjPtDP7u9gjhvybKVgE27bAyKWpe0ChqO0x0GykU02
         FAMvUs/KicZ735pueSQsO0+oOYqsx4d/svz2vjtVFGZ7+ww1kCS/ybN9XMHvopK2l2UH
         ESOiDj/6HoPNSl4YJmf5UwrMnZsSp8sZmmn2KXqddLqh61HdTJZv0xD/C3KZ4gQFIX2S
         Fauyc5TAN7uXas0Rr/lgjm3tOcFyCH/PtyQiYlbDGaVwDh3AwCw3l/KqydUPI2z8aIfB
         xTsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ExcpDSybs2Us67oe0TsvmpOFGBZM+gGUCA0WnyGo4lk=;
        b=0Cf+OJmDnanidvyveFesBDALdVavmnbyb4V/oK1a3w1H8sVuENIOq7njZjafOiTFk/
         bJ+caTT2FXenGxaAyS5RA1KTZ5phoP0hQxUq28tEnMSr9ANBdcfL9H2qEliCqACJLEa7
         wsswoA0wpZL21yCnzYt54kQ4KlVtJr00vUJTwFwJ0ZTP+dFNwabKuqvH5a+A+yJtUNOl
         cOw48+A6r4TdiGhAKdHyPFtwvUlK4Y95CBXumVvLy/7mbiKcBh2qQNM6Hr6tLkDaQBoU
         JqLWeUT9IGTUdEElKLq8C8EP4iY0/sogdSst6aYxO+71goodyRFXK2CMfz5kbL6raBOd
         kcYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YnzBN670;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si11716206edz.269.2019.07.02.02.19.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2019 02:19:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YnzBN670;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hiEwm-000801-HO
	for alex.bennee@linaro.org; Tue, 02 Jul 2019 05:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34959)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hiEwV-0007xP-NU
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 05:19:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hiEwP-00066s-VP
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 05:19:15 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:46626)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hiEv7-0005lX-5J
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 05:19:09 -0400
Received: by mail-oi1-x235.google.com with SMTP id 65so12439948oid.13
 for <qemu-arm@nongnu.org>; Tue, 02 Jul 2019 02:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ExcpDSybs2Us67oe0TsvmpOFGBZM+gGUCA0WnyGo4lk=;
 b=YnzBN670EgyTRClqhXDEQK+UCyLmJI+IbtzLLPULpe31ALd3VIcyK7Rk2AOxOKnT6s
 +2eFocSfBMdyLT6fFTlVnbYqwmvlO/au8q2A9fcdhMDgh20WvmGRhVA+XLlGUz2zHx4h
 sOiZMgGoXKuYsCrzPXigUqV7d2N2SYk/dHiOd1rvV/2mdeK5Zdsolsk1ha9RlE9IGYSI
 Vt8uNFHtMhI6QFS2NcTwz+eYdrdvxkM7xjsUHi2r0KHWTXvAz1HcJiyN6xhurI8+3kQA
 8GRx529am2qOEKvgNviRwUdWiXXzhp11VbHTdkxtT4Sdzl+35IG+ggEjtrl8tHXJYpjh
 5lSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ExcpDSybs2Us67oe0TsvmpOFGBZM+gGUCA0WnyGo4lk=;
 b=B4KoToff+uO3IXV9M6mgf5GeEd31CjAK6w94r6C3Z90dHRu09L4xv0NeXGC5m6oujF
 8jfoBQWpI9FaidqYM2MM27SPKakcATveqCJZOdilRNk7DeuWzW8FL/xWQSfyNp/wG1uB
 nxoJ6XPA9QSpnMNFnSVPYEKlEumhJMa6dTTqypPxJaTtf1BHLmlgdgtitfJpg3p6AENd
 Debx4zpMTLIjMPjywymTotNSjUwEyoHkClWMrlgQUvrTfZHs0XrCd4o4gLlNZyJNx9eR
 pa9EaLbXLzmUTFpZASzHwgTgPyfQGGmSOlogS2lO9lN5qK/tSTjrOOVLkanGDQRFkOGD
 5UfQ==
X-Gm-Message-State: APjAAAWyRGOo1/HigIcAPs6rdAVfl16uKemRp11nc8PctsC9qJvmQAyy
 KA0xLpRTh1Ut7QdoFrCm5xjsvuXWbn+MLR0O/XcGtg==
X-Received: by 2002:aca:ac48:: with SMTP id v69mr2293712oie.48.1562059067492; 
 Tue, 02 Jul 2019 02:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190628103957.9504-1-kraxel@redhat.com>
In-Reply-To: <20190628103957.9504-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Jul 2019 10:17:36 +0100
Message-ID: <CAFEAcA9Dh2EaPkcDmErEdJN+BknuRHvZKe5veOcY_7hMVEXiVQ@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::235
Subject: Re: [Qemu-arm] [PULL 0/6] Vga 20190628 patches
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QoJCA1ZAMo0q

On Fri, 28 Jun 2019 at 11:40, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 474f3938d79ab36b9231c9ad3b5a9314c2aeacde:
>
>   Merge remote-tracking branch 'remotes/amarkovic/tags/mips-queue-jun-21-2019' into staging (2019-06-21 15:40:50 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/vga-20190628-pull-request
>
> for you to fetch changes up to 263807f4e85e94f2d4e988d61d2fc0319b1dd36b:
>
>   ati-vga: switch to vgabios-ati.bin (2019-06-28 10:49:36 +0200)
>
> ----------------------------------------------------------------
> vga: ati fixes, add ati vgabios.
>
> ----------------------------------------------------------------
>
> BALATON Zoltan (3):
>   i2c: Move bitbang_i2c.h to include/hw/i2c/
>   ati-vga: Implement DDC and EDID info from monitor
>   ati-vga: Fixes to offset and pitch registers
>
> Gerd Hoffmann (3):
>   seabios: add config for ati vgabios
>   seabios: add ati vgabios binary
>   ati-vga: switch to vgabios-ati.bin
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM
