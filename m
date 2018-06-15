Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp967227wrq;
        Fri, 15 Jun 2018 08:13:39 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJLlYWtLq0INA6oaTaXs1pxkmPtcbKWazKxpDg7k9NSawxE01ozauKFuhJOlssI2pU9xCN2
X-Received: by 2002:ac8:164d:: with SMTP id x13-v6mr1880126qtk.378.1529075619648;
        Fri, 15 Jun 2018 08:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529075619; cv=none;
        d=google.com; s=arc-20160816;
        b=K+rAl7PHl+IpdV9sS8xH0LzEFCZqxBL7bmkHPPI78vj0pBF2+vvZdyrWW5CuInjwuX
         KzdYwIobgagJyd231l7yQpKQHIyDN7JYAZjOg0VbkQY/vYgqVd5XcDsMYasb2/Jkk7Zt
         ewmd/rrfbC/Qup3Wy+Dkx/lqNYJYgVE9x59mGtkwe8WGL0ZbHbUXeZz+RSC/Dh6Y927A
         asrBKmpM0NqFWv5pDQcpRiaF9dD/NAmLYtFVmQo+DC2/DYV8QEIzsvDsnfV45JPO5jGf
         6+nM5L8i+4q1KcQNNeF2orQuG0TizlViQtKXAPI5qaww6S+WRdX/V0Z4q0Mf4Pf8FTWI
         QvQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=kYb8ZxJI6cqFN7iis6FduLNW+sBsN8l8uUutGo4DdL0=;
        b=BcIm3TpPLmtBIbyE/fF1C16hthytN5UZqmlOuMLioQ/TrBeWCk0o98NQNmzXI+Xr82
         /vlGk0qr2dUwz1bpUMEikR6T0GibYnw0+hrAIM4w/75yKLcC3pNkHGpIosj6mJr2lgl6
         j6Wtam+OPDwc28rKzH1bIz4h3JnpWttuBAN6gplgPreyjeBvRTOVaIwhb+dlan1lln5Y
         rESxSsnDY0m9fQAWEakR1xCq2vE3bl6m0iXYriIk/X6wgy31DGzrvq+NJBw7s4KDNKt9
         R0trtXc5HgGPmgwGlqP/YEK6MuB2gztTBfmEfO3TaZ8ndSophKhjaCF/2mw+4M0wLrNh
         pGww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m6-v6si3624828qkb.400.2018.06.15.08.13.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 08:13:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47431 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTqPz-0001Xf-3t
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 11:13:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTpiq-0004mS-JE
	for qemu-devel@nongnu.org; Fri, 15 Jun 2018 10:29:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTpip-0001O9-Ng
	for qemu-devel@nongnu.org; Fri, 15 Jun 2018 10:29:04 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41294 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fTpii-0001Dj-SJ; Fri, 15 Jun 2018 10:28:56 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 69362406F619;
	Fri, 15 Jun 2018 14:28:56 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 960242026612;
	Fri, 15 Jun 2018 14:28:54 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 15 Jun 2018 16:28:28 +0200
Message-Id: <1529072910-16156-10-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1529072910-16156-1-git-send-email-eric.auger@redhat.com>
References: <1529072910-16156-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 15 Jun 2018 14:28:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 15 Jun 2018 14:28:56 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v2 09/11] hw/arm/virt: Add virt-3.0 machine type
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
Cc: wei@redhat.com, drjones@redhat.com, ard.biesheuvel@linaro.org,
	marc.zyngier@arm.com, christoffer.dall@arm.com,
	zhaoshenglong@huawei.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jjp6/MpJhetr

Add virt-3.0 machine type.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 45d5ed0..75a1a14 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1743,7 +1743,7 @@ type_init(machvirt_machine_init);
 #define VIRT_COMPAT_2_12 \
     HW_COMPAT_2_12
 
-static void virt_2_12_instance_init(Object *obj)
+static void virt_3_0_instance_init(Object *obj)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
@@ -1811,11 +1811,22 @@ static void virt_2_12_instance_init(Object *obj)
     vms->irqmap = a15irqmap;
 }
 
+static void virt_machine_3_0_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(3, 0)
+
+static void virt_2_12_instance_init(Object *obj)
+{
+    virt_3_0_instance_init(obj);
+}
+
 static void virt_machine_2_12_options(MachineClass *mc)
 {
+    virt_machine_3_0_options(mc);
     SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_12);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(2, 12)
+DEFINE_VIRT_MACHINE(2, 12)
 
 #define VIRT_COMPAT_2_11 \
     HW_COMPAT_2_11
-- 
2.5.5

