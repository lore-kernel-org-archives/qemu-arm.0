Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp632591lfc;
        Thu, 27 Aug 2020 07:54:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPIeZQBYALZqXZMX8b1aiu5MdYL4hClXpm0cFgdvwosiAobP6BF07rXHVipRMP7vvhxod+
X-Received: by 2002:a25:d08a:: with SMTP id h132mr28031497ybg.368.1598540076060;
        Thu, 27 Aug 2020 07:54:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598540076; cv=none;
        d=google.com; s=arc-20160816;
        b=fNkwjl1cO3XhlNGHj+2pYfjQUqm9OYroqzRlOoItaEEIMgswKUod2XRS7wRLQHRbSB
         vruOW3l/t/P5pD2NiTXPgJzddBOKUl/KqWmF7It4860+UZeS3Y7+NxLeVmD0sLlV76P0
         OeIdfDGuwDrk3ojfHooQgyCCDV4lcIanxvy2R2HthlVXzBE/2hgm40H+dzuBh0Oy6qVo
         q6owHL32d4+mgZg/w+foDOQtKnq0ravWCgirsj0E8pKqRCzkNbdjzuMLGa4jNwwEH/zm
         hmPYG5cxYpYJNiw3MndmZURDFLQ1KuUh90P4BIFCpQcIVIZHXdST2eKEpIA1l3UW3yzo
         dpJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=hulzSRTtOv3ETP7tY5V3fQYPmAn/sJswJpFi9qH5rxQ=;
        b=ikvb8wa2VUQVu/2vf1WwiJtzSLFngQtmz0jnhgaVARkxmYg2Yl1tEnwbFqFsALPr+m
         /u0PjZ7Lymjyb1Bs7CU1AVSf8UAD0VY1SyFdmx/em1tAF19O8CKuGkMQhNaw8LBP53zU
         CQ81VAhHLHCHivAWklttZK8JZ/PjPE1sToe/DfzGKZordGww76w/LRvqfziAy18IkyF8
         8E5KQWypG2SE5+d0iY9OeUmkLr7JN3JI69bE56ozzdYi13OFA3fMXySZiMO7ec1qjn4k
         +N4TwXauwDBFbu/IeoJh7Eo7LrF2+0BZzbdIwx4xwiR81olLQVZQhGll4i4esjnTCueg
         ps4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZSAdbbCe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 198si2426712ybf.12.2020.08.27.07.54.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Aug 2020 07:54:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZSAdbbCe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBJIR-0002I2-Co
	for alex.bennee@linaro.org; Thu, 27 Aug 2020 10:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1kBJIJ-0002Fs-2n
 for qemu-arm@nongnu.org; Thu, 27 Aug 2020 10:54:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1kBJIG-0008Ej-Sk
 for qemu-arm@nongnu.org; Thu, 27 Aug 2020 10:54:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598540063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hulzSRTtOv3ETP7tY5V3fQYPmAn/sJswJpFi9qH5rxQ=;
 b=ZSAdbbCe4fcp2VAlAoOw3HEPOSyN0xaTzBIxFlNS7qxwoP7zwDbEYzPybHB4XrDyDBNATD
 qKROXBlZKL5DH8BUEwYvChLw0fNnJ+V06Qj+P61YRIyB5e4u7oBVrok0aeZvgNebbYE/eE
 jVOEi5QSEKU6Yz8I9wH5hwifriuNlM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-XbcKLPfBOAexr7oEbpJkxQ-1; Thu, 27 Aug 2020 10:54:19 -0400
X-MC-Unique: XbcKLPfBOAexr7oEbpJkxQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46D8C18BA282;
 Thu, 27 Aug 2020 14:54:18 +0000 (UTC)
Received: from localhost (ovpn-113-131.rdu2.redhat.com [10.10.113.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F41785D9F1;
 Thu, 27 Aug 2020 14:54:12 +0000 (UTC)
Date: Thu, 27 Aug 2020 16:54:11 +0200
From: Sergio Lopez <slp@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v6 11/20] microvm/acpi: use seabios with acpi=on
Message-ID: <20200827145411.uptnlveyo4v7lekj@mhamilton>
References: <20200826105254.28496-1-kraxel@redhat.com>
 <20200826105254.28496-12-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200826105254.28496-12-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="53pjgifjc2w2eu3r"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 02:10:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jCfY9ntGCt18

--53pjgifjc2w2eu3r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2020 at 12:52:45PM +0200, Gerd Hoffmann wrote:
> With acpi=3Doff continue to use qboot.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/i386/microvm.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Sergio Lopez <slp@redhat.com>


> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index ca0c9983f137..54510a03f754 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -52,6 +52,7 @@
>  #include "hw/xen/start_info.h"
> =20
>  #define MICROVM_QBOOT_FILENAME "qboot.rom"
> +#define MICROVM_BIOS_FILENAME  "bios-microvm.bin"
> =20
>  static void microvm_set_rtc(MicrovmMachineState *mms, ISADevice *s)
>  {
> @@ -174,7 +175,9 @@ static void microvm_devices_init(MicrovmMachineState =
*mms)
>      }
> =20
>      if (bios_name =3D=3D NULL) {
> -        bios_name =3D MICROVM_QBOOT_FILENAME;
> +        bios_name =3D x86_machine_is_acpi_enabled(x86ms)
> +            ? MICROVM_BIOS_FILENAME
> +            : MICROVM_QBOOT_FILENAME;
>      }
>      x86_bios_rom_init(get_system_memory(), true);
>  }
> --=20
> 2.27.0
>=20

--53pjgifjc2w2eu3r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAl9HyRIACgkQ9GknjS8M
AjX1KxAAnOEoeB0aqyCUoyzjz3ZigyRQ5fzH9cRBhqYIKyt9yEOwP5+BHp2pjYVh
X/CyJusfnnPD0pyRhAVu0QlEYl9EIEPf2aO2RAchaxDFpSGMSNcziP6ViG9k2ipr
l8D2CVyFW0spbcJL3fDXPSkEEo9W+vFlsmB68WM1FoTF/MMnaRmFEr+aQnFI16SI
tqAax8WwC/FIlotlvprL8iaViHH+ziWnDdzP0rSHsBHd5TbAvbUS6f5Y4yi0wEBy
aZYEE6xm037/k65F1s+agKq4RHpJ80ARuZA0z5wTXpL9/y8P1SM06bDwleSIWzoF
IUJw8reFujMW0mF4PiH8QlrV4Pp9sokG1AZFfO9Jhnp2o8xXphLRBAAcMqogZN+l
BUQzTdsZPXW8vpdgB8x8n5YRKc/5aAPj1qNZy6gha1Azq66SNodQjk0PaQ58OkKY
kUQ03SlUx7OoCOOr8Wy/0RZf+4TR1qEiyzHnYTSLqktnH3R4BysXV2cb9cLZpE7S
x8knBEpcDCCC5u6Ig1H/6Uw2HANbrV0kbJZ93N+IY/mmAnkhJo4fe+KAaO1Zaeci
Nt+7jHiFqPQoZOmA1G6ADf2rweWb8hY1BlMs0618X2Yp586Ji8GpianEjfuhdaAG
wXt/oXRAAJEhyWRyA30PpgOz/KACxw3RgugtZOuZ/qoYoNw5uP4=
=PI1W
-----END PGP SIGNATURE-----

--53pjgifjc2w2eu3r--

