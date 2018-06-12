Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5152385wrq;
        Tue, 12 Jun 2018 03:45:00 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKtIevKoix+kiMRJ9AjgxnAMHN2vhylQNKaljQPhMG8a65zUMpF6jFCj3nXjIPfYhF7Yw3s
X-Received: by 2002:a37:1193:: with SMTP id 19-v6mr2739260qkr.379.1528800300314;
        Tue, 12 Jun 2018 03:45:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528800300; cv=none;
        d=google.com; s=arc-20160816;
        b=uKbEHcfFjZb2PHQ3M/mvdN14tZOBqBZ44AxQN4+lMFSyupdVwhDs1UFybewxqQ+yka
         wDWY/uvqw4GK8MVeHnYRZ1bGGOJZuzT31Tt/zgx97p59X4G6vD7ghkxkuVv2xiRdNPQE
         KofjlmaUTD/onDMrjTdofcwtp9BSYQeHCZtslm33J5Uml68PW77TER3wbCcxuZOBOsHy
         J464bqYCz3mJ0TkGrMEfxdtkJ6Dfo8WMFNwjnhpX2XdVWUUqDhacNSgHnRDZPnI0N8/T
         Ag1yqzwZrGqffoz9WgJWzwU+5oLcCwZwFYqF+QPjqL35cXPSMK20hIhEukbLQbugnTsW
         bLoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=bhqOtyKf0ntvEk9KhGYNgte34eNE9lMC9P53eQY+lYI=;
        b=PPnLVg5VrmE06alWGylZQB0fWOSaYxRJ2dhgh9Lm4UPjOJcYpq9l5uBpDx7YmJuyb6
         iKr4bCicts5TzSWJluAvEHvjrmHD1fmfUqi2vFKymWZSZiQ2ReuMm5aHtdViICDX+kF1
         Dw1rzsQmxGrB9QDq/P0aK+8OAfILk2twEtraJP+6PeB17/SxHz7cTYOM+qVFc5PVXpQF
         +gJcTWZkEwUu6ojQMmj+mUhvQWJPzO1B1z7iin3r0okfBcKHN6UjN3O0U8+xPzs5g2XP
         TJZvXoexPNuqMAqresMQyn5M9mY1t3/Q500U89xUSMR/USYPP0Jjqd2bWAscmCyZvMMT
         5YrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o26-v6si612818qko.344.2018.06.12.03.45.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jun 2018 03:45:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54375 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSgnL-0002of-OG
	for alex.bennee@linaro.org; Tue, 12 Jun 2018 06:44:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fSgmy-0002ne-7s
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 06:44:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fSgmv-0007rS-51
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 06:44:36 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49278 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fSgmu-0007qw-WC; Tue, 12 Jun 2018 06:44:33 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EBFCE77884;
	Tue, 12 Jun 2018 10:44:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-109.ams2.redhat.com
	[10.36.116.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 18CDE2024CA1;
	Tue, 12 Jun 2018 10:44:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 7210424EF00; Tue, 12 Jun 2018 12:44:30 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Jun 2018 12:44:22 +0200
Message-Id: <20180612104430.25745-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 12 Jun 2018 10:44:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 12 Jun 2018 10:44:32 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PULL 0/8] Usb 20180612 patches
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
Cc: Corey Minyard <minyard@acm.org>, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
	Zhang Chen <zhangckid@gmail.com>, qemu-arm@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h6TMuU5vr6RH

The following changes since commit 2afc4e3df80d947dd1bd42ce80278f591b35c7=
4a:

  Merge remote-tracking branch 'remotes/maxreitz/tags/pull-block-2018-06-=
11' into staging (2018-06-11 15:31:20 +0100)

are available in the git repository at:

  git://git.kraxel.org/qemu tags/usb-20180612-pull-request

for you to fetch changes up to 3c969a6022438cf59de10d2dc3c58f4807788f98:

  usb-mtp: Return error on suspicious TYPE_DATA packet from initiator (20=
18-06-12 12:08:12 +0200)

----------------------------------------------------------------
usb: bug fix collection, doc update.

----------------------------------------------------------------

Bandan Das (1):
  usb-mtp: Return error on suspicious TYPE_DATA packet from initiator

Gerd Hoffmann (1):
  usb: update docs

Marc-Andr=C3=A9 Lureau (4):
  bus: do not unref the added child bus on realize
  object: fix OBJ_PROP_LINK_UNREF_ON_RELEASE ambivalence
  usb-ccid: fix bus leak
  usb-hcd-xhci-test: add a test for ccid hotplug

Philippe Mathieu-Daud=C3=A9 (2):
  usb: correctly handle Zero Length Packets
  usb/dev-mtp: Fix use of uninitialized values

 docs/usb2.txt                 | 99 ++++++++++++++++++++++++-------------=
------
 include/qom/object.h          | 12 ++++--
 hw/core/bus.c                 |  1 -
 hw/core/qdev-properties.c     |  2 +-
 hw/core/qdev.c                |  2 +-
 hw/display/xlnx_dp.c          |  2 +-
 hw/dma/xilinx_axidma.c        |  4 +-
 hw/dma/xlnx-zdma.c            |  2 +-
 hw/i386/pc.c                  |  2 +-
 hw/i386/pc_piix.c             |  2 +-
 hw/i386/pc_q35.c              |  2 +-
 hw/ipmi/ipmi.c                |  2 +-
 hw/net/xilinx_axienet.c       |  4 +-
 hw/ssi/xilinx_spips.c         |  2 +-
 hw/usb/dev-mtp.c              | 11 ++++-
 hw/usb/dev-smartcard-reader.c |  1 +
 hw/usb/redirect.c             |  2 +-
 net/can/can_host.c            |  2 +-
 net/colo-compare.c            |  2 +-
 qom/object.c                  |  8 ++--
 target/arm/cpu.c              |  4 +-
 tests/usb-hcd-xhci-test.c     | 10 +++++
 ui/console.c                  |  2 +-
 23 files changed, 109 insertions(+), 71 deletions(-)

--=20
2.9.3

