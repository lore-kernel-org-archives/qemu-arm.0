Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4683597wrm;
        Mon, 21 Oct 2019 07:54:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqypNsEYNTSJF++XD63+xdG0a94iSTU4hKzn8cKzuc1NuYTphTj94bwVmxQc7vzVuwwx0fkr
X-Received: by 2002:ad4:4503:: with SMTP id k3mr22894533qvu.155.1571669685428;
        Mon, 21 Oct 2019 07:54:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571669685; cv=none;
        d=google.com; s=arc-20160816;
        b=CEDws3C0Sp8rnXQUfFawaZmv6cmPiUTdepFUaL68WRd4eA/XSEp9YulhHjdqS5wTCl
         AaDz4AsS2UTf9ehoF++XGnAF6EA12w6xw77TkDdH3KCvEFhtaFDAcSmJB5mGl5RyjrOq
         0bD3uuthr5BLeJ1wMmwwmxOn26Q4zEYZNhlt6JEbfOb+ayOVIwOstdmS3rxWcnWA+rk8
         xEMxrNb/Y+aS0+HjDfv/SLYAADPw5e01nfGdITFWXAyih2TUoVwoCu4CQwpwfcpf+Cwl
         RFXo4DDZGqVdoUJ1VxWPXQF0ff26bhb6pC+H6S5iv3ZTRZCR4DDZSq4vp73LEhFGXpQK
         Jd6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=YOV3359kB0o0kiDu+bNswIjmAgEvm93N/KQebRVRU2k=;
        b=yXbNiVYkQn4rYoPEuPyM12971SeRHEb2+EBYVnvUIJtTHqbE3VU9P/M3sarPcG/Y3P
         DJXqXIXbSwaWU28CUbNFKWeW4qoROBB9EgK4rQ93GC1NEQJR3BcclX4cDRlr6v4YRCSk
         P587jyu+zEHDgpWpc0VYosMdFgflOwi2k70GpsEITjXaNGL9rTARMGBnRsYeFiGZ7xPT
         5xsH+BwNZH1g0Vr2/YH8qQ6MM3cn+piD3c5EfG0e2b56/NktK/w8rvKppc+vd4HZT2gJ
         /ezR2Q4c1E+VngHX4JNH+4T1TaZ0B7W49lRJ3hDGd5/qC8LeEG4XFYZ6qqMw0PV5eA+7
         HIEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=QX1Q8Cdc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si13270944qtm.24.2019.10.21.07.54.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 07:54:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=QX1Q8Cdc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMZ52-0003SE-PS
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 10:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51493)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cminyard@mvista.com>) id 1iMZ39-0003Ik-QB
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 10:52:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cminyard@mvista.com>) id 1iMZ2y-0002Ce-Pt
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 10:52:41 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:42606)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <cminyard@mvista.com>) id 1iMZ2x-0002Bn-W2
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 10:52:36 -0400
Received: by mail-ot1-x341.google.com with SMTP id b16so427501otk.9
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 07:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=YOV3359kB0o0kiDu+bNswIjmAgEvm93N/KQebRVRU2k=;
 b=QX1Q8CdcYLsKO+X8TAgrkRTHmjElSqLys5bOdSTRALUwwVU8vyiteusmYyOWmR9I1F
 C3EKveO+u/wCZcA0gpa1VfQNN+pO4hzkbo/K6xCXTQ8ZogfPHeBcB9zwdOoB1ATX6TB9
 C1CqfChyY2zBQZ7ycONhOXn8PPkTVGn/lwOCA6yWxYH0eKBUnBaiAVrHp0O/nhteJo72
 RjINrOcMv4QHQ61uHKBlAKUH6nLOMaZOhK5Oe6o0Gj5i4R8w5+clgVgXFIw08WwBdj67
 MQtCP43WnfWgUtApVXWFPht2KFQPdVOKK8ixw7KOZSX2HHX6Dzyz0/YA702gGzDRIinj
 j7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=YOV3359kB0o0kiDu+bNswIjmAgEvm93N/KQebRVRU2k=;
 b=FxTSXb7WguNQmSPDcy8DYfs7QUwY83dmfZlWnOJr7gcELhygjamS5XFAskWuhs0NHn
 JArvkhCpW1u9+HVdoapnbFNmwycjWJQHtqX9ezvM9VrKdOe2nEawqBUVcvA/zwA0J8V7
 Pk3wmtCVskEv3zkLrspLhtrxZV+MViw3z4YkPxV3ozCREN8ekTBh8tP4s/vCaXmb4+bN
 Uws+y7Py+oyOvtrBFR8C1OXg8Q2e0wyphX1g5OBx6MWZnmthM0Nn3yZUt1hJLvgCLt/K
 seP2LIuHPAtgBsgmuBDecgnPBcfIyIiXGKcSvUWZT9/N17ja2R+uKUYtXvllk+FYfgTc
 xUiQ==
X-Gm-Message-State: APjAAAXhtNqcJPM1Cvq3yh8jd2LQumT2nT6mCHAzNKOzYZaHDyY2AG70
 DKqRiPRSWh4kRa0AtEA4aGCzAA==
X-Received: by 2002:a9d:6d11:: with SMTP id o17mr18426263otp.333.1571669554050; 
 Mon, 21 Oct 2019 07:52:34 -0700 (PDT)
Received: from t560 ([47.184.136.59])
 by smtp.gmail.com with ESMTPSA id w201sm3820064oie.44.2019.10.21.07.52.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 21 Oct 2019 07:52:33 -0700 (PDT)
Date: Mon, 21 Oct 2019 09:52:31 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 09/14] smbus-eeprom: remove PROP_PTR
Message-ID: <20191021145231.GI25427@t560>
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
 <20191018154212.13458-10-marcandre.lureau@redhat.com>
 <CAFEAcA-4A=SyrxsMwN0_HzSi89JAYZz8KzuDWh8O47X_WF0NtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA-4A=SyrxsMwN0_HzSi89JAYZz8KzuDWh8O47X_WF0NtQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: cminyard@mvista.com
Cc: Magnus Damm <magnus.damm@gmail.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jason Wang <jasowang@redhat.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9ToGVU3PEGUp

On Fri, Oct 18, 2019 at 06:20:40PM +0100, Peter Maydell wrote:
> On Fri, 18 Oct 2019 at 16:43, Marc-André Lureau
> <marcandre.lureau@redhat.com> wrote:
> >
> > Instead, set the initial data field directly. Since it is only 256
> > bytes, let's simply copy it to avoid invalid pointers issues.
> 
> (Commit message says you copy the 256 bytes, but the code
> doesn't seem to do any copying?)
> 
> > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Ah, the smbus code. Corey had a go at cleaning this up
> a while back; I can't remember if we found a reason why
> we had to keep the weird use of a pointer property here, or
> if we just wanted to avoid dragging yet another thing into
> an already large patchset.
> 
> What we're actually trying to set up here is always 256
> bytes of data. What's the right way to pass a QOM device
> a small chunk of data like that?

Yeah, we discussed this at the time, and IIRC we decided to leave it
like it is until someone came up with a use case.  My guess is that
the intent was to be able to pass in a buffer from the command line
or something like that, but that was never completed.

I'm ok with this change, the code is strange as it is, and I don't see
any uses of this propery in a quick scan of the code.

-corey

> 
> > ---
> >  hw/i2c/smbus_eeprom.c | 17 ++++++++---------
> >  1 file changed, 8 insertions(+), 9 deletions(-)
> >
> > diff --git a/hw/i2c/smbus_eeprom.c b/hw/i2c/smbus_eeprom.c
> > index 54c86a0112..533c728b3b 100644
> > --- a/hw/i2c/smbus_eeprom.c
> > +++ b/hw/i2c/smbus_eeprom.c
> > @@ -44,7 +44,7 @@
> >  typedef struct SMBusEEPROMDevice {
> >      SMBusDevice smbusdev;
> >      uint8_t data[SMBUS_EEPROM_SIZE];
> > -    void *init_data;
> > +    uint8_t *init_data;
> >      uint8_t offset;
> >      bool accessed;
> >  } SMBusEEPROMDevice;
> > @@ -129,14 +129,14 @@ static void smbus_eeprom_reset(DeviceState *dev)
> >
> >  static void smbus_eeprom_realize(DeviceState *dev, Error **errp)
> >  {
> > +    SMBusEEPROMDevice *eeprom = SMBUS_EEPROM(dev);
> > +
> >      smbus_eeprom_reset(dev);
> > +    if (eeprom->init_data == NULL) {
> > +        error_setg(errp, "init_data cannot be NULL");
> > +    }
> >  }
> >
> > -static Property smbus_eeprom_properties[] = {
> > -    DEFINE_PROP_PTR("data", SMBusEEPROMDevice, init_data),
> > -    DEFINE_PROP_END_OF_LIST(),
> > -};
> > -
> >  static void smbus_eeprom_class_initfn(ObjectClass *klass, void *data)
> >  {
> >      DeviceClass *dc = DEVICE_CLASS(klass);
> > @@ -146,9 +146,8 @@ static void smbus_eeprom_class_initfn(ObjectClass *klass, void *data)
> >      dc->reset = smbus_eeprom_reset;
> >      sc->receive_byte = eeprom_receive_byte;
> >      sc->write_data = eeprom_write_data;
> > -    dc->props = smbus_eeprom_properties;
> >      dc->vmsd = &vmstate_smbus_eeprom;
> > -    /* Reason: pointer property "data" */
> > +    /* Reason: init_data */
> >      dc->user_creatable = false;
> >  }
> >
> > @@ -172,7 +171,7 @@ void smbus_eeprom_init_one(I2CBus *smbus, uint8_t address, uint8_t *eeprom_buf)
> >
> >      dev = qdev_create((BusState *) smbus, TYPE_SMBUS_EEPROM);
> >      qdev_prop_set_uint8(dev, "address", address);
> > -    qdev_prop_set_ptr(dev, "data", eeprom_buf);
> > +    SMBUS_EEPROM(dev)->init_data = eeprom_buf;
> >      qdev_init_nofail(dev);
> >  }
> >
> > --
> > 2.23.0.606.g08da6496b6
> 
> thanks
> -- PMM
