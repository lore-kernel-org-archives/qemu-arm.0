Received: by 10.28.91.67 with SMTP id p64csp854913wmb;
        Tue, 13 Mar 2018 08:41:27 -0700 (PDT)
X-Google-Smtp-Source: AG47ELteXxBd4tO59OQlt0W6JPhhsOTREDNKE2gZMeD6Lk71H3/G8TuRZ44UKkw6T+3Wlvwe/dig
X-Received: by 10.200.23.232 with SMTP id r37mr1698163qtk.314.1520955687365;
        Tue, 13 Mar 2018 08:41:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520955687; cv=none;
        d=google.com; s=arc-20160816;
        b=H2eSBysbKLXDOidJ0btFu0mJ8uTrmR4Vw5AI5ekFWqeUBJ9Cle34VpLPmZmdKAihj6
         lb0RZgc03aKVMu1vqcsJzhnT+0yHtUvuBg46yGG0QnzdwX4o1CM5GpiUXe40kHDo4Cib
         wpKJ40vPtsLgWbqjsVSRXhHWE1qrbp9hY1f8US9jIfpkUWnE8JyLSu04Px63YSn7tRIU
         fNFQAMpir+HXc/1hTlXfR5vuIfPwQGlsgLkmFxK/v2vb0hXarDJjpZe3fml0n7AhR5xL
         mYLytTwD8N6bhQklZSPgJzWcBOlk30k+6SzKwqVHE+moWhWQaTf+ArCAc+h4PJkmFn6z
         nD6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=2e9tgmjPvIR2v7LocAzMQtkqqdh+4SwQiNDQfF5WJJc=;
        b=d7Pqzq4LUl5PnDjCPD2iofSftGJ+9YxsEjfehzaabBv/zZ0VoztF5AggZeK8QfL9z+
         FbB6Y+22v0Yu6J1iQyFasAOr2ceEmsQLPoMjDXqkmpij33u5T1QsNDkViQ5fQN4u5cEB
         OjOtB46Zw/e6lR8h7J4o8McgyHjHkOviy7Z93IzHmTMA5LeTa7yL6CBwMrngETcLiw+H
         TXDX/iAmOkdbVOSwYd8WKi94h+YchHKeHWfNjzNtWIb66XqXcJvVmJ13pbd1xgPrUHWT
         zFatXOheExUmkw2Pn6nu4MAode2ZUl3coRWkTL3GVY3gZWVoJvYNRqkfgBdHXI7ft9vo
         fsZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q28si487859qkh.252.2018.03.13.08.41.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 08:41:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40595 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evm3K-00036V-EZ
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 11:41:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1evlxK-0005Mq-79
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 11:35:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1evlxI-0005nx-NE
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 11:35:13 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47058)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1evlxI-0005j0-6K; Tue, 13 Mar 2018 11:35:12 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1evlxC-0003GI-Ne; Tue, 13 Mar 2018 15:35:06 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 13 Mar 2018 15:34:57 +0000
Message-Id: <20180313153458.26822-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180313153458.26822-1-peter.maydell@linaro.org>
References: <20180313153458.26822-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 8/9] hw/arm/bcm2836: Hardcode correct CPU type
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
	Pekka Enberg <penberg@iki.fi>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wm/Codit+C5j

Now we have separate types for BCM2386 and BCM2387, we might as well
just hard-code the CPU type they use rather than having it passed
through as an object property. This then lets us put the initialization
of the CPU object in init rather than realize.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/bcm2836.c | 22 +++++++++++++---------
 hw/arm/raspi.c   |  2 --
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 7140257c98..12f75b55a7 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -25,16 +25,19 @@
 
 struct BCM283XInfo {
     const char *name;
+    const char *cpu_type;
     int clusterid;
 };
 
 static const BCM283XInfo bcm283x_socs[] = {
     {
         .name = TYPE_BCM2836,
+        .cpu_type = ARM_CPU_TYPE_NAME("cortex-a15"),
         .clusterid = 0xf,
     },
     {
         .name = TYPE_BCM2837,
+        .cpu_type = ARM_CPU_TYPE_NAME("cortex-a53"),
         .clusterid = 0x0,
     },
 };
@@ -42,6 +45,16 @@ static const BCM283XInfo bcm283x_socs[] = {
 static void bcm2836_init(Object *obj)
 {
     BCM283XState *s = BCM283X(obj);
+    BCM283XClass *bc = BCM283X_GET_CLASS(obj);
+    const BCM283XInfo *info = bc->info;
+    int n;
+
+    for (n = 0; n < BCM283X_NCPUS; n++) {
+        object_initialize(&s->cpus[n], sizeof(s->cpus[n]),
+                          info->cpu_type);
+        object_property_add_child(obj, "cpu[*]", OBJECT(&s->cpus[n]),
+                                  &error_abort);
+    }
 
     object_initialize(&s->control, sizeof(s->control), TYPE_BCM2836_CONTROL);
     object_property_add_child(obj, "control", OBJECT(&s->control), NULL);
@@ -69,14 +82,6 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
 
     /* common peripherals from bcm2835 */
 
-    obj = OBJECT(dev);
-    for (n = 0; n < BCM283X_NCPUS; n++) {
-        object_initialize(&s->cpus[n], sizeof(s->cpus[n]),
-                          s->cpu_type);
-        object_property_add_child(obj, "cpu[*]", OBJECT(&s->cpus[n]),
-                                  &error_abort);
-    }
-
     obj = object_property_get_link(OBJECT(dev), "ram", &err);
     if (obj == NULL) {
         error_setg(errp, "%s: required ram link not found: %s",
@@ -168,7 +173,6 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
 }
 
 static Property bcm2836_props[] = {
-    DEFINE_PROP_STRING("cpu-type", BCM283XState, cpu_type),
     DEFINE_PROP_UINT32("enabled-cpus", BCM283XState, enabled_cpus,
                        BCM283X_NCPUS),
     DEFINE_PROP_END_OF_LIST()
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index f588720138..ae15997669 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -150,8 +150,6 @@ static void raspi_init(MachineState *machine, int version)
     /* Setup the SOC */
     object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(&s->ram),
                                    &error_abort);
-    object_property_set_str(OBJECT(&s->soc), machine->cpu_type, "cpu-type",
-                            &error_abort);
     object_property_set_int(OBJECT(&s->soc), smp_cpus, "enabled-cpus",
                             &error_abort);
     int board_rev = version == 3 ? 0xa02082 : 0xa21041;
-- 
2.16.2

