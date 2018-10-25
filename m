Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp717904wro;
        Thu, 25 Oct 2018 06:39:30 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fU4DLu0B/vbcoVuTt0Y0R9b6QNu/MiMLdKblDMvy4EopMdIClO71IRj8E3gJvq9/gpYAKj
X-Received: by 2002:a37:7745:: with SMTP id s66-v6mr1440566qkc.240.1540474770379;
        Thu, 25 Oct 2018 06:39:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540474770; cv=none;
        d=google.com; s=arc-20160816;
        b=066DVC0U9hWa22MFy0mJangR0Zxn9+IFPV0LSjtipRvNcLWR8P6Q7FsyDIfQrjxxUn
         i9Q92Gal9xCd+VO3fVigNOPqru1M6KGisWfryFB8LPDD9r99zqb0O7G73eo5o2TOi8x1
         SERbWxYUTEmOICMnMnjLLXeRZHwWcFJulbKJDGlNPdbPLAMYNTtRneCPJnzCIRKw2nZh
         M0PJPGVzik9ULGC8eCByb9ao28QarabJ84R8G/KhA8kPRwxw8K9WevG2CbGKTgMnvCaR
         OWu+MYSFM14Uzk7qIZEvN8XhMf+TbbxMRt1hEQ6xBo7qYSQzaAbkf2luM+iFx8yQY0Jw
         jo/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=bd3w/cucKR/qhFQlPAzecLCQv0iBTA0XcLaB5Pcyhlk=;
        b=RimA2j3plXswuMAqV3go9zXFF9C5JeNXGc/VB4p6WZjcUwg8ACUEJoQgzMNEhU1uDq
         xCIGIqrJKwvuQxWXw9/04l4QHGdZvecRyTy+hLJf/nK7lWth0Yqf4VbcVTf/IE/IBG+m
         2SnGOhIIZIfqdZyiJJU22iKLkDv2er4TVglLLBXFMmsaHobQK8LC/48L3cWfv0TehZag
         ij6QLd0BDpqN1EmfsSrkoXu8Wauxg4fGl5GfmTYZ0XNpiHULhpLN4ZXDWQRQbhfl4PD6
         rF7sMT09TRnNYa2zF+6AwSm2/K3Rmc9lJ10zZKe2bmwrVDXz1jzFoFNtvIeMOVe4fKE8
         EkoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l5-v6si2176647qtp.365.2018.10.25.06.39.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 06:39:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54509 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFfrF-0006rf-TM
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 09:39:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfmr-0002Dq-27
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:34:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfmp-0007sZ-8H
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:34:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46682)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFfmo-0007rc-Vr; Thu, 25 Oct 2018 09:34:55 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EB00C3084022;
	Thu, 25 Oct 2018 13:34:53 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 066C71974A;
	Thu, 25 Oct 2018 13:34:50 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:33 -0300
Message-Id: <20181025133301.16578-16-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Thu, 25 Oct 2018 13:34:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 15/43] hw/mips/malta: Remove unuseful code
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Eric Blake <eblake@redhat.com>, Rob Herring <robh@kernel.org>,
	Alexander Graf <agraf@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +/QLGKdlibP1

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20181002212522.23303-13-f4bug@amsat.org>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/mips/mips_malta.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 29b90bacf3..c1cf0fe12e 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -1422,23 +1422,10 @@ void mips_malta_init(MachineState *machine)
     pci_vga_init(pci_bus);
 }
=20
-static int mips_malta_sysbus_device_init(SysBusDevice *sysbusdev)
-{
-    return 0;
-}
-
-static void mips_malta_class_init(ObjectClass *klass, void *data)
-{
-    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
-
-    k->init =3D mips_malta_sysbus_device_init;
-}
-
 static const TypeInfo mips_malta_device =3D {
     .name          =3D TYPE_MIPS_MALTA,
     .parent        =3D TYPE_SYS_BUS_DEVICE,
     .instance_size =3D sizeof(MaltaState),
-    .class_init    =3D mips_malta_class_init,
 };
=20
 static void mips_malta_machine_init(MachineClass *mc)
--=20
2.18.0.rc1.1.g3f1ff2140

