Received: by 10.223.159.74 with SMTP id f10csp5601293wrg;
        Thu, 7 Dec 2017 10:15:10 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYceUbOqUliKroN3+I9MAVrl+tYAMeQOYVKMmwcRsB1ygXpDlJZDPqins9GlwIuf5PWPyLK
X-Received: by 10.37.224.215 with SMTP id x206mr5017762ybg.200.1512670509931;
        Thu, 07 Dec 2017 10:15:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512670509; cv=none;
        d=google.com; s=arc-20160816;
        b=YVAdDvdLnQl2ivMVUVzYv8OjJ+butk+qBZVDmoPpITzWXlEAlmkktkEU+oFqNbAwSp
         rYLomv0hw7jMqWw6ETXxZB5HavxEBy60csBL5oBOqh71zv8pMbz0Ngutyr3KvpP9vJYN
         mpKhQ3Lqmv5AqCUEQBg358kiCfGmXUQzne+VspBWSOovi2iTf4Hzj2rcUK/DyYWr9eNE
         lEM/v6/c9k1w2on5I3MyTLpVayzLlo+UNyudZvr/qnXZC/ZlLpwxOHZrN89pDYtULdhn
         GHHbypoVVvALFbDuH4bttykFyiMM3NEHsI4TIn5/6UNLcUdZBKTk8HdCQpv2JkvI5f+/
         MEow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=TdebkGqS8kSAy121qHa0qfoa5/4I+I/q5ImO+eNsURk=;
        b=hsJXLkxQdKqFbCm5/E0jx9axbLhRtAdj5u3RFw7zs6/GXksaOxa5D1sYCFlGK4gX8r
         NkHSvLrH7s8To6FQHyMXEdyyjt4+Sfky9ilN1QFX6WSttIXopBNuCLQNgy4t8zsLeF2V
         cHUquUtnbqSVYkLaCtiJNFuVrl5b6/NIpK3lTqI+47aN7LPa9aia/pX4Hry4+82hB/d0
         3U/PErzc1WlZLA0+eWSl6V5L6xflVf+G2y5oJ+nhaUPTc5rL5krQQRpVyOgyIRmIdiao
         SDcU/z57zebKhwXSEE/oHdqd5SCqAwTUeIXkF2eE6kgVHDTPwk+mvNmgNEIc1arLBGC0
         Tiqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c8si1331985ywl.477.2017.12.07.10.15.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Dec 2017 10:15:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33715 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eN0hR-0008Fh-DT
	for alex.bennee@linaro.org; Thu, 07 Dec 2017 13:15:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eN0hI-0008FA-IQ
	for qemu-arm@nongnu.org; Thu, 07 Dec 2017 13:15:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eN0hH-0006mJ-NW
	for qemu-arm@nongnu.org; Thu, 07 Dec 2017 13:15:00 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:38906)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eN0hH-0006ly-G0; Thu, 07 Dec 2017 13:14:59 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eN0hG-000836-IH; Thu, 07 Dec 2017 18:14:58 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  7 Dec 2017 18:14:53 +0000
Message-Id: <1512670493-18114-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
References: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 6/6] hw/arm/virt: Support -machine gic-version=max
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
Cc: "Richard W . M . Jones" <rjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bzy0SjBebyeA

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
index 92bd776..603ba56 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1265,16 +1265,23 @@ static void machvirt_init(MachineState *machine)
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
 
@@ -1539,9 +1546,11 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
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
2.7.4

