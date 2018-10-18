Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2820865wrt;
        Thu, 18 Oct 2018 13:21:49 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62gDm6cMu+mThkSeq+5/3zLnwoHxMIZxHfKGXpaF+WIp+EvqBCzAKtenpVII6hSzyAXjTIi
X-Received: by 2002:ac8:435b:: with SMTP id a27-v6mr30086882qtn.295.1539894109431;
        Thu, 18 Oct 2018 13:21:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539894109; cv=none;
        d=google.com; s=arc-20160816;
        b=NLVXSzS9X7KsToffAz027iLm/4SFPAER5kcRvSvlPepKU3XUsMIg8L86ffweX3DzS8
         ld0m++938cHeKOoosOV7qzCyZ88GkoenDS1YQNOoekqF1mKONChVdltevlMJ/Uf3J2ch
         FngzkwxjT+dJmwWF84j2QUOE9iEd0xd6Kfrr0mtv0sFNzwRsbkErbWWIkdkHz6J8yJzS
         5zPnSBchNomlX7WsLDyqQgqYi42WfDSiJKgZFSyKvnjnX9RHtrXd2i41ogfpPhrS/e1Z
         IV+QYYxhdgMNuxLH4K2ahmOiiMqxiGl4y8aSqpuijWJQvsPdqzmYpanI/06zzAjxuPqD
         qAuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=bd3w/cucKR/qhFQlPAzecLCQv0iBTA0XcLaB5Pcyhlk=;
        b=ejf2Q0LKBxg3cW6rvXsxyPmpxrIG61k1q8aMxQaNQ5vqB3lm4Ui/nrqImoKvHx0+pd
         UEDyqOPbWASJSQjfJkdRfht4KK2ZiafODwP+sF1sp1nlUiVmd1jolvChnm2lp+OhX4eO
         YbP9CsYTh2gPCOFuxCyALV4AuMTFL936YTQqHEhmeBOsO3keie3XPMARi8LWatGnMTQW
         JdO3sxUKbYxDJyEl9K4J1rT05VdvfYl6BOXJaPWmy1l+TaiOQ0HcAPqdPJB8o3pBiGuo
         Gj/bnEHZxajZZLVvo5dXBURRJ1Zsok6o2UsPa7GHhGzJ112gXcsJz7DBLxxMmyoVtqij
         ApsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k19si351071qvg.219.2018.10.18.13.21.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:21:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44376 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEni-0005nO-Ai
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:21:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEYh-0000ET-QF
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:06:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEYh-00018r-2M
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:06:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37838)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEYg-000186-S0; Thu, 18 Oct 2018 16:06:14 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A6E3630020A6;
	Thu, 18 Oct 2018 20:06:13 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8EA7560150;
	Thu, 18 Oct 2018 20:06:00 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:03:53 -0300
Message-Id: <20181018200422.4358-17-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 18 Oct 2018 20:06:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 16/45] hw/mips/malta: Remove unuseful code
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
X-TUID: 49jfi+Okqymw

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

