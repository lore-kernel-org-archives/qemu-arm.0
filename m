Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5070401lfp;
        Mon, 17 Feb 2020 05:28:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqxsxdx1nJG7vHMm+u9fRY4vzNxculKm+lqGbxr26hcPcH1cJBcWuPLRJmqbC5lJw0h4KlEt
X-Received: by 2002:a05:620a:12bc:: with SMTP id x28mr13522711qki.118.1581946100848;
        Mon, 17 Feb 2020 05:28:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581946100; cv=none;
        d=google.com; s=arc-20160816;
        b=KR2KvhqwESGGIEwBJrkeDFcFUgxxQLhPXXmIDA+OUnx5uCVGBw294WnUdP1k3ta3wK
         VUqO2xtuyE9r5BgBrirgF13NugesI2eAVc9sItW2x0vaKREo9s+IIwszaQH1wGHMUFT8
         f+96yau4PQLJOo13fo/SjmnxWB9Ml54tqoN4suZ2EqyJeVo46uicX4B8oQCgCZt7e5ye
         xFEGGtKtO5wm9At6Rf1eHD2B4hFXnT5z7RGdPl5yyLfEaeCwFt0DXJTJo5x6L6BNUriO
         3BRB3s7oJkTVlvFDibpYhZCJ+igmR1DKUv5eO1YU/G6EGp3sfAR2ccK1Hnrgvtd7hTZf
         W+XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version;
        bh=KeuzRvKcV/TyT35UKKsAZfo1CEvKSpxdk9zX5qslx4g=;
        b=jRgl4meaB3tKnfv+mtlG3pyfjOKK74OVTpiygBttBk+NN+OpWBHX7nW8goX1+uk9Yn
         Knh/PMxJiL47Y8AgQvron7m7Ptxv/WT/jmF3E3s5C7GWBVf901hXuvTP8uUdBSJb+UGj
         pd0cFjFfVeFFNNpEpnnqEA1D5ZKMlSymumCP+Loq+d+EhB1PFvXTnwsrA8mAy0E0QJUq
         TLM6FLO2GfJEZ+KPpZqqXdjRgSXcUDl2Ig2khTzzVxxcTMMy/QucwgaiSy+aAu7PinDI
         9Ew31Wa87mnu+40RpiF3Xs/igE5fbnuS35864fSd1WzLRXRj5kWaivqX2ZJH7Yq+TWZM
         iMQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4si300248qkm.81.2020.02.17.05.28.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 05:28:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3gRg-0003Ob-7u
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 08:28:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54347)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3gR9-0003KN-4A
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 08:27:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3gR8-0000XE-3A
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 08:27:47 -0500
Received: from mail-yw1-f65.google.com ([209.85.161.65]:34480)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3gR7-0000Wq-VO; Mon, 17 Feb 2020 08:27:46 -0500
Received: by mail-yw1-f65.google.com with SMTP id b186so7809565ywc.1;
 Mon, 17 Feb 2020 05:27:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KeuzRvKcV/TyT35UKKsAZfo1CEvKSpxdk9zX5qslx4g=;
 b=XjneHai3iHcBgfP9bINbg2hEZ4WH6CS1TN4bxR0sdmEo4an9kJgbOUOacgdGkSNSy4
 pMX/aX6dVPsXKokeZT5uHsT/eB+NfcCP7mkyaBoS5CuWjVbPrCxcYr8TVW1wcvo5dRiQ
 TqN+joU6XnykYE3jzNKPu4mQ5e1U25L21S30VKD0aPiKJbMySzg6Hb7yDSLdviXxMEQZ
 8s9SEPZFIkgQVI/xhwV4RhgCi/2xXrmVL50ni+dt5a0gHnmt8Rj4BaUSfjgeXdey4yYV
 uuTtJvf1DTIGCnKJvsfnh6aNMwI5DqLNlcFKKLMYD2HHLsu9ffNbSXf90V3xJUf2bl+U
 /fhA==
X-Gm-Message-State: APjAAAW0DJFA5hd+i/ifAmRydfE/4C0M/9SrwkwTinm31bdtIuJ5u8A9
 cSKSMVmwjP33SY4vltCrG7klQw4M78skQG7y3X4=
X-Received: by 2002:a81:8443:: with SMTP id u64mr12329941ywf.443.1581946063828; 
 Mon, 17 Feb 2020 05:27:43 -0800 (PST)
MIME-Version: 1.0
References: <20200217105657.31506-1-f4bug@amsat.org>
 <CAFEAcA8AT2YE0kzWjRmR1ZsSFxH7bs1t_G8Bs+J-QsCzMXPg3w@mail.gmail.com>
In-Reply-To: <CAFEAcA8AT2YE0kzWjRmR1ZsSFxH7bs1t_G8Bs+J-QsCzMXPg3w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 17 Feb 2020 14:27:32 +0100
Message-ID: <CAAdtpL7riRLot1zyTF3KaHMw2wAWaBzk_vOQqxukwfMfCTNb2Q@mail.gmail.com>
Subject: Re: [PATCH v2] hw/misc/iotkit-secctl: Fix writing to 'PPC Interrupt
 Clear' register
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.161.65
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9ggm9t3vumkG

On Mon, Feb 17, 2020 at 12:28 PM Peter Maydell <peter.maydell@linaro.org> w=
rote:
> On Mon, 17 Feb 2020 at 10:57, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> >
> > Fix warning reported by Clang static code analyzer:
> >
> >     CC      hw/misc/iotkit-secctl.o
> >   hw/misc/iotkit-secctl.c:343:9: warning: Value stored to 'value' is ne=
ver read
> >           value &=3D 0x00f000f3;
> >           ^        ~~~~~~~~~~
> >
> > Fixes: b3717c23e1c
> > Reported-by: Clang Static Analyzer
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> > v2: Corrected bitwise-not precedence (pm215)
> > ---
> >  hw/misc/iotkit-secctl.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/misc/iotkit-secctl.c b/hw/misc/iotkit-secctl.c
> > index 609869821a..43cf0f9970 100644
> > --- a/hw/misc/iotkit-secctl.c
> > +++ b/hw/misc/iotkit-secctl.c
> > @@ -340,7 +340,7 @@ static MemTxResult iotkit_secctl_s_write(void *opaq=
ue, hwaddr addr,
> >          qemu_set_irq(s->sec_resp_cfg, s->secrespcfg);
> >          break;
> >      case A_SECPPCINTCLR:
> > -        value &=3D 0x00f000f3;
> > +        s->secppcintstat =3D ~(value & 0x00f000f3);
>
> Should be &=3D, not =3D. Otherwise you set all the other
> bits in the register.

Yes, I'm sorry.
