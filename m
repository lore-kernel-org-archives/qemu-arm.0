Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1719889wru;
        Thu, 4 Jul 2019 00:49:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxRSJ2LFx1RswAUTo8HZMqTqUlcTtpyGEt3Jr/GnSNO83R8kTzj9ewub9BmtTRjodgt+em+
X-Received: by 2002:a50:b34a:: with SMTP id r10mr47073541edd.84.1562226598258;
        Thu, 04 Jul 2019 00:49:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562226598; cv=none;
        d=google.com; s=arc-20160816;
        b=xzwxwSg2bg/ckDQJWWaT9mhj7q+/r1Zq1hkWr73i0jQGf9YV4GKRaNFLoZt/JLo3bf
         ZsufH3Mw6+xgs0ljPHfn4wTTdqZ6s4sxh+xWK4b8+P9gr9yzUU/gEBuoCyc22vJNFOlu
         MOt0RQhsm0j8PRWBdA8mhTYk8evj10kreOvmUqCuJ70qdnPYy8ykpYfXcGmyyjHE0dy+
         Y0SDBeJ8zL6Wa3QAv4OrciK5wGoZOmN8/GMPjsMUqlkRi6ctWs97Z73mYbsgbyP5csPa
         weU5f3m9ERax46zitY7EAP18ciKsajhu7VhzrUGOP3xKK2iFE5812WW11AVERF/0LS7d
         KbNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=c2arl7QFyQiG434wqZ8b5wc77IqMT54t33qFFEulGPk=;
        b=Cde8mHSxGNwBUYw3LDaB/eSZGsg034iGnoGzfnYC/GKpJKSFjp+kch+XznLxbbCcVY
         KExHR78g1xtwSQByvPuZVlXk5kf1ufpct4cil5F3++eGv7NMjjOeWGYx4FLPqpSLMxsq
         LvfrvV3V2sAHWMy4hvUqA6hrecQ+svd1JE0OS2CQZpBeu+k7u6lzLq1B2ipAf8FjfRA/
         Vbw9zx2sGOiiqBypu6iRnS6HLFQXhxr2fJxTx887R1v6lIJJnCFgahzJjlNjVic8zZHs
         rb0G/x/ho8iGS187Qyq0CP/u2K2f02CNv25gmi8OYzweQOq74M4EMtqYAOK/BXT3YxRT
         efYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b="XOs/Xq6G";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3si4198145edq.159.2019.07.04.00.49.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2019 00:49:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b="XOs/Xq6G";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hiwVB-0006v5-AW
	for alex.bennee@linaro.org; Thu, 04 Jul 2019 03:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49533)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <joel.stan@gmail.com>) id 1hiwUl-0006ut-Rz
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 03:49:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1hiwUi-0006O1-N0
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 03:49:31 -0400
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:41933)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1hiwUe-0006Ia-CJ; Thu, 04 Jul 2019 03:49:26 -0400
Received: by mail-qt1-x843.google.com with SMTP id d17so5729365qtj.8;
 Thu, 04 Jul 2019 00:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=c2arl7QFyQiG434wqZ8b5wc77IqMT54t33qFFEulGPk=;
 b=XOs/Xq6GiSKSWJxHLpMT8Tx6OcMJRgUznAjM0WuDVDNj9/z1MQ6WGSJ+SweAAKcjrS
 iyeen7PZw1k3awhEsHzvILOdWlxktd4BxMQLEsXwPz33gf1QOT7SGrtJIXGwvJ2FVm9b
 fBmNAIyV6tr/lTVwyHHxLnPNGBU5ORRZiaYmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c2arl7QFyQiG434wqZ8b5wc77IqMT54t33qFFEulGPk=;
 b=sHlFmXBuZDo/6A4qGwqzhfb7PWaZ0OKFZmZgYU41iPysHpNp8L3XcVjWqjsb6Ai3v0
 NJsrC95LfX751IhdcO5zarBdJZvUBv7UvkxYGQv8t+UWOsXtFuK5SHSa0ZUdcnW1x0eG
 HYbx/OLaWrWqCjAsOO1l1nfOJR4/v/4MtzY45aO6GMgdWE//MHehjucc1gc4v1CQAZXR
 OjFoPI4ZKgUDR7fHBrJrjTiYUVbvry4ZocaAwzpRcYrjxAwZCBKXFvNBUf3YiAVJX00g
 E4vL6HhGjZvOOJsO9ulEMazLrJUfzr6S/z10vPtj3/IW2B+IWgH2LZ/Du7Dao8uKJU1w
 eBAg==
X-Gm-Message-State: APjAAAV1/6mhoT/t/54GkljFdEGCZaykc5l1LilokjV/2dYt/w3fEoy6
 el8Tq9X2ry5UNQlzcblvKfWfBgA8heXn/XPPKuAtCBTW
X-Received: by 2002:a0c:ae31:: with SMTP id y46mr35975520qvc.172.1562226561081; 
 Thu, 04 Jul 2019 00:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190618165311.27066-1-clg@kaod.org>
 <20190618165311.27066-4-clg@kaod.org>
 <CAFEAcA_wCFE0BL_LjF+04MBPa2XnVgCKk4SP4nPrBjrcjmNVVQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_wCFE0BL_LjF+04MBPa2XnVgCKk4SP4nPrBjrcjmNVVQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 4 Jul 2019 07:49:09 +0000
Message-ID: <CACPK8XfdqDARHV4TupC+c-qsgscOn4kWjtYdpdR+GxOZQzNNMA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::843
Subject: Re: [Qemu-arm] [PATCH v2 03/21] hw: timer: Add ASPEED RTC device
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Iy/FfX2OLSa0

On Tue, 2 Jul 2019 at 19:19, Peter Maydell <peter.maydell@linaro.org> wrote=
:
>
> On Tue, 18 Jun 2019 at 17:53, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >
> > From: Joel Stanley <joel@jms.id.au>
> >
> > The RTC is modeled to provide time and date functionality. It is
> > initialised at zero to match the hardware.
> >
> > There is no modelling of the alarm functionality, which includes the IR=
Q
> > line. As there is no guest code to exercise this function that is
> > acceptable for now.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> Hi; Coverity complains about this function (CID 1402782):
>
> > +static void aspeed_rtc_calc_offset(AspeedRtcState *rtc)
> > +{
> > +    struct tm tm;
> > +    uint32_t year, cent;
> > +    uint32_t reg1 =3D rtc->reg[COUNTER1];
> > +    uint32_t reg2 =3D rtc->reg[COUNTER2];
> > +
> > +    tm.tm_mday =3D (reg1 >> 24) & 0x1f;
> > +    tm.tm_hour =3D (reg1 >> 16) & 0x1f;
> > +    tm.tm_min =3D (reg1 >> 8) & 0x3f;
> > +    tm.tm_sec =3D (reg1 >> 0) & 0x3f;
> > +
> > +    cent =3D (reg2 >> 16) & 0x1f;
> > +    year =3D (reg2 >> 8) & 0x7f;
> > +    tm.tm_mon =3D ((reg2 >>  0) & 0x0f) - 1;
> > +    tm.tm_year =3D year + (cent * 100) - 1900;
> > +
> > +    rtc->offset =3D qemu_timedate_diff(&tm);
> > +}
>
> because the tm_wday field of 'struct tm tm' is not initialized
> before we call qemu_timedate_diff(). This is a false
> positive because the "read" of this field is just the place
> in qemu_timedate_diff() that does "struct tm tmp =3D *tm;"
> before calling mktime(), and mktime() ignores tm_wday.
> We could make Coverity happy by using a struct initializer
> on 'tm' here; on the other hand we don't do that anywhere else
> which calls qemu_timedate_diff(), so maybe I should just mark
> this a false positive?

I don't have an opinion on which option to take. Perhaps mark it as a
false positive?

Cheers,

Joel
