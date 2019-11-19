Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp320858lfc;
        Tue, 19 Nov 2019 02:23:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqzOOrm4qtTswBledhCyxrdRnxaDJtyEXaNjQz/rHtC5qwZj+ub5c538cYIT0Pb3O+IXI+a8
X-Received: by 2002:a37:a655:: with SMTP id p82mr28026469qke.61.1574159002311;
        Tue, 19 Nov 2019 02:23:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574159002; cv=none;
        d=google.com; s=arc-20160816;
        b=xx6QP1LVjM1eaFgIaDX7lve38semNgncXp7agsDueGShsQAHvQsV3fFRK6PJ65CQYC
         r5JpOOlq6qE8xCcDzj7hkaSm1cXw8iQqeVAmVaOkRszO4abk/VCKhdyOtBkJ5c0tP+2J
         5XWsNdZS+z8EO3rSIoWVbl9jtI3MgJth6zaPbfiJfIIfcce7aubbp+/BA2ymIU3SXktA
         4rRS7iHHIp8hjwADOp/WWHyTgb1cdqtOjRGI73f9s6Jx5jOzwAx5wMwIj0Wk8GQ2OF0Y
         YZJoMzFMl2GvBIgZPweVIN4hBg8J7fm8EANAts9YEUHiLOFK4JDyZ0JUl/50dpsx1oPC
         NzgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=xXBWRZBtRNpFMOmDiNKH/+l5cfB3RN+RKsFJito5LPc=;
        b=R/yki7ukpTYLWEkBc3Hkn5UuH5PraHCZUhY9CHRJNz0gxxgaqgUlqWHO3IPACJP0ZM
         UlnQyo5MqyZIdUP9D8B4eQAuV48KkGjnktb6tId2TGw/TVFSHFDvbY4u2wSvFYhc9POc
         +OgFjGLsAXDj7D28JP5NlQYshcRzdFEjPMj2eCwAKIFNKVPE+9ugvyjhHKBgIK/AyY2Z
         1PNh/kuhETFQXMmFhB3Q98LAGNhR4in6VdbBrC9Zm86XzAY57tmsrjGS1xNQ/1uk8/OU
         bKeWcR2vzjkYC0HOy+z+ZnmUlSlomDASLQBFfKDvQBPbSQI+S084fRi6q1FZqzxq6mGb
         r78A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="af9Gh/+S";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v138si12904481qka.146.2019.11.19.02.23.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Nov 2019 02:23:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="af9Gh/+S";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iX0fJ-0001J0-BN
	for alex.bennee@linaro.org; Tue, 19 Nov 2019 05:23:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38366)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlureau@redhat.com>) id 1iX0f7-0001GA-Lk
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 05:23:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1iX0f6-0001wZ-IM
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 05:23:09 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36389
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1iX0f6-0001wL-E9
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 05:23:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574158988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xXBWRZBtRNpFMOmDiNKH/+l5cfB3RN+RKsFJito5LPc=;
 b=af9Gh/+StSdkljM3PwZU2Q162msbnTwRmhw/smEjg3CNmwMVHdY8UFgiVmks4Whz4ilrYq
 2cve3oiGxWgCnwVMnzAe0zzEXEY4TT20usTuXC9XKUodmXEP9VcYEZis6LZCYcxDH5/WpC
 W2ESuAMAtzdZevLXsWmLfH9wVW1D+fA=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-BjitvLveNlev5UDuvdJwJQ-1; Tue, 19 Nov 2019 05:23:06 -0500
Received: by mail-ot1-f69.google.com with SMTP id 107so11708151oth.14
 for <qemu-arm@nongnu.org>; Tue, 19 Nov 2019 02:23:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xXBWRZBtRNpFMOmDiNKH/+l5cfB3RN+RKsFJito5LPc=;
 b=T////22zbMCSjXf+jTHiHGWmvUZ0yU+4rHPoDMLyh1n8lXBMOCRm+gImZN9gc7BNoy
 5VCBMXphxD49F3CC30PXeLJa0bs0UMKbrgwsKyaJjnmkZh7v08reKlm61hUG50ZBDdmY
 wNZgA5zptsZP1PkOcqKz3WTIUany3Ch/VUDy7MBN61piuUDRF/bQlkmtX9OyGi1/o7tF
 Cu1OGkafxJQW/0pHhmB6Ka7FeN0FJrI9rGJXpFE09jcZy4z903x2JhSQFXdfQ7Ehw8+x
 4sF26tJSrwHYcShb0R8kq7BLpAGryOY7sECxTYJLUjIipIKzhnD8OtUiyAJg8FhFs3Wh
 F4cQ==
X-Gm-Message-State: APjAAAUUXsM2U7mATafOcuY7wn8yfkaoiYj3GxjAtGcUZGg6bOFVYg97
 33KMgGqZr0+S91Ro+n73hcesFlckVsTz4X+3d2LhueoLoZL0+lURovsbpQAELK+t8slx0p7JQly
 Jsv7ti6lqc61jrkkzwjtjAdE/REvq
X-Received: by 2002:aca:484e:: with SMTP id v75mr3452455oia.6.1574158985268;
 Tue, 19 Nov 2019 02:23:05 -0800 (PST)
X-Received: by 2002:aca:484e:: with SMTP id v75mr3452425oia.6.1574158984991;
 Tue, 19 Nov 2019 02:23:04 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-8-marcandre.lureau@redhat.com>
 <CAFEAcA8GHqiaHSKdTjzTY_mWxYpDLZhXLYc98kjPGLUnzsG3oQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8GHqiaHSKdTjzTY_mWxYpDLZhXLYc98kjPGLUnzsG3oQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 19 Nov 2019 14:22:53 +0400
Message-ID: <CAMxuvawcYnH4pp8PitMO6KcTz_GdwF7i=zJxepofsN1o9Yh65w@mail.gmail.com>
Subject: Re: [PATCH v3 07/33] serial: register vmsd with DeviceClass
To: Peter Maydell <peter.maydell@linaro.org>
X-MC-Unique: BjitvLveNlev5UDuvdJwJQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Paul Burton <pburton@wavecomp.com>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O5UPvmGjuAh5

On Mon, Nov 18, 2019 at 6:22 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Wed, 23 Oct 2019 at 18:33, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com> wrote:
> >
> > QOM-ify further.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  hw/char/serial.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/char/serial.c b/hw/char/serial.c
> > index c839035fdd..4af8b0ce4c 100644
> > --- a/hw/char/serial.c
> > +++ b/hw/char/serial.c
> > @@ -990,8 +990,7 @@ SerialState *serial_init(int base, qemu_irq irq, in=
t baudbase,
> >      s->baudbase =3D baudbase;
> >      qemu_chr_fe_init(&s->chr, chr, &error_abort);
> >      serial_realize_core(s, &error_fatal);
> > -
> > -    vmstate_register(NULL, base, &vmstate_serial, s);
> > +    qdev_set_legacy_instance_id(dev, base, 2);
> >      qdev_init_nofail(dev);
>
> Did you test whether migration still works from a QEMU
> version without this patch to one with it? (The migration

Yes, I thought I did test correctly, but I realized testing with x86
isn't correct.

So with arm/musicpal for ex, I can migrate from before->after, however
after->before won't work. Is that ok?

> vmstate code is too complicated for me to be able to figure
> out whether passing the 'dev' pointer makes a difference
> to whot it names the state sections and whether the
> 'qdev_set_legacy_instance_id' suffices to avoid problems.)

I don't see a way to fix after->before, because the instance id is
initially 0 with the new code, and the old code expect a different
value.

