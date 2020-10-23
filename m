Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp656516lfa;
        Fri, 23 Oct 2020 09:19:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0XK1wKkDDKCmU295/3eeG3+aiSRXsOlANObgguTRIfmy9J8B5KiuYz3RnpzWXPJMj1Kvu
X-Received: by 2002:ac8:5bc2:: with SMTP id b2mr2922670qtb.284.1603469944926;
        Fri, 23 Oct 2020 09:19:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603469944; cv=none;
        d=google.com; s=arc-20160816;
        b=tY62a+AyRrqD9xOS1VVfGfdrzE+J3rz1fdJ6gTI6gYevDVgwLQENoVGRXcXxYb+dg+
         dSDGmAlJsIEvY7WHKIZncM+5ZYexoX+ZH1Sn76GuWcxWU0QcruWFVAJj/qUOp40w2BkO
         gRF23kQhG9YyYCA1rhnc4r2QE1oF0Q9z8KjD/csFAynZT+CosHCtQzHi7PgvydSZ73bG
         DrMsgDSQ0ZPSCNSiDjsDbgcO8zLqgPPMmmFADilL8N8T2waofXk0yUrFQfTF16hRrAlL
         nDRFUnXZnq/GSI9DWGwxOvR/UZ7lpN/GOCljhucOXCDDaDFUBYMzYkredf2+9i0qumUL
         BTvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=fUpIiA80kzCQG3WyAunrf71WbEpFTyhfJoK4ohi5mgw=;
        b=bsY07S0Yc+0u4KbSdYUQ5HdhaFDAIEaeEZOqu7ePQ4riAY4nzIvRRKbuXAbaHpJSwC
         uJw7ALr6duNWAn8jSScCLQYQEB3ncImKswOyqQ0lukPEnQycCSWxD4uy0gC1OAp+UkOZ
         +UQ3wmm60gY/pCmE/3WL8b6NuYnARDlzL5BbzsDR1kGEH9U1Dy837feUX8kBHKUaDmKy
         oGCTlS3GhSDx1+PL2X6d4ggi2+euNPYMRx55OerOT2AhJ/EnHl7USV8Fxcm5GRktgnZL
         JSLhU7Pie1WqdQsjJemS6hB3jABZld/8fIbnMU6ZsH6snaVqDVPNHsYX+hmYweETzFbr
         OppQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UvtBLtUS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k14si844469qvu.69.2020.10.23.09.19.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Oct 2020 09:19:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UvtBLtUS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kVzmS-0005xM-A8
	for alex.bennee@linaro.org; Fri, 23 Oct 2020 12:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kVzQs-00027F-FX
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 11:56:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kVzQq-0005OP-Ix
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 11:56:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603468604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fUpIiA80kzCQG3WyAunrf71WbEpFTyhfJoK4ohi5mgw=;
 b=UvtBLtUSykln/af3QmwK43VjuWjq7WTewliH8CL0JqlG/stnCgR9vZie0h3h6E1jp4GyRv
 xyekBiHrw94kI3FhnML+w4uhFlpFO74y5/cIuGEIiAZxead5DscEJ/LhLGil6Gy5hAvKC2
 7qvvxZilzMCe2NbCXDkdEOzUi3XfLx0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-S_xAAfnnMjiYZsHdI4Pg-w-1; Fri, 23 Oct 2020 11:56:40 -0400
X-MC-Unique: S_xAAfnnMjiYZsHdI4Pg-w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25F8C805729;
 Fri, 23 Oct 2020 15:55:59 +0000 (UTC)
Received: from localhost (unknown [10.40.208.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B3BB60DA0;
 Fri, 23 Oct 2020 15:55:56 +0000 (UTC)
Date: Fri, 23 Oct 2020 17:55:55 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 7/9] hw/arm/raspi: Add the Raspberry Pi A+ machine
Message-ID: <20201023175555.669c415b@redhat.com>
In-Reply-To: <20201018203358.1530378-8-f4bug@amsat.org>
References: <20201018203358.1530378-1-f4bug@amsat.org>
 <20201018203358.1530378-8-f4bug@amsat.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Luc Michel <luc@lmichel.fr>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 32yPj3UnZSfr

On Sun, 18 Oct 2020 22:33:56 +0200
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> The Pi A is almost the first machine released.
> It uses a BCM2835 SoC which includes a ARMv6Z core.
>=20
> Example booting the machine using content from [*]
> (we use the device tree from the B model):
>=20
>   $ qemu-system-arm -M raspi1ap -serial stdio \
>       -kernel raspberrypi/firmware/boot/kernel.img \
>       -dtb raspberrypi/firmware/boot/bcm2708-rpi-b-plus.dtb \
>       -append 'earlycon=3Dpl011,0x20201000 console=3DttyAMA0'
>   [    0.000000] Booting Linux on physical CPU 0x0
>   [    0.000000] Linux version 4.19.118+ (dom@buildbot) (gcc version 4.9.=
3 (crosstool-NG crosstool-ng-1.22.0-88-g8460611)) #1311 Mon Apr 27 14:16:15=
 BST 2020
>   [    0.000000] CPU: ARMv6-compatible processor [410fb767] revision 7 (A=
RMv7), cr=3D00c5387d
>   [    0.000000] CPU: VIPT aliasing data cache, unknown instruction cache
>   [    0.000000] OF: fdt: Machine model: Raspberry Pi Model B+
>   ...
>=20
> [*] http://archive.raspberrypi.org/debian/pool/main/r/raspberrypi-firmwar=
e/raspberrypi-kernel_1.20200512-2_armhf.deb
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/raspi.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 30fafa59ecb..91a59d1d489 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -319,6 +319,15 @@ static void raspi_machine_class_common_init(MachineC=
lass *mc,
>      mc->default_ram_id =3D "ram";
>  };
> =20
> +static void raspi1ap_machine_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +    RaspiMachineClass *rmc =3D RASPI_MACHINE_CLASS(oc);
> +
> +    rmc->board_rev =3D 0x900021;
> +    raspi_machine_class_common_init(mc, rmc->board_rev);
> +};
> +
>  static void raspi2b_machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(oc);
> @@ -343,6 +352,10 @@ static void raspi3b_machine_class_init(ObjectClass *=
oc, void *data)
> =20
>  static const TypeInfo raspi_machine_types[] =3D {
>      {
> +        .name           =3D MACHINE_TYPE_NAME("raspi1ap"),
> +        .parent         =3D TYPE_RASPI_MACHINE,
> +        .class_init     =3D raspi1ap_machine_class_init,
> +    }, {
>          .name           =3D MACHINE_TYPE_NAME("raspi2b"),
>          .parent         =3D TYPE_RASPI_MACHINE,
>          .class_init     =3D raspi2b_machine_class_init,

