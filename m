Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp625320wrq;
        Wed, 13 Jun 2018 05:30:09 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKV3nZzCMFD0ndo4T25WR/A6kLWCZpI72BWuS1ZK6me0XV26IcZvHScGV6/kMuTDs9nZf/x
X-Received: by 2002:ac8:31d9:: with SMTP id i25-v6mr4064669qte.247.1528893009173;
        Wed, 13 Jun 2018 05:30:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528893009; cv=none;
        d=google.com; s=arc-20160816;
        b=pLlO40UKNf81hTxX0WEomuz4au/cJ/AoF4VhMOenBK1+Zz8MwIwqBax0ikSqyANeWZ
         LCHl1vi1I2AL3FaK0/VYLqelRPbI97NSk/mBeY0qxjsGaSgRN33u8Cw/bUynkbKvDk1F
         l5AU9KWuqadOIPx3GP5unmWKUFstLzY+HnXRKIM9m1h4cvVjNRSIjdumYMgW2hkAPhAI
         dfLJgGMpf2ZseHIaoqNAYbjFJC+QCxROVTSdWgRo5Tm1CjOxJH99n789zgkuicrRpwh4
         ojhrR2rFUt78UhM6hgBzFzMBdU90nI3JRhWrbGvBNGbAyXOWjgao0TPRk78DKCakIjbr
         ho1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=QhvoJeclAPLtXwaljbJvEAR0OIfk5Oc270HrnhEx2Xw=;
        b=LQs6yXdhpBWrsvNYX+K5q/0qaB8kWGSiCRYd+Exs78NWEkTPCKPAkjK066mnMDJCfY
         MlUas0A208G0BH8B47+ki+fJ/IUcdCo8sd+N6Zgi+wuW3twfPSoVt5KrGHfu2wOs4xmZ
         dsasBb67JYkoh5yI7hpP9mTqr/30OanGPE+GFxRobo9UUhoX0V3+A3Ukg4VBAaBO0Mrv
         5tpB8mxdYnVmV+/81HSaN2mH4IvnKrDpjVvq2Q8MTRYhd71JUiKW+s/mlaAue5EUPTG/
         IhaeC62j1Qtwbw823AaqxaaeqE4V2ufi1JqHi77r/S9bpF+yQpjLoURnueA/MaRgXEkf
         B7Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 14-v6si2389089qkf.324.2018.06.13.05.30.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jun 2018 05:30:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33800 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fT4ue-0002sm-Kd
	for alex.bennee@linaro.org; Wed, 13 Jun 2018 08:30:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43259)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fT4uS-0002rB-6I
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 08:29:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fT4uO-0005qq-Vo
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 08:29:56 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53084 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fT4uO-0005oG-Rg; Wed, 13 Jun 2018 08:29:52 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9E6C98185331;
	Wed, 13 Jun 2018 12:29:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-109.ams2.redhat.com
	[10.36.116.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 226CE2024CA6;
	Wed, 13 Jun 2018 12:29:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id E9A6724EF16; Wed, 13 Jun 2018 14:29:48 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 13 Jun 2018 14:29:44 +0200
Message-Id: <20180613122948.18149-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 13 Jun 2018 12:29:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 13 Jun 2018 12:29:51 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v5 0/4] ramfb: simple boot framebuffer
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?L=C3=A1szl=C3=B3=20=C3=89rsek?= <lersek@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nNlfnBbrh2K4

  Hi,

So, the first ramfb bits should be ready for merge.  This series
includes the ramfb core support bits, the ramfb standalone device
and vfio-pci-ramfb device for vgpu boot display support.

If you want play with it I recommend getting the bits from

	https://www.kraxel.org/cgit/qemu/log/?h=sirius/ramfb

because they come with an updated seabios and a new vgabios rom and an
experimental OVMF build.  Firmware patches are here:

	https://www.kraxe.org/cgit/seabios/log/?h=ramfb
	https://github.com/kraxel/edk2/commits/ramfb

They should land upstream soon.

changes:
 v5: codestyle fixes.

cheers,
  Gerd

Gerd Hoffmann (4):
  hw/display: add ramfb, a simple boot framebuffer living in guest ram
  hw/display: add standalone ramfb device
  hw/vfio/display: add ramfb support
  Add ramfb MAINTAINERS entry

 include/hw/display/ramfb.h    | 12 ++++++
 include/hw/vfio/vfio-common.h |  2 +
 hw/arm/sysbus-fdt.c           |  7 ++++
 hw/arm/virt.c                 |  2 +
 hw/display/ramfb-standalone.c | 62 ++++++++++++++++++++++++++++
 hw/display/ramfb.c            | 95 +++++++++++++++++++++++++++++++++++++++++++
 hw/i386/pc_piix.c             |  2 +
 hw/i386/pc_q35.c              |  2 +
 hw/vfio/display.c             | 12 ++++++
 hw/vfio/pci.c                 | 15 +++++++
 MAINTAINERS                   |  6 +++
 hw/display/Makefile.objs      |  3 ++
 12 files changed, 220 insertions(+)
 create mode 100644 include/hw/display/ramfb.h
 create mode 100644 hw/display/ramfb-standalone.c
 create mode 100644 hw/display/ramfb.c

-- 
2.9.3

