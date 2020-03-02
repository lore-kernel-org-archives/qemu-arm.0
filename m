Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2151872lfg;
        Sun, 1 Mar 2020 23:55:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqyHJtt3hKmKS90VnOC1b2zBwJRSWRR4eZKq2o0FKlmnIZFGGY4yJ2x/5Llwk9lPpW8gzgop
X-Received: by 2002:ac8:44c7:: with SMTP id b7mr14899729qto.366.1583135752312;
        Sun, 01 Mar 2020 23:55:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583135752; cv=none;
        d=google.com; s=arc-20160816;
        b=Mh5lIMW2o1O40Zmox64VFr4eiy8rQ7KynSu6Uh1uY4Sz6uvgaSn2waRBNJUBMg3F8a
         XbZGRHnA0rtjLba2lXZnqXtnd9mAjheRF0pW0bVBffv+7LO85j0aLyhkR4uVSR+t4Zud
         7W+887KqeAmVDtwifftB/spPCCQFuioHf1nQOaQk+gMJlzaA5Eyi99fq1QokyfRJD9Fc
         vz/OBiLo18QkEW9MoqR6dF5ieRh79DA+yBVwtJIaWMOEEsVvi3wLEFfmTmVEnNH0Dh+E
         hpLYaYLVF8oilKQ4Rw6dnv9viayd5KgVtn1CSl3pjBYyUzsMCo2WpalRZqnpHu4Jex1i
         08Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=2n7atWwxs0eBK36OqGJP9Xr9a0PK2Mh9Tqpbr9clRgk=;
        b=syteGyC+Bt2ArOpGJFF8Y3PlK/J30mggPNM2vLlE/bPo63OwBf78EzFmwGO29X4nDv
         2GImBepodweKDI9vjAPgR7jKu881aHROolQw+suQEFD82liJPRACC1+bEYnBQOfMm+AU
         jJdV4ZYno12DrIvvyt+oAwxrdo9YFFH1u9w2hdBHywzOS73Ac1ObH3BW6xgBjMGw8o/i
         4CVAvmCJaDkkrW2nRueXJViXSqNSiXQbdOF8wcjNKuDNTgXQ0iXfUs0AqAQ4moXAEf0m
         XkZ1IpwmgizlVyWCS6x3qFgzoi6qb+HiWbShaegbtskj7+2cGX8Kftnu+jc0a6X9vRaW
         CqQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fxUfGr0n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l201si4336512qke.331.2020.03.01.23.55.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Mar 2020 23:55:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fxUfGr0n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8fvb-0003iQ-P3
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 02:55:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33784)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1j8fvT-0003fg-33
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 02:55:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1j8fvR-00012Z-O4
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 02:55:42 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49047
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1j8fvR-00012Q-JZ
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 02:55:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583135741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2n7atWwxs0eBK36OqGJP9Xr9a0PK2Mh9Tqpbr9clRgk=;
 b=fxUfGr0n8sETaMrZKcH1hQRewIZb9krMJH4uziwA5oAaTrX2hCQdOhNbDiZjlM0ngFnwPA
 Anfuc4DTen9E5gg2ptGofNlEIVpcn7ObUeL7yA7e+bWxMRGt4VvDYlJlUcGilH3PjZ58J9
 cz4JlOEbqgOVHf2LRm8pUfvdCCD3EL4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-MEKt-iFzMVS3EU4J5N2YyQ-1; Mon, 02 Mar 2020 02:55:37 -0500
X-MC-Unique: MEKt-iFzMVS3EU4J5N2YyQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 300FC100550E;
 Mon,  2 Mar 2020 07:55:36 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D498860C05;
 Mon,  2 Mar 2020 07:55:32 +0000 (UTC)
Date: Mon, 2 Mar 2020 08:55:29 +0100
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 0/6] hw/arm/virt: kvm: allow gicv3 by default if v2
 cannot work
Message-ID: <20200302075529.sfnehrrqqa3hvg4b@kamzik.brq.redhat.com>
References: <20200301104040.15186-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200301104040.15186-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, maz@kernel.org,
 qemu-devel@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OwJjl38MT3Pt

On Sun, Mar 01, 2020 at 11:40:34AM +0100, Eric Auger wrote:
> At the moment if the end-user does not specify the gic-version along
> with KVM acceleration, v2 is set by default. However most of the
> systems now have GICv3 and sometimes they do not support GICv2
> compatibility. In that case we now end up with the following error:
>=20
> "qemu-system-aarch64: Initialization of device kvm-arm-gic failed:
> error creating in-kernel VGIC: No such device
> Perhaps the host CPU does not support GICv2?"
>=20
> since "1904f9b5f1  hw/intc/arm_gic_kvm: Don't assume kernel can
> provide a GICv2", which already allowed to output an explicit error
> message.
>=20
> This series keeps the default v2 selection in all cases except
> in the KVM accelerated mode when v2 cannot work:
> - either because the host does not support v2 in-kernel emulation or
> - because more than 8 vcpus were requested.
>=20
> Those cases did not work anyway so we do not break any compatibility.
> Now we get v3 selected in such a case.
>=20
> Best Regards
>=20
> Eric
>=20
> This series can be found at:
> https://github.com/eauger/qemu/tree/v4.2.0-gic-version-v2
>=20
> History:
> RFC -> v2:
> - 1904f9b5f1  hw/intc/arm_gic_kvm: Don't assume kernel can
>   provide a GICv2" now has landed upstream
> - Fix gic-version description
> - Introduce finalize_gic_version and use switch/cases
> - take into account smp value
>=20
> Eric Auger (6):
>   hw/arm/virt: Document 'max' value in gic-version property description
>   hw/arm/virt: Use VIRT_GIC_VERSION defines
>   hw/arm/virt: Introduce finalize_gic_version()
>   target/arm/kvm: Let kvm_arm_vgic_probe() return a bitmap
>   hw/arm/virt: kvm: Check the chosen gic version is supported by the
>     host
>   hw/arm/virt: kvm: allow gicv3 by default if v2 cannot work
>=20
>  hw/arm/virt.c         | 124 +++++++++++++++++++++++++++++++-----------
>  include/hw/arm/virt.h |   8 ++-
>  target/arm/kvm.c      |  14 +++--
>  target/arm/kvm_arm.h  |   3 +
>  4 files changed, 110 insertions(+), 39 deletions(-)
>=20
> --=20
> 2.20.1
>=20
>

With Richard's enum suggestions

For the series

Reviewed-by: Andrew Jones <drjones@redhat.com>

