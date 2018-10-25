Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp712943wro;
        Thu, 25 Oct 2018 06:35:06 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dzUU/v0QXFufiyejTXh6CjxFki+yrfXKyvt7tL2SBtCVaH7jbRKLvC92TZIOscASBTvrBu
X-Received: by 2002:ac8:59:: with SMTP id i25-v6mr1557046qtg.246.1540474506627;
        Thu, 25 Oct 2018 06:35:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540474506; cv=none;
        d=google.com; s=arc-20160816;
        b=FJEzzC1uaeREd6kpStStdcEzzr47uICRV2PDeowLhgzDkMLDJOTxsVYqQO07gtj1fD
         abAdNW/VIgPr0+aTbMjml1JBtY5ZcGqe1YTqisw9WYHWFfgKdesBI/NLtpM2Fh+QZabG
         MDCH3paYgy3yzRwJmYb1uRJMrW4NYyW8T5BWfaHXiA69dGkpUt72C2enUlt0e/9JVJfe
         hdyVXweILC7haGFx1JbgWoRKPvZBSFpVBNAzJYoYoWBwo+sdHMaYhUw10Kq2JMIbpalk
         7lmEvgIzCyYN5yYPAWCJpK+9SgQ4msqKyjjQCK8Eld71mT6ArCu+jtpg/XlXOAc0GXnW
         N0Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=0ZGSgo1msQVlu7xLted3UD9Xk8rtZ+wvSsWV52+jVgM=;
        b=ErldEVs4pBNcpwExn51EdOUPX+eDXElf9recrNxmzRyKsSXuaDIPIO+AU0X/j9TCiS
         qlWIsgQlQ/HkvbCbinAskVWireFalpr8gDw1Pup7yBMnFzLkr1L/7SneMQN+d7bE81zW
         Z32K6jHdeRuG/MyYUdhJ4XZQcZRAwgT/Z3Dg6D4mTm4vAChGQc4OJC/wgSFVdJi1hqOK
         zZjN7UWOHuFQ8LItu/Er/vQRGu65KCn49QcxkQ/052/JmVmehrIX/lhoSGYiumY4yWmR
         WBBXL/qGZwY83yIrC/iQ16VBu/jziEU1quLo1Klknj9YptWc7jaPsAucFbySCt/X1Lxb
         uSRw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c7-v6si700083qtm.71.2018.10.25.06.35.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 06:35:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54465 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFfn0-00026x-27
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 09:35:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfme-000259-OV
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:34:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfmX-0007jJ-U8
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:34:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55700)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFfmP-0007dh-BP; Thu, 25 Oct 2018 09:34:30 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 525EE37E8F;
	Thu, 25 Oct 2018 13:34:24 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 58ACB5D763;
	Thu, 25 Oct 2018 13:34:17 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:28 -0300
Message-Id: <20181025133301.16578-11-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 25 Oct 2018 13:34:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 10/43] hw/mips/gt64xxx_pci: Convert
 gt64120_reset() function into Device reset method
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
X-TUID: 9ggHGEB8glto

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Convert the gt64120_reset() function into a proper Device reset method.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20181002212522.23303-8-f4bug@amsat.org>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/mips/gt64xxx_pci.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 24ad0ad024..dcd1a66329 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -992,9 +992,9 @@ static void gt64120_pci_set_irq(void *opaque, int irq=
_num, int level)
 }
=20
=20
-static void gt64120_reset(void *opaque)
+static void gt64120_reset(DeviceState *dev)
 {
-    GT64120State *s =3D opaque;
+    GT64120State *s =3D GT64120_PCI_HOST_BRIDGE(dev);
=20
     /* FIXME: Malta specific hw assumptions ahead */
=20
@@ -1184,16 +1184,6 @@ PCIBus *gt64120_register(qemu_irq *pic)
     return phb->bus;
 }
=20
-static int gt64120_init(SysBusDevice *dev)
-{
-    GT64120State *s;
-
-    s =3D GT64120_PCI_HOST_BRIDGE(dev);
-
-    qemu_register_reset(gt64120_reset, s);
-    return 0;
-}
-
 static void gt64120_pci_realize(PCIDevice *d, Error **errp)
 {
     /* FIXME: Malta specific hw assumptions ahead */
@@ -1241,9 +1231,8 @@ static const TypeInfo gt64120_pci_info =3D {
 static void gt64120_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
-    SysBusDeviceClass *sdc =3D SYS_BUS_DEVICE_CLASS(klass);
=20
-    sdc->init =3D gt64120_init;
+    dc->reset =3D gt64120_reset;
     dc->vmsd =3D &vmstate_gt64120;
 }
=20
--=20
2.18.0.rc1.1.g3f1ff2140

