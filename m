Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1045477wrt;
        Tue, 27 Nov 2018 01:45:14 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XiFzM1gMmXDvZGBqepnGzRXct/xXXr04kWjVYqoPEJt/kAYDCp7y2pfQ7DpoRFYk/fhVV3
X-Received: by 2002:a81:e903:: with SMTP id d3mr22578077ywm.53.1543311913994;
        Tue, 27 Nov 2018 01:45:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543311913; cv=none;
        d=google.com; s=arc-20160816;
        b=tSaPEEZIqQ9MbLRZh26QTZ3nGPjVVYaqghsTjBLRbgHYz8d0pKzYj6Vcv7d+h4EW68
         CPIkmaEB5dfzByekaMGd/TgBD+rCX1O2QfQcQ87wJyJZT0KMbdCZsI2GDvSFKWcGvkRe
         w63y2+rQqBU4O7M/DG8VIUmWFFvSmuiCAsQpDIj001W3WEmC/hdzLvitxGEN+seqVkCS
         BFkNMg1/rTP8J03oNCpZf5Xe+7RyBTJqNYVijAZPxgkZYz2vakmWYaIrGKIGLiYYVAOa
         ZgU1DowCVgzf989SX2Kpe/UQ9iQhhrS2tv0RDmCpmFUDsuKma3agK2GZ+j8XZnObZXPx
         IMmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=to0lLBaQMWzlVE0OTn0r23vj5BmKGN5S6J4WQXZz0bw=;
        b=J140ebYV4p9miPLBg32tPlX2HC/tVzc5JoOIWp7cSHyz1/YuhbVPMYGiGuf3nysex+
         L0u9ITDmB22SgRMUAyePNdzSR9B1dje37qMtalas5hF++Do0e3KH2P5rqYHL8G6IxwQy
         fdi5+2Uy2NEmmNS+m+Os/yGWuhN/yJfFp2Y3NUb0GVay3iYr/DSc66W2yc7ax5UkwjeB
         afPI75hBrDiy2xx+eBXZA2kwjr4v0/asjwUfWPJ57XJuNM/VOQgOKElJf5UuvVxRURr4
         YEmanA6gudYsAXPwS711bislIi/pT3eqXqXkcTHhcq/mweFs+952UjjPPnZlZo33dffa
         4ylA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h17-v6si2203905ybq.22.2018.11.27.01.45.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 01:45:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40941 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRZvd-0001CB-DQ
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 04:45:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48312)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gRZiw-0005JB-Dt
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 04:32:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gRZit-0006bK-9y
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 04:32:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50336)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1gRZit-0006bC-55; Tue, 27 Nov 2018 04:32:03 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7791B3138B83;
	Tue, 27 Nov 2018 09:32:02 +0000 (UTC)
Received: from localhost (ovpn-112-28.ams2.redhat.com [10.36.112.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B9385D6A9;
	Tue, 27 Nov 2018 09:32:01 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 27 Nov 2018 13:28:00 +0400
Message-Id: <20181127092801.21777-28-marcandre.lureau@redhat.com>
In-Reply-To: <20181127092801.21777-1-marcandre.lureau@redhat.com>
References: <20181127092801.21777-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Tue, 27 Nov 2018 09:32:02 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-3.2 v4 27/28] hw/arm/virt: add virt-3.2
 machine type
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
Cc: Peter Maydell <peter.maydell@linaro.org>, imammedo@redhat.com,
	"open list:Virt" <qemu-arm@nongnu.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K8alwKK1pcW8

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/arm/virt.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d106a8a8c7..22343db485 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1796,7 +1796,7 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
=20
-static void virt_3_1_instance_init(Object *obj)
+static void virt_3_2_instance_init(Object *obj)
 {
     VirtMachineState *vms =3D VIRT_MACHINE(obj);
     VirtMachineClass *vmc =3D VIRT_MACHINE_GET_CLASS(vms);
@@ -1866,10 +1866,26 @@ static void virt_3_1_instance_init(Object *obj)
     vms->irqmap =3D a15irqmap;
 }
=20
+static void virt_machine_3_2_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(3, 2)
+
+#define VIRT_COMPAT_3_1 \
+    HW_COMPAT_3_1
+
+static void virt_3_1_instance_init(Object *obj)
+{
+    virt_3_2_instance_init(obj);
+}
+
 static void virt_machine_3_1_options(MachineClass *mc)
 {
+    virt_machine_3_2_options(mc);
+    SET_COMPAT(mc, VIRT_COMPAT_3_1);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(3, 1)
+
+DEFINE_VIRT_MACHINE(3, 1)
=20
 #define VIRT_COMPAT_3_0 \
     HW_COMPAT_3_0
--=20
2.20.0.rc1

