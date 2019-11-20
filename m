Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1715497lfc;
        Wed, 20 Nov 2019 01:07:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqx/+wx0oIzjjAAJ5hKbA1I5DNjZB/2KqR5w6NS5YXJw2ndDgGHoIpTCB7/56aOhaWSz204f
X-Received: by 2002:a17:906:25c5:: with SMTP id n5mr3852932ejb.126.1574240848068;
        Wed, 20 Nov 2019 01:07:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574240848; cv=none;
        d=google.com; s=arc-20160816;
        b=Ny6ihbNSqS5EHGpvJTH+PE/Av0Sa5jYJ4+UgbXHWMwsbGDa10FFnyK2k2+U7nQD2Ny
         3trd0+mKZ9pCUFV/VpFWKVn0huR6aU4YaBGWtA3lpOniIvdpBajaNygQCYbflpEiFxFY
         sJAbmdZ4YNoHzYRNi1c6BR0P0D4CBNtRFGso36M78rYn50fG73fToKmJFORKS7p4uf7e
         XAxSoijLvo71SmUfLVIb7IV5vHXcvux2EJXZeP/VQwLVRGuDqT4tfnzPTQaXsz+NmDOK
         v77TsZiakxDSaZKPdPbNFThuJLZBhpkU/wwGCrs2pqn+/yTIBjbZCNl84IkT1lz8SD5u
         ZUlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ALFXgvw2+Ywh0La2rY/2AgSmoI+KxNje5YV530vNzaQ=;
        b=EadhhjV1C1yLxbfJUF44LtDItDxYrQhRUWCpldOA7xeEO8/Q9o99j4BGeRlr3BszJ6
         hGIrljeT5ojgrkYmL+62PHNqlg2Bi2I9kHdVxFw4Ul0Nob9JPoDUlvHVvp8nM8Ws5aHX
         dWsgYiwOo8zT3bcYSPtcvAzMcRFN9QXSQaHLyIvZX7FOF8RlS2iz00vwsfCDYMV55xt8
         6yOhNFmB7YIvbSxon1SFgL0LC1EOKOEq+m+nsqFuObGR57Vpgw5TcEVTK/9P2RxKFgK3
         9e4oECLWltnqrWCllo3uqr8jMaXNXjCTcAxBxBeyrfDZap0WmMp1wiSiaQx16+593Glj
         9Bdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VPWR5zFV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w19si18847147edd.51.2019.11.20.01.07.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2019 01:07:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VPWR5zFV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iXLxP-0007Aq-3h
	for alex.bennee@linaro.org; Wed, 20 Nov 2019 04:07:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39481)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlureau@redhat.com>) id 1iXLxD-00074g-1g
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 04:07:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1iXLxB-0001Xe-Vo
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 04:07:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60879
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1iXLxB-0001XC-RJ
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 04:07:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574240833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ALFXgvw2+Ywh0La2rY/2AgSmoI+KxNje5YV530vNzaQ=;
 b=VPWR5zFVV5whfRA94HPSYiuHfNkTPocZNyn6/oHfD0mL8mq6W4Un6PbfjcRSCmIfPArffV
 CHM3lkk6G+YZUy0Ni1onP3Tph3FyK6+yZiUsvvaAHWD/p/YAY6PUR3aPic72t7C58JGt0R
 FuJmi0/d8CshF+Jp1X+x4sQdrEG3hmM=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-uBgqBDUZOWi2yGMprHq42w-1; Wed, 20 Nov 2019 04:07:12 -0500
Received: by mail-ot1-f70.google.com with SMTP id w14so13587282otk.21
 for <qemu-arm@nongnu.org>; Wed, 20 Nov 2019 01:07:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ALFXgvw2+Ywh0La2rY/2AgSmoI+KxNje5YV530vNzaQ=;
 b=PIQ96UB5+FoMFvOqpHAANtgr8DHOnwWRrqkY0HyymgCQ717X/CGvTd1LMk62FjgfCO
 doDLQBXkwkj/vzX0IknjtFUNQduGRsQHX/nnVfXYhHc6RfeHLmf0RZXgDNb5jPHOI8Dq
 x/njj6cUBVnwQwiIS/D1QDRsIv7S42xTaUm6O+T9B5gSJeAluCRaiFvcZ2Bp5baIZMFc
 VlJT5+zwqwowz1MG45zN/EZBh9l7Ua3uTmalXaVJGBu3iPnb6hDbHoLgARge+Do13PDu
 zCejo8yQK3yIbsftrivLGEkXwZd2uCB6XUsnOUIC0HDYkGSoIUqZHpzm6GisiJIt8mDf
 +CWQ==
X-Gm-Message-State: APjAAAXgpSHgcUXID7+o9msTxpCEoOofz8TRZhTB15xbSb4mHfrL4DBG
 3E2/HwXmGFSPWJffr8D1RbYJrtZiR6xpL61TQ7ihFixfFYZjkCEZG9frct2lPRw7wsswYIbbY+J
 WojoetzKf4oFFarZ7P+8JlSLjCFo4
X-Received: by 2002:a9d:5cc7:: with SMTP id r7mr1058767oti.331.1574240831124; 
 Wed, 20 Nov 2019 01:07:11 -0800 (PST)
X-Received: by 2002:a9d:5cc7:: with SMTP id r7mr1058729oti.331.1574240830680; 
 Wed, 20 Nov 2019 01:07:10 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-11-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-11-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 20 Nov 2019 13:06:59 +0400
Message-ID: <CAMxuvawDuKD9_6w06KP9m2HqWkAx6HEtSVLFjWLY=yE9AgpFRw@mail.gmail.com>
Subject: Re: [PATCH v3 10/33] serial: add "instance-id" property
To: qemu-devel <qemu-devel@nongnu.org>
X-MC-Unique: uBgqBDUZOWi2yGMprHq42w-1
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>,
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
X-TUID: SH6Py6qCdWKv

Hi

On Wed, Oct 23, 2019 at 9:33 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> This property will be used to move common vmstate registration to
> device realize in following patch.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

I realize adding a "instance-id" property instead of calling
qdev_set_legacy_instance_id() manually doesn't really help.
Patch dropped.

> ---
>  hw/char/serial.c         | 3 +++
>  include/hw/char/serial.h | 1 +
>  2 files changed, 4 insertions(+)
>
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index 069d8715d0..0b61a71e4e 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -990,6 +990,7 @@ SerialState *serial_init(int base, qemu_irq irq, int =
baudbase,
>      s->irq =3D irq;
>      qdev_prop_set_uint32(dev, "baudbase", baudbase);
>      qdev_prop_set_chr(dev, "chardev", chr);
> +    qdev_prop_set_int32(dev, "instance-id", base);
>      serial_realize_core(s, &error_fatal);
>      qdev_set_legacy_instance_id(dev, base, 2);
>      qdev_init_nofail(dev);
> @@ -1003,6 +1004,7 @@ SerialState *serial_init(int base, qemu_irq irq, in=
t baudbase,
>  static Property serial_properties[] =3D {
>      DEFINE_PROP_CHR("chardev", SerialState, chr),
>      DEFINE_PROP_UINT32("baudbase", SerialState, baudbase, 115200),
> +    DEFINE_PROP_INT32("instance-id", SerialState, instance_id, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> @@ -1073,6 +1075,7 @@ SerialState *serial_mm_init(MemoryRegion *address_s=
pace,
>      s->irq =3D irq;
>      qdev_prop_set_uint32(dev, "baudbase", baudbase);
>      qdev_prop_set_chr(dev, "chardev", chr);
> +    qdev_prop_set_int32(dev, "instance-id", base);
>
>      serial_realize_core(s, &error_fatal);
>      qdev_set_legacy_instance_id(dev, base, 2);
> diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
> index 3dc618598e..b472c7cd57 100644
> --- a/include/hw/char/serial.h
> +++ b/include/hw/char/serial.h
> @@ -78,6 +78,7 @@ typedef struct SerialState {
>
>      QEMUTimer *modem_status_poll;
>      MemoryRegion io;
> +    int instance_id;
>  } SerialState;
>
>  extern const VMStateDescription vmstate_serial;
> --
> 2.23.0.606.g08da6496b6
>

