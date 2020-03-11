Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp702215lfc;
        Wed, 11 Mar 2020 05:24:12 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuqO3V0HE+5y/vaB2rIeZv6NgCtTXEyYotpdxl2pSFmszaPt7Ep8wR4eqnNMMM82sWp4uBC
X-Received: by 2002:a0c:9b96:: with SMTP id o22mr2472254qve.169.1583929452385;
        Wed, 11 Mar 2020 05:24:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583929452; cv=none;
        d=google.com; s=arc-20160816;
        b=hqLZ75Z/I42Vi1c9OpQhn0DqZ6MEwQNZWJu6W9XrQvP32ohIhKMt6BqWO7SyAa0hG2
         UNaSpbU9UURdm7/bTwPOYQ/JkTjj8QEGJ7TlfPdUbJBg6GOucDybH85g2FPpJmu/veiK
         u+TWgqUBWhWEjIrmjjQ9HXGwmdXpdwcDayENG1Xcw+qlhmrz16eJYmKr+kV0Pju8FUcW
         OWu30dwcnCtW0r6r3ndF+Na5GcFXcnSj/dOJnXRdNwQWia4xCA0IwJKUOuNFvAgh5mZS
         40WOMjpt8/OgT3FZa8Sl3xrCPMGk3L7OHZySWlPLVeK9UHvb4tV18CtG7uEeMw5EVSU3
         wSHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=KBuiODKRxkaRVL2hQqHCpTe1BuPlp8I9j0M96k7lkTg=;
        b=WVaGwWOPMY1oYNWHK+fK8g+SJnpCmn9ioRvDEQzBdP6yE80cR1CjmXTI9yfwugvQPL
         CVqr10VE9m8dxRUnGTCopF++jbxMYtC1S1LB0kB3okaAAx/7ZuQ7iaB2JKCF9YGp/xGF
         1RouJwnpUg3iW5/3szZJFE4DauKxkdOz2Wx5GAA6aeXR8D72QPNuZ1I2C6IOltNnWVpp
         8AnSRF6iL6291YOJye5wgJ1ft/rFu4VOnkkRsloXc4C7zpL/bYWWLIAxdk6TMg0DW763
         9iawDKGfIrv3dbwTpO2yw4W9ZaDM91DM2uNa1JuJh3WxXhhJhGOB2jOzJ/f00FCoy3aS
         UZ0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=N+jGEWHG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h14si890794qtr.301.2020.03.11.05.24.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 05:24:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=N+jGEWHG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jC0PD-0003EX-Qr
	for alex.bennee@linaro.org; Wed, 11 Mar 2020 08:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42279)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1jC0Oz-0003DY-Ry
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 08:23:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1jC0Oy-0000Px-Iv
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 08:23:57 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37361
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1jC0Oy-0000Pm-FZ
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 08:23:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583929436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KBuiODKRxkaRVL2hQqHCpTe1BuPlp8I9j0M96k7lkTg=;
 b=N+jGEWHGUr8K/fqVX6Ym36UecqSL0Hfim5ZPI2koI7Ok9bBh77DP2QObDPkyR85hWGiH5T
 jRhGt8LIPvGNW/v/Rdx2fP1gKO0Ud83qGTCRwi5Zdepg7Vx3N4EvVgUTVid73Mh+pSTWjw
 OYiN2jzO2h71QaM4xUKEl4M7+K3kZY0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-lj48Q7GPPsGWSL-CZHCwtQ-1; Wed, 11 Mar 2020 08:23:54 -0400
X-MC-Unique: lj48Q7GPPsGWSL-CZHCwtQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0405D18CA240;
 Wed, 11 Mar 2020 12:23:53 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-206-80.brq.redhat.com
 [10.40.206.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22D0D8F364;
 Wed, 11 Mar 2020 12:23:48 +0000 (UTC)
Date: Wed, 11 Mar 2020 13:23:46 +0100
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v4 5/6] hw/arm/virt: kvm: Restructure
 finalize_gic_version()
Message-ID: <20200311122346.a3cizebacaipgbyl@kamzik.brq.redhat.com>
References: <20200311111626.5705-1-eric.auger@redhat.com>
 <20200311111626.5705-6-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200311111626.5705-6-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, maz@kernel.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, philmd@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0ff8RVugTsCL

On Wed, Mar 11, 2020 at 12:16:25PM +0100, Eric Auger wrote:
> Restructure the finalize_gic_version with switch cases and
> clearly separate the following cases:
>=20
> - KVM mode / in-kernel irqchip
> - KVM mode / userspace irqchip
> - TCG mode
>=20
> In KVM mode / in-kernel irqchip , we explictly check whether
> the chosen version is supported by the host. If the end-user
> explicitly sets v2/v3 and this is not supported by the host,
> then the user gets an explicit error message. Note that for
> old kernels where the CREATE_DEVICE ioctl doesn't exist then
> we will now fail if the user specifically asked for gicv2,
> where previously we (probably) would have succeeded.
>=20
> In KVM mode / userspace irqchip we immediatly output an error
> in case the end-user explicitly selected v3. Also we warn the
> end-user about the unexpected usage of gic-version=3Dhost in
> that case as only userspace GICv2 is supported.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>=20
> ---
>=20
> v3 -> v4:
> - introduce a separate switch case for KVM mode / userspace
>   irqchip
> - don't probe the host GIC version in case of userspace
>   GIC
> - add error/warning messages in v3/host mode in userspace
>   mode
> - mention old kernel case with explicit v2/v3 regression
>=20
> v2 -> v3:
> - explictly list V2 and V3 in the switch/case
> - fix indent
> ---
>  hw/arm/virt.c | 89 +++++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 68 insertions(+), 21 deletions(-)
>=20
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f798b6ec10..f5ff2d9006 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1543,33 +1543,80 @@ static void virt_set_memmap(VirtMachineState *vms=
)
>   */
>  static void finalize_gic_version(VirtMachineState *vms)
>  {
> -    if (vms->gic_version =3D=3D VIRT_GIC_VERSION_HOST ||
> -        vms->gic_version =3D=3D VIRT_GIC_VERSION_MAX) {
> -        if (!kvm_enabled()) {
> -            if (vms->gic_version =3D=3D VIRT_GIC_VERSION_HOST) {
> -                error_report("gic-version=3Dhost requires KVM");
> -                exit(1);
> -            } else {
> -                /* "max": currently means 3 for TCG */
> -                vms->gic_version =3D VIRT_GIC_VERSION_3;
> -            }
> -        } else {
> -            int probe_bitmap =3D kvm_arm_vgic_probe();
> +    if (kvm_enabled()) {
> +        int probe_bitmap;
> =20
> -            if (!probe_bitmap) {
> +        if (!kvm_irqchip_in_kernel()) {
> +            switch (vms->gic_version) {
> +            case VIRT_GIC_VERSION_HOST:
> +                warn_report(
> +                    "gic-version=3Dhost not relevant with kernel-irqchip=
=3Doff "
> +                     "as only userspace GICv2 is supported. Using v2 ...=
");
> +                return;
> +            case VIRT_GIC_VERSION_MAX:
> +            case VIRT_GIC_VERSION_NOSEL:
> +                vms->gic_version =3D VIRT_GIC_VERSION_2;
> +                return;
> +            case VIRT_GIC_VERSION_2:
> +                return;
> +            case VIRT_GIC_VERSION_3:
>                  error_report(
> -                    "Unable to determine GIC version supported by host")=
;
> +                    "gic-version=3D3 is not supported with kernel-irqchi=
p=3Doff");
>                  exit(1);
> -            } else {
> -                if (probe_bitmap & KVM_ARM_VGIC_V3) {
> -                    vms->gic_version =3D VIRT_GIC_VERSION_3;
> -                } else {
> -                    vms->gic_version =3D VIRT_GIC_VERSION_2;
> -                }
>              }
>          }
> -    } else if (vms->gic_version =3D=3D VIRT_GIC_VERSION_NOSEL) {
> +
> +        probe_bitmap =3D kvm_arm_vgic_probe();
> +        if (!probe_bitmap) {
> +            error_report(
> +                "Unable to determine GIC version supported by host");

No need for this line break

> +            exit(1);
> +        }
> +
> +        switch (vms->gic_version) {
> +        case VIRT_GIC_VERSION_HOST:
> +        case VIRT_GIC_VERSION_MAX:
> +            if (probe_bitmap & KVM_ARM_VGIC_V3) {
> +                vms->gic_version =3D VIRT_GIC_VERSION_3;
> +            } else {
> +                vms->gic_version =3D VIRT_GIC_VERSION_2;
> +            }
> +            return;
> +        case VIRT_GIC_VERSION_NOSEL:
> +            vms->gic_version =3D VIRT_GIC_VERSION_2;
> +            break;
> +        case VIRT_GIC_VERSION_2:
> +        case VIRT_GIC_VERSION_3:
> +            break;
> +        }
> +
> +        /* Check chosen version is effectively supported by the host */
> +        if (vms->gic_version =3D=3D VIRT_GIC_VERSION_2 &&
> +            !(probe_bitmap & KVM_ARM_VGIC_V2)) {
> +            error_report("host does not support in-kernel GICv2 emulatio=
n");
> +            exit(1);
> +        } else if (vms->gic_version =3D=3D VIRT_GIC_VERSION_3 &&
> +                   !(probe_bitmap & KVM_ARM_VGIC_V3)) {
> +            error_report("host does not support in-kernel GICv3 emulatio=
n");
> +            exit(1);
> +        }
> +        return;
> +    }
> +
> +    /* TCG mode */
> +    switch (vms->gic_version) {
> +    case VIRT_GIC_VERSION_NOSEL:
>          vms->gic_version =3D VIRT_GIC_VERSION_2;
> +        break;
> +    case VIRT_GIC_VERSION_MAX:
> +        vms->gic_version =3D VIRT_GIC_VERSION_3;
> +        break;
> +    case VIRT_GIC_VERSION_HOST:
> +        error_report("gic-version=3Dhost requires KVM");
> +        exit(1);
> +    case VIRT_GIC_VERSION_2:
> +    case VIRT_GIC_VERSION_3:
> +        break;
>      }
>  }
> =20
> --=20
> 2.20.1
>

Other than the nit,

Reviewed-by: Andrew Jones <drjones@redhat.com>
=20

