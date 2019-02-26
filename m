Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp11100394wrx;
        Tue, 26 Feb 2019 06:00:58 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaDAXrlIClhWeh5gI/S46DNrHmi8/lRXGg4Ly/ntgn8db2Di9fEhxuIBPNY1RCUm042+K0x
X-Received: by 2002:a0d:eb94:: with SMTP id u142mr18282472ywe.356.1551189658457;
        Tue, 26 Feb 2019 06:00:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551189658; cv=none;
        d=google.com; s=arc-20160816;
        b=aNnf4ta5PYJhHE0ts5e1llMBA+w2ITnr12a7dSCBVEmwJUNrrnsC7Ps6QUyVRnqJYC
         G5GbeQ3DE+KzLdzrO+oiIdqZAJZCZg0yKwZasbCHZuPkFmDO71olkx7587vxWdxPAhe4
         6YSFkQzFQn0uR13shaSrRB9nxUCSNrXoNCrZdi0v97ok9T06bGAwO/nGf8QiJ1x5oegt
         gR4ThqR9FUbLdJ3Q3Z81S15Lycb+M2INYM5oa+Rdv5u7ZZgPa6V15pQ9dkx8P7bOZ+ML
         ZD76mpRTGVqMrb2crC00F/zUz7F6mfTELlMvgJ37yWIPuCiG7CMDknokhD2J/iAHzw7Q
         Derw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=zi5zuGtoPBehQITmAxzVmadUyb/C6Q06StPoqvyhvrk=;
        b=lda2PmX6+QVJHea/lZfVwKZiscvYwwyi25WtWeBUdMnPlbTIeTHDF/AyuKbnfjR30T
         b3IMpNEQljNzrJVkA0IRjAU8lec79yu4w9+gt7fPjLga53zNDNqEbRpQRiD72E4tQTbm
         umRI4NafYetY1WqJLFF1qApqgjFgdyEF6M7QWfjqwbRfJaYwUCFdqiqbph11xGcDEBLY
         bOgmNaiRlrHJmQAz/TmcIFkbE2fxTmJ7R+aSwJCLZilQ3eEJM8GPUnPcfSB4zjRQw17Z
         FNzgaL3Ci8P1Bl3yto4E5kOivfrxq37UbLiXaT7AXYuNacoTS9xlulpW7enH5na83src
         SoFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d126si6387876ywc.85.2019.02.26.06.00.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 06:00:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55788 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gydI1-0008AY-Su
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 09:00:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47820)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyd9R-0000z5-3o
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 08:52:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyd9Q-0007on-AY
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 08:52:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47088)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gyd9Q-0007ik-4P; Tue, 26 Feb 2019 08:52:04 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 084B110DE2;
	Tue, 26 Feb 2019 13:51:56 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 459275E1B0;
	Tue, 26 Feb 2019 13:51:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue, 26 Feb 2019 14:50:14 +0100
Message-Id: <20190226135014.31854-19-eric.auger@redhat.com>
In-Reply-To: <20190226135014.31854-1-eric.auger@redhat.com>
References: <20190226135014.31854-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 26 Feb 2019 13:51:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v8 18/18] hw/arm/virt: Allow nvdimm instantiation
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
X-TUID: NY657k1JHCEZ

If NVDIMM option is enabled at machine level, let's allow
NVDIMM plug.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0a04f5ca88..932361fc3f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1823,13 +1823,14 @@ static void virt_memory_pre_plug(HotplugHandler *=
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

