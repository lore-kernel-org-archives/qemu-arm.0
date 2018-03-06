Received: by 10.28.91.67 with SMTP id p64csp3702928wmb;
        Tue, 6 Mar 2018 04:55:45 -0800 (PST)
X-Google-Smtp-Source: AG47ELu9/utDZ6kxOxpmIdRH5h9ylTW20GDkjKMawYppMAKB2FyuUbyKGVygYjYqxzyi0RIxM96i
X-Received: by 10.129.85.205 with SMTP id j196mr9657096ywb.26.1520340945205;
        Tue, 06 Mar 2018 04:55:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520340945; cv=none;
        d=google.com; s=arc-20160816;
        b=uBiLfhSw5EUxhHSPt7BZV9eMzvCQ5N6BeW43+CPU8qKDRtkXPqqcUwM7PiIxhHr+v5
         IVURCNiQhjyUiKzdxXbfKLwut7G0WEP8pu6+u0qN5mUe3uXMhUYXGrpwGvwf3aT4jco+
         bcuKFAStWJRZJBM+anfphHyd9f2qt/uazUpyp35AO2R+wAZj6+ZDN9dQeHqVp9EPJShS
         vSTNehTI9H/ICCtoCaNP69BZIcckOtYIyK35RV3dXw4NrlfHnr3nr02yybruTMugNpfO
         xVIxc02MArw5o49zCjPuUISnx+4F+eTw7OpTlgFtxRTLIy1kf1VaT+nLBXUgtd+CT5QL
         jvEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=swZCpyIxmNtZupe/BWVZaMk/478ba7WYRGLlZWC5elM=;
        b=bre+o+bsA31vpMuiK1uqcK2TFF3l7X84LB0qOwaX5L/Rj9gFd9Je4H6eFl3FHVfA9f
         NVGnSzxO4848z25iWWdf0sow0rD/QuTmi5IlRag5UIxlfWMjNrfJYdgAXjbv1kc43z+g
         H8gU6dvNX/werHydJwUH+uPvWdl1dDtAJNx8y3V5wapTF12fBPH5GdIt830QDdRSasw7
         49HHkeg5nV+84Cy8WjDIv8gbJrtubxcgNCODxNDe8cUAXGnvtQu+AV85WR7trSIGuNMb
         OOhuqUSlXdkWfRXOuMowLQpdYvesccVG1/0DUUIeT3BGHuHM9pyrxuJiCGMH79Ii6R3p
         KRUw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n130si2542993ywd.599.2018.03.06.04.55.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Mar 2018 04:55:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55251 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1etC88-0008Oy-Lx
	for alex.bennee@linaro.org; Tue, 06 Mar 2018 07:55:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41259)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1etC82-0008Oe-Th
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 07:55:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1etC82-0004pU-4I
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 07:55:39 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46810)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1etC81-0004jX-Sj; Tue, 06 Mar 2018 07:55:38 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1etC7v-0004Wn-Mg; Tue, 06 Mar 2018 12:55:31 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  6 Mar 2018 12:55:26 +0000
Message-Id: <20180306125526.27838-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180306125526.27838-1-peter.maydell@linaro.org>
References: <20180306125526.27838-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 6/6] hw/arm/virt: Support -machine
 gic-version=max
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
Cc: Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iIAyWm74UnC1

Add support for passing 'max' to -machine gic-version. By analogy
with the -cpu max option, this picks the "best available" GIC version
whether you're using KVM or TCG, so it behaves like 'host' when
using KVM, and gives you GICv3 when using TCG.

Also like '-cpu host', using -machine gic-version=max' means there
is no guarantee of migration compatibility between QEMU versions;
in future 'max' might mean '4'.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index cda4b83586..2c07245047 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1207,16 +1207,23 @@ static void machvirt_init(MachineState *machine)
     /* We can probe only here because during property set
      * KVM is not available yet
      */
-    if (!vms->gic_version) {
+    if (vms->gic_version <= 0) {
+        /* "host" or "max" */
         if (!kvm_enabled()) {
-            error_report("gic-version=host requires KVM");
-            exit(1);
-        }
-
-        vms->gic_version = kvm_arm_vgic_probe();
-        if (!vms->gic_version) {
-            error_report("Unable to determine GIC version supported by host");
-            exit(1);
+            if (vms->gic_version == 0) {
+                error_report("gic-version=host requires KVM");
+                exit(1);
+            } else {
+                /* "max": currently means 3 for TCG */
+                vms->gic_version = 3;
+            }
+        } else {
+            vms->gic_version = kvm_arm_vgic_probe();
+            if (!vms->gic_version) {
+                error_report(
+                    "Unable to determine GIC version supported by host");
+                exit(1);
+            }
         }
     }
 
@@ -1480,9 +1487,11 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
         vms->gic_version = 2;
     } else if (!strcmp(value, "host")) {
         vms->gic_version = 0; /* Will probe later */
+    } else if (!strcmp(value, "max")) {
+        vms->gic_version = -1; /* Will probe later */
     } else {
         error_setg(errp, "Invalid gic-version value");
-        error_append_hint(errp, "Valid values are 3, 2, host.\n");
+        error_append_hint(errp, "Valid values are 3, 2, host, max.\n");
     }
 }
 
-- 
2.16.2

