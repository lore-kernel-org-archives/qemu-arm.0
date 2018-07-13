Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp425079wrq;
        Fri, 13 Jul 2018 01:28:02 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcgT1Bt9kW/VA5NuNviZW4Z9ntfmsfZDHFLSqi+hMugUdFEgBtRgNR3VJdOg3YGr3H1B6zm
X-Received: by 2002:a37:8b47:: with SMTP id n68-v6mr4642056qkd.27.1531470482751;
        Fri, 13 Jul 2018 01:28:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531470482; cv=none;
        d=google.com; s=arc-20160816;
        b=iex+jyKBN3vy5kza1iKR5XQfW3tBVTV0eS7JnsQY0wT5R2h3UeTvSgDVEulk75qgAV
         H9J4lzXPK4/ETsSJ/GLmNV/SeHSzdOe0pF3wDkiNukY+bONOQzsz6+dZQb+sULXOGmGN
         Izuxc4BFlPE8xIwMeEbp6FChtN1Oi93ySqyrcJRoa8ZdPCM2NICDOgM78YEwfEH9j8Ya
         HbbAU8E07kM3fXCpBS6HW+wA/Cs+kE+ibYhle/lkYxlrBhwvlSOebpofy9asyefKLZZk
         FbSq5/zdI4if3Q7IuLTVrR3ABcNLvoCYdnnJ/NbWGIdkl4Cl4eLzY9BQ041u1O+e5YPk
         CpTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=UZ7SQs0QbWpr8cdy2K3xukFkZDZ/6e0OlXaQcBC5zwc=;
        b=JcBAaNOILhX3REyi/SUStAwwtkhoFrINDg28KauwmnfryPyWYbrDkg4RzDCKnQ6wid
         f8YL0figNO3G2PSxkJkjgMFwMYs5Wk3OCfnZarWLavc4u1OPvfENL/LMh10nvZa4Jp5h
         RtYipmTCAzy2Bp96rZzLgZtcaVDaj1jiW14BkD2DwfdlL5QPRI9qGWlTgy1M4qQLIXm1
         nhv3/xa6aeskQ4zTVBcd020vJPl4h7siEckJuT7hn/0XuXatH7hxb3IhYORF5yuhRiJm
         G8gxg5sUf9GvM2BZcm84+hxPuw9Gg+9ORsHSLJ6EUG2y8eZwznK14vu25NravG1qLm3V
         OU4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h9-v6si7192539qkm.162.2018.07.13.01.28.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 01:28:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35856 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdtQo-00029H-8O
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 04:28:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40208)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtQd-00028n-VK
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:27:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtQa-00044v-Qr
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:27:51 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46336 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fdtQa-00043J-Kn; Fri, 13 Jul 2018 04:27:48 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C2223C12AA;
	Fri, 13 Jul 2018 08:27:47 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-70.ams2.redhat.com [10.36.116.70])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 28D332026D6B;
	Fri, 13 Jul 2018 08:27:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 13 Jul 2018 10:27:28 +0200
Message-Id: <1531470464-21522-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Fri, 13 Jul 2018 08:27:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Fri, 13 Jul 2018 08:27:47 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 00/16] Fix crashes with introspection of ARM
 devices
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Markus Armbruster <armbru@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zabw7UoZZMoj

As discovered recently, you can crash QEMU with a lot of devices
that do not get the reference counting of child objects right.
You just have to run 'device-list-properties' and call 'info qtree'
afterwards.
This patch series fixes a bunch of these problems in the ARM code.
I did not fix all problems yet, since it is quite time consuming,
and this series is big enough already. The remaining problems can
be fixed in an independent patch series later.

v2:
 - Updated the first patch according to the review feedback from v1
 - Added more patches with additional fixes

Thomas Huth (16):
  qom/object: Add a new function object_initialize_child()
  hw/core/sysbus: Add a function for creating and attaching an object
  hw/arm/bcm2836: Fix crash with device_add bcm2837 on unsupported
    machines
  hw/arm/armv7: Fix crash when introspecting the "iotkit" device
  hw/cpu/a15mpcore: Fix introspection problem with the a15mpcore_priv
    device
  hw/display/xlnx_dp: Move problematic code from instance_init to
    realize
  hw/arm/xlnx-zynqmp: Fix crash when introspecting the "xlnx,zynqmp"
    device
  hw/arm/msf2-soc: Fix introspection problem with the "msf2-soc" device
  hw/cpu/a9mpcore: Fix introspection problems with the "a9mpcore_priv"
    device
  hw/arm/fsl-imx6: Fix introspection problems with the "fsl,imx6" device
  hw/arm/fsl-imx7: Fix introspection problems with the "fsl,imx7" device
  hw/arm/fsl-imx25: Fix introspection problem with the "fsl,imx25"
    device
  hw/arm/fsl-imx31: Fix introspection problem with the "fsl,imx31"
    device
  hw/cpu/arm11mpcore: Fix introspection problem with 'arm11mpcore_priv'
  hw/*/realview: Fix introspection problem with 'realview_mpcore' &
    'realview_gic'
  hw/arm/allwinner-a10: Fix introspection problem with 'allwinner-a10'

 hw/arm/allwinner-a10.c   | 19 +++++-----
 hw/arm/armv7m.c          |  7 ++--
 hw/arm/bcm2836.c         | 18 +++------
 hw/arm/fsl-imx25.c       | 30 +++++++--------
 hw/arm/fsl-imx31.c       | 26 ++++++-------
 hw/arm/fsl-imx6.c        | 56 ++++++++++------------------
 hw/arm/fsl-imx7.c        | 96 ++++++++++++++++--------------------------------
 hw/arm/iotkit.c          | 74 ++++++++++++++++---------------------
 hw/arm/msf2-soc.c        | 15 ++++----
 hw/arm/xlnx-zynqmp.c     | 61 ++++++++++++++----------------
 hw/core/sysbus.c         |  8 ++++
 hw/cpu/a15mpcore.c       |  8 ++--
 hw/cpu/a9mpcore.c        | 18 ++++-----
 hw/cpu/arm11mpcore.c     | 14 +++----
 hw/cpu/realview_mpcore.c |  8 ++--
 hw/display/xlnx_dp.c     | 23 +++++-------
 hw/intc/armv7m_nvic.c    |  5 +--
 hw/intc/realview_gic.c   |  7 +---
 include/hw/sysbus.h      |  3 ++
 include/qom/object.h     | 23 +++++++++++-
 qom/object.c             | 15 ++++++++
 21 files changed, 244 insertions(+), 290 deletions(-)

-- 
1.8.3.1

