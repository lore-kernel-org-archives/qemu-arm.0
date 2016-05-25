Received: by 10.25.30.65 with SMTP id e62csp1244991lfe;
        Wed, 25 May 2016 04:16:31 -0700 (PDT)
X-Received: by 10.140.102.178 with SMTP id w47mr2705535qge.21.1464174991262;
        Wed, 25 May 2016 04:16:31 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a2si7343249qhb.55.2016.05.25.04.16.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 May 2016 04:16:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59028 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5Wne-0007tZ-HN
	for alex.bennee@linaro.org; Wed, 25 May 2016 07:16:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1b5WQq-0003DY-AX
	for qemu-arm@nongnu.org; Wed, 25 May 2016 06:52:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1b5WQp-00014d-AB
	for qemu-arm@nongnu.org; Wed, 25 May 2016 06:52:56 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:34937)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1b5WQb-0000xW-VG; Wed, 25 May 2016 06:52:42 -0400
Received: by mail-wm0-x242.google.com with SMTP id f75so14168609wmf.2;
	Wed, 25 May 2016 03:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=189A3i11ew1j7sDEnNGCySodJiUUteVXG4JSqYLIKso=;
	b=pFQ/LYEYeKFPNs0K8op22+KLzNadzl+XR4m0ISJfKXoqxeNzVJoTNSaim4zQyY1Gn2
	YbYQ8dDh6rrhGMNde/5GizOaXeahhQTEPreCgYuc0czx7STT2R+YeaaEClkDTkznu8eE
	7Wi4FduSduBmRJYv8qAx4lWMDEkBWWD9esYGXECiROnT7zKW0rHfVWuUm3UEGBYdcjnI
	DiUfXiuGaL3ueO3Ky5+CvFdkWWjBshw7cuBeqFoZgKvQbJaYb53VGwk3N3FA5bUyJ6cb
	tL+XQqjjHXzrNQ/Pc/iW9xMmho8+nHy0vnfxKx2N89ILv1qqSZFnrrJs/kt1L6p33b6z
	CnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=189A3i11ew1j7sDEnNGCySodJiUUteVXG4JSqYLIKso=;
	b=mwiwlmHhAU/wfGSGJGml++GA+hNlkI+21w7kLERUrspl4ywBR8j9Bi7CoJVErVBunu
	5wYunCex3Z6INtd3QM4dN9u3Yn6E3MU93quD8qP+/jp7TqMpXaTdYHz49OHGmAk9zKDZ
	8tKxEl2Dz0NLsfeuanQcz0A4oZeBbEkqVEij3wujS+AcQFJeV+E9eFKiO1mNto3N5g/w
	l4RhxL4QHlRnoi5S30pfDDoO8Ir68Nri0rQ11AUUxKvRMsCJrZ3lBKQHMGMOMdYGra+C
	gfnEPjuIce9dmQbhKcRBPAurq4tE6vo50vGC77R6pbFzogL5comGxj6TKa2o7olZrzJI
	nMBQ==
X-Gm-Message-State: ALyK8tKv5NrFQw97dXnvbgHBJwgtr/g+UV4Y1ELLJTgG6ddKSecQMmxMvSU26hsRwsXbZg==
X-Received: by 10.28.26.200 with SMTP id a191mr2976273wma.55.1464173561281;
	Wed, 25 May 2016 03:52:41 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id y76sm8600151wmd.3.2016.05.25.03.52.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 May 2016 03:52:40 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 25 May 2016 12:52:32 +0200
Message-Id: <1464173555-12800-2-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1464173555-12800-1-git-send-email-edgar.iglesias@gmail.com>
References: <1464173555-12800-1-git-send-email-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
Subject: [Qemu-arm] [PATCH v2 1/4] xlnx-zynqmp: Add a secure prop to
 en/disable ARM Security Extensions
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dNIN5F/mH1KJ

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add a secure prop to en/disable ARM Security Extensions.
This is particularly useful for KVM runs.

Default to disabled to match the behavior of KVM.

This changes the default setup from having the ARM Security
Extensions to not longer having them.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-zynqmp.c         | 3 +++
 include/hw/arm/xlnx-zynqmp.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 4d504da..965a250 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -238,6 +238,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         }
         g_free(name);
 
+        object_property_set_bool(OBJECT(&s->apu_cpu[i]),
+                                 s->secure, "has_el3", NULL);
         object_property_set_int(OBJECT(&s->apu_cpu[i]), GIC_BASE_ADDR,
                                 "reset-cbar", &error_abort);
         object_property_set_bool(OBJECT(&s->apu_cpu[i]), true, "realized",
@@ -370,6 +372,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
 static Property xlnx_zynqmp_props[] = {
     DEFINE_PROP_STRING("boot-cpu", XlnxZynqMPState, boot_cpu),
+    DEFINE_PROP_BOOL("secure", XlnxZynqMPState, secure, false),
     DEFINE_PROP_END_OF_LIST()
 };
 
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 2332596..38d4c8c 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -84,6 +84,9 @@ typedef struct XlnxZynqMPState {
 
     char *boot_cpu;
     ARMCPU *boot_cpu_ptr;
+
+    /* Has the ARM Security extensions?  */
+    bool secure;
 }  XlnxZynqMPState;
 
 #define XLNX_ZYNQMP_H
-- 
2.5.0

