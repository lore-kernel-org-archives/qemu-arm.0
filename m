Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp656994lfa;
        Fri, 23 Oct 2020 09:19:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzq4wcmnP7dDOZido3uQSQPBbs7yTC+x+ko536cnDTGetS6Ji5QGNeiO6x7b71dN8qGu/NB
X-Received: by 2002:a37:9d4c:: with SMTP id g73mr2915409qke.391.1603469975767;
        Fri, 23 Oct 2020 09:19:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603469975; cv=none;
        d=google.com; s=arc-20160816;
        b=X8TCv+bbURdG+3XjtCfePZT3smuHQD9QQBZeVZXfJTLWY2mcntb5+8d79mUZXFP2YE
         PX3qCmT/7YmP+gfxn9D7mttopqTwOa3J5WLfqSqqcsC+WTgmLwK31fHIFtsakc8sZyL9
         EC6F/9UHI9vm/ecllidCYX2gMO1VlJis753TY/CUwdBDy7b0v/+0OWCTRh3ZBRokQg2/
         KDJVfC9z3vFJ3x79xgRATkqMrxbkaIejriw/9uQY5qv1+HX0KcmfPgh9akUYJL4gWLrj
         P/lo0RkFBl2XB7KfJtW5tsHAR59b+9XGOeb6VazJokwQhPxmBzJ/U+3xeuVXjucFywGW
         HE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=FI0S6qNYi/9jzC8gUVxersyLo/zq/Zwv/35wVgMW1o8=;
        b=rytE7/0E+orQwWZjWymHTmQLStTAmwAt9e3G9K3zvN1ixUvpeGwYYzDBW2BVTr3VTA
         /x1RZ7uRtNHFVLTfATsII/StcIdM72IyNw9BSZAlnlLVLg346eqeyItQ8WAtK4HGiXuY
         P+urOPIYjarUBWJHT2nDQOXeWRAkL+QVW5BA0lyhaPE39JudgXZea8KLqEcwatM1Hbye
         d/Q/Gzek1loCdxGakYVsJ0Nlj+rJbiA18nKsnhkTOspCeIKeJ1tOwuNrYvw0fKbe0yQ0
         Vbb5r8hdYGhVkYJNvRV1+9sB4U8dibZES/eVGkMXkFLx/zIPPvhREmEBWy/Q7xUXhgd0
         ocRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=N3obTnvl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e18si1057779qkg.333.2020.10.23.09.19.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Oct 2020 09:19:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=N3obTnvl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kVzmx-0007xm-48
	for alex.bennee@linaro.org; Fri, 23 Oct 2020 12:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kVzRT-0002hi-Va
 for qemu-arm@nongnu.org; Fri, 23 Oct 2020 11:57:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kVzRR-0005Rg-0E
 for qemu-arm@nongnu.org; Fri, 23 Oct 2020 11:57:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603468637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FI0S6qNYi/9jzC8gUVxersyLo/zq/Zwv/35wVgMW1o8=;
 b=N3obTnvl28z+QMMZzNwOfIN4mPFO43dsBT0e1clBiV0xTnuc4ldbkRGRvDLGDzFbEWpXBp
 mBFc7TWcD1Az7glVXom+fhxTDzsHcD+pq8XDfPITMRdA5nYT6lxWuHsDQq3gz9WCs4kyeo
 oX7AYywTaSOVEgqvF3fCGFJGA4dtosA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-NwUrnVN5P6aLq_1_5iwpEQ-1; Fri, 23 Oct 2020 11:57:15 -0400
X-MC-Unique: NwUrnVN5P6aLq_1_5iwpEQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FC0964152;
 Fri, 23 Oct 2020 15:57:14 +0000 (UTC)
Received: from localhost (unknown [10.40.208.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F15360CCC;
 Fri, 23 Oct 2020 15:57:12 +0000 (UTC)
Date: Fri, 23 Oct 2020 17:57:11 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 9/9] hw/arm/raspi: Add the Raspberry Pi 3 model A+
Message-ID: <20201023175711.74865d7d@redhat.com>
In-Reply-To: <20201018203358.1530378-10-f4bug@amsat.org>
References: <20201018203358.1530378-1-f4bug@amsat.org>
 <20201018203358.1530378-10-f4bug@amsat.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 01:44:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Luc Michel <luc@lmichel.fr>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pxnzUM/bVOtk

On Sun, 18 Oct 2020 22:33:58 +0200
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> The Pi 3A+ is a stripped down version of the 3B:
> - 512 MiB of RAM instead of 1 GiB
> - no on-board ethernet chipset
>=20
> Add it as it is a closer match to what we model.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/raspi.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 1510ca01afe..4ea200572ea 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -348,6 +348,15 @@ static void raspi2b_machine_class_init(ObjectClass *=
oc, void *data)
>  };
> =20
>  #ifdef TARGET_AARCH64
> +static void raspi3ap_machine_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +    RaspiMachineClass *rmc =3D RASPI_MACHINE_CLASS(oc);
> +
> +    rmc->board_rev =3D 0x9020e0;
> +    raspi_machine_class_common_init(mc, rmc->board_rev);
> +};
> +
>  static void raspi3b_machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(oc);
> @@ -373,6 +382,10 @@ static const TypeInfo raspi_machine_types[] =3D {
>          .parent         =3D TYPE_RASPI_MACHINE,
>          .class_init     =3D raspi2b_machine_class_init,
>  #ifdef TARGET_AARCH64
> +    }, {
> +        .name           =3D MACHINE_TYPE_NAME("raspi3ap"),
> +        .parent         =3D TYPE_RASPI_MACHINE,
> +        .class_init     =3D raspi3ap_machine_class_init,
>      }, {
>          .name           =3D MACHINE_TYPE_NAME("raspi3b"),
>          .parent         =3D TYPE_RASPI_MACHINE,

