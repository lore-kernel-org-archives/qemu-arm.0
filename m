Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4702509wrt;
        Tue, 23 Oct 2018 08:48:18 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62zgYKk6QzEVvMNJfiC//Cttnym/e7tqIT2gwtLtKHk6cFmZEoOC+RgYDVOB7sX8kuijbcx
X-Received: by 2002:ac8:27a6:: with SMTP id w35-v6mr14973705qtw.57.1540309698106;
        Tue, 23 Oct 2018 08:48:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540309698; cv=none;
        d=google.com; s=arc-20160816;
        b=f0yLgFi1uC5sYq6MxQGxK89altSQ/gx5m2FGHhS5MQF8BMpozdWXs0F2Pu5XWJa58h
         i0SuqbVIcI5Kqi9FfCYzE8BnT+EEljYrH81HcRuxJ4AnGcfLG9ecyqDiP5XCJayaiGoR
         neg2XpwOwv1ym1OXbnLwWLkx+swtGrJrI8HXVjEsB+099D/8/iAzkwXWnANzbWbnglE3
         SjQNNqlFy4QPLTloz/pvp8BC250uzJOG9bC6uG+b/vzICeJHQ9TEzCs84zJDqdiRE8WH
         VqP1/HBuQDjw6VwObWdoyuYMNgv5idYYpAAB19aYip04Bw+2yul4TsBMax2IbeQ9rQLm
         BMhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=ORSinWvvsQOIFvZ0WgeaXZmfXORL9WDC9iXaQ67DHfU=;
        b=oFpJ5dsz02Fq235sBhn/BK+MCOVGQinhwsNbOryYuEXAqXCyD5BuQ9NsJSO8gzW5Dq
         Xsa1iSoxkXkAGeL7GBfgUpc248nPBMcINlM9e4nPdYYeVLSIVR14UCVlcBAYY11ETcDR
         +/7vJwnc7pKf7AZAzCHooxNJiDDJ3C02TUH2sM0oWzGfAtLXvye9/moFsDK3NG0vRMNh
         GsJ39qxepkvKX6WjbKYsx+OEbW6S0m+JYrB5f0BzCk6m6FjvilwS2Ot5JMzHgmu54Mhr
         5Pe3nfLC4F39YwmR2lZJ517BRh47Kh45yfwF6B4dOhd8bFANWp5IV0Ni7TBCPfZoCY6l
         kH9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=K4pbRxMz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i18-v6si1343705qkg.117.2018.10.23.08.48.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Oct 2018 08:48:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=K4pbRxMz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42784 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEyun-0002uK-JT
	for alex.bennee@linaro.org; Tue, 23 Oct 2018 11:48:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEyhU-0006ks-1o
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:34:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEybu-00070W-4K
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:28:47 -0400
Received: from ozlabs.org ([203.11.71.1]:39729)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gEybr-0006fO-1D; Tue, 23 Oct 2018 11:28:43 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 42fcj74FwLz9sNK; Wed, 24 Oct 2018 02:28:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1540308491;
	bh=Kf6JeCKh+4cTY5qmwXLh6+0Y2ltLghzY11ZZLRPSVgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K4pbRxMzHKMeGS7elVRLDy6IhkInWiWVNT4xkhbWvlGAApcFsmuvsxUvfw7TY8R69
	XNjKMaLu7E7F5lV9K5zypukr8hj/5FB8vkVxG6ljS5PgUfL1xtwetYDC+vAyQtL1xI
	78qsq/BlPVzgtU8y+tqBJJdEn2pYRoj3kqwwhAbk=
Date: Tue, 23 Oct 2018 16:19:24 +0100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181023151924.GM12127@umbus.hotspot.internet-for-guests.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<20181018200422.4358-17-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kkcDP0v44wDpNmbp"
Content-Disposition: inline
In-Reply-To: <20181018200422.4358-17-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-devel] [PULL 16/45] hw/mips/malta: Remove unuseful code
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Rob Herring <robh@kernel.org>, Markus Armbruster <armbru@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o2viFF8iNb0d


--kkcDP0v44wDpNmbp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2018 at 05:03:53PM -0300, Eduardo Habkost wrote:
> From: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20181002212522.23303-13-f4bug@amsat.org>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/mips/mips_malta.c | 13 -------------
>  1 file changed, 13 deletions(-)
>=20
> diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
> index 29b90bacf3..c1cf0fe12e 100644
> --- a/hw/mips/mips_malta.c
> +++ b/hw/mips/mips_malta.c
> @@ -1422,23 +1422,10 @@ void mips_malta_init(MachineState *machine)
>      pci_vga_init(pci_bus);
>  }
> =20
> -static int mips_malta_sysbus_device_init(SysBusDevice *sysbusdev)
> -{
> -    return 0;
> -}
> -
> -static void mips_malta_class_init(ObjectClass *klass, void *data)
> -{
> -    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
> -
> -    k->init =3D mips_malta_sysbus_device_init;
> -}
> -
>  static const TypeInfo mips_malta_device =3D {
>      .name          =3D TYPE_MIPS_MALTA,
>      .parent        =3D TYPE_SYS_BUS_DEVICE,
>      .instance_size =3D sizeof(MaltaState),
> -    .class_init    =3D mips_malta_class_init,
>  };
> =20
>  static void mips_malta_machine_init(MachineClass *mc)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kkcDP0v44wDpNmbp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlvPO/wACgkQbDjKyiDZ
s5IISBAAw8dQ45zestRaDVu52GMGGL0cW8ZqZwovyxhG25XbnHHiRnaGJ3INgMPK
85HC4U6RaGAmp/EtZMC1JuluryszsEyTUIjYKSQMv+ReBnHyXA1Q02rvFAsn9rbN
3eEIzhwcZMPjVS3DoicJ/R14/y5vbHudkpi37/Ws6glLoL+/viYNwRQf+WMMRnxU
dykAx0D9VSmzMTRS9c5h9V2lwpsGsPCX3XN+d+ccKdwpaL1kJW7vkiDHb6z9Rwh0
xE4JBYT8Fr7fQE0eokKXd42WwnB6NwCAym1KAipkXN6KctAbE5R9KU66skNi658r
l6LjFRrhoxaubZC5lERPxcJHcUO6aK7bO2BT0dCudWbgKUCJJZvxkU13YUDfbtde
uruNo3YmlG3IwJVxYEBGW8Lbk/l5SORITFyy+60azMD29/Dl/vrmHl6N+mDp/rMF
/Ndzh0nGT5jRuTpIeHj39kRc3u8qybFCeEi2u4kl7xYgbgqcxsQn3Ql3RGhn83I9
BdmPKTzTyuRiP5iU65V2fMx/C7AuS9XTmrvF2ydU5VOoXlxDKMyw9fKkuRfcp1Lp
j9LgUTaTHjFDci6jzb4d7MvYWk9KoOJC+ITkvOecqVrt2a9GrF0ij0prUKdAZqIz
LNe7+qoUo6klsp7Q6FSfqTWXgbKgD4MeOuh76Ab0tpPEguAkRf8=
=9gx8
-----END PGP SIGNATURE-----

--kkcDP0v44wDpNmbp--
