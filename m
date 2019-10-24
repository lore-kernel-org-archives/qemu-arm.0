Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp2538402wrq;
        Thu, 24 Oct 2019 08:54:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzqgzhmgPOrOWicNnPjpIWYPMBZIzT77ACb6217Sfp8BitMT59wykzKPzfz9Ur7G6Z9Sgzt
X-Received: by 2002:ac8:75c6:: with SMTP id z6mr24337qtq.165.1571932481762;
        Thu, 24 Oct 2019 08:54:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571932481; cv=none;
        d=google.com; s=arc-20160816;
        b=U3Uahiw6XEhc9/s/dWQh1RFCUp/6O7LcbKe41IXdP/0Y6g29KKoQd5Ri4+IzIkT5lE
         v/QOa3fpkQi6+8yvELYn0pOLVe9pSUsk7Iy9xVnH0n8jo2QqtwFrT/3st9mLuL9ip9vx
         DnUPqZxZctzFMxMbZUAsGDLht03pRio72FDxAa76MBbrfQz9k+e+gAG9Dsm/2AuePNGz
         D/EvrxWqLhVwg69rXDQNH3Dvm9/EG0e37y9pCkP9bQnMUQ6i0oxw92jf3CE5/R9415Nv
         XDEkmflahnHdzNEWHbXHnZm/1Uidkbl627vBGuarm2UQ01g1vsiDDDHnJIIl6fl6NhtG
         eHRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=dQeMv4No2g8CptaRBeFEz57MC9IYLkA7yfHgldvmkQI=;
        b=ac1el+yxPG4nLE8u3XwJc5+WzGSH1HBG9h5SdNBWNNlOA5T0Zo7K2guVUnq8oc1Vyg
         JdBdGQlEvAZQ/ATycGFbvlPdbPCjXkxTGuOO2a/QG2klajDrLiDKKv2hd70+/B84XLSd
         6Uh6Gpp1xe+7uaoDBfdEs4RRugfvxtgzn7gJiy3DhvIrNBv1N/CeCKWQMgkN2d0zl21C
         OA2U1zJ0reMOTsxQVEnUcgo3Go69ZlcxUJQZF3cxJvgvcdIm7K+MdKhEtfhwjh0WonsP
         8e+VX3NPXhEeq3kZMC+v1LmEX4DYWs6cwWNQ8WpXjWRxItQ2PA+uyUiuNIPEvzHrW7hD
         k56w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v1EF2n19;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15si326879qkc.173.2019.10.24.08.54.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Oct 2019 08:54:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v1EF2n19;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNfRg-0004Y5-Hf
	for alex.bennee@linaro.org; Thu, 24 Oct 2019 11:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51322)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iNfOu-0001sS-NG
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 11:51:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iNfOt-0004ga-2Z
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 11:51:48 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:34643)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iNfOs-0004eq-PQ
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 11:51:46 -0400
Received: by mail-ot1-x341.google.com with SMTP id m19so21123503otp.1
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2019 08:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dQeMv4No2g8CptaRBeFEz57MC9IYLkA7yfHgldvmkQI=;
 b=v1EF2n19cHDweYSOCs8KF/H9Lz5/7ecOeuamD7fJ+RMN0oGjY6RrAfTMp5ijqbCVff
 oUNtYCwfKKGQm1trGDNYB5IzSaj0LJVEb0b9p4TsE9osQ0tWkmiDIiVJfLv4VY+30MbB
 NLxNCCP1HB3wQXScfGkaJy4iSt7w7HWDJl+/ozIKpbeIKPXzBcv4qXChkd2B6aRIs4PF
 04DSRYphRRj6FrTz9G3uYqDE8ndbBmbVPghebjMYAa8nznjbFLNbhBoxZESvxjlwVttc
 9RCOiOpFGVp2bXuYvq1I0DXTu027KkGwyEMUoGDWafbsemzUpYAlVIJaqw8LiTPxTUTw
 WMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dQeMv4No2g8CptaRBeFEz57MC9IYLkA7yfHgldvmkQI=;
 b=PxmcaiMXHh58N74KcKN0bszXPISq2eMQHIAMenjYoKI6tYeEjPLCM3eD92AZhocAUK
 g9sXWaMIa5/jycWOnTdPQdIN53KpAJq1GNbw1mt0OpVR2a6Lmr6FmpsD63YZn40VYZVS
 911sj9Q1Ir70hOdFwHgrf8Sxmg3r54oQSgJIn6Zg/Kw9g2/s7TKVeIH8Ub+JX+up+11y
 tGhJpJh7uzZoN82VJOxaNsy47nY3hwMWJHjuGbGTjYxsLOktgmmmmTHwCTcRw1subnMB
 K2aAtQWy+y/ygzRXE77Qir1JK0edcXlemzZsprPdKRVQR9Kj882t2OTvzZDpcJO9sX+f
 Lzug==
X-Gm-Message-State: APjAAAXOtoZYXB76lh5LbqM3lCHAowH6NXC6ZnNEZbso4Ejdau7tWwbW
 IdFG9FmsVei3VC2xPBM3GWhWYwmfoQN5A/xsRv5VMA==
X-Received: by 2002:a9d:708e:: with SMTP id l14mr12427465otj.135.1571932305937; 
 Thu, 24 Oct 2019 08:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <20191003230404.19384-1-philmd@redhat.com>
In-Reply-To: <20191003230404.19384-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Oct 2019 16:51:34 +0100
Message-ID: <CAFEAcA-rmPuKQyv8d-u-1UAMhy6yGAcF3csVDcvYVXMosZysYw@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] hw: Split RTC devices from hw/timer/ to hw/rtc/
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, QEMU Trivial <qemu-trivial@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jsu85pQ3VgOH

On Fri, 4 Oct 2019 at 00:04, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> Since v1: https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg03334.=
html
> - addressed review comments (described in patches 3 and 4)
> - added R-b/A-b tags
>
> Whole series now reviewed.

for the arm parts:
Acked-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM
