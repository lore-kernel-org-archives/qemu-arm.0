Received: by 2002:a05:6512:6a:0:0:0:0 with SMTP id i10csp13098lfo;
        Mon, 18 Nov 2019 14:40:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqxr+ovcq86OaFwRkFjIXiIlEvskcTAU5iDO7XPsUH+3Aw+TANgl0s2njURG7riFW9vV8XYv
X-Received: by 2002:ae9:d60f:: with SMTP id r15mr27160320qkk.207.1574116802269;
        Mon, 18 Nov 2019 14:40:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574116802; cv=none;
        d=google.com; s=arc-20160816;
        b=OUSsvj3240DZ0iUeN244zw9YstbTbVJTlP+Bh931rdeYlLJ9p3fJTM5/u/1e99XUmk
         Em18PMrPXzXLecuXMCCHb/ZEKOMVutJcqUhTh3PiMnT8LxBrldCoutltgpCfvmujRdMU
         SuYmwPrgtd0uhgzbN1ihqfqGudbEWY6/J02n11aY2KZFnfWdmCXa3l1Y/nvyFgk/UxJZ
         VChdUXvYrPZDoq3296L7Pi4zaAdI9Nw+aCIJrnoSNdD19yYXDPVqm0l+PMb3McMMKGXr
         mFAKk1AZYH0uIfm/ra7dJFQNrmS0/DdXWM/aQmj4tBvnj57TUSFXAAqiu3/oz577OtvN
         wGiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=TGggC5p1vYh+ANvxx79W3lxEqoD5ExQeTUojSCJr9WQ=;
        b=EZpCMLuLlDhNWi2gLhuQTlxM1CXc16A2sd1UEf8vCDyJj78tyIO+1IM4Cbn7VCptn8
         JSbP9fPDbjc8WBAmYAfSGAOn29cMSVt1FtDXbzJpj5xy1iTz+vZSzUfPIRJJZ1DfUW2H
         utEUrA40hN8Ssy+6jrwabbzvywmQb6QXq5W58QYcPg91pH+nsEEXVDEIIjkXQLRaCNSJ
         bNkan95N2ARlTUh0aKquoyw3olx241l0qeBz+vcXHTaq3eWzHgOwE6Am4mH687YUQoC/
         DnPLvvwVXXrEynhnmwrtBqISOyRChiNjfisuRGL4RSzQVF1VCi1yFYoPfqcYacF/k5xW
         JbrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=HUaaufw0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y11si11966343qvs.156.2019.11.18.14.40.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 14:40:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=HUaaufw0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWpgf-0008A0-KR
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 17:40:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46316)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iWpfv-00088y-8K
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 17:39:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iWpfu-0004aM-2U
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 17:39:15 -0500
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:41822)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iWpft-0004a9-OW; Mon, 18 Nov 2019 17:39:14 -0500
Received: by mail-qk1-x742.google.com with SMTP id m125so16035904qkd.8;
 Mon, 18 Nov 2019 14:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TGggC5p1vYh+ANvxx79W3lxEqoD5ExQeTUojSCJr9WQ=;
 b=HUaaufw0yp4XdXnRvuehzliyt8UHmXVX9+PFijXRDrTiddMF47f3b7g5qOQvtshcWq
 ouDZtQxoI6GyGAYl9GmxwLP0wt9hCc6WNKdgSYAP2szwTe1Bfw9jqOV+bi1f3TjlD0sQ
 r/eEr8LHfL2RZQ6JgAcX/NqPdRCS2FKSILZGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TGggC5p1vYh+ANvxx79W3lxEqoD5ExQeTUojSCJr9WQ=;
 b=L1dlBDj9Cd69nPpKuxtLXpiVmWEWoP1Dx0/SzYEQQO0zXM0TJAjN008CnjoZKajxh4
 yKbAriOAzj84odNVtRD2TCjMGufduCELkWlIXKVxI0MIs/VAwtpZUC+Llrg+GiaOY5Cq
 wCWbLe1gOH231gdB+k/K4QyfhpJj6lLA9Ix8dTs0m+LUzlGSQc8cQ/masFmjDTQQs2HX
 hkMkuVvEvIsEtYXg+/y6XHMx+Vjp69lsZPD7zKFtyuGud9Q9YPBf/VNKpjoaUzK76/Eg
 fCUnzXOS0PdP2Mf2ziJkHIbZL/2MO695VY1kpSs7QAEKeQJHFig1hWw/n1iqIDSMElSn
 vA+g==
X-Gm-Message-State: APjAAAV12zFL5c71debBI5gJnUAqW1CVKRmFeKpa8GXLR2uCPsDWbyrB
 u+Go04nKsxR9F0J/1FkKgTBso4lj0omyNr/VZNl9mU+7
X-Received: by 2002:a37:aa07:: with SMTP id t7mr17774709qke.414.1574116752802; 
 Mon, 18 Nov 2019 14:39:12 -0800 (PST)
MIME-Version: 1.0
References: <20191118161712.6712-1-clg@kaod.org>
 <20191118161712.6712-3-clg@kaod.org>
In-Reply-To: <20191118161712.6712-3-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 18 Nov 2019 22:39:00 +0000
Message-ID: <CACPK8Xecx2CQcJ39AE+rUywiEYLwThoJ2KehS6XHpQw91AnGZg@mail.gmail.com>
Subject: Re: [PATCH for-5.0 2/2] aspeed: change the "nic" property definition
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::742
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1wIWTioIwp2x

On Mon, 18 Nov 2019 at 16:17, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The Aspeed MII model has a link pointing to its associated FTGMAC100
> NIC in the machine.
>
> Change the "nic" property definition so that it explicitly sets the
> pointer. The property isn't optional : not being able to set the link
> is a bug and QEMU should rather abort than exit in this case.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/arm/aspeed_ast2600.c |  5 ++---
>  hw/net/ftgmac100.c      | 19 +++++++++----------
>  2 files changed, 11 insertions(+), 13 deletions(-)
>
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 810fd7de0c06..be88005dab8f 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -183,9 +183,6 @@ static void aspeed_soc_ast2600_init(Object *obj)
>
>          sysbus_init_child_obj(obj, "mii[*]", &s->mii[i], sizeof(s->mii[i=
]),
>                                TYPE_ASPEED_MII);
> -        object_property_add_const_link(OBJECT(&s->mii[i]), "nic",
> -                                       OBJECT(&s->ftgmac100[i]),
> -                                       &error_abort);
>      }
>
>      sysbus_init_child_obj(obj, "xdma", OBJECT(&s->xdma), sizeof(s->xdma)=
,
> @@ -441,6 +438,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
>                             aspeed_soc_get_irq(s, ASPEED_ETH1 + i));
>
> +        object_property_set_link(OBJECT(&s->mii[i]), OBJECT(&s->ftgmac10=
0[i]),
> +                                 "nic", &error_abort);
>          object_property_set_bool(OBJECT(&s->mii[i]), true, "realized",
>                                   &err);
>          if (err) {
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index eb8b441461a1..86ac25894a89 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -1204,17 +1204,8 @@ static void aspeed_mii_realize(DeviceState *dev, E=
rror **errp)
>  {
>      AspeedMiiState *s =3D ASPEED_MII(dev);
>      SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> -    Object *obj;
> -    Error *local_err =3D NULL;
>
> -    obj =3D object_property_get_link(OBJECT(dev), "nic", &local_err);
> -    if (!obj) {
> -        error_propagate(errp, local_err);
> -        error_prepend(errp, "required link 'nic' not found: ");
> -        return;
> -    }
> -
> -    s->nic =3D FTGMAC100(obj);
> +    assert(s->nic);
>
>      memory_region_init_io(&s->iomem, OBJECT(dev), &aspeed_mii_ops, s,
>                            TYPE_ASPEED_MII, 0x8);
> @@ -1231,6 +1222,13 @@ static const VMStateDescription vmstate_aspeed_mii=
 =3D {
>          VMSTATE_END_OF_LIST()
>      }
>  };
> +
> +static Property aspeed_mii_properties[] =3D {
> +    DEFINE_PROP_LINK("nic", AspeedMiiState, nic, TYPE_FTGMAC100,
> +                     FTGMAC100State *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  static void aspeed_mii_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> @@ -1239,6 +1237,7 @@ static void aspeed_mii_class_init(ObjectClass *klas=
s, void *data)
>      dc->reset =3D aspeed_mii_reset;
>      dc->realize =3D aspeed_mii_realize;
>      dc->desc =3D "Aspeed MII controller";
> +    dc->props =3D aspeed_mii_properties;
>  }
>
>  static const TypeInfo aspeed_mii_info =3D {
> --
> 2.21.0
>
