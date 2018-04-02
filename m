Received: by 10.28.71.155 with SMTP id m27csp2934059wmi;
        Mon, 2 Apr 2018 13:57:52 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+e+t3Nt9yvV13W/Vo7XnWzAqKRjflbsRMxc7spodZyUplCjMsqqMCt4sKldPayxXO4/Wmn
X-Received: by 10.200.71.18 with SMTP id f18mr4954515qtp.166.1522702671967;
        Mon, 02 Apr 2018 13:57:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522702671; cv=none;
        d=google.com; s=arc-20160816;
        b=c9dz2bqEqWiL/O4FKLFLEfFDXYsZ3dxPgjNkEqujcXOqvYwYZNwVwXGXCvK0G9bjiC
         reS2ibfJIVa32sjfizSCPUjFxKT0cjMFN4J8GDDpRtQDjuXxYcJc05FRBclvbKTPG5zT
         ERpqHWjg+HT7eB5IGJAVjEeJJCvYhmrripNr6RcRAW3Iu4nwy7LOcl8EvpVzfmPEfVWR
         lWHOO5MSMHN0v+HhfJoWNQ/SLnJ1k0a4rGw0T3eFRpyQMwqaOaixOBZW6X27kT76NbOK
         UEIE87svQ7qFRcP4MQsP9LTZrv9M6hsvW6vaMPQiQwH0CB3DBzENhrx0I0XGEHxLbG4h
         ApgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=j5hCjwdbgetEvET5j7CHQRxg5xvqGHAqqVaYk9agXn4=;
        b=c7G4jH0L8Iz707+ZrEJXRDp5E/5IbS3hGe9tp6PCxxPtM5WD1T5vzmEgB+ZX+uq/aO
         DBJGnN4uN6c1+HZdQ8IQR2/UUv28zAoJ7Ze1MDpuQQJc2sHI/zPfDncmTm9yXTOihDlk
         leuHkbX3+g6tycvCyhjc8fsETYFyhSZzIWSzVncqKDKGafCZFWjGvX8WvQVkKb+GaxmZ
         Im6lddqs8vexE+xL68dV+AL5+cTMP/n59nPYkT5KR9AyWu9nAsTOv51FcQXr5yCkANIM
         KRKf9qUo8bBhzjlHq+J/y6lLROY9pSDujn5Sqpr1LxVPh3LUZC9Hc0FCCaOHmmSJwBw0
         p0hQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gEMk19Sy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u44si1544924qta.219.2018.04.02.13.57.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Apr 2018 13:57:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gEMk19Sy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34640 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f36WV-0005V1-GD
	for alex.bennee@linaro.org; Mon, 02 Apr 2018 16:57:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1f36W0-0005Ee-JN
	for qemu-arm@nongnu.org; Mon, 02 Apr 2018 16:57:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1f36Vz-0008GJ-1W
	for qemu-arm@nongnu.org; Mon, 02 Apr 2018 16:57:20 -0400
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:44608)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1f36Vu-0008BC-99; Mon, 02 Apr 2018 16:57:14 -0400
Received: by mail-pl0-x243.google.com with SMTP id b6-v6so3772314pla.11;
	Mon, 02 Apr 2018 13:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=j5hCjwdbgetEvET5j7CHQRxg5xvqGHAqqVaYk9agXn4=;
	b=gEMk19SykIlxDTNlKQ+8wVahDv9WeJATeSZAS7DpF5oSIj3I2K6fJ8uucHM8S7o+sG
	bw4IZZQDsWaQra9DrX+qwESAh1wqNbt/5xRMHdiFBOYlclnurZZhoIOHPu9SDcJzYefA
	lcs8mglB4MOuhefCIVi2JcgI1t4fHKDYN6IUvOFEmXzieHa46SFGFbWVLTUC6llp6own
	k6rYcUiKpGUReuctIOEw9sWEUGHoRkQ8hsrBOLrKDB1zeskqpTf5nVRProQcD8+LaEvF
	DmFY+yEmIyzTW0kOlWap9BY68EvcV67cCzLr659/6yt/RMS057KElfKkBX83Fv96bURI
	YmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=j5hCjwdbgetEvET5j7CHQRxg5xvqGHAqqVaYk9agXn4=;
	b=KvjjU2boWDob8YyYWGuOfKmvuID63uwD497gDPyZzjCAAeedqprtII3esvnguXt/Mw
	yyMHiZTEn6YDiCP08hTBUUcksfZ1mVPi6TUuQ77PYFap4AOc0wSQQE+6oEANqEQEdZCq
	t7kVMEShxEW0twAe9mXvRi1T6sEGS/V2FPbPiTZ+6GmMK57bjR/hlHFn1Nlugln5qzGv
	e6uYQtn3nDp2NkZz1MwPbKmw6+r8cK8D91HvWaJXc7UsQNR6yvmx/0Xax4lrO9R5Zgsc
	claZQCREw6fKFwMEj+a+TCgyfxUGyfP8j+RAunVqEvR3gY7RIXEhHpGY6czOLdHstCuN
	mKjA==
X-Gm-Message-State: AElRT7Him4dm3SShHmAYsWqEkzPc8AcFrtDQh7pJE445KThi7COItiSA
	vJq22g9EvHJ0aeuWxIrlcOU=
X-Received: by 10.99.178.88 with SMTP id t24mr7390121pgo.212.1522702632358;
	Mon, 02 Apr 2018 13:57:12 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	k185sm1693326pgk.94.2018.04.02.13.57.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 02 Apr 2018 13:57:11 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: Marc Zyngier <marc.zyngier@arm.com>
Date: Mon,  2 Apr 2018 13:56:54 -0700
Message-Id: <20180402205654.14572-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-arm] [PATCH] hw/arm: Allow manually specified /psci node
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MexU9kd7kQBk

Change the code to avoid exiting QEMU if user provided DTB contains
manually specified /psci node and skip any /psci related fixups
instead.

Fixes: 4cbca7d9b4 ("hw/arm: Move virt's PSCI DT fixup code to
arm/boot.c")

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---

Mark:

Sorry about the inconvenience, here's the fix (hopefully) to the
prolem you reported in [1]. Let me know if skipping all PSCI related
DTB fixup if /psic node is present is not the behaviour you had in
mind for your suggested fix.

Thanks,
Andrey Smirnov

[1] http://lists.gnu.org/archive/html/qemu-devel/2018-03/msg06914.html

 hw/arm/boot.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 6d0c92ab88..d9f9375cdb 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -422,6 +422,7 @@ static void fdt_add_psci_node(void *fdt)
     ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0));
     const char *psci_method;
     int64_t psci_conduit;
+    int rc;
 
     psci_conduit = object_property_get_int(OBJECT(armcpu),
                                            "psci-conduit",
@@ -439,6 +440,15 @@ static void fdt_add_psci_node(void *fdt)
         g_assert_not_reached();
     }
 
+    /*
+     * If /psci node is present in provided DTB, assume that no fixup
+     * is necessary and all PSCI configuration should be taken as-is
+     */
+    rc = fdt_path_offset(fdt, "/psci");
+    if (rc >= 0) {
+        return;
+    }
+
     qemu_fdt_add_subnode(fdt, "/psci");
     if (armcpu->psci_version == 2) {
         const char comp[] = "arm,psci-0.2\0arm,psci";
-- 
2.14.3

