Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1836244lff;
        Wed, 18 Dec 2019 22:53:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqw+44kFGNCFscrxhEYDAWl0lPOi8vTbWAWGmKr+Ne/EHix79BGytsT5Cc6Sat2LgKX6uUZf
X-Received: by 2002:ad4:5487:: with SMTP id q7mr6353367qvy.19.1576738386533;
        Wed, 18 Dec 2019 22:53:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576738386; cv=none;
        d=google.com; s=arc-20160816;
        b=bqRzQvqRb873rC0Zmi7+sgmll4nBnLkSBvXn/MneYlA/aYzTQZ6HaSXIJAA8CoV/zW
         6YOkepX9DyFtwQYU+8Xij0hsQ8Kk3ewu/8bfiqrDl939hHwpfyZIFFZk/8vWgZ0ZN0zD
         Z2jJPYgEMa7AEUXcvDCw85gFCcWRhMna30AivPs4oRqVKcY0rKO5rV3p9ewf/Fk7za3c
         xpljAEi+R4BqoXkdOrXULgdeEtK/qq8nqooPAn+AYeXRGEzKPBC9tB+vQ+ELK9NI+YFb
         txBtNwMC+WVYJ+H+aCrN2fp0BYTU3KhuE5T7DcseN+egJxlaJrRhbgkK8ycFqhRktB8d
         zLzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:subject:cc:to:from:dkim-signature;
        bh=qxzXx+71n4empVY6KRCherhudWNv9rkASvNeiT9MKds=;
        b=IbcTHCXrKedEWDG/+OO8XJb4arAeCPoE3oDcxfHshC/Qpk1kkk6O8Shi3hXJxSGot6
         GBMzyDmSpT/jNBQ1+KwsbQhuH5JPyVBsfgJEOPA45lAqPW8QsIV0myzkiXmgSyKenbeP
         ZQaFshVThjDS+6+weCNjjLG7hYAsi4ZaCntWU5ti024YHUSVqUgdvMvnFi/k5zvz6pGj
         /QdeqmynbSBRXibWp9sYG64K6KbcyKxn17ERfoyJLid+tGlNSZjdsngDbPJ6coNMvYJX
         fVrz4yBaxIrGYfgwDx9gLyxOmq4o3ZhJmO9kHmTHq0z8Mlf4YJVdlLfhxQBJCJ7tfe3E
         MS2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dSI1MOjF;
       spf=pass (google.com: domain of armbru@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id x2si2951519qkn.86.2019.12.18.22.53.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Dec 2019 22:53:06 -0800 (PST)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dSI1MOjF;
       spf=pass (google.com: domain of armbru@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576738386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qxzXx+71n4empVY6KRCherhudWNv9rkASvNeiT9MKds=;
	b=dSI1MOjF55gFam0bbfeMLgwirRPnoWajuDH/PSrr88lyBxiXZdbM1uMujp72poYq09dltb
	tmFwIZgAxf/jkIKmT9GZCDaYH2Q36w+hlVRudUKucZ9+7rKFEfqnNQkNV1pTqxruPoARaj
	lIEVBim33SPJfk2Vl+S8Ta2Tqzg+bLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-M1OOxZS7ODWAYahXKaS8VA-1; Thu, 19 Dec 2019 01:53:04 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EFE7184BEC0;
	Thu, 19 Dec 2019 06:52:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-42.ams2.redhat.com [10.36.116.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1788D10013A1;
	Thu, 19 Dec 2019 06:52:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 9EAB111386A7; Thu, 19 Dec 2019 07:52:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  qemu-devel@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  Li Zhijian <lizhijian@cn.fujitsu.com>,  Paul
 Burton <pburton@wavecomp.com>,  Jason Wang <jasowang@redhat.com>,  KONRAD
 Frederic <frederic.konrad@adacore.com>,  Gerd Hoffmann
 <kraxel@redhat.com>,  "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
  Alberto Garcia <berto@igalia.com>,  Sagar Karandikar
 <sagark@eecs.berkeley.edu>,  qemu-block@nongnu.org,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Markus Armbruster <armbru@redhat.com>,  Halil Pasic
 <pasic@linux.ibm.com>,  Christian Borntraeger <borntraeger@de.ibm.com>,
  "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,  Joel Stanley
 <joel@jms.id.au>,  Samuel Thibault <samuel.thibault@ens-lyon.org>,
  Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,  Antony Pavlov
 <antonynpavlov@gmail.com>,  Laurent Vivier <lvivier@redhat.com>,  Corey
 Minyard <minyard@acm.org>,  Amit Shah <amit@kernel.org>,  Alistair Francis
 <alistair@alistair23.me>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
  Fabien Chouteau <chouteau@adacore.com>,  qemu-s390x@nongnu.org,
  qemu-arm@nongnu.org,  Peter Chubb <peter.chubb@nicta.com.au>,  Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,  Kevin Wolf
 <kwolf@redhat.com>,
  qemu-riscv@nongnu.org,  Igor Mitsyanko <i.mitsyanko@gmail.com>,  Bastian
 Koppelmann <kbastian@mail.uni-paderborn.de>,  Cornelia Huck
 <cohuck@redhat.com>,  Max Reitz <mreitz@redhat.com>,  Zhang Chen
 <chen.zhang@intel.com>,  Michael Walle <michael@walle.cc>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Thomas Huth <huth@tuxfamily.org>,  Aleksandar
 Markovic <amarkovic@wavecomp.com>,  Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [RFC PATCH 13/14] hw/char/terminal3270: Explicit ignored QEMUChrEvent in IOEventHandler
References: <20191217163808.20068-1-philmd@redhat.com>
	<20191217163808.20068-14-philmd@redhat.com>
Date: Thu, 19 Dec 2019 07:52:46 +0100
In-Reply-To: <20191217163808.20068-14-philmd@redhat.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 17 Dec 2019 17:38:07
 +0100")
Message-ID: <87sglgx0w1.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: M1OOxZS7ODWAYahXKaS8VA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: O/zBMT+0ZsbX

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> The Chardev events are listed in the QEMUChrEvent enum. To be
> able to use this enum in the IOEventHandler typedef, we need to
> explicit when frontends ignore some events, to silent GCC the
> following warnings:
>
>     CC      s390x-softmmu/hw/char/terminal3270.o
>   hw/char/terminal3270.c: In function =E2=80=98chr_event=E2=80=99:
>   hw/char/terminal3270.c:156:5: error: enumeration value =E2=80=98CHR_EVE=
NT_BREAK=E2=80=99 not handled in switch [-Werror=3Dswitch]
>     156 |     switch (event) {
>         |     ^~~~~~
>   hw/char/terminal3270.c:156:5: error: enumeration value =E2=80=98CHR_EVE=
NT_MUX_IN=E2=80=99 not handled in switch [-Werror=3Dswitch]
>   hw/char/terminal3270.c:156:5: error: enumeration value =E2=80=98CHR_EVE=
NT_MUX_OUT=E2=80=99 not handled in switch [-Werror=3Dswitch]
>   cc1: all warnings being treated as errors
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: qemu-s390x@nongnu.org
> ---
>  hw/char/terminal3270.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/char/terminal3270.c b/hw/char/terminal3270.c
> index 6859c1bcb2..9e59a2d92b 100644
> --- a/hw/char/terminal3270.c
> +++ b/hw/char/terminal3270.c
> @@ -166,6 +166,9 @@ static void chr_event(void *opaque, int event)
>          sch->curr_status.scsw.dstat =3D SCSW_DSTAT_DEVICE_END;
>          css_conditional_io_interrupt(sch);
>          break;
> +    default:
> +        /* Ignore */
> +        break;
>      }
>  }

I doubt the /* Ignore */ comment is worth its keep.

Splitting PATCH 02-13 feels excessive to me.
