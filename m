Received: by 10.25.208.137 with SMTP id h131csp2424404lfg;
        Wed, 18 May 2016 06:54:11 -0700 (PDT)
X-Received: by 10.55.20.13 with SMTP id e13mr7921940qkh.180.1463579650930;
        Wed, 18 May 2016 06:54:10 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z92si6830405qgd.107.2016.05.18.06.54.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 18 May 2016 06:54:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45180 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b31vO-0002I1-E8
	for alex.bennee@linaro.org; Wed, 18 May 2016 09:54:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1b31ua-0001pK-7T
	for qemu-devel@nongnu.org; Wed, 18 May 2016 09:53:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1b31uQ-0003dw-Ok
	for qemu-devel@nongnu.org; Wed, 18 May 2016 09:53:20 -0400
Received: from e06smtp13.uk.ibm.com ([195.75.94.109]:54296)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1b31uQ-0003cA-DP
	for qemu-devel@nongnu.org; Wed, 18 May 2016 09:53:10 -0400
Received: from localhost
	by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <gkurz@linux.vnet.ibm.com>;
	Wed, 18 May 2016 14:53:08 +0100
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
	by e06smtp13.uk.ibm.com (192.168.101.143) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 18 May 2016 14:53:03 +0100
X-IBM-Helo: d06dlp02.portsmouth.uk.ibm.com
X-IBM-MailFrom: gkurz@linux.vnet.ibm.com
X-IBM-RcptTo: qemu-arm@nongnu.org;qemu-devel@nongnu.org;qemu-ppc@nongnu.org
Received: from b06cxnps3075.portsmouth.uk.ibm.com
	(d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id BC30B219005E; 
	Wed, 18 May 2016 14:52:36 +0100 (BST)
Received: from d06av05.portsmouth.uk.ibm.com (d06av05.portsmouth.uk.ibm.com
	[9.149.37.229])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u4IDr1kM15466942; Wed, 18 May 2016 13:53:01 GMT
Received: from d06av05.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av05.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u4IDr1Rp016261; Wed, 18 May 2016 07:53:01 -0600
Received: from smtp.lab.toulouse-stg.fr.ibm.com
	(srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
	by d06av05.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u4IDr18r016247; Wed, 18 May 2016 07:53:01 -0600
Received: from bahia.huguette.org (sig-9-84-49-211.evts.de.ibm.com
	[9.84.49.211])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id D0E9C22007E;
	Wed, 18 May 2016 15:52:59 +0200 (CEST)
From: Greg Kurz <gkurz@linux.vnet.ibm.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 May 2016 15:52:59 +0200
Message-ID: <146357953667.8807.5432652213311565530.stgit@bahia.huguette.org>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16051813-0013-0000-0000-000013C63A09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.109
Subject: [Qemu-devel] [PATCH v2] sysemu: support up to 1024 vCPUs
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
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x4CPdnB5/S3f

Some PowerPC systems can already provide more than 255 hardware threads.
Igor also posted a patch recently, to increase the the maxcpus limit to
288 for x86 targets.

This patch bumps the limit to 1024:
- 1024 is already the limit for PowerPC KVM in several distros
- it has no visible overhead in top
- the limit itself has no effect on hot paths

We only do that for pseries at the moment and keep a 255 limit for the
ARM Virtual Machine.

Signed-off-by: Greg Kurz <gkurz@linux.vnet.ibm.com>
---
v2: - updated changelog
    - keep 255 limit in hw/arm/virt.c
---
 hw/arm/virt.c           |    2 +-
 include/sysemu/sysemu.h |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 56d35c7716e7..438e09c7a57d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1358,7 +1358,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
      * it later in machvirt_init, where we have more information about the
      * configuration of the particular instance.
      */
-    mc->max_cpus = MAX_CPUMASK_BITS;
+    mc->max_cpus = 255;
     mc->has_dynamic_sysbus = true;
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 38fb3cad35e1..89d742caa477 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -185,7 +185,7 @@ extern int mem_prealloc;
  *
  * Note that cpu->get_arch_id() may be larger than MAX_CPUMASK_BITS.
  */
-#define MAX_CPUMASK_BITS 255
+#define MAX_CPUMASK_BITS 1024
 
 #define MAX_OPTION_ROMS 16
 typedef struct QEMUOptionRom {

