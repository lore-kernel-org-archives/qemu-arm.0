Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4931236lfm;
        Tue, 14 Apr 2020 05:24:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypJvPE4SsMaYZH+3ppxnagRHz8FrGeYyVEt7viBTAUdCnGmjqJIqrV95tW6IHT5Sp5uIKhw0
X-Received: by 2002:ac8:6d2c:: with SMTP id r12mr8570163qtu.355.1586867085130;
        Tue, 14 Apr 2020 05:24:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586867085; cv=none;
        d=google.com; s=arc-20160816;
        b=bPyFm+1d8W/80nVwMsFxnWtRmpMoc7rcc+EAamC5mQVAKe3w37YJ3f9RPsOWvPG/qt
         0aagNtKUn4lxIBWxpoVWqQhI3wFgFDtiam+Rrb2AU0n5xQ7qR9KP2ZFqEoxeDm0q6SJz
         2ER5bMr4aNpF9fgtwqG6RlU3y08oi3MRL7R/4uzqE+bpN1xDHxpIy/cmtL3erw7Jxhep
         1mQpEsPWqJ9lqWn7aLLm1mps1f2en8P4QyIPISzaA+mnX0/bgWxkVnKAoYDMR1BIMmKA
         BQTX3J9pGdYv+khdDw5d9xrLotpe+nRPfIy8VnjAdJF6GzO1F/E1eaUS3m/OUshEFh9h
         XVyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=wXoNTxagrBENC/0KW0iW+MvxrJXef9bprCdqYiXxfTw=;
        b=CekaXF8MCeRf887T9yumZDD3R70n9cLBVwAcD0/NrJ9ic8M+UTydMFeaVfpyqp38dt
         z2dRlctnM0cN57vMy0sOicJkEmaFa8kjBypU43yquG/dYXPU0sWQqnrSdbJxr7Czol0e
         ZSiPeLLqLetqY0Mv6dZmYFXrcwhxyYhoZIIKofl6IbYz9fcVVzc7yoMiN4E1aQ8SZOgj
         0s64LChYNxXskT0MX+EPgNICbF5g2z6e7+rdFnDlvuv4AtaVswkSmw2CNUO52lJKZj43
         ddieS35BjOgSeX3tuyu8CCxgNaoqcfh3tz84dPcnQXhWQzzBxEgWSRZmRARlQYKF7kb/
         iXBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Y5vwu9xu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l16si7008718qvz.59.2020.04.14.05.24.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 05:24:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Y5vwu9xu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOKcO-00007f-I1
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 08:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32819)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jOKc3-0008Ne-Rg
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 08:24:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jOKc2-0004qB-D5
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 08:24:23 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:51212
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jOKc2-0004q2-A7
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 08:24:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586867061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wXoNTxagrBENC/0KW0iW+MvxrJXef9bprCdqYiXxfTw=;
 b=Y5vwu9xu25aDDIWOGtabikNOBe8IhP1jjlumDbSOXR2f8JLjl6L/L6VriF7LWyN+Lg0ShZ
 eXS4wiulO1lWJaeAhCpiTiULYj4j22pgBn7VaKuaJaH99lDGd0KcAK1P/4r24qWxcByHSB
 DI5Pn1+extfKUFFfYsDZXkwQHB66EgE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-ot-gVnUZMz-i6wegAri9kw-1; Tue, 14 Apr 2020 08:24:13 -0400
X-MC-Unique: ot-gVnUZMz-i6wegAri9kw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D33FC10509AB;
 Tue, 14 Apr 2020 12:24:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-20.ams2.redhat.com
 [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2E8060BE2;
 Tue, 14 Apr 2020 12:24:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 49D4011385C8; Tue, 14 Apr 2020 14:24:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-5.1 v3 02/24] scripts/coccinelle: Script to simplify
 DeviceClass error propagation
References: <20200412223619.11284-1-f4bug@amsat.org>
 <20200412223619.11284-3-f4bug@amsat.org>
Date: Tue, 14 Apr 2020 14:24:07 +0200
In-Reply-To: <20200412223619.11284-3-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 13 Apr 2020 00:35:57
 +0200")
Message-ID: <875ze2tfvc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Joel Stanley <joel@jms.id.au>,
 =?utf-8?Q?Marc-Andr?= =?utf-8?Q?=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Wen Congyang <wencongyang2@huawei.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: an8Q2JwTtLO4

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> When a device uses an Error* with data not modified before realize(),
> this call can be moved to init(). Add a Coccinelle patch to find such
> uses.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  ...implify-init-realize-error_propagate.cocci | 69 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 70 insertions(+)
>  create mode 100644 scripts/coccinelle/simplify-init-realize-error_propag=
ate.cocci
>
> diff --git a/scripts/coccinelle/simplify-init-realize-error_propagate.coc=
ci b/scripts/coccinelle/simplify-init-realize-error_propagate.cocci
> new file mode 100644
> index 0000000000..2e3ec4d98a
> --- /dev/null
> +++ b/scripts/coccinelle/simplify-init-realize-error_propagate.cocci
> @@ -0,0 +1,69 @@
> +// Find error-propagation calls that don't need to be in DeviceClass::re=
alize()
> +// because they don't use information user can change before calling rea=
lize(),
> +// so they can be moved to DeviceClass:initfn() where error propagation =
is not
> +// needed.
> +//
> +// Copyright: (C) 2020 Philippe Mathieu-Daud=C3=A9
> +// This work is licensed under the terms of the GNU GPLv2 or later.
> +//
> +// spatch \
> +//  --macro-file scripts/cocci-macro-file.h \
> +//  --sp-file \
> +//    scripts/coccinelle/simplify-init-realize-error_propagate.cocci \
> +//  --timeout 60
> +//
> +// Inspired by https://www.mail-archive.com/qemu-devel@nongnu.org/msg692=
500.html
> +
> +
> +@ match_class_init @
> +TypeInfo info;
> +identifier class_initfn;
> +@@
> +    info.class_init =3D class_initfn;
> +
> +
> +@ match_instance_init @
> +TypeInfo info;
> +identifier instance_initfn;
> +@@
> +    info.instance_init =3D instance_initfn;
> +
> +
> +@ match_realize @
> +identifier match_class_init.class_initfn;
> +DeviceClass *dc;
> +identifier realizefn;
> +@@
> +void class_initfn(...)
> +{
> +    ...
> +    dc->realize =3D realizefn;
> +    ...
> +}

I'm afraid this misses realize() methods of DeviceClass subclasses.
Consider PCI device "i6300esb" (picked just because it's simple).

pci_device_class_init() sets DeviceClass method realize() to
pci_qdev_realize().  pci_qdev_realize() does the work common to all PCI
devices, and calls PCIDeviceClass method realize() for the work specific
to the PCI device at hand.

i6300esb_class_init() sets PCIDeviceClass method realize() to
i6300esb_realize().

Your first rule should match i6300esb_info alright, and thus identify
i6300esb_class_init() as a class_init() method.

But your third rule can't match i6300esb_class_init()'s

    k->realize =3D i6300esb_realize;

because @k is a PCIDeviceClass, not a DeviceClass.

I think it also misses cases that have a realize(), but no
instance_init().

Finding only some instances of an anti-pattern can still be useful.  But
you should explain the script's limitations then, both in the script and
the commit message.

> +
> +
> +@ propagate_in_realize @
> +identifier match_realize.realizefn;
> +identifier err;
> +identifier errp;
> +identifier func_with_errp =3D~ "(?!object_property_set_link)";

What are you trying to accomplish with this lookahead assertion?

> +symbol error_abort, error_fatal;
> +position pos;
> +@@
> +void realizefn@pos(..., Error **errp)
> +{
> +    ...
> +    Error *err =3D NULL;

Why is this line required for a match?

> +    <+...
> +    func_with_errp(..., \(&error_abort\|&error_fatal\));
> +    ...+>
> +}
> +
> +
> +@ script:python @
> +initfn << match_instance_init.instance_initfn;
> +realizefn << match_realize.realizefn;
> +p << propagate_in_realize.pos;
> +@@
> +print('>>> possible moves from {}() to {}() in {}:{}'
> +      .format(initfn, realizefn, p[0].file, p[0].line))
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 642c8e0b6b..6203543ec0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2058,6 +2058,7 @@ F: scripts/coccinelle/err-bad-newline.cocci
>  F: scripts/coccinelle/error-use-after-free.cocci
>  F: scripts/coccinelle/error_propagate_null.cocci
>  F: scripts/coccinelle/remove_local_err.cocci
> +F: scripts/coccinelle/simplify-init-realize-error_propagate.cocci
>  F: scripts/coccinelle/use-error_fatal.cocci
> =20
>  GDB stub

