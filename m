Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp178225lfm;
        Fri, 17 Apr 2020 01:30:38 -0700 (PDT)
X-Google-Smtp-Source: APiQypIPGpZrCQRGJeHQt3WPA4Jl9ZKIL1H7geHR4RuqvdTlAKo9dxqB2FL+kWIiMH2F22sxUen2
X-Received: by 2002:ad4:5a01:: with SMTP id ei1mr1621051qvb.63.1587112238354;
        Fri, 17 Apr 2020 01:30:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587112238; cv=none;
        d=google.com; s=arc-20160816;
        b=uumvwXIxQjoRar+k689ZBz0fk1q+Ve3Zad7KUTyDXMm8bYR/yynom7/AGVhKBwc663
         6huc+1zKeXiqQq5+leQluUZJpqZT6OLGW3E6mzBh9r/Kwaco6C4tyoJSocXkMoGYF692
         WfNtj7YYun6U4CGrCu4Baal4koUoXv4iw2rTB4zx5AyEIqVuESUF53ffE6Kf2VqizH1z
         31yt4QpE9XTJxcNzu9DOvYfCVXVB1HUfFyaOHxWqHICqYDkXgO8A9PNocduMPuo5C6tH
         kWVdTWKtFRX/eCxwE03qBxa4GgRYrDOgigMZ3I8hQOqjqJi7krty9+siCVgqwVaRvLub
         FcLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=sfhJTgSwj+/KbMdjRpAGh+olc5UKTAi60OPHokqgWVQ=;
        b=WWst264XJ5HFHMdQzboWzlLrxsNVZm9LfK6Am81YO2VH8v2YF48g9hoe+GopHxIq43
         kYZwVjczauLlSwt5vRfWYq5fNtKxshP3OfoORMxrjivZQbWYUH49mULn+ebyPdAskqZ7
         TPj1gFWg4QvdaCol6xQSOJupa/efKd4FXvuBxUsgAeBCkegk+X1shreIp3GLibOnvu80
         n4NIYEjRi35yO23hDCPRqKwPU3vMmUWXhGl1QHchJv8H3uMkJWLhkz8gRzjiUKS536iQ
         Sib2wVIugBfl4D7Fh29exiF8OGHQikMx/YdE9CrmZ/W2Y5ubkyJ5/H80aqTV4UI7HiKo
         iP4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=foIApmw1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 70si2464829qkm.296.2020.04.17.01.30.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 01:30:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=foIApmw1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jPMOT-0007ou-Ol
	for alex.bennee@linaro.org; Fri, 17 Apr 2020 04:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49851)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jPMOJ-0007lz-0A
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 04:30:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jPMOI-0008O0-1v
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 04:30:26 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:43636)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jPMOH-0008Nb-Th
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 04:30:25 -0400
Received: by mail-oi1-x232.google.com with SMTP id j16so1410453oih.10
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2020 01:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sfhJTgSwj+/KbMdjRpAGh+olc5UKTAi60OPHokqgWVQ=;
 b=foIApmw1V7DqVZ4Qk1skZqsKR0M6m6p2k/tNCH/wMC0lczsUHeBIf/nr+3NrsLXi5A
 myhuSdu6V2xM47zylkiQbUP/1L+r6oCDjWfPACUOQ06tr9gTD4iqzXLdwyOqQfUMtSyg
 2VTm99yLSLLEUQ1razA7aEravwKUDBa2OxnaTrUA5U2G/kzfsOiOzCCwd/z7QU/Q3w+1
 ZbLDXL+kfxoGjiAS3h1ncRJXDAZq4yTbJFvdCe85CtSpQAKUnWQ6ScD86yKv3vtr8Uwp
 jtpta5gssN2R4kxbRZwUJu4YuElCMe4UF+hg+ncs6fU+Iht4ITVQFocnU2ygxUJccS+6
 QSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sfhJTgSwj+/KbMdjRpAGh+olc5UKTAi60OPHokqgWVQ=;
 b=mSM9+paKOyLW2IyJoOfaIkYQlEmF9jMIF7ZU6dYr67zwLkTryOxx+ZigQRflM3sCp5
 Z/1ufPCdcQM4lbo8QeSejkCx2q7Ace/iS+1FpNdcqEaphut6girVf59uO2qu3aGIHecT
 tRIMpfk3RjJjz6iW03Yc4rzvREEDLuM5TbfHhcuYFMS0P8ErIbk8TOPTM1TVohW5mves
 zTs+7gkz9hhcLj1eW+5zRd8lNz9N1DxOx6qCMnCcKsg2DfNSsC/jbhcNIRXxbFtJbDkr
 wN1Noi7AYbvbzjOPYnmdyfcV4SbdyiYYbCDTefWTswWYZ2Rm8uSE3BNttbdYU9SU/Oko
 kRYQ==
X-Gm-Message-State: AGi0PuZM2ZAN6HbvgDqCZhWUJy9LgFjJJ5QNtRCSRTdzWBsRNNGMrn13
 fz9cXL6u64pXNMye66xbwP6zWLfo8Ed5ovJTPgsc/A==
X-Received: by 2002:aca:3a8a:: with SMTP id h132mr1312833oia.146.1587112225046; 
 Fri, 17 Apr 2020 01:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200414133052.13712-1-philmd@redhat.com>
 <20200417024020-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200417024020-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Apr 2020 09:30:13 +0100
Message-ID: <CAFEAcA-9XTQ25gQm18+s1AExFoSR5bQFR9ryEEaEaOGPiCosEA@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 00/12] various bugfixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::232
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
Cc: Kevin Wolf <kwolf@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Fabien Chouteau <chouteau@adacore.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Max Filippov <jcmvbkbc@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9+cL73+dSwO1

On Fri, 17 Apr 2020 at 07:40, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Apr 14, 2020 at 03:30:40PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Collection of bugfixes for 5.0.
> >
> > Only vhost-user-gpu/grlib_ahb_apb_pnp patches are reviewed.
> >
> > As 5.0-rc3 is tomorrow, I thought it could help to gather
> > them and resend altogether.
>
>
> So who's applying all this stuff? Peter?

I talked to Philippe about this on irc; I cherry picked the
one bug that we thought was critical for 5.0 (the vhost-user-gpu
free/g_free mismatch bugfix) and the rest will be for 5.1.

thanks
-- PMM
