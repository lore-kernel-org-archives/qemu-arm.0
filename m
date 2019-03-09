Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp9582025wrx;
        Sat, 9 Mar 2019 07:25:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqwOVGW0G3IanNRl4Orkk3zdnflwg+rsUbiIX6LUje85PjqzjnAYcoQsrbpcclongk5B4nPR
X-Received: by 2002:a25:d715:: with SMTP id o21mr15290211ybg.121.1552145158583;
        Sat, 09 Mar 2019 07:25:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552145158; cv=none;
        d=google.com; s=arc-20160816;
        b=bx8B1e3Yp79mmbz3uwsKCSk31hhSzlXM4B0/7pwqiL7xMsptsW37dlNfn3hT0FmxSN
         JsVvZCVuWi8U8ziwA1iVDloF2wn4yA0jeHwg6IJyp48xVT4o2Ij9P/yIa+4gRMNJ4m5z
         xmnBkzT4YYHReHUJsw1iXjTFm44si8d3Jn4/F+199Gh+0foFUrDZoHTG09OSe3AmK9t9
         RCefxz9mVjstaAf3+g5nd5o4Y6hJTOJ2f1dwaQ5TPlVjuhDwLyLiT5rVBV8koewvxkGb
         /Qx6n093orxUn4xzVZRGLb+kC+04GpGjOXnkk3l/AdhHCEuE9V0YThoGCvWuwD5c9Fux
         iwFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from;
        bh=J0brdJ4p8tnF/0qlQbRIXhib922pqaLPjHWbtxnSoOs=;
        b=vR7XmvYQQY1E6V5w+Z+PIQbeNWSkPPCrpXsFtJAWj+XIt41VPPS9fM4SNwcDYGFuMd
         KE1eMl8ZT9pue4lc5Qqi03AAJrQxzURxwJgbCVKmEIoQURUMn1ZGzuhpSQEU/IY0nyR9
         yvaHGHb9ZSlQpNJUqr6aL56JE4/UeaMWQkp8WzlhLbpw4JE87B18kOIv2EBzPSYgTUG4
         3uLchBZzwFLCWdYDUW6kKOLfoaiGA2GH43W7hpL1WkdDuPLWUW0t7uMh9qNs2HvYJDKz
         xaxwCmmah/ZJHsRMR2Iu41AreM1COwQuTyTFxAyKE61Ym1UvfDIysocQpyUBbwGDwHVY
         mpEg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8si346927ybw.135.2019.03.09.07.25.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Mar 2019 07:25:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:60298 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2drK-0002y5-1r
	for alex.bennee@linaro.org; Sat, 09 Mar 2019 10:25:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57754)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h2dr8-0002xD-Gc
	for qemu-arm@nongnu.org; Sat, 09 Mar 2019 10:25:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h2dr7-0007gx-Ov
	for qemu-arm@nongnu.org; Sat, 09 Mar 2019 10:25:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40058)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1h2dr7-0007fA-IR; Sat, 09 Mar 2019 10:25:45 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 063553E476;
	Sat,  9 Mar 2019 15:25:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 658CF60BE2;
	Sat,  9 Mar 2019 15:25:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 906FE1138661; Sat,  9 Mar 2019 15:47:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-8-philmd@redhat.com>
Date: Sat, 09 Mar 2019 15:47:36 +0100
In-Reply-To: <20190308013222.12524-8-philmd@redhat.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 8 Mar 2019 02:32:11
	+0100")
Message-ID: <87imws3y0n.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Sat, 09 Mar 2019 15:25:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 07/18] hw/nvram/fw_cfg: Add
 fw_cfg_common_unrealize()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Laszlo Ersek <lersek@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lkl0lY0PKt93

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Back in abe147e0ce4 when fw_cfg_add_file() was introduced, there
> was no QOM design, object where not created and released at runtime.
> Later 38f3adc34d finished the QOM conversion of the fw_cfg device,
> adding the fw_cfg_common_realize() method.
> The time has come to add the equivalent destructor and release the
> memory allocated for 'files'.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/nvram/fw_cfg.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index b2dc0a80cb..0fb020edce 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -959,6 +959,13 @@ static void fw_cfg_common_realize(DeviceState *dev, =
Error **errp)
>      qemu_add_machine_init_done_notifier(&s->machine_ready);
>  }
>=20=20
> +static void fw_cfg_common_unrealize(DeviceState *dev, Error **errp)
> +{
> +    FWCfgState *s =3D FW_CFG(dev);
> +
> +    g_free(s->files);
> +}
> +

Still leaks at least s->entries[0], s->entries[1], s->entry_order,
doesn't it?

>  FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uint32_t dma_iobase,
>                                  AddressSpace *dma_as)
>  {
> @@ -1127,6 +1134,7 @@ static void fw_cfg_io_class_init(ObjectClass *klass=
, void *data)
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>=20=20
>      dc->realize =3D fw_cfg_io_realize;
> +    dc->unrealize =3D fw_cfg_common_unrealize;
>      dc->props =3D fw_cfg_io_properties;
>  }
>=20=20
> @@ -1190,6 +1198,7 @@ static void fw_cfg_mem_class_init(ObjectClass *klas=
s, void *data)
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>=20=20
>      dc->realize =3D fw_cfg_mem_realize;
> +    dc->unrealize =3D fw_cfg_common_unrealize;
>      dc->props =3D fw_cfg_mem_properties;
>  }
