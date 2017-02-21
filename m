Received: by 10.103.98.197 with SMTP id w188csp377480vsb;
        Tue, 21 Feb 2017 05:08:32 -0800 (PST)
X-Received: by 10.200.35.6 with SMTP id a6mr23753029qta.210.1487682512015;
        Tue, 21 Feb 2017 05:08:32 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t6si15075969qtd.8.2017.02.21.05.08.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 05:08:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44428 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgABD-0004cx-Em
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 08:08:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cg9ef-0007k7-6m
	for qemu-devel@nongnu.org; Tue, 21 Feb 2017 07:34:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cg9ed-00086E-9K
	for qemu-devel@nongnu.org; Tue, 21 Feb 2017 07:34:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39080)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cg9eY-00084j-Iz; Tue, 21 Feb 2017 07:34:46 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 941993A7695;
	Tue, 21 Feb 2017 12:34:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-55.ams2.redhat.com
	[10.36.116.55])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1LCYfjj011814
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 21 Feb 2017 07:34:42 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D418F1138650; Tue, 21 Feb 2017 13:34:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 21 Feb 2017 13:34:31 +0100
Message-Id: <1487680479-15132-4-git-send-email-armbru@redhat.com>
In-Reply-To: <1487680479-15132-1-git-send-email-armbru@redhat.com>
References: <1487680479-15132-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 21 Feb 2017 12:34:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 03/11] hw: Default -drive to if=none instead of
 ide when ide cannot work
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Jia Liu <proljc@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Anthony Green <green@moxielogic.com>, Laurent Vivier <laurent@vivier.eu>,
	Fabien Chouteau <chouteau@adacore.com>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, xen-devel@lists.xensource.com,
	Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Cy38bF4aMNTO

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
Message-Id: <1487153147-11530-4-git-send-email-armbru@redhat.com>
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

