Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2283895wrw;
        Wed, 7 Nov 2018 07:50:38 -0800 (PST)
X-Google-Smtp-Source: AJdET5eXRmBLcbooMQlagQftbcDwnkCJEWY6wwJwuLe10XTobp6FzanaIfSOW0+xRlkyYw27mOti
X-Received: by 2002:ac8:668c:: with SMTP id d12mr721646qtp.242.1541605838441;
        Wed, 07 Nov 2018 07:50:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541605838; cv=none;
        d=google.com; s=arc-20160816;
        b=kqE4/4q5160xg+kdCwsEWPhnVkCICCK4a5nBGzQLJ1g7CwsUCKYQ29ipgiIMQkbA0j
         XpUzIrHtFQ/fLPpveBAmy38gLY+Xtc1mCqksPJ0S0jpVkbefYqaYY0uZT3rGVox5jnz4
         FjHSGf0ubPugjqPnRaIHPWrHEZTS+HXE+lNzuLfjuTAqF0T5xdR3Kdola3rnWeAoN4kl
         EuNSWrrrckotCI4QLiwzMHCe4f6zdkU8ANZ9XncXZc4EC1T0HzbAd6zE6kxU1M1kR46I
         jo1N5+5Cl1yKttlGeAdiVpKMlM82O86/2zKwJNYrpstoLTuDEGLu00+eIV1mrdXov0xR
         MwMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=AoxkZ6tnyY4H8hILH0lGHJMwh/Jczvxdp1jN6GZL3qQ=;
        b=krcWmH6Z34a3WhKgDvwNAkgEOPJrOU45pKQXhFh94IOO3FYKHioaxuKnAUYdqYN++P
         nEDWjN125Ml2LvL2i/1i7jrCUD+yrdp/F1wzbePKtgDrq/K4BTk25BEPSZAWo5O+gSBN
         jz67XWd6YMKK5DQeer8lAFAowHZtbcR8/J0AI6+U7hwtAmTo2eQPxfNZbM415GWj/evU
         ctYN55nQuI9VLhrGaGpzauGZZD9XL4FoWTo4NYp6nIoenBPSLC3Yr9sl2iIayi579gNE
         kKnrs6mPtm4Ie7NYroIaJ1IFW5Eb16XXM3B3qCvvKD5fZoQDRKK2VLvXAnNTr3XoRRab
         MEhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="lVHo/S9S";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a18si723284qvj.20.2018.11.07.07.50.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Nov 2018 07:50:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="lVHo/S9S";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49025 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKQ6H-0005uK-Ud
	for alex.bennee@linaro.org; Wed, 07 Nov 2018 10:50:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43023)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1gKQ67-0005si-NL
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 10:50:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1gKQ5s-0004dL-Eo
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 10:50:17 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:34695)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1gKQ5o-0004N4-Pw; Wed, 07 Nov 2018 10:50:09 -0500
Received: by mail-wr1-x442.google.com with SMTP id j26-v6so17951324wre.1;
	Wed, 07 Nov 2018 07:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=AoxkZ6tnyY4H8hILH0lGHJMwh/Jczvxdp1jN6GZL3qQ=;
	b=lVHo/S9SZRObCRVog/LbxyAfyDijAYYT+myYid2mttaYygLg7JsaxmxTocW3OCEKsE
	Sep6vpX3KIjvyB4UOqOYNO43UhRUbBlhLbX9TOuQ9bGFk2CD7PbnLWn9HXcmo7cwZEOF
	QeBI28EOgBWK1uw1ekJuCYD/84jg98xDNE1tP3yRxejx6OyayfbTjqjj57vPn8U3A28p
	Kllnpm5wX5vI0jZHFndU24nOG8a5Ya6+Ck3i6LrZ5hIt0E6lIyIwTOMPnGy01WAs2Jru
	CimDm0M2JBGs+dPIHS4WmaXs3ZfMaQYHA5+EC7Laj6rSJh6NdHWNKqruEp+ts+YMSRHh
	gpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=AoxkZ6tnyY4H8hILH0lGHJMwh/Jczvxdp1jN6GZL3qQ=;
	b=SJehJMdKJwQxftMNSD3ARB4gB6hznFoxx3G7DY8f/4g1vsdoxJ6T6z2hRt+xG+BJ2p
	H5x7iSmvNsK69BI04MMJ9d0tBlcxRt+9gtVDviqfs/TCVtXQ6RgpG3RlzxZzEFXb0xV1
	EatAuuZfw8xJxL7XCdyRYVCyXVJKF1w7UziRBvwoIel4zu61SNvi6kvqw6iMvETiYylf
	VX43JDpqkACJulrGV2T/SUjHjtzdhTymYDWO49qRExdciJkjt++ADff6/QphqFbOh5UF
	g2OARzuCtd62mUJ9ohWUUMcroz2OKKRTtBFNjMQYpdgacz3xwWoFrJoTAVOvoDfsIG5i
	EcvA==
X-Gm-Message-State: AGRZ1gIE8AH8txcG2zrP84JmL9iXkaGJ44AeToAmnIXJRNwm55KCg5x7
	9fzkT4Qm7B/tIoqc3WH8GlktozlFAu1Z9KjYsnW2qB5ySeU=
X-Received: by 2002:adf:bd0f:: with SMTP id
	j15-v6mr662203wrh.267.1541605806973; 
	Wed, 07 Nov 2018 07:50:06 -0800 (PST)
MIME-Version: 1.0
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
	<20181107123652.23417-14-marcandre.lureau@redhat.com>
In-Reply-To: <20181107123652.23417-14-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 7 Nov 2018 19:49:54 +0400
Message-ID: <CAJ+F1CLWy0xbb-Pc7yUNpHh70GsSTKJ=v+TeoTGJOThYO_xE2g@mail.gmail.com>
To: QEMU <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.2 v3 13/14] hw/i386: add
 pc-i440fx-3.2 & pc-q35-3.2
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, amit@kernel.org,
	"open list:sPAPR pseries" <qemu-ppc@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>, hpoussin@reactos.org,
	Igor Mammedov <imammedo@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	atar4qemu@gmail.com, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8FIiEVnB2DbP

Hi

On Wed, Nov 7, 2018 at 4:49 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> The following patch is going to add compatiblity parameters for
> qemu <=3D 3.1.
>

I realize this may be good enough for x86 i440/q35 machines, but what
about other machines & architectures?

What do we officially support, for migration, across different versions?

It seems we have versionized:
- arm "virt" machines
- "s390-ccw-virtio" machines
- ppc "pseries" machines
- x86 piix/q35 machines

At least, I think I should update this patch to add new 3.2 machines for th=
ose.

Is there any way to check compat properties are handled properly for
those various machines? It looks like it is generally lacking. For
example, if there is a new HW_COMPAT, it would be nice if something
failed if a corresponding machine hasn't been added.

It also looks like there is a bit of code duplication and a bit too
much macros :) unfortunately, I don't yet have a good idea how to
improve things...

> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/hw/compat.h  |  3 +++
>  include/hw/i386/pc.h |  3 +++
>  hw/i386/pc_piix.c    | 21 ++++++++++++++++++---
>  hw/i386/pc_q35.c     | 19 +++++++++++++++++--
>  4 files changed, 41 insertions(+), 5 deletions(-)
>
> diff --git a/include/hw/compat.h b/include/hw/compat.h
> index 6f4d5fc647..70958328fe 100644
> --- a/include/hw/compat.h
> +++ b/include/hw/compat.h
> @@ -1,6 +1,9 @@
>  #ifndef HW_COMPAT_H
>  #define HW_COMPAT_H
>
> +#define HW_COMPAT_3_1 \
> +    /* empty */
> +
>  #define HW_COMPAT_3_0 \
>      /* empty */
>
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 136fe497b6..c37d4333a0 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -294,6 +294,9 @@ int e820_add_entry(uint64_t, uint64_t, uint32_t);
>  int e820_get_num_entries(void);
>  bool e820_get_entry(int, uint32_t, uint64_t *, uint64_t *);
>
> +#define PC_COMPAT_3_1 \
> +    HW_COMPAT_3_1
> +
>  #define PC_COMPAT_3_0 \
>      HW_COMPAT_3_0 \
>      {\
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index dc09466b3e..ba371bfcd7 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -428,21 +428,36 @@ static void pc_i440fx_machine_options(MachineClass =
*m)
>      machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
>  }
>
> -static void pc_i440fx_3_0_machine_options(MachineClass *m)
> +static void pc_i440fx_3_2_machine_options(MachineClass *m)
>  {
>      pc_i440fx_machine_options(m);
>      m->alias =3D "pc";
>      m->is_default =3D 1;
>  }
>
> +DEFINE_I440FX_MACHINE(v3_2, "pc-i440fx-3.2", NULL,
> +                      pc_i440fx_3_2_machine_options);
> +
> +static void pc_i440fx_3_1_machine_options(MachineClass *m)
> +{
> +    pc_i440fx_3_2_machine_options(m);
> +    m->is_default =3D 0;
> +    m->alias =3D NULL;
> +    SET_MACHINE_COMPAT(m, PC_COMPAT_3_1);
> +}
> +
> +static void pc_i440fx_3_0_machine_options(MachineClass *m)
> +{
> +    pc_i440fx_3_1_machine_options(m);
> +    SET_MACHINE_COMPAT(m, PC_COMPAT_3_0);
> +}
> +
>  DEFINE_I440FX_MACHINE(v3_0, "pc-i440fx-3.0", NULL,
>                        pc_i440fx_3_0_machine_options);
>
>  static void pc_i440fx_2_12_machine_options(MachineClass *m)
>  {
>      pc_i440fx_3_0_machine_options(m);
> -    m->is_default =3D 0;
> -    m->alias =3D NULL;
>      SET_MACHINE_COMPAT(m, PC_COMPAT_2_12);
>  }
>
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 532241e3f8..64d6ea65d5 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -311,19 +311,34 @@ static void pc_q35_machine_options(MachineClass *m)
>      m->max_cpus =3D 288;
>  }
>
> -static void pc_q35_3_0_machine_options(MachineClass *m)
> +static void pc_q35_3_2_machine_options(MachineClass *m)
>  {
>      pc_q35_machine_options(m);
>      m->alias =3D "q35";
>  }
>
> +DEFINE_Q35_MACHINE(v3_2, "pc-q35-3.2", NULL,
> +                   pc_q35_3_2_machine_options);
> +
> +static void pc_q35_3_1_machine_options(MachineClass *m)
> +{
> +    pc_q35_3_2_machine_options(m);
> +    m->alias =3D NULL;
> +    SET_MACHINE_COMPAT(m, PC_COMPAT_3_1);
> +}
> +
> +static void pc_q35_3_0_machine_options(MachineClass *m)
> +{
> +    pc_q35_3_1_machine_options(m);
> +    SET_MACHINE_COMPAT(m, PC_COMPAT_3_0);
> +}
> +
>  DEFINE_Q35_MACHINE(v3_0, "pc-q35-3.0", NULL,
>                      pc_q35_3_0_machine_options);
>
>  static void pc_q35_2_12_machine_options(MachineClass *m)
>  {
>      pc_q35_3_0_machine_options(m);
> -    m->alias =3D NULL;
>      SET_MACHINE_COMPAT(m, PC_COMPAT_2_12);
>  }
>
> --
> 2.19.1.708.g4ede3d42df
>
>


--=20
Marc-Andr=C3=A9 Lureau
