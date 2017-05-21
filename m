Received: by 10.103.124.15 with SMTP id x15csp1047478vsc;
        Sun, 21 May 2017 08:30:18 -0700 (PDT)
X-Received: by 10.237.39.195 with SMTP id m3mr17380581qtg.164.1495380618638;
        Sun, 21 May 2017 08:30:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495380618; cv=none;
        d=google.com; s=arc-20160816;
        b=lzjECuHhKsP6XkGrWPQIptHD7+hQ/Y+KAHzx+JhmiHIu1S8gp8+RS6qCykDU9zOyx9
         fN0z4Rgrpugrf9mLRAyZXfgQYAXDh93WvuG68CpXCBZ9oM6zxhSNP5HzclKNVgOrqvx5
         nGLcIy0R49L4Lul2l+srY/rCkGm13Y/IVK6UcUSNAgnIWNNpzjYPjKgtx1Zk7Sg0nvwx
         La2SbFQFYhkBXC5GEDYhkNhbfDav2EIAQemwlSQY8VRF/t9fD2f08CuinGvvFQeVNuZ7
         QMfy2EdTo9B2zOBAZX0CzJYqOnULHuIUTOc/quXkeLCrXfTClCvvjpRsfEnnxHyBJKIA
         HpDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=iLNdq9KQCuLIjYMeYSvW70qGbNzDtvtjb5sNfOQBJ+A=;
        b=E+AnB2rwa6BNQyIlVQhdt9oWRSsA4SnsTwuu+OigX+IrrHbexFWCKPrmNH3yVgZYsl
         U3zpcQ8p5rPe6Rh9bPY8ehvO2G+YB3sKaB/Y3vLORLeWKm5GrvdfFE7koyfKIvmOIndr
         aYFcLgqkqfQmwJXRXg0oeg3pKLCDxfdmGhO9QbTrOAi0N5G+qYBzfCW2kxJvrnqQWgq8
         iigT9oWsphRnAUxwV9wPBScaeqy1zOwwTo8URadrCd776xE7+iVVgYW6FORKVMQscLkA
         gX1SpeLuCroGrlz8AmZihU5zutxLNY4N6YUL8XyEUDqxqDRs3DVeqq1MmU4AuIpmCnxI
         OW2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 26si15832268qkt.215.2017.05.21.08.30.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 May 2017 08:30:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38366 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dCSoE-0002Go-2Z
	for alex.bennee@linaro.org; Sun, 21 May 2017 11:30:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53455)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dCSo0-0002F9-Ph
	for qemu-arm@nongnu.org; Sun, 21 May 2017 11:30:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dCSnx-000770-QE
	for qemu-arm@nongnu.org; Sun, 21 May 2017 11:30:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:49518)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1dCSnx-00076e-IN; Sun, 21 May 2017 11:30:01 -0400
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 74523239B0;
	Sun, 21 May 2017 15:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74523239B0
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sun, 21 May 2017 17:29:39 +0200
Message-Id: <20170521152949.15338-2-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170521152949.15338-1-krzk@kernel.org>
References: <20170521152949.15338-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: [Qemu-arm] [PATCH v3 01/11] hw/intc/exynos4210_gic: Fix GIC memory
 mappings for secondary CPU
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: egc41jRIsBhL

Recent Linux kernel (tested next-20170224) was complaining about missing
GIC mask and was unable to bring up secondary CPU:

    [ =C2=A0 =C2=A00.000000] NR_IRQS:16 nr_irqs:16 16
    [    0.000000] GIC CPU mask not found - kernel will fail to boot.
    ...
    [ =C2=A0 =C2=A00.400492] smp: Bringing up secondary CPUs ...
    [ =C2=A0 =C2=A01.413184] CPU1: failed to boot: -110
    [ =C2=A0 =C2=A01.423981] smp: Brought up 1 node, 1 CPU

In its instance_init() call, the Exynos GIC driver was setting GIC
memory mappings for each CPU, from 1 up to "num-cpu" property.  The
Exynos4210 machine init call on the other hand, first created Exynos GIC
device and then set the "num-cpu" property which was too late.  The init
already happened with default "num-cpu" value of 1 thus GIC mappings
were created only for the first CPU.

Split the Exynos GIC init code into realize function so the code will
see updated "num-cpu" property.  This fixes the warning and brings
second CPU:
    [    0.435780] CPU1: thread -1, cpu 1, socket 9, mpidr 80000901
    [    0.451838] smp: Brought up 1 node, 2 CPUs

Additionally this fixes missing Software Generated Interrupts (except
CPU wakeup, non of SGIs are coming) which are needed for example for IRQ
work.  Lack of IRQ work causes kernel to hang during system power off
because cpufreq_dbs_governor_stop() waits for completion with
irq_work_sync().

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/exynos4210_gic.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index 2a55817b7660..222cfd6c6387 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -283,9 +283,20 @@ static void exynos4210_gic_set_irq(void *opaque, int=
 irq, int level)
=20
 static void exynos4210_gic_init(Object *obj)
 {
-    DeviceState *dev =3D DEVICE(obj);
     Exynos4210GicState *s =3D EXYNOS4210_GIC(obj);
-    SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
+
+    memory_region_init(&s->cpu_container, obj, "exynos4210-cpu-container=
",
+            EXYNOS4210_EXT_GIC_CPU_REGION_SIZE);
+    memory_region_init(&s->dist_container, obj, "exynos4210-dist-contain=
er",
+            EXYNOS4210_EXT_GIC_DIST_REGION_SIZE);
+
+}
+
+static void exynos4210_gic_realize(DeviceState *dev, Error **errp)
+{
+    Exynos4210GicState *s =3D EXYNOS4210_GIC(dev);
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
+    Object *obj =3D OBJECT(dev);
     uint32_t i;
     const char cpu_prefix[] =3D "exynos4210-gic-alias_cpu";
     const char dist_prefix[] =3D "exynos4210-gic-alias_dist";
@@ -306,11 +317,6 @@ static void exynos4210_gic_init(Object *obj)
     qdev_init_gpio_in(dev, exynos4210_gic_set_irq,
                       EXYNOS4210_GIC_NIRQ - 32);
=20
-    memory_region_init(&s->cpu_container, obj, "exynos4210-cpu-container=
",
-            EXYNOS4210_EXT_GIC_CPU_REGION_SIZE);
-    memory_region_init(&s->dist_container, obj, "exynos4210-dist-contain=
er",
-            EXYNOS4210_EXT_GIC_DIST_REGION_SIZE);
-
     for (i =3D 0; i < s->num_cpu; i++) {
         /* Map CPU interface per SMP Core */
         sprintf(cpu_alias_name, "%s%x", cpu_prefix, i);
@@ -346,6 +352,7 @@ static void exynos4210_gic_class_init(ObjectClass *kl=
ass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
+    dc->realize =3D exynos4210_gic_realize;
     dc->props =3D exynos4210_gic_properties;
 }
=20
--=20
2.9.3

