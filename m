Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp11498960wrx;
        Tue, 26 Feb 2019 12:59:20 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaflDjOx/5Cg4eOUb2bS8N1wuJvrlUMR4M2Eji3doKNV+f98lpbHmHebdv59mYjXaccHXw/
X-Received: by 2002:a25:af4a:: with SMTP id c10mr3105592ybj.294.1551214760888;
        Tue, 26 Feb 2019 12:59:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551214760; cv=none;
        d=google.com; s=arc-20160816;
        b=oWvKGb2/NSXtQGtVo6O1t76Hnf/4IywS3IPy+WOvcXKYZm19Jk8mqYpXovA4JYvl+N
         1DnH/vxfXddq7a6iPfeAICXTy6prfIwWZmB6ZvIh2vYu8CignOev1+s5iOyDrppo5BuQ
         /98yB2Z2ETse5XEq4/Ts7zpgfnCvSWAXXzmU7y56fK57kPb6s8DjEqi8XjCVAaDqAH7+
         9Ah6IyuDd9HeaqeiucRcblR1V/YwsGmSQFJZ+FvkifZe/dSMUhDpYFS7pkPSDdCTXbpk
         WBq7g29eGeAz7Ni5rMaco1K8vaxRg11RA+qI+vRRXhqyuRbpdBvVjTJovi/ka8WqjJKi
         kEaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=N8YG5UmHZp9xhyvFkmvv8c8K3639RiG2MWwEqMrfmDc=;
        b=yK+U8WAZxthKv2DvSci40KMlvmeTg3sZEadm91toTxZQQ3bVkMoOG+OfeolMKWfSL4
         OqqydDvJXcrKm/lhWd05H+fRKuaG/wIUyZyfQKpvRuwU35+d9H/gcQov+iS3Ve+73vWg
         xKl+fHNOESgMpQQB3ZJPCz5C6eg3uGT2iOGbSlpTpHf6QVYkArNNVR1YbBR5SPmjbO1Z
         oKUd2qk1DdxA2RLugVVwlQsjzVkeFfPI7DMuLPhmedvAEglDcCxbfYA6bfWtpaMzlwqn
         R3mdNjQ5VtvoXV8UkxU5950NSUCjJ4X7444KHs9fZFbGP7PrUFnRMGEaDIZJ/Gw/jF5r
         e02A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l19si7973598ywk.38.2019.02.26.12.59.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 12:59:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33118 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gyjou-0008K7-8X
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 15:59:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyjcc-0006q4-Oj
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 15:46:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyjca-0001Bx-EG
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 15:46:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:5386)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gyjcT-00010X-DZ; Tue, 26 Feb 2019 15:46:32 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C8D2305B16F;
	Tue, 26 Feb 2019 20:46:24 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9A7A05D6A6;
	Tue, 26 Feb 2019 20:46:19 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue, 26 Feb 2019 21:44:39 +0100
Message-Id: <20190226204439.2296-19-eric.auger@redhat.com>
In-Reply-To: <20190226204439.2296-1-eric.auger@redhat.com>
References: <20190226204439.2296-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 26 Feb 2019 20:46:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v9 18/18] hw/arm/virt: Allow nvdimm instantiation
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
Cc: pbonzini@redhat.com, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fDiaaLJVMiH2

If NVDIMM option is enabled at machine level, let's allow
NVDIMM plug.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index af2ccaf152..c0f982de02 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1833,13 +1833,14 @@ static void virt_memory_pre_plug(HotplugHandler *=
hotplug_dev, DeviceState *dev,
                                  Error **errp)
 {
     const bool is_nvdimm =3D object_dynamic_cast(OBJECT(dev), TYPE_NVDIM=
M);
+    MachineState *ms =3D MACHINE(hotplug_dev);
=20
     if (dev->hotplugged) {
         error_setg(errp, "memory hotplug is not supported");
     }
=20
-    if (is_nvdimm) {
-        error_setg(errp, "nvdimm is not yet supported");
+    if (is_nvdimm && !ms->acpi_nvdimm_state.is_enabled) {
+        error_setg(errp, "nvdimm is not enabled: missing 'nvdimm' in '-M=
'");
         return;
     }
=20
--=20
2.20.1

