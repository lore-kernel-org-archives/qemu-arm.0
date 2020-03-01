Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1241625lfg;
        Sun, 1 Mar 2020 02:41:05 -0800 (PST)
X-Google-Smtp-Source: ADFU+vv4GouoS5OKdpzvlJwgLk+290rwk9sV/0+L4p4OFaJqXWaXTbs3RC1wUaDSg998szgg3wUZ
X-Received: by 2002:ac8:2fda:: with SMTP id m26mr4834646qta.336.1583059265381;
        Sun, 01 Mar 2020 02:41:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583059265; cv=none;
        d=google.com; s=arc-20160816;
        b=IFn0pRF8rM0jCC0+FpGL191bSaM6PVsObGNkLTzbc8MSeXvcR3otHZglBr+qIRc7GO
         HIjoqGjIMmzHwUfVCe9C+Sh7/FyPL8/qwTOxRgkt9hCezFKNbXETPLgmD5/+NnIuxjae
         5gj3DUK3VWKCA4d3ja1317nwndqS5JoBjJnPyaHfwuuKBy02s3Rjkv3u4kKZq5r1aoGw
         BNa10cMbik1XKEcFjzzuVCXgk/HCO+9/+J7dULvdva5VD8ls9JGkcAQ/o/C6gbvcPcva
         ls2SflY1FN+hqVStwV/1moZB9uvY8cPVJUJWWYUlS/Cydv4Nq5zsSYXkAIthA7m/2NOQ
         c/Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=zPZDYVintvSdLtU0ZgbD5jWLO5AKlbV9L1uBhfdW6bY=;
        b=SAqrCR3G18ORx8c4xMZNzA1fwivQ7RVHaNW97IoHeIIl4McPd4knthgsN41qCwqM5v
         2DiwqsHDeLvMnJ203CIllNJ8ZKMreSDPKZtbvk6WSaZTcUikis0GrXHSSLPQkq4ugXoR
         RCj8k5NdBYFLHqTUg3rMVYJdV5/anZpDqKa0BdwDwxIy+W9997jgIh25fWeSZodBl8Cq
         HGEtnzb5DT8+/TVTkB/WDLNgAa21yt7fEkkMRJL9aEDFrQ4e8UaobxbsFTyAj6flC4k3
         KLafOdx4e2Q7tO4GglWkhtomqaadpEKujh6PnxG6mvi4Nwyim1HwDlqEVMuejPP3Beph
         0+Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=huk5WpPr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u205si4284145qka.368.2020.03.01.02.41.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Mar 2020 02:41:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=huk5WpPr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8M1w-0001UC-Q1
	for alex.bennee@linaro.org; Sun, 01 Mar 2020 05:41:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52834)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j8M1o-0001Tq-8B
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 05:40:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j8M1m-0001iO-F5
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 05:40:55 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37353
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j8M1m-0001iA-B8
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 05:40:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583059253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zPZDYVintvSdLtU0ZgbD5jWLO5AKlbV9L1uBhfdW6bY=;
 b=huk5WpPrWFCNxfI178Z9nwEu4BoRcWQGomTvCE1hh7jed87/TFVnmYYwGruEBXwH8LN3CV
 SSqTZ/a9ojKM4BmylJ6rfoQRH01ALd9h4rS9OrDXXInaQtzILarlCh+waeRlJYDqi3rflk
 eCJQ8AC2CyhfZV0rzaKyQTIklzx9x4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-o9ieG1C0MJS7g8Cdrwz4bA-1; Sun, 01 Mar 2020 05:40:51 -0500
X-MC-Unique: o9ieG1C0MJS7g8Cdrwz4bA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB89713E2;
 Sun,  1 Mar 2020 10:40:49 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DCE660C80;
 Sun,  1 Mar 2020 10:40:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v2 0/6] hw/arm/virt: kvm: allow gicv3 by default if v2 cannot
 work
Date: Sun,  1 Mar 2020 11:40:34 +0100
Message-Id: <20200301104040.15186-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
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
Cc: maz@kernel.org, drjones@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mKnMG3Gb1Kn+

At the moment if the end-user does not specify the gic-version along
with KVM acceleration, v2 is set by default. However most of the
systems now have GICv3 and sometimes they do not support GICv2
compatibility. In that case we now end up with the following error:

"qemu-system-aarch64: Initialization of device kvm-arm-gic failed:
error creating in-kernel VGIC: No such device
Perhaps the host CPU does not support GICv2?"

since "1904f9b5f1  hw/intc/arm_gic_kvm: Don't assume kernel can
provide a GICv2", which already allowed to output an explicit error
message.

This series keeps the default v2 selection in all cases except
in the KVM accelerated mode when v2 cannot work:
- either because the host does not support v2 in-kernel emulation or
- because more than 8 vcpus were requested.

Those cases did not work anyway so we do not break any compatibility.
Now we get v3 selected in such a case.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v4.2.0-gic-version-v2

History:
RFC -> v2:
- 1904f9b5f1  hw/intc/arm_gic_kvm: Don't assume kernel can
  provide a GICv2" now has landed upstream
- Fix gic-version description
- Introduce finalize_gic_version and use switch/cases
- take into account smp value

Eric Auger (6):
  hw/arm/virt: Document 'max' value in gic-version property description
  hw/arm/virt: Use VIRT_GIC_VERSION defines
  hw/arm/virt: Introduce finalize_gic_version()
  target/arm/kvm: Let kvm_arm_vgic_probe() return a bitmap
  hw/arm/virt: kvm: Check the chosen gic version is supported by the
    host
  hw/arm/virt: kvm: allow gicv3 by default if v2 cannot work

 hw/arm/virt.c         | 124 +++++++++++++++++++++++++++++++-----------
 include/hw/arm/virt.h |   8 ++-
 target/arm/kvm.c      |  14 +++--
 target/arm/kvm_arm.h  |   3 +
 4 files changed, 110 insertions(+), 39 deletions(-)

--=20
2.20.1

