Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2384307lfp;
        Tue, 21 Jan 2020 21:39:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqz0LlQS1mhji55ZGVTR9Cnu2sbBEaY2saEtQXqDq0wRJ3aRgu8JltGHUFGxz6sUW7WlOtaD
X-Received: by 2002:a17:906:c28b:: with SMTP id r11mr1114962ejz.291.1579671562693;
        Tue, 21 Jan 2020 21:39:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579671562; cv=none;
        d=google.com; s=arc-20160816;
        b=Tx4Tg3FS4VH4bNxnZyb8oitdLAEKjnC+QeVdXp1SugVjRN9PrGgS52izCZoapneUpo
         ncw7d6PQX/cGNJbNOHXPylZsSCTpaE+KQBsozqHRBaCajt+41vaJf3S6/VoH9wNkjcws
         wzigvNf0dMUb/RZI9zQ6ys++uKl/E7HisjtHkxhxT37vB7crRG9UtvelgekY4oeX9GUK
         cg+XTNAuxqCrgzuzJfzgLLsDMf9Lp+TUsBVOp0O2EQxNb9xvWYZQa/okmjN9lMeMlN7/
         jSLzFRffPhu1si7jPuCvMKUyORaaq4Rra8ArQ3LAAdSfCfnTYzf4rCgpjKyVxg799nyM
         ljOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=2xGw66LZwTu5IRYjYJERzR5WdKSQelMqF7fIoxl369U=;
        b=IeuyFGuJCsNB+9gyXz+AepbM6kr3yQmaOK99hlMD7CFVV9rQxocOQldgdeW3B+Kj08
         eiLQvT9hZqIV5cVjg0wrHm7UXYn+AdHqYC85PMNjLBInal3enXaWzdNdNg60yRw96GbD
         EsHhdDLA/cbmhqcWRprniJCzIsIwNPFECvKQzMQaqV5bU0uVIq7egTj9M2u+8I+VABrU
         8RmYa0KU7C+n2pHhYHbgnpVlddD7NZ1sRMv6R3DkMDAbVnn13MVA0XdI88yjOr0oni+n
         z81BgKeNV+kaFyJWpneW5/rH2wPSWDwy7ItsN133xMGJxdy279N1vwAcUNR4ttzKAZew
         F4Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=A0KfHDvL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fi25si26560525ejb.173.2020.01.21.21.39.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2020 21:39:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=A0KfHDvL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iu8jZ-0003aV-KD
	for alex.bennee@linaro.org; Wed, 22 Jan 2020 00:39:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58913)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iu8jR-0003aF-3T
 for qemu-arm@nongnu.org; Wed, 22 Jan 2020 00:39:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iu8jP-00067I-TA
 for qemu-arm@nongnu.org; Wed, 22 Jan 2020 00:39:13 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24462
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iu8jP-00066j-Od
 for qemu-arm@nongnu.org; Wed, 22 Jan 2020 00:39:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579671551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2xGw66LZwTu5IRYjYJERzR5WdKSQelMqF7fIoxl369U=;
 b=A0KfHDvL4khtKqUhq9aTfTDzaPEt39Skhdxt2VGAnm/WJyR6aM3PhsdqOyaWOty91Gca56
 VLig7d8IMoXjsEU6zdMudGm2XN5NnADn1dmSXsoH6fM2QO/AgMg/HKlnmiBdtu4NwElMt6
 8VmxlsZBN6vr9Th6NE1fn8c/YeyLkz4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-WfHMXLrdNlKYb9A4UILF_g-1; Wed, 22 Jan 2020 00:39:09 -0500
Received: by mail-wm1-f72.google.com with SMTP id f25so1603728wmb.1
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2020 21:39:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Tvln9ek2hRFIqeBfROyYmFI4dOvddID7++NI0jdRHGM=;
 b=VcfBxq3Wa79GZGiafx4Gx2E7DXakRYQ09SV+OPstE/+tIdumQIOYoWzwQB0RM+0Brs
 cJqSR7l7s21LkUDdje4kr/40bjT5vLDwyg5rHX+V0crPg47w111fS9daP3RB97xYn12u
 hhUNCydDuw3BYYlVd/nFG5Gt1pS+EFdf4sjRchewE8VHeO2q7mBZBk2QvrG/t8SibCZi
 Aackzfm1f+ESZMpAbsP1ZMzaBGLnojoQK2HQ+iOVGvbIPOoIpZu3LW0OaHn6/4BfYCFU
 x3OlO73K00gk4AmBaQi9xQS7kufis8iAFo2f97BiVnA/MWL4HeHxEE6BSArQDV47gIFY
 6+aQ==
X-Gm-Message-State: APjAAAXbUdn8nOxulet576rtEOLRmu7Pklq3p7BZvXfPowefES7qAUSZ
 MRgIWXnaiF3giqysE4l/+uy3lWEEnOIlBcuMpOBuwavWPg4OLuGVfC5SjKdCzqH7PM/H5EhmzIr
 vm02Z1Fx7kL0b
X-Received: by 2002:adf:e984:: with SMTP id h4mr9131170wrm.275.1579671548293; 
 Tue, 21 Jan 2020 21:39:08 -0800 (PST)
X-Received: by 2002:adf:e984:: with SMTP id h4mr9131145wrm.275.1579671548042; 
 Tue, 21 Jan 2020 21:39:08 -0800 (PST)
Received: from redhat.com (bzq-79-176-0-156.red.bezeqint.net. [79.176.0.156])
 by smtp.gmail.com with ESMTPSA id
 p18sm2426275wmg.4.2020.01.21.21.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 21:39:07 -0800 (PST)
Date: Wed, 22 Jan 2020 00:39:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Subject: Re: [PATCH 1/2] arm/virt/acpi: remove meaningless sub device "PR0"
 from PCI0
Message-ID: <20200122003809-mutt-send-email-mst@kernel.org>
References: <20191219064759.35053-1-guoheyi@huawei.com>
 <20191219064759.35053-2-guoheyi@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20191219064759.35053-2-guoheyi@huawei.com>
X-MC-Unique: WfHMXLrdNlKYb9A4UILF_g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B8EHJufQ65sB

On Thu, Dec 19, 2019 at 02:47:58PM +0800, Heyi Guo wrote:
> The sub device "PR0" under PCI0 in ACPI/DSDT does not make any sense,
> so simply remote it.
>=20
> Signed-off-by: Heyi Guo <guoheyi@huawei.com>

So given this has no methods except _ADR, I think it's
safe to remove:

Acked-by: Michael S. Tsirkin <mst@redhat.com>


> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  hw/arm/virt-acpi-build.c          |   4 ----
>  tests/data/acpi/virt/DSDT         | Bin 18462 -> 18449 bytes
>  tests/data/acpi/virt/DSDT.memhp   | Bin 19799 -> 19786 bytes
>  tests/data/acpi/virt/DSDT.numamem | Bin 18462 -> 18449 bytes
>  4 files changed, 4 deletions(-)
>=20
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index bd5f771e9b..9f4c7d1889 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -317,10 +317,6 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemM=
apEntry *memmap,
>      aml_append(method, aml_return(buf));
>      aml_append(dev, method);
> =20
> -    Aml *dev_rp0 =3D aml_device("%s", "RP0");
> -    aml_append(dev_rp0, aml_name_decl("_ADR", aml_int(0)));
> -    aml_append(dev, dev_rp0);
> -
>      Aml *dev_res0 =3D aml_device("%s", "RES0");
>      aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
>      crs =3D aml_resource_template();
> diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
> index d0f3afeb134fdf1c11f64cd06dbcdd30be603b80..b5895cb22446860a0b9be3d32=
ec856feb388be4c 100644
> GIT binary patch
> delta 39
> vcmbO?fpOvlMlP3Nmk>b@1_q`B6S<_Bdg?Z+cXBfI+}XT|v(|R9jr$`2@RSW)
>=20
> delta 50
> zcmbO@fpOjhMlP3Nmk>D*1_q{tiCof5o%I{lJ2{y;?{412S!>J19TZ>?&k^tF5;R%I
> G{V4!>hYx%J
>=20
> diff --git a/tests/data/acpi/virt/DSDT.memhp b/tests/data/acpi/virt/DSDT.=
memhp
> index 41ccc6431b917252bcbaac86c33b340c796be5ce..69ad844f65d047973a3e55198=
beecd45a35b8fce 100644
> GIT binary patch
> delta 40
> wcmcaUi}BPfMlP3Nmk=3D*s1_q}3iCof5t(P{ccXBfI+}XT|v(|RAjk`1(02g)*ivR!s
>=20
> delta 51
> zcmX>#i}Cs_MlP3NmymE@1_mbiiCof5O_w*ScXBdy-rc;3v(}c2J1D>)o+IATC1|sb
> HyBr$;t7;Fc
>=20
> diff --git a/tests/data/acpi/virt/DSDT.numamem b/tests/data/acpi/virt/DSD=
T.numamem
> index d0f3afeb134fdf1c11f64cd06dbcdd30be603b80..b5895cb22446860a0b9be3d32=
ec856feb388be4c 100644
> GIT binary patch
> delta 39
> vcmbO?fpOvlMlP3Nmk>b@1_q`B6S<_Bdg?Z+cXBfI+}XT|v(|R9jr$`2@RSW)
>=20
> delta 50
> zcmbO@fpOjhMlP3Nmk>D*1_q{tiCof5o%I{lJ2{y;?{412S!>J19TZ>?&k^tF5;R%I
> G{V4!>hYx%J
>=20
> --=20
> 2.19.1

