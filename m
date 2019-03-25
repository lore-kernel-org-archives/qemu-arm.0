Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4051489wrx;
        Mon, 25 Mar 2019 09:26:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxvsyL/Md3Aq3VhfVKP/6YQvJeCiSQWb1pSuY2DWGS0DF9/nyOLTwllM6kGGunfvY1d0074
X-Received: by 2002:a25:3244:: with SMTP id y65mr20818259yby.491.1553531161748;
        Mon, 25 Mar 2019 09:26:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553531161; cv=none;
        d=google.com; s=arc-20160816;
        b=i8l6t26GHHcfNx/dhES2rCyU3B/Q2H0gRN+OUXbyW9jh2K/whTiv7s20jbq5hp7RAQ
         I/lgZv+fT1An2PEwTmzsoDVU/ey3LGGpms+2my+xrdm8l9fjERSgjWG6bEFOgRNRldJ7
         AUXgXso0ek66saCZQg1FN4aLX3/m9V2NzbtcjYeFgSMsuDV3Si9uDXaXsQBxouujaKIC
         Kk9gapimSKUysdQqtZL0Ow0IhnegCzBASOuluLgqqQRuTy5wISWaLWsWmtMOgke9yOLs
         zqZmQav42sfCFm260hXO98o2s9cUDJ81+d6Vr5YLj3GMllZ25UU0hFORyabVYpuKVUN1
         kD2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=o2MONRpqd8RX6Zf6MgRZtK9jOevZgJMfqFLdR4BUscM=;
        b=UTRcGJIPom4Z+adWobOitH/QuYrZTlgeWJ2j4DIn/K38fSziqSWY6HDzTX3aGdTBga
         yzPB8NKvd98aVOgh4fbZ+7rBQtghrg2ULW0FZoAJWga9ENLm3NyyWXIkTYpdkH2Q72rN
         eEjsuqFa/4a2og+3LPnx16DAa1R7pPyHvFc25zix/BRPxthLFSBGj/1paBoP0elXRQME
         DdFvAenAADx3GBUfUdDgjHDd2Jny8W4VjULm56Fp2pVetvCGyS2pURr0zFa6Qcz2DBdh
         f99XJx0iHSVbvBmPrVDl9dvvtaTfyKT6YxEjGSlnbhtt9SImccRG/ONOseIR3cNd4EI2
         40WA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b12si3506789ywb.375.2019.03.25.09.26.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 09:26:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45129 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8SQD-0004oP-4m
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 12:26:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1h8SGy-00046Q-4s
	for qemu-devel@nongnu.org; Mon, 25 Mar 2019 12:16:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1h8S0Y-000503-Ds
	for qemu-devel@nongnu.org; Mon, 25 Mar 2019 11:59:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35378)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1h8S0V-0004y7-Gz; Mon, 25 Mar 2019 11:59:27 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 13F905AFF4;
	Mon, 25 Mar 2019 15:59:25 +0000 (UTC)
Received: from localhost (ovpn-116-57.ams2.redhat.com [10.36.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D6D95F9CD;
	Mon, 25 Mar 2019 15:58:58 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 25 Mar 2019 15:58:50 +0000
Message-Id: <20190325155857.10661-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 25 Mar 2019 15:59:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/7] Tracing patches
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
	Juan Quintela <quintela@redhat.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Yuval Shaia <yuval.shaia@oracle.com>, Greg Kurz <groug@kaod.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Paul Durrant <paul.durrant@citrix.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
	Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KYzQghL+Ijze

The following changes since commit d97a39d903fe33c45be83ac6943a2f82a3649a=
11:

  Merge remote-tracking branch 'remotes/ehabkost/tags/x86-next-pull-reque=
st' into staging (2019-03-22 09:37:38 +0000)

are available in the Git repository at:

  git://github.com/stefanha/qemu.git tags/tracing-pull-request

for you to fetch changes up to dec9776049e32d6c830127b286530c5f53267eff:

  trace-events: Fix attribution of trace points to source (2019-03-22 16:=
18:07 +0000)

----------------------------------------------------------------
Pull request

Compilation fixes and cleanups for QEMU 4.0.0.

----------------------------------------------------------------

Markus Armbruster (5):
  trace-events: Consistently point to docs/devel/tracing.txt
  trace-events: Shorten file names in comments
  scripts/cleanup-trace-events: Update for current practice
  trace-events: Delete unused trace points
  trace-events: Fix attribution of trace points to source

Stefan Hajnoczi (2):
  trace: handle tracefs path truncation
  trace: avoid SystemTap dtrace(1) warnings on empty files

 trace/ftrace.c                  | 12 +++++-
 accel/kvm/trace-events          |  2 +-
 accel/tcg/trace-events          |  2 +-
 audio/trace-events              |  6 +--
 authz/trace-events              | 10 ++---
 block/trace-events              | 49 +++++++++++------------
 chardev/trace-events            |  4 +-
 crypto/trace-events             | 10 ++---
 hw/9pfs/trace-events            |  2 +-
 hw/acpi/trace-events            |  6 +--
 hw/alpha/trace-events           |  2 +-
 hw/arm/trace-events             | 17 +++-----
 hw/audio/trace-events           |  6 +--
 hw/block/dataplane/trace-events |  2 +-
 hw/block/trace-events           | 15 ++++---
 hw/char/trace-events            | 24 +++++------
 hw/display/trace-events         | 28 ++++++-------
 hw/dma/trace-events             |  6 +--
 hw/gpio/trace-events            |  2 +-
 hw/hppa/trace-events            |  2 +-
 hw/i2c/trace-events             |  2 +-
 hw/i386/trace-events            | 10 ++---
 hw/i386/xen/trace-events        |  6 ++-
 hw/ide/trace-events             | 23 +++++------
 hw/input/trace-events           | 16 ++++----
 hw/intc/trace-events            | 35 ++++++++---------
 hw/isa/trace-events             |  4 +-
 hw/mem/trace-events             |  4 +-
 hw/misc/macio/trace-events      |  9 ++---
 hw/misc/trace-events            | 40 +++++++++----------
 hw/net/trace-events             | 42 ++++++++++----------
 hw/nvram/trace-events           |  4 +-
 hw/pci-host/trace-events        |  6 +--
 hw/pci/trace-events             |  6 +--
 hw/ppc/trace-events             | 40 +++++++++----------
 hw/rdma/trace-events            |  6 +--
 hw/rdma/vmw/trace-events        |  8 ++--
 hw/s390x/trace-events           |  4 +-
 hw/scsi/trace-events            | 22 +++++------
 hw/sd/trace-events              | 13 +++---
 hw/sparc/trace-events           |  6 +--
 hw/sparc64/trace-events         |  6 +--
 hw/timer/trace-events           | 24 +++++------
 hw/tpm/trace-events             | 12 +++---
 hw/usb/trace-events             | 22 +++++------
 hw/vfio/trace-events            | 15 ++++---
 hw/virtio/trace-events          | 10 ++---
 hw/watchdog/trace-events        |  2 +-
 hw/xen/trace-events             |  6 +--
 io/trace-events                 | 12 +++---
 linux-user/trace-events         |  3 +-
 migration/trace-events          | 70 ++++++++++++++++++---------------
 nbd/trace-events                | 10 ++---
 net/trace-events                | 10 ++---
 qapi/trace-events               |  4 +-
 qom/trace-events                |  2 +-
 scripts/cleanup-trace-events.pl | 19 ++++++---
 scripts/tracetool/format/d.py   |  5 +++
 scsi/trace-events               |  4 +-
 target/arm/trace-events         |  4 +-
 target/hppa/trace-events        |  4 +-
 target/i386/trace-events        |  4 +-
 target/mips/trace-events        |  2 +-
 target/ppc/trace-events         |  2 +-
 target/s390x/trace-events       | 10 ++---
 target/sparc/trace-events       |  8 ++--
 trace-events                    | 13 +++++-
 ui/trace-events                 | 19 +++++----
 util/trace-events               | 28 ++++++-------
 69 files changed, 438 insertions(+), 405 deletions(-)

--=20
2.20.1

