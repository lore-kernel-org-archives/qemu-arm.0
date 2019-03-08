Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8189523wrx;
        Fri, 8 Mar 2019 02:19:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqxKLg6jA0HNMNzlG1D+Bei5jls94OM+v6r9wEqcKQnMHFdHO3gycigHH8pzkcy+P0b5ZTuS
X-Received: by 2002:a0d:d183:: with SMTP id t125mr1601592ywd.296.1552040377698;
        Fri, 08 Mar 2019 02:19:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552040377; cv=none;
        d=google.com; s=arc-20160816;
        b=iUwDBg5c0x93gWlVUY4u2AJ7cDNAx0m1aMqhIAB2pyNMsp6HPP1grYPbBR6nAWQWgS
         oYDCCqncPW3CxNWlOzdVBKKpNUgDMgHVPCHZ1EOw7jV0YDXuQaufI+XNYgaaFqjhX+8e
         FT+vUJ484099m0YNx4FNvE0hk9BV5nigKorws+PmIAbvcy9kD+1qjblNoPXjUAv2fqKX
         XHb7LQJEu9pyzHZ36umjXOZh0UoAX+T0AEZm4ofzUl7aumOYqVBTny1vyPlkJjakS887
         9xoKl7tfZCqn7JK4b7OBbtnXx9yDLw3PXRPBVSgBhIAN7ysGzW9YokVkjGAjIKZvtctj
         kBIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=c1j9qhyQ/4q0I3MEf6Q67tLJVo20GDfELWFaP7NhgNE=;
        b=nVtINxeD93XWDCmTvh9gVXq4D7EXVRLk9eED6NGd5B3ImtWGDinblLjM0bXMb/oBYE
         t2Qv5vzCa8pIYRSJ3U6eQNGFeuOb7LshuC5rMmSJ0vBjkl1lAGdTQNpQxpjtb4w3Yy9u
         +yv8o74uP1Be9Ppqq5Y7izWObSMU51+hX81YTIBG8J7IBSv71CsYjXUFb9XYS75n97YH
         EOmplqFOdOUhH1wnKBdtNYGRwaX5GHE2uy1rr7Ao+tSxWnmL4wZiRYBnc5A1LiycAfe1
         LSsp3ktb3VTWopE7pArjcsBNgGcqAVMpSK/mHhOg7aJYwafheEP1fGoLw0E5HnyrutlG
         JN5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a19si4549044ywe.232.2019.03.08.02.19.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 02:19:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40479 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2CbJ-0001Ny-5l
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 05:19:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h2Cb9-0001Nf-Di
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 05:19:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h2Cb8-0004wz-Hl
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 05:19:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38796)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1h2Cb8-0004vu-87; Fri, 08 Mar 2019 05:19:26 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D7B4D2D7F8;
	Fri,  8 Mar 2019 10:19:24 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-151.rdu2.redhat.com
	[10.10.120.151])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 62BBB5D9C8;
	Fri,  8 Mar 2019 10:19:13 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-9-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <34983af3-cc35-5274-8a56-a8d8531702ed@redhat.com>
Date: Fri, 8 Mar 2019 11:19:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190308013222.12524-9-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 08 Mar 2019 10:19:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 08/18] hw/nvram/fw_cfg: Move
 fw_cfg_file_slots_allocate() to common_realize()
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
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, Eric Blake <eblake@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /BKR9iv5YW6q

On 03/08/19 02:32, Philippe Mathieu-Daud=C3=A9 wrote:
> Each implementation (I/O and MEM) calls fw_cfg_file_slots_allocate()
> then fw_cfg_common_realize().
> Simplify by moving the fw_cfg_file_slots_allocate() call into
> fw_cfg_common_realize() where it belongs.

The patch does more than that, namely:

>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/nvram/fw_cfg.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index 0fb020edce..ca58d279a4 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -929,19 +929,26 @@ static void fw_cfg_machine_ready(struct Notifier =
*n, void *data)
>      qemu_register_reset(fw_cfg_machine_reset, s);
>  }
> =20
> -
> +static void fw_cfg_file_slots_allocate(FWCfgState *s, Error **errp);
> =20
>  static void fw_cfg_common_realize(DeviceState *dev, Error **errp)
>  {
>      FWCfgState *s =3D FW_CFG(dev);
>      MachineState *machine =3D MACHINE(qdev_get_machine());
>      uint32_t version =3D FW_CFG_VERSION;
> +    Error *local_err =3D NULL;
> =20
>      if (!fw_cfg_find()) {
>          error_setg(errp, "at most one %s device is permitted", TYPE_FW=
_CFG);
>          return;
>      }
> =20
> +    fw_cfg_file_slots_allocate(s, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
>      fw_cfg_add_bytes(s, FW_CFG_SIGNATURE, (char *)"QEMU", 4);
>      fw_cfg_add_bytes(s, FW_CFG_UUID, &qemu_uuid, 16);
>      fw_cfg_add_i16(s, FW_CFG_NOGRAPHIC, (uint16_t)!machine->enable_gra=
phics);
> @@ -1108,7 +1115,7 @@ static void fw_cfg_io_realize(DeviceState *dev, E=
rror **errp)
>      FWCfgIoState *s =3D FW_CFG_IO(dev);
>      Error *local_err =3D NULL;
> =20
> -    fw_cfg_file_slots_allocate(FW_CFG(s), &local_err);
> +    fw_cfg_common_realize(dev, &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
>          return;
> @@ -1125,8 +1132,6 @@ static void fw_cfg_io_realize(DeviceState *dev, E=
rror **errp)
>                                &fw_cfg_dma_mem_ops, FW_CFG(s), "fwcfg.d=
ma",
>                                sizeof(dma_addr_t));
>      }
> -
> -    fw_cfg_common_realize(dev, errp);
>  }

it moves the fw_cfg_common_realize() call from the ends of the IO/MEM
realize functions to their middles; in particular to the point before
memory regions and (when appropriate) MMIO resources are initialized.

In other words, the patch reorders all of the current actions in
fw_cfg_common_realize() against said MemoryRegion & SysBusDevice
resource actions.

Why is this safe? (I'm not claiming it is unsafe, but I'd like to see it
explained in the commit message.)

Note: the fw_cfg_common_realize() you are moving around was introduced
in commit 38f3adc34de8 ("fw_cfg: move qdev_init_nofail() from
fw_cfg_init1() to callers", 2017-07-17), by Mark Cave-Ayland. I see Mark
is CC'd already, so I hope he can comment.

Thanks,
Laszlo

> =20
>  static void fw_cfg_io_class_init(ObjectClass *klass, void *data)
> @@ -1162,7 +1167,7 @@ static void fw_cfg_mem_realize(DeviceState *dev, =
Error **errp)
>      const MemoryRegionOps *data_ops =3D &fw_cfg_data_mem_ops;
>      Error *local_err =3D NULL;
> =20
> -    fw_cfg_file_slots_allocate(FW_CFG(s), &local_err);
> +    fw_cfg_common_realize(dev, &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
>          return;
> @@ -1189,8 +1194,6 @@ static void fw_cfg_mem_realize(DeviceState *dev, =
Error **errp)
>                                sizeof(dma_addr_t));
>          sysbus_init_mmio(sbd, &FW_CFG(s)->dma_iomem);
>      }
> -
> -    fw_cfg_common_realize(dev, errp);
>  }
> =20
>  static void fw_cfg_mem_class_init(ObjectClass *klass, void *data)
>=20

