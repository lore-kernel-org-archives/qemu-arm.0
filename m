Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8137210wrt;
        Tue, 4 Dec 2018 06:32:09 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XPqz+Y6aXo7WCV6V8vbmpVQry8C0cujwP4A+PZAE8YY9NzXKRs6P57R5VqApq9y9SGyBAL
X-Received: by 2002:ae9:c10c:: with SMTP id z12mr18549768qki.22.1543933929167;
        Tue, 04 Dec 2018 06:32:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543933929; cv=none;
        d=google.com; s=arc-20160816;
        b=chbR0DEIqVM6J6kxv8CKHJRnuxi2+jDJikYtmzXkIFiRiR5tYVXRcQivU9cd1Wht52
         fUX2cSjYYEze0rCSMLopB4A/JgnViDSJ6N7rkIRaxJED9hrD6CI84qBV65qeqtLfUcps
         2w7upEyhiOsx4l/zqQaMBDb95ev7cAzADntHtaxfyOomKlBRLazjM32+d+pG55/nq5iC
         vz0sOGARuC9rCOn1bC4dl4MLpXt9OjzMlxG59hkDeYm9iAJm9bkGa0nDsmqshuHmf/2j
         l76JraV+n9lzhbBGGiEm36OFF+HDj6EJFgVuZnAHqHsHLyS/FgGIX9ODR7siiKS16/OA
         cI/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=aehnNGypphWzlA8scarNFM0hYGhYlF+5o3Y4PVfwK9c=;
        b=YuP4si8gdclgFb0FFxN31vRwk2YsDr5W4ikM5kdGsXHFVo0PFLjF+aZo6qE6VNsZLM
         GpNvJKX6MrqR+2lzqWtjnlLcpRH8P7YiKV6ascBkS3S0k0gSV8t1sqyT5IiiAzQWWcsX
         RgCfSGsTIm0uTsgcp82zXtx+d66Q/RiceP0ZO6eAzV/QFPuygTAej0pWIvcsRA/sevy6
         OSNV/h5OGrvqmVSO/3dEWZVR5UC/ZXZmpWm7U1NcCAUhrw/kFe54qn+Kv2j0wCdVaFwC
         V2Aomd2wXo5dhALV8qyuWiyShyRTEywMe3bF99ZXHTkKBwy2TvsQqVUkhiNgRv6MWLVG
         CZ2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h13si1548723qtp.334.2018.12.04.06.32.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 06:32:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57115 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUBk8-0007Jc-45
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 09:32:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gUBbt-0006NH-Gz
	for qemu-devel@nongnu.org; Tue, 04 Dec 2018 09:23:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gUBbs-0000Aw-N6
	for qemu-devel@nongnu.org; Tue, 04 Dec 2018 09:23:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40462)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1gUBbo-0008Sq-9n; Tue, 04 Dec 2018 09:23:32 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E83DC0528BD;
	Tue,  4 Dec 2018 14:23:31 +0000 (UTC)
Received: from localhost (ovpn-112-31.ams2.redhat.com [10.36.112.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C68EA7F1BC;
	Tue,  4 Dec 2018 14:23:17 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  4 Dec 2018 18:20:22 +0400
Message-Id: <20181204142023.15982-19-marcandre.lureau@redhat.com>
In-Reply-To: <20181204142023.15982-1-marcandre.lureau@redhat.com>
References: <20181204142023.15982-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 04 Dec 2018 14:23:31 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-3.2 v5 18/19] hw/arm/virt: add virt-4.0
 machine type
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
Cc: Peter Maydell <peter.maydell@linaro.org>, imammedo@redhat.com,
	"open list:Virt" <qemu-arm@nongnu.org>, ehabkost@redhat.com,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0MZfTiwpZROw

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/arm/virt.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 530c8ca89d..433374f0d0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1797,7 +1797,7 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
=20
-static void virt_3_1_instance_init(Object *obj)
+static void virt_4_0_instance_init(Object *obj)
 {
     VirtMachineState *vms =3D VIRT_MACHINE(obj);
     VirtMachineClass *vmc =3D VIRT_MACHINE_GET_CLASS(vms);
@@ -1867,10 +1867,28 @@ static void virt_3_1_instance_init(Object *obj)
     vms->irqmap =3D a15irqmap;
 }
=20
+static void virt_machine_4_0_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(4, 0)
+
+static GlobalProperty virt_compat_3_1[] =3D {
+    HW_COMPAT_3_1
+};
+
+static void virt_3_1_instance_init(Object *obj)
+{
+    virt_4_0_instance_init(obj);
+}
+
 static void virt_machine_3_1_options(MachineClass *mc)
 {
+    virt_machine_4_0_options(mc);
+    compat_props_add(mc->compat_props,
+                     virt_compat_3_1, G_N_ELEMENTS(virt_compat_3_1));
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(3, 1)
+
+DEFINE_VIRT_MACHINE(3, 1)
=20
 static GlobalProperty virt_compat_3_0[] =3D {
     HW_COMPAT_3_0
--=20
2.20.0.rc1

