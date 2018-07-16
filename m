Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1473973wru;
        Mon, 16 Jul 2018 05:59:54 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdo0Vki6t7SW7U89jp4XpAxUtNMaOX4eNZdqa7vJ5UzJpUyZcO8iYdsaSO2In2yVG7u3Urd
X-Received: by 2002:ac8:84a:: with SMTP id x10-v6mr14777278qth.90.1531745994413;
        Mon, 16 Jul 2018 05:59:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531745994; cv=none;
        d=google.com; s=arc-20160816;
        b=HosRWBY7AC10abdHsXLvNLLEqjazy84mp0g1b0lvh5yweaijvblyMNdPRU56WCtxXt
         MCsspyJv3jaFm3fuGWb48uTjB2imTEGxS/agtoLHWetTZBHncntV0yI63BwN/PCmNWpC
         gwKngEekFN6c7mFk8qNCS+0gViYcFHExZ64sqasg+KAcOhHgRo3VgXLBLqVY2A1H1sK5
         mNW+7pqIE/Zs6L37uXNjCmIzOaoPamWNr8VURphoZdN9zkP3igC0h3RP0Azo/3u2JRwg
         Ga/HQgdVDHwDnm8AE3qD1ybvuzArVEYrhqCLkSY8O2mIMfvS5CPQ5uFqqLX1bRWa5+o8
         an2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=LekPXUlQ5vIKEfI23cjz38WmvAJ2Bul2BlHQwZjlk/Q=;
        b=bhp0OgoGs2Bf52uRxKaYrKu8WVwfkKhT7+n8kf/ohDfmQuYyVkPpRoBuUhJDwmc8eq
         mvvws+Rf1DAzNla0Jzy7mMa8lu5p5BmQpQiNoCvCbMJtWZywHgaV1AQxX08BmHR+a2KS
         vpP7wuKf8hOh3SqmT3rOnSn+Pe6mjvxPxSRpWH31z0olEtzoicHhmC2XyAwSNAXE+S9l
         wc4b2E/oS+S9jh9ihVy83oF1rODJRkxy7uU7f/sE5kmMXGXuezqebDnowP1aFLLflPdh
         6vsu6RC9KguhkHQW+lLL72iOJaeZ0yduupF/i3sH1UxO+e611TR0vm1QOAa7uD0CgREj
         bXdg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o77-v6si4307237qko.296.2018.07.16.05.59.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 05:59:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51238 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff36X-00014t-QQ
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 08:59:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43265)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36M-00013q-UZ
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 08:59:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36I-0001vN-1p
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 08:59:42 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58798 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ff36H-0001uO-Rn; Mon, 16 Jul 2018 08:59:37 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 11EBF4000B74;
	Mon, 16 Jul 2018 12:59:37 +0000 (UTC)
Received: from thh440s.str.redhat.com (dhcp-200-180.str.redhat.com
	[10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3DD0F1C589;
	Mon, 16 Jul 2018 12:59:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 16 Jul 2018 14:59:17 +0200
Message-Id: <1531745974-17187-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 16 Jul 2018 12:59:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 16 Jul 2018 12:59:37 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 00/17] Fix crashes with introspection of ARM
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
X-TUID: opgGwgQCBMnh

As discovered recently, you can crash QEMU with a lot of devices
that do not get the reference counting of child objects right.
You just have to run 'device-list-properties' and call 'info qtree'
afterwards.
This patch series fixes these problems in the ARM code. When all
patches have been applied, I now do not get any more hangs or crashes
when I add a hmp("info qtree") to the device-introspect-test.

Please have a look at patch #1, #15 and #16, they still need reviews.

v3:
 - Reworked object_initialize_child according to Paolos suggestions
   (patch 1)
 - Added prototype description in the 2nd patch (as suggested by Eduardo)
 - Replaced the xlnx_dp "realize" patch with the one from Paolo
 - Added a patch for the "stm32f205_soc" device (surprisingly this was
   already the last one that caused trouble - I originally expected more)

v2:
 - Updated the first patch according to the review feedback from v1
 - Added more patches with additional fixes

Paolo Bonzini (1):
  hw/display/xlnx_dp: Move problematic code from instance_init to
    realize

Thomas Huth (16):
  qom/object: Add a new function object_initialize_child()
  hw/core/sysbus: Add a function for creating and attaching an object
  hw/arm/bcm2836: Fix crash with device_add bcm2837 on unsupported
    machines
  hw/arm/armv7: Fix crash when introspecting the "iotkit" device
  hw/cpu/a15mpcore: Fix introspection problem with the a15mpcore_priv
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
  hw/arm/stm32f205_soc: Fix introspection problem with 'stm32f205-soc'
    device
  hw/arm/xlnx-zynqmp: Fix crash when introspecting the "xlnx,zynqmp"
    device

 hw/arm/allwinner-a10.c   | 19 +++++-----
 hw/arm/armv7m.c          |  7 ++--
 hw/arm/bcm2836.c         | 18 +++------
 hw/arm/fsl-imx25.c       | 30 +++++++--------
 hw/arm/fsl-imx31.c       | 26 ++++++-------
 hw/arm/fsl-imx6.c        | 56 ++++++++++------------------
 hw/arm/fsl-imx7.c        | 97 ++++++++++++++++--------------------------------
 hw/arm/iotkit.c          | 74 ++++++++++++++++--------------------
 hw/arm/msf2-soc.c        | 15 ++++----
 hw/arm/stm32f205_soc.c   | 28 ++++++--------
 hw/arm/xlnx-zynqmp.c     | 61 ++++++++++++++----------------
 hw/core/sysbus.c         |  8 ++++
 hw/cpu/a15mpcore.c       |  8 ++--
 hw/cpu/a9mpcore.c        | 18 ++++-----
 hw/cpu/arm11mpcore.c     | 14 +++----
 hw/cpu/realview_mpcore.c |  8 ++--
 hw/display/xlnx_dp.c     |  8 +++-
 hw/intc/armv7m_nvic.c    |  5 +--
 hw/intc/realview_gic.c   |  7 +---
 hw/misc/auxbus.c         | 18 ++++++---
 include/hw/misc/auxbus.h | 14 ++++++-
 include/hw/sysbus.h      | 17 +++++++++
 include/qom/object.h     | 45 +++++++++++++++++++++-
 qom/object.c             | 54 +++++++++++++++++++++++++++
 24 files changed, 355 insertions(+), 300 deletions(-)

-- 
1.8.3.1

