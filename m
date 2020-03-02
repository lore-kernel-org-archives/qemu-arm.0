Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2297882lfg;
        Mon, 2 Mar 2020 02:55:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqxjre/vJDR4VcZ+bfDcVBtf33/25/4vkd2PyAtwWHB0hf2WqRh4y7IeMuSaE2Gy1Nh3dT8B
X-Received: by 2002:a05:620a:1033:: with SMTP id a19mr15747000qkk.501.1583146538405;
        Mon, 02 Mar 2020 02:55:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583146538; cv=none;
        d=google.com; s=arc-20160816;
        b=FSzMtfWm5PWRWsscdl2K18VElVJihDK4GSULW/BQFBU9eM2vCeosNR86lUNbyqBm0V
         rbOzkzgUOUD1cByk+wrWMJve1fuwQVqym//EoySEcIJqpuUBXj3ke3lLBToERUB6+CPp
         OYKuL7N0fYcG1p/GelD0dUBWElR29xpbMCYwIYG0ld9jYiWjs6YrC9GmAis9GTegoef4
         H9qAmujcHKQqNRQG+X0cSRhDMIXnoxHdb2dAOvOmkMAPyQLCb3vCK1LXWIQSSCJsVK/Z
         Di0WjcbfnarggskX56XYBbViE78kCsX0H+A6wvZr/re4mEfoZVFtAUIgK/BWfwfBrmt5
         ZT1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=y6ylNIp5+a3tQJdTZkzfrzqY+ZPI6Z84ofOgeIdgybQ=;
        b=Aonc/3ACQsvwLKiZJbM/+f1yfNNr4OOSCiws2ftzZJ8Gu6c/06krJYIKkZ5zOhRGhE
         QnW6g9zYBumI9q+DBYUc45ixWehsiscn2XcMshGVZWcCh4XVvewQyK5O0EotKiCilyjn
         +3AmXYyw0amTajf1cxMP8er+CkA2yx5iqchhe9nuUlrC2AMQJ/BjROAv7o5Clm2hrAPC
         zvw5us91O2LuU9vRBGEVyVcbK4LE5NCirc8B6WcVdLrFMRKoxyIlbnGXK2hO3FUGijIT
         u7ZjOwR+A0tzV8MsE7Vborqvxp5fDv2jiloAEMXkT2dfAVJWHoOIUuAi3TReoWf/OVsm
         CszA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ELSiSQP/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10si5722761qtq.6.2020.03.02.02.55.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 02:55:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ELSiSQP/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8ijZ-0007mG-RP
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 05:55:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57703)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j8ijP-0007eB-QL
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 05:55:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j8ijO-00041X-Hi
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 05:55:27 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25606
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j8ijO-00041N-Df
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 05:55:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583146525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=y6ylNIp5+a3tQJdTZkzfrzqY+ZPI6Z84ofOgeIdgybQ=;
 b=ELSiSQP/CDdY94qXTESw87v1bJT7havpIi+Sp645+0P9jGPRLrkDGsAiDK8jhEbU3vK5D8
 ivBpIZ8KouOpGwnj011ppNO6aEVcoSwNjRL+awkxrzF1lSRz6vCpKhD/tLpauoo9KFEJxp
 0RALxsXyBIzHRCk1BlYWFyZwIsieCcw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-qRVLFL1cNYeQH1KuYb_Vag-1; Mon, 02 Mar 2020 05:55:24 -0500
X-MC-Unique: qRVLFL1cNYeQH1KuYb_Vag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CB68107ACC4;
 Mon,  2 Mar 2020 10:55:23 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFC4727198;
 Mon,  2 Mar 2020 10:55:18 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v3 0/6] hw/arm/virt: kvm: allow gicv3 by default if v2 cannot
 work
Date: Mon,  2 Mar 2020 11:55:10 +0100
Message-Id: <20200302105516.5972-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-TUID: uLJRPXdDBlmG

At the moment if the end-user does not specify the gic-version along
with KVM acceleration, v2 is set by default. However most of the
systems now have GICv3 and sometimes they do not support GICv2
compatibility. In that case we now end up with the following error:

"qemu-system-aarch64: Initialization of device kvm-arm-gic failed:
error creating in-kernel VGIC: No such device
Perhaps the host CPU does not support GICv2?"

since "1904f9b5f1  hw/intc/arm_gic_kvm: Don't assume kernel can
provide a GICv2" which already allowed to output an explicit error
message.

This patch keeps the default v2 selection in all cases except
in the KVM accelerated mode when v2 cannot work:
- either because the host does not support v2 in-kernel emulation or
- because more than 8 vcpus were requested.

Those cases did not work anyway so we do not break any compatibility.
Now we get v3 selected in such a case.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v4.2.0-gic-version-v3

History:

v2 -> v3:
- replaced defines by VirtGICType enum type
- fixed some style issue
- collected Richard and Dres's R-b
  except on "hw/arm/virt: Introduce VirtGICType enum type" just
  to make sure this matches their expectation.

RFC -> v2:
- 1904f9b5f1  hw/intc/arm_gic_kvm: Don't assume kernel can
  provide a GICv2" now has landed upstream
- Fix gic-version description
- Introduce finalize_gic_version and use switch/cases
- take into account smp value

Eric Auger (6):
  hw/arm/virt: Document 'max' value in gic-version property description
  hw/arm/virt: Introduce VirtGICType enum type
  hw/arm/virt: Introduce finalize_gic_version()
  target/arm/kvm: Let kvm_arm_vgic_probe() return a bitmap
  hw/arm/virt: kvm: Check the chosen gic version is supported by the
    host
  hw/arm/virt: kvm: allow gicv3 by default if v2 cannot work

 hw/arm/virt.c         | 125 +++++++++++++++++++++++++++++++-----------
 include/hw/arm/virt.h |  12 +++-
 target/arm/kvm.c      |  14 +++--
 target/arm/kvm_arm.h  |   3 +
 4 files changed, 114 insertions(+), 40 deletions(-)

--=20
2.20.1

