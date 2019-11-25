Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp3127064lfc;
        Mon, 25 Nov 2019 05:07:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqx6rVm5zUOZAVONpx4D3+gjh4jwlYZOxxCT8096mw+EZ1OGpsAfpe9PIbQW/m9O0h2/yIMA
X-Received: by 2002:a50:b86c:: with SMTP id k41mr18586873ede.181.1574687263421;
        Mon, 25 Nov 2019 05:07:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574687263; cv=none;
        d=google.com; s=arc-20160816;
        b=yGg2JtdBznZlc4gn1lHRScbZKsI/cbWPngkxKsCKKwshQu4OOcEBWKC/yc51/aghGP
         EbqHhRAcXHHkSgE8noOBCWg1hc18oWi2kDlbo6X8bgjmlfJobA1F8ArRLJSiGStA/4q2
         Yy7BDmn2iAskrzFHqc4TZKlFucD5IZKRI2VzUgeGu25+m+ssO+ByXfJY6yya/G4UbAP9
         TmMfs93VCogw9MJZvBesQ2ck2btUStiSyMS27+x3t2LAtV9Afv4rEu8QKHZ4aYQ2hndQ
         xNru1CFYt+7uhQojTKnPMTwz/uQk3CBTKP7VxONTTssDAT6rQ7Z95g1vKH0BNk91KshQ
         StNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Lr6W4KR9wCbeu3QHPLleS62fXfo9S/hzHQ4EieD02R8=;
        b=ZgBdQ37jsveHnUApdmv0D3gz5Z+3D7uV95T9tR2aKTdPZjaUyI9Lg587kLNM0W5pCu
         RhPNwx0SKTlbmAKpXD11cJlUP5Do+ugxA+EX8PgOpxMNcDOR3dY/Sa65u4swjc0d8kvS
         NriZAGS+EsVDEODZwB5bbMN5P/cs6+tw8OYh17AuiFbp21pB3hKdTZjqgwILDzSbCYD3
         ARL0QVwKG/0mwF8ZuORRgAob+ZWcjLCk3r2ToWv725WPe9OTijmS2FnfezUDPjRL/L+B
         VOcnx8uWHX0mtqq0coeJwAeS8KlgjH6KI5kxKYCqOZ5X2wCYX7+0/r4m8WIbqnoe7pb5
         004A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vhdnqh5d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v2si4356215ejh.313.2019.11.25.05.07.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Nov 2019 05:07:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vhdnqh5d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iZE5e-0005xK-Cv
	for alex.bennee@linaro.org; Mon, 25 Nov 2019 08:07:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39243)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iZE3x-0004Qv-MZ
 for qemu-arm@nongnu.org; Mon, 25 Nov 2019 08:06:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iZE3s-0005yG-9P
 for qemu-arm@nongnu.org; Mon, 25 Nov 2019 08:05:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33991
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iZE3q-0005vF-S7
 for qemu-arm@nongnu.org; Mon, 25 Nov 2019 08:05:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574687148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lr6W4KR9wCbeu3QHPLleS62fXfo9S/hzHQ4EieD02R8=;
 b=Vhdnqh5dwaDJQAEuvCUgdYqjYB6SyqINqNUr1cjUmqjeATDNW3lrtieNp6i6jSHWKU7PPo
 fUKpcte6SJwXHdq5s0d5oeQQJPKNliOPzt7UjUsACFZt6J83DiHdLbW7MleuPsaifxpx/x
 3p830dJgZPcmFthRheklbcbU07oYIDc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-xf-lz6fHMxuqTsqcWu4yiQ-1; Mon, 25 Nov 2019 08:05:47 -0500
Received: by mail-wm1-f72.google.com with SMTP id p19so5307396wma.8
 for <qemu-arm@nongnu.org>; Mon, 25 Nov 2019 05:05:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mgG0bIcOz7g59k5sOe8AK4HwNncmlMwW5U4m6dEUMwA=;
 b=lVFAHXoR+lVSPiC7trXkn/FIjV6c2Ff57St1lQvxlotr1giX7UTK8IxYEGyVwIfLkG
 dBw7xXqiA5k5jkVwKw99V1eb6/8gU2Rz5A0LOskiM5YD0cJjjcSz3g6CDmxbU7ogQOfO
 5xW5Zgnq+NTCRtQwPOXtLXTmSoc6GhdLQjJJtSCUTvdyNNEtWD2kwrNJWvxtIsaFAbby
 1/w49JipVh4TTjZrCqbaYzG2CHqmC5W7bqiQudCYqQsyGcPmYnOdojaQW/NdUuUiTuwD
 Y1c/mV80mbQPC0G+liBdGtI4FMb4lYel+YetknSBTL6f4QXTM+MEm6YPlQ2ImmKGF+Qt
 b0mQ==
X-Gm-Message-State: APjAAAVsxrjqn2WWynEjwhSXZg1QX/FCrbTAzplGX798+UJc9J8rFAkk
 3brNvmH/xhH5TQtAzFhHeEN8eNfmcdJYZPNEw3NLBPpq5hLQVLxd8KmBiiw4TY1xI2HhP4oezqf
 A3vwUF/0JYLAl
X-Received: by 2002:adf:e387:: with SMTP id e7mr16114352wrm.180.1574687145558; 
 Mon, 25 Nov 2019 05:05:45 -0800 (PST)
X-Received: by 2002:adf:e387:: with SMTP id e7mr16114323wrm.180.1574687145301; 
 Mon, 25 Nov 2019 05:05:45 -0800 (PST)
Received: from [192.168.1.35] (182.red-88-21-103.staticip.rima-tde.net.
 [88.21.103.182])
 by smtp.gmail.com with ESMTPSA id o187sm8561351wmo.20.2019.11.25.05.05.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2019 05:05:44 -0800 (PST)
Subject: Re: [PATCH v6 2/9] hw/core/clock-vmstate: define a vmstate entry for
 clock state
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20190904125531.27545-1-damien.hedde@greensocs.com>
 <20190904125531.27545-3-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e024d6ba-42a7-5f67-7cdd-edfc1b3a73e4@redhat.com>
Date: Mon, 25 Nov 2019 14:05:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190904125531.27545-3-damien.hedde@greensocs.com>
Content-Language: en-US
X-MC-Unique: xf-lz6fHMxuqTsqcWu4yiQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, ehabkost@redhat.com,
 alistair@alistair23.me, mark.burton@greensocs.com, marcandre.lureau@redhat.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6LC9TIA1f65O

On 9/4/19 2:55 PM, Damien Hedde wrote:
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
> This was in the previous reviewed commit. But it can't be in the
> clock.c file in order to allow linux-user builds.
> ---
>   hw/core/Makefile.objs   |  1 +
>   hw/core/clock-vmstate.c | 25 +++++++++++++++++++++++++
>   include/hw/clock.h      |  9 +++++++++
>   3 files changed, 35 insertions(+)
>   create mode 100644 hw/core/clock-vmstate.c
>=20
> diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
> index c66a5b2c6b..8fcebf2e67 100644
> --- a/hw/core/Makefile.objs
> +++ b/hw/core/Makefile.objs
> @@ -4,6 +4,7 @@ common-obj-y +=3D bus.o reset.o
>   common-obj-y +=3D resettable.o
>   common-obj-$(CONFIG_SOFTMMU) +=3D qdev-fw.o
>   common-obj-$(CONFIG_SOFTMMU) +=3D fw-path-provider.o
> +common-obj-$(CONFIG_SOFTMMU) +=3D clock-vmstate.o
>   # irq.o needed for qdev GPIO handling:
>   common-obj-y +=3D irq.o
>   common-obj-y +=3D hotplug.o
> diff --git a/hw/core/clock-vmstate.c b/hw/core/clock-vmstate.c
> new file mode 100644
> index 0000000000..c781369c15
> --- /dev/null
> +++ b/hw/core/clock-vmstate.c
> @@ -0,0 +1,25 @@
> +/*
> + * Clock migration structure
> + *
> + * Copyright GreenSocs 2019
> + *
> + * Authors:
> + *  Damien Hedde <damien.hedde@greensocs.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "migration/vmstate.h"
> +#include "hw/clock.h"
> +
> +const VMStateDescription vmstate_clockin =3D {
> +    .name =3D "clock",
> +    .version_id =3D 0,
> +    .minimum_version_id =3D 0,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT64(frequency, ClockIn),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> diff --git a/include/hw/clock.h b/include/hw/clock.h
> index fd11202ba4..e7efb6ad17 100644
> --- a/include/hw/clock.h
> +++ b/include/hw/clock.h
> @@ -34,6 +34,15 @@ struct ClockOut {
>       QLIST_HEAD(, ClockIn) followers; /* list of registered clocks */
>   };
>  =20
> +/*
> + * vmstate description entry to be added in device vmsd.
> + */
> +extern const VMStateDescription vmstate_clockin;
> +#define VMSTATE_CLOCKIN(_field, _state) \
> +    VMSTATE_CLOCKIN_V(_field, _state, 0)
> +#define VMSTATE_CLOCKIN_V(_field, _state, _version) \
> +    VMSTATE_STRUCT_POINTER_V(_field, _state, _version, vmstate_clockin, =
ClockIn)
> +
>   /**
>    * clock_out_setup_canonical_path:
>    * @clk: clock
>=20

