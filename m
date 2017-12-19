Received: by 10.223.159.74 with SMTP id f10csp3314336wrg;
        Mon, 18 Dec 2017 17:14:05 -0800 (PST)
X-Google-Smtp-Source: ACJfBouqzZKZ1GQ1X6ztfN4F0hEX1iWt2B3xHBb/K2tbBj4EQgmRLwnUE9p/1jXbnu+ErKfOceRl
X-Received: by 10.37.99.130 with SMTP id x124mr1418704ybb.340.1513646045871;
        Mon, 18 Dec 2017 17:14:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513646045; cv=none;
        d=google.com; s=arc-20160816;
        b=U5lVECgvzwW0ZKAiJpXWf4adYicdFseBZOLMV94c8aEHZIlyDI2inHepprE/PnsiyN
         alki9Lg/ONPgRgJTKjwMmq8yq/GOhbmp06+3xG3MSYQE4tai1ehXbthkf1VF1HJknp9Q
         2x2tfVYCnpqRRdU9xybCBUrcRd9ABbHUZITXc5U5GST78IeDy4Fmzpvi3LwCaoOnXC0D
         SAAqrVTNcgVJzXLoA++IJXAOlT5Ps0NFHwx/x5XpyPmMR3jCfI+/Jaw2LI0qnAO2IKfH
         wNArLLLIX9O1ckB5JtxVVREPtdhnzyc4tuRgn0mKAXKJ1IBmrxRkd69/EJ/u34iCYGcA
         lzvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=RMAhEzWAAQsjUe6lVzYPnQRtMQltMjeiE3QWdhdrozs=;
        b=Kn4BbNRCw66/Uj4mXtwng8wI93hsCzaLBEAxZTkQV6ltkjFXEJvOAubfSS8pjL3dhn
         k0nnum9jKGna3a9p+jW28w01OtZbleYDLgFyD1lbsW/OlzNazWHC3nPhm3Y0hgsFRJP6
         sAi39Ps/Z+b3B1ro0b/lO0CBMWX8tvePadX7QsHRbzELJmgShnAgCj6ynxBXX1O9KrfB
         hL6ZDUUFo5Jk3Jz6TObi4Kn0Fe/ubKeYemYaiiiYnWVEuB89GApe8GRrkDZRqF3xsQuJ
         3qnFUVejq5Wo8/kuwqesZw7Rle8MQcM6M70m5uOPNivWlvwMv7mA/CMmYwUOXORRpJyk
         floA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kiNbPL7r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i83si2660926ywe.243.2017.12.18.17.14.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 17:14:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kiNbPL7r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:32885 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eR6Tt-0005ys-9T
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 20:14:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47700)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eR6Tk-0005xW-DI
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 20:13:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eR6Tj-0005nO-Cs
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 20:13:56 -0500
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:33570)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eR6Th-0005lO-3a; Mon, 18 Dec 2017 20:13:53 -0500
Received: by mail-wr0-x243.google.com with SMTP id v21so5548284wrc.0;
	Mon, 18 Dec 2017 17:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=RMAhEzWAAQsjUe6lVzYPnQRtMQltMjeiE3QWdhdrozs=;
	b=kiNbPL7rzRktzeLXtZXXEdMhok1AZojPZdnZ9PBpRT4Y/4eMpnEHab0Y9sfaTNyanE
	M8058TpNYxnwW8kBqG/xCl9fukt1nLlB3QgqDGvwZq82QCZrTLrsNuS1usImTiy/D5RV
	KJje3kmNFUit5+22E5VrxDYfEBKIUmaiDWz1a7JC2kF09Nj8eZWrFaXyQ4+8ZsDb4mZM
	Qm+QoBvVGvUSdC3gEzIXCErCEeyzOqR8LokpEUorZqokG4pkrMvqd8s12UAgsFqcY2OE
	hYeXLMhw1gTXOJRwYgUBpu5EJUIQCGRkfSWobOY8obBUFBVV3symykh8buo0ggjgmWbA
	A+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=RMAhEzWAAQsjUe6lVzYPnQRtMQltMjeiE3QWdhdrozs=;
	b=DHa8ml+umYhr2oyBNZGwgThHswH0ieNj3U8ke3mZyg+Q24Y+O/vqiqZxlSBvozoeE5
	Z+SnCN9glmPwu+iJPTVctAaSp9Ji0/iHPp1md80a8SrFpRCbyukLVgSLiI1lpwMY7239
	ronuwdjJc2DwYRAkbW6iq34D5u/Y3wvC9Zf5CizTvEYqO+cKybUDf1d1kMz0CrMRXmBP
	juwfjAbIA/DAETmnmBQO3zRe4dMnFHoWZ6SFGnTrrkuNFfa8ttOMc5+c5WP69crpy52C
	j1z0vR//cZif7AVVYNG2X2BvDhesI4SGgnK8wDA2koqcDs4HvXm3oElIYsfWsxyRIr54
	HGpg==
X-Gm-Message-State: AKGB3mJ80pCJYmDx1rJQJ85FmpHkpz6o4AdjJ9UdhDieESMM+KzEHzD+
	9YPMC+FMIBdpxyhL4TfJkygy0ez3GS3zFgJ+yZs=
X-Received: by 10.223.187.3 with SMTP id r3mr2461765wrg.34.1513646031762; Mon,
	18 Dec 2017 17:13:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Mon, 18 Dec 2017 17:13:21 -0800 (PST)
In-Reply-To: <20171215031547.31006-5-f4bug@amsat.org>
References: <20171215031547.31006-1-f4bug@amsat.org>
	<20171215031547.31006-5-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 18 Dec 2017 17:13:21 -0800
X-Google-Sender-Auth: tidIpgjLD-XdSBVVagZ9QT6oFbw
Message-ID: <CAKmqyKM-Ar=Ld=6KBvJ1D1T0z2wPhvFR52tvKXKp=SEWoFJ=XQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 04/20] sdhci: refactor same
 sysbus/pci properties into a common one
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qvyGXBy7B67t

On Thu, Dec 14, 2017 at 7:15 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> add sysbus/pci/sdbus separator comments to keep it clearer
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

I'm still unsure about this. Won't this leave us with properties that
have no impact on the device? That seems very confusing to me.

Alistair

> ---
>  hw/sd/sdhci.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
>
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 2823da00da..dbdfd54350 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -1265,13 +1265,17 @@ const VMStateDescription sdhci_vmstate =3D {
>
>  /* Capabilities registers provide information on supported features of t=
his
>   * specific host controller implementation */
> -static Property sdhci_pci_properties[] =3D {
> +static Property sdhci_properties[] =3D {
>      DEFINE_PROP_UINT32("capareg", SDHCIState, capareg,
>              SDHC_CAPAB_REG_DEFAULT),
>      DEFINE_PROP_UINT32("maxcurr", SDHCIState, maxcurr, 0),
> +    DEFINE_PROP_BOOL("pending-insert-quirk", SDHCIState, pending_insert_=
quirk,
> +                     false),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> +/* --- qdev PCI --- */
> +
>  static void sdhci_pci_realize(PCIDevice *dev, Error **errp)
>  {
>      SDHCIState *s =3D PCI_SDHCI(dev);
> @@ -1304,7 +1308,7 @@ static void sdhci_pci_class_init(ObjectClass *klass=
, void *data)
>      k->class_id =3D PCI_CLASS_SYSTEM_SDHCI;
>      set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>      dc->vmsd =3D &sdhci_vmstate;
> -    dc->props =3D sdhci_pci_properties;
> +    dc->props =3D sdhci_properties;
>      dc->reset =3D sdhci_poweron_reset;
>  }
>
> @@ -1319,14 +1323,7 @@ static const TypeInfo sdhci_pci_info =3D {
>      },
>  };
>
> -static Property sdhci_sysbus_properties[] =3D {
> -    DEFINE_PROP_UINT32("capareg", SDHCIState, capareg,
> -            SDHC_CAPAB_REG_DEFAULT),
> -    DEFINE_PROP_UINT32("maxcurr", SDHCIState, maxcurr, 0),
> -    DEFINE_PROP_BOOL("pending-insert-quirk", SDHCIState, pending_insert_=
quirk,
> -                     false),
> -    DEFINE_PROP_END_OF_LIST(),
> -};
> +/* --- qdev SysBus --- */
>
>  static void sdhci_sysbus_init(Object *obj)
>  {
> @@ -1359,7 +1356,7 @@ static void sdhci_sysbus_class_init(ObjectClass *kl=
ass, void *data)
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>
>      dc->vmsd =3D &sdhci_vmstate;
> -    dc->props =3D sdhci_sysbus_properties;
> +    dc->props =3D sdhci_properties;
>      dc->realize =3D sdhci_sysbus_realize;
>      dc->reset =3D sdhci_poweron_reset;
>  }
> @@ -1373,6 +1370,8 @@ static const TypeInfo sdhci_sysbus_info =3D {
>      .class_init =3D sdhci_sysbus_class_init,
>  };
>
> +/* --- qdev bus master --- */
> +
>  static void sdhci_bus_class_init(ObjectClass *klass, void *data)
>  {
>      SDBusClass *sbc =3D SD_BUS_CLASS(klass);
> --
> 2.15.1
>
>
