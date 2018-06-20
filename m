Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp753795wrq;
        Wed, 20 Jun 2018 06:13:15 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLQukv45/U0ATB1IvX2wy9m6ZhqRaXzdf3iod1pWulVtqHIrDu4OlCUhtYETB3zPpnnvIf+
X-Received: by 2002:a37:e20a:: with SMTP id g10-v6mr1077747qki.90.1529500395759;
        Wed, 20 Jun 2018 06:13:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529500395; cv=none;
        d=google.com; s=arc-20160816;
        b=kPCV8mKGM0mQGApsOxEXkHX7e5RsQ7Kh902WOPPla+0L6Iert/10IerZm09m1i3rUk
         YnSaiDtBDHymx4bfY0slBexbA2BU1Kuwe+3p2sWyS/OVawLVA36n5KcaB3QhgZ9s2la1
         X/NMJiLuUVGqXE7zBX6o3uPbcmqk1izMO5gkoKh5opIYAFj+RQxRGM0TGYf/TIK1vawP
         k4eVqDvJkK2BzmG0eu9RfZBI0ZDSvfOP67qCKHL6t23g+eQy+hwrXo1V0P5w05nUGvii
         NtTUvQqKPS0SYbQmmfT1iamMJ73EGiIcQMWwfmznOuYSmDzftwnTThB7JjKO8+SX/M2A
         RdHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=xQ13ZPJxivYM596y7vFkYtb2FGui1uBI7I43MERXhYs=;
        b=F9xMlaL3DJmx4FXy5cuJoJshTmRXOeUclKa0Glk4LzZnv4dplVAoifAXzXubfT1Amn
         UUplX9TElARxSIoNGtn2zZmSb5Pt7SQdvfDDcS9Zywe4r9nbmN0OG7UqGGuzOGUZ6OPT
         x1ds8wVieUbQbI3kD2RNTcYU43F3+F/NoR6uddiKg/b3x0fH+zt9goG0vHSrM7Ti1IIq
         L92L2Ij+MLCWE1h+5Y/Vm5uL7hRj0POlcTgIYDBTHbTIuEWv4sQiizn/e8PrG8lhbgDR
         Oz3GBPOyRyQB5NnQWomIKqPrh4kNwH8M3bPKUhwm6inLcnaJaLAE3Aage7Tuvg8ERV14
         Lkjg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w13-v6si216747qvn.284.2018.06.20.06.13.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 06:13:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49561 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVcvD-000077-5m
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 09:13:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVcq9-0004Xs-2C
	for qemu-devel@nongnu.org; Wed, 20 Jun 2018 09:08:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVcq4-0005jO-SY
	for qemu-devel@nongnu.org; Wed, 20 Jun 2018 09:08:01 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38946 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fVcq1-0005gx-2H; Wed, 20 Jun 2018 09:07:53 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A9B78401EF0D;
	Wed, 20 Jun 2018 13:07:52 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 02D7E2026D6B;
	Wed, 20 Jun 2018 13:07:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 20 Jun 2018 15:07:31 +0200
Message-Id: <1529500053-21704-5-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1529500053-21704-1-git-send-email-eric.auger@redhat.com>
References: <1529500053-21704-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Wed, 20 Jun 2018 13:07:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Wed, 20 Jun 2018 13:07:52 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [RFC 4/6] hw/arm/virt: Add virt-3.0 machine type
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
Cc: wei@redhat.com, drjones@redhat.com, suzuki.poulose@arm.com,
	dgilbert@redhat.com, agraf@suse.de, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q7vb431trnbD

Add virt-3.0 machine type.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

Due to the kernel dependency, virt 3.1 will be targetted instead.
---
 hw/arm/virt.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f0a4fa0..dd92ab9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1692,10 +1692,7 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
-#define VIRT_COMPAT_2_12 \
-    HW_COMPAT_2_12
-
-static void virt_2_12_instance_init(Object *obj)
+static void virt_3_0_instance_init(Object *obj)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
@@ -1763,11 +1760,25 @@ static void virt_2_12_instance_init(Object *obj)
     vms->irqmap = a15irqmap;
 }
 
+static void virt_machine_3_0_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(3, 0)
+
+#define VIRT_COMPAT_2_12 \
+    HW_COMPAT_2_12
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

