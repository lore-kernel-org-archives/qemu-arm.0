Received: by 10.28.91.67 with SMTP id p64csp1200999wmb;
        Thu, 8 Mar 2018 05:06:33 -0800 (PST)
X-Google-Smtp-Source: AG47ELvocb7hJ935bbR5NbJXOWLamlTYJrL/4HgH3e1jnIh28lBZ3SFRZIJ8sKLqurnkbKyHhX1W
X-Received: by 10.25.228.18 with SMTP id b18mr15088802lfh.61.1520514393062;
        Thu, 08 Mar 2018 05:06:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520514393; cv=none;
        d=google.com; s=arc-20160816;
        b=I7n0+OjjGaLpxrqm3M7PG+FWaGaLiQd/2T4jfnyG3+4j0NVI8legStFiXZ+MgITCRr
         aeKpDhFiYRekAKM9uDVJjpy4YG0ops2RC4BapJ/lbs6nFYpqb5kwx7dHf96QlgDOEi7a
         h19fuRYxP2zOUqO76m8h1RrFAhRhpMlpua5PJnUAASMyL2w1655qBKueBOxfsKk52MhC
         4NYqC6Yo7zcivIRW7qj+Jv2zmzhnah7bUtbzPGomHl/WJR9hKVnwZ36mxfN2H0KvLL7B
         J001HTxskWUua0kII2TjtLqnYWlyY2Hmp1a6x4jab/ItbK522i9XnuIdcgvbK8ldd3Pk
         i/EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=swZCpyIxmNtZupe/BWVZaMk/478ba7WYRGLlZWC5elM=;
        b=Q0xlmzruuvqVS7tJ32+/t5VmneuEuwhjgabsbsWjzN4/HFoaGWIQhJUoyNAeCIjfVh
         hDSrypTGi+UAkW8ixxQQAmyIhrL4g14jsO7m0yATbs+7lk/gk25xb0hSKSRrIDAmsUE4
         VictFp8Xw0jhl+ScVBrWZO4pRu9jb+9gV6Xm7wpUhlxg8kcbLoN/4C6KwPHKOe8XIrEE
         5ncLUnSBax1LZbgbCSK0fC8fAdNB7glZ6ZSJTAccw5UJBiJ/vsh7N1CYrYKIduTYuOWc
         HAaBiP/wlt5HzxqG3EonMmurBqi6alfRcCB6KPhEsk1IvSxhHhUimj66qtUClUwRz+0d
         Kk/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id o11si8121864lfi.411.2018.03.08.05.06.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Mar 2018 05:06:33 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1etvFg-0005zj-9z; Thu, 08 Mar 2018 13:06:32 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 6/6] hw/arm/virt: Support -machine gic-version=max
Date: Thu,  8 Mar 2018 13:06:26 +0000
Message-Id: <20180308130626.12393-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180308130626.12393-1-peter.maydell@linaro.org>
References: <20180308130626.12393-1-peter.maydell@linaro.org>
X-TUID: HeL0YPJypn53

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
