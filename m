Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp797287wrt;
        Tue, 11 Dec 2018 08:39:06 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UCxkEJT0qlMaVqTOPyUQ4sSAM72UWIEGLRf8FV7EXmjxtG5NLAGFnP5lIeKTWKIOPfCLvw
X-Received: by 2002:ac8:3986:: with SMTP id v6mr16289024qte.1.1544546346100;
        Tue, 11 Dec 2018 08:39:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544546346; cv=none;
        d=google.com; s=arc-20160816;
        b=UkF44Knu94btg/jMsOk8fnbj2vaPx0TszTkH7Ful/KSzCsgPGBPTbXtDppXJT2uJI6
         mY6CpU2RCPYBR4eOU7Kc2G6r/vuSnU2gzNcMsPcukVV+05KRXRhwY8irL/B9KwE7/gjx
         jT9GBZumkSEvGCV0Hk+g4ZcwhpiZ2YsKho6IOHXPlSU3/FRDZT3A3gBwvvhelbdGNdo6
         7tFOFtzJXMqGuICoaSsp4XvhpAqVWVpvNwIyw78/2zaNuHTO/7uV7NEya68Y8q3egvlZ
         Z9Te2bPvbA+mQgFBlaAdKF+UFzs3UJIvPF3ybx81bzC92gooV4OxTTnf8asos77FGuYX
         MD6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=1igMySwFqdKo0lnf2OTQw/XQ1w7dc1r/EcYzxn4GlJk=;
        b=zpdatC9EAzFMs4k7lbSpibC8YhpSCgc0Jg8dvIyi+FxLrgGe0yF2dQxZl+bTl5GBYF
         41AnLsuYLGIXbe6fnEuLSpX9Rwyl3hO7NEuRsa0gyp3CFE/JZEBlOhXaKQtj2KkU5IBN
         aZuPk5h+sG0ePxx54kkqSe/Vz7cmee9Xe7NVY6xskDv3ZInWUO4CdMOVuL6u3L19nwJ8
         ufVMNPxQkxYognkGgg7p94JmgrJpjW5LRnnR+Tp3Mz+WXOBgGRqctTj+oKm/k6R6z13h
         E6kDWjJcyuGFh95PgODC7g/V+wQM8tUSoliPBx5JHOZt2G+ZxYDbpx0QucIsOdkgFq4W
         CFyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w2si126723qta.292.2018.12.11.08.39.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Dec 2018 08:39:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39979 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWl3p-00061q-Ic
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 11:39:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gWkzY-0002hm-GW
	for qemu-devel@nongnu.org; Tue, 11 Dec 2018 11:34:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gWkzW-0006WQ-Do
	for qemu-devel@nongnu.org; Tue, 11 Dec 2018 11:34:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:15851)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gWkzO-0006RJ-Jp; Tue, 11 Dec 2018 11:34:32 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A62B430832E8;
	Tue, 11 Dec 2018 16:34:27 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-183.brq.redhat.com [10.40.204.183])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80EE75D964;
	Tue, 11 Dec 2018 16:34:08 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Date: Tue, 11 Dec 2018 17:34:02 +0100
Message-Id: <20181211163406.3322-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 11 Dec 2018 16:34:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 0/4] Introduce the hw/firmware/ namespace
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	Laszlo Ersek <lersek@redhat.com>, Corey Minyard <minyard@acm.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RXwADom97iau

Hi,

QEMU interacts with various firmwares. We already have some helpers
for some firmwares. Later we will add UEFI helpers.
This series introduce the hw/firmware namespace for this.

There is no need to move hw/smbios sources into a specific directory,
we only focus on the headers.

Since v1 https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg01585.h=
tml:
- Addressed Laszlo's comments
- Added R-b (Michael, Corey, Laszlo)

Philippe Mathieu-Daud=C3=A9 (4):
  tests: Remove unused include
  hw/smbios: Restrict access to "hw/smbios/ipmi.h"
  hw/smbios: Remove "smbios_ipmi.h"
  hw/smbios: Move to the hw/firmware/ subdirectory

 MAINTAINERS                              |  2 +-
 hw/arm/virt.c                            |  2 +-
 hw/i386/pc.c                             |  2 +-
 hw/i386/pc_piix.c                        |  2 +-
 hw/i386/pc_q35.c                         |  2 +-
 hw/smbios/smbios-stub.c                  |  2 +-
 hw/smbios/smbios.c                       |  3 +--
 hw/smbios/smbios_build.h                 |  4 ++++
 hw/smbios/smbios_type_38-stub.c          |  2 +-
 hw/smbios/smbios_type_38.c               |  3 +--
 include/hw/{smbios =3D> firmware}/smbios.h |  0
 include/hw/smbios/ipmi.h                 | 15 ---------------
 tests/acpi-utils.c                       |  1 -
 tests/bios-tables-test.c                 |  2 +-
 vl.c                                     |  2 +-
 15 files changed, 15 insertions(+), 29 deletions(-)
 rename include/hw/{smbios =3D> firmware}/smbios.h (100%)
 delete mode 100644 include/hw/smbios/ipmi.h

--=20
2.17.2

