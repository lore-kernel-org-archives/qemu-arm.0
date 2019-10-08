Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp131241wrm;
        Tue, 8 Oct 2019 14:59:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxgqae6mjnSUQSOudZxDgxTD1Nlmt5h2Pdm/LvPyu0P5g+rrxLIVXsYBLjyZogUXc+K3Hi4
X-Received: by 2002:aa7:d0d5:: with SMTP id u21mr233839edo.36.1570571976289;
        Tue, 08 Oct 2019 14:59:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570571976; cv=none;
        d=google.com; s=arc-20160816;
        b=yaSi1ZX54IRlCfCIw40yU5nWlQSJwGDf7jp0OSYHcLYiWpaNpAQJZGjc4FRzrPpfUM
         8tApwXfFu0CCZBfn1QZ1HCYnPH/BIpwjiKpxB7T8LHyHcIUkp44yv4njDL8Rah82WsXN
         Rq48qdfXaFxkkIzr0oCJymLDQ1nnJthrzZpMDJN55pYaQ3vVTRroaozMin568+5uO6VQ
         +xXi6Cci1KPcWP7aR/CQcywr2thTkUe0FrDH7uuSTBTQarEBzx8w+FyfXna3LW817M4J
         VxdzWg4Bj4BYVs/9Hn9D16YQI6NAeMoP3yaoBCF4xpirUPjLqTFMYL8A2NWgmTp6pqPJ
         rBHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date;
        bh=lNufofDkBSrot7HMxoOgtLprbVO0aEYmCEPP8GNMJzo=;
        b=tTGW5vCbaOXw9N8zMHkhvjj38I7Au2wq8MrJQgGPVfIPs5MKmT6z/JnCCmoVG7xwF1
         T2rvtxxP1qYqoqVM2Edhk4r4ZtLfcv1f92XRfkmMHGhgiSPKeYkFdMArz1DLCqSjwCMS
         eK1HZl0UFd1FG9hgJrTZRLQtEveB+ndSMhYjcAmhRcZknyg2PdgQhSaB6++IfV74QYRS
         wlRjlsp5YuOTUkz5bMbBovt4Qc7LXWAGSnKx7ZxOLEYE/BxKhGZQGY7ZfEPqPLPGSgXD
         aL7CbAk5D7SimaQbUw3Aam/JojZfWohNRHXLr8OhtAYOuUWKLiTg7kA/o/b36YQEC8Kk
         84CA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ga6si94261ejb.309.2019.10.08.14.59.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 14:59:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHxW3-0003WS-2U
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 17:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51755)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iHxVc-0003TG-1J
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 17:59:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iHxVa-0003vJ-Ou
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 17:59:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33916)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>)
 id 1iHxVa-0003ue-GA; Tue, 08 Oct 2019 17:59:06 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 793C888382D;
 Tue,  8 Oct 2019 21:59:05 +0000 (UTC)
Received: from localhost.localdomain (ovpn-122-151.rdu2.redhat.com
 [10.10.122.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B08A86012A;
 Tue,  8 Oct 2019 21:58:59 +0000 (UTC)
Date: Tue, 8 Oct 2019 17:58:57 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 2/5] hw/sd/sdhci: Add a comment to distinct the i.MX
 eSDHC functions
Message-ID: <20191008215857.GB11091@localhost.localdomain>
References: <20191005154748.21718-1-f4bug@amsat.org>
 <20191005154748.21718-3-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20191005154748.21718-3-f4bug@amsat.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Tue, 08 Oct 2019 21:59:05 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: =?iso-8859-1?Q?Fr=E9d=E9ric?= Basse <contact@fredericb.info>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Evgeny Voevodin <e.voevodin@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-devel@nongnu.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Dmitry Solodkiy <d.solodkiy@samsung.com>, Maksim Kozlov <m.kozlov@samsung.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v2zVoI6ye1wE

On Sat, Oct 05, 2019 at 05:47:45PM +0200, Philippe Mathieu-Daud=E9 wrote:
> This file keeps the various QDev blocks separated by comments.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  hw/sd/sdhci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index e08ec3e398..82ec5c1b4a 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -1532,6 +1532,8 @@ static const TypeInfo sdhci_bus_info =3D {
>      .class_init =3D sdhci_bus_class_init,
>  };
> =20
> +/* --- qdev i.MX eSDHC --- */
> +
>  static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
>  {
>      SDHCIState *s =3D SYSBUS_SDHCI(opaque);
> @@ -1734,7 +1736,6 @@ usdhc_write(void *opaque, hwaddr offset, uint64_t=
 val, unsigned size)
>      }
>  }
> =20
> -
>  static const MemoryRegionOps usdhc_mmio_ops =3D {
>      .read =3D usdhc_read,
>      .write =3D usdhc_write,
> --=20
> 2.20.1
>=20
>=20

Reviewed-by: Cleber Rosa <crosa@redhat.com>
