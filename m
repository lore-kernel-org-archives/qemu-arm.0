Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1105460lfp;
        Mon, 20 Jan 2020 22:35:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqwm2XZLXSsmP7K43MHw3pel5jsjiicadajAqyyygEF6HYY/ehxheCTd7xpoBPCt8oAbbOly
X-Received: by 2002:ac8:3198:: with SMTP id h24mr2999176qte.291.1579588531646;
        Mon, 20 Jan 2020 22:35:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579588531; cv=none;
        d=google.com; s=arc-20160816;
        b=UUiRiQsq8bzszDboAYLch4g8dcGh/VeIhWUJJ5BgoFMZM8JzB+JGATj7+aEWXrEcr4
         QR6my791Rg+aYJVQKdOZ4xoO+nwYFNprpS6SA+f8ge+yV1SaRAXf4Uz49h1sutnvezrq
         tdopQPBtFQ8bAeajaookh+asahqVw1DJeUFOMUHP1MtcZxKVIn3aOVMW3zKcWliMZziV
         Xdj8fJ8yA/1qJzQ9O+jUhOgTaubWLHzZLEojNSD7Ou1IF2wlOQO5Eac6dFJBpWqiaTBh
         GNzM7ClfQ2CVRELKm/DKzYJAq0QjR4mzQtZUIGgh6s3r18YFj0YaBI1CxNygerTF0Vh7
         T6tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=4OUvEKKlROGtujXMnDJksWS4Q2yXG8c0+NRjLFjnsrc=;
        b=KSJotFik24Ppvmv+f+XqRAEoSzey0iYb1mz9KRR8CDVKCbQJF6iV25SwJprRaYGhhu
         bQ/6ltfE1Wc6dTWaQZMpqbj4+PAgmlAuSu1eGWQ8vPvK6odZU8WR9eoguuZvAkljtljG
         6FkaLJloneQ+RcFTwU5pya9pJl6KRC6NeCET8GUx17yDAiK42Mi/JiHAYh2SmCUp1/Lw
         9uC+wP1XqkDbEY0oMHtb5OvkPKUCVn/6jzeagtLao8+oS3m05amjb0YXYzTBwf00Np1b
         HKf9k3VN39xtQtZ/nuvjfq/nXL8pSiQy2buyrljvKA1p8agyBAfalolL3kNmBDnXWpHQ
         Bwlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NhUB0Dm6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e128si22236166qkf.115.2020.01.20.22.35.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 22:35:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NhUB0Dm6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itn8M-00086t-R6
	for alex.bennee@linaro.org; Tue, 21 Jan 2020 01:35:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43427)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1itn86-00086e-0Q
 for qemu-arm@nongnu.org; Tue, 21 Jan 2020 01:35:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1itn83-0007kt-AV
 for qemu-arm@nongnu.org; Tue, 21 Jan 2020 01:35:13 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:46183
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1itn83-0007kQ-4o
 for qemu-arm@nongnu.org; Tue, 21 Jan 2020 01:35:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579588510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4OUvEKKlROGtujXMnDJksWS4Q2yXG8c0+NRjLFjnsrc=;
 b=NhUB0Dm6jmTMZh+k4bvrh/se1EqN+RdYPB46MnVuM2auPBySGDlphS+P7B2t+yTxXsDKjE
 yQVpduU15XfEWAUv1bQ/2OGYz6kgcTdVLbEcMLs3HqowJIGl43gXZ1dDZPOPk/ztWYysAS
 R711eJqZ1CDcxHOusX36EszE1aMaDuc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-Wnf6aCGrMpqxcJiL_MkGgA-1; Tue, 21 Jan 2020 01:35:09 -0500
Received: by mail-qv1-f72.google.com with SMTP id d7so976105qvq.12
 for <qemu-arm@nongnu.org>; Mon, 20 Jan 2020 22:35:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+bCOxOtxPTd6B2o3yuNHhUE10cJLKnqqqRdS8U7GWlU=;
 b=OJl+w3wzxDA1ce+zw1qQcSnx54ATC4X106ul9ctKM7QM//v7HtH1+zvsdBanXU2p+m
 q0KONvC1NxCCCts75J8mucEFBQ6Z/KL4aTcIdTCmL52rqwrHlJigqfLtAj6oCOSy0QpM
 u+Dvq6yOI8d10dVs3pOEvJct1kEi3cKG79QqZsVhUfWIke0Y5cyyqay16ByZ4rnuvndO
 yOzUpsnopEoc2uh8Glc1dbXHF9+Z6X/KCogR25wk+8bVB/A+SbAXOwGmhvMEZJYH4PU0
 INesXJgDASEZhEK7wSLezq+U9wMWnQRYcTjxdYFX1YfoEpJlWfOqn/GWLWKk+ZIYqgWP
 /mMA==
X-Gm-Message-State: APjAAAWMezsQBP2qynuGgpdYzU+m7AtPg8lNMzbo605iJpEzwBTndvBr
 pdnj5S/gTbJdiw2XUORN4Tu+zzh+dbm9UtBbEFDKk6m3AYS83BWYKaQBA15yo7vSZdNi0dRt7qb
 TnXsUuEhoAm0u
X-Received: by 2002:a05:620a:910:: with SMTP id
 v16mr3222716qkv.194.1579588508771; 
 Mon, 20 Jan 2020 22:35:08 -0800 (PST)
X-Received: by 2002:a05:620a:910:: with SMTP id
 v16mr3222704qkv.194.1579588508473; 
 Mon, 20 Jan 2020 22:35:08 -0800 (PST)
Received: from redhat.com (bzq-79-179-85-180.red.bezeqint.net. [79.179.85.180])
 by smtp.gmail.com with ESMTPSA id e3sm18728863qtb.65.2020.01.20.22.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 22:35:07 -0800 (PST)
Date: Tue, 21 Jan 2020 01:35:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 1/2] arm/virt/acpi: remove meaningless sub device "PR0"
 from PCI0
Message-ID: <20200121005533-mutt-send-email-mst@kernel.org>
References: <20191219064759.35053-1-guoheyi@huawei.com>
 <20191219064759.35053-2-guoheyi@huawei.com>
 <20200113133702.1dea867b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200113133702.1dea867b@redhat.com>
X-MC-Unique: Wnf6aCGrMpqxcJiL_MkGgA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Heyi Guo <guoheyi@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qtHUqLG19R9q

On Mon, Jan 13, 2020 at 01:37:02PM +0100, Igor Mammedov wrote:
> On Thu, 19 Dec 2019 14:47:58 +0800
> Heyi Guo <guoheyi@huawei.com> wrote:
>=20
> > The sub device "PR0" under PCI0 in ACPI/DSDT does not make any sense,
> > so simply remote it.
> Could you make commit message more concrete so it would say
> why it doesn't make any sense.
>=20
> It seems to be there to describe root port,
> I'd rather have PCI folk ack if it's ok to remove it.

An empty device like this doesn't really do anything useful I think.
commit log needs to be fixed up though.


> >=20
> > Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> >=20
> > ---
> > Cc: Peter Maydell <peter.maydell@linaro.org>
> > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > Cc: Igor Mammedov <imammedo@redhat.com>
> > Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> > Cc: qemu-arm@nongnu.org
> > Cc: qemu-devel@nongnu.org
> > ---
> >  hw/arm/virt-acpi-build.c          |   4 ----
> >  tests/data/acpi/virt/DSDT         | Bin 18462 -> 18449 bytes
> >  tests/data/acpi/virt/DSDT.memhp   | Bin 19799 -> 19786 bytes
> >  tests/data/acpi/virt/DSDT.numamem | Bin 18462 -> 18449 bytes
> >  4 files changed, 4 deletions(-)
> >=20
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index bd5f771e9b..9f4c7d1889 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -317,10 +317,6 @@ static void acpi_dsdt_add_pci(Aml *scope, const Me=
mMapEntry *memmap,
> >      aml_append(method, aml_return(buf));
> >      aml_append(dev, method);
> > =20
> > -    Aml *dev_rp0 =3D aml_device("%s", "RP0");
> > -    aml_append(dev_rp0, aml_name_decl("_ADR", aml_int(0)));
> > -    aml_append(dev, dev_rp0);
> > -
> >      Aml *dev_res0 =3D aml_device("%s", "RES0");
> >      aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")))=
;
> >      crs =3D aml_resource_template();
> > diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
> > index d0f3afeb134fdf1c11f64cd06dbcdd30be603b80..b5895cb22446860a0b9be3d=
32ec856feb388be4c 100644
> > GIT binary patch
> > delta 39
> > vcmbO?fpOvlMlP3Nmk>b@1_q`B6S<_Bdg?Z+cXBfI+}XT|v(|R9jr$`2@RSW) =20
> >=20
> > delta 50
> > zcmbO@fpOjhMlP3Nmk>D*1_q{tiCof5o%I{lJ2{y;?{412S!>J19TZ>?&k^tF5;R%I =20
> > G{V4!>hYx%J =20
> >=20
> > diff --git a/tests/data/acpi/virt/DSDT.memhp b/tests/data/acpi/virt/DSD=
T.memhp
> > index 41ccc6431b917252bcbaac86c33b340c796be5ce..69ad844f65d047973a3e551=
98beecd45a35b8fce 100644
> > GIT binary patch
> > delta 40
> > wcmcaUi}BPfMlP3Nmk=3D*s1_q}3iCof5t(P{ccXBfI+}XT|v(|RAjk`1(02g)*ivR!s
> >=20
> > delta 51
> > zcmX>#i}Cs_MlP3NmymE@1_mbiiCof5O_w*ScXBdy-rc;3v(}c2J1D>)o+IATC1|sb =20
> > HyBr$;t7;Fc
> >=20
> > diff --git a/tests/data/acpi/virt/DSDT.numamem b/tests/data/acpi/virt/D=
SDT.numamem
> > index d0f3afeb134fdf1c11f64cd06dbcdd30be603b80..b5895cb22446860a0b9be3d=
32ec856feb388be4c 100644
> > GIT binary patch
> > delta 39
> > vcmbO?fpOvlMlP3Nmk>b@1_q`B6S<_Bdg?Z+cXBfI+}XT|v(|R9jr$`2@RSW) =20
> >=20
> > delta 50
> > zcmbO@fpOjhMlP3Nmk>D*1_q{tiCof5o%I{lJ2{y;?{412S!>J19TZ>?&k^tF5;R%I =20
> > G{V4!>hYx%J =20
> >=20

