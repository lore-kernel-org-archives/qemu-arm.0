Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3721013wrq;
        Mon, 18 Jun 2018 02:58:43 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK2E6r9urusn8Ox/wWPs9XuBQVQsSZbsrcRCMsKz+yKbHZ5pVTy1K+AX3UZun+RouQiV3oH
X-Received: by 2002:a0c:e610:: with SMTP id z16-v6mr9926057qvm.246.1529315923582;
        Mon, 18 Jun 2018 02:58:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529315923; cv=none;
        d=google.com; s=arc-20160816;
        b=TUaT9HQT8dms+jtVOHn0VXg+HpGnAyZk/93xM6PoXBy6tCe7w96xDmID3cmKPCM2LG
         ZfQj5H9peMXkOjhauTrJoUXC5kccyt2kGrgm8MU/lhbz5XTjZTHKcCb0IjURudiv1A37
         5/uigMTjzpY5h492blOPlZx7CzwQMar7/pcEz7X72aJVsaVLQac83ZO86ozfGdRwmp9D
         L74upNn+YfMn2ZMZ9sJ5nRKGN7A4BiISZrhnEFCagH+ia1vRC3S0CYFyXI3R1TA/TB1P
         MHd8rkmHzxn70KNj+PRm/R7c7dThha08ZRmAGWsoLp3Wq+lq/0GQluQ6j5THocVwC5ma
         Ab9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=dlJup3t4o/EPyi5xVRrFlsZWgi8q0TxYAT12KqVt4zM=;
        b=TqkKgs/wVQz36iQRAL2wB633jlHL/FhtciZQJQFsW7ar07iScfjn3svN4pIVaL8fsw
         XmVELwTLfJr7H5VkDG/F6kkohZQtBQetdqGcmq6BKBjy5UwJOnAWiRjU169HHQCtZXix
         LkyBIoY01/Nk55OpezIv1jZX8m8sJ22YTJjgbIeJDhDOlAG8hIZndTzicRdYw6eIoxr1
         UP8uG5WeaKC1LRdL6fayEzYV0UbGvGhoDRzDgv1CNbrE+rU+gOZx+10hU/+hznatFR8/
         8kAJw0x0qn2pHwAyMHXaez6hd56+ebQjnUcCmd2wRvVtnlF/R967F39o29Avx9YeFk0M
         q16w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s11-v6si2639899qvb.73.2018.06.18.02.58.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Jun 2018 02:58:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33737 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fUqvr-0001bZ-2x
	for alex.bennee@linaro.org; Mon, 18 Jun 2018 05:58:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fUqvD-0001Ij-Sl
	for qemu-arm@nongnu.org; Mon, 18 Jun 2018 05:58:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fUqvA-0003IO-UA
	for qemu-arm@nongnu.org; Mon, 18 Jun 2018 05:58:03 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59272 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fUqvA-0003Hv-Pi; Mon, 18 Jun 2018 05:58:00 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 451547DAC5;
	Mon, 18 Jun 2018 09:58:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-109.ams2.redhat.com
	[10.36.116.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 39AFE2156A20;
	Mon, 18 Jun 2018 09:57:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 6229596A42; Mon, 18 Jun 2018 11:57:58 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 18 Jun 2018 11:57:54 +0200
Message-Id: <20180618095758.5006-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 18 Jun 2018 09:58:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 18 Jun 2018 09:58:00 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PULL 0/4] Vga 20180618 patches
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
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3PQ6/mCM7QF5

The following changes since commit 2ef2f16781af9dee6ba6517755e9073ba5799f=
a2:

  Merge remote-tracking branch 'remotes/dgilbert/tags/pull-migration-2018=
0615a' into staging (2018-06-15 18:13:35 +0100)

are available in the git repository at:

  git://git.kraxel.org/qemu tags/vga-20180618-pull-request

for you to fetch changes up to 58d632c7ce66c272868b057491cec7ee5a6a1050:

  Add ramfb MAINTAINERS entry (2018-06-18 11:24:25 +0200)

----------------------------------------------------------------
vga: add ramfb, print virglrenderer version

----------------------------------------------------------------

Gerd Hoffmann (3):
  hw/display: add ramfb, a simple boot framebuffer living in guest ram
  hw/display: add standalone ramfb device
  Add ramfb MAINTAINERS entry

Marc-Andr=C3=A9 Lureau (1):
  configure: print virglrenderer version

 configure                     |  3 +-
 include/hw/display/ramfb.h    | 12 ++++++
 hw/arm/sysbus-fdt.c           |  7 ++++
 hw/arm/virt.c                 |  2 +
 hw/display/ramfb-standalone.c | 62 ++++++++++++++++++++++++++++
 hw/display/ramfb.c            | 95 +++++++++++++++++++++++++++++++++++++=
++++++
 hw/i386/pc_piix.c             |  2 +
 hw/i386/pc_q35.c              |  2 +
 MAINTAINERS                   |  6 +++
 hw/display/Makefile.objs      |  3 ++
 10 files changed, 193 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/display/ramfb.h
 create mode 100644 hw/display/ramfb-standalone.c
 create mode 100644 hw/display/ramfb.c

--=20
2.9.3

