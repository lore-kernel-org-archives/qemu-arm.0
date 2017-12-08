Received: by 10.223.159.74 with SMTP id f10csp722810wrg;
        Fri, 8 Dec 2017 07:13:31 -0800 (PST)
X-Google-Smtp-Source: AGs4zMayYCEHyVGG4xzX3Kje4UJ9u0acRA/Z/IzkorH/uUmykV5vIqQlt+IK7r4qEYdmV9+IIhKt
X-Received: by 10.129.160.200 with SMTP id x191mr20402467ywg.365.1512746011123;
        Fri, 08 Dec 2017 07:13:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512746011; cv=none;
        d=google.com; s=arc-20160816;
        b=q38b+k3ZwJG8mxI39rqRrn73dIb1jpRYTQeD3SyC03Mrv7japU4XOU0rQkoDGjhTQD
         Wrj3Ccz/V1O610QXM8wUmsK2gviwKBL13kjlNoMdtJUe7dd7wkNu+NsM0q/KZrbeR+Vu
         oNZ/xjkN96F8ryGFKPO2SGnWKwdaUuexzF/EdJ+lbFUt4MVOB9F052kypaS619KCxgGs
         n66SAO3gQSOuquttEXNA2JScQeG2BJ9RC8wR3eyKh942oNceLMZTWbB6JdNhdoBdxOEQ
         /uORc9L6zNA//YYx4Q3AyZp+cJFYSfx+kdCL2gCqdh1ltffNx7pGWsIiKIQtp71WAqNk
         kOBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=alI/yWR2hG4TcFL/K5w3/aoViFfHzJhIzay3TnLGCW8=;
        b=L5mdgoH4PEQQNMQt+ZUHMXFQmCl5aUSsKdzaVKZu0OPi7m5S7B5huLPkhdFnEUO3pP
         A+OAJ0knVcPkQr+1Uspt54aLet7EplLXlS3DwdnKNfjNH5J+y6o7+La5AKC/HNY4k1wq
         iqv8w7/Ce0ZOqAQyo7fuOHIhjeC6LIAurt45R8lpS+NRtf/+LfeJ5pV6ibFCiS3h75h3
         aDMQRON9AXGcWiHGbB8Ekp5/sRlut+YYW/NHQdVPq2i9aSRhDZj5TpHBb4E/Z+MmqXnD
         D7ce9e+GNAQJ/w83BHe1miqqq0+hPkf0UJRU18/SUkJVpCunuIR+G9dosySFN4UKSsOY
         iRew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h92si1704084ybi.696.2017.12.08.07.13.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Dec 2017 07:13:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37689 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eNKLC-0000Qs-Fb
	for alex.bennee@linaro.org; Fri, 08 Dec 2017 10:13:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55058)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eNKKr-0000EF-67
	for qemu-arm@nongnu.org; Fri, 08 Dec 2017 10:13:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eNKKq-0000FL-6O
	for qemu-arm@nongnu.org; Fri, 08 Dec 2017 10:13:09 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:38966)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eNKKp-0000DR-Vj; Fri, 08 Dec 2017 10:13:08 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eNKAD-0000tQ-HS; Fri, 08 Dec 2017 15:02:09 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  8 Dec 2017 15:02:06 +0000
Message-Id: <1512745328-5109-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/3] hw/arm/virt: Add virt-2.12 machine type
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aXnpQN9XTnwN

Add virt-2.12 machine type.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/compat.h |  3 +++
 hw/arm/virt.c       | 19 +++++++++++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/include/hw/compat.h b/include/hw/compat.h
index cf389b4..263de97 100644
--- a/include/hw/compat.h
+++ b/include/hw/compat.h
@@ -1,6 +1,9 @@
 #ifndef HW_COMPAT_H
 #define HW_COMPAT_H
 
+#define HW_COMPAT_2_11 \
+    /* empty */
+
 #define HW_COMPAT_2_10 \
     {\
         .driver   = "virtio-mouse-device",\
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 151592b..543f9bd 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1618,7 +1618,7 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
-static void virt_2_11_instance_init(Object *obj)
+static void virt_2_12_instance_init(Object *obj)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
@@ -1678,10 +1678,25 @@ static void virt_2_11_instance_init(Object *obj)
     vms->irqmap = a15irqmap;
 }
 
+static void virt_machine_2_12_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(2, 12)
+
+#define VIRT_COMPAT_2_11 \
+    HW_COMPAT_2_11
+
+static void virt_2_11_instance_init(Object *obj)
+{
+    virt_2_12_instance_init(obj);
+}
+
 static void virt_machine_2_11_options(MachineClass *mc)
 {
+    virt_machine_2_12_options(mc);
+    SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_11);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(2, 11)
+DEFINE_VIRT_MACHINE(2, 11)
 
 #define VIRT_COMPAT_2_10 \
     HW_COMPAT_2_10
-- 
2.7.4

