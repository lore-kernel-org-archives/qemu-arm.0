Received: by 10.25.77.65 with SMTP id a62csp1835200lfb;
        Wed, 15 Feb 2017 02:06:21 -0800 (PST)
X-Received: by 10.55.189.134 with SMTP id n128mr20476509qkf.192.1487153181632;
        Wed, 15 Feb 2017 02:06:21 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t20si2459965qkt.325.2017.02.15.02.06.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Feb 2017 02:06:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39330 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cdwTa-0006pX-Qo
	for alex.bennee@linaro.org; Wed, 15 Feb 2017 05:06:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cdwTE-0006ZV-KF
	for qemu-arm@nongnu.org; Wed, 15 Feb 2017 05:05:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cdwTB-0001gC-46
	for qemu-arm@nongnu.org; Wed, 15 Feb 2017 05:05:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37372)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cdwTA-0001eM-Np; Wed, 15 Feb 2017 05:05:53 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 17FE280481;
	Wed, 15 Feb 2017 10:05:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-50.ams2.redhat.com
	[10.36.116.50])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E6F17FE4F;
	Wed, 15 Feb 2017 10:05:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id DB5ED11384AF; Wed, 15 Feb 2017 11:05:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 15 Feb 2017 11:05:42 +0100
Message-Id: <1487153147-11530-4-git-send-email-armbru@redhat.com>
In-Reply-To: <1487153147-11530-1-git-send-email-armbru@redhat.com>
References: <1487153147-11530-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 15 Feb 2017 10:05:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 3/8] hw: Default -drive to if=none instead of
 ide when ide cannot work
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
	Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jia Liu <proljc@gmail.com>, qemu-block@nongnu.org,
	Magnus Damm <magnus.damm@gmail.com>, Alexander Graf <agraf@suse.de>,
	Anthony Perard <anthony.perard@citrix.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
	kwolf@redhat.com, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Laurent Vivier <laurent@vivier.eu>, mreitz@redhat.com,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	xen-devel@lists.xensource.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xyfPRTP6cLTm

Block backends defined with -drive if=ide are meant to be picked up by
machine initialization code: a suitable frontend gets created and
wired up automatically.

if=ide drives not picked up that way can still be used with -device as
if they had if=none, but that's unclean and best avoided.  Unused ones
produce an "Orphaned drive without device" warning.

-drive parameter "if" is optional, and the default depends on the
machine type.  If a machine type doesn't specify a default, the
default is "ide".

Many machine types implicitly default to if=ide that way, even though
they don't actually have an IDE controller.  This makes no sense.

Change the implicit default to if=none.  Affected machines:

* all targets: none
* aarch64/arm: akita ast2500 canon cheetah collie connex imx25
  integratorcp kzm lm3s6965evb lm3s811evb mainstone musicpal n800 n810
  netduino2 nuri palmetto realview romulus sabrelite smdkc210 sx1 sx1
  verdex z2
* cris: axis-dev88
* i386/x86_64: xenpv
* lm32: lm32-evr lm32-uclinux milkymist
* m68k: an5206 dummy mcf5208evb
* microblaze/microblazeel: petalogix-ml605 petalogix-s3adsp1800
* mips/mips64/mips64el/mipsel: mipssim
* moxie: moxiesim
* or32: or32-sim
* ppc/ppc64/ppcemb: bamboo ref405ep taihu virtex-ml507
* ppc/ppc64: mpc8544ds ppce500
* sh4/sh4eb: shix
* sparc: leon3_generic
* sparc64: niagara
* tricore: tricore_testboard
* unicore32: puv3
* xtensa/xtensaeb: kc705 lx200 lx60 ml605 sim

None of these machines have an IDE controller, let alone code to
honor if=ide.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: xen-devel@lists.xensource.com
Cc: Michael Walle <michael@walle.cc>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Anthony Green <green@moxielogic.com>
Cc: Jia Liu <proljc@gmail.com>
Cc: Alexander Graf <agraf@suse.de>
Cc: qemu-ppc@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Fabien Chouteau <chouteau@adacore.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Artyom Tarasenko <atar4qemu@gmail.com>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Acked-By: Artyom Tarasenko <atar4qemu@gmail.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 include/sysemu/blockdev.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
index 16432f3..351a039 100644
--- a/include/sysemu/blockdev.h
+++ b/include/sysemu/blockdev.h
@@ -19,12 +19,11 @@ void blockdev_auto_del(BlockBackend *blk);
 typedef enum {
     IF_DEFAULT = -1,            /* for use with drive_add() only */
     /*
-     * IF_IDE must be zero, because we want MachineClass member
-     * block_default_type to default-initialize to IF_IDE
+     * IF_NONE must be zero, because we want MachineClass member
+     * block_default_type to default-initialize to IF_NONE
      */
-    IF_IDE = 0,
-    IF_NONE,
-    IF_SCSI, IF_FLOPPY, IF_PFLASH, IF_MTD, IF_SD, IF_VIRTIO, IF_XEN,
+    IF_NONE = 0,
+    IF_IDE, IF_SCSI, IF_FLOPPY, IF_PFLASH, IF_MTD, IF_SD, IF_VIRTIO, IF_XEN,
     IF_COUNT
 } BlockInterfaceType;
 
-- 
2.7.4

