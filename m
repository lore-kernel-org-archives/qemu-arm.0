Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3734361wrt;
        Mon, 1 Oct 2018 05:02:09 -0700 (PDT)
X-Google-Smtp-Source: ACcGV623A33PeYtxugvn6h2GT4zKdTx7HV//rjwo0S81bXNqWZqA3bHDvCKCjyOPcbjMK0JRfmPE
X-Received: by 2002:aed:2601:: with SMTP id z1-v6mr8089661qtc.123.1538395329484;
        Mon, 01 Oct 2018 05:02:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538395329; cv=none;
        d=google.com; s=arc-20160816;
        b=SND+yYkdp6tCoqo0vN6omMy8R1ktjtHd0Xka7yXidybSlxP0h/gS2ryvjVNmwAziS0
         3DoxIaCgte1STlyhm2kCJw9jvWsPrOL0J/3fE9YkYlLObEDW69wHgVc0R0I/aAZxHgit
         GOOjtVjpFWKDtDNmCchITfTnQ7e9g6SupqTp2svBKAwAedZGOfBYIbg0wog6/+7JkFeh
         oHM0hBoa3rkR+DQeBgS2i+uG/b4a0yAQNGd7TyQx3Zs7ETWGXNrix/fgMZQLymibL3Ru
         zahS8vXobNJ4CEGVgI1CqOpn6Dgnqj7B/QfREEltUXBSEIwKARp50UX3S6fTS1tPB9Mw
         WbJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=RMrMVjVJnFeAJgaPqqBmDtY+BN7mDZ5iB6euCrdQGyM=;
        b=dZ19019We/NTVWw0upgLD9pSg12SH2bcM5Lag34DCkeNgz5d0VjJY1RJjSV9uUv6Ot
         FlJE5xN0RLg1LT5jakh8z7BurTCEZRtgzfT4eAVW3qvuxeItcjNPOkka8LmJfpcRmNnT
         7sFt2s2E54FIlkF/ZUseVqHgseJoi4ykIfmIFDjgDnIoknFZM6vIMcpE81H0pYXuE/LG
         S9j0ZdpZTnFv1vniEalz8/9rJHv2YNp/oUcXQlBhutFDoApYMQIsI+88Yvi9oxrij9wp
         pQAuS0hquc4ksI6O8nDuJiZ5qztUEY1DX2KN4nP5A79DpKpa94fxuFXx4KglLcaBgblC
         pqpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=f5iH1x1K;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=PPeLhYLy;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=PPeLhYLy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d3-v6si1214258qvs.263.2018.10.01.05.02.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Oct 2018 05:02:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=f5iH1x1K;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=PPeLhYLy;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=PPeLhYLy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37825 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g6wts-0005y2-VC
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 08:02:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpn-0002kT-I6
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 07:57:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpm-00061i-Kx
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 07:57:55 -0400
Received: from greensocs.com ([193.104.36.180]:40120)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1g6wph-0005ga-8D; Mon, 01 Oct 2018 07:57:49 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 66BDB511C69;
	Mon,  1 Oct 2018 13:57:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395036;
	bh=SEwONAKUPLnQvPdqyDN0j2bLhYtpzo2X4JReEAVA59g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=f5iH1x1K+f/EFFA9FEUGPqRTGZoGuyPvxP3tcz9Ruawi20K5xWzAYviqMXhVmNKG0
	1TpU4paB3GnvIO8Cd0ns8OjSH9FEXCmumwDfnwo8hwmGbLvf5r8sxIRcMoyZU629B3
	H10uydDoMbAcdg4VDxQWmGRXl8tSmHVY90QHkcxg=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=PPeLhYLy;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=PPeLhYLy
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yPJ7BXt9M8FJ; Mon,  1 Oct 2018 13:57:15 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id A488C511C65; Mon,  1 Oct 2018 13:57:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395033;
	bh=SEwONAKUPLnQvPdqyDN0j2bLhYtpzo2X4JReEAVA59g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PPeLhYLyxkjHLgys7VvFdUj1hRUmhndO68jRRh5o2JAxSgD2ybAOt4Epjwc4r6L5f
	9XBERQTP4KY7I99Puxt7gO5da+lSk5SHBtWZ9jbhbJXpsWVXDSV9Vn/tOzUTe1WluM
	Ej+PlyEfTK0Qg8aYiqugcD74X5HIPgqjdUBiH04g=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 2A6C3511C6E;
	Mon,  1 Oct 2018 13:57:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395033;
	bh=SEwONAKUPLnQvPdqyDN0j2bLhYtpzo2X4JReEAVA59g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PPeLhYLyxkjHLgys7VvFdUj1hRUmhndO68jRRh5o2JAxSgD2ybAOt4Epjwc4r6L5f
	9XBERQTP4KY7I99Puxt7gO5da+lSk5SHBtWZ9jbhbJXpsWVXDSV9Vn/tOzUTe1WluM
	Ej+PlyEfTK0Qg8aYiqugcD74X5HIPgqjdUBiH04g=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Oct 2018 13:57:04 +0200
Message-Id: <20181001115704.701-16-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181001115704.701-1-luc.michel@greensocs.com>
References: <20181001115704.701-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v2 15/15] arm/xlnx-zynqmp: put APUs and RPUs in
 separate GDB groups
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HBeicRrohTkZ

Create two separate QOM containers for APUs and RPUs to indicate to the
GDB stub that those CPUs should be put in different processes.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 hw/arm/xlnx-zynqmp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index c195040350..5e92adbc71 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -22,10 +22,11 @@
 #include "hw/arm/xlnx-zynqmp.h"
 #include "hw/intc/arm_gic_common.h"
 #include "exec/address-spaces.h"
 #include "sysemu/kvm.h"
 #include "kvm_arm.h"
+#include "exec/gdbstub.h"
=20
 #define GIC_NUM_SPI_INTR 160
=20
 #define ARM_PHYS_TIMER_PPI  30
 #define ARM_VIRT_TIMER_PPI  27
@@ -175,17 +176,18 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState =
*s, const char *boot_cpu,
                                    Error **errp)
 {
     Error *err =3D NULL;
     int i;
     int num_rpus =3D MIN(smp_cpus - XLNX_ZYNQMP_NUM_APU_CPUS, XLNX_ZYNQM=
P_NUM_RPU_CPUS);
+    Object *rpu_group =3D gdb_cpu_group_container_get(OBJECT(s));
=20
     for (i =3D 0; i < num_rpus; i++) {
         char *name;
=20
         object_initialize(&s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
                           "cortex-r5f-" TYPE_ARM_CPU);
-        object_property_add_child(OBJECT(s), "rpu-cpu[*]",
+        object_property_add_child(rpu_group, "rpu-cpu[*]",
                                   OBJECT(&s->rpu_cpu[i]), &error_abort);
=20
         name =3D object_get_canonical_path_component(OBJECT(&s->rpu_cpu[=
i]));
         if (strcmp(name, boot_cpu)) {
             /* Secondary CPUs start in PSCI powered-down state */
@@ -210,13 +212,14 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState =
*s, const char *boot_cpu,
 static void xlnx_zynqmp_init(Object *obj)
 {
     XlnxZynqMPState *s =3D XLNX_ZYNQMP(obj);
     int i;
     int num_apus =3D MIN(smp_cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
+    Object *apu_group =3D gdb_cpu_group_container_get(obj);
=20
     for (i =3D 0; i < num_apus; i++) {
-        object_initialize_child(obj, "apu-cpu[*]", &s->apu_cpu[i],
+        object_initialize_child(apu_group, "apu-cpu[*]", &s->apu_cpu[i],
                                 sizeof(s->apu_cpu[i]),
                                 "cortex-a53-" TYPE_ARM_CPU, &error_abort=
, NULL);
     }
=20
     sysbus_init_child_obj(obj, "gic", &s->gic, sizeof(s->gic),
--=20
2.19.0

