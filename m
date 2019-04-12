Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp692872wrx;
        Fri, 12 Apr 2019 08:26:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxo3tAemlvPzcmInY0oyvYejPFHzo320vGrT8S6K/Yv2OHUsIU9atYYfpjfGlvbZwgDfue/
X-Received: by 2002:a1c:80cd:: with SMTP id b196mr11316123wmd.84.1555082799210;
        Fri, 12 Apr 2019 08:26:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555082799; cv=none;
        d=google.com; s=arc-20160816;
        b=tvNUYAtPcbw5AB/T54HgemTsxO912yYehfNC4BWGxDJfZw1y+TlhRnqM5PhpkFqvXI
         VW12TG14D8IS+HbvmgA60Xul8ruYD9dKVq0pXBl/p9KRw+fB0sAGFFFobIVqG0/gcBb0
         UnzQbDV40MjTu+X5KLCAAdM5MNKUgW+Pja5WCrmnWRqWH8tPJEYftnjD5hRhsvxUwUZv
         cmDYP7IvreVOCosxOKqXR6LC1s5AHbkSmI/EW9+VMOmuuf9UkhGnaO2kPYmA+Hs/o81J
         hvl0WcoEEWv/0SdKmMUw44VdlDxFeES5ZTAIHL6moLNdGUwrrnTvE67cFETGvLA4UMaR
         1HqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=KFcawnq+vktkYXDlNtwUImESxthMUxE9q7Z5TPKEBc0=;
        b=eZqu0qrKr/0KIUlZawK/4jKZewYcU6ZThIMNWcf38zgYAN+r1tczvcskUW42y15sJI
         TvKi7DedKbjuIXD80fg79Xx6AcbbOi8E5t9E988rHU+FwB+MMGds3xk9G+o5+q5kpQGR
         tIBFWFj2w2B9Aavu+YZZNp/piWt342q0Nd144QpFhqCur1OpPuFQr9m+PSe4mT9bYdF1
         1mdyR2quqccDRjuPvmP3O02sjBDYGT24DhxmfMBLnt/YfTayaAKmOJaHCXjdJTbLVSHr
         IJpb9bgFUEUiqhdqoIz7OWsoi8j9klLXdOmLtE01mRBo6PjDziuN1GbRxznwoT8lKkwD
         QvUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6si5263658wmo.109.2019.04.12.08.26.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 08:26:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38671 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEy4c-0003TR-BO
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 11:26:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33648)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hEy4V-0003TJ-J8
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 11:26:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hEy4U-0004OY-J6
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 11:26:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38656)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hEy4U-0004Ny-AD; Fri, 12 Apr 2019 11:26:30 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 87AD020269;
	Fri, 12 Apr 2019 15:26:29 +0000 (UTC)
Received: from thuth.com (ovpn-116-133.ams2.redhat.com [10.36.116.133])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DEA431001E7A;
	Fri, 12 Apr 2019 15:26:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Apr 2019 17:26:19 +0200
Message-Id: <20190412152619.23542-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 12 Apr 2019 15:26:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-4.1] hw/arm/nseries: Deprecate the n800 and
 n810 machines
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
Cc: libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Oikeo3Xshs0U

These machines depend on the deprecated bluetooth subsystem. In case we
finally decide to remove the bluetooth subsystem, we likely need to
remove the n800 and n810 machines, too, so mark them now as deprecated.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/nseries.c     | 3 +++
 qemu-deprecated.texi | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 906b7ca22d..66e50b850c 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -1309,6 +1309,9 @@ static void n8x0_init(MachineState *machine,
     struct n800_s *s =3D (struct n800_s *) g_malloc0(sizeof(*s));
     int sdram_size =3D binfo->ram_size;
=20
+    warn_report("The n800 and n810 machines are deprecated. Please use a=
 "
+                "different Arm machine instead.");
+
     s->mpu =3D omap2420_mpu_init(sysmem, sdram_size, machine->cpu_type);
=20
     /* Setup peripherals
diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index 2219386769..4de7452fac 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -145,6 +145,12 @@ This machine type uses an unmaintained firmware, bro=
ken in lots of ways,
 and unable to start post-2004 operating systems. 40p machine type should=
 be
 used instead.
=20
+@subsection n800 and n810 (Arm) (since 4.1)
+
+These machines depend on the deprecated bluetooth subsystem. When the
+bluetooth subsystem will be removed, the n800 and n810 machines will be
+deleted, too. If possible, use a different Arm board instead.
+
 @section Device options
=20
 @subsection Block device options
--=20
2.21.0

