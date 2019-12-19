Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2137425lff;
        Thu, 19 Dec 2019 04:16:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqwR/K5MPvHaeFgmsSPZUK0L9T+uwwOu4mCcmHsX/o7EV5PVUOBrXVr3OrxLSaXEA2q5f/3S
X-Received: by 2002:adf:f789:: with SMTP id q9mr9312195wrp.103.1576757769004;
        Thu, 19 Dec 2019 04:16:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576757768; cv=none;
        d=google.com; s=arc-20160816;
        b=j6XNPCNl/6EZDJ4TpK7LifeY4W/sh+7iZfvdfGmukbndBoiomS0oe6O20p7OzdI19C
         YZiP6zNzOz9eaCsMpmt0vlrgwRIli+mSwpo+mvJwGXeltlhWaNRziQtjshkkJwiMeZkI
         akgEg5JscfMc2g0Sc02xjHdso5rVdKShyXaFdHJOc61rg46//lZs4NX4r038G7KGJlBn
         MeAm0EkzCL5eDVr19J1f0mpbkeq/KT2WLZFwuiWx0b0QkpfA91PbMaegcxC1ArDSSDv9
         OOByW59FPQohYjoc1jafUnU8G4UvF8iIFpMwIl+QDzmGoqK44BuQ/A2v3Pp/5pqiy1en
         HXVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=BG6PkLmSL2pjmhhB/FbOkgZYwFjUekTzuEU4/82gflc=;
        b=BpgzZfdpq5r4IecDpcJmjywhW7vSIFfmcfFBGYLkeoxLiO3FoUkH1voneLxpAX8UZc
         vdpFJefJKfdjcRTVWVnmkFr5RZ2dgSD4zgUjK4d+Ahruz0IsSJJVf52XSDC61v48yi8E
         jmtwK9CFpCVm2FMAF1LSrUxOCtDXMAWcfIbMcqxGPaItlpmQ46BmCGqE9iY0qEeumpjA
         mkpdiKin7uvFue2TH3Lm7nRkgfRzxpqY+UJWS9k8H8ACi5H06TNrkSCq5yTxUhFJ5mjK
         0dDgtrd5ATwLyDHjUP/qVNsWPU/jqBtU0nMZbyXFjVtPALMbcSU3FFbWuXx2TvdMUEAL
         CJ9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bW5OeIrp;
       spf=pass (google.com: domain of cohuck@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id b4si4274342edf.125.2019.12.19.04.16.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Dec 2019 04:16:08 -0800 (PST)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bW5OeIrp;
       spf=pass (google.com: domain of cohuck@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576757767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BG6PkLmSL2pjmhhB/FbOkgZYwFjUekTzuEU4/82gflc=;
	b=bW5OeIrpMdji8JaMgBdaOTp2iR4OX4KtNG6aWzeI3lrBCMnPp6qWbTACuTlv4va+KWGJRJ
	AzQFl1aNkt0WzKtatx/Je6xqEmKoZooIr68C/0h+LLej1iThGKtu88AJVoKtxgT3OBQ5y4
	OH9qSWzdDNJSD8yp8Fy+7O5S5DNfeyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-tSMJREfxMfiGGg5W44LUMg-1; Thu, 19 Dec 2019 07:16:06 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DCF5107ACC5;
	Thu, 19 Dec 2019 12:16:01 +0000 (UTC)
Received: from gondolin (ovpn-117-134.ams2.redhat.com [10.36.117.134])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 248825C54A;
	Thu, 19 Dec 2019 12:15:30 +0000 (UTC)
Date: Thu, 19 Dec 2019 13:15:26 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, Andrzej Zaborowski <balrogg@gmail.com>, Peter
 Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, Alistair Francis
 <alistair@alistair23.me>, Antony Pavlov <antonynpavlov@gmail.com>, Igor
 Mitsyanko <i.mitsyanko@gmail.com>, Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, Peter Chubb
 <peter.chubb@nicta.com.au>, Alberto Garcia <berto@igalia.com>, Michael
 Walle <michael@walle.cc>, Thomas Huth <huth@tuxfamily.org>, Joel Stanley
 <joel@jms.id.au>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Laurent Vivier <lvivier@redhat.com>, Amit Shah
 <amit@kernel.org>, Corey Minyard <minyard@acm.org>, Paul Burton
 <pburton@wavecomp.com>, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Aleksandar Markovic
 <amarkovic@wavecomp.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sagar
 Karandikar <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Gerd Hoffmann <kraxel@redhat.com>, Samuel
 Thibault <samuel.thibault@ens-lyon.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Markus Armbruster <armbru@redhat.com>, Zhang Chen
 <chen.zhang@intel.com>, Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang
 <jasowang@redhat.com>, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org
Subject: Re: [RFC PATCH v2 14/14] chardev: Use QEMUChrEvent enum in
 IOEventHandler typedef
Message-ID: <20191219131526.776cdcb0.cohuck@redhat.com>
In-Reply-To: <20191218172009.8868-15-philmd@redhat.com>
References: <20191218172009.8868-1-philmd@redhat.com>
	<20191218172009.8868-15-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: tSMJREfxMfiGGg5W44LUMg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: BIfcwwnjar3j

On Wed, 18 Dec 2019 18:20:09 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> The Chardev events are listed in the QEMUChrEvent enum.
>=20
> By using the enum in the IOEventHandler typedef we:
>=20
> - make the IOEventHandler type more explicit (this handler
>   process out-of-band information, while the IOReadHandler
>   is in-band),
> - help static code analyzers.
>=20
> This patch was produced with the following spatch script:
>=20
>   @match@
>   expression backend, opaque, context, set_open;
>   identifier fd_can_read, fd_read, fd_event, be_change;
>   @@
>   qemu_chr_fe_set_handlers(backend, fd_can_read, fd_read, fd_event,
>                            be_change, opaque, context, set_open);
>=20
>   @depends on match@
>   identifier opaque, event;
>   identifier match.fd_event;
>   @@
>    static
>   -void fd_event(void *opaque, int event)
>   +void fd_event(void *opaque, QEMUChrEvent event)
>    {
>    ...
>    }
>=20
> Then the following files were manually modified:
>=20
>   - include/chardev/char-fe.h
>   - include/chardev/char.h
>   - include/chardev/char-mux.h
>   - chardev/char.c
>   - chardev/char-mux.c
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

(...)

> diff --git a/hw/char/terminal3270.c b/hw/char/terminal3270.c
> index 2aab04fd4b..f7aba12565 100644
> --- a/hw/char/terminal3270.c
> +++ b/hw/char/terminal3270.c
> @@ -142,7 +142,7 @@ static void terminal_read(void *opaque, const uint8_t=
 *buf, int size)
>      }
>  }
> =20
> -static void chr_event(void *opaque, int event)
> +static void chr_event(void *opaque, QEMUChrEvent event)
>  {
>      Terminal3270 *t =3D opaque;
>      CcwDevice *ccw_dev =3D CCW_DEVICE(t);

Acked-by: Cornelia Huck <cohuck@redhat.com>
